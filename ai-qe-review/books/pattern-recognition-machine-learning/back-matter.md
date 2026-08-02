# 后置内容

> [!cite] 此文件保留最后一个自动识别章节之后的附录、书目、索引或未自动归类内容。来源：[reading.md](../../../transcripts/mineru/pattern-recognition-machine-learning/reading.md)，源行 16960–23302。


![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/2fba5c0fe023aa867a1c377073ccfe6d29ed9dfa85e43feb49a69cb53d15e00a.jpg)

In earlier chapters, we have explored a range of different models for solving classification and regression problems. It is often found that improved performance can be obtained by combining multiple models together in some way, instead of just using a single model in isolation. For instance, we might train L different models and then make predictions using the average of the predictions made by each model. Such combinations of models are sometimes called committees. In Section 14.2, we discuss ways to apply the committee concept in practice, and we also give some insight into why it can sometimes be an effective procedure.

One important variant of the committee method, known as boosting, involves training multiple models in sequence in which the error function used to train a particular model depends on the performance of the previous models. This can produce substantial improvements in performance compared to the use of a single model and is discussed in Section 14.3.

Instead of averaging the predictions of a set of models, an alternative form of model combination is to select one of the models to make the prediction, in which the choice of model is a function of the input variables. Thus different models become responsible for making predictions in different regions of input space. One widely used framework of this kind is known as a decision tree in which the selection process can be described as a sequence of binary selections corresponding to the traversal of a tree structure and is discussed in Section 14.4. In this case, the individual models are generally chosen to be very simple, and the overall flexibility of the model arises from the input-dependent selection process. Decision trees can be applied to both classification and regression problems.

One limitation of decision trees is that the division of input space is based on hard splits in which only one model is responsible for making predictions for any given value of the input variables. The decision process can be softened by moving to a probabilistic framework for combining models, as discussed in Section 14.5. For example, if we have a set of K models for a conditional distribution $p(t | \mathbf{x}, k)$ where is the input variable, t is the target variable, and $k = 1, \ldots, K$ indexes the model, then we can form a probabilistic mixture of the form

$$
p(t | \mathbf{x}) = \sum_{k = 1}^{K} \pi_{k}(\mathbf{x}) p(t | \mathbf{x}, k)\tag{14.1}
$$

in which $\pi_{k}(\mathbf{x}) = p(k | \mathbf{x})$ represent the input-dependent mixing coefficients. Such <sup>x x</sup>models can be viewed as mixture distributions in which the component densities, as well as the mixing coefficients, are conditioned on the input variables and are known as mixtures of experts. They are closely related to the mixture density network model discussed in Section 5.6.

## 14.1. Bayesian Model Averaging

It is important to distinguish between model combination methods and Bayesian model averaging, as the two are often confused. To understand the difference, consider the example of density estimation using a mixture of Gaussians in which several Gaussian components are combined probabilistically. The model contains a binary latent variable that indicates which component of the mixture is responsible for generating the corresponding data point. Thus the model is specified in terms of a joint distribution

$$
p(\mathbf{x}, \mathbf{z})\tag{14.2}
$$

and the corresponding density over the observed variable is obtained by marginalizing over the latent variable

$$
p(\mathbf{x}) = \sum_{\mathbf{z}} p(\mathbf{x}, \mathbf{z}).\tag{14.3}
$$

In the case of our Gaussian mixture example, this leads to a distribution of the form

$$
p(\mathbf{x}) = \sum_{k = 1}^{K} \pi_{k} \mathcal{N}(\mathbf{x} | \boldsymbol{\mu}_{k}, \boldsymbol{\Sigma}_{k})\tag{14.4}
$$

with the usual interpretation of the symbols. This is an example of model combination. For independent, identically distributed data, we can use (14.3) to write the marginal probability of a data set $\mathbf{X} = \{\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}\}$ in the form

$$
p(\mathbf{X}) = \prod_{n = 1}^{N} p(\mathbf{x}_{n}) = \prod_{n = 1}^{N} \left[\sum_{\mathbf{z}_{n}} p(\mathbf{x}_{n}, \mathbf{z}_{n}) \right].\tag{14.5}
$$

Thus we see that each observed data point ${\bf x}_{n}$ has a corresponding latent variable $\mathbf{z}_{n}$

<sup>x</sup>Now suppose we have several different models indexed by $h = 1, \ldots, H$ <sup>z</sup>with prior probabilities $p(h)$ . For instance one model might be a mixture of Gaussians and another model might be a mixture of Cauchy distributions. The marginal distribution over the data set is given by

$$
p(\mathbf{X}) = \sum_{h = 1}^{H} p(\mathbf{X} | h) p(h).\tag{14.6}
$$

This is an example of Bayesian model averaging. The interpretation of this summation over h is that just one model is responsible for generating the whole data set, and the probability distribution over h simply reflects our uncertainty as to which model that is. As the size of the data set increases, this uncertainty reduces, and the posterior probabilities $p(h | \mathbf{X})$ become increasingly focussed on just one of the models.

This highlights the key difference between Bayesian model averaging and model combination, because in Bayesian model averaging the whole data set is generated by a single model. By contrast, when we combine multiple models, as in (14.5), we see that different data points within the data set can potentially be generated from different values of the latent variable and hence by different components.

<sup>z</sup>Although we have considered the marginal probability $p(\mathbf{X})$ , the same considerations apply for the predictive density $p(\mathbf{x} | \mathbf{X})$ <sup>X</sup>or for conditional distributions such as $p(\mathbf{t} | \mathbf{x}, \mathbf{X}, \mathbf{T})$ .

## 14.2. Committees

The simplest way to construct a committee is to average the predictions of a set of individual models. Such a procedure can be motivated from a frequentist perspective by considering the trade-off between bias and variance, which decomposes the error due to a model into the bias component that arises from differences between the model and the true function to be predicted, and the variance component that represents the sensitivity of the model to the individual data points. Recall from Figure 3.5 that when we trained multiple polynomials using the sinusoidal data, and then averaged the resulting functions, the contribution arising from the variance term tended to cancel, leading to improved predictions. When we averaged a set of low-bias models (corresponding to higher order polynomials), we obtained accurate predictions for the underlying sinusoidal function from which the data were generated.

In practice, of course, we have only a single data set, and so we have to find a way to introduce variability between the different models within the committee. One approach is to use bootstrap data sets, discussed in Section 1.2.3. Consider a regression problem in which we are trying to predict the value of a single continuous variable, and suppose we generate M bootstrap data sets and then use each to train a separate copy $y_{m}(\mathbf x)$ of a predictive model where $m = 1, \ldots, M$ . The committee prediction is given by

$$
y_{\mathrm{COM}}(\mathbf{x}) = \frac{1}{M} \sum_{m = 1}^{M} y_{m}(\mathbf{x}).\tag{14.7}
$$

This procedure is known as bootstrap aggregation or bagging (Breiman, 1996).

Suppose the true regression function that we are trying to predict is given by $h(\mathbf{x})$ , so that the output of each of the models can be written as the true value plus an error in the form

$$
y_{m}(\mathbf{x}) = h(\mathbf{x}) + \epsilon_{m}(\mathbf{x}).\tag{14.8}
$$

The average sum-of-squares error then takes the form

$$
\mathbb{E}_{\mathbf{x}} \left[\left\{y_{m}(\mathbf{x}) - h(\mathbf{x}) \right\}^{2} \right] = \mathbb{E}_{\mathbf{x}} \left[\epsilon_{m}(\mathbf{x})^{2} \right]\tag{14.9}
$$

where $\mathbb{E}_{\mathbf{x}}[\cdot]$ denotes a frequentist expectation with respect to the distribution of the input vector . The average error made by the models acting individually is therefore

$$
E_{\mathrm{AV}} = \frac{1}{M} \sum_{m = 1}^{M} \mathbb{E}_{\mathbf{x}} \left[\epsilon_{m}(\mathbf{x})^{2} \right].\tag{14.10}
$$

Similarly, the expected error from the committee (14.7) is given by

$$
\begin{array}{rcl} E_{\mathrm{COM}} & = & \mathbb{E}_{\mathbf{x}} \left[\left\{\frac{1}{M} \sum_{m = 1}^{M} y_{m}(\mathbf{x}) - h(\mathbf{x}) \right\}^{2} \right] \\ & = & \mathbb{E}_{\mathbf{x}} \left[\left\{\frac{1}{M} \sum_{m = 1}^{M} \epsilon_{m}(\mathbf{x}) \right\}^{2} \right] \end{array}\tag{14.11}
$$

If we assume that the errors have zero mean and are uncorrelated, so that

$$
\mathbb{E}_{\mathbf{x}} \left[\epsilon_{m}(\mathbf{x}) \right] = 0\tag{14.12}
$$

$$
\mathbb{E}_{\mathbf{x}} \left[\epsilon_{m}(\mathbf{x}) \epsilon_{l}(\mathbf{x}) \right] = 0, \qquad m \neq l\tag{14.13}
$$

then we obtain

$$
E_{\mathrm{COM}} = \frac{1}{M} E_{\mathrm{AV}}.\tag{14.14}
$$

This apparently dramatic result suggests that the average error of a model can be reduced by a factor of M simply by averaging M versions of the model. Unfortunately, it depends on the key assumption that the errors due to the individual models are uncorrelated. In practice, the errors are typically highly correlated, and the reduction in overall error is generally small. It can, however, be shown that the expected committee error will not exceed the expected error of the constituent models, so that $E_{\mathrm{COM}} \leqslant E_{\mathrm{AV}}$ . In order to achieve more significant improvements, we turn to a more sophisticated technique for building committees, known as boosting.

## 14.3. Boosting

Boosting is a powerful technique for combining multiple ‘base’ classifiers to produce a form of committee whose performance can be significantly better than that of any of the base classifiers. Here we describe the most widely used form of boosting algorithm called AdaBoost, short for ‘adaptive boosting’, developed by Freund and Schapire (1996). Boosting can give good results even if the base classifiers have a performance that is only slightly better than random, and hence sometimes the base classifiers are known as weak learners. Originally designed for solving classification problems, boosting can also be extended to regression (Friedman, 2001).

The principal difference between boosting and the committee methods such as bagging discussed above, is that the base classifiers are trained in sequence, and each base classifier is trained using a weighted form of the data set in which the weighting coefficient associated with each data point depends on the performance of the previous classifiers. In particular, points that are misclassified by one of the base classifiers are given greater weight when used to train the next classifier in the sequence. Once all the classifiers have been trained, their predictions are then combined through a weighted majority voting scheme, as illustrated schematically in Figure 14.1.

Consider a two-class classification problem, in which the training data comprises input vectors $\mathbf{x}_{1}, \ldots.$ , <sub>N</sub> along with corresponding binary target variables $t_{1}, \ldots, t_{N}$ where $t_{n} \in \{- 1, 1\}$ <sup>x</sup>. Each data point is given an associated weighting parameter $w_{n}$ , which is initially set $1 / N$ for all data points. We shall suppose that we have a procedure available for training a base classifier using weighted data to give a function $y(\mathbf{x}) \in \{- 1, 1\}$ . At each stage of the algorithm, AdaBoost trains a new classifier using a data set in which the weighting coefficients are adjusted according to the performance of the previously trained classifier so as to give greater weight to the misclassified data points. Finally, when the desired number of base classifiers have been trained, they are combined to form a committee using coefficients that give different weight to different base classifiers. The precise form of the AdaBoost algorithm is given below.

Schematic illustration of the boosting framework. Each base classifier $y_{m}(\mathbf{x})$ is trained on a weighted form of the training set (blue arrows) in which the weights $w_{n}^{(m)}$ depend on the performance of the previous base classifier $y_{m - 1}(\mathbf{x})$ (green arrows). Once all base classifiers have been trained, they are combined to give the final classifier $Y_{M}(\mathbf{x})$ (red arrows).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/82a172a69b77c3e305893d7e07fec37ed3cad1a5ef37b2a162654dbae264e14f.jpg)

## AdaBoost

1. Initialize the data weighting coefficients $\{w_{n}\}$ by setting $w_{n}^{(1)} = 1 / N$ for $n = 1, \ldots, N$

2. For $m = 1, \ldots, M \colon$

(a) Fit a classifier $y_{m}(\mathbf x)$ to the training data by minimizing the weighted error function

$$
J_{m} = \sum_{n = 1}^{N} w_{n}^{(m)} I(y_{m}(\mathbf{x}_{n}) \neq t_{n})\tag{14.15}
$$

where $I(y_{m}(\mathbf{x}_{n}) \neq t_{n})$ is the indicator function and equals 1 when $y_{m}(\mathbf x_{n}) \neq t_{n}$ <sup>x</sup>and 0 otherwise.

(b) Evaluate the quantities

$$
\epsilon_{m} = \frac{\sum_{n = 1}^{N} w_{n}^{(m)} I(y_{m}(\mathbf{x}_{n}) \neq t_{n})}{\sum_{n = 1}^{N} w_{n}^{(m)}}\tag{14.16}
$$

and then use these to evaluate

$$
\alpha_{m} = \ln \left\{\frac{1 - \epsilon_{m}}{\epsilon_{m}} \right\}.\tag{14.17}
$$

(c) Update the data weighting coefficients

$$
w_{n}^{(m + 1)} = w_{n}^{(m)} \exp \left\{\alpha_{m} I(y_{m}(\mathbf{x}_{n}) \neq t_{n}) \right\}\tag{14.18}
$$

3. Make predictions using the final model, which is given by

$$
Y_{M}(\mathbf{x}) = \operatorname{sign} \left(\sum_{m = 1}^{M} \alpha_{m} y_{m}(\mathbf{x})\right).\tag{14.19}
$$

We see that the first base classifier $y_{1}(\mathbf x)$ is trained using weighting coefficients $w_{n}^{(1)}$ that are all equal, which therefore corresponds to the usual procedure for training a single classifier. From (14.18), we see that in subsequent iterations the weighting coefficients $w_{n}^{(m)}$ are increased for data points that are misclassified and decreased for data points that are correctly classified. Successive classifiers are therefore forced to place greater emphasis on points that have been misclassified by previous classifiers, and data points that continue to be misclassified by successive classifiers receive ever greater weight. The quantities $\epsilon_{m}$ represent weighted measures of the error rates of each of the base classifiers on the data set. We therefore see that the weighting coefficients $\alpha_{m}$ defined by (14.17) give greater weight to the more accurate classifiers when computing the overall output given by (14.19).

The AdaBoost algorithm is illustrated in Figure 14.2, using a subset of 30 data points taken from the toy classification data set shown in Figure A.7. Here each base learners consists of a threshold on one of the input variables. This simple classifier corresponds to a form of decision tree known as a ‘decision stumps’, i.e., a decision tree with a single node. Thus each base learner classifies an input according to whether one of the input features exceeds some threshold and therefore simply partitions the space into two regions separated by a linear decision surface that is parallel to one of the axes.

## 14.3.1 Minimizing exponential error

Boosting was originally motivated using statistical learning theory, leading to upper bounds on the generalization error. However, these bounds turn out to be too loose to have practical value, and the actual performance of boosting is much better than the bounds alone would suggest. Friedman et al. (2000) gave a different and very simple interpretation of boosting in terms of the sequential minimization of an exponential error function.

Consider the exponential error function defined by

$$
E = \sum_{n = 1}^{N} \exp \left\{- t_{n} f_{m}(\mathbf{x}_{n}) \right\}\tag{14.20}
$$

where $f_{m}(\mathbf{x})$ is a classifier defined in terms of a linear combination of base classifiers $y_{l}(\mathbf x)$ <sup>x</sup>of the form

$$
f_{m}(\mathbf{x}) = \frac{1}{2} \sum_{l = 1}^{m} \alpha_{l} y_{l}(\mathbf{x})\tag{14.21}
$$

and $t_{n} \in \{- 1, 1\}$ are the training set target values. Our goal is to minimize E with respect to both the weighting coefficients $\alpha_{l}$ and the parameters of the base classifiers $y_{l}(\mathbf x)$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/bdbeb032c38d29cce60b80be7e25c20c34439b6e584589ab7ccf4a15efc0789e.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/ee7340eb0ca7264eb3bb0ce3c59eec6696cd107d54a31216de18de432be0a98e.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/7506c189fdea20ad51c4429f58236e42e69f0702f0d1e7e4c098d8061b3cd154.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/bb501b5480d6c18e45adee06d9249dbfcc5bb7b59b4c94c6733e9a8c11356556.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/e34893b367f43a18d1285cc993a7bddc40d72ce5572eaf57ff4e38aa11343e1c.jpg)

![Figure 14.2](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/7f62768f11dd5d2bb8a8f2f619c13351582299264e6b59e178560b6cadff034c.jpg)  
Figure 14.2 Illustration of boosting in which the base learners consist of simple thresholds applied to one or other of the axes. Each figure shows the number m of base learners trained so far, along with the decision boundary of the most recent base learner (dashed black line) and the combined decision boundary of the ensemble (solid green line). Each data point is depicted by a circle whose radius indicates the weight assigned to that data point when training the most recently added base learner. Thus, for instance, we see that points that are misclassified by the $m = 1$ base learner are given greater weight when training the $m = 2$ base learner.

Instead of doing a global error function minimization, however, we shall suppose that the base classifiers $y_{1}(\mathbf x), \dots, y_{m - 1}(\mathbf x)$ are fixed, as are their coefficients $\alpha_{1}, \ldots, \alpha_{m - 1}$ <sup>x x</sup>, and so we are minimizing only with respect to $\alpha_{m}$ and $y_{m}(\mathbf{x})$ . Separating off the contribution from base classifier $y_{m}(\mathbf x)$ <sup>x</sup>, we can then write the error function in the form

$$
\begin{array}{rcl}{E} &{=} &{\sum_{n = 1}^{N} \exp \left\{- t_{n} f_{m - 1}(\mathbf{x}_{n}) - \frac{1}{2} t_{n} \alpha_{m} y_{m}(\mathbf{x}_{n}) \right\}} \\ &{=} &{\sum_{n = 1}^{N} w_{n}^{(m)} \exp \left\{- \frac{1}{2} t_{n} \alpha_{m} y_{m}(\mathbf{x}_{n}) \right\}} \end{array}\tag{14.22}
$$

where the coefficients $w_{n}^{(m)} = \exp \{- t_{n} f_{m - 1}({\bf x}_{n})\}$ can be viewed as constants because we are optimizing only $\alpha_{m}$ and $y_{m}(\mathbf x)$ <sup>x</sup>. If we denote by $\mathcal{T}_{m}$ the set of data points that are correctly classified by $y_{m}(\mathbf{x})$ , and if we denote the remaining misclassified points by $\mathcal{M}_{m}$ , then we can in turn rewrite the error function in the

form

$$
\begin{array}{rcl} E & = & e^{- \alpha_{m} / 2} \sum_{n \in \mathcal{T}_{m}} w_{n}^{(m)} + e^{\alpha_{m} / 2} \sum_{n \in \mathcal{M}_{m}} w_{n}^{(m)} \\ & = &(e^{\alpha_{m} / 2} - e^{- \alpha_{m} / 2}) \sum_{n = 1}^{N} w_{n}^{(m)} I(y_{m}(\mathbf{x}_{n}) \neq t_{n}) + e^{- \alpha_{m} / 2} \sum_{n = 1}^{N} w_{n}^{(m)}.\end{array}\tag{14.23}
$$

When we minimize this with respect to $y_{m}(\mathbf{x})$ , we see that the second term is constant, and so this is equivalent to minimizing (14.15) because the overall multiplicative factor in front of the summation does not affect the location of the minimum. Similarly, minimizing with respect to $\alpha_{m}$ , we obtain (14.17) in which $\epsilon_{m}$ is defined by (14.16).

From (14.22) we see that, having found $\alpha_{m}$ and $y_{m}(\mathbf x)$ , the weights on the data points are updated using

$$
w_{n}^{(m + 1)} = w_{n}^{(m)} \exp \left\{- \frac{1}{2} t_{n} \alpha_{m} y_{m}(\mathbf{x}_{n}) \right\}.\tag{14.24}
$$

Making use of the fact that

$$
t_{n} y_{m}(\mathbf{x}_{n}) = 1 - 2I(y_{m}(\mathbf{x}_{n}) \neq t_{n})\tag{14.25}
$$

we see that the weights $w_{n}^{(m)}$ are updated at the next iteration using

$$
w_{n}^{(m + 1)} = w_{n}^{(m)} \exp(- \alpha_{m} / 2) \exp \left\{\alpha_{m} I(y_{m}(\mathbf{x}_{n}) \neq t_{n}) \right\}.\tag{14.26}
$$

Because the term $\exp(- \alpha_{m} / 2)$ is independent of $n_{\colon}$ we see that it weights all data points by the same factor and so can be discarded. Thus we obtain (14.18).

Finally, once all the base classifiers are trained, new data points are classified by evaluating the sign of the combined function defined according to (14.21). Because the factor of $1 / 2$ does not affect the sign it can be omitted, giving (14.19).

## 14.3.2 Error functions for boosting

The exponential error function that is minimized by the AdaBoost algorithm differs from those considered in previous chapters. To gain some insight into the nature of the exponential error function, we first consider the expected error given by

$$
\mathbb{E}_{\mathbf{x}, t} \left[\exp \{- ty(\mathbf{x})\} \right] = \sum_{t} \int \exp \{- ty(\mathbf{x})\} p(t | \mathbf{x}) p(\mathbf{x}) d \mathbf{x}.\tag{14.27}
$$

If we perform a variational minimization with respect to all possible functions $y(\mathbf x)$ we obtain

$$
y(\mathbf{x}) = \frac{1}{2} \ln \left\{\frac{p(t = 1 | \mathbf{x})}{p(t = - 1 | \mathbf{x})} \right\}\tag{14.28}
$$

Plot of the exponential (green) and rescaled cross-entropy (red) error functions along with the hinge error (blue) used in support vector machines, and the misclassification error (black). Note that for large negative values of $\begin{array}{r}{z = \begin{array}{r}{ty(\mathbf{x})} \end{array}} \end{array}$ , the cross-entropy gives a linearly increasing penalty, whereas the exponential loss gives an exponentially increasing penalty.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/e06d8cd20df0a31718195e86dd7730ee89579b40be3bb9703d474f4b56b2658c.jpg)

which is half the log-odds. Thus the AdaBoost algorithm is seeking the best approximation to the log odds ratio, within the space of functions represented by the linear combination of base classifiers, subject to the constrained minimization resulting from the sequential optimization strategy. This result motivates the use of the sign function in (14.19) to arrive at the final classification decision.

We have already seen that the minimizer $y(\mathbf x)$ of the cross-entropy error (4.90) <sup>x</sup>for two-class classification is given by the posterior class probability. In the case of a target variable $t \in \{- 1, 1\}$ , we have seen that the error function is given by ln $(1 + \exp(- yt))$ . This is compared with the exponential error function in Figure 14.3, where we have divided the cross-entropy error by a constant factor ln(2) so that it passes through the point (0, 1) for ease of comparison. We see that both can be seen as continuous approximations to the ideal misclassification error function. An advantage of the exponential error is that its sequential minimization leads to the simple AdaBoost scheme. One drawback, however, is that it penalizes large negative values of $ty(\mathbf{x})$ much more strongly than cross-entropy. In particular, we see that for large negative values of $ty$ , the cross-entropy grows linearly with $| ty |$ whereas the exponential error function grows exponentially with $| ty |$ . Thus the exponential error function will be much less robust to outliers or misclassified data points. Another important difference between cross-entropy and the exponential error function is that the latter cannot be interpreted as the log likelihood function of any well-defined probabilistic model. Furthermore, the exponential error does not generalize to classification problems having $K > 2$ classes, again in contrast to the cross-entropy for a probabilistic model, which is easily generalized to give (4.108).

The interpretation of boosting as the sequential optimization of an additive model under an exponential error (Friedman et al., 2000) opens the door to a wide range of boosting-like algorithms, including multiclass extensions, by altering the choice of error function. It also motivates the extension to regression problems (Friedman, 2001). If we consider a sum-of-squares error function for regression, then sequential minimization of an additive model of the form (14.21) simply involves fitting each new base classifier to the residual errors $t_{n} - f_{m - 1}(\mathbf{x}_{n})$ from the previous model. As we have noted, however, the sum-of-squares error is not robust to outliers, and this can be addressed by basing the boosting algorithm on the absolute deviation $\left| y - t \right|$ instead. These two error functions are compared in Figure 14.4.

Figure 14.4 Comparison of the squared error (green) with the absolute error (red) showing how the latter places much less emphasis on large errors and hence is more robust to outliers and mislabelled data points.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/4e3b05306274313a2dfb2038dd9d73eae4579fa0c7e499698372ffc8384d45de.jpg)

## 14.4. Tree-based Models

There are various simple, but widely used, models that work by partitioning the input space into cuboid regions, whose edges are aligned with the axes, and then assigning a simple model (for example, a constant) to each region. They can be viewed as a model combination method in which only one model is responsible for making predictions at any given point in input space. The process of selecting a specific model, given a new input , can be described by a sequential decision making process corresponding to the traversal of a binary tree (one that splits into two branches at each node). Here we focus on a particular tree-based framework called classification and regression trees, or CART (Breiman et al., 1984), although there are many other variants going by such names as ID3 and C4.5 (Quinlan, 1986; Quinlan, 1993).

Figure 14.5 shows an illustration of a recursive binary partitioning of the input space, along with the corresponding tree structure. In this example, the first step

Figure 14.5 Illustration of a two-dimensional input space that has been partitioned into five regions using axis-aligned boundaries.  
![Figure 14.6](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/0549345b81c8648e627e5d642fce869ca5722bbd8c10e37e9ed0e5adc7ae2868.jpg)

Figure 14.6 Binary tree corresponding to the partitioning of input space shown in Figure 14.5.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/130c6468a89dad90f89d07d0551b7566b4061b875834269fd336577c1ccaaf41.jpg)

divides the whole of the input space into two regions according to whether $x_{1} \leqslant \theta_{1}$ or $x_{1} > \theta_{1}$ where $\theta_{1}$ is a parameter of the model. This creates two subregions, each of which can then be subdivided independently. For instance, the region $x_{1} \leqslant \theta_{1}$ is further subdivided according to whether $x_{2} \leqslant \theta_{2}$ or $x_{2} > \theta_{2}$ , giving rise to the regions denoted A and B. The recursive subdivision can be described by the traversal of the binary tree shown in Figure 14.6. For any new input , we determine which region it falls into by starting at the top of the tree at the root node and following a path down to a specific leaf node according to the decision criteria at each node. Note that such decision trees are not probabilistic graphical models.

Within each region, there is a separate model to predict the target variable. For instance, in regression we might simply predict a constant over each region, or in classification we might assign each region to a specific class. A key property of treebased models, which makes them popular in fields such as medical diagnosis, for example, is that they are readily interpretable by humans because they correspond to a sequence of binary decisions applied to the individual input variables. For instance, to predict a patient’s disease, we might first ask “is their temperature greater than some threshold?”. If the answer is yes, then we might next ask “is their blood pressure less than some threshold?”. Each leaf of the tree is then associated with a specific diagnosis.

In order to learn such a model from a training set, we have to determine the structure of the tree, including which input variable is chosen at each node to form the split criterion as well as the value of the threshold parameter $\theta_{i}$ for the split. We also have to determine the values of the predictive variable within each region.

Consider first a regression problem in which the goal is to predict a single target variable t from a D-dimensional vector $\mathbf x =(x_{1}, \hdots, x_{D})^{\mathrm T}$ of input variables. The training data consists of input vectors $\left\{\mathbf{x}_{1}, \ldots, \mathbf{x}_{N} \right\}$ along with the corresponding continuous labels $\{t_{1}, \ldots, t_{N}\}$ . If the partitioning of the input space is given, and we minimize the sum-of-squares error function, then the optimal value of the predictive variable within any given region is just given by the average of the values of $t_{n}$ for those data points that fall in that region.

Now consider how to determine the structure of the decision tree. Even for a fixed number of nodes in the tree, the problem of determining the optimal structure (including choice of input variable for each split as well as the corresponding thresholds) to minimize the sum-of-squares error is usually computationally infeasible due to the combinatorially large number of possible solutions. Instead, a greedy optimization is generally done by starting with a single root node, corresponding to the whole input space, and then growing the tree by adding nodes one at a time. At each step there will be some number of candidate regions in input space that can be split, corresponding to the addition of a pair of leaf nodes to the existing tree. For each of these, there is a choice of which of the $D$ input variables to split, as well as the value of the threshold. The joint optimization of the choice of region to split, and the choice of input variable and threshold, can be done efficiently by exhaustive search noting that, for a given choice of split variable and threshold, the optimal choice of predictive variable is given by the local average of the data, as noted earlier. This is repeated for all possible choices of variable to be split, and the one that gives the smallest residual sum-of-squares error is retained.

Given a greedy strategy for growing the tree, there remains the issue of when to stop adding nodes. A simple approach would be to stop when the reduction in residual error falls below some threshold. However, it is found empirically that often none of the available splits produces a significant reduction in error, and yet after several more splits a substantial error reduction is found. For this reason, it is common practice to grow a large tree, using a stopping criterion based on the number of data points associated with the leaf nodes, and then prune back the resulting tree. The pruning is based on a criterion that balances residual error against a measure of model complexity. If we denote the starting tree for pruning by $T_{0}$ , then we define $T \subset T_{0}$ to be a subtree of $T_{0}$ if it can be obtained by pruning nodes from $T_{0}$ (in other words, by collapsing internal nodes by combining the corresponding regions). Suppose the leaf nodes are indexed by $\tau = 1, \dots, | T |$ , with leaf node $\tau$ representing a region $\mathcal{R}_{\tau}$ of input space having $N_{\tau}$ data points, and $| T |$ denoting the total number of leaf nodes. The optimal prediction for region $\mathcal{R}_{\tau}$ is then given by

$$
y_{\tau} = \frac{1}{N_{\tau}} \sum_{\mathbf{x}_{n} \in \mathcal{R}_{\tau}} t_{n}\tag{14.29}
$$

and the corresponding contribution to the residual sum-of-squares is then

$$
Q_{\tau}(T) = \sum_{\mathbf{x}_{n} \in \mathcal{R}_{\tau}} \left\{t_{n} - y_{\tau} \right\}^{2}.\tag{14.30}
$$

The pruning criterion is then given by

$$
C(T) = \sum_{\tau = 1}^{| T |} Q_{\tau}(T) + \lambda | T |\tag{14.31}
$$

The regularization parameter λ determines the trade-off between the overall residual sum-of-squares error and the complexity of the model as measured by the number $| T |$ of leaf nodes, and its value is chosen by cross-validation.

For classification problems, the process of growing and pruning the tree is similar, except that the sum-of-squares error is replaced by a more appropriate measure of performance. If we define $p_{\tau k}$ to be the proportion of data points in region $\mathcal{R}_{\tau}$ assigned to class k, where $k = 1, \ldots, K$ , then two commonly used choices are the cross-entropy

$$
Q_{\tau}(T) = \sum_{k = 1}^{K} p_{\tau k} \ln p_{\tau k}\tag{14.32}
$$

and the Gini index

$$
Q_{\tau}(T) = \sum_{k = 1}^{K} p_{\tau k} \left(1 - p_{\tau k}\right).\tag{14.33}
$$

These both vanish for $p_{\tau k} = 0$ and $p_{\tau k} = 1$ and have a maximum at $p_{\tau k} = 0.5$ . They encourage the formation of regions in which a high proportion of the data points are assigned to one class. The cross entropy and the Gini index are better measures than the misclassification rate for growing the tree because they are more sensitive to the node probabilities. Also, unlike misclassification rate, they are differentiable and hence better suited to gradient based optimization methods. For subsequent pruning of the tree, the misclassification rate is generally used.

The human interpretability of a tree model such as CART is often seen as its major strength. However, in practice it is found that the particular tree structure that is learned is very sensitive to the details of the data set, so that a small change to the training data can result in a very different set of splits (Hastie et al., 2001).

There are other problems with tree-based methods of the kind considered in this section. One is that the splits are aligned with the axes of the feature space, which may be very suboptimal. For instance, to separate two classes whose optimal decision boundary runs at 45 degrees to the axes would need a large number of axis-parallel splits of the input space as compared to a single non-axis-aligned split. Furthermore, the splits in a decision tree are hard, so that each region of input space is associated with one, and only one, leaf node model. The last issue is particularly problematic in regression where we are typically aiming to model smooth functions, and yet the tree model produces piecewise-constant predictions with discontinuities at the split boundaries.

## 14.5. Conditional Mixture Models

We have seen that standard decision trees are restricted by hard, axis-aligned splits of the input space. These constraints can be relaxed, at the expense of interpretability, by allowing soft, probabilistic splits that can be functions of all of the input variables, not just one of them at a time. If we also give the leaf models a probabilistic interpretation, we arrive at a fully probabilistic tree-based model called the hierarchical mixture of experts, which we consider in Section 14.5.3.

An alternative way to motivate the hierarchical mixture of experts model is to start with a standard probabilistic mixtures of unconditional density models such as Gaussians and replace the component densities with conditional distributions. Here we consider mixtures of linear regression models (Section 14.5.1) and mixtures of logistic regression models (Section 14.5.2). In the simplest case, the mixing coefficients are independent of the input variables. If we make a further generalization to allow the mixing coefficients also to depend on the inputs then we obtain a mixture of experts model. Finally, if we allow each component in the mixture model to be itself a mixture of experts model, then we obtain a hierarchical mixture of experts.

## 14.5.1 Mixtures of linear regression models

One of the many advantages of giving a probabilistic interpretation to the linear regression model is that it can then be used as a component in more complex probabilistic models. This can be done, for instance, by viewing the conditional distribution representing the linear regression model as a node in a directed probabilistic graph. Here we consider a simple example corresponding to a mixture of linear regression models, which represents a straightforward extension of the Gaussian mixture model discussed in Section 9.2 to the case of conditional Gaussian distributions.

We therefore consider K linear regression models, each governed by its own weight parameter ${\bf w}_{k}$ . In many applications, it will be appropriate to use a common noise variance, governed by a precision parameter $\beta,$ for all K components, and this is the case we consider here. We will once again restrict attention to a single target variable t, though the extension to multiple outputs is straightforward. If we denote the mixing coefficients by $\pi_{k}$ , then the mixture distribution can be written

$$
p(t | \pmb{\theta}) = \sum_{k = 1}^{K} \pi_{k} \mathcal{N}(t | \mathbf{w}_{k}^{\mathrm{T}} \phi, \beta^{- 1})\tag{14.34}
$$

where $\pmb \theta$ denotes the set of all adaptive parameters in the model, namely $\mathbf{W} = \{\mathbf{w}_{k}\}$ $\pi = \left\{\pi_{k} \right\}$ , and $\beta.$ The log likelihood function for this model, given a data set of observations $\{\phi_{n}, t_{n}\}$ , then takes the form

$$
\ln p(\mathbf{t} | \boldsymbol{\theta}) = \sum_{n = 1}^{N} \ln \left(\sum_{k = 1}^{K} \pi_{k} \mathcal{N}(t_{n} | \mathbf{w}_{k}^{\mathrm{T}} \boldsymbol{\phi}_{n}, \beta^{- 1})\right)\tag{14.35}
$$

where ${\mathbf t} =(t_{1}, \ldots, t_{N})^{\mathrm{T}}$ denotes the vector of target variables.

In order to maximize this likelihood function, we can once again appeal to the EM algorithm, which will turn out to be a simple extension of the EM algorithm for unconditional Gaussian mixtures of Section 9.2. We can therefore build on our experience with the unconditional mixture and introduce a set ${\bf Z} = \{{\bf z}_{n}\}$ of binary latent variables where $z_{nk} \in \{0, 1\}$ <sup>Z</sup>in which, for each data point $n_{\mathrm{:}}$ <sup>z</sup>all of the elements $k = 1, \ldots, K$ are zero except for a single value of 1 indicating which component of the mixture was responsible for generating that data point. The joint distribution over latent and observed variables can be represented by the graphical model shown in Figure 14.7.

The complete-data log likelihood function then takes the form

$$
\ln p(\mathbf{t}, \mathbf{Z} | \pmb{\theta}) = \sum_{n = 1}^{N} \sum_{k = 1}^{K} z_{nk} \ln \left\{\pi_{k} \mathcal{N}(t_{n} | \mathbf{w}_{k}^{\mathrm{T}} \phi_{n}, \beta^{- 1}) \right\}.\tag{14.36}
$$

Figure 14.7 Probabilistic directed graph representing a mixture of linear regression models, defined by (14.35).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/c5c54f16d25f25cd5f0b4cda0b5c824c2c03910974bf62e191d84e57842bee65.jpg)

The EM algorithm begins by first choosing an initial value $\theta^{\mathrm{old}}$ for the model parameters. In the E step, these parameter values are then used to evaluate the posterior probabilities, or responsibilities, of each component k for every data point n given by

$$
\gamma_{nk} = \mathbb{E}[z_{nk}] = p(k | \boldsymbol{\phi}_{n}, \boldsymbol{\theta}^{\mathrm{old}}) = \frac{\pi_{k} \mathcal{N}(t_{n} | \mathbf{w}_{k}^{\mathrm{T}} \boldsymbol{\phi}_{n}, \beta^{- 1})}{\sum_{j} \pi_{j} \mathcal{N}(t_{n} | \mathbf{w}_{j}^{\mathrm{T}} \boldsymbol{\phi}_{n}, \beta^{- 1})}.\tag{14.37}
$$

The responsibilities are then used to determine the expectation, with respect to the posterior distribution $p(\mathbf{Z} | \mathbf{t}, \theta^{\mathrm{old}})$ , of the complete-data log likelihood, which takes the form

$$
Q(\boldsymbol{\theta}, \boldsymbol{\theta}^{\mathrm{old}}) = \mathbb{E}_{\mathbf{Z}} \left[\ln p(\mathbf{t}, \mathbf{Z} | \boldsymbol{\theta}) \right] = \sum_{n = 1}^{N} \sum_{k = 1}^{K} \gamma_{nk} \left\{\ln \pi_{k} + \ln \mathcal{N}(t_{n} | \mathbf{w}_{k}^{\mathrm{T}} \boldsymbol{\phi}_{n}, \beta^{- 1}) \right\}.
$$

In the M step, we maximize the function $Q(\theta, \theta^{\mathrm{old}})$ with respect to $\theta_{;}$ , keeping the $\gamma_{nk}$ fixed. For the optimization with respect to the mixing coefficients $\pi_{k}$ we need to take account of the constraint $\begin{array}{r}{\sum_{k} \pi_{k} = 1} \end{array}$ , which can be done with the aid of a Lagrange multiplier, leading to an M-step re-estimation equation for $\pi_{k}$ in the form

Exercise 14.14

$$
\pi_{k} = \frac{1}{N} \sum_{n = 1}^{N} \gamma_{nk}.\tag{14.38}
$$

Note that this has exactly the same form as the corresponding result for a simple mixture of unconditional Gaussians given by (9.22).

Next consider the maximization with respect to the parameter vector $\mathbf{w}_{k}$ of the $k^{\mathrm{th}}$ <sup>w</sup>linear regression model. Substituting for the Gaussian distribution, we see that the function $\mathbf{\widetilde{\mathbf{\Gamma}}} Q(\theta, \theta^{\mathrm{old}})$ , as a function of the parameter vector ${\bf w}_{k}$ , takes the form

$$
Q(\pmb{\theta}, \pmb{\theta}^{\mathrm{old}}) = \sum_{n = 1}^{N} \gamma_{nk} \left\{- \frac{\beta}{2} \left(t_{n} - \mathbf{w}_{k}^{\mathrm{T}} \phi_{n}\right)^{2} \right\} + \mathrm{const}\tag{14.39}
$$

where the constant term includes the contributions from other weight vectors $\mathbf{w}_{j}$ for $j \neq k$ <sup>w</sup>. Note that the quantity we are maximizing is similar to the (negative of the) standard sum-of-squares error (3.12) for a single linear regression model, but with the inclusion of the responsibilities $\gamma_{nk}$ . This represents a weighted least squares problem, in which the term corresponding to the $n^{\mathrm{th}}$ data point carries a weighting coefficient given by $\beta \gamma_{nk}$ , which could be interpreted as an effective precision for each data point. We see that each component linear regression model in the mixture, governed by its own parameter vector $\mathbf{w}_{k}$ , is fitted separately to the whole data set in <sup>w</sup>the M step, but with each data point n weighted by the responsibility $\gamma_{nk}$ that model k takes for that data point. Setting the derivative of (14.39) with respect to ${\bf w}_{k}$ equal to zero gives

$$
0 = \sum_{n = 1}^{N} \gamma_{nk} \left(t_{n} - \mathbf{w}_{k}^{\mathrm{T}} \boldsymbol{\phi}_{n}\right) \boldsymbol{\phi}_{n}\tag{14.40}
$$

which we can write in matrix notation as

$$
0 = \boldsymbol{\Phi}^{\mathrm{T}} \mathbb{R}_{k}(\mathbf{t} - \boldsymbol{\Phi} \mathbf{w}_{k})\tag{14.41}
$$

where $\mathbb{R}_{k} = \operatorname{diag}(\gamma_{nk})$ is a diagonal matrix of size $N \times N$ . Solving for ${\bf w}_{k}$ , we obtain

$$
\mathbf{w}_{k} = \left(\boldsymbol{\Phi}^{\mathrm{T}} \mathbb{R}_{k} \boldsymbol{\Phi}\right)^{- 1} \boldsymbol{\Phi}^{\mathrm{T}} \mathbb{R}_{k} \mathbf{t}.\tag{14.42}
$$

This represents a set of modified normal equations corresponding to the weighted least squares problem, of the same form as (4.99) found in the context of logistic regression. Note that after each E step, the matrix ${\bf R}_{k}$ will change and so we will <sup>R</sup>have to solve the normal equations afresh in the subsequent M step.

Finally, we maximize $Q(\theta, \theta^{\mathrm{old}})$ with respect to $\beta.$ . Keeping only terms that depend on $\beta_{:}$ , the function $Q(\theta, \theta^{\mathrm{old}})$ can be written

$$
Q(\pmb{\theta}, \pmb{\theta}^{\mathrm{old}}) = \sum_{n = 1}^{N} \sum_{k = 1}^{K} \gamma_{nk} \left\{\frac{1}{2} \ln \beta - \frac{\beta}{2} \left(t_{n} - \mathbf{w}_{k}^{\mathrm{T}} \phi_{n}\right)^{2} \right\}.\tag{14.43}
$$

Setting the derivative with respect to $\beta$ equal to zero, and rearranging, we obtain the M-step equation for $\beta$ in the form

$$
\frac{1}{\beta} = \frac{1}{N} \sum_{n = 1}^{N} \sum_{k = 1}^{K} \gamma_{nk} \left(t_{n} - \mathbf{w}_{k}^{\mathrm{T}} \boldsymbol{\phi}_{n}\right)^{2}.\tag{14.44}
$$

In Figure 14.8, we illustrate this EM algorithm using the simple example of fitting a mixture of two straight lines to a data set having one input variable x and one target variable t. The predictive density (14.34) is plotted in Figure 14.9 using the converged parameter values obtained from the EM algorithm, corresponding to the right-hand plot in Figure 14.8. Also shown in this figure is the result of fitting a single linear regression model, which gives a unimodal predictive density. We see that the mixture model gives a much better representation of the data distribution, and this is reflected in the higher likelihood value. However, the mixture model also assigns significant probability mass to regions where there is no data because its predictive distribution is bimodal for all values of x. This problem can be resolved by extending the model to allow the mixture coefficients themselves to be functions of x, leading to models such as the mixture density networks discussed in Section 5.6, and hierarchical mixture of experts discussed in Section 14.5.3.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/e18624736c38d8ddf73b75e77a384ba404861eb4bc279d14d5c9a0d938dfd988.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/1e809e79ccfa6149ed9e0d158fe98f5d7b9254dcff5199ff91359768f4fc1763.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/fbe3f4a18a97eeb62218842374f6c6d21c62370527b5647990691b8b5c66e2ae.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/2b8f6027f3946c726916986ba5b247e23d107dd83c65fa352a0ad4329c7028f7.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/8506256be7b219edc8b58775e48464be8806d1df4503c00337724f0cdd9ac6f9.jpg)

![Figure 14.8](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/57c4a1206d0e06ffebb1f7a092e2f58700a580525eb84967d38a008b12c0b880.jpg)  
Figure 14.8 Example of a synthetic data set, shown by the green points, having one input variable x and one target variable t, together with a mixture of two linear regression models whose mean functions $y(x, \mathbf{w}_{k})$ , where $k \in \{1, 2\}$ , are shown by the blue and red lines. The upper three plots show the initial configuration (left), the result of running 30 iterations of EM (centre), and the result after 50 iterations of EM (right). Here $\beta$ was initialized to the reciprocal of the true variance of the set of target values. The lower three plots show the corresponding responsibilities plotted as a vertical line for each data point in which the length of the blue segment gives the posterior probability of the blue line for that data point (and similarly for the red segment).

## 14.5.2 Mixtures of logistic models

Because the logistic regression model defines a conditional distribution for the target variable, given the input vector, it is straightforward to use it as the component distribution in a mixture model, thereby giving rise to a richer family of conditional distributions compared to a single logistic regression model. This example involves a straightforward combination of ideas encountered in earlier sections of the book and will help consolidate these for the reader.

The conditional distribution of the target variable, for a probabilistic mixture of K logistic regression models, is given by

$$
p(t | \boldsymbol{\phi}, \boldsymbol{\theta}) = \sum_{k = 1}^{K} \pi_{k} y_{k}^{t}[1 - y_{k}]^{1 - t}\tag{14.45}
$$

where $\phi$ is the feature vector, $y_{k} = \sigma \left(\mathbf{w}_{k}^{\mathrm{T}} \phi \right)$ is the output of component $k,$ and $\pmb \theta$ <sup>w</sup>denotes the adjustable parameters namely $\{\pi_{k}\}$ and $\left\{\mathbf{w}_{k} \right\}$

Now suppose we are given a data set $\{\phi_{n}, t_{n}\}$ . The corresponding likelihood

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/0bab6a6c1418ff12581fbba8a3ee5b12711648bb4588c402682513dc21990b0c.jpg)

![Figure 14.9](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/ef7e9ee8f93c160be2b223654cb55929e0e167108fc14db69e9f99513ecb2aaf.jpg)  
Figure 14.9 The left plot shows the predictive conditional density corresponding to the converged solution in Figure 14.8. This gives a log likelihood value of 3.0. A vertical slice through one of these plots at a particula value of x represents the corresponding conditional distribution $p(t | x)$ , which we see is bimodal. The plot on the right shows the predictive density for a single linear regression model fitted to the same data set using maximum likelihood. This model has a smaller log likelihood of 27.6.

function is then given by

$$
p(\mathbf{t} | \boldsymbol{\theta}) = \prod_{n = 1}^{N} \left(\sum_{k = 1}^{K} \pi_{k} y_{nk}^{t_{n}} \left[1 - y_{nk} \right]^{1 - t_{n}}\right)\tag{14.46}
$$

where $y_{nk} = \sigma(\mathbf{w}_{k}^{\mathrm{T}} \phi_{n})$ and $\mathbf{t} =(t_{1}, \ldots, t_{N})^{\mathrm{T}}$ . We can maximize this likelihood function iteratively by making use of the EM algorithm. This involves introducing latent variables $z_{nk}$ that correspond to a 1-of-K coded binary indicator variable for each data point n. The complete-data likelihood function is then given by

$$
p(\mathbf{t}, \mathbf{Z} | \boldsymbol{\theta}) = \prod_{n = 1}^{N} \prod_{k = 1}^{K} \left\{\pi_{k} y_{nk}^{t_{n}} \left[1 - y_{nk} \right]^{1 - t_{n}} \right\}^{z_{nk}}\tag{14.47}
$$

where  is the matrix of latent variables with elements $z_{nk}$ . We initialize the EM algorithm by choosing an initial value $\theta^{\mathrm{old}}$ for the model parameters. In the E step, we then use these parameter values to evaluate the posterior probabilities of the components k for each data point n, which are given by

$$
\gamma_{nk} = \mathbb{E}[z_{nk}] = p(k | \boldsymbol{\phi}_{n}, \pmb{\theta}^{\mathrm{old}}) = \frac{\pi_{k} y_{nk}^{t_{n}}[1 - y_{nk}]^{1 - t_{n}}}{\sum_{j} \pi_{j} y_{nj}^{t_{n}}[1 - y_{nj}]^{1 - t_{n}}}.\tag{14.48}
$$

These responsibilities are then used to find the expected complete-data log likelihood as a function of θ, given by

$$
\begin{array}{l} Q(\boldsymbol{\theta}, \boldsymbol{\theta}^{\text{old}}) = \mathbb{E}_{\mathbf{Z}} \left[\ln p(\mathbf{t}, \mathbf{Z} | \boldsymbol{\theta}) \right] \\ = \sum_{n = 1}^{N} \sum_{k = 1}^{K} \gamma_{nk} \left\{\ln \pi_{k} + t_{n} \ln y_{nk} +(1 - t_{n}) \ln(1 - y_{nk}) \right\}.\end{array}\tag{14.49}
$$

The M step involves maximization of this function with respect to $\theta,$ keeping $\pmb{\theta}^{\mathrm{old}}$ and hence $\gamma_{nk}$ , fixed. Maximization with respect to $\pi_{k}$ can be done in the usual way, with a Lagrange multiplier to enforce the summation constraint $\textstyle \sum_{k} \pi_{k} = 1$ , giving the familiar result

$$
\pi_{k} = \frac{1}{N} \sum_{n = 1}^{N} \gamma_{nk}.\tag{14.50}
$$

To determine the $\left\{\mathbf{w}_{k} \right\}$ , we note that the $Q(\theta, \theta^{\mathrm{old}})$ function comprises a sum over terms indexed by k each of which depends only on one of the vectors $\mathbf{w}_{k}.$ , so <sup>w</sup>that the different vectors are decoupled in the M step of the EM algorithm. In other words, the different components interact only via the responsibilities, which are fixed during the M step. Note that the M step does not have a closed-form solution and must be solved iteratively using, for instance, the iterative reweighted least squares (IRLS) algorithm. The gradient and the Hessian for the vector $\mathbf{w}_{k}$ are given by

$$
\nabla_{k} Q = \sum_{n = 1}^{N} \gamma_{nk}(t_{n} - y_{nk}) \phi_{n}\tag{14.51}
$$

$$
\mathbf{H}_{k} = - \nabla_{k} \nabla_{k} Q = \sum_{n = 1}^{N} \gamma_{nk} y_{nk}(1 - y_{nk}) \phi_{n} \phi_{n}^{\mathrm{T}}\tag{14.52}
$$

where $\nabla_{k}$ denotes the gradient with respect to ${\bf w}_{k}$ . For fixed $\gamma_{nk}$ , these are independent of $\{\mathbf{w}_{j}\}$ for $j \neq k$ and so we can solve for each $\mathbf{w}_{k}$ separately using the IRLS algorithm. Thus the M-step equations for component k correspond simply to fitting a single logistic regression model to a weighted data set in which data point n carries a weight $\gamma_{nk}$ . Figure 14.10 shows an example of the mixture of logistic regression models applied to a simple classification problem. The extension of this model to a mixture of softmax models for more than two classes is straightforward.

## 14.5.3 Mixtures of experts

In Section 14.5.1, we considered a mixture of linear regression models, and in Section 14.5.2 we discussed the analogous mixture of linear classifiers. Although these simple mixtures extend the flexibility of linear models to include more complex (e.g., multimodal) predictive distributions, they are still very limited. We can further increase the capability of such models by allowing the mixing coefficients themselves to be functions of the input variable, so that

$$
p(\mathbf{t} | \mathbf{x}) = \sum_{k = 1}^{K} \pi_{k}(\mathbf{x}) p_{k}(\mathbf{t} | \mathbf{x}).\tag{14.53}
$$

This is known as a mixture of experts model (Jacobs et al., 1991) in which the mixing coefficients $\pi_{k}({\bf x})$ are known as gating functions and the individual component densities $p_{k}(\mathbf t | \mathbf x)$ <sup>x</sup>are called experts. The notion behind the terminology is that differ-<sup>t x</sup>ent components can model the distribution in different regions of input space (they are ‘experts’ at making predictions in their own regions), and the gating functions determine which components are dominant in which region.

![Figure 14.10](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/8855adc01e85c4177a6390944e8b1517dc0eba20645981f725cfb2d7e0e8e8f2.jpg)  
Figure 14.10 Illustration of a mixture of logistic regression models. The left plot shows data points drawn from two classes denoted red and blue, in which the background colour (which varies from pure red to pure blue) denotes the true probability of the class label. The centre plot shows the result of fitting a single logistic regression model using maximum likelihood, in which the background colour denotes the corresponding probability of the class label. Because the colour is a near-uniform purple, we see that the model assigns a probability of around 0.5 to each of the classes over most of input space. The right plot shows the result of fitting a mixture of two logistic regression models, which now gives much higher probability to the correct labels for many of the points in the blue class.

The gating functions $\pi_{k}({\bf x})$ must satisfy the usual constraints for mixing coefficients, namely $0 \leqslant \pi_{k}(\mathbf{x}) \leqslant 1$ and $\begin{array}{r}{\sum_{k} \pi_{k}({\bf x}) = 1} \end{array}$ . They can therefore be represented, for example, by linear softmax models of the form (4.104) and (4.105). If the experts are also linear (regression or classification) models, then the whole model can be fitted efficiently using the EM algorithm, with iterative reweighted least squares being employed in the M step (Jordan and Jacobs, 1994).

Such a model still has significant limitations due to the use of linear models for the gating and expert functions. A much more flexible model is obtained by using a multilevel gating function to give the hierarchical mixture of experts, or HME model (Jordan and Jacobs, 1994). To understand the structure of this model, imagine a mixture distribution in which each component in the mixture is itself a mixture distribution. For simple unconditional mixtures, this hierarchical mixture is trivially equivalent to a single flat mixture distribution. However, when the mixing coefficients are input dependent, this hierarchical model becomes nontrivial. The HME model can also be viewed as a probabilistic version of decision trees discussed in Section 14.4 and can again be trained efficiently by maximum likelihood using an EM algorithm with IRLS in the M step. A Bayesian treatment of the HME has been given by Bishop and Svensen (2003) based on variational inference.´

We shall not discuss the HME in detail here. However, it is worth pointing out the close connection with the mixture density network discussed in Section 5.6. The principal advantage of the mixtures of experts model is that it can be optimized by EM in which the M step for each mixture component and gating model involves a convex optimization (although the overall optimization is nonconvex). By contrast, the advantage of the mixture density network approach is that the component densities and the mixing coefficients share the hidden units of the neural network. Furthermore, in the mixture density network, the splits of the input space are further relaxed compared to the hierarchical mixture of experts in that they are not only soft, and not constrained to be axis aligned, but they can also be nonlinear.

## Exercises

14.1 (★★) www Consider a set models of the form $p(\mathbf{t} | \mathbf{x}, \mathbf{z}_{h}, \pmb{\theta}_{h}, h)$ in which is the input vector, is the target vector, h indexes the different models, $\mathbf{z}_{h}$ is a latent variable for model $h,$ and $\pmb{\theta}_{h}$ is the set of parameters for model h. Suppose the models have prior probabilities $p(h)$ and that we are given a training set $\mathbf{X} = \{\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}\}$ and $\bar{\mathbf{T}} = \left\{\mathbf{t}_{1}, \ldots, \mathbf{t}_{N} \right\}$ <sup>X x x</sup>Write down the formulae needed to evaluate the predictive distribution $p(\mathbf{t} | \mathbf{x}, \mathbf{X}, \mathbf{T})$ in which the latent variables and the model index are marginalized out. Use these formulae to highlight the difference between Bayesian averaging of different models and the use of latent variables within a single model.

14.2 (★) The expected sum-of-squares error $E_{\mathrm{AV}}$ for a simple committee model can be defined by (14.10), and the expected error of the committee itself is given by (14.11). Assuming that the individual errors satisfy (14.12) and (14.13), derive the result (14.14).

14.3 (★) www By making use of Jensen’s inequality (1.115), for the special case of the convex function $f(x) ~ = ~ x^{2}$ , show that the average expected sum-of-squares error $E_{\mathrm{AV}}$ of the members of a simple committee model, given by (14.10), and the expected error $E_{\mathrm{COM}}$ of the committee itself, given by (14.11), satisfy

$$
E_{\mathrm{COM}} \leqslant E_{\mathrm{AV}}.\tag{14.54}
$$

14.4 (★★) By making use of Jensen’s in equality (1.115), show that the result (14.54) derived in the previous exercise hods for any error function $E(y)$ , not just sum-of squares, provided it is a convex function of $y.$

14.5 (★★) www Consider a committee in which we allow unequal weighting of the constituent models, so that

$$
y_{\mathrm{COM}}(\mathbf{x}) = \sum_{m = 1}^{M} \alpha_{m} y_{m}(\mathbf{x}).\tag{14.55}
$$

In order to ensure that the predictions $y_{\mathrm{COM}}(\mathbf{x})$ remain within sensible limits, sup pose that we require that they be bounded at each value of  by the minimum and maximum values given by any of the members of the committee, so that

$$
y_{\min}(\mathbf{x}) \leqslant y_{\operatorname{COM}}(\mathbf{x}) \leqslant y_{\max}(\mathbf{x}).\tag{14.56}
$$

Show that a necessary and sufficient condition for this constraint is that the coefficients $\alpha_{m}$ satisfy

$$
\alpha_{m} \geqslant 0, \quad \sum_{m = 1}^{M} \alpha_{m} = 1.\tag{14.57}
$$

14.6 (★) www By differentiating the error function (14.23) with respect to $\alpha_{m}$ , show that the parameters $\alpha_{m}$ in the AdaBoost algorithm are updated using (14.17) in which $\epsilon_{m}$ is defined by (14.16).

14.7 (★) By making a variational minimization of the expected exponential error function given by (14.27) with respect to all possible functions $y(\mathbf x)$ , show that the minimizing function is given by (14.28).

14.8 (★) Show that the exponential error function (14.20), which is minimized by the AdaBoost algorithm, does not correspond to the log likelihood of any well-behaved probabilistic model. This can be done by showing that the corresponding conditional distribution $p(t | \mathbf{x})$ cannot be correctly normalized.

14.9 (★) www Show that the sequential minimization of the sum-of-squares error function for an additive model of the form (14.21) in the style of boosting simply involves fitting each new base classifier to the residual errors $t_{n} - f_{m - 1}(\mathbf{x}_{n})$ from the previous model.

14.10 (★) Verify that if we minimize the sum-of-squares error between a set of training values $\left\{t_{n} \right\}$ and a single predictive value t, then the optimal solution for t is given by the mean of the $\left\{t_{n} \right\}$

14.11 (★★) Consider a data set comprising 400 data points from class $\mathcal{C}_{1}$ and 400 data points from class $\mathcal{C}_{2}$ . Suppose that a tree model A splits these into (300, 100) at the first leaf node and (100, 300) at the second leaf node, where $(n, m)$ denotes that n points are assigned to $\mathcal{C}_{1}$ and m points are assigned to $\mathcal{C}_{2}$ . Similarly, suppose that a second tree model B splits them into (200, 400) and (200, 0). Evaluate the misclassification rates for the two trees and hence show that they are equal. Similarly, evaluate the cross-entropy (14.32) and Gini index (14.33) for the two trees and show that they are both lower for tree B than for tree A.

14.12 (★★) Extend the results of Section 14.5.1 for a mixture of linear regression models to the case of multiple target values described by a vector . To do this, make use of the results of Section 3.1.5.

14.13 (★) www Verify that the complete-data log likelihood function for the mixture of linear regression models is given by (14.36).

14.14 (★) Use the technique of Lagrange multipliers (Appendix E) to show that the M-step re-estimation equation for the mixing coefficients in the mixture of linear regression models trained by maximum likelihood EM is given by (14.38).

14.15 (★) www We have already noted that if we use a squared loss function in a regression problem, the corresponding optimal prediction of the target variable for a new input vector is given by the conditional mean of the predictive distribution. Show that the conditional mean for the mixture of linear regression models discussed in Section 14.5.1 is given by a linear combination of the means of each component distribution. Note that if the conditional distribution of the target data is multimodal, the conditional mean can give poor predictions.

14.16 (★★★) Extend the logistic regression mixture model of Section 14.5.2 to a mixture of softmax classifiers representing $C \geqslant 2$ classes. Write down the EM algorithm for determining the parameters of this model through maximum likelihood.

14.17 (★★) www Consider a mixture model for a conditional distribution $p(t | \mathbf{x})$ of the form

$$
p(t | \mathbf{x}) = \sum_{k = 1}^{K} \pi_{k} \psi_{k}(t | \mathbf{x})\tag{14.58}
$$

in which each mixture component $\psi_{k}(t | \mathbf x)$ is itself a mixture model. Show that this two-level hierarchical mixture is equivalent to a conventional single-level mixture model. Now suppose that the mixing coefficients in both levels of such a hierarchical model are arbitrary functions of . Again, show that this hierarchical model is again equivalent to a single-level model with -dependent mixing coefficients. <sup>x</sup>Finally, consider the case in which the mixing coefficients at both levels of the hierarchical mixture are constrained to be linear classification (logistic or softmax) models. Show that the hierarchical mixture cannot in general be represented by a single-level mixture having linear classification models for the mixing coefficients. Hint: to do this it is sufficient to construct a single counter-example, so consider a mixture of two components in which one of those components is itself a mixture of two components, with mixing coefficients given by linear-logistic models. Show that this cannot be represented by a single-level mixture of 3 components having mixing coefficients determined by a linear-softmax model.

# Appendix A. Data Sets

In this appendix, we give a brief introduction to the data sets used to illustrate some of the algorithms described in this book. Detailed information on file formats for these data sets, as well as the data files themselves, can be obtained from the book web site:

http://research.microsoft.com/ cmbishop/PRML

## Handwritten Digits

The digits data used in this book is taken from the MNIST data set (LeCun et al., 1998), which itself was constructed by modifying a subset of the much larger data set produced by NIST (the National Institute of Standards and Technology). It comprises a training set of 60, 000 examples and a test set of 10, 000 examples. Some of the data was collected from Census Bureau employees and the rest was collected from high-school children, and care was taken to ensure that the test examples were written by different individuals to the training examples.

The original NIST data had binary (black or white) pixels. To create MNIST, these images were size normalized to fit in a 20 20 pixel box while preserving their aspect ratio. As a consequence of the anti-aliasing used to change the resolution of the images, the resulting MNIST digits are grey scale. These images were then centred in a 28 28 box. Examples of the MNIST digits are shown in Figure A.1.

Error rates for classifying the digits range from 12% for a simple linear classifier, through 0.56% for a carefully designed support vector machine, to 0.4% for a convolutional neural network (LeCun et al., 1998).

Figure A.1 One hundred examples of the MNIST digits chosen at random from the training set.

7 2 4 4 9 5 9 0 6 9 0 5 9 7 3 4 9 6 9 5 7 4 0 3 3 L 7 2 7 7 4 3 5 2 4 4 6 3 5 5 6 0 4 9 9 3 7 64 3 0 7 0 2 7 3 2 9 7 7 6 2 7 8 4 7 3 6 3 6 9 3 4 7 6 9

## Oil Flow

This is a synthetic data set that arose out of a project aimed at measuring noninvasively the proportions of oil, water, and gas in North Sea oil transfer pipelines (Bishop and James, 1993). It is based on the principle of dual-energy gamma densitometry. The ideas is that if a narrow beam of gamma rays is passed through the pipe, the attenuation in the intensity of the beam provides information about the density of material along its path. Thus, for instance, the beam will be attenuated more strongly by oil than by gas.

A single attenuation measurement alone is not sufficient because there are two degrees of freedom corresponding to the fraction of oil and the fraction of water (the fraction of gas is redundant because the three fractions must add to one). To address this, two gamma beams of different energies (in other words different frequencies or wavelengths) are passed through the pipe along the same path, and the attenuation of each is measured. Because the absorbtion properties of different materials vary differently as a function of energy, measurement of the attenuations at the two energies provides two independent pieces of information. Given the known absorbtion properties of oil, water, and gas at the two energies, it is then a simple matter to calculate the average fractions of oil and water (and hence of gas) measured along the path of the gamma beams.

There is a further complication, however, associated with the motion of the materials along the pipe. If the flow velocity is small, then the oil floats on top of the water with the gas sitting above the oil. This is known as a laminar or stratified

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/8d0387027b7f5754607bd5a70d03b7a067124efb4b61405224f458746879ce36.jpg)  
Stratified

Figure A.2 The three geometrical configurations of the oil, water, and gas phases used to generate the oil flow data set. For each configuration, the proportions of the three phases can vary.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/d8d800af395e18e67f092f146f2d1b1091dea4483f8543819c2af67ed4606e8e.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/85fbbf9814defcecb3a8efe697067d93f9e043178bbac48a0f079beec0e004a0.jpg)  
Annular

flow configuration and is illustrated in Figure A.2. As the flow velocity is increased, more complex geometrical configurations of the oil, water, and gas can arise. For the purposes of this data set, two specific idealizations are considered. In the annular configuration the oil, water, and gas form concentric cylinders with the water around the outside and the gas in the centre, whereas in the homogeneous configuration the oil, water and gas are assumed to be intimately mixed as might occur at high flow velocities under turbulent conditions. These configurations are also illustrated in Figure A.2.

We have seen that a single dual-energy beam gives the oil and water fractions measured along the path length, whereas we are interested in the volume fractions of oil and water. This can be addressed by using multiple dual-energy gamma densitometers whose beams pass through different regions of the pipe. For this particular data set, there are six such beams, and their spatial arrangement is shown in Figure A.3. A single observation is therefore represented by a 12-dimensional vector comprising the fractions of oil and water measured along the paths of each of the beams. We are, however, interested in obtaining the overall volume fractions of the three phases in the pipe. This is much like the classical problem of tomographic reconstruction, used in medical imaging for example, in which a two-dimensional dis-

Figure A.3 Cross section of the pipe showing the arrangement of the six beam lines, each of which comprises a single dualenergy gamma densitometer. Note that the vertical beams are asymmetrically arranged relative to the central axis (shown by the dotted line).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/a162e8827dcc4522c667eb9af541f79b5b414e61978d78deddff2e4726dee21a.jpg)

tribution is to be reconstructed from an number of one-dimensional averages. Here there are far fewer line measurements than in a typical tomography application. On the other hand the range of geometrical configurations is much more limited, and so the configuration, as well as the phase fractions, can be predicted with reasonable accuracy from the densitometer data.

For safety reasons, the intensity of the gamma beams is kept relatively weak and so to obtain an accurate measurement of the attenuation, the measured beam intensity is integrated over a specific time interval. For a finite integration time, there are random fluctuations in the measured intensity due to the fact that the gamma beams comprise discrete packets of energy called photons. In practice, the integration time is chosen as a compromise between reducing the noise level (which requires a long integration time) and detecting temporal variations in the flow (which requires a short integration time). The oil flow data set is generated using realistic known values for the absorption properties of oil, water, and gas at the two gamma energies used, and with a specific choice of integration time (10 seconds) chosen as characteristic of a typical practical setup.

Each point in the data set is generated independently using the following steps:

1. Choose one of the three phase configurations at random with equal probability.

2. Choose three random numbers $f_{1}, f_{2}$ and $f_{3}$ from the uniform distribution over (0, 1) and define

$$
f_{\mathrm{oil}} = \frac{f_{1}}{f_{1} + f_{2} + f_{3}}, \quad f_{\mathrm{water}} = \frac{f_{2}}{f_{1} + f_{2} + f_{3}}.\tag{A.1}
$$

This treats the three phases on an equal footing and ensures that the volume fractions add to one.

3. For each of the six beam lines, calculate the effective path lengths through oil and water for the given phase configuration.

4. Perturb the path lengths using the Poisson distribution based on the known beam intensities and integration time to allow for the effect of photon statistics.

Each point in the data set comprises the 12 path length measurements, together with the fractions of oil and water and a binary label describing the phase configuration. The data set is divided into training, validation, and test sets, each of which comprises 1, 000 independent data points. Details of the data format are available from the book web site.

In Bishop and James (1993), statistical machine learning techniques were used to predict the volume fractions and also the geometrical configuration of the phases shown in Figure A.2, from the 12-dimensional vector of measurements. The 12- dimensional observation vectors can also be used to test data visualization algorithms.

This data set has a rich and interesting structure, as follows. For any given configuration there are two degrees of freedom corresponding to the fractions of oil and water, and so for infinite integration time the data will locally live on a twodimensional manifold. For a finite integration time, the individual data points will be perturbed away from the manifold by the photon noise. In the homogeneous phase configuration, the path lengths in oil and water are linearly related to the fractions of oil and water, and so the data points lie close to a linear manifold. For the annular configuration, the relationship between phase fraction and path length is nonlinear and so the manifold will be nonlinear. In the case of the laminar configuration the situation is even more complex because small variations in the phase fractions can cause one of the horizontal phase boundaries to move across one of the horizontal beam lines leading to a discontinuous jump in the 12-dimensional observation space. In this way, the two-dimensional nonlinear manifold for the laminar configuration is broken into six distinct segments. Note also that some of the manifolds for different phase configurations meet at specific points, for example if the pipe is filled entirely with oil, it corresponds to specific instances of the laminar, annular, and homogeneous configurations.

## Old Faithful

Old Faithful, shown in Figure A.4, is a hydrothermal geyser in Yellowstone National Park in the state of Wyoming, U.S.A., and is a popular tourist attraction. Its name stems from the supposed regularity of its eruptions.

The data set comprises 272 observations, each of which represents a single eruption and contains two variables corresponding to the duration in minutes of the eruption, and the time until the next eruption, also in minutes. Figure A.5 shows a plot of the time to the next eruption versus the duration of the eruptions. It can be seen that the time to the next eruption varies considerably, although knowledge of the duration of the current eruption allows it to be predicted more accurately. Note that there exist several other data sets relating to the eruptions of Old Faithful.

Figure A.4 The Old Faithful geyser in Yellowstone National Park. c Bruce T. Gourley www.brucegourley.com.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/4363d17ebb21e472acce35f1e175aceb4ed7260dde4e4a0d10625578792ffb77.jpg)

Figure A.5 Plot of the time to the next eruption in minutes (vertical axis) versus the duration of the eruption in minutes (horizontal axis) for the Old Faithful data set.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/98d162a628ddc4aefb655cbe63c7f9c15591ffb65fbed0991c0e7068ce2ff79b.jpg)

## Synthetic Data

Throughout the book, we use two simple synthetic data sets to illustrate many of the algorithms. The first of these is a regression problem, based on the sinusoidal function, shown in Figure A.6. The input values $\{x_{n}\}$ are generated uniformly in range (0, 1), and the corresponding target values $\left\{t_{n} \right\}$ are obtained by first computing the corresponding values of the function sin $(2 \pi x)$ , and then adding random noise with a Gaussian distribution having standard deviation 0.3. Various forms of this data set, having different numbers of data points, are used in the book.

The second data set is a classification problem having two classes, with equal prior probabilities, and is shown in Figure A.7. The blue class is generated from a single Gaussian while the red class comes from a mixture of two Gaussians. Because we know the class priors and the class-conditional densities, it is straightforward to evaluate and plot the true posterior probabilities as well as the minimum misclassification-rate decision boundary, as shown in Figure A.7.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/c12762118f40f1d126ceada6b56413d16be02ce9240d9efbe7ada64b10c82e93.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/c137f898c0bf146c94fdccda36bc80dfd87aeaa1cae6a82801ab035f0f1b196b.jpg)  
Figure A.6 The left-hand plot shows the synthetic regression data set along with the underlying sinusoidal function from which the data points were generated. The right-hand plot shows the true conditional distribution $p(t | x)$ from which the labels are generated, in which the green curve denotes the mean, and the shaded region spans one standard deviation on each side of the mean.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/5567b32c4f9e9055dc88aaa6b837e55b3f7302c359070231d0f137b967663349.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/9b726dbe743f9448c9db1812f8e2756fdf48853723b7ae1a8b0e5f77af537374.jpg)  
Figure A.7 The left plot shows the synthetic classification data set with data from the two classes shown in red and blue. On the right is a plot of the true posterior probabilities, shown on a colour scale going from pure red denoting probability of the red class is 1 to pure blue denoting probability of the red class is 0. Because these probabilities are known, the optimal decision boundary for minimizing the misclassification rate (which corresponds to the contour along which the posterior probabilities for each class equal 0.5) can be evaluated and is shown by the green curve. This decision boundary is also plotted on the left-hand figure.

## Appendix B. Probability Distributions

In this appendix, we summarize the main properties of some of the most widely used probability distributions, and for each distribution we list some key statistics such as the expectation $\mathbb{E}[\mathbf{x}]$ , the variance (or covariance), the mode, and the entropy H[ ]. <sup>x x</sup>All of these distributions are members of the exponential family and are widely used as building blocks for more sophisticated probabilistic models.

## Bernoulli

This is the distribution for a single binary variable $x \ \in \ \{0, 1\}$ representing, for example, the result of flipping a coin. It is governed by a single continuous parameter $\mu \in[0, 1]$ that represents the probability of $x = 1$

$$
\mathrm{Bern}(x | \mu) = \mu^{x}(1 - \mu)^{1 - x}\tag{B.1}
$$

$$
\mathbb{E}[x] = \mu\tag{B.2}
$$

$$
\operatorname{var}[x] = \mu(1 - \mu)\tag{B.3}
$$

$$
\operatorname{mode}[x] = \left\{\begin{array}{ll} 1 & \text{if} \mu \geqslant 0.5, \\ 0 & \text{otherwise} \end{array} \right.\tag{B.4}
$$

$$
\mathrm{H}[x] = - \mu \ln \mu -(1 - \mu) \ln(1 - \mu).\tag{B.5}
$$

The Bernoulli is a special case of the binomial distribution for the case of a single observation. Its conjugate prior for $\mu$ is the beta distribution.

## Beta

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/f0ae840df7e767f09a0e846bb6a48a4e4c77da7b7c610e157560890f308f8f04.jpg)

This is a distribution over a continuous variable $\mu \in[0, 1]$ , which is often used to represent the probability for some binary event. It is governed by two parameters a and b that are constrained by $a > 0$ and $b > 0$ to ensure that the distribution can be normalized.

$$
\operatorname{Beta}(\mu | a, b) = \frac{\Gamma(a + b)}{\Gamma(a) \Gamma(b)} \mu^{a - 1}(1 - \mu)^{b - 1}\tag{B.6}
$$

$$
\mathbb{E}[\mu] = \frac{a}{a + b}\tag{B.7}
$$

$$
\operatorname{var}[\mu] = \frac{ab}{(a + b)^{2}(a + b + 1)}\tag{B.8}
$$

$$
\mathrm{mode}[\mu] = \frac{a - 1}{a + b - 2}.\tag{B.9}
$$

The beta is the conjugate prior for the Bernoulli distribution, for which a and b can be interpreted as the effective prior number of observations of $x = 1$ and $x = 0$ respectively. Its density is finite if $a \geqslant 1$ and $b \geqslant 1$ , otherwise there is a singularity at $\mu = 0$ and/or $\mu = 1$ . For $a = b = 1$ , it reduces to a uniform distribution. The beta distribution is a special case of the K-state Dirichlet distribution for $K = 2$

## Binomial

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/c9c88c0f117cd9fc57cba1b42938dc7f44c8c09e3c30146f68ca79c930af8f7c.jpg)

The binomial distribution gives the probability of observing m occurrences of $x = 1$ in a set of N samples from a Bernoulli distribution, where the probability of observing $x = 1$ is $\mu \in[0, 1]$

$$
\operatorname{Bin}(m | N, \mu) = \binom{N}{m} \mu^{m}(1 - \mu)^{N - m}\tag{B.10}
$$

$$
\mathbb{E}[m] = N \mu\tag{B.11}
$$

$$
\operatorname{var}[m] = N \mu(1 - \mu)\tag{B.12}
$$

$$
\mathrm{mode}[m] = \lfloor(N + 1) \mu \rfloor\tag{B.13}
$$

where $\left\lfloor(N + 1) \mu \right\rfloor$ denotes the largest integer that is less than or equal to $(N + 1) \mu.$ and the quantity

$$
\binom{N}{m} = \frac{N !}{m !(N - m) !}\tag{B.14}
$$

denotes the number of ways of choosing m objects out of a total of N identical objects. Here $m !$ , pronounced ‘factorial $m '$ , denotes the product $m \times(m - 1) \times$ $\ldots, \times 2 \times 1$ . The particular case of the binomial distribution for $N = 1$ is known as the Bernoulli distribution, and for large N the binomial distribution is approximately Gaussian. The conjugate prior for $\mu$ is the beta distribution.

## Dirichlet

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/94d6835f355ada2bf1325a4c80fa274f7fc9577faa0ebd4178fa7e04ee7c3f5e.jpg)

The Dirichlet is a multivariate distribution over K random variables $0 \leqslant \mu_{k} \leqslant 1$ where $k = 1, \ldots, K$ , subject to the constraints

$$
0 \leqslant \mu_{k} \leqslant 1, \quad \sum_{k = 1}^{K} \mu_{k} = 1.\tag{B.15}
$$

Denoting $\pmb{\mu} =(\mu_{1}, \ldots, \mu_{K})^{\mathrm{T}}$ and $\mathbf{\alpha} \propto(\alpha_{1}, \ldots, \alpha_{K})^{\mathrm{T}}$ , we have

$$
\operatorname{Dir}(\boldsymbol{\mu} | \boldsymbol{\alpha}) = C(\boldsymbol{\alpha}) \prod_{k = 1}^{K} \mu_{k}^{\alpha_{k} - 1}\tag{B.16}
$$

$$
\mathbb{E}[\mu_{k}] = \frac{\alpha_{k}}{\widehat{\alpha}}\tag{B.17}
$$

$$
\operatorname{var}[\mu_{k}] = \frac{\alpha_{k}(\widehat{\alpha} - \alpha_{k})}{\widehat{\alpha}^{2}(\widehat{\alpha} + 1)}\tag{B.18}
$$

$$
\operatorname{cov}[\mu_{j} \mu_{k}] = - \frac{\alpha_{j} \alpha_{k}}{\widehat{\alpha}^{2}(\widehat{\alpha} + 1)}\tag{B.19}
$$

$$
\mathrm{mode}[\mu_{k}] = \frac{\alpha_{k} - 1}{\widehat{\alpha} - K}\tag{B.20}
$$

$$
\mathbb{E}[\ln \mu_{k}] = \psi(\alpha_{k}) - \psi(\widehat{\alpha})\tag{B.21}
$$

$$
\mathrm{H}[\boldsymbol{\mu}] = - \sum_{k = 1}^{K}(\alpha_{k} - 1) \left\{\psi(\alpha_{k}) - \psi(\widehat{\alpha}) \right\} - \ln C(\boldsymbol{\alpha})\tag{B.22}
$$

where

$$
C(\boldsymbol{\alpha}) = \frac{\Gamma(\widehat{\alpha})}{\Gamma(\alpha_{1}) \cdots \Gamma(\alpha_{K})}\tag{B.23}
$$

and

$$
\widehat{\alpha} = \sum_{k = 1}^{K} \alpha_{k}.\tag{B.24}
$$

Here

$$
\psi(a) \equiv \frac{d}{da} \ln \Gamma(a)\tag{B.25}
$$

is known as the digamma function (Abramowitz and Stegun, 1965). The parameters $\alpha_{k}$ are subject to the constraint $\alpha_{k} > 0$ in order to ensure that the distribution can be normalized.

The Dirichlet forms the conjugate prior for the multinomial distribution and represents a generalization of the beta distribution. In this case, the parameters $\alpha_{k}$ can be interpreted as effective numbers of observations of the corresponding values of the K-dimensional binary observation vector x. As with the beta distribution, the Dirichlet has finite density everywhere provided $\alpha_{k} \geqslant 1$ for all k.

## Gamma

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/b24b1c0a56d0a12d1e1d6389fdc41ac6c9d1706aa485d7d8a1e569ac3612b4bb.jpg)

The Gamma is a probability distribution over a positive random variable $\tau > 0$ governed by parameters a and $b$ that are subject to the constraints $a > 0$ and $b > 0$ to ensure that the distribution can be normalized.

$$
\operatorname{Gam}(\tau | a, b) = \frac{1}{\Gamma(a)} b^{a} \tau^{a - 1} e^{- b \tau}\tag{B.26}
$$

$$
\mathbb{E}[\tau] = \frac{a}{b}\tag{B.27}
$$

$$
\operatorname{var}[\tau] = \frac{a}{b^{2}}\tag{B.28}
$$

$$
\operatorname{mode}[\tau] = \frac{a - 1}{b} \quad \text{for} \alpha \geqslant 1\tag{B.29}
$$

$$
\mathbb{E}[\ln \tau] = \psi(a) - \ln b\tag{B.30}
$$

$$
\mathrm{H}[\tau] = \ln \Gamma(a) -(a - 1) \psi(a) - \ln b + a\tag{B.31}
$$

where $\psi(\cdot)$ is the digamma function defined by (B.25). The gamma distribution is the conjugate prior for the precision (inverse variance) of a univariate Gaussian. For $a \geqslant 1$ the density is everywhere finite, and the special case of $a = 1$ is known as the exponential distribution.

## Gaussian

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/03b7e84c75d73db9a5f910c0a8c87665ee30804e0c0c9404dbecaaf67fa4e4a0.jpg)

The Gaussian is the most widely used distribution for continuous variables. It is also known as the normal distribution. In the case of a single variable $x \in(- \infty, \infty)$ it is governed by two parameters, the mean $\mu \in(- \infty, \infty)$ and the variance $\sigma^{2} > 0$

$$
\mathcal{N}(x | \mu, \sigma^{2}) = \frac{1}{(2 \pi \sigma^{2})^{1 / 2}} \exp \left\{- \frac{1}{2 \sigma^{2}}(x - \mu)^{2} \right\}\tag{B.32}
$$

$$
\mathbb{E}[x] = \mu\tag{B.33}
$$

$$
\operatorname{var}[x] = \sigma^{2}\tag{B.34}
$$

$$
\mathrm{mode}[x] = \mu\tag{B.35}
$$

$$
\mathrm{H}[x] = \frac{1}{2} \ln \sigma^{2} + \frac{1}{2}(1 + \ln(2 \pi)).\tag{B.36}
$$

The inverse of the variance $\tau = 1 / \sigma^{2}$ is called the precision, and the square root of the variance $\sigma$ is called the standard deviation. The conjugate prior for $\mu$ is the Gaussian, and the conjugate prior for $\tau$ is the gamma distribution. If both $\mu$ and $\tau$ are unknown, their joint conjugate prior is the Gaussian-gamma distribution.

For a D-dimensional vector , the Gaussian is governed by a D-dimensional mean vector $\pmb{\mu}$ and a $D \times D$ <sup>x</sup>covariance matrix $\pmb{\Sigma}$ that must be symmetric and

positive-definite.

$$
\mathcal{N}(\mathbf{x} | \boldsymbol{\mu}, \boldsymbol{\Sigma}) = \frac{1}{(2 \pi)^{D / 2}} \frac{1}{| \boldsymbol{\Sigma} |^{1 / 2}} \exp \left\{- \frac{1}{2}(\mathbf{x} - \boldsymbol{\mu})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{x} - \boldsymbol{\mu}) \right\}\tag{B.37}
$$

$$
\mathbb{E}[\mathbf{x}] = \boldsymbol{\mu}\tag{B.38}
$$

$$
\operatorname{cov}[\mathbf{x}] = \boldsymbol{\Sigma}\tag{B.39}
$$

$$
\mathrm{mode}[\mathbf{x}] = \boldsymbol{\mu}\tag{B.40}
$$

$$
\mathrm{H}[\mathbf{x}] = \frac{1}{2} \ln | \boldsymbol{\Sigma} | + \frac{D}{2}(1 + \ln(2 \pi)).\tag{B.41}
$$

The inverse of the covariance matrix $\pmb{\Lambda} = \pmb{\Sigma}^{- 1}$ is the precision matrix, which is also symmetric and positive definite. Averages of random variables tend to a Gaussian, by the central limit theorem, and the sum of two Gaussian variables is again Gaussian. The Gaussian is the distribution that maximizes the entropy for a given variance (or covariance). Any linear transformation of a Gaussian random variable is again Gaussian. The marginal distribution of a multivariate Gaussian with respect to a subset of the variables is itself Gaussian, and similarly the conditional distribution is also Gaussian. The conjugate prior for $\pmb{\mu}$ is the Gaussian, the conjugate prior for is the Wishart, and the conjugate prior for $(\mu, \Lambda)$ is the Gaussian-Wishart.

If we have a marginal Gaussian distribution for  and a conditional Gaussian distribution for  given  in the form

$$
{p(\mathbf{x})} ={\mathcal{N}(\mathbf{x} | \boldsymbol{\mu}, \boldsymbol{\Lambda}^{- 1})}\tag{B.42}
$$

$$
p(\mathbf{y} | \mathbf{x}) = \mathcal{N}(\mathbf{y} | \mathbf{Ax} + \mathbf{b}, \mathbf{L}^{- 1})\tag{B.43}
$$

then the marginal distribution of $\mathbf{y}_{\mathrm{:}}$ , and the conditional distribution of given , are given by

$$
p(\mathbf{y}) = \mathcal{N}(\mathbf{y} | \mathbf{A} \boldsymbol{\mu} + \mathbf{b}, \mathbf{L}^{- 1} + \mathbf{A} \boldsymbol{\Lambda}^{- 1} \mathbf{A}^{\mathrm{T}})\tag{B.44}
$$

$$
{p(\mathbf{x} | \mathbf{y})} ={\mathcal{N}(\mathbf{x} | \boldsymbol{\Sigma} \{\mathbf{A}^{\mathrm{T}} \mathbf{L}(\mathbf{y} - \mathbf{b}) + \boldsymbol{\Lambda} \boldsymbol{\mu}\}, \boldsymbol{\Sigma})}\tag{B.45}
$$

where

$$
\boldsymbol{\Sigma} = \left(\boldsymbol{\Lambda} + \mathbf{A}^{\mathrm{T}} \mathbf{L} \mathbf{A}\right)^{- 1}.\tag{B.46}
$$

If we have a joint Gaussian distribution $\mathcal{N}({\bf x} | \mu, \Sigma)$ with $\pmb{\Lambda} \equiv \pmb{\Sigma}^{- 1}$ and we define the following partitions

$$
\mathbf{x} = \binom{\mathbf{x}_{a}}{\mathbf{x}_{b}}, \quad \boldsymbol{\mu} = \binom{\boldsymbol{\mu}_{a}}{\boldsymbol{\mu}_{b}}\tag{B.47}
$$

$$
\boldsymbol{\Sigma} = \left(\begin{array}{cc} \boldsymbol{\Sigma}_{aa} & \boldsymbol{\Sigma}_{ab} \\ \boldsymbol{\Sigma}_{ba} & \boldsymbol{\Sigma}_{bb} \end{array} \right), \quad \boldsymbol{\Lambda} = \left(\begin{array}{cc} \boldsymbol{\Lambda}_{aa} & \boldsymbol{\Lambda}_{ab} \\ \boldsymbol{\Lambda}_{ba} & \boldsymbol{\Lambda}_{bb} \end{array} \right)\tag{B.48}
$$

then the conditional distribution $p(\mathbf{x}_{a} | \mathbf{x}_{b})$ is given by

$$
{p(\mathbf{x}_{a} | \mathbf{x}_{b})} ={\mathcal{N}(\mathbf{x} | \boldsymbol{\mu}_{a | b}, \boldsymbol{\Lambda}_{aa}^{- 1})}\tag{B.49}
$$

$$
{\pmb{\mu}_{a | b}} ={\pmb{\mu}_{a} - \pmb{\Lambda}_{aa}^{- 1} \pmb{\Lambda}_{ab}(\mathbf{x}_{b} - \pmb{\mu}_{b})}\tag{B.50}
$$

and the marginal distribution $p(\mathbf{x}_{a})$ is given by

$$
p(\mathbf{x}_{a}) = \mathcal{N}(\mathbf{x}_{a} | \boldsymbol{\mu}_{a}, \boldsymbol{\Sigma}_{aa}).\tag{B.51}
$$

## Gaussian-Gamma

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/0116aeb60295411a13774de840ab8b51294833fc796010a8a0dfdf2b90ae2a45.jpg)

This is the conjugate prior distribution for a univariate Gaussian $\mathcal{N}(\boldsymbol{x} | \mu, \lambda^{- 1})$ in which the mean $\mu$ and the precision λ are both unknown and is also called the normal-gamma distribution. It comprises the product of a Gaussian distribution for $\mu,$ whose precision is proportional to λ, and a gamma distribution over λ.

$$
p(\mu, \lambda | \mu_{0}, \beta, a, b) = \mathcal{N} \left(\mu | \mu_{o},(\beta \lambda)^{- 1}\right) \operatorname{Gam}(\lambda | a, b).\tag{B.52}
$$

## Gaussian-Wishart

This is the conjugate prior distribution for a multivariate Gaussian $\mathcal{N}(\mathbf{x} | \boldsymbol{\mu}, \mathbf{\Lambda} \mathbf{\Lambda})$ in which both the mean $\pmb{\mu}$ and the precision  are unknown, and is also called the normal-Wishart distribution. It comprises the product of a Gaussian distribution for $\mu,$ whose precision is proportional to , and a Wishart distribution over .

$$
p(\boldsymbol{\mu}, \boldsymbol{\Lambda} | \boldsymbol{\mu}_{0}, \beta, \mathbf{W}, \nu) = \mathcal{N} \left(\boldsymbol{\mu} | \boldsymbol{\mu}_{0},(\beta \boldsymbol{\Lambda})^{- 1}\right) \mathcal{W}(\boldsymbol{\Lambda} | \mathbf{W}, \nu).\tag{B.53}
$$

For the particular case of a scalar x, this is equivalent to the Gaussian-gamma distribution.

## Multinomial

If we generalize the Bernoulli distribution to an K-dimensional binary variable with components $x_{k} \in \{0, 1\}$ such that $\textstyle \sum_{k} x_{k} = 1$ <sup>x</sup>, then we obtain the following discrete distribution

$$
p(\mathbf{x}) = \prod_{k = 1}^{K} \mu_{k}^{x_{k}}\tag{B.54}
$$

$$
\mathbb{E}[x_{k}] = \mu_{k}\tag{B.55}
$$

$$
\operatorname{var}[x_{k}] = \mu_{k}(1 - \mu_{k})\tag{B.56}
$$

$$
{\mathrm{cov}[x_{j} x_{k}]} ={I_{jk} \mu_{k}}\tag{B.57}
$$

$$
\mathrm{H}[\mathbf{x}] = - \sum_{k = 1}^{M} \mu_{k} \ln \mu_{k}\tag{B.58}
$$

where $I_{jk}$ is the $j, k$ element of the identity matrix. Because $p(x_{k} = 1) = \mu_{k}$ , the parameters must satisfy $0 \leqslant \mu_{k} \leqslant 1$ and $\textstyle \sum_{k} \mu_{k} = 1$

The multinomial distribution is a multivariate generalization of the binomial and gives the distribution over counts $m_{k}$ for a K-state discrete variable to be in state k given a total number of observations N.

$$
\text{Mult}(m_{1}, m_{2}, \ldots, m_{K} | \boldsymbol{\mu}, N) = \binom{N}{m_{1} m_{2} \ldots m_{M}} \prod_{k = 1}^{M} \mu_{k}^{m_{k}}\tag{B.59}
$$

$$
\mathbb{E}[m_{k}] = N \mu_{k}\tag{B.60}
$$

$$
{\mathrm{var}[m_{k}]} ={N \mu_{k}(1 - \mu_{k})}\tag{B.61}
$$

$$
\operatorname{cov}[m_{j} m_{k}] = - N \mu_{j} \mu_{k}\tag{B.62}
$$

where $\pmb{\mu} =(\mu_{1}, \ldots, \mu_{K})^{\mathrm{T}}$ , and the quantity

$$
\binom{N}{m_{1} m_{2} \ldots m_{K}} = \frac{N !}{m_{1} ! \ldots m_{K} !}\tag{B.63}
$$

gives the number of ways of taking N identical objects and assigning $m_{k}$ of them to bin k for $k = 1, \ldots, K$ . The value of $\mu_{k}$ gives the probability of the random variable taking state k, and so these parameters are subject to the constraints $0 \leqslant \mu_{k} \leqslant 1$ and $\bar{\sum_{k} \mu_{k}} = 1$ . The conjugate prior distribution for the parameters $\{\mu_{k}\}$ is the Dirichlet.

## Normal

The normal distribution is simply another name for the Gaussian. In this book, we use the term Gaussian throughout, although we retain the conventional use of the symbol $\mathcal{N}$ to denote this distribution. For consistency, we shall refer to the normalgamma distribution as the Gaussian-gamma distribution, and similarly the normal-Wishart is called the Gaussian-Wishart.

## Student’s t

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/02204ec6846d3ff38ea5f2352a35f777e7cce9b13199323bf33c55401b13a775.jpg)

This distribution was published by William Gosset in 1908, but his employer, Guiness Breweries, required him to publish under a pseudonym, so he chose ‘Student’. In the univariate form, Student’s t-distribution is obtained by placing a conjugate gamma prior over the precision of a univariate Gaussian distribution and then integrating out the precision variable. It can therefore be viewed as an infinite mixture of Gaussians having the same mean but different variances.

$$
\operatorname{St}(x | \mu, \lambda, \nu) = \frac{\Gamma(\nu / 2 + 1 / 2)}{\Gamma(\nu / 2)} \left(\frac{\lambda}{\pi \nu}\right)^{1 / 2} \left[1 + \frac{\lambda(x - \mu)^{2}}{\nu} \right]^{- \nu / 2 - 1 / 2}\tag{B.64}
$$

$$
\mathbb{E}[x] = \mu \quad \mathrm{for} \nu > 1\tag{B.65}
$$

$$
\operatorname{var}[x] = \frac{1}{\lambda} \frac{\nu}{\nu - 2} \quad \mathrm{for} \nu > 2\tag{B.66}
$$

$$
\mathrm{mode}[x] = \mu.\tag{B.67}
$$

Here $\nu > 0$ is called the number of degrees of freedom of the distribution. The particular case of $\nu = 1$ is called the Cauchy distribution.

For a D-dimensional variable , Student’s t-distribution corresponds to marginal-<sup>x</sup>izing the precision matrix of a multivariate Gaussian with respect to a conjugate Wishart prior and takes the form

$$
\operatorname{St}(\mathbf{x} | \boldsymbol{\mu}, \boldsymbol{\Lambda}, \nu) = \frac{\Gamma(\nu / 2 + D / 2)}{\Gamma(\nu / 2)} \frac{| \boldsymbol{\Lambda} |^{1 / 2}}{(\nu \pi)^{D / 2}} \left[1 + \frac{\Delta^{2}}{\nu} \right]^{- \nu / 2 - D / 2}\tag{B.68}
$$

$$
\mathbb{E}[\mathbf{x}] = \boldsymbol{\mu} \quad \mathrm{for} \nu > 1\tag{B.69}
$$

$$
\operatorname{cov}[\mathbf{x}] = \frac{\nu}{\nu - 2} \boldsymbol{\Lambda}^{- 1} \quad \text{for} \nu > 2\tag{B.70}
$$

$$
\mathrm{mode}[\mathbf{x}] = \boldsymbol{\mu}\tag{B.71}
$$

where $\Delta^{2}$ is the squared Mahalanobis distance defined by

$$
\Delta^{2} =(\mathbf{x} - \boldsymbol{\mu})^{\mathrm{T}} \boldsymbol{\Lambda}(\mathbf{x} - \boldsymbol{\mu}).\tag{B.72}
$$

In the limit $\nu \to \infty$ , the t-distribution reduces to a Gaussian with mean $\mu$ and precision . Student’s t-distribution provides a generalization of the Gaussian whose <sup>Λ</sup>maximum likelihood parameter values are robust to outliers.

## Uniform

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/fab109dfe4ab57df7a75cb15ab38086ab95cae6550ce2fce99e5cb069e09a612.jpg)

This is a simple distribution for a continuous variable x defined over a finite interval $x \in[a, b]$ where $b > a$

$$
\mathrm{U}(x | a, b) = \frac{1}{b - a}\tag{B.73}
$$

$$
\mathbb{E}[x] = \frac{(b + a)}{2}\tag{B.74}
$$

$$
\operatorname{var}[x] = \frac{(b - a)^{2}}{12}\tag{B.75}
$$

$$
\mathrm{H}[x] = \ln(b - a).\tag{B.76}
$$

If x has distribution $\mathrm{U}(x | 0, 1)$ , then $a +(b - a) x$ will have distribution $\mathrm{U}({\boldsymbol{x}} |{\boldsymbol{a}},{\boldsymbol{b}})$

## Von Mises

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/f108454eff6819456ceefdf0b83da57273a370060be4732ed2ca09a7d3610d87.jpg)

The von Mises distribution, also known as the circular normal or the circular Gaussian, is a univariate Gaussian-like periodic distribution for a variable $\theta \in[0, 2 \pi)$

$$
{p(\theta | \theta_{0}, m)} ={\frac{1}{2 \pi I_{0}(m)} \exp \{m \cos(\theta - \theta_{0})\}}\tag{B.77}
$$

where $I_{0}(m)$ is the zeroth-order Bessel function of the first kind. The distribution has period $2 \pi$ so that $p(\theta + 2 \pi) = p(\theta)$ for all θ. Care must be taken in interpreting this distribution because simple expectations will be dependent on the (arbitrary) choice of origin for the variable θ. The parameter $\theta_{0}$ is analogous to the mean of a univariate Gaussian, and the parameter $m > 0$ , known as the concentration parameter, is analogous to the precision (inverse variance). For large m, the von Mises distribution is approximately a Gaussian centred on $\theta_{0}$

## Wishart

The Wishart distribution is the conjugate prior for the precision matrix of a multivariate Gaussian.

$$
\mathcal{W}(\boldsymbol{\Lambda} | \mathbf{W}, \nu) = B(\mathbf{W}, \nu) | \boldsymbol{\Lambda} |^{(\nu - D - 1) / 2} \exp \left(- \frac{1}{2} \operatorname{Tr} \left(\mathbf{W}^{- 1} \boldsymbol{\Lambda}\right)\right)\tag{B.78}
$$

where

$$
B(\mathbf{W}, \nu) \equiv | \mathbf{W} |^{- \nu / 2} \left(2^{\nu D / 2} \pi^{D(D - 1) / 4} \prod_{i = 1}^{D} \Gamma \left(\frac{\nu + 1 - i}{2}\right)\right)^{- 1}\tag{B.79}
$$

$$
\mathbb{E}[\boldsymbol{\Lambda}] = \nu \mathbf{W}\tag{B.80}
$$

$$
\mathbb{E} \left[\ln | \boldsymbol{\Lambda} | \right] = \sum_{i = 1}^{D} \psi \left(\frac{\nu + 1 - i}{2}\right) + D \ln 2 + \ln | \mathbf{W} |\tag{B.81}
$$

$$
\mathrm{H}[\boldsymbol{\Lambda}] = - \ln B(\mathbf{W}, \nu) - \frac{(\nu - D - 1)}{2} \mathbb{E} \left[\ln | \boldsymbol{\Lambda} | \right] + \frac{\nu D}{2}\tag{B.82}
$$

where is a $D \times D$ symmetric, positive definite matrix, and $\psi(\cdot)$ is the digamma <sup>W</sup>function defined by (B.25). The parameter ν is called the number of degrees of freedom of the distribution and is restricted to $\nu > D - 1$ to ensure that the Gamma function in the normalization factor is well-defined. In one dimension, the Wishart reduces to the gamma distribution ${\mathrm{Gam}}(\lambda | a, b)$ given by (B.26) with parameters $a = \nu / 2$ and $b = 1 / 2W$

## Appendix C. Properties of Matrices

In this appendix, we gather together some useful properties and identities involving matrices and determinants. This is not intended to be an introductory tutorial, and it is assumed that the reader is already familiar with basic linear algebra. For some results, we indicate how to prove them, whereas in more complex cases we leave the interested reader to refer to standard textbooks on the subject. In all cases, we assume that inverses exist and that matrix dimensions are such that the formulae are correctly defined. A comprehensive discussion of linear algebra can be found in Golub and Van Loan (1996), and an extensive collection of matrix properties is given by Lutkepohl (1996). Matrix derivatives are discussed in Magnus and Neudecker¨ (1999).

## Basic Matrix Identities

A matrix has elements $A_{ij}$ where i indexes the rows, and j indexes the columns. We use ${\mathbf{I}}_{N}$ to denote the $N \times N$ identity matrix (also called the unit matrix), and <sup>I</sup>where there is no ambiguity over dimensionality we simply use . The transpose matrix ${\bf A}^{\mathrm{T}}$ has elements $(\mathbf{A}^{\mathrm{T}})_{ij} = A_{ji}$ <sup>I</sup>. From the definition of transpose, we have

$$
(\mathbf{AB})^{\mathrm{T}} = \mathbf{B}^{\mathrm{T}} \mathbf{A}^{\mathrm{T}}\tag{C.1}
$$

which can be verified by writing out the indices. The inverse of , denoted $\mathbf{A}^{- 1}$ satisfies

$$
\mathbf{A} \mathbf{A}^{- 1} = \mathbf{A}^{- 1} \mathbf{A} = \mathbf{I}.\tag{C.2}
$$

Because $\mathbf{A} \mathbf{B} \mathbf{B}^{- 1} \mathbf{A}^{- 1} = \mathbf{I}$ , we have

$$
(\mathbf{AB})^{- 1} = \mathbf{B}^{- 1} \mathbf{A}^{- 1}.\tag{C.3}
$$

Also we have

$$
\left(\mathbf{A}^{\mathrm{T}}\right)^{- 1} = \left(\mathbf{A}^{- 1}\right)^{\mathrm{T}}\tag{C.4}
$$

which is easily proven by taking the transpose of (C.2) and applying (C.1).

A useful identity involving matrix inverses is the following

$$
(\mathbb{P}^{- 1} + \mathbf{B}^{\mathrm{T}} \mathbb{R}^{- 1} \mathbf{B})^{- 1} \mathbf{B}^{\mathrm{T}} \mathbb{R}^{- 1} = \mathbf{PB}^{\mathrm{T}}(\mathbf{BPB}^{\mathrm{T}} + \mathbb{R})^{- 1}.\tag{C.5}
$$

which is easily verified by right multiplying both sides by $(\mathbf{BPB^{\mathrm{T}} + R})$ . Suppose that  has dimensionality $N \times N$ <sup>B</sup>while has dimensionality $M \times M$ <sup>R</sup>, so that is $M \times N$ . Then if $M \ll N$ <sup>R B</sup>, it will be much cheaper to evaluate the right-hand side of (C.5) than the left-hand side. A special case that sometimes arises is

$$
(\mathbf{I} + \mathbf{AB})^{- 1} \mathbf{A} = \mathbf{A}(\mathbf{I} + \mathbf{BA})^{- 1}.\tag{C.6}
$$

Another useful identity involving inverses is the following:

$$
(\mathbf{A} + \mathbf{BD}^{- 1} \mathbf{C})^{- 1} = \mathbf{A}^{- 1} - \mathbf{A}^{- 1} \mathbf{B}(\mathbf{D} + \mathbf{CA}^{- 1} \mathbf{B})^{- 1} \mathbf{CA}^{- 1}\tag{C.7}
$$

which is known as the Woodbury identity and which can be verified by multiplying both sides by $\mathbf{\left(A + BD^{- 1} C \right)}$ This is useful, for instance, when is large and <sup>A BD C A</sup>diagonal, and hence easy to invert, while  has many rows but few columns (and conversely for ) so that the right-hand side is much cheaper to evaluate than the left-hand side.

A set of vectors $\left\{\mathbf{a}_{1}, \ldots, \mathbf{a}_{N} \right\}$ is said to be linearly independent if the relation $\begin{array}{r}{\sum_{n} \alpha_{n} \mathbf{a}_{n} \ = \0} \end{array}$ <sup>a a</sup>holds only if all $\alpha_{n} \ = \0$ . This implies that none of the vectors <sup>a</sup>can be expressed as a linear combination of the remainder. The rank of a matrix is the maximum number of linearly independent rows (or equivalently the maximum number of linearly independent columns).

## Traces and Determinants

Trace and determinant apply to square matrices. The trace $\operatorname{Tr}(\mathbf{A})$ of a matrix <sup>A A</sup>is defined as the sum of the elements on the leading diagonal. By writing out the indices, we see that

$$
\operatorname{Tr}(\mathbf{AB}) = \operatorname{Tr}(\mathbf{BA}).\tag{C.8}
$$

By applying this formula multiple times to the product of three matrices, we see that

$$
\operatorname{Tr}(\mathbf{ABC}) = \operatorname{Tr}(\mathbf{CAB}) = \operatorname{Tr}(\mathbf{BCA})\tag{C.9}
$$

which is known as the cyclic property of the trace operator and which clearly extends to the product of any number of matrices. The determinant $| \mathbf{A} |$ of an $N \times N$ matrix is defined by

$$
| \mathbf{A} | = \sum(\pm 1) A_{1i_{1}} A_{2i_{2}} \dots A_{Ni_{N}}\tag{C.10}
$$

in which the sum is taken over all products consisting of precisely one element from each row and one element from each column, with a coefficient +1 or 1 according to whether the permutation $i_{1} i_{2} \dots i_{N}$ is even or odd, respectively. Note that $| \mathbf{I} | = 1$ Thus, for a $2 \times 2$ matrix, the determinant takes the form

$$
| \mathbf{A} | = \left| \begin{array}{ll} a_{11} & a_{12} \\ a_{21} & a_{22} \end{array} \right| = a_{11} a_{22} - a_{12} a_{21}.\tag{C.11}
$$

The determinant of a product of two matrices is given by

$$
| \mathbf{AB} | = | \mathbf{A} | | \mathbf{B} |\tag{C.12}
$$

as can be shown from (C.10). Also, the determinant of an inverse matrix is given by

$$
\left| \mathbf{A}^{- 1} \right| = \frac{1}{\left| \mathbf{A} \right|}\tag{C.13}
$$

which can be shown by taking the determinant of (C.2) and applying (C.12).

If and are matrices of size $N \times M$ , then

$$
\left| \mathbf{I}_{N} + \mathbf{AB}^{\mathrm{T}} \right| = \left| \mathbf{I}_{M} + \mathbf{A}^{\mathrm{T}} \mathbf{B} \right|.\tag{C.14}
$$

A useful special case is

$$
\left| \mathbf{I}_{N} + \mathbf{ab}^{\mathrm{T}} \right| = 1 + \mathbf{a}^{\mathrm{T}} \mathbf{b}\tag{C.15}
$$

where and are N-dimensional column vectors.

## Matrix Derivatives

Sometimes we need to consider derivatives of vectors and matrices with respect to scalars. The derivative of a vector with respect to a scalar x is itself a vector whose components are given by

$$
\left(\frac{\partial \mathbf{a}}{\partial x}\right)_{i} = \frac{\partial a_{i}}{\partial x}\tag{C.16}
$$

with an analogous definition for the derivative of a matrix. Derivatives with respect to vectors and matrices can also be defined, for instance

$$
\left(\frac{\partial x}{\partial \mathbf{a}}\right)_{i} = \frac{\partial x}{\partial a_{i}}\tag{C.17}
$$

and similarly

$$
\left(\frac{\partial \mathbf{a}}{\partial \mathbf{b}}\right)_{ij} = \frac{\partial a_{i}}{\partial b_{j}}.\tag{C.18}
$$

The following is easily proven by writing out the components

$$
\frac{\partial}{\partial \mathbf{x}} \left(\mathbf{x}^{\mathrm{T}} \mathbf{a}\right) = \frac{\partial}{\partial \mathbf{x}} \left(\mathbf{a}^{\mathrm{T}} \mathbf{x}\right) = \mathbf{a}.\tag{C.19}
$$

Similarly

$$
\frac{\partial}{\partial \mathbf{x}}(\mathbf{AB}) = \frac{\partial \mathbf{A}}{\partial \mathbf{x}} \mathbf{B} + \mathbf{A} \frac{\partial \mathbf{B}}{\partial \mathbf{x}}.\tag{C.20}
$$

The derivative of the inverse of a matrix can be expressed as

$$
\frac{\partial}{\partial x} \left(\mathbf{A}^{- 1}\right) = - \mathbf{A}^{- 1} \frac{\partial \mathbf{A}}{\partial x} \mathbf{A}^{- 1}\tag{C.21}
$$

as can be shown by differentiating the equation $\mathbf{A}^{- 1} \mathbf{A} = \mathbf{I}$ using (C.20) and then right multiplying by ${{\bf A}^{- 1}}$ . Also

$$
\frac{\partial}{\partial x} \ln | \mathbf{A} | = \operatorname{Tr} \left(\mathbf{A}^{- 1} \frac{\partial \mathbf{A}}{\partial x}\right)\tag{C.22}
$$

which we shall prove later. If we choose x to be one of the elements of , we have

$$
\frac{\partial}{\partial A_{ij}} \mathrm{Tr}(\mathbf{AB}) = B_{ji}\tag{C.23}
$$

as can be seen by writing out the matrices using index notation. We can write this result more compactly in the form

$$
\frac{\partial}{\partial \mathbf{A}} \mathrm{Tr}(\mathbf{AB}) = \mathbf{B}^{\mathrm{T}}.\tag{C.24}
$$

With this notation, we have the following properties

$$
\frac{\partial}{\partial \mathbf{A}} \mathrm{Tr} \left(\mathbf{A}^{\mathrm{T}} \mathbf{B}\right) = \mathbf{B}\tag{C.25}
$$

$$
{\frac{\partial}{\partial \mathbf{A}} \mathrm{Tr}(\mathbf{A})} ={\mathbf{I}}\tag{C.26}
$$

$$
\frac{\partial}{\partial \mathbf{A}} \mathrm{Tr}(\mathbf{ABA}^{\mathrm{T}}) = \mathbf{A}(\mathbf{B} + \mathbf{B}^{\mathrm{T}})\tag{C.27}
$$

which can again be proven by writing out the matrix indices. We also have

$$
\frac{\partial}{\partial \mathbf{A}} \ln | \mathbf{A} | =(\mathbf{A}^{- 1})^{\mathrm{T}}\tag{C.28}
$$

which follows from (C.22) and (C.26).

## Eigenvector Equation

For a square matrix of size $M \times M$ , the eigenvector equation is defined by

$$
\mathbf{A} \mathbf{u}_{i} = \lambda_{i} \mathbf{u}_{i}\tag{C.29}
$$

for $i = 1, \dots, M$ , where $\mathbf{u}_{i}$ is an eigenvector and $\lambda_{i}$ is the corresponding eigenvalue. <sup>u</sup>This can be viewed as a set of M simultaneous homogeneous linear equations, and the condition for a solution is that

$$
| \mathbf{A} - \lambda_{i} \mathbf{I} | = 0\tag{C.30}
$$

which is known as the characteristic equation. Because this is a polynomial of order M in $\lambda_{i}.$ , it must have M solutions (though these need not all be distinct). The rank of is equal to the number of nonzero eigenvalues.

Of particular interest are symmetric matrices, which arise as covariance matrices, kernel matrices, and Hessians. Symmetric matrices have the property that $A_{ij} = A_{ji}$ , or equivalently $\mathbf{A}^{\mathrm{T}} = \mathbf{A}$ . The inverse of a symmetric matrix is also sym-<sup>A A</sup>metric, as can be seen by taking the transpose of $\mathbf{A}^{- 1} \dot{\mathbf{A}} = \mathbf{I}$ and using $\mathbf{A} \mathbf{A}^{- 1} = \mathbf{I}$ together with the symmetry of .

In general, the eigenvalues of a matrix are complex numbers, but for symmetric matrices the eigenvalues $\lambda_{i}$ are real. This can be seen by first left multiplying (C.29) by $(\mathbf{u}_{i}^{\star})^{\mathrm{T}}$ , where  denotes the complex conjugate, to give

$$
\left(\mathbf{u}_{i}^{\star}\right)^{\mathrm{T}} \mathbf{Au}_{i} = \lambda_{i} \left(\mathbf{u}_{i}^{\star}\right)^{\mathrm{T}} \mathbf{u}_{i}.\tag{C.31}
$$

Next we take the complex conjugate of (C.29) and left multiply by ${\mathbf{u}}_{i}^{\mathrm{T}}$ to give

$$
\mathbf{u}_{i}^{\mathrm{T}} \mathbf{A} \mathbf{u}_{i}^{\star} = \lambda_{i}^{\star} \mathbf{u}_{i}^{\mathrm{T}} \mathbf{u}_{i}^{\star}.\tag{C.32}
$$

where we have used $\mathbf{A}^{\star} = \mathbf{A}$ because we consider only real matrices . Taking the transpose of the second of these equations, and using $\mathbf{A}^{\mathrm{T}} = \mathbf{A}$ <sup>A</sup>, we see that the <sup>A</sup>left-hand sides of the two equations are equal, and hence that $\lambda_{i}^{\star} = \lambda_{i}$ and so $\lambda_{i}$ must be real.

The eigenvectors $\mathbf{u}_{i}$ of a real symmetric matrix can be chosen to be orthonormal <sup>u</sup>(i.e., orthogonal and of unit length) so that

$$
\mathbf{u}_{i}^{\mathrm{T}} \mathbf{u}_{j} = I_{ij}\tag{C.33}
$$

where $I_{ij}$ are the elements of the identity matrix . To show this, we first left multiply (C.29) by $\mathbf{u}_{j}^{\mathrm{T}}$ to give

$$
\mathbf{u}_{j}^{\mathrm{T}} \mathbf{A} \mathbf{u}_{i} = \lambda_{i} \mathbf{u}_{j}^{\mathrm{T}} \mathbf{u}_{i}\tag{C.34}
$$

and hence, by exchange of indices, we have

$$
\mathbf{u}_{i}^{\mathrm{T}} \mathbf{A} \mathbf{u}_{j} = \lambda_{j} \mathbf{u}_{i}^{\mathrm{T}} \mathbf{u}_{j}.\tag{C.35}
$$

We now take the transpose of the second equation and make use of the symmetry property $\mathbf{A}^{\mathrm{T}} = \mathbf{A}$ , and then subtract the two equations to give

$$
\left(\lambda_{i} - \lambda_{j}\right) \mathbf{u}_{i}^{\mathrm{T}} \mathbf{u}_{j} = 0.\tag{C.36}
$$

Hence, for $\lambda_{i} \neq \lambda_{j}$ , we have $\mathbf{u}_{i}^{\mathrm{T}} \mathbf{u}_{j} = 0$ , and hence $\mathbf{u}_{i}$ and $\mathbf{u}_{j}$ are orthogonal. If the two eigenvalues are equal, then any linear combination $\alpha \mathbf{u}_{i} + \beta \mathbf{u}_{j}$ is also an eigenvector with the same eigenvalue, so we can select one linear combination arbitrarily, and then choose the second to be orthogonal to the first (it can be shown that the degenerate eigenvectors are never linearly dependent). Hence the eigenvectors can be chosen to be orthogonal, and by normalizing can be set to unit length. Because there are M eigenvalues, the corresponding M orthogonal eigenvectors form a complete set and so any M-dimensional vector can be expressed as a linear combination of the eigenvectors.

We can take the eigenvectors $\mathbf{u}_{i}$ to be the columns of an $M \times M$ matrix , which from orthonormality satisfies

$$
\mathbf{U}^{\mathrm{T}} \mathbf{U} = \mathbf{I}.\tag{C.37}
$$

Such a matrix is said to be orthogonal. Interestingly, the rows of this matrix are also orthogonal, so that $\mathbf{U} \mathbf{U}^{\mathrm{T}} = \mathbf{I}$ . To show this, note that (C.37) implies $\begin{array}{r}{{\bf U}^{\mathrm{T}}{\bf U}{\bf U}^{- 1} = \qquad} \end{array}$ $\mathbf{U}^{- 1} = \mathbf{U}^{\mathrm{T}}$ and so $\mathbf{UU}^{- 1} = \mathbf{UU}^{\mathrm{T}} = \mathbf{I}.$ . Using (C.12), it also follows that $| \mathbf{U} | = 1$ <sup>U UU UU I U</sup>The eigenvector equation (C.29) can be expressed in terms of in the form

$$
\mathbf{A} \mathbf{U} = \mathbf{U} \boldsymbol{\Lambda}\tag{C.38}
$$

where  is an $M \times M$ diagonal matrix whose diagonal elements are given by the <sup>Λ</sup>eigenvalues $\lambda_{i}$

If we consider a column vector that is transformed by an orthogonal matrix to give a new vector

$$
\widetilde{\mathbf{x}} = \mathbf{U} \mathbf{x}\tag{C.39}
$$

then the length of the vector is preserved because

$$
\widetilde{\mathbf{x}}^{\mathrm{T}} \widetilde{\mathbf{x}} = \mathbf{x}^{\mathrm{T}} \mathbf{U}^{\mathrm{T}} \mathbf{U} \mathbf{x} = \mathbf{x}^{\mathrm{T}} \mathbf{x}\tag{C.40}
$$

and similarly the angle between any two such vectors is preserved because

$$
\widetilde{\mathbf{x}}^{\mathrm{T}} \widetilde{\mathbf{y}} = \mathbf{x}^{\mathrm{T}} \mathbf{U}^{\mathrm{T}} \mathbf{U} \mathbf{y} = \mathbf{x}^{\mathrm{T}} \mathbf{y}.\tag{C.41}
$$

Thus, multiplication by can be interpreted as a rigid rotation of the coordinate system.

From (C.38), it follows that

$$
\mathbf{U}^{\mathrm{T}} \mathbf{A} \mathbf{U} = \boldsymbol{\Lambda}\tag{C.42}
$$

and because is a diagonal matrix, we say that the matrix is diagonalized by the <sup>Λ</sup>matrix . If we left multiply by  and right multiply by $\mathbf{U}^{\mathrm{T}}$ , we obtain

$$
\mathbf{A} = \mathbf{U} \boldsymbol{\Lambda} \mathbf{U}^{\mathrm{T}}\tag{C.43}
$$

Taking the inverse of this equation, and using (C.3) together with $\mathbf{U}^{- 1} = \mathbf{U}^{\mathrm{T}}$ , we have

$$
\mathbf{A}^{- 1} = \mathbf{U} \boldsymbol{\Lambda}^{- 1} \mathbf{U}^{\mathrm{T}}.\tag{C.44}
$$

These last two equations can also be written in the form

$$
\mathbf{A} = \sum_{i = 1}^{M} \lambda_{i} \mathbf{u}_{i} \mathbf{u}_{i}^{\mathrm{T}}\tag{C.45}
$$

$$
\mathbf{A}^{- 1} = \sum_{i = 1}^{M} \frac{1}{\lambda_{i}} \mathbf{u}_{i} \mathbf{u}_{i}^{\mathrm{T}}.\tag{C.46}
$$

If we take the determinant of (C.43), and use (C.12), we obtain

$$
| \mathbf{A} | = \prod_{i = 1}^{M} \lambda_{i}.\tag{C.47}
$$

Similarly, taking the trace of (C.43), and using the cyclic property (C.8) of the trace operator together with $\mathbf{U}^{\mathrm{T}} \mathbf{U} = \mathbf{I}$ , we have

$$
\operatorname{Tr}(\mathbf{A}) = \sum_{i = 1}^{M} \lambda_{i}.\tag{C.48}
$$

We leave it as an exercise for the reader to verify (C.22) by making use of the results (C.33), (C.45), (C.46), and (C.47).

A matrix is said to be positive definite, denoted by $\mathbf A \succ 0$ , if $\mathbf{w}^{\mathrm{T}} \mathbf{A} \mathbf{w} > 0$ for <sup>A A w</sup>all values of the vector . Equivalently, a positive definite matrix has $\lambda_{i} > 0$ for all <sup>w</sup>of its eigenvalues (as can be seen by setting  to each of the eigenvectors in turn, and by noting that an arbitrary vector can be expanded as a linear combination of the eigenvectors). Note that positive definite is not the same as all the elements being positive. For example, the matrix

$$
\left(\begin{array}{cc} 1 & 2 \\ 3 & 4 \end{array} \right)\tag{C.49}
$$

has eigenvalues $\lambda_{1} \simeq 5.37$ and $\lambda_{2} \simeq - 0.37$ . A matrix is said to be positive semidefinite if $\mathbf{w}^{\mathrm{T}} \mathbf{A} \mathbf{w} \ \geqslant \0$ holds for all values of , which is denoted $\textbf{A} \succeq 0$ , and is equivalent to $\lambda_{i} \geqslant 0$

## Appendix D. Calculus of Variations

We can think of a function $y(x)$ as being an operator that, for any input value $x,$ returns an output value $y.$ In the same way, we can define a functional $F[y]$ to be an operator that takes a function $y(x)$ and returns an output value $F.$ . An example of a functional is the length of a curve drawn in a two-dimensional plane in which the path of the curve is defined in terms of a function. In the context of machine learning, a widely used functional is the entropy $\mathrm{H}[x]$ for a continuous variable x because, for any choice of probability density function $p(x)$ , it returns a scalar value representing the entropy of x under that density. Thus the entropy of $p(x)$ could equally well have been written as $\mathrm{H}[p]$

A common problem in conventional calculus is to find a value of $x$ that maximizes (or minimizes) a function $y(x)$ . Similarly, in the calculus of variations we seek a function $y(x)$ that maximizes (or minimizes) a functional $F[y]$ . That is, of all possible functions $y(x)$ , we wish to find the particular function for which the functional $F[y]$ is a maximum (or minimum). The calculus of variations can be used, for instance, to show that the shortest path between two points is a straight line or that the maximum entropy distribution is a Gaussian.

If we weren’t familiar with the rules of ordinary calculus, we could evaluate a conventional derivative $d y /$ dx by making a small change  to the variable x and then expanding in powers of , so that

$$
y(x + \epsilon) = y(x) + \frac{d y}{d x} \epsilon + O(\epsilon^{2})\tag{D.1}
$$

and finally taking the limit $\epsilon 0.$ . Similarly, for a function of several variables $y(x_{1}, \ldots, x_{D})$ , the corresponding partial derivatives are defined by

$$
y(x_{1} + \epsilon_{1}, \dots, x_{D} + \epsilon_{D}) = y(x_{1}, \dots, x_{D}) + \sum_{i = 1}^{D} \frac{\partial y}{\partial x_{i}} \epsilon_{i} + O(\epsilon^{2}).\tag{D.2}
$$

The analogous definition of a functional derivative arises when we consider how much a functional $F[y]$ changes when we make a small change $\epsilon \eta(x)$ to the function

Figure D.1 A functional derivative can be defined by considering how the value of a functional $F[y]$ changes when the function $y(x)$ is changed to $y(x) + \epsilon \eta(x)$ where $\eta(x)$ is an arbitrary function of x.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/3e1baf02dcab67515678b35a9c5cbb9870b249503de007ebf3693057c4ff58bb.jpg)

$y(x)$ , where $\eta(x)$ is an arbitrary function of $x,$ , as illustrated in Figure D.1. We denote the functional derivative of $E[f]$ with respect to $f(x)$ by $\delta F / \delta f(x)$ , and define it by the following relation:

$$
F[y(x) + \epsilon \eta(x)] = F[y(x)] + \epsilon \int{\frac{\delta F}{\delta y(x)}} \eta(x) d x + O(\epsilon^{2}).\tag{D.3}
$$

This can be seen as a natural extension of (D.2) in which $F[y]$ now depends on a continuous set of variables, namely the values of $y$ at all points x. Requiring that the functional be stationary with respect to small variations in the function $y(x)$ gives

$$
\int{\frac{\delta E}{\delta y(x)}} \eta(x) d x = 0.\tag{D.4}
$$

Because this must hold for an arbitrary choice of $\eta(x)$ , it follows that the functional derivative must vanish. To see this, imagine choosing a perturbation $\eta(x)$ that is zero everywhere except in the neighbourhood of a point ${\widehat{x}},$ in which case the functional derivative must be zero at $x ={\widehat{x}}$ However, because this must be true for every choice of ${\widehat{x}}.$ , the functional derivative must vanish for all values of $x.$

Consider a functional that is defined by an integral over a function $G(y, y^{\prime}, x)$ that depends on both $y(x)$ and its derivative $y^{\prime}(x)$ as well as having a direct dependence on x

$$
F[y] = \int G(y(x), y^{\prime}(x), x) d x\tag{D.5}
$$

where the value of $y(x)$ is assumed to be fixed at the boundary of the region of integration (which might be at infinity). If we now consider variations in the function $y(x)$ , we obtain

$$
F[y(x) + \epsilon \eta(x)] = F[y(x)] + \epsilon \int \left\{\frac{\partial G}{\partial y} \eta(x) + \frac{\partial G}{\partial y^{\prime}} \eta^{\prime}(x) \right\} dx + O(\epsilon^{2}).\tag{D.6}
$$

We now have to cast this in the form (D.3). To do so, we integrate the second term by parts and make use of the fact that $\eta(x)$ must vanish at the boundary of the integral (because $y(x)$ is fixed at the boundary). This gives

$$
F[y(x) + \epsilon \eta(x)] = F[y(x)] + \epsilon \int \left\{\frac{\partial G}{\partial y} - \frac{d}{d x} \left(\frac{\partial G}{\partial y^{\prime}}\right) \right\} \eta(x) d x + O(\epsilon^{2})\tag{D.7}
$$

from which we can read off the functional derivative by comparison with (D.3). Requiring that the functional derivative vanishes then gives

$$
\frac{\partial G}{\partial y} - \frac{d}{d x} \left(\frac{\partial G}{\partial y^{\prime}}\right) = 0\tag{D.8}
$$

which are known as the Euler-Lagrange equations. For example, if

$$
G = y(x)^{2} + \left(y^{\prime}(x)\right)^{2}\tag{D.9}
$$

then the Euler-Lagrange equations take the form

$$
y(x) - \frac{d^{2} y}{d x^{2}} = 0.\tag{D.10}
$$

This second order differential equation can be solved for $y(x)$ by making use of the boundary conditions on $y(x)$

Often, we consider functionals defined by integrals whose integrands take the form $G(y, x)$ and that do not depend on the derivatives of $y(x)$ . In this case, stationarity simply requires that $\partial G / \partial y(x) = 0$ for all values of $x$ .

If we are optimizing a functional with respect to a probability distribution, then we need to maintain the normalization constraint on the probabilities. This is often most conveniently done using a Lagrange multiplier, which then allows an unconstrained optimization to be performed.

The extension of the above results to a multidimensional variable is straight-<sup>x</sup>forward. For a more comprehensive discussion of the calculus of variations, see Sagan (1969).

## Appendix E. Lagrange Multipliers

Lagrange multipliers, also sometimes called undetermined multipliers, are used to find the stationary points of a function of several variables subject to one or more constraints.

Consider the problem of finding the maximum of a function $f(x_{1}, x_{2})$ subject to a constraint relating $x_{1}$ and $x_{2}$ , which we write in the form

$$
g(x_{1}, x_{2}) = 0.\tag{E.1}
$$

One approach would be to solve the constraint equation (E.1) and thus express $x_{2}$ as a function of $x_{1}$ in the form $x_{2} = h(x_{1})$ . This can then be substituted into $f(x_{1}, x_{2})$ to give a function of $x_{1}$ alone of the form $f(x_{1}, h(x_{1}))$ . The maximum with respect to $x_{1}$ could then be found by differentiation in the usual way, to give the stationary value $x_{1}^{\star}$ , with the corresponding value of $x_{2}$ given by $x_{2}^{\star} = h(x_{1}^{\star})$

One problem with this approach is that it may be difficult to find an analytic solution of the constraint equation that allows $x_{2}$ to be expressed as an explicit function of $x_{1}$ . Also, this approach treats $x_{1}$ and $x_{2}$ differently and so spoils the natural symmetry between these variables.

A more elegant, and often simpler, approach is based on the introduction of a parameter λ called a Lagrange multiplier. We shall motivate this technique from a geometrical perspective. Consider a D-dimensional variable  with components $x_{1}, \ldots, x_{D}$ . The constraint equation $g(\mathbf{x}) = 0$ then represents a $(D - 1)$ -dimensional <sup>x</sup>surface in -space as indicated in Figure E.1.

<sup>x</sup>We first note that at any point on the constraint surface the gradient $\nabla g(\mathbf{x})$ of the constraint function will be orthogonal to the surface. To see this, consider a point that lies on the constraint surface, and consider a nearby point $\mathbf{x} + \epsilon$ that also lies <sup>x</sup>on the surface. If we make a Taylor expansion around , we have

$$
g(\mathbf{x} + \boldsymbol{\epsilon}) \simeq g(\mathbf{x}) + \boldsymbol{\epsilon}^{\mathrm{T}} \nabla g(\mathbf{x}).\tag{E.2}
$$

Because both and $\mathbf{x} + \epsilon$ lie on the constraint surface, we have $g(\mathbf{x}) = g(\mathbf{x} + \epsilon)$ and hence $\epsilon^{\mathrm{T}} \nabla g(\mathbf{x}) \simeq 0$ <sup>x</sup>. In the limit $\| \epsilon \| 0$ we have $\epsilon^{\mathrm{T}} \nabla g(\mathbf{x}) \bar{=} \mathrm{~ 0 ~}$ <sup>x</sup>, and because  is

Figure E.1 A geometrical picture of the technique of Lagrange multipliers in which we seek to maximize a function $f(\mathbf{x})$ , subject to the constraint $g(\mathbf{x}) = 0$ If x is D dimensional, the constraint $g(\mathbf{x}) = 0$ corresponds to a subspace of dimensionality $D - 1$ indicated by the red curve. The problem can be solved by optimizing the Lagrangian function $L(\mathbf{x}, \lambda) = f(\mathbf{x}) \dot{+} \lambda g(\mathbf{x})$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/35c1f71553fb694da6ea8eb18aa53943c3a7383e487468fd44a61445a74ec447.jpg)

then parallel to the constraint surface $g(\mathbf{x}) = 0$ , we see that the vector $\nabla g$ is normal to the surface.

Next we seek a point $\mathbf{x}^{\star}$ on the constraint surface such that $f(\mathbf{x})$ is maximized. Such a point must have the property that the vector $\nabla f(\mathbf{x})$ <sup>x</sup>is also orthogonal to the constraint surface, as illustrated in Figure E.1, because otherwise we could increase the value of $f(\mathbf{x})$ by moving a short distance along the constraint surface. Thus $\nabla f$ and $\nabla g$ <sup>x</sup>are parallel (or anti-parallel) vectors, and so there must exist a parameter λ such that

$$
\nabla f + \lambda \nabla g = 0\tag{E.3}
$$

where $\lambda \neq 0$ is known as a Lagrange multiplier. Note that λ can have either sign.

At this point, it is convenient to introduce the Lagrangian function defined by

$$
L(\mathbf{x}, \lambda) \equiv f(\mathbf{x}) + \lambda g(\mathbf{x}).\tag{E.4}
$$

The constrained stationarity condition (E.3) is obtained by setting $\nabla_{\mathbf x} L = 0$ . Furthermore, the condition $\partial{\cal L} / \partial \lambda = 0$ leads to the constraint equation $g(\mathbf{x}) = 0$

Thus to find the maximum of a function $f(\mathbf{x})$ subject to the constraint $g(\mathbf{x}) = 0$ we define the Lagrangian function given by (E.4) and we then find the stationary point of $L(\mathbf{x}, \lambda)$ with respect to both and λ. For a D-dimensional vector , this gives $D + 1$ equations that determine both the stationary point $\mathbf{x}^{\star}$ and the value of λ. If we are only interested in $\mathbf{x}^{\star}$ <sup>x</sup>, then we can eliminate λ from the stationarity equations without needing to find its value (hence the term ‘undetermined multiplier’).

As a simple example, suppose we wish to find the stationary point of the function $f(x_{1}, x_{2}) = \overset{\cdot}{1} - x_{1}^{2} - \overset{\cdot}{x}_{2}^{2}$ subject to the constraint $g(x_{1}, x_{2}) = x_{1} + x_{2} - 1 = 0$ , as illustrated in Figure E.2. The corresponding Lagrangian function is given by

$$
L(\mathbf{x}, \lambda) = 1 - x_{1}^{2} - x_{2}^{2} + \lambda(x_{1} + x_{2} - 1).\tag{E.5}
$$

The conditions for this Lagrangian to be stationary with respect to $x_{1}, x_{2}$ , and λ give the following coupled equations:

$$
- 2x_{1} + \lambda = 0\tag{E.6}
$$

$$
- 2x_{2} + \lambda = 0\tag{E.7}
$$

$$
x_{1} + x_{2} - 1 = 0.\tag{E.8}
$$

Figure E.2 A simple example of the use of Lagrange multipliers in which the aim is to maximize $f(x_{1}, x_{2}) ~ =$ $1 - x_{1}^{2} - x_{2}^{2}$ subject to the constraint $g(x_{1}, x_{2}) = 0$ where $g(x_{1}, x_{2}) = x_{1} + x_{2} - 1$ . The circles show contours of the function $f(x_{1}, x_{2})$ , and the diagonal line shows the constraint surface $g(x_{1}, x_{2}) = \bar{0}$  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/2f6aacde4275d80a2b681948ef564e7833e649ff80d7747ad7f608e840760278.jpg)

Solution of these equations then gives the stationary point as $\begin{array}{r}{(x_{1}^{\star}, x_{2}^{\star}) =(\frac{1}{2}, \frac{1}{2})} \end{array}$ , and the corresponding value for the Lagrange multiplier is $\lambda = 1$

So far, we have considered the problem of maximizing a function subject to an equality constraint of the form $g(\mathbf{x}) = 0$ . We now consider the problem of maximizing $f(\mathbf{x})$ <sup>x</sup>subject to an inequality constraint of the form $g(\mathbf{x}) \geqslant 0$ , as illustrated in Figure E.3.

There are now two kinds of solution possible, according to whether the constrained stationary point lies in the region where $g(\mathbf{x}) > 0$ , in which case the constraint is inactive, or whether it lies on the boundary $g(\mathbf{x}) = 0$ , in which case the <sup>x</sup>constraint is said to be active. In the former case, the function $g(\mathbf{x})$ plays no role and so the stationary condition is simply $\nabla f(\mathbf{x}) = 0$ <sup>x</sup>. This again corresponds to a stationary point of the Lagrange function (E.4) but this time with $\lambda = 0$ . The latter case, where the solution lies on the boundary, is analogous to the equality constraint discussed previously and corresponds to a stationary point of the Lagrange function (E.4) with $\lambda \neq 0$ . Now, however, the sign of the Lagrange multiplier is crucial, because the function $f(\mathbf{x})$ will only be at a maximum if its gradient is oriented away from the region $g(\mathbf{x}) > 0$ , as illustrated in Figure E.3. We therefore have $\nabla f(\mathbf{x}) = - \lambda \nabla g(\mathbf{x})$ for some value of $\lambda > 0$

<sup>x x</sup>For either of these two cases, the product $\lambda g(\mathbf{x}) = 0$ . Thus the solution to the problem of maximizing $f(\mathbf{x})$ subject to $g(\mathbf{x}) ~ \geqslant ~ 0$ is obtained by optimizing the Lagrange function (E.4) with respect to and λ subject to the conditions

Figure E.3 Illustration of the problem of maximizing $f(\mathbf{x})$ subject to the inequality constraint $g(\mathbf{x}) \geqslant 0$  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/2eaf4cd598f06263c53499bd59a92fa3924926205816ea8a7b9590cccb0ca843.jpg)

$$
g(\mathbf{x}) \geqslant 0
$$

$$
\lambda \geqslant 0\tag{E.9}
$$

$$
\lambda g(\mathbf{x}) = 0\tag{E.10}
$$

(E.11)

These are known as the Karush-Kuhn-Tucker (KKT) conditions (Karush, 1939; Kuhn and Tucker, 1951).

Note that if we wish to minimize (rather than maximize) the function $f(\mathbf{x})$ subject to an inequality constraint $g(\mathbf{x}) \geqslant 0$ <sup>x</sup>, then we minimize the Lagrangian function $L(\mathbf{x}, \lambda) = f(\mathbf{\bar{x}}) - \lambda g(\mathbf{x})$ with respect to , again subject to $\lambda \geqslant 0$

<sup>x x x</sup>Finally, it is straightforward to extend the technique of Lagrange multipliers to the case of multiple equality and inequality constraints. Suppose we wish to maximize $f(\mathbf{x})$ subject to $g_{j}(\mathbf{x}) = 0 \operatorname{for} j = 1, \ldots, J.$ and $h_{k}({\bf x}) \geqslant 0$ for $k = 1, \ldots, K$ <sup>x x</sup>We then introduce Lagrange multipliers $\{\lambda_{j}\}$ and $\{\mu_{k}\}$ , and then optimize the Lagrangian function given by

$$
L(\mathbf{x}, \{\lambda_{j}\}, \{\mu_{k}\}) = f(\mathbf{x}) + \sum_{j = 1}^{J} \lambda_{j} g_{j}(\mathbf{x}) + \sum_{k = 1}^{K} \mu_{k} h_{k}(\mathbf{x})\tag{E.12}
$$

subject to $\mu_{k} \geqslant 0$ and $\mu_{k} h_{k}({\bf x}) = 0$ for $k = 1, \ldots, K$ . Extensions to constrained <sup>x</sup>functional derivatives are similarly straightforward. For a more detailed discussion of the technique of Lagrange multipliers, see Nocedal and Wright (1999).

## References

Abramowitz, M. and I. A. Stegun (1965). Handbook of Mathematical Functions. Dover.

Adler, S. L. (1981). Over-relaxation method for the Monte Carlo evaluation of the partition function for multiquadratic actions. Physical Review D 23, 2901–2904.

Ahn, J. H. and J. H. Oh (2003). A constrained EM algorithm for principal component analysis. Neural Computation 15(1), 57–65.

Aizerman, M. A., E. M. Braverman, and L. I. Rozonoer (1964). The probability problem of pattern recognition learning and the method of potential functions. Automation and Remote Control 25, 1175–1190.

Akaike, H. (1974). A new look at statistical model identification. IEEE Transactions on Automatic Control 19, 716–723.

Ali, S. M. and S. D. Silvey (1966). A general class of coefficients of divergence of one distribution from another. Journal of the Royal Statistical Society, B 28(1), 131–142.

Allwein, E. L., R. E. Schapire, and Y. Singer (2000). Reducing multiclass to binary: a unifying approach for margin classifiers. Journal of Machine Learning Research 1, 113–141.

Amari, S. (1985). Differential-Geometrical Methods in Statistics. Springer.

Amari, S., A. Cichocki, and H. H. Yang (1996). A new learning algorithm for blind signal separation. In D. S. Touretzky, M. C. Mozer, and M. E. Hasselmo (Eds.), Advances in Neural Information Processing Systems, Volume 8, pp. 757–763. MIT Press.

Amari, S. I. (1998). Natural gradient works efficiently in learning. Neural Computation 10, 251–276.

Anderson, J. A. and E. Rosenfeld (Eds.) (1988). Neurocomputing: Foundations of Research. MIT Press.

Anderson, T. W. (1963). Asymptotic theory for principal component analysis. Annals of Mathematical Statistics 34, 122–148.

Andrieu, C., N. de Freitas, A. Doucet, and M. I. Jordan (2003). An introduction to MCMC for machine learning. Machine Learning 50, 5–43.

Anthony, M. and N. Biggs (1992). An Introduction to Computational Learning Theory. Cambridge University Press.

Attias, H. (1999a). Independent factor analysis. Neural Computation 11(4), 803–851.

Attias, H. (1999b). Inferring parameters and structure of latent variable models by variational Bayes. In K. B. Laskey and H. Prade (Eds.),

Uncertainty in Artificial Intelligence: Proceedings of the Fifth Conference, pp. 21–30. Morgan Kaufmann.

Bach, F. R. and M. I. Jordan (2002). Kernel independent component analysis. Journal of Machine Learning Research 3, 1–48.

Bakir, G. H., J. Weston, and B. Scholkopf (2004).¨ Learning to find pre-images. In S. Thrun, L. K. Saul, and B. Scholkopf (Eds.),¨ Advances in Neural Information Processing Systems, Volume 16, pp. 449–456. MIT Press.

Baldi, P. and S. Brunak (2001). Bioinformatics: The Machine Learning Approach (Second ed.). MIT Press.

Baldi, P. and K. Hornik (1989). Neural networks and principal component analysis: learning from examples without local minima. Neural Networks 2(1), 53–58.

Barber, D. and C. M. Bishop (1997). Bayesian model comparison by Monte Carlo chaining. In M. Mozer, M. Jordan, and T. Petsche (Eds.), Advances in Neural Information Processing Systems, Volume 9, pp. 333–339. MIT Press.

Barber, D. and C. M. Bishop (1998a). Ensemble learning for multi-layer networks. In M. I. Jordan, K. J. Kearns, and S. A. Solla (Eds.), Advances in Neural Information Processing Systems, Volume 10, pp. 395–401.

Barber, D. and C. M. Bishop (1998b). Ensemble learning in Bayesian neural networks. In C. M. Bishop (Ed.), Generalization in Neural Networks and Machine Learning, pp. 215–237. Springer.

Bartholomew, D. J. (1987). Latent Variable Models and Factor Analysis. Charles Griffin.

Basilevsky, A. (1994). Statistical Factor Analysis and Related Methods: Theory and Applications. Wiley.

Bather, J. (2000). Decision Theory: An Introduction to Dynamic Programming and Sequential Decisions. Wiley.

Baudat, G. and F. Anouar (2000). Generalized discriminant analysis using a kernel approach. Neural Computation 12(10), 2385–2404.

Baum, L. E. (1972). An inequality and associated maximization technique in statistical estimation of probabilistic functions of Markov processes. Inequalities 3, 1–8.

Becker, S. and Y. Le Cun (1989). Improving the convergence of back-propagation learning with second order methods. In D. Touretzky, G. E. Hinton, and T. J. Sejnowski (Eds.), Proceedings of the 1988 Connectionist Models Summer School, pp. 29–37. Morgan Kaufmann.

Bell, A. J. and T. J. Sejnowski (1995). An information maximization approach to blind separation and blind deconvolution. Neural Computation 7(6), 1129–1159.

Bellman, R. (1961). Adaptive Control Processes: A Guided Tour. Princeton University Press.

Bengio, Y. and P. Frasconi (1995). An input output HMM architecture. In G. Tesauro, D. S. Touretzky, and T. K. Leen (Eds.), Advances in Neural Information Processing Systems, Volume 7, pp. 427–434. MIT Press.

Bennett, K. P. (1992). Robust linear programming discrimination of two linearly separable sets. Optimization Methods and Software 1, 23–34.

Berger, J. O. (1985). Statistical Decision Theory and Bayesian Analysis (Second ed.). Springer.

Bernardo, J. M. and A. F. M. Smith (1994). Bayesian Theory. Wiley.

Berrou, C., A. Glavieux, and P. Thitimajshima (1993). Near Shannon limit error-correcting coding and decoding: Turbo-codes (1). In Proceedings ICC’93, pp. 1064–1070.

Besag, J. (1974). On spatio-temporal models and Markov fields. In Transactions of the 7th Prague Conference on Information Theory, Statistical Decision Functions and Random Processes, pp. 47–75. Academia.

Besag, J. (1986). On the statistical analysis of dirty pictures. Journal of the Royal Statistical Society B-48, 259–302.

Besag, J., P. J. Green, D. Hidgon, and K. Megersen (1995). Bayesian computation and stochastic systems. Statistical Science 10(1), 3–66.

Bishop, C. M. (1991). A fast procedure for retraining the multilayer perceptron. International Journal of Neural Systems 2(3), 229–236.

Bishop, C. M. (1992). Exact calculation of the Hessian matrix for the multilayer perceptron. Neural Computation 4(4), 494–501.

Bishop, C. M. (1993). Curvature-driven smoothing: a learning algorithm for feedforward networks. IEEE Transactions on Neural Networks 4(5), 882–884.

Bishop, C. M. (1994). Novelty detection and neural network validation. IEE Proceedings: Vision, Image and Signal Processing 141(4), 217–222. Special issue on applications of neural networks.

Bishop, C. M. (1995a). Neural Networks for Pattern Recognition. Oxford University Press.

Bishop, C. M. (1995b). Training with noise is equivalent to Tikhonov regularization. Neural Computation 7(1), 108–116.

Bishop, C. M. (1999a). Bayesian PCA. In M. S. Kearns, S. A. Solla, and D. A. Cohn (Eds.), Advances in Neural Information Processing Systems, Volume 11, pp. 382–388. MIT Press.

Bishop, C. M. (1999b). Variational principal components. In Proceedings Ninth International Conference on Artificial Neural Networks, ICANN’99, Volume 1, pp. 509–514. IEE.

Bishop, C. M. and G. D. James (1993). Analysis of multiphase flows using dual-energy gamma densitometry and neural networks. Nuclear Instruments and Methods in Physics Research A327, 580–593.

Bishop, C. M. and I. T. Nabney (1996). Modelling conditional probability distributions for periodic variables. Neural Computation 8(5), 1123–1133.

Bishop, C. M. and I. T. Nabney (2008). Pattern Recognition and Machine Learning: A Matlab Companion. Springer. In preparation.

Bishop, C. M., D. Spiegelhalter, and J. Winn (2003). VIBES: A variational inference engine for Bayesian networks. In S. Becker, S. Thrun, and K. Obermeyer (Eds.), Advances in Neural

Information Processing Systems, Volume 15, pp. 793–800. MIT Press.

Bishop, C. M. and M. Svensen (2003). Bayesian hi-´ erarchical mixtures of experts. In U. Kjaerulff and C. Meek (Eds.), Proceedings Nineteenth Conference on Uncertainty in Artificial Intelligence, pp. 57–64. Morgan Kaufmann.

Bishop, C. M., M. Svensen, and G. E. Hinton ´ (2004). Distinguishing text from graphics in online handwritten ink. In F. Kimura and H. Fujisawa (Eds.), Proceedings Ninth International Workshop on Frontiers in Handwriting Recognition, IWFHR-9, Tokyo, Japan, pp. 142–147.

Bishop, C. M., M. Svensen, and C. K. I. Williams ´ (1996). EM optimization of latent variable density models. In D. S. Touretzky, M. C. Mozer, and M. E. Hasselmo (Eds.), Advances in Neural Information Processing Systems, Volume 8, pp. 465–471. MIT Press.

Bishop, C. M., M. Svensen, and C. K. I. Williams´ (1997a). GTM: a principled alternative to the Self-Organizing Map. In M. C. Mozer, M. I. Jordan, and T. Petche (Eds.), Advances in Neural Information Processing Systems, Volume 9, pp. 354–360. MIT Press.

Bishop, C. M., M. Svensen, and C. K. I. Williams ´ (1997b). Magnification factors for the GTM algorithm. In Proceedings IEE Fifth International Conference on Artificial Neural Networks, Cambridge, U.K., pp. 64–69. Institute of Electrical Engineers.

Bishop, C. M., M. Svensen, and C. K. I. Williams´ (1998a). Developments of the Generative Topographic Mapping. Neurocomputing 21, 203– 224.

Bishop, C. M., M. Svensen, and C. K. I. Williams´ (1998b). GTM: the Generative Topographic Mapping. Neural Computation 10(1), 215–234.

Bishop, C. M. and M. E. Tipping (1998). A hierarchical latent variable model for data visualization. IEEE Transactions on Pattern Analysis and Machine Intelligence 20(3), 281–293.

Bishop, C. M. and J. Winn (2000). Non-linear Bayesian image modelling. In Proceedings Sixth European Conference on Computer Vision, Dublin, Volume 1, pp. 3–17. Springer.

Blei, D. M., M. I. Jordan, and A. Y. Ng (2003). Hierarchical Bayesian models for applications in information retrieval. In J. M. B. et al. (Ed.), Bayesian Statistics, 7, pp. 25–43. Oxford University Press.

Block, H. D. (1962). The perceptron: a model for brain functioning. Reviews of Modern Physics 34(1), 123–135. Reprinted in Anderson and Rosenfeld (1988).

Blum, J. A. (1965). Multidimensional stochastic approximation methods. Annals of Mathematical Statistics 25, 737–744.

Bodlaender, H. (1993). A tourist guide through treewidth. Acta Cybernetica 11, 1–21.

Boser, B. E., I. M. Guyon, and V. N. Vapnik (1992). A training algorithm for optimal margin classifiers. In D. Haussler (Ed.), Proceedings Fifth Annual Workshop on Computational Learning Theory (COLT), pp. 144–152. ACM.

Bourlard, H. and Y. Kamp (1988). Auto-association by multilayer perceptrons and singular value decomposition. Biological Cybernetics 59, 291– 294.

Box, G. E. P., G. M. Jenkins, and G. C. Reinsel (1994). Time Series Analysis. Prentice Hall.

Box, G. E. P. and G. C. Tao (1973). Bayesian Inference in Statistical Analysis. Wiley.

Boyd, S. and L. Vandenberghe (2004). Convex Opti mization. Cambridge University Press.

Boyen, X. and D. Koller (1998). Tractable inference for complex stochastic processes. In G. F. Cooper and S. Moral (Eds.), Proceedings 14th Annual Conference on Uncertainty in Artificial Intelligence (UAI), pp. 33–42. Morgan Kaufmann.

Boykov, Y., O. Veksler, and R. Zabih (2001). Fast approximate energy minimization via graph cuts. IEEE Transactions on Pattern Analysis and Machine Intelligence 23(11), 1222–1239.

Breiman, L. (1996). Bagging predictors. Machine Learning 26, 123–140.

Breiman, L., J. H. Friedman, R. A. Olshen, and P. J. Stone (1984). Classification and Regression Trees. Wadsworth.

Brooks, S. P. (1998). Markov chain Monte Carlo method and its application. The Statistician 47(1), 69–100.

Broomhead, D. S. and D. Lowe (1988). Multivariable functional interpolation and adaptive networks. Complex Systems 2, 321–355.

Buntine, W. and A. Weigend (1991). Bayesian backpropagation. Complex Systems 5, 603–643.

Buntine, W. L. and A. S. Weigend (1993). Computing second derivatives in feed-forward networks: a review. IEEE Transactions on Neural Networks 5(3), 480–488.

Burges, C. J. C. (1998). A tutorial on support vector machines for pattern recognition. Knowledge Discovery and Data Mining 2(2), 121–167.

Cardoso, J.-F. (1998). Blind signal separation: statistical principles. Proceedings of the IEEE 9(10), 2009–2025.

Casella, G. and R. L. Berger (2002). Statistical Inference (Second ed.). Duxbury.

Castillo, E., J. M. Gutierrez, and A. S. Hadi (1997).´ Expert Systems and Probabilistic Network Models. Springer.

Chan, K., T. Lee, and T. J. Sejnowski (2003). Variational Bayesian learning of ICA with missing data. Neural Computation 15(8), 1991–2011.

Chen, A. M., H. Lu, and R. Hecht-Nielsen (1993). On the geometry of feedforward neural network error surfaces. Neural Computation 5(6), 910– 927.

Chen, M. H., Q. M. Shao, and J. G. Ibrahim (Eds.) (2001). Monte Carlo Methods for Bayesian Computation. Springer.

Chen, S., C. F. N. Cowan, and P. M. Grant (1991). Orthogonal least squares learning algorithm for radial basis function networks. IEEE Transactions on Neural Networks 2(2), 302–309.

Choudrey, R. A. and S. J. Roberts (2003). Variational mixture of Bayesian independent component analyzers. Neural Computation 15(1), 213–252.

Clifford, P. (1990). Markov random fields in statistics. In G. R. Grimmett and D. J. A. Welsh (Eds.), Disorder in Physical Systems. A Volume in Honour of John M. Hammersley, pp. 19–32. Oxford University Press.

Collins, M., S. Dasgupta, and R. E. Schapire (2002). A generalization of principal component analysis to the exponential family. In T. G. Dietterich, S. Becker, and Z. Ghahramani (Eds.), Advances in Neural Information Processing Systems, Volume 14, pp. 617–624. MIT Press.

Comon, P., C. Jutten, and J. Herault (1991). Blind source separation, 2: problems statement. Signal Processing 24(1), 11–20.

Corduneanu, A. and C. M. Bishop (2001). Variational Bayesian model selection for mixture distributions. In T. Richardson and T. Jaakkola (Eds.), Proceedings Eighth International Conference on Artificial Intelligence and Statistics, pp. 27–34. Morgan Kaufmann.

Cormen, T. H., C. E. Leiserson, R. L. Rivest, and C. Stein (2001). Introduction to Algorithms (Second ed.). MIT Press.

Cortes, C. and V. N. Vapnik (1995). Support vector networks. Machine Learning 20, 273–297.

Cotter, N. E. (1990). The Stone-Weierstrass theorem and its application to neural networks. IEEE Transactions on Neural Networks 1(4), 290–295.

Cover, T. and P. Hart (1967). Nearest neighbor pattern classification. IEEE Transactions on Information Theory IT-11, 21–27.

Cover, T. M. and J. A. Thomas (1991). Elements of Information Theory. Wiley.

Cowell, R. G., A. P. Dawid, S. L. Lauritzen, and D. J. Spiegelhalter (1999). Probabilistic Networks and Expert Systems. Springer.

Cox, R. T. (1946). Probability, frequency and reasonable expectation. American Journal of Physics 14(1), 1–13.

Cox, T. F. and M. A. A. Cox (2000). Multidimensional Scaling (Second ed.). Chapman and Hall.

Cressie, N. (1993). Statistics for Spatial Data. Wiley.

Cristianini, N. and J. Shawe-Taylor (2000). Support vector machines and other kernel-based learning methods. Cambridge University Press.

Csato, L. and M. Opper (2002). Sparse on-line Gaus-´ sian processes. Neural Computation 14(3), 641– 668.

Csiszar, I. and G. Tusn\` ady (1984). Information ge-\` ometry and alternating minimization procedures. Statistics and Decisions 1(1), 205–237.

Cybenko, G. (1989). Approximation by superpositions of a sigmoidal function. Mathematics of Control, Signals and Systems 2, 304–314.

Dawid, A. P. (1979). Conditional independence in statistical theory (with discussion). Journal of the Royal Statistical Society, Series B 4, 1–31.

Dawid, A. P. (1980). Conditional independence for statistical operations. Annals of Statistics 8, 598– 617.

deFinetti, B. (1970). Theory of Probability. Wiley and Sons.

Dempster, A. P., N. M. Laird, and D. B. Rubin (1977). Maximum likelihood from incomplete data via the EM algorithm. Journal of the Royal Statistical Society, B 39(1), 1–38.

Denison, D. G. T., C. C. Holmes, B. K. Mallick, and A. F. M. Smith (2002). Bayesian Methods for Nonlinear Classification and Regression. Wiley.

Diaconis, P. and L. Saloff-Coste (1998). What do we know about the Metropolis algorithm? Journal of Computer and System Sciences 57, 20–36.

Dietterich, T. G. and G. Bakiri (1995). Solving multiclass learning problems via error-correcting output codes. Journal of Artificial Intelligence Research 2, 263–286.

Duane, S., A. D. Kennedy, B. J. Pendleton, and D. Roweth (1987). Hybrid Monte Carlo. Physics Letters B 195(2), 216–222.

Duda, R. O. and P. E. Hart (1973). Pattern Classification and Scene Analysis. Wiley.

Duda, R. O., P. E. Hart, and D. G. Stork (2001). Pattern Classification (Second ed.). Wiley.

Durbin, R., S. Eddy, A. Krogh, and G. Mitchison (1998). Biological Sequence Analysis. Cambridge University Press.

Dybowski, R. and S. Roberts (2005). An anthology of probabilistic models for medical informatics. In D. Husmeier, R. Dybowski, and S. Roberts (Eds.), Probabilistic Modeling in Bioinformatics and Medical Informatics, pp. 297–349. Springer.

Efron, B. (1979). Bootstrap methods: another look at the jackknife. Annals of Statistics 7, 1–26.

Elkan, C. (2003). Using the triangle inequality to accelerate k-means. In Proceedings of the Twelfth International Conference on Machine Learning, pp. 147–153. AAAI.

Elliott, R. J., L. Aggoun, and J. B. Moore (1995). Hidden Markov Models: Estimation and Control. Springer.

Ephraim, Y., D. Malah, and B. H. Juang (1989). On the application of hidden Markov models for enhancing noisy speech. IEEE Transactions on Acoustics, Speech and Signal Processing 37(12), 1846–1856.

Erwin, E., K. Obermayer, and K. Schulten (1992). Self-organizing maps: ordering, convergence properties and energy functions. Biological Cybernetics 67, 47–55.

Everitt, B. S. (1984). An Introduction to Latent Variable Models. Chapman and Hall.

Faul, A. C. and M. E. Tipping (2002). Analysis of sparse Bayesian learning. In T. G. Dietterich, S. Becker, and Z. Ghahramani (Eds.), Advances in Neural Information Processing Systems, Volume 14, pp. 383–389. MIT Press.

Feller, W. (1966). An Introduction to Probability Theory and its Applications (Second ed.), Volume 2. Wiley.

Feynman, R. P., R. B. Leighton, and M. Sands (1964). The Feynman Lectures of Physics, Volume Two. Addison-Wesley. Chapter 19.

Fletcher, R. (1987). Practical Methods of Optimization (Second ed.). Wiley.

Forsyth, D. A. and J. Ponce (2003). Computer Vi sion: A Modern Approach. Prentice Hall.

Freund, Y. and R. E. Schapire (1996). Experiments with a new boosting algorithm. In L. Saitta (Ed.), Thirteenth International Conference on Machine Learning, pp. 148–156. Morgan Kaufmann.

Frey, B. J. (1998). Graphical Models for Machine Learning and Digital Communication. MIT Press.

Frey, B. J. and D. J. C. MacKay (1998). A revolution: Belief propagation in graphs with cycles. In M. I. Jordan, M. J. Kearns, and S. A. Solla (Eds.), Advances in Neural Information Processing Systems, Volume 10. MIT Press.

Friedman, J. H. (2001). Greedy function approximation: a gradient boosting machine. Annals of Statistics 29(5), 1189–1232.

Friedman, J. H., T. Hastie, and R. Tibshirani (2000). Additive logistic regression: a statistical view of boosting. Annals of Statistics 28, 337–407.

Friedman, N. and D. Koller (2003). Being Bayesian about network structure: A Bayesian approach to structure discovery in Bayesian networks. Machine Learning 50, 95–126.

Frydenberg, M. (1990). The chain graph Markov property. Scandinavian Journal of Statistics 17, 333–353.

Fukunaga, K. (1990). Introduction to Statistical Pattern Recognition (Second ed.). Academic Press.

Funahashi, K. (1989). On the approximate realization of continuous mappings by neural networks. Neural Networks 2(3), 183–192.

Fung, R. and K. C. Chang (1990). Weighting and integrating evidence for stochastic simulation in Bayesian networks. In P. P. Bonissone, M. Henrion, L. N. Kanal, and J. F. Lemmer (Eds.), Uncertainty in Artificial Intelligence, Volume 5, pp. 208–219. Elsevier.

Gallager, R. G. (1963). Low-Density Parity-Check Codes. MIT Press.

Gamerman, D. (1997). Markov Chain Monte Carlo: Stochastic Simulation for Bayesian Inference. Chapman and Hall.

Gelman, A., J. B. Carlin, H. S. Stern, and D. B. Rubin (2004). Bayesian Data Analysis (Second ed.). Chapman and Hall.

Geman, S. and D. Geman (1984). Stochastic relaxation, Gibbs distributions, and the Bayesian restoration of images. IEEE Transactions on Pattern Analysis and Machine Intelligence 6(1), 721–741.

Ghahramani, Z. and M. J. Beal (2000). Variational inference for Bayesian mixtures of factor analyzers. In S. A. Solla, T. K. Leen, and K. R. Muller (Eds.), ¨ Advances in Neural Information Processing Systems, Volume 12, pp. 449–455. MIT Press.

Ghahramani, Z. and G. E. Hinton (1996a). The EM algorithm for mixtures of factor analyzers. Technical Report CRG-TR-96-1, University of Toronto.

Ghahramani, Z. and G. E. Hinton (1996b). Parameter estimation for linear dynamical systems. Technical Report CRG-TR-96-2, University of Toronto.

Ghahramani, Z. and G. E. Hinton (1998). Variational learning for switching state-space models. Neural Computation 12(4), 963–996.

Ghahramani, Z. and M. I. Jordan (1994). Supervised learning from incomplete data via an EM appproach. In J. D. Cowan, G. T. Tesauro, and J. Alspector (Eds.), Advances in Neural Information Processing Systems, Volume 6, pp. 120–127. Morgan Kaufmann.

Ghahramani, Z. and M. I. Jordan (1997). Factorial hidden Markov models. Machine Learning 29, 245–275.

Gibbs, M. N. (1997). Bayesian Gaussian processes for regression and classification. Phd thesis, University of Cambridge.

Gibbs, M. N. and D. J. C. MacKay (2000). Variational Gaussian process classifiers. IEEE Transactions on Neural Networks 11, 1458–1464.

Gilks, W. R. (1992). Derivative-free adaptive rejection sampling for Gibbs sampling. In J. Bernardo, J. Berger, A. P. Dawid, and A. F. M. Smith (Eds.), Bayesian Statistics, Volume 4. Oxford University Press.

Gilks, W. R., N. G. Best, and K. K. C. Tan (1995). Adaptive rejection Metropolis sampling. Applied Statistics 44, 455–472.

Gilks, W. R., S. Richardson, and D. J. Spiegelhalter (Eds.) (1996). Markov Chain Monte Carlo in Practice. Chapman and Hall.

Gilks, W. R. and P. Wild (1992). Adaptive rejection sampling for Gibbs sampling. Applied Statistics 41, 337–348.

Gill, P. E., W. Murray, and M. H. Wright (1981). Practical Optimization. Academic Press.

Goldberg, P. W., C. K. I. Williams, and C. M. Bishop (1998). Regression with input-dependent noise: A Gaussian process treatment. In Advances in Neural Information Processing Systems, Volume 10, pp. 493–499. MIT Press.

Golub, G. H. and C. F. Van Loan (1996). Matrix Computations (Third ed.). John Hopkins University Press.

Good, I. (1950). Probability and the Weighing of Evidence. Hafners.

Gordon, N. J., D. J. Salmond, and A. F. M. Smith (1993). Novel approach to nonlinear/non-Gaussian Bayesian state estimation. IEE Proceedings-F 140(2), 107–113.

Graepel, T. (2003). Solving noisy linear operator equations by Gaussian processes: Application to ordinary and partial differential equations. In Proceedings of the Twentieth International Conference on Machine Learning, pp. 234–241.

Greig, D., B. Porteous, and A. Seheult (1989). Exact maximum a-posteriori estimation for binary images. Journal of the Royal Statistical Society, Series B 51(2), 271–279.

Gull, S. F. (1989). Developments in maximum entropy data analysis. In J. Skilling (Ed.), Maximum Entropy and Bayesian Methods, pp. 53–71. Kluwer.

Hassibi, B. and D. G. Stork (1993). Second order derivatives for network pruning: optimal brain surgeon. In S. J. Hanson, J. D. Cowan, and C. L. Giles (Eds.), Advances in Neural Information Processing Systems, Volume 5, pp. 164–171. Morgan Kaufmann.

Hastie, T. and W. Stuetzle (1989). Principal curves. Journal of the American Statistical Association 84(106), 502–516.

Hastie, T., R. Tibshirani, and J. Friedman (2001). The Elements of Statistical Learning. Springer.

Hastings, W. K. (1970). Monte Carlo sampling methods using Markov chains and their applications. Biometrika 57, 97–109.

Hathaway, R. J. (1986). Another interpretation of the EM algorithm for mixture distributions. Statistics and Probability Letters 4, 53–56.

Haussler, D. (1999). Convolution kernels on discrete structures. Technical Report UCSC-CRL-99-10, University of California, Santa Cruz, Computer Science Department.

Henrion, M. (1988). Propagation of uncertainty by logic sampling in Bayes’ networks. In J. F. Lemmer and L. N. Kanal (Eds.), Uncertainty in Artificial Intelligence, Volume 2, pp. 149–164. North Holland.

Herbrich, R. (2002). Learning Kernel Classifiers. MIT Press.

Hertz, J., A. Krogh, and R. G. Palmer (1991). Introduction to the Theory of Neural Computation. Addison Wesley.

Hinton, G. E., P. Dayan, and M. Revow (1997). Modelling the manifolds of images of handwritten digits. IEEE Transactions on Neural Networks 8(1), 65–74.

Hinton, G. E. and D. van Camp (1993). Keeping neural networks simple by minimizing the description length of the weights. In Proceedings of the Sixth Annual Conference on Computational Learning Theory, pp. 5–13. ACM.

Hinton, G. E., M. Welling, Y. W. Teh, and S. Osindero (2001). A new view of ICA. In Proceedings

of the International Conference on Independent Component Analysis and Blind Signal Separation, Volume 3.

Hodgson, M. E. (1998). Reducing computational requirements of the minimum-distance classifier. Remote Sensing of Environments 25, 117–128.

Hoerl, A. E. and R. Kennard (1970). Ridge regression: biased estimation for nonorthogonal problems. Technometrics 12, 55–67.

Hofmann, T. (2000). Learning the similarity of documents: an information-geometric approach to document retrieval and classification. In S. A. Solla, T. K. Leen, and K. R. Muller (Eds.),¨ Advances in Neural Information Processing Systems, Volume 12, pp. 914–920. MIT Press.

Hojen-Sorensen, P. A., O. Winther, and L. K. Hansen (2002). Mean field approaches to independent component analysis. Neural Computation 14(4), 889–918.

Hornik, K. (1991). Approximation capabilities of multilayer feedforward networks. Neural Networks 4(2), 251–257.

Hornik, K., M. Stinchcombe, and H. White (1989). Multilayer feedforward networks are universal approximators. Neural Networks 2(5), 359–366.

Hotelling, H. (1933). Analysis of a complex of statistical variables into principal components. Journal of Educational Psychology 24, 417–441.

Hotelling, H. (1936). Relations between two sets of variables. Biometrika 28, 321–377.

Hyvarinen, A. and E. Oja (1997). A fast fixed-point¨ algorithm for independent component analysis. Neural Computation 9(7), 1483–1492.

Isard, M. and A. Blake (1998). CONDENSATION – conditional density propagation for visual tracking. International Journal of Computer Vision 29(1), 5–18.

Ito, Y. (1991). Representation of functions by superpositions of a step or sigmoid function and their applications to neural network theory. Neural Networks 4(3), 385–394.

Jaakkola, T. and M. I. Jordan (2000). Bayesian parameter estimation via variational methods. Statistics and Computing 10, 25–37.

Jaakkola, T. S. (2001). Tutorial on variational approximation methods. In M. Opper and D. Saad (Eds.), Advances in Mean Field Methods, pp. 129–159. MIT Press.

Jaakkola, T. S. and D. Haussler (1999). Exploiting generative models in discriminative classifiers. In M. S. Kearns, S. A. Solla, and D. A. Cohn (Eds.), Advances in Neural Information Processing Systems, Volume 11. MIT Press.

Jacobs, R. A., M. I. Jordan, S. J. Nowlan, and G. E. Hinton (1991). Adaptive mixtures of local experts. Neural Computation 3(1), 79–87.

Jaynes, E. T. (2003). Probability Theory: The Logic of Science. Cambridge University Press.

Jebara, T. (2004). Machine Learning: Discriminative and Generative. Kluwer.

Jeffries, H. (1946). An invariant form for the prior probability in estimation problems. Pro. Roy. Soc. AA 186, 453–461.

Jelinek, F. (1997). Statistical Methods for Speech Recognition. MIT Press.

Jensen, C., A. Kong, and U. Kjaerulff (1995). Blocking gibbs sampling in very large probabilistic expert systems. International Journal of Human Computer Studies. Special Issue on Real-World Applications of Uncertain Reasoning. 42, 647– 666.

Jensen, F. V. (1996). An Introduction to Bayesian Networks. UCL Press.

Jerrum, M. and A. Sinclair (1996). The Markov chain Monte Carlo method: an approach to approximate counting and integration. In D. S. Hochbaum (Ed.), Approximation Algorithms for NP-Hard Problems. PWS Publishing.

Jolliffe, I. T. (2002). Principal Component Analysis (Second ed.). Springer.

Jordan, M. I. (1999). Learning in Graphical Models. MIT Press.

Jordan, M. I. (2007). An Introduction to Probabilistic Graphical Models. In preparation.

Jordan, M. I., Z. Ghahramani, T. S. Jaakkola, and L. K. Saul (1999). An introduction to variational methods for graphical models. In M. I. Jordan (Ed.), Learning in Graphical Models, pp. 105– 162. MIT Press.

Jordan, M. I. and R. A. Jacobs (1994). Hierarchical mixtures of experts and the EM algorithm. Neural Computation 6(2), 181–214.

Jutten, C. and J. Herault (1991). Blind separation of sources, 1: An adaptive algorithm based on neuromimetic architecture. Signal Processing 24(1), 1–10.

Kalman, R. E. (1960). A new approach to linear filtering and prediction problems. Transactions of the American Society for Mechanical Engineering, Series D, Journal of Basic Engineering 82, 35–45.

Kambhatla, N. and T. K. Leen (1997). Dimension reduction by local principal component analysis. Neural Computation 9(7), 1493–1516.

Kanazawa, K., D. Koller, and S. Russel (1995). Stochastic simulation algorithms for dynamic probabilistic networks. In Uncertainty in Artificial Intelligence, Volume 11. Morgan Kaufmann.

Kapadia, S. (1998). Discriminative Training of Hidden Markov Models. Phd thesis, University of Cambridge, U.K.

Kapur, J. (1989). Maximum entropy methods in science and engineering. Wiley.

Karush, W. (1939). Minima of functions of several variables with inequalities as side constraints. Master’s thesis, Department of Mathematics, University of Chicago.

Kass, R. E. and A. E. Raftery (1995). Bayes factors. Journal of the American Statistical Association 90, 377–395.

Kearns, M. J. and U. V. Vazirani (1994). An Introduction to Computational Learning Theory. MIT Press.

Kindermann, R. and J. L. Snell (1980). Markov Random Fields and Their Applications. American Mathematical Society.

Kittler, J. and J. Foglein (1984). Contextual classifi-¨ cation of multispectral pixel data. Image and Vision Computing 2, 13–29.

Kohonen, T. (1982). Self-organized formation of topologically correct feature maps. Biological Cybernetics 43, 59–69.

Kohonen, T. (1995). Self-Organizing Maps. Springer.

Kolmogorov, V. and R. Zabih (2004). What energy functions can be minimized via graph cuts? IEEE Transactions on Pattern Analysis and Machine Intelligence 26(2), 147–159.

Kreinovich, V. Y. (1991). Arbitrary nonlinearity is sufficient to represent all functions by neural networks: a theorem. Neural Networks 4(3), 381– 383.

Krogh, A., M. Brown, I. S. Mian, K. Sjolander, and¨ D. Haussler (1994). Hidden Markov models in computational biology: Applications to protein modelling. Journal of Molecular Biology 235, 1501–1531.

Kschischnang, F. R., B. J. Frey, and H. A. Loeliger (2001). Factor graphs and the sum-product algorithm. IEEE Transactions on Information Theory 47(2), 498–519.

Kuhn, H. W. and A. W. Tucker (1951). Nonlinear programming. In Proceedings of the 2nd Berkeley Symposium on Mathematical Statistics and Probabilities, pp. 481–492. University of California Press.

Kullback, S. and R. A. Leibler (1951). On information and sufficiency. Annals of Mathematical Statistics 22(1), 79–86.

Kurkov˙ a, V. and P. C. Kainen (1994). Functionally´ equivalent feed-forward neural networks. Neural Computation 6(3), 543–558.

Kuss, M. and C. Rasmussen (2006). Assessing approximations for Gaussian process classification.

In Advances in Neural Information Processing Systems, Number 18. MIT Press. in press.

Lasserre, J., C. M. Bishop, and T. Minka (2006). Principled hybrids of generative and discriminative models. In Proceedings 2006 IEEE Conference on Computer Vision and Pattern Recognition, New York.

Lauritzen, S. and N. Wermuth (1989). Graphical models for association between variables, some of which are qualitative some quantitative. Annals of Statistics 17, 31–57.

Lauritzen, S. L. (1992). Propagation of probabilities, means and variances in mixed graphical associa tion models. Journal of the American Statistical Association 87, 1098–1108.

Lauritzen, S. L. (1996). Graphical Models. Oxford University Press.

Lauritzen, S. L. and D. J. Spiegelhalter (1988). Local computations with probabailities on graphical structures and their application to expert systems. Journal of the Royal Statistical Society 50, 157– 224.

Lawley, D. N. (1953). A modified method of estimation in factor analysis and some large sample results. In Uppsala Symposium on Psychological Factor Analysis, Number 3 in Nordisk Psykologi Monograph Series, pp. 35–42. Uppsala: Almqvist and Wiksell.

Lawrence, N. D., A. I. T. Rowstron, C. M. Bishop, and M. J. Taylor (2002). Optimising synchronisation times for mobile devices. In T. G. Dietterich, S. Becker, and Z. Ghahramani (Eds.), Advances in Neural Information Processing Systems, Volume 14, pp. 1401–1408. MIT Press.

Lazarsfeld, P. F. and N. W. Henry (1968). Latent Structure Analysis. Houghton Mifflin.

Le Cun, Y., B. Boser, J. S. Denker, D. Henderson, R. E. Howard, W. Hubbard, and L. D. Jackel (1989). Backpropagation applied to handwritten zip code recognition. Neural Computation 1(4), 541–551.

Le Cun, Y., J. S. Denker, and S. A. Solla (1990). Optimal brain damage. In D. S. Touretzky (Ed.),

Advances in Neural Information Processing Systems, Volume 2, pp. 598–605. Morgan Kaufmann.

LeCun, Y., L. Bottou, Y. Bengio, and P. Haffner (1998). Gradient-based learning applied to document recognition. Proceedings of the IEEE 86, 2278–2324.

Lee, Y., Y. Lin, and G. Wahba (2001). Multicategory support vector machines. Technical Report 1040, Department of Statistics, University of Madison, Wisconsin.

Leen, T. K. (1995). From data distributions to regularization in invariant learning. Neural Computation 7, 974–981.

Lindley, D. V. (1982). Scoring rules and the inevitability of probability. International Statistical Review 50, 1–26.

Liu, J. S. (Ed.) (2001). Monte Carlo Strategies in Scientific Computing. Springer.

Lloyd, S. P. (1982). Least squares quantization in PCM. IEEE Transactions on Information Theory 28(2), 129–137.

Lutkepohl, H. (1996).¨ Handbook of Matrices. Wiley.

MacKay, D. J. C. (1992a). Bayesian interpolation. Neural Computation 4(3), 415–447.

MacKay, D. J. C. (1992b). The evidence framework applied to classification networks. Neural Computation 4(5), 720–736.

MacKay, D. J. C. (1992c). A practical Bayesian framework for back-propagation networks. Neural Computation 4(3), 448–472.

MacKay, D. J. C. (1994). Bayesian methods for backprop networks. In E. Domany, J. L. van Hemmen, and K. Schulten (Eds.), Models of Neural Networks, III, Chapter 6, pp. 211–254. Springer.

MacKay, D. J. C. (1995). Bayesian neural networks and density networks. Nuclear Instruments and Methods in Physics Research, A 354(1), 73–80.

MacKay, D. J. C. (1997). Ensemble learning for hidden Markov models. Unpublished manuscript,

Department of Physics, University of Cambridge.

MacKay, D. J. C. (1998). Introduction to Gaussian processes. In C. M. Bishop (Ed.), Neural Networks and Machine Learning, pp. 133–166. Springer.

MacKay, D. J. C. (1999). Comparison of approximate methods for handling hyperparameters. Neural Computation 11(5), 1035–1068.

MacKay, D. J. C. (2003). Information Theory, Inference and Learning Algorithms. Cambridge University Press.

MacKay, D. J. C. and M. N. Gibbs (1999). Density networks. In J. W. Kay and D. M. Titterington (Eds.), Statistics and Neural Networks: Advances at the Interface, Chapter 5, pp. 129–145. Oxford University Press.

MacKay, D. J. C. and R. M. Neal (1999). Good errorcorrecting codes based on very sparse matrices. IEEE Transactions on Information Theory 45, 399–431.

MacQueen, J. (1967). Some methods for classification and analysis of multivariate observations. In L. M. LeCam and J. Neyman (Eds.), Proceedings of the Fifth Berkeley Symposium on Mathematical Statistics and Probability, Volume I, pp. 281–297. University of California Press.

Magnus, J. R. and H. Neudecker (1999). Matrix Differential Calculus with Applications in Statistics and Econometrics. Wiley.

Mallat, S. (1999). A Wavelet Tour of Signal Processing (Second ed.). Academic Press.

Manning, C. D. and H. Schutze (1999). ¨ Foundations of Statistical Natural Language Processing. MIT Press.

Mardia, K. V. and P. E. Jupp (2000). Directional Statistics. Wiley.

Maybeck, P. S. (1982). Stochastic models, estimation and control. Academic Press.

McAllester, D. A. (2003). PAC-Bayesian stochastic model selection. Machine Learning 51(1), 5–21.

McCullagh, P. and J. A. Nelder (1989). Generalized Linear Models (Second ed.). Chapman and Hall.

McCulloch, W. S. and W. Pitts (1943). A logical calculus of the ideas immanent in nervous activity. Bulletin of Mathematical Biophysics 5, 115–133. Reprinted in Anderson and Rosenfeld (1988).

McEliece, R. J., D. J. C. MacKay, and J. F. Cheng (1998). Turbo decoding as an instance of Pearl’s ‘Belief Ppropagation’ algorithm. IEEE Journal on Selected Areas in Communications 16, 140– 152.

McLachlan, G. J. and K. E. Basford (1988). Mixture Models: Inference and Applications to Clustering. Marcel Dekker.

McLachlan, G. J. and T. Krishnan (1997). The EM Algorithm and its Extensions. Wiley.

McLachlan, G. J. and D. Peel (2000). Finite Mixture Models. Wiley.

Meng, X. L. and D. B. Rubin (1993). Maximum likelihood estimation via the ECM algorithm: a general framework. Biometrika 80, 267–278.

Metropolis, N., A. W. Rosenbluth, M. N. Rosenbluth, A. H. Teller, and E. Teller (1953). Equation of state calculations by fast computing machines. Journal of Chemical Physics 21(6), 1087–1092.

Metropolis, N. and S. Ulam (1949). The Monte Carlo method. Journal of the American Statistical Association 44(247), 335–341.

Mika, S., G. Ratsch, J. Weston, and B. Sch¨ olkopf¨ (1999). Fisher discriminant analysis with kernels. In Y. H. Hu, J. Larsen, E. Wilson, and S. Douglas (Eds.), Neural Networks for Signal Processing IX, pp. 41–48. IEEE.

Minka, T. (2001a). Expectation propagation for approximate Bayesian inference. In J. Breese and D. Koller (Eds.), Proceedings of the Seventeenth Conference on Uncertainty in Artificial Intelligence, pp. 362–369. Morgan Kaufmann.

Minka, T. (2001b). A family of approximate algorithms for Bayesian inference. Ph. D. thesis, MIT.

Minka, T. (2004). Power EP. Technical Report MSR-TR-2004-149, Microsoft Research Cambridge.

Minka, T. (2005). Divergence measures and message passing. Technical Report MSR-TR-2005- 173, Microsoft Research Cambridge.

Minka, T. P. (2001c). Automatic choice of dimensionality for PCA. In T. K. Leen, T. G. Dietterich, and V. Tresp (Eds.), Advances in Neural Information Processing Systems, Volume 13, pp. 598–604. MIT Press.

Minsky, M. L. and S. A. Papert (1969). Perceptrons. MIT Press. Expanded edition 1990.

Miskin, J. W. and D. J. C. MacKay (2001). Ensemble learning for blind source separation. In S. J. Roberts and R. M. Everson (Eds.), Independent Component Analysis: Principles and Practice. Cambridge University Press.

Møller, M. (1993). Efficient Training of Feed-Forward Neural Networks. Ph. D. thesis, Aarhus University, Denmark.

Moody, J. and C. J. Darken (1989). Fast learning in networks of locally-tuned processing units. Neural Computation 1(2), 281–294.

Moore, A. W. (2000). The anchors hierarch: using the triangle inequality to survive high dimensional data. In Proceedings of the Twelfth Conference on Uncertainty in Artificial Intelligence, pp. 397–405.

Muller, K. R., S. Mika, G. R¨ atsch, K. Tsuda, and¨ B. Scholkopf (2001). An introduction to kernel-¨ based learning algorithms. IEEE Transactions on Neural Networks 12(2), 181–202.

Muller, P. and F. A. Quintana (2004). Nonparametric ¨ Bayesian data analysis. Statistical Science 19(1), 95–110.

Nabney, I. T. (2002). Netlab: Algorithms for Pattern Recognition. Springer.

Nadaraya, E. A. (1964). On estimating regression.<sup>´</sup> Theory of Probability and its Applications 9(1), 141–142.

Nag, R., K. Wong, and F. Fallside (1986). Script recognition using hidden markov models. In ICASSP86, pp. 2071–2074. IEEE.

Neal, R. M. (1993). Probabilistic inference using Markov chain Monte Carlo methods. Technical Report CRG-TR-93-1, Department of Computer Science, University of Toronto, Canada.

Neal, R. M. (1996). Bayesian Learning for Neural Networks. Springer. Lecture Notes in Statistics 118.

Neal, R. M. (1997). Monte Carlo implementation of Gaussian process models for Bayesian regression and classification. Technical Report 9702, Department of Computer Statistics, University of Toronto.

Neal, R. M. (1999). Suppressing random walks in Markov chain Monte Carlo using ordered overrelaxation. In M. I. Jordan (Ed.), Learning in Graphical Models, pp. 205–228. MIT Press.

Neal, R. M. (2000). Markov chain sampling for Dirichlet process mixture models. Journal of Computational and Graphical Statistics 9, 249– 265.

Neal, R. M. (2003). Slice sampling. Annals of Statistics 31, 705–767.

Neal, R. M. and G. E. Hinton (1999). A new view of the EM algorithm that justifies incremental and other variants. In M. I. Jordan (Ed.), Learning in Graphical Models, pp. 355–368. MIT Press.

Nelder, J. A. and R. W. M. Wedderburn (1972). Generalized linear models. Journal of the Royal Statistical Society, A 135, 370–384.

Nilsson, N. J. (1965). Learning Machines. McGraw-Hill. Reprinted as The Mathematical Foundations of Learning Machines, Morgan Kaufmann, (1990).

Nocedal, J. and S. J. Wright (1999). Numerical Optimization. Springer.

Nowlan, S. J. and G. E. Hinton (1992). Simplifying neural networks by soft weight sharing. Neural Computation 4(4), 473–493.

Ogden, R. T. (1997). Essential Wavelets for Statistical Applications and Data Analysis. Birkhauser.¨

Opper, M. and O. Winther (1999). A Bayesian approach to on-line learning. In D. Saad (Ed.), On-Line Learning in Neural Networks, pp. 363–378. Cambridge University Press.

Opper, M. and O. Winther (2000a). Gaussian processes and SVM: mean field theory and leave-one-out. In A. J. Smola, P. L. Bartlett, B. Scholkopf, and D. Shuurmans (Eds.),¨ Advances in Large Margin Classifiers, pp. 311–326. MIT Press.

Opper, M. and O. Winther (2000b). Gaussian processes for classification. Neural Computation 12(11), 2655–2684.

Osuna, E., R. Freund, and F. Girosi (1996). Support vector machines: training and applications. A.I. Memo AIM-1602, MIT.

Papoulis, A. (1984). Probability, Random Variables, and Stochastic Processes (Second ed.). McGraw-Hill.

Parisi, G. (1988). Statistical Field Theory. Addison-Wesley.

Pearl, J. (1988). Probabilistic Reasoning in Intelligent Systems. Morgan Kaufmann.

Pearlmutter, B. A. (1994). Fast exact multiplication by the Hessian. Neural Computation 6(1), 147– 160.

Pearlmutter, B. A. and L. C. Parra (1997). Maximum likelihood source separation: a context-sensitive generalization of ICA. In M. C. Mozer, M. I. Jordan, and T. Petsche (Eds.), Advances in Neural Information Processing Systems, Volume 9, pp. 613–619. MIT Press.

Pearson, K. (1901). On lines and planes of closest fit to systems of points in space. The London, Edinburgh and Dublin Philosophical Magazine and Journal of Science, Sixth Series 2, 559–572.

Platt, J. C. (1999). Fast training of support vector machines using sequential minimal optimization. In B. Scholkopf, C. J. C. Burges, and A. J. Smola ¨ (Eds.), Advances in Kernel Methods – Support Vector Learning, pp. 185–208. MIT Press.

Platt, J. C. (2000). Probabilities for SV machines. In A. J. Smola, P. L. Bartlett, B. Scholkopf, and ¨ D. Shuurmans (Eds.), Advances in Large Margin Classifiers, pp. 61–73. MIT Press.

Platt, J. C., N. Cristianini, and J. Shawe-Taylor (2000). Large margin DAGs for multiclass classification. In S. A. Solla, T. K. Leen, and K. R. Muller (Eds.),¨ Advances in Neural Information Processing Systems, Volume 12, pp. 547–553. MIT Press.

Poggio, T. and F. Girosi (1990). Networks for approximation and learning. Proceedings of the IEEE 78(9), 1481–1497.

Powell, M. J. D. (1987). Radial basis functions for multivariable interpolation: a review. In J. C. Mason and M. G. Cox (Eds.), Algorithms for Approximation, pp. 143–167. Oxford University Press.

Press, W. H., S. A. Teukolsky, W. T. Vetterling, and B. P. Flannery (1992). Numerical Recipes in C: The Art of Scientific Computing (Second ed.). Cambridge University Press.

Qazaz, C. S., C. K. I. Williams, and C. M. Bishop (1997). An upper bound on the Bayesian error bars for generalized linear regression. In S. W. Ellacott, J. C. Mason, and I. J. Anderson (Eds.), Mathematics of Neural Networks: Models, Algorithms and Applications, pp. 295–299. Kluwer.

Quinlan, J. R. (1986). Induction of decision trees. Machine Learning 1(1), 81–106.

Quinlan, J. R. (1993). C4.5: Programs for Machine Learning. Morgan Kaufmann.

Rabiner, L. and B. H. Juang (1993). Fundamentals of Speech Recognition. Prentice Hall.

Rabiner, L. R. (1989). A tutorial on hidden Markov models and selected applications in speech recognition. Proceedings of the IEEE 77(2), 257–285.

Ramasubramanian, V. and K. K. Paliwal (1990). A generalized optimization of the k-d tree for fast nearest-neighbour search. In Proceedings Fourth IEEE Region 10 International Conference (TEN-CON’89), pp. 565–568.

Ramsey, F. (1931). Truth and probability. In R. Braithwaite (Ed.), The Foundations of Mathematics and other Logical Essays. Humanities Press.

Rao, C. R. and S. K. Mitra (1971). Generalized Inverse of Matrices and Its Applications. Wiley.

Rasmussen, C. E. (1996). Evaluation of Gaussian Processes and Other Methods for Non-Linear Regression. Ph. D. thesis, University of Toronto.

Rasmussen, C. E. and J. Quinonero-Candela (2005).˜ Healing the relevance vector machine by augmentation. In L. D. Raedt and S. Wrobel (Eds.), Proceedings of the 22nd International Conference on Machine Learning, pp. 689–696.

Rasmussen, C. E. and C. K. I. Williams (2006). Gaussian Processes for Machine Learning. MIT Press.

Rauch, H. E., F. Tung, and C. T. Striebel (1965). Maximum likelihood estimates of linear dynamical systems. AIAA Journal 3, 1445–1450.

Ricotti, L. P., S. Ragazzini, and G. Martinelli (1988). Learning of word stress in a sub-optimal second order backpropagation neural network. In Proceedings of the IEEE International Conference on Neural Networks, Volume 1, pp. 355–361. IEEE.

Ripley, B. D. (1996). Pattern Recognition and Neural Networks. Cambridge University Press.

Robbins, H. and S. Monro (1951). A stochastic approximation method. Annals of Mathematical Statistics 22, 400–407.

Robert, C. P. and G. Casella (1999). Monte Carlo Statistical Methods. Springer.

Rockafellar, R. (1972). Convex Analysis. Princeton University Press.

Rosenblatt, F. (1962). Principles of Neurodynamics: Perceptrons and the Theory of Brain Mech anisms. Spartan.

Roth, V. and V. Steinhage (2000). Nonlinear discriminant analysis using kernel functions. In S. A.

Solla, T. K. Leen, and K. R. Muller (Eds.),¨ Advances in Neural Information Processing Systems, Volume 12. MIT Press.

Roweis, S. (1998). EM algorithms for PCA and SPCA. In M. I. Jordan, M. J. Kearns, and S. A. Solla (Eds.), Advances in Neural Information Processing Systems, Volume 10, pp. 626–632. MIT Press.

Roweis, S. and Z. Ghahramani (1999). A unifying review of linear Gaussian models. Neural Computation 11(2), 305–345.

Roweis, S. and L. Saul (2000, December). Nonlinear dimensionality reduction by locally linear embedding. Science 290, 2323–2326.

Rubin, D. B. (1983). Iteratively reweighted least squares. In Encyclopedia of Statistical Sciences, Volume 4, pp. 272–275. Wiley.

Rubin, D. B. and D. T. Thayer (1982). EM algorithms for ML factor analysis. Psychometrika 47(1), 69–76.

Rumelhart, D. E., G. E. Hinton, and R. J. Williams (1986). Learning internal representations by error propagation. In D. E. Rumelhart, J. L. Mc-Clelland, and the PDP Research Group (Eds.), Parallel Distributed Processing: Explorations in the Microstructure of Cognition, Volume 1: Foundations, pp. 318–362. MIT Press. Reprinted in Anderson and Rosenfeld (1988).

Rumelhart, D. E., J. L. McClelland, and the PDP Research Group (Eds.) (1986). Parallel Distributed Processing: Explorations in the Microstructure of Cognition, Volume 1: Foundations. MIT Press.

Sagan, H. (1969). Introduction to the Calculus of Variations. Dover.

Savage, L. J. (1961). The subjective basis of statistical practice. Technical report, Department of Statistics, University of Michigan, Ann Arbor.

Scholkopf, B., J. Platt, J. Shawe-Taylor, A. Smola, ¨ and R. C. Williamson (2001). Estimating the support of a high-dimensional distribution. Neural Computation 13(7), 1433–1471.

Scholkopf, B., A. Smola, and K.-R. M¨ uller (1998).¨ Nonlinear component analysis as a kernel eigenvalue problem. Neural Computation 10(5), 1299–1319.

Scholkopf, B., A. Smola, R. C. Williamson, and P. L. ¨ Bartlett (2000). New support vector algorithms. Neural Computation 12(5), 1207–1245.

Scholkopf, B. and A. J. Smola (2002). ¨ Learning with Kernels. MIT Press.

Schwarz, G. (1978). Estimating the dimension of a model. Annals of Statistics 6, 461–464.

Schwarz, H. R. (1988). Finite element methods. Academic Press.

Seeger, M. (2003). Bayesian Gaussian Process Models: PAC-Bayesian Generalization Error Bounds and Sparse Approximations. Ph. D. thesis, University of Edinburg.

Seeger, M., C. K. I. Williams, and N. Lawrence (2003). Fast forward selection to speed up sparse Gaussian processes. In C. M. Bishop and B. Frey (Eds.), Proceedings Ninth International Workshop on Artificial Intelligence and Statistics, Key West, Florida.

Shachter, R. D. and M. Peot (1990). Simulation approaches to general probabilistic inference on belief networks. In P. P. Bonissone, M. Henrion, L. N. Kanal, and J. F. Lemmer (Eds.), Uncertainty in Artificial Intelligence, Volume 5. Elsevier.

Shannon, C. E. (1948). A mathematical theory of communication. The Bell System Technical Journal 27(3), 379–423 and 623–656.

Shawe-Taylor, J. and N. Cristianini (2004). Kernel Methods for Pattern Analysis. Cambridge University Press.

Sietsma, J. and R. J. F. Dow (1991). Creating artificial neural networks that generalize. Neural Networks 4(1), 67–79.

Simard, P., Y. Le Cun, and J. Denker (1993). Efficient pattern recognition using a new transformation distance. In S. J. Hanson, J. D. Cowan, and

C. L. Giles (Eds.), Advances in Neural Information Processing Systems, Volume 5, pp. 50–58. Morgan Kaufmann.

Simard, P., B. Victorri, Y. Le Cun, and J. Denker (1992). Tangent prop – a formalism for specifying selected invariances in an adaptive network. In J. E. Moody, S. J. Hanson, and R. P. Lippmann (Eds.), Advances in Neural Information Processing Systems, Volume 4, pp. 895–903. Morgan Kaufmann.

Simard, P. Y., D. Steinkraus, and J. Platt (2003). Best practice for convolutional neural networks applied to visual document analysis. In Proceedings International Conference on Document Analysis and Recognition (ICDAR), pp. 958– 962. IEEE Computer Society.

Sirovich, L. (1987). Turbulence and the dynamics of coherent structures. Quarterly Applied Mathematics 45(3), 561–590.

Smola, A. J. and P. Bartlett (2001). Sparse greedy Gaussian process regression. In T. K. Leen, T. G. Dietterich, and V. Tresp (Eds.), Advances in Neural Information Processing Systems, Volume 13, pp. 619–625. MIT Press.

Spiegelhalter, D. and S. Lauritzen (1990). Sequential updating of conditional probabilities on directed graphical structures. Networks 20, 579–605.

Stinchecombe, M. and H. White (1989). Universal approximation using feed-forward networks with non-sigmoid hidden layer activation functions. In International Joint Conference on Neural Networks, Volume 1, pp. 613–618. IEEE.

Stone, J. V. (2004). Independent Component Analysis: A Tutorial Introduction. MIT Press.

Sung, K. K. and T. Poggio (1994). Example-based learning for view-based human face detection. A.I. Memo 1521, MIT.

Sutton, R. S. and A. G. Barto (1998). Reinforcement Learning: An Introduction. MIT Press.

Svensen, M. and C. M. Bishop (2004). Ro- ´ bust Bayesian mixture modelling. Neurocomputing 64, 235–252.

Tarassenko, L. (1995). Novelty detection for the identification of masses in mamograms. In Proceedings Fourth IEE International Conference on Artificial Neural Networks, Volume 4, pp. 442–447. IEE.

Tax, D. and R. Duin (1999). Data domain description by support vectors. In M. Verleysen (Ed.), Proceedings European Symposium on Artificial Neural Networks, ESANN, pp. 251–256. D. Facto Press.

Teh, Y. W., M. I. Jordan, M. J. Beal, and D. M. Blei (2006). Hierarchical Dirichlet processes. Journal of the Americal Statistical Association. to appear.

Tenenbaum, J. B., V. de Silva, and J. C. Langford (2000, December). A global framework for nonlinear dimensionality reduction. Science 290, 2319–2323.

Tesauro, G. (1994). TD-Gammon, a self-teaching backgammon program, achieves master-level play. Neural Computation 6(2), 215–219.

Thiesson, B., D. M. Chickering, D. Heckerman, and C. Meek (2004). ARMA time-series modelling with graphical models. In M. Chickering and J. Halpern (Eds.), Proceedings of the Twentieth Conference on Uncertainty in Artificial Intelligence, Banff, Canada, pp. 552–560. AUAI Press.

Tibshirani, R. (1996). Regression shrinkage and selection via the lasso. Journal of the Royal Statistical Society, B 58, 267–288.

Tierney, L. (1994). Markov chains for exploring posterior distributions. Annals of Statistics 22(4), 1701–1762.

Tikhonov, A. N. and V. Y. Arsenin (1977). Solutions of Ill-Posed Problems. V. H. Winston.

Tino, P. and I. T. Nabney (2002). Hierarchical GTM: constructing localized non-linear projection manifolds in a principled way. IEEE Transactions on Pattern Analysis and Machine Intelligence 24(5), 639–656.

Tino, P., I. T. Nabney, and Y. Sun (2001). Using directional curvatures to visualize folding patterns of the GTM projection manifolds. In

G. Dorffner, H. Bischof, and K. Hornik (Eds.), Artificial Neural Networks – ICANN 2001, pp. 421–428. Springer.

Tipping, M. E. (1999). Probabilistic visualisation of high-dimensional binary data. In M. S. Kearns, S. A. Solla, and D. A. Cohn (Eds.), Advances in Neural Information Processing Systems, Volume 11, pp. 592–598. MIT Press.

Tipping, M. E. (2001). Sparse Bayesian learning and the relevance vector machine. Journal of Machine Learning Research 1, 211–244.

Tipping, M. E. and C. M. Bishop (1997). Probabilistic principal component analysis. Technical Report NCRG/97/010, Neural Computing Research Group, Aston University.

Tipping, M. E. and C. M. Bishop (1999a). Mixtures of probabilistic principal component analyzers. Neural Computation 11(2), 443–482.

Tipping, M. E. and C. M. Bishop (1999b). Probabilistic principal component analysis. Journal of the Royal Statistical Society, Series B 21(3), 611–622.

Tipping, M. E. and A. Faul (2003). Fast marginal likelihood maximization for sparse Bayesian models. In C. M. Bishop and B. Frey (Eds.), Proceedings Ninth International Workshop on Artificial Intelligence and Statistics, Key West, Florida.

Tong, S. and D. Koller (2000). Restricted Bayes optimal classifiers. In Proceedings 17th National Conference on Artificial Intelligence, pp. 658– 664. AAAI.

Tresp, V. (2001). Scaling kernel-based systems to large data sets. Data Mining and Knowledge Discovery 5(3), 197–211.

Uhlenbeck, G. E. and L. S. Ornstein (1930). On the theory of Brownian motion. Phys. Rev. 36, 823– 841.

Valiant, L. G. (1984). A theory of the learnable. Communications of the Association for Computing Machinery 27, 1134–1142.

Vapnik, V. N. (1982). Estimation of dependences based on empirical data. Springer.

Vapnik, V. N. (1995). The nature of statistical learning theory. Springer.

Vapnik, V. N. (1998). Statistical learning theory. Wiley.

Veropoulos, K., C. Campbell, and N. Cristianini (1999). Controlling the sensitivity of support vector machines. In Proceedings of the International Joint Conference on Artificial Intelligence (IJCAI99), Workshop ML3, pp. 55–60.

Vidakovic, B. (1999). Statistical Modelling by Wavelets. Wiley.

Viola, P. and M. Jones (2004). Robust real-time face detection. International Journal of Computer Vision 57(2), 137–154.

Viterbi, A. J. (1967). Error bounds for convolutional codes and an asymptotically optimum decoding algorithm. IEEE Transactions on Information Theory IT-13, 260–267.

Viterbi, A. J. and J. K. Omura (1979). Principles of Digital Communication and Coding. McGraw-Hill.

Wahba, G. (1975). A comparison of GCV and GML for choosing the smoothing parameter in the generalized spline smoothing problem. Numerical Mathematics 24, 383–393.

Wainwright, M. J., T. S. Jaakkola, and A. S. Willsky (2005). A new class of upper bounds on the log partition function. IEEE Transactions on Information Theory 51, 2313–2335.

Walker, A. M. (1969). On the asymptotic behaviour of posterior distributions. Journal of the Royal Statistical Society, B 31(1), 80–88.

Walker, S. G., P. Damien, P. W. Laud, and A. F. M. Smith (1999). Bayesian nonparametric inference for random distributions and related functions (with discussion). Journal of the Royal Statistical Society, B 61(3), 485–527.

Watson, G. S. (1964). Smooth regression analysis. Sankhya: The Indian Journal of Statistics. Series ¯ A 26, 359–372.

Webb, A. R. (1994). Functional approximation by feed-forward networks: a least-squares approach to generalisation. IEEE Transactions on Neural Networks 5(3), 363–371.

Weisstein, E. W. (1999). CRC Concise Encyclopedia of Mathematics. Chapman and Hall, and CRC.

Weston, J. and C. Watkins (1999). Multi-class support vector machines. In M. Verlysen (Ed.), Proceedings ESANN’99, Brussels. D-Facto Publications.

Whittaker, J. (1990). Graphical Models in Applied Multivariate Statistics. Wiley.

Widrow, B. and M. E. Hoff (1960). Adaptive switching circuits. In IRE WESCON Convention Record, Volume 4, pp. 96–104. Reprinted in Anderson and Rosenfeld (1988).

Widrow, B. and M. A. Lehr (1990). 30 years of adaptive neural networks: perceptron, madeline, and backpropagation. Proceedings of the IEEE 78(9), 1415–1442.

Wiegerinck, W. and T. Heskes (2003). Fractional belief propagation. In S. Becker, S. Thrun, and K. Obermayer (Eds.), Advances in Neural Information Processing Systems, Volume 15, pp. 455– 462. MIT Press.

Williams, C. K. I. (1998). Computation with infinite neural networks. Neural Computation 10(5), 1203–1216.

Williams, C. K. I. (1999). Prediction with Gaussian processes: from linear regression to linear prediction and beyond. In M. I. Jordan (Ed.), Learning in Graphical Models, pp. 599–621. MIT Press.

Williams, C. K. I. and D. Barber (1998). Bayesian classification with Gaussian processes. IEEE Transactions on Pattern Analysis and Machine Intelligence 20, 1342–1351.

Williams, C. K. I. and M. Seeger (2001). Using the Nystrom method to speed up kernel machines. In T. K. Leen, T. G. Dietterich, and V. Tresp (Eds.), Advances in Neural Information Processing Systems, Volume 13, pp. 682–688. MIT Press.

Williams, O., A. Blake, and R. Cipolla (2005). Sparse Bayesian learning for efficient visual tracking. IEEE Transactions on Pattern Analysis and Machine Intelligence 27(8), 1292–1304.

Williams, P. M. (1996). Using neural networks to model conditional multivariate densities. Neural Computation 8(4), 843–854.

Winn, J. and C. M. Bishop (2005). Variational message passing. Journal of Machine Learning Research 6, 661–694.

Zarchan, P. and H. Musoff (2005). Fundamentals of Kalman Filtering: A Practical Approach (Second ed.). AIAA.

## Index

Page numbers in bold indicate the primary source of information for the corresponding topic.

1-of-K coding scheme, 424

acceptance criterion, 538, 541, 544 activation function, 180, 213, 227 active constraint, 328, 709 AdaBoost, 657, 658 adaline, 196 adaptive rejection sampling, 530 ADF, see assumed density filtering AIC, see Akaike information criterion Akaike information criterion, 33, 217 α family of divergences, 469 α recursion, 620 ancestral sampling, 365, 525, 613 annular flow, 679 AR model, see autoregressive model arc, 360 ARD, see automatic relevance determination ARMA, see autoregressive moving average assumed density filtering, 510 autoassociative networks, 592 automatic relevance determination, 259, 31 485, 582 autoregressive hidden Markov model, 632 autoregressive model, 609 autoregressive moving average, 304

backgammon, 3 backpropagation, 241 bagging, 656 basis function, 138, 172, 204, 227 batch training, 240 Baum-Welch algorithm, 618 Bayes’ theorem, 15 Bayes, Thomas, 21 Bayesian analysis, vii, 9, 21 hierarchical, 372 model averaging, 654 Bayesian information criterion, 33, 216 Bayesian model comparison, 161, 473, 483 Bayesian network, 360 Bayesian probability, 21 belief propagation, 403 Bernoulli distribution, 69, 113, 685 mixture model, 444 Bernoulli, Jacob, 69 beta distribution, 71, 686 beta recursion, 621 between-class covariance, 189 bias, 27, 149 bias parameter, 138, 181, 227, 346 bias-variance trade-off, 147 BIC, see Bayesian information criterion binary entropy, 495 binomial distribution, 70, 686

back-tracking, 415, 630 biological sequence, 610 bipartite graph, 401 bits, 49 blind source separation, 591 blocked path, 374, 378, 384 Boltzmann distribution, 387 Boltzmann, Ludwig Eduard, 53 Boolean logic, 21 boosting, 657 bootstrap, 23, 656 bootstrap filter, 646 box constraints, 333, 342 Box-Muller method, 527

C4.5, 663 calculus of variations, 462 canonical correlation analysis, 565 canonical link function, 212 CART, see classification and regression trees Cauchy distribution, 527, 529, 692 causality, 366 CCA, see canonical correlation analysis central differences, 246 central limit theorem, 78 chain graph, 393 chaining, 555 Chapman-Kolmogorov equations, 397 child node, 361 Cholesky decomposition, 528 chunking, 335 circular normal, see von Mises distribution classical probability, 21 classification, 3 classification and regression trees, 663 clique, 385 clustering, 3 clutter problem, 511 co-parents, 383, 492 code-book vectors, 429 combining models, 45, 653 committee, 655 complete data set, 440 completing the square, 86 computational learning theory, 326, 344 concave function, 56

concentration parameter, 108, 693 condensation algorithm, 646 conditional entropy, 55 conditional expectation, 20 conditional independence, 46, 372, 383 conditional mixture model, see mixture model conditional probability, 14 conjugate prior, 68, 98, 117, 490 convex duality, 494 convex function, 55, 493 convolutional neural network, 267 correlation matrix, 567 cost function, 41 covariance, 20 between-class, 189 within-class, 189 covariance matrix diagonal, 84 isotropic, 84 partitioned, 85, 307 positive definite, 308 Cox’s axioms, 21 credit assignment, 3 cross-entropy error function, 206, 209, 235, 631, 666 cross-validation, 32, 161 cumulative distribution function, 18 curse of dimensionality, 33, 36 curve fitting, 4

D map, see dependency map d-separation, 373, 378, 443 DAG, see directed acyclic graph DAGSVM, 339 data augmentation, 537 data compression, 429 decision boundary, 39, 179 decision region, 39, 179 decision surface, see decision boundary decision theory, 38 decision tree, 654, 663, 673 decomposition methods, 335 degrees of freedom, 559 degrees-of-freedom parameter, 102, 693 density estimation, 3, 67

density network, 597 dependency map, 392 descendant node, 376 design matrix, 142, 347 differential entropy, 53 digamma function, 687 directed acyclic graph, 362 directed cycle, 362 directed factorization, 381 Dirichlet distribution, 76, 687 Dirichlet, Lejeune, 77 discriminant function, 43, 180, 181 discriminative model, 43, 203 distortion measure, 424 distributive law of multiplication, 396 DNA, 610 document retrieval, 299 dual representation, 293, 329 dual-energy gamma densitometry, 678 dynamic programming, 411 dynamical system, 548 E step, see expectation step early stopping, 259 ECM, see expectation conditional maximization edge, 360 effective number of observations, 72, 101 effective number of parameters, 9, 170, 281 elliptical K-means, 444 EM, see expectation maximization emission probability, 611 empirical Bayes, see evidence approximation energy function, 387 entropy, 49 conditional, 55 differential, 53 relative, 55 EP, see expectation propagation -tube, 341 -insensitive error function, 340 equality constraint, 709 equivalent kernel, 159, 301 erf function, 211 error backpropagation, see backpropagation error function, 5, 23

error-correcting output codes, 339 Euler, Leonhard, 465 Euler-Lagrange equations, 705 evidence approximation, 165, 347, 581 evidence function, 161 expectation, 19 expectation conditional maximization, 454 expectation maximization, 113, 423, 440 Gaussian mixture, 435 generalized, 454 sampling methods, 536 expectation propagation, 315, 468, 505 expectation step, 437 explaining away, 378 exploitation, 3 exploration, 3 exponential distribution, 526, 688 exponential family, 68, 113, 202, 490 extensive variables, 490 face detection, 2 face tracking, 355 factor analysis, 583 mixture model, 595 factor graph, 360, 399, 625 factor loading, 584 factorial hidden Markov model, 633 factorized distribution, 464, 476 feature extraction, 2 feature map, 268 feature space, 292, 586 Fisher information matrix, 298 Fisher kernel, 298 Fisher’s linear discriminant, 186 flooding schedule, 417 forward kinematics, 272 forward problem, 272 forward propagation, 228, 243 forward-backward algorithm, 618 fractional belief propagation, 517 frequentist probability, 21 fuel system, 376 function interpolation, 299 functional, 462, 703 derivative, 463

gamma densitometry, 678 gamma distribution, 529, 688 gamma function, 71 gating function, 672 Gauss, Carl Friedrich, 79 Gaussian, 24, 78, 688 conditional, 85, 93 marginal, 88, 93 maximum likelihood, 93 mixture, 110, 270, 273, 430 sequential estimation, 94 sufficient statistics, 93 wrapped, 110 Gaussian kernel, 296 Gaussian process, 160, 303 Gaussian random field, 305 Gaussian-gamma distribution, 101, 690 Gaussian-Wishart distribution, 102, 475, 478, 690 GEM, see expectation maximization, generalized generalization, 2 generalized linear model, 180, 213 generalized maximum likelihood, see evidence ap proximation generative model, 43, 196, 297, 365, 572, 631 generative topographic mapping, 597 directional curvature, 599 magnification factor, 599 geodesic distance, 596 Gibbs sampling, 542 blocking, 546 Gibbs, Josiah Willard, 543 Gini index, 666 global minimum, 237 gradient descent, 240 Gram matrix, 293 graph-cut algorithm, 390 graphical model, 359 bipartite, 401 directed, 360 factorization, 362, 384 fully connected, 361 inference, 393 tree, 398 treewidth, 417 triangulated, 416

undirected, 360 Green’s function, 299 GTM, see generative topographic mapping Hamilton, William Rowan, 549 Hamiltonian dynamics, 548 Hamiltonian function, 549 Hammersley-Clifford theorem, 387 handwriting recognition, 1, 610, 614 handwritten digit, 565, 614, 677 head-to-head path, 376 head-to-tail path, 375 Heaviside step function, 206 Hellinger distance, 470 Hessian matrix, 167, 215, 217, 238, 249 diagonal approximation, 250 exact evaluation, 253 fast multiplication, 254 finite differences, 252 inverse, 252 outer product approximation, 251 heteroscedastic, 273, 311 hidden Markov model, 297, 610 autoregressive, 632 factorial, 633 forward-backward algorithm, 618 input-output, 633 left-to-right, 613 maximum likelihood, 615 scaling factor, 627 sum-product algorithm, 625 switching, 644 variational inference, 625 hidden unit, 227 hidden variable, 84, 364, 430, 559 hierarchical Bayesian model, 372 hierarchical mixture of experts, 673 hinge error function, 337 Hinton diagram, 584 histogram density estimation, 120 HME, see hierarchical mixture of experts hold-out set, 11 homogeneous flow, 679 homogeneous kernel, 292 homogeneous Markov chain, 540, 608

Hooke’s law, 580 hybrid Monte Carlo, 548 hyperparameter, 71, 280, 311, 346, 372, 502 hyperprior, 372

I map, see independence map i.i.d., see independent identically distributed ICA, see independent component analysis ICM, see iterated conditional modes ID3, 663 identifiability, 435 image de-noising, 387 importance sampling, 525, 532 importance weights, 533 improper prior, 118, 259, 472 imputation step, 537 imputation-posterior algorithm, 537 inactive constraint, 328, 709 incomplete data set, 440 independence map, 392 independent component analysis, 591 independent factor analysis, 592 independent identically distributed, 26, 379 independent variables, 17 independent, identically distributed, 605 induced factorization, 485 inequality constraint, 709 inference, 38, 42 information criterion, 33 information geometry, 298 information theory, 48 input-output hidden Markov model, 633 intensive variables, 490 intrinsic dimensionality, 559 invariance, 261 inverse gamma distribution, 101 inverse kinematics, 272 inverse problem, 272 inverse Wishart distribution, 102 IP algorithm, see imputation-posterior algorithm IRLS, see iterative reweighted least squares Ising model, 389 isomap, 596 isometric feature map, 596 iterated conditional modes, 389, 415

iterative reweighted least squares, 207, 210, 316, 354, 672

Jacobian matrix, 247, 264 Jensen’s inequality, 56 join tree, 416 junction tree algorithm, 392, 416

K nearest neighbours, 125 K-means clustering algorithm, 424, 443 K-medoids algorithm, 428 Kalman filter, 304, 637 extended, 644 Kalman gain matrix, 639 Kalman smoother, 637 Karhunen-Loeve transform, 561\` Karush-Kuhn-Tucker conditions, 330, 333, 342, 710 kernel density estimator, 122, 326 kernel function, 123, 292, 294 Fisher, 298 Gaussian, 296 homogeneous, 292 nonvectorial inputs, 297 stationary, 292 kernel PCA, 586 kernel regression, 300, 302 kernel substitution, 292 kernel trick, 292 kinetic energy, 549 KKT, see Karush-Kuhn-Tucker conditions KL divergence, see Kullback-Leibler divergence kriging, see Gaussian process Kullback-Leibler divergence, 55, 451, 468, 505

Lagrange multiplier, 707 Lagrange, Joseph-Louis, 329 Lagrangian, 328, 332, 341, 708 laminar flow, 678 Laplace approximation, 213, 217, 278, 315, 354 Laplace, Pierre-Simon, 24 large margin, see margin lasso, 145 latent class analysis, 444 latent trait model, 597 latent variable, 84, 364, 430, 559

lattice diagram, 414, 611, 621, 629 LDS, see linear dynamical system leapfrog discretization, 551 learning, 2 learning rate parameter, 240 least-mean-squares algorithm, 144 leave-one-out, 33 likelihood function, 22 likelihood weighted sampling, 534 linear discriminant, 181 Fisher, 186 linear dynamical system, 84, 635 inference, 638 linear independence, 696 linear regression, 138 EM, 448 mixture model, 667 variational, 486 linear smoother, 159 linear-Gaussian model, 87, 370 linearly separable, 179 link, 360 link function, 180, 213 Liouville’s Theorem, 550 LLE, see locally linear embedding LMS algorithm, see least-mean-squares algorithm local minimum, 237 local receptive field, 268 locally linear embedding, 596 location parameter, 118 log odds, 197 logic sampling, 525 logistic regression, 205, 336 Bayesian, 217, 498 mixture model, 670 multiclass, 209 logistic sigmoid, 114, 139, 197, 205, 220, 227, 495 logit function, 197 loopy belief propagation, 417 loss function, 41 loss matrix, 41 lossless data compression, 429 lossy data compression, 429 lower bound, 484 M step, see maximization step

machine learning, vii macrostate, 51 Mahalanobis distance, 80 manifold, 38, 590, 595, 681 MAP, see maximum posterior margin, 326, 327, 502 error, 334 soft, 332 marginal likelihood, 162, 165 marginal probability, 14 Markov blanket, 382, 384, 545 Markov boundary, see Markov blanket Markov chain, 397, 539 first order, 607 homogeneous, 540, 608 second order, 608 Markov chain Monte Carlo, 537 Markov model, 607 homogeneous, 612 Markov network, see Markov random fiel Markov random field, 84, 360, 383 max-sum algorithm, 411, 629 maximal clique, 385 maximal spanning tree, 416 maximization step, 437 maximum likelihood, 9, 23, 26, 116 Gaussian mixture, 432 singularities, 480 type 2, see evidence approximation maximum margin, see margin maximum posterior, 30, 441 MCMC, see Markov chain Monte Carlo MDN, see mixture density network MDS, see multidimensional scaling mean, 24 mean field theory, 465 mean value theorem, 52 measure theory, 19 memory-based methods, 292 message passing, 396 pending message, 417 schedule, 417 variational, 491 Metropolis algorithm, 538 Metropolis-Hastings algorithm, 541

microstate, 51 minimum risk, 44 Minkowski loss, 48 missing at random, 441, 579 missing data, 579 mixing coefficient, 111 mixture component, 111 mixture density network, 272, 673 mixture distribution, see mixture model mixture model, 162, 423 conditional, 273, 666 linear regression, 667 logistic regression, 670 symmetries, 483 mixture of experts, 672 mixture of Gaussians, 110, 270, 273, 430 MLP, see multilayer perceptron MNIST data, 677 model comparison, 6, 32, 161, 473, 483 model evidence, 161 model selection, 162 moment matching, 506, 510 momentum variable, 548 Monte Carlo EM algorithm, 536 Monte Carlo sampling, 24, 523 Moore-Penrose pseudo-inverse, see pseudo-inverse moralization, 391, 401 MRF, see Markov random field multidimensional scaling, 596 multilayer perceptron, 226, 229 multimodality, 272 multinomial distribution, 76, 114, 690 multiplicity, 51 mutual information, 55, 57

Nadaraya-Watson, see kernel regression naive Bayes model, 46, 380 nats, 50 natural language modelling, 610 natural parameters, 113 nearest-neighbour methods, 124 neural network, 225 convolutional, 267 regularization, 256 relation to Gaussian process, 319

Newton-Raphson, 207, 317 node, 360 noiseless coding theorem, 50 nonidentifiability, 585 noninformative prior, 23, 117 nonparametric methods, 68, 120 normal distribution, see Gaussian normal equations, 142 normal-gamma distribution, 101, 691 normal-Wishart distribution, 102, 475, 478, 691 normalized exponential, see softmax function novelty detection, 44 ν-SVM, 334

object recognition, 366 observed variable, 364 Occam factor, 217 oil flow data, 34, 560, 568, 678 Old Faithful data, 110, 479, 484, 681 on-line learning, see sequential learning one-versus-one classifier, 183, 339 one-versus-the-rest classifier, 182, 338 ordered over-relaxation, 545 Ornstein-Uhlenbeck process, 305 orthogonal least squares, 301 outlier, 44, 185, 212 outliers, 103 over-fitting, 6, 147, 434, 464 over-relaxation, 544

PAC learning, see probably approximately correct PAC-Bayesian framework, 345 parameter shrinkage, 144 parent node, 361 particle filter, 645 partition function, 386, 554 Parzen estimator, see kernel density estimator Parzen window, 123 pattern recognition, vii PCA, see principal component analysis pending message, 417 perceptron, 192 convergence theorem, 194 hardware, 196 perceptron criterion, 193 perfect map, 392

periodic variable, 105 phase space, 549 photon noise, 680 plate, 363 polynomial curve fitting, 4, 362 polytree, 399 position variable, 548 positive definite covariance, 81 positive definite matrix, 701 positive semidefinite covariance, 81 positive semidefinite matrix, 701 posterior probability, 17 posterior step, 537 potential energy, 549 potential function, 386 power EP, 517 power method, 563 precision matrix, 85 precision parameter, 24 predictive distribution, 30, 156 preprocessing, 2 principal component analysis, 561, 572, 593 Bayesian, 580 EM algorithm, 577 Gibbs sampling, 583 mixture distribution, 595 physical analogy, 580 principal curve, 595 principal subspace, 561 principal surface, 596 prior, 17 conjugate, 68, 98, 117, 490 consistent, 257 improper, 118, 259, 472 noninformative, 23, 117 probabilistic graphical model, see graphical model probabilistic PCA, 570 probability, 12 Bayesian, 21 classical, 21 density, 17 frequentist, 21 mass function, 19 prior, 45 product rule, 13, 14, 359

sum rule, 13, 14, 359 theory, 12 probably approximately correct, 344 probit function, 211, 219 probit regression, 210 product rule of probability, 13, 14, 359 proposal distribution, 528, 532, 538 protected conjugate gradients, 335 protein sequence, 610 pseudo-inverse, 142, 185 pseudo-random numbers, 526 quadratic discriminant, 199 quality parameter, 351 radial basis function, 292, 299 Rauch-Tung-Striebel equations, 637 regression, 3 regression function, 47, 95 regularization, 10 Tikhonov, 267 regularized least squares, 144 reinforcement learning, 3 reject option, 42, 45 rejection sampling, 528 relative entropy, 55 relevance vector, 348 relevance vector machine, 161, 345 responsibility, 112, 432, 477 ridge regression, 10 RMS error, see root-mean-square error Robbins-Monro algorithm, 95 robot arm, 272 robustness, 103, 185 root node, 399 root-mean-square error, 6 Rosenblatt, Frank, 193 rotation invariance, 573, 585 RTS equations, see Rauch-Tung-Striebel equations running intersection property, 416 RVM, see relevance vector machine sample mean, 27 sample variance, 27 sampling-importance-resampling, 534 scale invariance, 119, 261

scale parameter, 119 scaling factor, 627 Schwarz criterion, see Bayesian information criterion self-organizing map, 598 sequential data, 605 sequential estimation, 94 sequential gradient descent, 144, 240 sequential learning, 73, 143 sequential minimal optimization, 335 serial message passing schedule, 417 Shannon, Claude, 55 shared parameters, 368 shrinkage, 10 Shur complement, 87 sigmoid, see logistic sigmoid simplex, 76 single-class support vector machine, 339 singular value decomposition, 143 sinusoidal data, 682 SIR, see sampling-importance-resampling skip-layer connection, 229 slack variable, 331 slice sampling, 546 SMO, see sequential minimal optimization smoother matrix, 159 smoothing parameter, 122 soft margin, 332 soft weight sharing, 269 softmax function, 115, 198, 236, 274, 356, 497 SOM, see self-organizing map sparsity, 145, 347, 349, 582 sparsity parameter, 351 spectrogram, 606 speech recognition, 605, 610 sphereing, 568 spline functions, 139 standard deviation, 24 standardizing, 425, 567 state space model, 609 switching, 644 stationary kernel, 292 statistical bias, see bias statistical independence, see independent variables statistical learning theory, see computational le ing theory, 326, 344 steepest descent, 240 Stirling’s approximation, 51 stochastic, 5 stochastic EM, 536 stochastic gradient descent, 144, 240 stochastic process, 305 stratified flow, 678 Student’s t-distribution, 102, 483, 691 subsampling, 268 sufficient statistics, 69, 75, 116 sum rule of probability, 13, 14, 359 sum-of-squares error, 5, 29, 184, 232, 662 sum-product algorithm, 399, 402 for hidden Markov model, 625 supervised learning, 3 support vector, 330 support vector machine, 225 for regression, 339 multiclass, 338 survival of the fittest, 646 SVD, see singular value decomposition SVM, see support vector machine switching hidden Markov model, 644 switching state space model, 644 synthetic data sets, 682

tail-to-tail path, 374 tangent distance, 265 tangent propagation, 262, 263 tapped delay line, 609 target vector, 2 test set, 2, 32 threshold parameter, 181 tied parameters, 368 Tikhonov regularization, 267 time warping, 615 tomography, 679 training, 2 training set, 2 transition probability, 540, 610 translation invariance, 118, 261 tree-reweighted message passing, 517 treewidth, 417

trellis diagram, see lattice diagram triangulated graph, 416 type 2 maximum likelihood, see evidence approximation undetermined multiplier, see Lagrange multiplier undirected graph, see Markov random field uniform distribution, 692 uniform sampling, 534 uniquenesses, 584 unobserved variable, see latent variable unsupervised learning, 3 utility function, 41 validation set, 11, 32 Vapnik-Chervonenkis dimension, 344 variance, 20, 24, 149 variational inference, 315, 462, 635 for Gaussian mixture, 474 for hidden Markov model, 625 local, 493 VC dimension, see Vapnik-Chervonenkis dimension vector quantization, 429 vertex, see node visualization, 3 Viterbi algorithm, 415, 629 von Mises distribution, 108, 693 wavelets, 139 weak learner, 657 weight decay, 10, 144, 257 weight parameter, 227 weight sharing, 268 soft, 269 weight vector, 181 weight-space symmetry, 231, 281 weighted least squares, 668 well-determined parameters, 170 whitening, 299, 568 Wishart distribution, 102, 693 within-class covariance, 189 Woodbury identity, 696 wrapped distribution, 110 Yellowstone National Park, 110, 681

PATTERN RECOGNITION AND MACHINE LEARNING SOLUTIONS TO EXERCISES WEB-EDITION MARKUS SVENSÉN CHRISTOPHER M. BISHOP

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/96db2a273c2bb723b37fca7fc12f76be7be253fe72c04c4eeb677f7a05c59c5d.jpg)

# Pattern Recognition and Machine Learning Solutions to the Exercises: Web-Edition

Markus Svensen and Christopher M. Bishop´

Copyright c 2002–2007

This is the solutions manual (web-edition) for the book Pattern Recognition and Machine Learning (PRML; published by Springer in 2006). It contains solutions to the www exercises. This release was created August 3, 2007; eventual future releases with corrections to errors will be published on the PRML web-site (see below).

The authors would like to express their gratitude to the various people who have provided feedback on pre-releases of this document. In particular, the “Bishop Reading Group”, held in the Visual Geometry Group at the University of Oxford provided valuable comments and suggestions.

The authors welcome all comments, questions and suggestions about the solutions as well as reports on (potential) errors in text or formulae in this document; please send any such feedback to Markus Svens´en, markussv@microsoft.com.

Further information about PRML is available from:

## Contents

Contents 5
Chapter 1: Pattern Recognition . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
Chapter 2: Density Estimation . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 19
Chapter 3: Linear Models for Regression. 34
Chapter 4: Linear Models for Classification. 41
Chapter 5: Neural Networks. 46
Chapter 6: Kernel Methods. 53
Chapter 7: Sparse Kernel Machines. 59
Chapter 8: Probabilistic Graphical Models. 63
Chapter 9: Mixture Models. 68
Chapter 10: Variational Inference and EM. 72
Chapter 11: Sampling Methods. 82
Chapter 12: Latent Variables. 84
Chapter 13: Sequential Data. 91
Chapter 14: Combining Models. 95

1.1 Substituting (1.1) into (1.2) and then differentiating with respect to $w_{i}$ we obtain

$$
\sum_{n = 1}^{N} \left(\sum_{j = 0}^{M} w_{j} x_{n}^{j} - t_{n}\right) x_{n}^{i} = 0.\tag{1}
$$

Re-arranging terms then gives the required result.

1.4 We are often interested in finding the most probable value for some quantity. In the case of probability distributions over discrete variables this poses little problem. However, for continuous variables there is a subtlety arising from the nature of probability densities and the way they transform under non-linear changes of variable.

Consider first the way a function $f(x)$ behaves when we change to a new variable y where the two variables are related by $x = g(y)$ . This defines a new function of $y$ given by

$$
\widetilde{f}(y) = f(g(y)).\tag{2}
$$

Suppose $f(x)$ has a mode (i.e. a maximum) at $\widehat{x}$ so that $f^{\prime}(\widehat{x}) = 0$ . The corresponding mode of $\widetilde f(\boldsymbol y)$ will occur for a value $\widehat{y}$ obtained by differentiating both sides of (2) with respect to y

$$
\widetilde{f}^{\prime}(\widehat{y}) = f^{\prime}(g(\widehat{y})) g^{\prime}(\widehat{y}) = 0.\tag{3}
$$

Assuming $g^{\prime}(\widehat{y}) \neq 0$ at the mode, then $f^{\prime}(g(\widehat{y})) = 0$ . However, we know that $f^{\prime}(\widehat{x}) = \widehat{0}$ , and so we see that the locations of the mode expressed in terms of each of the variables x and $y$ are related by ${\widehat{x}} = g({\widehat{y}})$ , as one would expect. Thus, finding a mode with respect to the variable x is completely equivalent to first transforming to the variable $y,$ then finding a mode with respect to y, and then transforming back to x.

Now consider the behaviour of a probability density $p_{x}(x)$ under the change of vari ables $x = g(y)$ , where the density with respect to the new variable is $p_{y}(y)$ and is given by ((1.27)). Let us write $g^{\prime}(y) = s | g^{\prime}(y) |$ where $s \in \{- 1, + 1\}$ . Then ((1.27)) can be written

$$
p_{y}(y) = p_{x}(g(y)) sg^{\prime}(y).
$$

Differentiating both sides with respect to y then gives

$$
p_{y}^{\prime}(y) = sp_{x}^{\prime}(g(y)) \{g^{\prime}(y)\}^{2} + sp_{x}(g(y)) g^{\prime \prime}(y).\tag{4}
$$

Due to the presence of the second term on the right hand side of (4) the relationship ${\widehat{x}} = g({\widehat{y}})$ no longer holds. Thus the value of x obtained by maximizing $p_{x}(x)$ will not be the value obtained by transforming to $p_{y}(y)$ then maximizing with respect to y and then transforming back to x. This causes modes of densities to be dependent on the choice of variables. In the case of linear transformation, the second term on

Example of the transformation of the mode of a density under a nonlinear change of variables, illustrating the different behaviour compared to a simple function. See the text for details.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/4f98bebc13931b9b658f1f72ffea9082e9d69085206c76109929755e2c140b7d.jpg)

the right hand side of (4) vanishes, and so the location of the maximum transforms according to ${\widehat{x}} = g({\widehat{y}})$

This effect can be illustrated with a simple example, as shown in Figure 1. We begin by considering a Gaussian distribution $p_{x}(x)$ over $x$ with mean $\mu = 6$ and standard deviation $\sigma = 1$ , shown by the red curve in Figure 1. Next we draw a sample of $N = 50$ , 000 points from this distribution and plot a histogram of their values, which as expected agrees with the distribution $p_{x}(x)$

Now consider a non-linear change of variables from x to y given by

$$
x = g(y) = \ln(y) - \ln(1 - y) + 5.\tag{5}
$$

The inverse of this function is given by

$$
y = g^{- 1}(x) = \frac{1}{1 + \exp(- x + 5)}\tag{6}
$$

which is a logistic sigmoid function, and is shown in Figure 1 by the blue curve.

If we simply transform $p_{x}(x)$ as a function of x we obtain the green curve $p_{x}(g(y))$ shown in Figure 1, and we see that the mode of the density $p_{x}(x)$ is transformed via the sigmoid function to the mode of this curve. However, the density over y transforms instead according to (1.27) and is shown by the magenta curve on the left side of the diagram. Note that this has its mode shifted relative to the mode of the green curve.

To confirm this result we take our sample of 50, 000 values of $x,$ evaluate the corresponding values of y using (6), and then plot a histogram of their values. We see that this histogram matches the magenta curve in Figure 1 and not the green curve!

1.7 The transformation from Cartesian to polar coordinates is defined by

$$
x = r \cos \theta\tag{7}
$$

$$
y = r \sin \theta\tag{8}
$$

and hence we have $x^{2} + y^{2} = r^{2}$ where we have used the well-known trigonometric result (2.177). Also the Jacobian of the change of variables is easily seen to be

$$
\begin{array}{rcl} \frac{\partial(x, y)}{\partial(r, \theta)} & = & \left| \begin{array}{cc} \frac{\partial x}{\partial r} & \frac{\partial x}{\partial \theta} \\ \frac{\partial y}{\partial r} & \frac{\partial y}{\partial \theta} \end{array} \right| \\ & = & \left| \begin{array}{cc} \cos \theta & - r \sin \theta \\ \sin \theta & r \cos \theta \end{array} \right| = r \end{array}
$$

where again we have used (2.177). Thus the double integral in (1.125) becomes

$$
I^{2} = \int_{0}^{2 \pi} \int_{0}^{\infty} \exp \left(- \frac{r^{2}}{2 \sigma^{2}}\right) r d r d \theta\tag{9}
$$

$$
{=}{2 \pi \int_{0}^{\infty} \exp \left(- \frac{u}{2 \sigma^{2}} \right) \frac{1}{2} d u}\tag{10}
$$

$$
= \pi \left[\exp \left(- \frac{u}{2 \sigma^{2}}\right)(- 2 \sigma^{2}) \right]_{0}^{\infty}\tag{11}
$$

$$
= 2 \pi \sigma^{2}\tag{12}
$$

where we have used the change of variables $r^{2} = u$ . Thus

$$
I = \left(2 \pi \sigma^{2}\right)^{1 / 2}.
$$

Finally, using the transformation $y = x - \mu.$ , the integral of the Gaussian distribution becomes

$$
\begin{array}{rcl} \int_{- \infty}^{\infty} \mathcal{N}(x | \mu, \sigma^{2}) d x & = & \frac{1}{(2 \pi \sigma^{2})^{1 / 2}} \int_{- \infty}^{\infty} \exp \left(- \frac{y^{2}}{2 \sigma^{2}}\right) d y \\ & = & \frac{I}{(2 \pi \sigma^{2})^{1 / 2}} = 1 \end{array}
$$

as required.

1.8 From the definition (1.46) of the univariate Gaussian distribution, we have

$$
\mathbb{E}[x] = \int_{- \infty}^{\infty} \left(\frac{1}{2 \pi \sigma^{2}}\right)^{1 / 2} \exp \left\{- \frac{1}{2 \sigma^{2}}(x - \mu)^{2} \right\} x d x.\tag{13}
$$

Now change variables using $y = x - \mu$ to give

$$
\mathbb{E}[x] = \int_{- \infty}^{\infty} \left(\frac{1}{2 \pi \sigma^{2}}\right)^{1 / 2} \exp \left\{- \frac{1}{2 \sigma^{2}} y^{2} \right\}(y + \mu) d y.\tag{14}
$$

We now note that in the factor $(y + \mu)$ the first term in $y$ corresponds to an odd integrand and so this integral must vanish (to show this explicitly, write the integral as the sum of two integrals, one from  to 0 and the other from 0 to  and then show that these two integrals cancel). In the second term, $\mu$ is a constant and pulls outside the integral, leaving a normalized Gaussian distribution which integrates to 1, and so we obtain (1.49).

To derive (1.50) we first substitute the expression (1.46) for the normal distribution into the normalization result (1.48) and re-arrange to obtain

$$
\int_{- \infty}^{\infty} \exp \left\{- \frac{1}{2 \sigma^{2}}(x - \mu)^{2} \right\} d x = \left(2 \pi \sigma^{2}\right)^{1 / 2}.\tag{15}
$$

We now differentiate both sides of (15) with respect to $\sigma^{2}$ and then re-arrange to obtain

$$
\left(\frac{1}{2 \pi \sigma^{2}}\right)^{1 / 2} \int_{- \infty}^{\infty} \exp \left\{- \frac{1}{2 \sigma^{2}}(x - \mu)^{2} \right\}(x - \mu)^{2} d x = \sigma^{2}\tag{16}
$$

which directly shows that

$$
\mathbb{E}[(x - \mu)^{2}] = \mathrm{var}[x] = \sigma^{2}.\tag{17}
$$

Now we expand the square on the left-hand side giving

$$
\mathbb{E}[x^{2}] - 2 \mu \mathbb{E}[x] + \mu^{2} = \sigma^{2}.
$$

Making use of (1.49) then gives (1.50) as required.

Finally, (1.51) follows directly from (1.49) and (1.50)

$$
\mathbb{E}[x^{2}] - \mathbb{E}[x]^{2} =(\mu^{2} + \sigma^{2}) - \mu^{2} = \sigma^{2}.
$$

1.9 For the univariate case, we simply differentiate (1.46) with respect to x to obtain

$$
\frac{d}{d x} \mathcal{N}(x | \mu, \sigma^{2}) = - \mathcal{N}(x | \mu, \sigma^{2}) \frac{x - \mu}{\sigma^{2}}.
$$

Setting this to zero we obtain $x = \mu$

Similarly, for the multivariate case we differentiate (1.52) with respect to x to obtain

$$
\begin{array}{rcl} \frac{\partial}{\partial \mathbf{x}} \mathcal{N}(\mathbf{x} | \boldsymbol{\mu}, \boldsymbol{\Sigma}) & = & - \frac{1}{2} \mathcal{N}(\mathbf{x} | \boldsymbol{\mu}, \boldsymbol{\Sigma}) \nabla_{\mathbf{x}} \left\{(\mathbf{x} - \boldsymbol{\mu})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{x} - \boldsymbol{\mu}) \right\} \\ & = & - \mathcal{N}(\mathbf{x} | \boldsymbol{\mu}, \boldsymbol{\Sigma}) \boldsymbol{\Sigma}^{- 1}(\mathbf{x} - \boldsymbol{\mu}), \end{array}
$$

where we have used (C.19), (C.20) and the fact that $\Sigma^{- 1}$ is symmetric. Setting this derivative equal to 0, and left-multiplying by Σ, leads to the solution $\mathbf{x} = \pmb{\mu}$

1.10 Since x and z are independent, their joint distribution factorizes $p(x, z) = p(x) p(z)$ and so

$$
\mathbb{E}[x + z] = \iint(x + z) p(x) p(z) d x d z\tag{18}
$$

$$
= \int xp(x) d x + \int zp(z) d z\tag{19}
$$

$$
= \mathbb{E}[x] + \mathbb{E}[z].\tag{20}
$$

Similarly for the variances, we first note that

$$
(x + z - \mathbb{E}[x + z])^{2} =(x - \mathbb{E}[x])^{2} +(z - \mathbb{E}[z])^{2} + 2(x - \mathbb{E}[x])(z - \mathbb{E}[z])\tag{21}
$$

where the final term will integrate to zero with respect to the factorized distribution $p(x) p(z)$ . Hence

$$
\begin{array}{rcl} \operatorname{var}[x + z] & = & \iint(x + z - \mathbb{E}[x + z])^{2} p(x) p(z) d x d z \\ & = & \int(x - \mathbb{E}[x])^{2} p(x) d x + \int(z - \mathbb{E}[z])^{2} p(z) d z \\ & = & \operatorname{var}(x) + \operatorname{var}(z).\end{array}\tag{22}
$$

For discrete variables the integrals are replaced by summations, and the same results are again obtained.

1.12 If $m = n$ then $x_{n} x_{m} = x_{n}^{2}$ and using (1.50) we obtain $\mathbb{E}[x_{n}^{2}] = \mu^{2} + \sigma^{2}$ , whereas if n = m then the two data points $x_{n}$ and $x_{m}$ are independent and hence $\mathbb{E}[x_{n} x_{m}] =$ $\mathbb{E}[{\dot{x}}_{n}] \mathbb{E}[x_{m}] = \mu^{2}$ where we have used (1.49). Combining these two results we obtain (1.130).

Next we have

$$
\mathbb{E}[\mu_{\mathrm{ML}}] = \frac{1}{N} \sum_{n = 1}^{N} \mathbb{E}[x_{n}] = \mu\tag{23}
$$

using (1.49).

Finally, consider $\mathbb{E}[\sigma_{\mathrm{ML}}^{2}]$ . From (1.55) and (1.56), and making use of (1.130), we have

$$
\begin{array}{lll} \mathbb{E}[\sigma_{\mathrm{ML}}^{2}] & = & \mathbb{E} \left[\frac{1}{N} \sum_{n = 1}^{N} \left(x_{n} - \frac{1}{N} \sum_{m = 1}^{N} x_{m}\right)^{2} \right] \\ & = & \frac{1}{N} \sum_{n = 1}^{N} \mathbb{E} \left[x_{n}^{2} - \frac{2}{N} x_{n} \sum_{m = 1}^{N} x_{m} + \frac{1}{N^{2}} \sum_{m = 1}^{N} \sum_{l = 1}^{N} x_{m} x_{l} \right] \\ & = & \left\{\mu^{2} + \sigma^{2} - 2 \left(\mu^{2} + \frac{1}{N} \sigma^{2}\right) + \mu^{2} + \frac{1}{N} \sigma^{2} \right\} \\ & = & \left(\frac{N - 1}{N}\right) \sigma^{2} \end{array}\tag{24}
$$

as required.

1.15 The redundancy in the coefficients in (1.133) arises from interchange symmetries between the indices $i_{k}$ . Such symmetries can therefore be removed by enforcing an ordering on the indices, as in (1.134), so that only one member in each group of equivalent configurations occurs in the summation.

To derive (1.135) we note that the number of independent parameters $n(D, M)$ which appear at order M can be written as

$$
n(D, M) = \sum_{i_{1} = 1}^{D} \sum_{i_{2} = 1}^{i_{1}} \dots \sum_{i_{M} = 1}^{i_{M - 1}} 1\tag{25}
$$

which has M terms. This can clearly also be written as

$$
n(D, M) = \sum_{i_{1} = 1}^{D} \left\{\sum_{i_{2} = 1}^{i_{1}} \dots \sum_{i_{M} = 1}^{i_{M - 1}} 1 \right\}\tag{26}
$$

where the term in braces has $M - 1$ terms which, from (25), must equal $n(i_{1}, M - 1)$ . Thus we can write

$$
n(D, M) = \sum_{i_{1} = 1}^{D} n(i_{1}, M - 1)\tag{27}
$$

which is equivalent to (1.135).

To prove (1.136) we first set $D = 1$ on both sides of the equation, and make use of $0 ! = 1$ , which gives the value 1 on both sides, thus showing the equation is valid for $D = 1$ . Now we assume that it is true for a specific value of dimensionality D and then show that it must be true for dimensionality $D + 1$ . Thus consider the left-hand side of (1.136) evaluated for $D + 1$ which gives

$$
\begin{array}{lll} \sum_{i = 1}^{D + 1} \frac{(i + M - 2) !}{(i - 1) !(M - 1) !} & = & \frac{(D + M - 1) !}{(D - 1) ! M !} + \frac{(D + M - 1) !}{D !(M - 1) !} \\ & = & \frac{(D + M - 1) ! D +(D + M - 1) ! M}{D ! M !} \\ & = & \frac{(D + M) !}{D ! M !} \end{array}\tag{28}
$$

which equals the right hand side of (1.136) for dimensionality $D + 1$ . Thus, by induction, (1.136) must hold true for all values of D.

Finally we use induction to prove (1.137). For $M = 2$ we find obtain the standard result $\begin{array}{r}{\dot{n}(D, 2) = \frac{1}{2} D(D + \hat{1})} \end{array}$ , which is also proved in Exercise 1.14. Now assume that (1.137) is correct for a specific order $M - 1$ so that

$$
n(D, M - 1) = \frac{(D + M - 2) !}{(D - 1) !(M - 1) !}.\tag{29}
$$

Substituting this into the right hand side of (1.135) we obtain

$$
n(D, M) = \sum_{i = 1}^{D} \frac{(i + M - 2) !}{(i - 1) !(M - 1) !}\tag{30}
$$

which, making use of (1.136), gives

$$
n(D, M) = \frac{(D + M - 1) !}{(D - 1) ! M !}\tag{31}
$$

and hence shows that (1.137) is true for polynomials of order M . Thus by induction (1.137) must be true for all values of M .

## 1.17 Using integration by parts we have

$$
\begin{array}{rcl} \Gamma(x + 1) & = & \int_{0}^{\infty} u^{x} e^{- u} d u \\ & = & \left[- e^{- u} u^{x} \right]_{0}^{\infty} + \int_{0}^{\infty} xu^{x - 1} e^{- u} d u = 0 + x \Gamma(x).\end{array}\tag{32}
$$

For $x = 1$ we have

$$
\Gamma(1) = \int_{0}^{\infty} e^{- u} d u = \left[- e^{- u} \right]_{0}^{\infty} = 1.\tag{33}
$$

If x is an integer we can apply proof by induction to relate the gamma function to the factorial function. Suppose that $\Gamma(x + 1) = x !$ holds. Then from the result (32) we have $\Gamma(x + 2) =(x + 1) \Gamma(x + 1) =(x + 1) !$ . Finally, $\Gamma(1) = 1 = 0 !$ , which completes the proof by induction.

1.18 On the right-hand side of (1.142) we make the change of variables $u = r^{2}$ to give

$$
\frac{1}{2} S_{D} \int_{0}^{\infty} e^{- u} u^{D / 2 - 1} d u = \frac{1}{2} S_{D} \Gamma(D / 2)\tag{34}
$$

where we have used the definition (1.141) of the Gamma function. On the left hand side of (1.142) we can use (1.126) to obtain $\pi^{D / 2}$ . Equating these we obtain the desired result (1.143).

The volume of a sphere of radius 1 in D-dimensions is obtained by integration

$$
V_{D} = S_{D} \int_{0}^{1} r^{D - 1} d r = \frac{S_{D}}{D}.\tag{35}
$$

For $D = 2$ and $D = 3$ we obtain the following results

$$
S_{2} = 2 \pi, \qquad S_{3} = 4 \pi, \qquad V_{2} = \pi a^{2}, \qquad V_{3} = \frac{4}{3} \pi a^{3}.\tag{36}
$$

1.20 Since $p(\mathbf{x})$ is radially symmetric it will be roughly constant over the shell of radius r and thickness $\epsilon$. This shell has volume $S_{D} r^{D - 1} e$ $\epsilon$ and since $\| \mathbf{x} \|^{2} = r^{2}$ we have

$$
\int_{\mathrm{shell}} p(\mathbf{x}) d \mathbf{x} \simeq p(r) S_{D} r^{D - 1} \epsilon\tag{37}
$$

from which we obtain (1.148). We can find the stationary points of $p(r)$ by differentiation

$$
\frac{d}{d r} p(r) \propto \left[(D - 1) r^{D - 2} + r^{D - 1} \left(- \frac{r}{\sigma^{2}}\right) \right] \exp \left(- \frac{r^{2}}{2 \sigma^{2}}\right) = 0.\tag{38}
$$

Solving for $r,$ and using $D \gg 1$ , we obtain $\widehat{r} \simeq \sqrt{D} \sigma$

Next we note that

$$
\begin{array}{rcl} p(\widehat{r} + \epsilon) & \propto &(\widehat{r} + \epsilon)^{D - 1} \exp \left[- \frac{(\widehat{r} + \epsilon)^{2}}{2 \sigma^{2}} \right] \\ & = & \exp \left[- \frac{(\widehat{r} + \epsilon)^{2}}{2 \sigma^{2}} +(D - 1) \ln(\widehat{r} + \epsilon) \right].\end{array}\tag{39}
$$

We now expand $p(r)$ around the point ${\widehat{r}}.$ Since this is a stationary point of $p(r)$ we must keep terms up to second order. Making use of the expansion ln $(1 + x) =$ $x - x^{2} / 2 + \overset{\cdot}{O}(x^{3})$ , together with $D \gg 1$ , we obtain (1.149).

Finally, from (1.147) we see that the probability density at the origin is given by

$$
p(\mathbf{x} = \mathbf{0}) = \frac{1}{(2 \pi \sigma^{2})^{1 / 2}}
$$

while the density at $\| \mathbf{x} \| ={\widehat{r}}$ is given from (1.147) by

$$
p(\| \mathbf{x} \| = \widehat{r}) = \frac{1}{(2 \pi \sigma^{2})^{1 / 2}} \exp \left(- \frac{\widehat{r}^{2}}{2 \sigma^{2}}\right) = \frac{1}{(2 \pi \sigma^{2})^{1 / 2}} \exp \left(- \frac{D}{2}\right)
$$

where we have used $\widehat{r} \simeq \sqrt{D} \sigma$ . Thus the ratio of densities is given by $\exp(D / 2)$

1.22 Substituting $L_{kj} = 1 - \delta_{kj}$ into (1.81), and using the fact that the posterior probabilities sum to one, we find that, for each x we should choose the class $j$ for which $1 - p(\mathcal{C}_{j} | \mathbf{x})$ is a minimum, which is equivalent to choosing the $j$ for which the posterior probability $p(\mathcal{C}_{j} | \mathbf{x})$ is a maximum. This loss matrix assigns a loss of one if the example is misclassified, and a loss of zero if it is correctly classified, and hence minimizing the expected loss will minimize the misclassification rate.

1.24 A vector x belongs to class $\mathcal{C}_{k}$ with probability $p(\mathcal{C}_{k} \vert \mathbf{x})$ . If we decide to assign x to class $\mathcal{C}_{j}$ we will incur an expected loss of $\begin{array}{r}{\sum_{k} L_{kj} p(\mathcal{C}_{k} | \mathbf{x})} \end{array}$ , whereas if we select the reject option we will incur a loss of $\lambda.$ Thus, if

$$
j = \arg \min_{l} \sum_{k} L_{kl} p(\mathcal{C}_{k} | \mathbf{x})\tag{40}
$$

then we minimize the expected loss if we take the following action

$$
\text{choose} \left\{\begin{array}{ll} \text{class} j, & \text{if} \min_{l} \sum_{k} L_{kl} p(\mathcal{C}_{k} | \mathbf{x}) < \lambda; \\ \text{reject}, & \text{otherwise}.\end{array} \right.\tag{41}
$$

For a loss matrix $L_{kj} = 1 - I_{kj}$ we have $\begin{array}{r}{\sum_{k} L_{kl} p(\mathcal{C}_{k} | \mathbf{x}) = 1 - p(\mathcal{C}_{l} | \mathbf{x})} \end{array}$ and so we reject unless the smallest value of $1 - p(\overline{{\mathcal{C}_{l}}} | \mathbf{\ddot{x}})$ is less than $\lambda,$ or equivalently if the largest value of $p(\mathcal{C}_{l} | \mathbf{x})$ is less than $1 - \lambda$ . In the standard reject criterion we reject if the largest posterior probability is less than $\theta.$ . Thus these two criteria for rejection are equivalent provided $\theta = 1 - \lambda$

1.25 The expected squared loss for a vectorial target variable is given by

$$
\mathbb{E}[L] = \iint \| \mathbf{y}(\mathbf{x}) - \mathbf{t} \|^{2} p(\mathbf{t}, \mathbf{x}) d \mathbf{x} d \mathbf{t}.
$$

Our goal is to choose $\mathbf{y}(\mathbf{x})$ so as to minimize $\mathbb{E}[L]$ . We can do this formally using the calculus of variations to give

$$
\frac{\delta \mathbb{E}[L]}{\delta \mathbf{y}(\mathbf{x})} = \int 2(\mathbf{y}(\mathbf{x}) - \mathbf{t}) p(\mathbf{t}, \mathbf{x}) d \mathbf{t} = 0.
$$

Solving for $\mathbf{y}(\mathbf{x})$ , and using the sum and product rules of probability, we obtain

$$
\mathbf{y}(\mathbf{x}) = \frac{\int \mathbf{t} p(\mathbf{t}, \mathbf{x}) d \mathbf{t}}{\int p(\mathbf{t}, \mathbf{x}) d \mathbf{t}} = \int \mathbf{t} p(\mathbf{t} | \mathbf{x}) d \mathbf{t}
$$

which is the conditional average of t conditioned on x. For the case of a scalar target variable we have

$$
y(\mathbf{x}) = \int tp(t | \mathbf{x}) d t
$$

which is equivalent to (1.89).

1.27 Since we can choose $y(\mathbf x)$ independently for each value of $\mathbf{x},$ the minimum of the expected $L_{q}$ loss can be found by minimizing the integrand given by

$$
\int | y(\mathbf{x}) - t |^{q} p(t | \mathbf{x}) d t\tag{42}
$$

for each value of $\mathbf{x}.$ Setting the derivative of (42) with respect to $y(\mathbf x)$ to zero gives the stationarity condition

$$
\begin{array}{l} \int q | y(\mathbf{x}) - t |^{q - 1} \mathrm{sign}(y(\mathbf{x}) - t) p(t | \mathbf{x}) d t \\ = q \int_{- \infty}^{y(\mathbf{x})} | y(\mathbf{x}) - t |^{q - 1} p(t | \mathbf{x}) d t - q \int_{y(\mathbf{x})}^{\infty} | y(\mathbf{x}) - t |^{q - 1} p(t | \mathbf{x}) d t = 0 \end{array}
$$

which can also be obtained directly by setting the functional derivative of (1.91) with respect to $y(\mathbf x)$ equal to zero. It follows that $y(\mathbf x)$ must satisfy

$$
\int_{- \infty}^{y(\mathbf{x})} | y(\mathbf{x}) - t |^{q - 1} p(t | \mathbf{x}) d t = \int_{y(\mathbf{x})}^{\infty} | y(\mathbf{x}) - t |^{q - 1} p(t | \mathbf{x}) d t.\tag{43}
$$

For the case of $q = 1$ this reduces to

$$
\int_{- \infty}^{y(\mathbf{x})} p(t | \mathbf{x}) d t = \int_{y(\mathbf{x})}^{\infty} p(t | \mathbf{x}) d t.\tag{44}
$$

which says that $y(\mathbf x)$ must be the conditional median of $t.$

For $q \to 0$ we note that, as a function of t, the quantity $| y(\mathbf{x}) - t |^{q}$ is close to 1 everywhere except in a small neighbourhood around $t = y(\mathbf{x})$ where it falls to zero. The value of (42) will therefore be close to 1, since the density $p(t)$ is normalized, but reduced slightly by the ‘notch’ close to $t = y(\mathbf{x})$ . We obtain the biggest reduction in (42) by choosing the location of the notch to coincide with the largest value of $p(t)$ ， i.e. with the (conditional) mode.

1.29 The entropy of an M -state discrete variable x can be written in the form

$$
H(x) = - \sum_{i = 1}^{M} p(x_{i}) \ln p(x_{i}) = \sum_{i = 1}^{M} p(x_{i}) \ln \frac{1}{p(x_{i})}.\tag{45}
$$

The function $\ln(x)$ is concave\_ and so we can apply Jensen’s inequality in the form (1.115) but with the inequality reversed, so that

$$
H(x) \leqslant \ln \left(\sum_{i = 1}^{M} p \left(x_{i}\right) \frac{1}{p \left(x_{i}\right)}\right) = \ln M.\tag{46}
$$

1.31 We first make use of the relation $\operatorname{I}(\mathbf{x}; \mathbf{y}) = \operatorname{H}(\mathbf{y}) - \operatorname{H}(\mathbf{y} | \mathbf{x})$ which we obtained in (1.121), and note that the mutual information satisfies $\operatorname{I}(\mathbf{x}; \mathbf{y}) \geqslant 0$ since it is a form of Kullback-Leibler divergence. Finally we make use of the relation (1.112) to obtain the desired result (1.152).

To show that statistical independence is a sufficient condition for the equality to be satisfied, we substitute $p(\mathbf{x}, \mathbf{y}) = p(\mathbf{x}) p(\mathbf{y})$ into the definition of the entropy, giving

$$
\begin{array}{rcl} \mathrm{H}(\mathbf{x}, \mathbf{y}) & = & \iint p(\mathbf{x}, \mathbf{y}) \ln p(\mathbf{x}, \mathbf{y}) d \mathbf{x} d \mathbf{y} \\ & = & \iint p(\mathbf{x}) p(\mathbf{y}) \{\ln p(\mathbf{x}) + \ln p(\mathbf{y})\} d \mathbf{x} d \mathbf{y} \\ & = & \int p(\mathbf{x}) \ln p(\mathbf{x}) d \mathbf{x} + \int p(\mathbf{y}) \ln p(\mathbf{y}) d \mathbf{y} \\ & = & \mathrm{H}(\mathbf{x}) + \mathrm{H}(\mathbf{y}).\end{array}
$$

To show that statistical independence is a necessary condition, we combine the equality condition

$$
\mathrm{H}(\mathbf{x}, \mathbf{y}) = \mathrm{H}(\mathbf{x}) + \mathrm{H}(\mathbf{y})
$$

with the result (1.112) to give

$$
\mathrm{H}(\mathbf{y} | \mathbf{x}) = \mathrm{H}(\mathbf{y}).
$$

We now note that the right-hand side is independent of x and hence the left-hand side must also be constant with respect to x. Using (1.121) it then follows that the mutual information $\begin{array}{r}{\operatorname{I}[\mathbf{x}, \mathbf{y}] = 0} \end{array}$ . Finally, using (1.120) we see that the mutual information is a form of KL divergence, and this vanishes only if the two distributions are equal, so that $p(\mathbf{x}, \mathbf{y}) = p(\mathbf{x}) p(\mathbf{y})$ as required.

1.34 Obtaining the required functional derivative can be done simply by inspection. However, if a more formal approach is required we can proceed as follows using the techniques set out in Appendix D. Consider first the functional

$$
I[p(x)] = \int p(x) f(x) d x.
$$

Under a small variation $p(x) p(x) + \epsilon \eta(x)$ we have

$$
I[p(x) + \epsilon \eta(x)] = \int p(x) f(x) d x + \epsilon \int \eta(x) f(x) d x
$$

and hence from (D.3) we deduce that the functional derivative is given by

$$
\frac{\delta I}{\delta p(x)} = f(x).
$$

Similarly, if we define

$$
J[p(x)] = \int p(x) \ln p(x) d x
$$

then under a small variation $p(x) p(x) + \epsilon \eta(x)$ we have

$$
\begin{array}{rcl} J[p(x) + \epsilon \eta(x)] & = & \int p(x) \ln p(x) d x \\ & & + \epsilon \left\{\int \eta(x) \ln p(x) d x + \int p(x) \frac{1}{p(x)} \eta(x) d x \right\} + O(\epsilon^{2}) \end{array}
$$

and hence

$$
\frac{\delta J}{\delta p(x)} = p(x) + 1.
$$

Using these two results we obtain the following result for the functional derivative

$$
- \ln p(x) - 1 + \lambda_{1} + \lambda_{2} x + \lambda_{3}(x - \mu)^{2}.
$$

Re-arranging then gives (1.108).

To eliminate the Lagrange multipliers we substitute (1.108) into each of the three constraints (1.105), (1.106) and (1.107) in turn. The solution is most easily obtained by comparison with the standard form of the Gaussian, and noting that the results

$$
\lambda_{1} = 1 - \frac{1}{2} \ln \left(2 \pi \sigma^{2}\right)\tag{47}
$$

$$
\lambda_{2} = 0
$$

$$
\lambda_{3} = \frac{1}{2 \sigma^{2}}\tag{48}
$$

(49)

do indeed satisfy the three constraints.

Note that there is a typographical error in the question, which should read ”Use calculus of variations to show that the stationary point of the functional shown just before (1.108) is given by (1.108)”.

For the multivariate version of this derivation, see Exercise 2.14.

1.35 Substituting the right hand side of (1.109) in the argument of the logarithm on the right hand side of (1.103), we obtain

$$
\begin{array}{rcl} \mathrm{H}[x] & = & - \int p(x) \ln p(x) d x \\ & = & - \int p(x) \left(- \frac{1}{2} \ln(2 \pi \sigma^{2}) - \frac{(x - \mu)^{2}}{2 \sigma^{2}}\right) d x \\ & = & \frac{1}{2} \left(\ln(2 \pi \sigma^{2}) + \frac{1}{\sigma^{2}} \int p(x)(x - \mu)^{2} d x\right) \\ & = & \frac{1}{2} \left(\ln(2 \pi \sigma^{2}) + 1\right), \end{array}
$$

where in the last step we used (1.107).

1.38 From (1.114) we know that the result (1.115) holds for $M = 1$ . We now suppose that it holds for some general value M and show that it must therefore hold for $M + 1$ Consider the left hand side of (1.115)

$$
f \left(\sum_{i = 1}^{M + 1} \lambda_{i} x_{i}\right) = f \left(\lambda_{M + 1} x_{M + 1} + \sum_{i = 1}^{M} \lambda_{i} x_{i}\right)\tag{50}
$$

$$
= f \left(\lambda_{M + 1} x_{M + 1} +(1 - \lambda_{M + 1}) \sum_{i = 1}^{M} \eta_{i} x_{i}\right)\tag{51}
$$

where we have defined

$$
\eta_{i} = \frac{\lambda_{i}}{1 - \lambda_{M + 1}}.\tag{52}
$$

We now apply (1.114) to give

$$
f \left(\sum_{i = 1}^{M + 1} \lambda_{i} x_{i}\right) \leqslant \lambda_{M + 1} f(x_{M + 1}) +(1 - \lambda_{M + 1}) f \left(\sum_{i = 1}^{M} \eta_{i} x_{i}\right).\tag{53}
$$

We now note that the quantities $\lambda_{i}$ by definition satisfy

$$
\sum_{i = 1}^{M + 1} \lambda_{i} = 1\tag{54}
$$

and hence we have

$$
\sum_{i = 1}^{M} \lambda_{i} = 1 - \lambda_{M + 1}\tag{55}
$$

Then using (52) we see that the quantities $\eta_{i}$ satisfy the property

$$
\sum_{i = 1}^{M} \eta_{i} = \frac{1}{1 - \lambda_{M + 1}} \sum_{i = 1}^{M} \lambda_{i} = 1.\tag{56}
$$

Thus we can apply the result (1.115) at order $M$ and so (53) becomes

$$
f \left(\sum_{i = 1}^{M + 1} \lambda_{i} x_{i}\right) \leqslant \lambda_{M + 1} f(x_{M + 1}) +(1 - \lambda_{M + 1}) \sum_{i = 1}^{M} \eta_{i} f(x_{i}) = \sum_{i = 1}^{M + 1} \lambda_{i} f(x_{i})\tag{57}
$$

where we have made use of (52).

1.41 From the product rule we have $p(\mathbf{x}, \mathbf{y}) = p(\mathbf{y} | \mathbf{x}) p(\mathbf{x})$ , and so (1.120) can be written as

$$
\begin{array}{rcl} I(\mathbf{x}; \mathbf{y}) & = & - \iint p(\mathbf{x}, \mathbf{y}) \ln p(\mathbf{y}) d \mathbf{x} d \mathbf{y} + \iint p(\mathbf{x}, \mathbf{y}) \ln p(\mathbf{y} | \mathbf{x}) d \mathbf{x} d \mathbf{y} \\ & = & - \int p(\mathbf{y}) \ln p(\mathbf{y}) d \mathbf{y} + \iint p(\mathbf{x}, \mathbf{y}) \ln p(\mathbf{y} | \mathbf{x}) d \mathbf{x} d \mathbf{y} \\ & = & H(\mathbf{y}) - H(\mathbf{y} | \mathbf{x}).\end{array}\tag{58}
$$

## Chapter 2 Density Estimation

2.1 From the definition (2.2) of the Bernoulli distribution we have

$$
\sum_{x \in \{0, 1\}} p(x | \mu) = p(x = 0 | \mu) + p(x = 1 | \mu)\tag{59}
$$

$$
=(1 - \mu) + \mu = 1\tag{60}
$$

$$
\sum_{x \in \{0, 1\}} xp(x | \mu) = 0.p(x = 0 | \mu) + 1.p(x = 1 | \mu) = \mu\tag{61}
$$

$$
\sum(x - \mu)^{2} p(x | \mu) = \mu^{2} p(x = 0 | \mu) +(1 - \mu)^{2} p(x = 1 | \mu)\tag{62}
$$

$$
x \in \{0, 1\}
$$

$$
= \mu^{2}(1 - \mu) +(1 - \mu)^{2} \mu = \mu(1 - \mu).\tag{63}
$$

The entropy is given by

$$
\begin{array}{rcl} H(x) & = & - \sum_{x \in \{0, 1\}} p(x | \mu) \ln p(x | \mu) \\ & = & - \sum_{x \in \{0, 1\}} \mu^{x}(1 - \mu)^{1 - x} \left\{x \ln \mu +(1 - x) \ln(1 - \mu) \right\} \\ & = & -(1 - \mu) \ln(1 - \mu) - \mu \ln \mu.\end{array}\tag{64}
$$

2.3 Using the definition (2.10) we have

$$
\begin{array}{ll} \binom{N}{n} + \binom{N}{n - 1} & = \frac{N !}{n !(N - n) !} + \frac{N !}{(n - 1) !(N + 1 - n) !} \\ & = \frac{(N + 1 - n) N ! + nN !}{n !(N + 1 - n) !} = \frac{(N + 1) !}{n !(N + 1 - n) !} \\ & = \binom{N + 1}{n}.\end{array}\tag{65}
$$

To prove the binomial theorem (2.263) we note that the theorem is trivially true for $N = 0$ . We now assume that it holds for some general value N and prove its correctness for $N + 1$ , which can be done as follows

$$
\begin{array}{lll}(1 + x)^{N + 1} & = &(1 + x) \sum_{n = 0}^{N} \binom{N}{n} x^{n} \\ & = & \sum_{n = 0}^{N} \binom{N}{n} x^{n} + \sum_{n = 1}^{N + 1} \binom{N}{n - 1} x^{n} \\ & = & \binom{N}{0} x^{0} + \sum_{n = 1}^{N} \left\{\binom{N}{n} + \binom{N}{n - 1} \right\} x^{n} + \binom{N}{N} x^{N + 1} \\ & = & \binom{N + 1}{0} x^{0} + \sum_{n = 1}^{N} \binom{N + 1}{n} x^{n} + \binom{N + 1}{N + 1} x^{N + 1} \\ & = & \sum_{n = 0}^{N + 1} \binom{N + 1}{n} x^{n} \end{array}\tag{66}
$$

which completes the inductive proof. Finally, using the binomial theorem, the normalization condition (2.264) for the binomial distribution gives

$$
\begin{array}{rcl} \sum_{n = 0}^{N} \binom{N}{n} \mu^{n}(1 - \mu)^{N - n} & = &(1 - \mu)^{N} \sum_{n = 0}^{N} \binom{N}{n} \left(\frac{\mu}{1 - \mu}\right)^{n} \\ & = &(1 - \mu)^{N} \left(1 + \frac{\mu}{1 - \mu}\right)^{N} = 1 \end{array}\tag{67}
$$

Figure 2 Plot of the region of integration of (68) in (x, t) space.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/fb1a81cea81141de73df232425c6473ecea3edc2e8c5273d30954390926ec6f1.jpg)

as required.

2.5 Making the change of variable $t = y + x$ in (2.266) we obtain

$$
\Gamma(a) \Gamma(b) = \int_{0}^{\infty} x^{a - 1} \left\{\int_{x}^{\infty} \exp(- t)(t - x)^{b - 1} d t \right\} d x.\tag{68}
$$

We now exchange the order of integration, taking care over the limits of integration

$$
\Gamma(a) \Gamma(b) = \int_{0}^{\infty} \int_{0}^{t} x^{a - 1} \exp(- t)(t - x)^{b - 1} d x d t.\tag{69}
$$

The change in the limits of integration in going from (68) to (69) can be understood by reference to Figure 2. Finally we change variables in the x integral using $x = t \mu$ to give

$$
\begin{array}{rcl} \Gamma(a) \Gamma(b) & = & \int_{0}^{\infty} \exp(- t) t^{a - 1} t^{b - 1} t d t \int_{0}^{1} \mu^{a - 1}(1 - \mu)^{b - 1} d \mu \\ & = & \Gamma(a + b) \int_{0}^{1} \mu^{a - 1}(1 - \mu)^{b - 1} d \mu.\end{array}\tag{70}
$$

2.9 When we integrate over $\mu_{{\cal M} - 1}$ the lower limit of integration is 0, while the upper limit is $1 - \textstyle \sum_{j = 1}^{M - 2} \mu_{j}$ since the remaining probabilities must sum to one (see Figure 2.4). Thus we have

$$
\begin{array}{l} p_{M - 1}(\mu_{1}, \ldots, \mu_{M - 2}) = \int_{0}^{1 - \sum_{j = 1}^{M - 2} \mu_{j}} p_{M}(\mu_{1}, \ldots, \mu_{M - 1}) d \mu_{M - 1} \\ = C_{M} \left[\prod_{k = 1}^{M - 2} \mu_{k}^{\alpha_{k} - 1} \right] \int_{0}^{1 - \sum_{j = 1}^{M - 2} \mu_{j}} \mu_{M - 1}^{\alpha_{M - 1} - 1} \left(1 - \sum_{j = 1}^{M - 1} \mu_{j}\right)^{\alpha_{M} - 1} d \mu_{M - 1}.\end{array}
$$

In order to make the limits of integration equal to 0 and 1 we change integration variable from $\mu_{M - 1}$ to t using

$$
\mu_{M - 1} = t \left(1 - \sum_{j = 1}^{M - 2} \mu_{j}\right)\tag{71}
$$

which gives

$$
\begin{array}{l} p_{M - 1} \left(\mu_{1}, \dots, \mu_{M - 2}\right) \\ = C_{M} \left[\prod_{k = 1}^{M - 2} \mu_{k}^{\alpha_{k} - 1} \right] \left(1 - \sum_{j = 1}^{M - 2} \mu_{j}\right)^{\alpha_{M - 1} + \alpha_{M} - 1} \int_{0}^{1} t^{\alpha_{M - 1} - 1}(1 - t)^{\alpha_{M} - 1} d t \\ = C_{M} \left[\prod_{k = 1}^{M - 2} \mu_{k}^{\alpha_{k} - 1} \right] \left(1 - \sum_{j = 1}^{M - 2} \mu_{j}\right)^{\alpha_{M - 1} + \alpha_{M} - 1} \frac{\Gamma(\alpha_{M - 1}) \Gamma(\alpha_{M})}{\Gamma(\alpha_{M - 1} + \alpha_{M})} \end{array} \tag{72}
$$

where we have used (2.265). The right hand side of (72) is seen to be a normalized Dirichlet distribution over $M - 1$ variables, with coefficients $\alpha_{1}, \ldots, \alpha_{M - 2}, \alpha_{M - 1} +$ $\alpha_{M}$ , (note that we have effectively combined the final two categories) and we can identify its normalization coefficient using (2.38). Thus

$$
\begin{array}{rcl} C_{M} & = & \frac{\Gamma(\alpha_{1} + \ldots + \alpha_{M})}{\Gamma(\alpha_{1}) \ldots \Gamma(\alpha_{M - 2}) \Gamma(\alpha_{M - 1} + \alpha_{M})} \cdot \frac{\Gamma(\alpha_{M - 1} + \alpha_{M})}{\Gamma(\alpha_{M - 1}) \Gamma(\alpha_{M})} \\ & = & \frac{\Gamma(\alpha_{1} + \ldots + \alpha_{M})}{\Gamma(\alpha_{1}) \ldots \Gamma(\alpha_{M})} \end{array}\tag{73}
$$

as required.

2.11 We first of all write the Dirichlet distribution (2.38) in the form

$$
\operatorname{Dir}(\boldsymbol{\mu} | \boldsymbol{\alpha}) = K(\boldsymbol{\alpha}) \prod_{k = 1}^{M} \mu_{k}^{\alpha_{k} - 1}
$$

where

$$
K(\boldsymbol{\alpha}) = \frac{\Gamma(\alpha_{0})}{\Gamma(\alpha_{1}) \cdots \Gamma(\alpha_{M})}.
$$

Next we note the following relation

$$
\begin{array}{rcl} \frac{\partial}{\partial \alpha_{j}} \prod_{k = 1}^{M} \mu_{k}^{\alpha_{k} - 1} & = & \frac{\partial}{\partial \alpha_{j}} \prod_{k = 1}^{M} \exp \left((\alpha_{k} - 1) \ln \mu_{k}\right) \\ & = & \prod_{k = 1}^{M} \ln \mu_{j} \exp \left\{(\alpha_{k} - 1) \ln \mu_{k} \right\} \\ & = & \ln \mu_{j} \prod_{k = 1}^{M} \mu_{k}^{\alpha_{k} - 1} \end{array}
$$

from which we obtain

$$
\begin{array}{rcl} E[\ln \mu_{j}] & = & K(\boldsymbol{\alpha}) \int_{0}^{1} \dots \int_{0}^{1} \ln \mu_{j} \prod_{k = 1}^{M} \mu_{k}^{\alpha_{k} - 1} d \mu_{1} \ldots d \mu_{M} \\ & = & K(\boldsymbol{\alpha}) \frac{\partial}{\partial \alpha_{j}} \int_{0}^{1} \dots \int_{0}^{1} \prod_{k = 1}^{M} \mu_{k}^{\alpha_{k} - 1} d \mu_{1} \ldots d \mu_{M} \\ & = & K(\boldsymbol{\alpha}) \frac{\partial}{\partial \mu_{k}} \frac{1}{K(\boldsymbol{\alpha})} \\ & = & - \frac{\partial}{\partial \mu_{k}} \ln K(\boldsymbol{\alpha}).\end{array}
$$

Finally, using the expression for $K(\alpha)$ , together with the definition of the digamma function $\psi(\cdot)$ , we have

$$
E[\ln \mu_{j}] = \psi(\alpha_{k}) - \psi(\alpha_{0}).
$$

2.14 As for the univariate Gaussian considered in Section 1.6, we can make use of Lagrange multipliers to enforce the constraints on the maximum entropy solution. Note that we need a single Lagrange multiplier for the normalization constraint (2.280), a D-dimensional vector m of Lagrange multipliers for the D constraints given by (2.281), and a $D \times D$ matrix L of Lagrange multipliers to enforce the $D^{2}$ constraints represented by (2.282). Thus we maximize

$$
\begin{array}{rcl} \widetilde{\mathrm{H}}[p] & = & - \int p(\mathbf{x}) \ln p(\mathbf{x}) d \mathbf{x} + \lambda \left(\int p(\mathbf{x}) d \mathbf{x} - 1\right) \\ & & + \mathbf{m}^{\mathrm{T}} \left(\int p(\mathbf{x}) \mathbf{x} d \mathbf{x} - \boldsymbol{\mu}\right) \\ & & + \operatorname{Tr} \left\{\mathbf{L} \left(\int p(\mathbf{x})(\mathbf{x} - \boldsymbol{\mu})(\mathbf{x} - \boldsymbol{\mu})^{\mathrm{T}} d \mathbf{x} - \boldsymbol{\Sigma}\right) \right\}.\end{array}\tag{74}
$$

By functional differentiation (Appendix D) the maximum of this functional with respect to $p(\mathbf{x})$ occurs when

$$
0 = - 1 - \ln p(\mathbf{x}) + \lambda + \mathbf{m}^{\mathrm{T}} \mathbf{x} + \mathrm{Tr} \{\mathbf{L}(\mathbf{x} - \pmb{\mu})(\mathbf{x} - \pmb{\mu})^{\mathrm{T}}\}.\tag{75}
$$

Solving for $p(\mathbf{x})$ we obtain

$$
p(\mathbf{x}) = \exp \left\{\lambda - 1 + \mathbf{m}^{\mathrm{T}} \mathbf{x} +(\mathbf{x} - \boldsymbol{\mu})^{\mathrm{T}} \mathbf{L}(\mathbf{x} - \boldsymbol{\mu}) \right\}.\tag{76}
$$

We now find the values of the Lagrange multipliers by applying the constraints. First we complete the square inside the exponential, which becomes

$$
\lambda - 1 + \left(\mathbf{x} - \boldsymbol{\mu} + \frac{1}{2} \mathbf{L}^{- 1} \mathbf{m}\right)^{\mathrm{T}} \mathbf{L} \left(\mathbf{x} - \boldsymbol{\mu} + \frac{1}{2} \mathbf{L}^{- 1} \mathbf{m}\right) + \boldsymbol{\mu}^{\mathrm{T}} \mathbf{m} - \frac{1}{4} \mathbf{m}^{\mathrm{T}} \mathbf{L}^{- 1} \mathbf{m}.
$$

We now make the change of variable

$$
\mathbf{y} = \mathbf{x} - \boldsymbol{\mu} + \frac{1}{2} \mathbf{L}^{- 1} \mathbf{m}.
$$

The constraint (2.281) then becomes

$$
\int \exp \left\{\lambda - 1 + \mathbf{y}^{\mathrm{T}} \mathbf{L} \mathbf{y} + \boldsymbol{\mu}^{\mathrm{T}} \mathbf{m} - \frac{1}{4} \mathbf{m}^{\mathrm{T}} \mathbf{L}^{- 1} \mathbf{m} \right\} \left(\mathbf{y} + \boldsymbol{\mu} - \frac{1}{2} \mathbf{L}^{- 1} \mathbf{m}\right) d \mathbf{y} = \boldsymbol{\mu}.
$$

In the final parentheses, the term in y vanishes by symmetry, while the term in $\mu$ simply integrates to $\mu$ by virtue of the normalization constraint (2.280) which now takes the form

$$
\int \exp \left\{\lambda - 1 + \mathbf{y}^{\mathrm{T}} \mathbf{L} \mathbf{y} + \boldsymbol{\mu}^{\mathrm{T}} \mathbf{m} - \frac{1}{4} \mathbf{m}^{\mathrm{T}} \mathbf{L}^{- 1} \mathbf{m} \right\} d \mathbf{y} = 1.
$$

and hence we have

$$
- \frac{1}{2} \mathbf{L}^{- 1} \mathbf{m} = \mathbf{0}
$$

where again we have made use of the constraint (2.280). Thus $\mathbf m = \mathbf 0$ and so the density becomes

$$
p(\mathbf{x}) = \exp \left\{\lambda - 1 +(\mathbf{x} - \boldsymbol{\mu})^{\mathrm{T}} \mathbf{L}(\mathbf{x} - \boldsymbol{\mu}) \right\}.
$$

Substituting this into the final constraint (2.282), and making the change of variable $\mathbf{x} -{\boldsymbol{\mu}} = \mathbf{z}$ we obtain

$$
\int \exp \left\{\lambda - 1 + \mathbf{z}^{\mathrm{T}} \mathbf{L} \mathbf{z} \right\} \mathbf{z} \mathbf{z}^{\mathrm{T}} d \mathbf{x} = \boldsymbol{\Sigma}.
$$

Applying an analogous argument to that used to derive (2.64) we obtain $\mathbf{L} = -{\frac{1}{2}} \pmb{\Sigma}$ Finally, the value of λ is simply that value needed to ensure that the Gaussian distribution is correctly normalized, as derived in Section 2.3, and hence is given by

$$
\lambda - 1 = \ln \left\{\frac{1}{(2 \pi)^{D / 2}} \frac{1}{| \boldsymbol{\Sigma} |^{1 / 2}} \right\}.
$$

2.16 We have $p(x_{1}) = \mathcal{N}(x_{1} | \mu_{1}, \tau_{1}^{- 1})$ and $p(x_{2}) = \mathcal{N}(x_{2} | \mu_{2}, \tau_{2}^{- 1})$ . Since $x = x_{1} + x_{2}$ we also have $p(x | x_{2}) = \mathcal{N}(x | \mu_{1} + x_{2}, \tau_{1}^{- 1})$ . We now evaluate the convolution integral given by (2.284) which takes the form

$$
p(x) = \left(\frac{\tau_{1}}{2 \pi}\right)^{1 / 2} \left(\frac{\tau_{2}}{2 \pi}\right)^{1 / 2} \int_{- \infty}^{\infty} \exp \left\{- \frac{\tau_{1}}{2}(x - \mu_{1} - x_{2})^{2} - \frac{\tau_{2}}{2}(x_{2} - \mu_{2})^{2} \right\} dx_{2}.\tag{77}
$$

Since the final result will be a Gaussian distribution for $p(x)$ we need only evaluate its precision, since, from (1.110), the entropy is determined by the variance or equivalently the precision, and is independent of the mean. This allows us to simplify the calculation by ignoring such things as normalization constants.

We begin by considering the terms in the exponent of (77) which depend on $x_{2}$ which are given by

$$
\begin{array}{l} - \frac{1}{2} x_{2}^{2}(\tau_{1} + \tau_{2}) + x_{2} \left\{\tau_{1}(x - \mu_{1}) + \tau_{2} \mu_{2} \right\} \\ = - \frac{1}{2}(\tau_{1} + \tau_{2}) \left\{x_{2} - \frac{\tau_{1}(x - \mu_{1}) + \tau_{2} \mu_{2}}{\tau_{1} + \tau_{2}} \right\}^{2} + \frac{\left\{\tau_{1}(x - \mu_{1}) + \tau_{2} \mu_{2} \right\}^{2}}{2(\tau_{1} + \tau_{2})} \end{array}
$$

where we have completed the square over $x_{2}$ . When we integrate out $x_{2}$ , the first term on the right hand side will simply give rise to a constant factor independent of $x.$ The second term, when expanded out, will involve a term in $x^{2}$ . Since the precision of x is given directly in terms of the coefficient of $x^{2}$ in the exponent, it is only such terms that we need to consider. There is one other term in $x^{2}$ arising from the original exponent in (77). Combining these we have

$$
- \frac{\tau_{1}}{2} x^{2} + \frac{\tau_{1}^{2}}{2(\tau_{1} + \tau_{2})} x^{2} = - \frac{1}{2} \frac{\tau_{1} \tau_{2}}{\tau_{1} + \tau_{2}} x^{2}
$$

from which we see that x has precision $\tau_{1} \tau_{2} /(\tau_{1} + \tau_{2})$

We can also obtain this result for the precision directly by appealing to the general result (2.115) for the convolution of two linear-Gaussian distributions.

The entropy of x is then given, from (1.110), by

$$
H(x) = \frac{1}{2} \ln \left\{\frac{2 \pi(\tau_{1} + \tau_{2})}{\tau_{1} \tau_{2}} \right\}.\tag{78}
$$

2.17 We can use an analogous argument to that used in the solution of Exercise 1.14. Consider a general square matrix Λ with elements $\Lambda_{ij}$ . Then we can always write $\pmb{\Lambda} = \pmb{\Lambda}^{\mathrm{A}} + \pmb{\Lambda}^{\mathrm{S}}$ where

$$
\Lambda_{ij}^{\mathrm{S}} = \frac{\Lambda_{ij} + \Lambda_{ji}}{2}, \quad \Lambda_{ij}^{\mathrm{A}} = \frac{\Lambda_{ij} - \Lambda_{ji}}{2}\tag{79}
$$

and it is easily verified that $\Lambda^{\mathrm{S}}$ is symmetric so that $\Lambda_{ij}^{\mathrm{S}} = \Lambda_{ji}^{\mathrm{S}}$ , and $\pmb{\Lambda}^{\mathrm{A}}$ is antisymmetric so that $\Lambda_{ij}^{\mathrm{A}} = - \Lambda_{ii}^{\mathrm{S}}$ . The quadratic form in the exponent of a D-dimensional multivariate Gaussian distribution can be written

$$
\frac{1}{2} \sum_{i = 1}^{D} \sum_{j = 1}^{D}(x_{i} - \mu_{i}) \Lambda_{ij}(x_{j} - \mu_{j})\tag{80}
$$

where $\pmb{\Lambda} = \pmb{\Sigma}^{- 1}$ is the precision matrix. When we substitute $\pmb{\Lambda} = \pmb{\Lambda}^{\mathrm{A}} + \pmb{\Lambda}^{\mathrm{S}}$ into (80) we see that the term involving $\pmb{\Lambda}^{\mathrm{A}}$ vanishes since for every positive term there is an equal and opposite negative term. Thus we can always take Λ to be symmetric.

2.20 Since $\mathbf{u}_{1}, \ldots, \mathbf{u}_{D}$ constitute a basis for $\mathbb{R}^{D}$ , we can write

$$
\mathbf{a} = \hat{a}_{1} \mathbf{u}_{1} + \hat{a}_{2} \mathbf{u}_{2} + \dots + \hat{a}_{D} \mathbf{u}_{D},
$$

where $\hat{a}_{1}, \dotsc, \hat{a}_{D}$ are coefficients obtained by projecting a on $\mathbf{u}_{1}, \ldots, \mathbf{u}_{D}$ . Note that they typically do not equal the elements of a.

Using this we can write

$$
\mathbf{a}^{\mathrm{T}} \boldsymbol{\Sigma} \mathbf{a} = \left(\hat{a}_{1} \mathbf{u}_{1}^{\mathrm{T}} + \dots + \hat{a}_{D} \mathbf{u}_{D}^{\mathrm{T}}\right) \boldsymbol{\Sigma} \left(\hat{a}_{1} \mathbf{u}_{1} + \dots + \hat{a}_{D} \mathbf{u}_{D}\right)
$$

and combining this result with (2.45) we get

$$
\left(\hat{a}_{1} \mathbf{u}_{1}^{\mathrm{T}} + \dots + \hat{a}_{D} \mathbf{u}_{D}^{\mathrm{T}}\right) \left(\hat{a}_{1} \lambda_{1} \mathbf{u}_{1} + \dots + \hat{a}_{D} \lambda_{D} \mathbf{u}_{D}\right).
$$

Now, since $\mathbf{u}_{i}^{\mathrm{T}} \mathbf{u}_{j} = 1$ only if $i = j,$ , and 0 otherwise, this becomes

$$
\hat{a}_{1}^{2} \lambda_{1} + \ldots + \hat{a}_{D}^{2} \lambda_{D}
$$

and since a is real, we see that this expression will be strictly positive for any nonzero a, if all eigenvalues are strictly positive. It is also clear that if an eigenvalue, $\lambda_{i}.$ , is zero or negative, there exist a vector a $(\boldsymbol{\mathrm{e.g.}} \ \mathbf{a} = \mathbf{u}_{i})$ , for which this expression will be less than or equal to zero. Thus, that a matrix has eigenvectors which are all strictly positive is a sufficient and necessary condition for the matrix to be positive definite.

2.22 Consider a matrix M which is symmetric, so that $\mathbf{M}^{\mathrm{T}} = \mathbf{M}$ . The inverse matrix ${{\bf{M}}^{- 1}}$ satisfies

$$
\mathbf{MM}^{- 1} = \mathbf{I}.
$$

Taking the transpose of both sides of this equation, and using the relation (C.1), we obtain T

$$
\left(\mathbf{M}^{- 1}\right)^{\mathrm{T}} \mathbf{M}^{\mathrm{T}} = \mathbf{I}^{\mathrm{T}} = \mathbf{I}
$$

since the identity matrix is symmetric. Making use of the symmetry condition for M we then have T

$$
\left(\mathbf{M}^{- 1}\right)^{\mathrm{T}} \mathbf{M} = \mathbf{I}
$$

and hence, from the definition of the matrix inverse,

$$
\left(\mathbf{M}^{- 1}\right)^{\mathrm{T}} = \mathbf{M}^{- 1}
$$

and so ${{\bf{M}}^{- 1}}$ is also a symmetric matrix.

2.24 Multiplying the left hand side of (2.76) by the matrix (2.287) trivially gives the identity matrix. On the right hand side consider the four blocks of the resulting partitioned matrix:

upper left

$$
\mathbf{AM} - \mathbf{BD}^{- 1} \mathbf{CM} =(\mathbf{A} - \mathbf{BD}^{- 1} \mathbf{C})(\mathbf{A} - \mathbf{BD}^{- 1} \mathbf{C})^{- 1} = \mathbf{I}\tag{81}
$$

upper right

$$
\begin{array}{rl} & - \mathbf{AMBD}^{- 1} + \mathbf{BD}^{- 1} + \mathbf{BD}^{- 1} \mathbf{CMBD}^{- 1} \\ & = -(\mathbf{A} - \mathbf{BD}^{- 1} \mathbf{C})(\mathbf{A} - \mathbf{BD}^{- 1} \mathbf{C})^{- 1} \mathbf{BD}^{- 1} + \mathbf{BD}^{- 1} \\ & = - \mathbf{BD}^{- 1} + \mathbf{BD}^{- 1} = \mathbf{0} \end{array}\tag{82}
$$

lower left

$$
\mathbf{CM} - \mathbf{DD}^{- 1} \mathbf{CM} = \mathbf{CM} - \mathbf{CM} = \mathbf{0}\tag{83}
$$

lower right

$$
- \mathrm{CMBD}^{- 1} + \mathrm{DD}^{- 1} + \mathrm{DD}^{- 1} \mathrm{CMBD}^{- 1} = \mathrm{DD}^{- 1} = \mathbf{I}.\tag{84}
$$

Thus the right hand side also equals the identity matrix.

2.28 For the marginal distribution $p(\mathbf{x})$ we see from (2.92) that the mean is given by the upper partition of (2.108) which is simply $\mu.$ . Similarly from (2.93) we see that the covariance is given by the top left partition of (2.105) and is therefore given by $\Lambda^{- 1}$ Now consider the conditional distribution $p(\mathbf{y} \vert \mathbf{x})$ . Applying the result (2.81) for the conditional mean we obtain

$$
\mu_{y | x} = \mathrm{A} \mu + b + \mathrm{A} \Lambda^{- 1} \Lambda(x - \mu) = \mathrm{A} x + b.
$$

Similarly applying the result (2.82) for the covariance of the conditional distribution we have

$$
\operatorname{cov}[\mathbf{y} | \mathbf{x}] = \mathbf{L}^{- 1} + \mathbf{A} \boldsymbol{\Lambda}^{- 1} \mathbf{A}^{\mathrm{T}} - \mathbf{A} \boldsymbol{\Lambda}^{- 1} \boldsymbol{\Lambda} \boldsymbol{\Lambda}^{- 1} \mathbf{A}^{\mathrm{T}} = \mathbf{L}^{- 1}
$$

as required.

2.32 The quadratic form in the exponential of the joint distribution is given by

$$
- \frac{1}{2}(\mathbf{x} - \boldsymbol{\mu})^{\mathrm{T}} \boldsymbol{\Lambda}(\mathbf{x} - \boldsymbol{\mu}) - \frac{1}{2}(\mathbf{y} - \mathbf{Ax} - \mathbf{b})^{\mathrm{T}} \mathbf{L}(\mathbf{y} - \mathbf{Ax} - \mathbf{b}).\tag{85}
$$

We now extract all of those terms involving x and assemble them into a standard Gaussian quadratic form by completing the square

$$
\begin{array}{rl}{=} &{- \frac{1}{2} \mathbf{x}^{\mathrm{T}}(\mathbf{\Lambda} + \mathbf{A}^{\mathrm{T}} \mathbf{L} \mathbf{A}) \mathbf{x} + \mathbf{x}^{\mathrm{T}} \left[\mathbf{\Lambda} \pmb{\mu} + \mathbf{A}^{\mathrm{T}} \mathbf{L}(\mathbf{y} - \mathbf{b}) \right] + \mathrm{const}} \\{=} &{- \frac{1}{2}(\mathbf{x} - \mathbf{m})^{\mathrm{T}}(\mathbf{\Lambda} + \mathbf{A}^{\mathrm{T}} \mathbf{L} \mathbf{A})(\mathbf{x} - \mathbf{m})} \\ &{+ \frac{1}{2} \mathbf{m}^{\mathrm{T}}(\mathbf{\Lambda} + \mathbf{A}^{\mathrm{T}} \mathbf{L} \mathbf{A}) \mathbf{m} + \mathrm{const}} \end{array}\tag{86}
$$

where

$$
\mathbf{m} = \left(\boldsymbol{\Lambda} + \mathbf{A}^{\mathrm{T}} \mathbf{L} \mathbf{A}\right)^{- 1} \left[\boldsymbol{\Lambda} \boldsymbol{\mu} + \mathbf{A}^{\mathrm{T}} \mathbf{L}(\mathbf{y} - \mathbf{b}) \right].
$$

We can now perform the integration over x which eliminates the first term in (86). Then we extract the terms in $\mathbf{y}$ from the final term in (86) and combine these with the remaining terms from the quadratic form (85) which depend on y to give

$$
\begin{array}{ll} = & - \frac{1}{2} \mathbf{y}^{\mathrm{T}} \left\{\mathbf{L} - \mathbf{LA}(\boldsymbol{\Lambda} + \mathbf{A}^{\mathrm{T}} \mathbf{LA})^{- 1} \mathbf{A}^{\mathrm{T}} \mathbf{L} \right\} \mathbf{y} \\ & + \mathbf{y}^{\mathrm{T}} \left[\left\{\mathbf{L} - \mathbf{LA}(\boldsymbol{\Lambda} + \mathbf{A}^{\mathrm{T}} \mathbf{LA})^{- 1} \mathbf{A}^{\mathrm{T}} \mathbf{L} \right\} \mathbf{b} \right.\\ & + \mathbf{LA}(\boldsymbol{\Lambda} + \mathbf{A}^{\mathrm{T}} \mathbf{LA})^{- 1} \boldsymbol{\Lambda} \boldsymbol{\mu} \big].\end{array}\tag{87}
$$

We can identify the precision of the marginal distribution $p(\mathbf{y})$ from the second order term in $\mathbf{y}.$ . To find the corresponding covariance, we take the inverse of the precision and apply the Woodbury inversion formula (2.289) to give

$$
\left\{\mathbf{L} - \mathbf{LA} \left(\boldsymbol{\Lambda} + \mathbf{A}^{\mathrm{T}} \mathbf{LA}\right)^{- 1} \mathbf{A}^{\mathrm{T}} \mathbf{L} \right\}^{- 1} = \mathbf{L}^{- 1} + \mathbf{A} \boldsymbol{\Lambda}^{- 1} \mathbf{A}^{\mathrm{T}}\tag{88}
$$

which corresponds to (2.110).

Next we identify the mean $\pmb{\nu}$ of the marginal distribution. To do this we make use of (88) in (87) and then complete the square to give

$$
- \frac{1}{2}(\mathbf{y} - \boldsymbol{\nu})^{\mathrm{T}} \left(\mathbf{L}^{- 1} + \mathbf{A} \boldsymbol{\Lambda}^{- 1} \mathbf{A}^{\mathrm{T}}\right)^{- 1}(\mathbf{y} - \boldsymbol{\nu}) + \mathrm{const}
$$

where

$$
\boldsymbol{\nu} = \left(\mathbf{L}^{- 1} + \mathbf{A} \boldsymbol{\Lambda}^{- 1} \mathbf{A}^{\mathrm{T}}\right) \left[\left(\mathbf{L}^{- 1} + \mathbf{A} \boldsymbol{\Lambda}^{- 1} \mathbf{A}^{\mathrm{T}}\right)^{- 1} \mathbf{b} + \mathbf{LA}(\boldsymbol{\Lambda} + \mathbf{A}^{\mathrm{T}} \mathbf{LA})^{- 1} \boldsymbol{\Lambda} \boldsymbol{\mu} \right].
$$

Now consider the two terms in the square brackets, the first one involving b and the second involving $\pmb{\mu}.$ . The first of these contribution simply gives $\mathbf{b},$ while the term in $\mu$ can be written

$$
\begin{array}{ll} = & \left(\mathbf{L}^{- 1} + \mathbf{A} \boldsymbol{\Lambda}^{- 1} \mathbf{A}^{\mathrm{T}}\right) \mathbf{LA}(\boldsymbol{\Lambda} + \mathbf{A}^{\mathrm{T}} \mathbf{LA})^{- 1} \boldsymbol{\Lambda} \boldsymbol{\mu} \\ = & \mathbf{A}(\mathbf{I} + \boldsymbol{\Lambda}^{- 1} \mathbf{A}^{\mathrm{T}} \mathbf{LA})(\mathbf{I} + \boldsymbol{\Lambda}^{- 1} \mathbf{A}^{\mathrm{T}} \mathbf{LA})^{- 1} \boldsymbol{\Lambda}^{- 1} \boldsymbol{\Lambda} \boldsymbol{\mu} = \mathbf{A} \boldsymbol{\mu} \end{array}
$$

where we have used the general result $({\bf B}{\bf C})^{- 1} ={\bf C}^{- 1}{\bf B}^{- 1}$ . Hence we obtain (2.109).

2.34 Differentiating (2.118) with respect to $\pmb{\Sigma}$ we obtain two terms:

$$
- \frac{N}{2} \frac{\partial}{\partial \pmb{\Sigma}} \ln | \pmb{\Sigma} | - \frac{1}{2} \frac{\partial}{\partial \pmb{\Sigma}} \sum_{n = 1}^{N}(\mathbf{x}_{n} - \pmb{\mu})^{\mathrm{T}} \pmb{\Sigma}^{- 1}(\mathbf{x}_{n} - \pmb{\mu}).
$$

For the first term, we can apply (C.28) directly to get

$$
- \frac{N}{2} \frac{\partial}{\partial \pmb{\Sigma}} \ln | \pmb{\Sigma} | = - \frac{N}{2} \left(\pmb{\Sigma}^{- 1}\right)^{\mathrm{T}} = - \frac{N}{2} \pmb{\Sigma}^{- 1}.
$$

For the second term, we first re-write the sum

$$
\sum_{n = 1}^{N} \left(\mathbf{x}_{n} - \boldsymbol{\mu}\right)^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1} \left(\mathbf{x}_{n} - \boldsymbol{\mu}\right) = N \operatorname{Tr} \left[\boldsymbol{\Sigma}^{- 1} \mathbf{S} \right],
$$

where

$$
\mathbf{S} = \frac{1}{N} \sum_{n = 1}^{N}(\mathbf{x}_{n} - \boldsymbol{\mu})(\mathbf{x}_{n} - \boldsymbol{\mu})^{\mathrm{T}}.
$$

Using this together with (C.21), in which $x = \Sigma_{ij}$ (element (i, j) in Σ), and properties of the trace we get

$$
\begin{array}{rcl} \frac{\partial}{\partial \Sigma_{ij}} \sum_{n = 1}^{N}(\mathbf{x}_{n} - \boldsymbol{\mu})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{x}_{n} - \boldsymbol{\mu}) & = & N \frac{\partial}{\partial \Sigma_{ij}} \operatorname{Tr} \left[\boldsymbol{\Sigma}^{- 1} \mathbf{S} \right] \\ & = & N \operatorname{Tr} \left[\frac{\partial}{\partial \Sigma_{ij}} \boldsymbol{\Sigma}^{- 1} \mathbf{S} \right] \\ & = & - N \operatorname{Tr} \left[\boldsymbol{\Sigma}^{- 1} \frac{\partial \boldsymbol{\Sigma}}{\partial \Sigma_{ij}} \boldsymbol{\Sigma}^{- 1} \mathbf{S} \right] \\ & = & - N \operatorname{Tr} \left[\frac{\partial \boldsymbol{\Sigma}}{\partial \Sigma_{ij}} \boldsymbol{\Sigma}^{- 1} \mathbf{S} \boldsymbol{\Sigma}^{- 1} \right] \\ & = & - N \left(\boldsymbol{\Sigma}^{- 1} \mathbf{S} \boldsymbol{\Sigma}^{- 1}\right)_{ij} \end{array}
$$

where we have used (C.26). Note that in the last step we have ignored the fact that $\Sigma_{ij} = \Sigma_{ji}$ , so that $\partial \pmb{\Sigma} / \partial \Sigma_{ij}$ has a 1 in position (i, j) only and 0 everywhere else. Treating this result as valid nevertheless, we get

$$
- \frac{1}{2} \frac{\partial}{\partial \boldsymbol{\Sigma}} \sum_{n = 1}^{N}(\mathbf{x}_{n} - \boldsymbol{\mu})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{x}_{n} - \boldsymbol{\mu}) = \frac{N}{2} \boldsymbol{\Sigma}^{- 1} \mathbf{S} \boldsymbol{\Sigma}^{- 1}.
$$

Combining the derivatives of the two terms and setting the result to zero, we obtain

$$
\frac{N}{2} \boldsymbol{\Sigma}^{- 1} = \frac{N}{2} \boldsymbol{\Sigma}^{- 1} \mathbf{S} \boldsymbol{\Sigma}^{- 1}.
$$

Re-arrangement then yields

$$
\pmb{\Sigma} = \mathbf{S}
$$

as required.

2.36 Consider the expression for $\sigma_{(N)}^{2}$ and separate out the contribution from observation x<sub>N</sub> to give

$$
\begin{array}{rcl} \sigma_{(N)}^{2} & = & \frac{1}{N} \sum_{n = 1}^{N}(x_{n} - \mu)^{2} \\ & = & \frac{1}{N} \sum_{n = 1}^{N - 1}(x_{n} - \mu)^{2} + \frac{(x_{N} - \mu)^{2}}{N} \\ & = & \frac{N - 1}{N} \sigma_{(N - 1)}^{2} + \frac{(x_{N} - \mu)^{2}}{N} \\ & = & \sigma_{(N - 1)}^{2} - \frac{1}{N} \sigma_{(N - 1)}^{2} + \frac{(x_{N} - \mu)^{2}}{N} \\ & = & \sigma_{(N - 1)}^{2} + \frac{1}{N} \left\{(x_{N} - \mu)^{2} - \sigma_{(N - 1)}^{2} \right\}.\end{array}\tag{89}
$$

If we substitute the expression for a Gaussian distribution into the result (2.135) for the Robbins-Monro procedure applied to maximizing likelihood, we obtain

$$
\begin{array}{rcl} \sigma_{(N)}^{2} & = & \sigma_{(N - 1)}^{2} + a_{N - 1} \frac{\partial}{\partial \sigma_{(N - 1)}^{2}} \left\{- \frac{1}{2} \ln \sigma_{(N - 1)}^{2} - \frac{(x_{N} - \mu)^{2}}{2 \sigma_{(N - 1)}^{2}} \right\} \\ & = & \sigma_{(N - 1)}^{2} + a_{N - 1} \left\{- \frac{1}{2 \sigma_{(N - 1)}^{2}} + \frac{(x_{N} - \mu)^{2}}{2 \sigma_{(N - 1)}^{4}} \right\} \\ & = & \sigma_{(N - 1)}^{2} + \frac{a_{N - 1}}{2 \sigma_{(N - 1)}^{4}} \left\{(x_{N} - \mu)^{2} - \sigma_{(N - 1)}^{2} \right\}.\end{array}\tag{90}
$$

Comparison of (90) with (89) allows us to identify

$$
a_{N - 1} = \frac{2 \sigma_{(N - 1)}^{4}}{N}.\tag{91}
$$

Note that the sign in (2.129) is incorrect, and this equation should read

$$
\theta^{(N)} = \theta^{(N - 1)} - a_{N - 1} z(\theta^{(N - 1)}).
$$

Also, in order to be consistent with the assumption that $f(\theta) > 0$ for $\theta > \theta^{\star}$ and $f(\theta) < 0$ for $\theta < \theta^{\star}$ in Figure 2.10, we should find the root of the expected negative log likelihood in (2.133). Finally, the labels $\mu$ and $\mu_{\mathrm{ML}}$ in Figure 2.11 should be interchanged.

2.40 The posterior distribution is proportional to the product of the prior and the likelihood function

$$
p(\boldsymbol{\mu} | \mathbf{X}) \propto p(\boldsymbol{\mu}) \prod_{n = 1}^{N} p(\mathbf{x}_{n} | \boldsymbol{\mu}, \boldsymbol{\Sigma}).\tag{92}
$$

Thus the posterior is proportional to an exponential of a quadratic form in $\mu$ given by

$$
\begin{array}{l} - \frac{1}{2}(\boldsymbol{\mu} - \boldsymbol{\mu}_{0})^{\mathrm{T}} \boldsymbol{\Sigma}_{0}^{- 1}(\boldsymbol{\mu} - \boldsymbol{\mu}_{0}) - \frac{1}{2} \sum_{n = 1}^{N}(\mathbf{x}_{n} - \boldsymbol{\mu})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{x}_{n} - \boldsymbol{\mu}) \\ = - \frac{1}{2} \boldsymbol{\mu}^{\mathrm{T}} \left(\boldsymbol{\Sigma}_{0}^{- 1} + N \boldsymbol{\Sigma}^{- 1}\right) \boldsymbol{\mu} + \boldsymbol{\mu}^{\mathrm{T}} \left(\boldsymbol{\Sigma}_{0}^{- 1} \boldsymbol{\mu}_{0} + \boldsymbol{\Sigma}^{- 1} \sum_{n = 1}^{N} \mathbf{x}_{n}\right) + \text{const} \end{array}
$$

where ‘const.’ denotes terms independent of $\pmb{\mu}.$ . Using the discussion following (2.71) we see that the mean and covariance of the posterior distribution are given by

$$
\boldsymbol{\mu}_{N} = \left(\boldsymbol{\Sigma}_{0}^{- 1} + N \boldsymbol{\Sigma}^{- 1}\right)^{- 1} \left(\boldsymbol{\Sigma}_{0}^{- 1} \boldsymbol{\mu}_{0} + \boldsymbol{\Sigma}^{- 1} N \boldsymbol{\mu}_{\mathrm{ML}}\right)\tag{93}
$$

$$
{\pmb{\Sigma}_{N}^{- 1}} ={\pmb{\Sigma}_{0}^{- 1} + N \pmb{\Sigma}^{- 1}}\tag{94}
$$

where $\pmb{\mu}_{\mathrm{ML}}$ is the maximum likelihood solution for the mean given by

$$
\boldsymbol{\mu}_{\mathrm{ML}} = \frac{1}{N} \sum_{n = 1}^{N} \mathbf{x}_{n}.\tag{95}
$$

2.46 From (2.158), we have

$$
\begin{array}{c} \int_{0}^{\infty} \frac{b^{a} e^{(- b \tau)} \tau^{a - 1}}{\Gamma(a)} \left(\frac{\tau}{2 \pi}\right)^{1 / 2} \exp \left\{- \frac{\tau}{2}(x - \mu)^{2} \right\} d \tau \\ = \frac{b^{a}}{\Gamma(a)} \left(\frac{1}{2 \pi}\right)^{1 / 2} \int_{0}^{\infty} \tau^{a - 1 / 2} \exp \left\{- \tau \left(b + \frac{(x - \mu)^{2}}{2}\right) \right\} d \tau.\end{array}
$$

We now make the proposed change of variable $z = \tau \Delta$ , where $\Delta = b +(x - \mu)^{2} / 2$ yielding

$$
\begin{array}{c} \frac{b^{a}}{\Gamma(a)} \left(\frac{1}{2 \pi}\right)^{1 / 2} \Delta^{- a - 1 / 2} \int_{0}^{\infty} z^{a - 1 / 2} \exp(- z) d z \\ = \frac{b^{a}}{\Gamma(a)} \left(\frac{1}{2 \pi}\right)^{1 / 2} \Delta^{- a - 1 / 2} \Gamma(a + 1 / 2) \end{array}
$$

where we have used the definition of the Gamma function (1.141). Finally, we substitute $b +(x - \mu)^{2} / 2$ for $\Delta, \nu / 2$ for a and $\nu / 2 \lambda$ for b:

$$
\begin{array}{l} \frac{\Gamma(- a + 1 / 2)}{\Gamma(a)} b^{a} \left(\frac{1}{2 \pi}\right)^{1 / 2} \Delta^{a - 1 / 2} \\ = \frac{\Gamma((\nu + 1) / 2)}{\Gamma(\nu / 2)} \left(\frac{\nu}{2 \lambda}\right)^{\nu / 2} \left(\frac{1}{2 \pi}\right)^{1 / 2} \left(\frac{\nu}{2 \lambda} + \frac{(x - \mu)^{2}}{2}\right)^{-(\nu + 1) / 2} \\ = \frac{\Gamma((\nu + 1) / 2)}{\Gamma(\nu / 2)} \left(\frac{\nu}{2 \lambda}\right)^{\nu / 2} \left(\frac{1}{2 \pi}\right)^{1 / 2} \left(\frac{\nu}{2 \lambda}\right)^{-(\nu + 1) / 2} \left(1 + \frac{\lambda(x - \mu)^{2}}{\nu}\right)^{-(\nu + 1) / 2} \\ = \frac{\Gamma((\nu + 1) / 2)}{\Gamma(\nu / 2)} \left(\frac{\lambda}{\nu \pi}\right)^{1 / 2} \left(1 + \frac{\lambda(x - \mu)^{2}}{\nu}\right)^{-(\nu + 1) / 2} \end{array}
$$

2.47 Ignoring the normalization constant, we write (2.159) as

$$
\begin{array}{rcl} \mathrm{St}(x | \mu, \lambda, \nu) & \propto & \left[1 + \frac{\lambda(x - \mu)^{2}}{\nu} \right]^{-(\nu - 1) / 2} \\ & = & \exp \left(- \frac{\nu - 1}{2} \ln \left[1 + \frac{\lambda(x - \mu)^{2}}{\nu} \right]\right).\end{array}\tag{96}
$$

For large ν, we make use of the Taylor expansion for the logarithm in the form

$$
\ln(1 + \epsilon) = \epsilon + O(\epsilon^{2})\tag{97}
$$

to re-write (96) as

$$
\begin{array}{ll} \exp \left(- \frac{\nu - 1}{2} \ln \left[1 + \frac{\lambda(x - \mu)^{2}}{\nu} \right]\right) \\ = & \exp \left(- \frac{\nu - 1}{2} \left[\frac{\lambda(x - \mu)^{2}}{\nu} + O(\nu^{- 2}) \right]\right) \\ = & \exp \left(- \frac{\lambda(x - \mu)^{2}}{2} + O(\nu^{- 1})\right).\end{array}
$$

We see that in the limit $\nu \to \infty$ this becomes, up to an overall constant, the same as a Gaussian distribution with mean $\mu$ and precision λ. Since the Student distribution is normalized to unity for all values of $\nu$ it follows that it must remain normalized in this limit. The normalization coefficient is given by the standard expression (2.42) for a univariate Gaussian.

## 2.51 Using the relation (2.296) we have

$$
1 = \exp(iA) \exp(- iA) =(\cos A + i \sin A)(\cos A - i \sin A) = \cos^{2} A + \sin^{2} A.
$$

Similarly, we have

$$
\begin{array}{rcl} \cos(A - B) & = & \Re \exp \{i(A - B)\} \\ & = & \Re \exp(iA) \exp(- iB) \\ & = & \Re(\cos A + i \sin A)(\cos B - i \sin B) \\ & = & \cos A \cos B + \sin A \sin B.\end{array}
$$

Finally

$$
\begin{array}{rcl} \sin(A - B) & = & \Im \exp \{i(A - B)\} \\ & = & \Im \exp(iA) \exp(- iB) \\ & = & \Im(\cos A + i \sin A)(\cos B - i \sin B) \\ & = & \sin A \cos B - \cos A \sin B.\end{array}
$$

2.56 We can most conveniently cast distributions into standard exponential family form by taking the exponential of the logarithm of the distribution. For the Beta distribution (2.13) we have

$$
\operatorname{Beta}(\mu | a, b) = \frac{\Gamma(a + b)}{\Gamma(a) \Gamma(b)} \exp \left\{(a - 1) \ln \mu +(b - 1) \ln(1 - \mu) \right\}\tag{98}
$$

which we can identify as being in standard exponential form (2.194) with

$$
h(\mu) = 1\tag{99}
$$

$$
g(a, b) = \frac{\Gamma(a + b)}{\Gamma(a) \Gamma(b)}\tag{100}
$$

$$
\mathbf{u}(\mu) = \binom{\ln \mu}{\ln(1 - \mu)}\tag{101}
$$

$$
\boldsymbol{\eta}(a, b) = \binom{a - 1}{b - 1}.\tag{102}
$$

Applying the same approach to the gamma distribution (2.146) we obtain

$$
\operatorname{Gam}(\lambda | a, b) = \frac{b^{a}}{\Gamma(a)} \exp \left\{(a - 1) \ln \lambda - b \lambda \right\}.
$$

from which it follows that

$$
h(\lambda) = 1\tag{103}
$$

$$
g(a, b) = \frac{b^{a}}{\Gamma(a)}\tag{104}
$$

$$
\mathbf{u}(\lambda) = \binom{\lambda}{\ln \lambda}\tag{105}
$$

$$
\boldsymbol{\eta}(a, b) = \binom{- b}{a - 1}.\tag{106}
$$

Finally, for the von Mises distribution (2.179) we make use of the identity (2.178) to give

$$
p(\theta | \theta_{0}, m) = \frac{1}{2 \pi I_{0}(m)} \exp \left\{m \cos \theta \cos \theta_{0} + m \sin \theta \sin \theta_{0} \right\}
$$

from which we find

$$
h(\theta) = 1\tag{107}
$$

$$
g(\theta_{0}, m) = \frac{1}{2 \pi I_{0}(m)}\tag{108}
$$

$$
\mathbf{u}(\theta) = \binom{\cos \theta}{\sin \theta}\tag{109}
$$

$$
\boldsymbol{\eta}(\theta_{0}, m) = \binom{m \cos \theta_{0}}{m \sin \theta_{0}}.\tag{110}
$$

$$
\sum_{n = 1}^{N} \ln p(\mathbf{x}_{n}) = \sum_{n = 1}^{N} \ln h_{j(n)}.
$$

2.60 The value of the density $p(\mathbf{x})$ at a point ${\bf x}_{n}$ is given by $h_{j(n)}$ , where the notation $j(n)$ denotes that data point ${\bf x}_{n}$ falls within region $j$ . Thus the log likelihood function takes the form

We now need to take account of the constraint that $p(\mathbf{x})$ must integrate to unity. Since $p(\mathbf{x})$ has the constant value $h_{i}$ over region i, which has volume $\Delta_{i}.$ , the normalization constraint becomes $\begin{array}{r}{\sum_{i} h_{i} \Delta_{i} = 1} \end{array}$ . Introducing a Lagrange multiplier λ we then minimize the function

$$
\sum_{n = 1}^{N} \ln h_{j(n)} + \lambda \left(\sum_{i} h_{i} \Delta_{i} - 1\right)
$$

with respect to $h_{k}$ to give

$$
0 = \frac{n_{k}}{h_{k}} + \lambda \Delta_{k}
$$

where $n_{k}$ denotes the total number of data points falling within region k. Multiplying both sides by $h_{k}$ , summing over k and making use of the normalization constraint, we obtain $\lambda = - N$ . Eliminating λ then gives our final result for the maximum likelihood solution for $h_{k}$ in the form

$$
h_{k} = \frac{n_{k}}{N} \frac{1}{\Delta_{k}}.
$$

Note that, for equal sized bins $\Delta_{k} = \Delta$ we obtain a bin height $h_{k}$ which is proportional to the fraction of points falling within that bin, as expected.

## Chapter 3 Linear Models for Regression

3.1 Using (3.6), we have

$$
\begin{array}{rcl} 2 \sigma(2a) - 1 & = & \frac{2}{1 + e^{- 2a}} - 1 \\ & = & \frac{2}{1 + e^{- 2a}} - \frac{1 + e^{- 2a}}{1 + e^{- 2a}} \\ & = & \frac{1 - e^{- 2a}}{1 + e^{- 2a}} \\ & = & \frac{e^{a} - e^{- a}}{e^{a} + e^{- a}} \\ & = & \tanh(a) \end{array}
$$

If we now take $a_{j} =(x - \mu_{j}) / 2s$ , we can rewrite (3.101) as

$$
\begin{array}{rcl} y(\mathbf{x}, \mathbf{w}) & = & w_{0} + \sum_{j = 1}^{M} w_{j} \sigma(2a_{j}) \\ & = & w_{0} + \sum_{j = 1}^{M} \frac{w_{j}}{2} \left(2 \sigma(2a_{j}) - 1 + 1\right) \\ & = & u_{0} + \sum_{j = 1}^{M} u_{j} \tanh(a_{j}), \end{array}
$$

where $u_{j} = w_{j} / 2$ , for $j = 1, \dots, M$ , and $\begin{array}{r}{u_{0} = w_{0} + \sum_{j = 1}^{M} w_{j} / 2} \end{array}$ . Note that there is a typographical error in the question: there is a 2 missing in the denominator of the argument to the ‘tanh’ function in equation (3.102).

## 3.4 Let

$$
\begin{array}{rcl} \widetilde{y}_{n} & = & w_{0} + \sum_{i = 1}^{D} w_{i}(x_{ni} + \epsilon_{ni}) \\ & = & y_{n} + \sum_{i = 1}^{D} w_{i} \epsilon_{ni} \end{array}
$$

where $y_{n} = y(x_{n}, \mathbf{w})$ and $\epsilon_{ni} \sim \mathcal{N}(0, \sigma^{2})$ and we have used (3.105). From (3.106) we then define

$$
\begin{array}{rcl} \widetilde{E} & = & \frac{1}{2} \sum_{n = 1}^{N} \{\widetilde{y}_{n} - t_{n}\}^{2} \\ & = & \frac{1}{2} \sum_{n = 1}^{N} \left\{\widetilde{y}_{n}^{2} - 2 \widetilde{y}_{n} t_{n} + t_{n}^{2} \right\} \\ & = & \frac{1}{2} \sum_{n = 1}^{N} \left\{y_{n}^{2} + 2y_{n} \sum_{i = 1}^{D} w_{i} \epsilon_{ni} + \left(\sum_{i = 1}^{D} w_{i} \epsilon_{ni}\right)^{2} \right.\\ & & \left.- 2t_{n} y_{n} - 2t_{n} \sum_{i = 1}^{D} w_{i} \epsilon_{ni} + t_{n}^{2} \right\}.\end{array}
$$

If we take the expectation of $\widetilde{E}$ under the distribution of $\epsilon_{ni}$ , we see that the second and fifth terms disappear, since $\mathbb{E}[\epsilon_{ni}] = 0$ , while for the third term we get

$$
\mathbb{E} \left[\left(\sum_{i = 1}^{D} w_{i} \epsilon_{ni}\right)^{2} \right] = \sum_{i = 1}^{D} w_{i}^{2} \sigma^{2}
$$

since the $\epsilon_{ni}$ are all independent with variance $\sigma^{2}$

From this and (3.106) we see that

$$
\mathbb{E} \left[\widetilde{E} \right] = E_{D} + \frac{1}{2} \sum_{i = 1}^{D} w_{i}^{2} \sigma^{2},
$$

as required.

3.5 We can rewrite (3.30) as

$$
\frac{1}{2} \left(\sum_{j = 1}^{M} | w_{j} |^{q} - \eta\right) \leqslant 0
$$

where we have incorporated the $1 / 2$ scaling factor for convenience. Clearly this does not affect the constraint.

Employing the technique described in Appendix $\mathrm{E,}$ we can combine this with (3.12) to obtain the Lagrangian function

$$
L(\mathbf{w}, \lambda) = \frac{1}{2} \sum_{n = 1}^{N} \left\{t_{n} - \mathbf{w}^{\mathrm{T}} \phi(\mathbf{x}_{n}) \right\}^{2} + \frac{\lambda}{2} \left(\sum_{j = 1}^{M} | w_{j} |^{q} - \eta\right)
$$

and by comparing this with (3.29) we see immediately that they are identical in their dependence on w.

Now suppose we choose a specific value of $\lambda > 0$ and minimize (3.29). Denoting the resulting value of w by $\mathbf{w}^{\star}(\lambda)$ , and using the KKT condition (E.11), we see that the value of η is given by

$$
\eta = \sum_{j = 1}^{M} | w_{j}^{\star}(\lambda) |^{q}.
$$

3.6 We first write down the log likelihood function which is given by

$$
\ln L(\mathbf{W}, \boldsymbol{\Sigma}) = - \frac{N}{2} \ln | \boldsymbol{\Sigma} | - \frac{1}{2} \sum_{n = 1}^{N}(\mathbf{t}_{n} - \mathbf{W}^{\mathrm{T}} \phi(\mathbf{x}_{n}))^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{t}_{n} - \mathbf{W}^{\mathrm{T}} \phi(\mathbf{x}_{n})).
$$

First of all we set the derivative with respect to W equal to zero, giving

$$
0 = - \sum_{n = 1}^{N} \boldsymbol{\Sigma}^{- 1}(\mathbf{t}_{n} - \mathbf{W}^{\mathrm{T}} \phi(\mathbf{x}_{n})) \phi(\mathbf{x}_{n})^{\mathrm{T}}.
$$

Multiplying through by $\pmb{\Sigma}$ and introducing the design matrix $\Phi$ and the target data matrix $\mathbf{T}$ we have

$$
\boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \mathbf{W} = \boldsymbol{\Phi}^{\mathrm{T}} \mathbf{T}
$$

Solving for W then gives (3.15) as required.

The maximum likelihood solution for Σ is easily found by appealing to the standard result from Chapter 2 giving

$$
\boldsymbol{\Sigma} = \frac{1}{N} \sum_{n = 1}^{N}(\mathbf{t}_{n} - \mathbf{W}_{\mathrm{ML}}^{\mathrm{T}} \phi(\mathbf{x}_{n}))(\mathbf{t}_{n} - \mathbf{W}_{\mathrm{ML}}^{\mathrm{T}} \phi(\mathbf{x}_{n}))^{\mathrm{T}}.
$$

as required. Since we are finding a joint maximum with respect to both W and Σ we see that it is ${\bf W}_{\mathrm{ML}}$ which appears in this expression, as in the standard result for an unconditional Gaussian distribution.

## 3.8 Combining the prior

$$
p(\mathbf{w}) = \mathcal{N}(\mathbf{w} | \mathbf{m}_{N}, \mathbf{S}_{N})
$$

and the likelihood

$$
p(t_{N + 1} | \mathbf{x}_{N + 1}, \mathbf{w}) = \left(\frac{\beta}{2 \pi}\right)^{1 / 2} \exp \left(- \frac{\beta}{2}(t_{N + 1} - \mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}_{N + 1})^{2}\right)\tag{111}
$$

where $\phi_{N + 1} = \phi(\mathbf{x}_{N + 1})$ , we obtain a posterior of the form

$$
\begin{array}{l} p(\mathbf{w} | t_{N + 1}, \mathbf{x}_{N + 1}, \mathbf{m}_{N}, \mathbf{S}_{N}) \\ \propto \exp \left(- \frac{1}{2}(\mathbf{w} - \mathbf{m}_{N})^{\mathrm{T}} \mathbf{S}_{N}^{- 1}(\mathbf{w} - \mathbf{m}_{N}) - \frac{1}{2} \beta(t_{N + 1} - \mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}_{N + 1})^{2}\right).\end{array}
$$

We can expand the argument of the exponential, omitting the $- 1 / 2$ factors, as follows

$$
\begin{array}{rl} &{(\mathbf{w} - \mathbf{m}_{N})^{\mathrm{T}} \mathbf{S}_{N}^{- 1}(\mathbf{w} - \mathbf{m}_{N}) + \beta(t_{N + 1} - \mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}_{N + 1})^{2}} \\ &{\quad = \mathbf{w}^{\mathrm{T}} \mathbf{S}_{N}^{- 1} \mathbf{w} - 2 \mathbf{w}^{\mathrm{T}} \mathbf{S}_{N}^{- 1} \mathbf{m}_{N}} \\ &{\qquad + \beta \mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}_{N + 1}^{\mathrm{T}} \boldsymbol{\phi}_{N + 1} \mathbf{w} - 2 \beta \mathbf{w}^{\mathrm{T}} \boldsymbol{\phi}_{N + 1} t_{N + 1} + \mathrm{const}} \\ &{\quad = \mathbf{w}^{\mathrm{T}}(\mathbf{S}_{N}^{- 1} + \beta \boldsymbol{\phi}_{N + 1} \boldsymbol{\phi}_{N + 1}^{\mathrm{T}}) \mathbf{w} - 2 \mathbf{w}^{\mathrm{T}}(\mathbf{S}_{N}^{- 1} \mathbf{m}_{N} + \beta \boldsymbol{\phi}_{N + 1} t_{N + 1}) + \mathrm{const},} \end{array}
$$

where const denotes remaining terms independent of $\mathbf{w}.$ . From this we can read off the desired result directly,

$$
p(\mathbf{w} | t_{N + 1}, \mathbf{x}_{N + 1}, \mathbf{m}_{N}, \mathbf{S}_{N}) = \mathcal{N}(\mathbf{w} | \mathbf{m}_{N + 1}, \mathbf{S}_{N + 1}),
$$

with

$$
\mathbf{S}_{N + 1}^{- 1} = \mathbf{S}_{N}^{- 1} + \beta \phi_{N + 1} \boldsymbol{\phi}_{N + 1}^{\mathrm{T}}.\tag{112}
$$

and

$$
\mathbf{m}_{N + 1} = \mathbf{S}_{N + 1}(\mathbf{S}_{N}^{- 1} \mathbf{m}_{N} + \beta \phi_{N + 1} t_{N + 1}).\tag{113}
$$

3.10 Using (3.3), (3.8) and (3.49), we can re-write (3.57) as

$$
p(t | \mathbf{x}, \mathbf{t}, \alpha, \beta) = \int \mathcal{N}(t | \phi(\mathbf{x})^{\mathrm{T}} \mathbf{w}, \beta^{- 1}) \mathcal{N}(\mathbf{w} | \mathbf{m}_{N}, \mathbf{S}_{N}) d \mathbf{w}.
$$

By matching the first factor of the integrand with (2.114) and the second factor with (2.113), we obtain the desired result directly from (2.115).

3.15 This is easily shown by substituting the re-estimation formulae (3.92) and (3.95) into (3.82), giving

$$
\begin{array}{r} E(\mathbf{m}_{N}) = \frac{\beta}{2} \left\| \mathbf{t} - \boldsymbol{\Phi} \mathbf{m}_{N} \right\|^{2} + \frac{\alpha}{2} \mathbf{m}_{N}^{\mathrm{T}} \mathbf{m}_{N} \\ = \frac{N - \gamma}{2} + \frac{\gamma}{2} = \frac{N}{2}.\end{array}
$$

3.18 We can rewrite (3.79)

$$
\begin{array}{rl} \frac{\beta}{2} \left\| \mathbf{t} - \boldsymbol{\Phi} \mathbf{w} \right\|^{2} + \frac{\alpha}{2} \mathbf{w}^{\mathrm{T}} \mathbf{w} \\ = & \frac{\beta}{2} \left(\mathbf{t}^{\mathrm{T}} \mathbf{t} - 2 \mathbf{t}^{\mathrm{T}} \boldsymbol{\Phi} \mathbf{w} + \mathbf{w}^{\mathrm{T}} \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \mathbf{w}\right) + \frac{\alpha}{2} \mathbf{w}^{\mathrm{T}} \mathbf{w} \\ = & \frac{1}{2} \left(\beta \mathbf{t}^{\mathrm{T}} \mathbf{t} - 2 \beta \mathbf{t}^{\mathrm{T}} \boldsymbol{\Phi} \mathbf{w} + \mathbf{w}^{\mathrm{T}} \mathbf{A} \mathbf{w}\right) \end{array}
$$

where, in the last line, we have used $(3.81)$ . We now use the tricks of adding ${\bf 0} =$ $\mathrm{{\bf m}_{N}^{T}{\bf A} m_{N} -{\bf m}_{N}^{T}{\bf A} m_{N}}$ and using $\mathbf{I} = \mathbf{A}^{- 1} \mathbf{A}$ , combined with (3.84), as follows:

$$
\begin{array}{l} \frac{1}{2} \left(\beta \mathbf{t}^{\mathrm{T}} \mathbf{t} - 2 \beta \mathbf{t}^{\mathrm{T}} \boldsymbol{\Phi} \mathbf{w} + \mathbf{w}^{\mathrm{T}} \mathbf{A} \mathbf{w}\right) \\ = \frac{1}{2} \left(\beta \mathbf{t}^{\mathrm{T}} \mathbf{t} - 2 \beta \mathbf{t}^{\mathrm{T}} \boldsymbol{\Phi} \mathbf{A}^{- 1} \mathbf{A} \mathbf{w} + \mathbf{w}^{\mathrm{T}} \mathbf{A} \mathbf{w}\right) \\ = \frac{1}{2} \left(\beta \mathbf{t}^{\mathrm{T}} \mathbf{t} - 2 \mathbf{m}_{N}^{\mathrm{T}} \mathbf{A} \mathbf{w} + \mathbf{w}^{\mathrm{T}} \mathbf{A} \mathbf{w} + \mathbf{m}_{N}^{\mathrm{T}} \mathbf{A} \mathbf{m}_{N} - \mathbf{m}_{N}^{\mathrm{T}} \mathbf{A} \mathbf{m}_{N}\right) \\ = \frac{1}{2} \left(\beta \mathbf{t}^{\mathrm{T}} \mathbf{t} - \mathbf{m}_{N}^{\mathrm{T}} \mathbf{A} \mathbf{m}_{N}\right) + \frac{1}{2}(\mathbf{w} - \mathbf{m}_{N})^{\mathrm{T}} \mathbf{A}(\mathbf{w} - \mathbf{m}_{N}).\end{array}
$$

Here the last term equals term the last term of (3.80) and so it remains to show that the first term equals the r.h.s. of (3.82). To do this, we use the same tricks again:

$$
\begin{array}{l} \frac{1}{2} \left(\beta \mathbf{t}^{\mathrm{T}} \mathbf{t} - \mathbf{m}_{N}^{\mathrm{T}} \mathbf{A} \mathbf{m}_{N}\right) = \frac{1}{2} \left(\beta \mathbf{t}^{\mathrm{T}} \mathbf{t} - 2 \mathbf{m}_{N}^{\mathrm{T}} \mathbf{A} \mathbf{m}_{N} + \mathbf{m}_{N}^{\mathrm{T}} \mathbf{A} \mathbf{m}_{N}\right) \\ = \frac{1}{2} \left(\beta \mathbf{t}^{\mathrm{T}} \mathbf{t} - 2 \mathbf{m}_{N}^{\mathrm{T}} \mathbf{A} \mathbf{A}^{- 1} \boldsymbol{\Phi}^{\mathrm{T}} \mathbf{t} \beta + \mathbf{m}_{N}^{\mathrm{T}} \left(\alpha \mathbf{I} + \beta \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi}\right) \mathbf{m}_{N}\right) \\ = \frac{1}{2} \left(\beta \mathbf{t}^{\mathrm{T}} \mathbf{t} - 2 \mathbf{m}_{N}^{\mathrm{T}} \boldsymbol{\Phi}^{\mathrm{T}} \mathbf{t} \beta + \beta \mathbf{m}_{N}^{\mathrm{T}} \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \mathbf{m}_{N} + \alpha \mathbf{m}_{N}^{\mathrm{T}} \mathbf{m}_{N}\right) \\ = \frac{1}{2} \left(\beta(\mathbf{t} - \boldsymbol{\Phi} \mathbf{m}_{N})^{\mathrm{T}}(\mathbf{t} - \boldsymbol{\Phi} \mathbf{m}_{N}) + \alpha \mathbf{m}_{N}^{\mathrm{T}} \mathbf{m}_{N}\right) \\ = \frac{\beta}{2} \| \mathbf{t} - \boldsymbol{\Phi} \mathbf{m}_{N} \|^{2} + \frac{\alpha}{2} \mathbf{m}_{N}^{\mathrm{T}} \mathbf{m}_{N} \end{array}
$$

as required.

3.20 We only need to consider the terms of (3.86) that depend on $\alpha,$ which are the first, third and fourth terms.

Following the sequence of steps in Section 3.5.2, we start with the last of these terms,

$$
- \frac{1}{2} \ln | \mathbf{A} |.
$$

From (3.81), (3.87) and the fact that that eigenvectors $\mathbf{u}_{i}$ are orthonormal (see also Appendix C), we find that the eigenvectors of A to be $\alpha + \lambda_{i}$ . We can then use (C.47) and the properties of the logarithm to take us from the left to the right side of (3.88).

The derivatives for the first and third term of (3.86) are more easily obtained using standard derivatives and (3.82), yielding

$$
\frac{1}{2} \left(\frac{M}{\alpha} + \mathbf{m}_{N}^{\mathrm{T}} \mathbf{m}_{N}\right).
$$

We combine these results into (3.89), from which we get (3.92) via (3.90). The expression for $\gamma$ in (3.91) is obtained from (3.90) by substituting

$$
\sum_{i}^{M} \frac{\lambda_{i} + \alpha}{\lambda_{i} + \alpha}
$$

for M and re-arranging.

3.23 From (3.10), (3.112) and the properties of the Gaussian and Gamma distributions (see Appendix B), we get

$$
\begin{array}{ll} p(\mathbf{t}) & = \iint p(\mathbf{t} | \mathbf{w}, \beta) p(\mathbf{w} | \beta) d \mathbf{w} p(\beta) d \beta \\ & = \iint \left(\frac{\beta}{2 \pi}\right)^{N / 2} \exp \left\{- \frac{\beta}{2}(\mathbf{t} - \boldsymbol{\Phi} \mathbf{w})^{\mathrm{T}}(\mathbf{t} - \boldsymbol{\Phi} \mathbf{w}) \right\} \\ & \qquad \left(\frac{\beta}{2 \pi}\right)^{M / 2} | \mathbf{S}_{0} |^{- 1 / 2} \exp \left\{- \frac{\beta}{2}(\mathbf{w} - \mathbf{m}_{0})^{\mathrm{T}} \mathbf{S}_{0}^{- 1}(\mathbf{w} - \mathbf{m}_{0}) \right\} d \mathbf{w} \\ & \qquad \Gamma(a_{0})^{- 1} b_{0}^{a_{0}} \beta^{a_{0} - 1} \exp(- b_{0} \beta) d \beta \\ & = \frac{b_{0}^{a_{0}}}{((2 \pi)^{M + N} | \mathbf{S}_{0} |)^{1 / 2}} \iint \exp \left\{- \frac{\beta}{2}(\mathbf{t} - \boldsymbol{\Phi} \mathbf{w})^{\mathrm{T}}(\mathbf{t} - \boldsymbol{\Phi} \mathbf{w}) \right\} \\ & \qquad \exp \left\{- \frac{\beta}{2}(\mathbf{w} - \mathbf{m}_{0})^{\mathrm{T}} \mathbf{S}_{0}^{- 1}(\mathbf{w} - \mathbf{m}_{0}) \right\} d \mathbf{w} \\ & \qquad \beta^{a_{0} - 1} \beta^{N / 2} \beta^{M / 2} \exp(- b_{0} \beta) d \beta \\ & = \frac{b_{0}^{a_{0}}}{((2 \pi)^{M + N} | \mathbf{S}_{0} |)^{1 / 2}} \iint \exp \left\{- \frac{\beta}{2}(\mathbf{w} - \mathbf{m}_{N})^{\mathrm{T}} \mathbf{S}_{N}^{- 1}(\mathbf{w} - \mathbf{m}_{N}) \right\} d \mathbf{w} \\ & \qquad \exp \left\{- \frac{\beta}{2}(\mathbf{t}^{\mathrm{T}} \mathbf{t} + \mathbf{m}_{0}^{\mathrm{T}} \mathbf{S}_{0}^{- 1} \mathbf{m}_{0} - \mathbf{m}_{N}^{\mathrm{T}} \mathbf{S}_{N}^{- 1} \mathbf{m}_{N}) \right\} \\ & \qquad \beta^{a_{N} - 1} \beta^{M / 2} \exp(- b_{0} \beta) d \beta \end{array}
$$

where we have completed the square for the quadratic form in w, using

$$
\begin{array}{rcl} \mathbf{m}_{N} & = & \mathbf{S}_{N} \left[\mathbf{S}_{0}^{- 1} \mathbf{m}_{0} + \boldsymbol{\Phi}^{\mathrm{T}} \mathbf{t} \right] \\ \mathbf{S}_{N}^{- 1} & = & \beta \left(\mathbf{S}_{0}^{- 1} + \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi}\right) \\ a_{N} & = & a_{0} + \frac{N}{2} \\ b_{N} & = & b_{0} + \frac{1}{2} \left(\mathbf{m}_{0}^{\mathrm{T}} \mathbf{S}_{0}^{- 1} \mathbf{m}_{0} - \mathbf{m}_{N}^{\mathrm{T}} \mathbf{S}_{N}^{- 1} \mathbf{m}_{N} + \sum_{n = 1}^{N} t_{n}^{2}\right).\end{array}
$$

Now we are ready to do the integration, first over w and then $\beta,$ and re-arrange the terms to obtain the desired result

$$
\begin{array}{rcl} p(\mathbf{t}) & = & \frac{b_{0}^{a_{0}}}{((2 \pi)^{M + N} | \mathbf{S}_{0} |)^{1 / 2}}(2 \pi)^{M / 2} | \mathbf{S}_{N} |^{1 / 2} \int \beta^{a_{N} - 1} \exp(- b_{N} \beta) d \beta \\ & = & \frac{1}{(2 \pi)^{N / 2}} \frac{| \mathbf{S}_{N} |^{1 / 2}}{| \mathbf{S}_{0} |^{1 / 2}} \frac{b_{0}^{a_{0}}}{b_{N}^{a_{N}}} \frac{\Gamma(a_{N})}{\Gamma(a_{0})}.\end{array}
$$

4.2 For the purpose of this exercise, we make the contribution of the bias weights explicit in (4.15), giving

$$
E_{D}(\widetilde{\mathbf{W}}) = \frac{1}{2} \mathrm{Tr} \left\{(\mathbf{X} \mathbf{W} + \mathbf{1w}_{0}^{\mathrm{T}} - \mathbf{T})^{\mathrm{T}}(\mathbf{X} \mathbf{W} + \mathbf{1w}_{0}^{\mathrm{T}} - \mathbf{T}) \right\},\tag{114}
$$

where $\mathbf{w}_{0}$ is the column vector of bias weights (the top row of $\widetilde{\mathbf{W}}$ transposed) and 1 is a column vector of N ones.

We can take the derivative of (114) w.r.t. $\mathbf{w}_{0}$ , giving

$$
2N \mathbf{w}_{0} + 2(\mathbf{XW} - \mathbf{T})^{\mathrm{T}} \mathbf{1}.
$$

Setting this to zero, and solving for $\mathbf{w}_{0}$ , we obtain

$$
\mathbf{w}_{0} = \bar{\mathbf{t}} - \mathbf{W}^{\mathrm{T}} \bar{\mathbf{x}}\tag{115}
$$

where

$$
\bar{\mathbf{t}} = \frac{1}{N} \mathbf{T}^{\mathrm{T}} \mathbf{1} \quad \text{and} \quad \bar{\mathbf{x}} = \frac{1}{N} \mathbf{X}^{\mathrm{T}} \mathbf{1}.
$$

If we subsitute (115) into (114), we get

$$
E_{D}(\mathbf{W}) = \frac{1}{2} \mathrm{Tr} \left\{(\mathbf{X} \mathbf{W} + \overline{{\mathbf{T}}} - \overline{{\mathbf{X}}} \mathbf{W} - \mathbf{T})^{\mathrm{T}}(\mathbf{X} \mathbf{W} + \overline{{\mathbf{T}}} - \overline{{\mathbf{X}}} \mathbf{W} - \mathbf{T}) \right\},
$$

where

$$
\overline{{\mathbf{T}}} = \mathbf{1} \bar{\mathbf{t}}^{\mathrm{T}} \quad \text{and} \quad \overline{{\mathbf{X}}} = \mathbf{1} \bar{\mathbf{x}}^{\mathrm{T}}.
$$

Setting the derivative of this w.r.t. W to zero we get

$$
\mathbf{W} =(\widehat{\mathbf{X}}^{\mathrm{T}} \widehat{\mathbf{X}})^{- 1} \widehat{\mathbf{X}}^{\mathrm{T}} \widehat{\mathbf{T}} = \widehat{\mathbf{X}}^{\dagger} \widehat{\mathbf{T}},
$$

where we have defined $\widehat{\mathbf{X}} = \mathbf{X} - \overline{{\mathbf{X}}}$ and $\begin{array}{r}{\widehat{\bf T} ={\bf T} - \overline{{\bf T}}} \end{array}$

Now consider the prediction for a new input vector $\mathbf{x}^{\star}$

$$
\begin{array}{rcl} \mathbf{y}(\mathbf{x}^{\star}) & = & \mathbf{W}^{\mathrm{T}} \mathbf{x}^{\star} + \mathbf{w}_{0} \\ & = & \mathbf{W}^{\mathrm{T}} \mathbf{x}^{\star} + \bar{\mathbf{t}} - \mathbf{W}^{\mathrm{T}} \bar{\mathbf{x}} \\ & = & \bar{\mathbf{t}} - \widehat{\mathbf{T}}^{\mathrm{T}} \left(\widehat{\mathbf{X}}^{\dagger}\right)^{\mathrm{T}}(\mathbf{x}^{\star} - \bar{\mathbf{x}}).\end{array}\tag{116}
$$

If we apply (4.157) to $\bar{\mathbf{t}},$ we get

$$
\mathbf{a}^{\mathrm{T}} \bar{\mathbf{t}} = \frac{1}{N} \mathbf{a}^{\mathrm{T}} \mathbf{T}^{\mathrm{T}} \mathbf{1} = - b.
$$

Therefore, applying (4.157) to (116), we obtain

$$
\begin{array}{rcl} \mathbf{a}^{\mathrm{T}} \mathbf{y}(\mathbf{x}^{\star}) & = & \mathbf{a}^{\mathrm{T}} \bar{\mathbf{t}} + \mathbf{a}^{\mathrm{T}} \widehat{\mathbf{T}}^{\mathrm{T}} \left(\widehat{\mathbf{X}}^{\dagger}\right)^{\mathrm{T}}(\mathbf{x}^{\star} - \bar{\mathbf{x}}) \\ & = & \mathbf{a}^{\mathrm{T}} \bar{\mathbf{t}} = - b, \end{array}
$$

since $\mathbf{a}^{\mathrm{T}} \widehat{\mathbf{T}}^{\mathrm{T}} = \mathbf{a}^{\mathrm{T}}(\mathbf{T} - \overline{{\mathbf{T}}})^{\mathrm{T}} = b(\mathbf{1} - \mathbf{1})^{\mathrm{T}} = \mathbf{0}^{\mathrm{T}}.$

4.4 From (4.22) we can construct the Lagrangian function

$$
L = \mathbf{w}^{\mathrm{T}}(\mathbf{m}_{2} - \mathbf{m}_{1}) + \lambda \left(\mathbf{w}^{\mathrm{T}} \mathbf{w} - 1\right).
$$

Taking the gradient of L we obtain

$$
\nabla L = \mathbf{m}_{2} - \mathbf{m}_{1} + 2 \lambda \mathbf{w}\tag{117}
$$

and setting this gradient to zero gives

$$
\mathbf{w} = - \frac{1}{2 \lambda}(\mathbf{m}_{2} - \mathbf{m}_{1})
$$

form which it follows that $\mathbf{w} \propto \mathbf{m}_{2} - \mathbf{m}_{1}$

4.7 From (4.59) we have

$$
\begin{array}{rcl} 1 - \sigma(a) & = & 1 - \frac{1}{1 + e^{- a}} = \frac{1 + e^{- a} - 1}{1 + e^{- a}} \\ & = & \frac{e^{- a}}{1 + e^{- a}} = \frac{1}{e^{a} + 1} = \sigma(- a).\end{array}
$$

The inverse of the logistic sigmoid is easily found as follows

$$
\begin{array}{rcl} y = \sigma(a) & = & \frac{1}{1 + e^{- a}} \\ \Rightarrow & \frac{1}{y} - 1 & = e^{- a} \\ \Rightarrow & \ln \left\{\frac{1 - y}{y} \right\} & = - a \\ \Rightarrow & \ln \left\{\frac{y}{1 - y} \right\} & = a = \sigma^{- 1}(y).\end{array}
$$

4.9 The likelihood function is given by

$$
p \left(\{\phi_{n}, \mathbf{t}_{n}\} | \{\pi_{k}\}\right) = \prod_{n = 1}^{N} \prod_{k = 1}^{K} \left\{p(\phi_{n} | \mathcal{C}_{k}) \pi_{k} \right\}^{t_{nk}}
$$

and taking the logarithm, we obtain

$$
\ln p \left(\left\{\phi_{n}, \mathbf{t}_{n} \right\} \mid \left\{\pi_{k} \right\}\right) = \sum_{n = 1}^{N} \sum_{k = 1}^{K} t_{nk} \left\{\ln p \left(\phi_{n} \mid \mathcal{C}_{k}\right) + \ln \pi_{k} \right\}.\tag{118}
$$

In order to maximize the log likelihood with respect to $\pi_{k}$ we need to preserve the constraint $\textstyle \sum_{k} \pi_{k} = 1$ . This can be done by introducing a Lagrange multiplier $\lambda$ and maximizing

$$
\ln p \left(\left\{\phi_{n}, \mathbf{t}_{n} \right\} \mid \left\{\pi_{k} \right\}\right) + \lambda \left(\sum_{k = 1}^{K} \pi_{k} - 1\right).
$$

Setting the derivative with respect to $\pi_{k}$ equal to zero, we obtain

$$
\sum_{n = 1}^{N} \frac{t_{nk}}{\pi_{k}} + \lambda = 0.
$$

Re-arranging then gives

$$
- \pi_{k} \lambda = \sum_{n}^{N} t_{nk} = N_{k}.\tag{119}
$$

Summing both sides over k we find that $\lambda = - N$ , and using this to eliminate λ we obtain (4.159).

## 4.12 Differentiating (4.59) we obtain

$$
\begin{array}{rcl} \frac{d \sigma}{da} & = & \frac{e^{- a}}{(1 + e^{- a})^{2}} \\ & = & \sigma(a) \left\{\frac{e^{- a}}{1 + e^{- a}} \right\} \\ & = & \sigma(a) \left\{\frac{1 + e^{- a}}{1 + e^{- a}} - \frac{1}{1 + e^{- a}} \right\} \\ & = & \sigma(a)(1 - \sigma(a)).\end{array}
$$

4.13 We start by computing the derivative of (4.90) w.r.t. y<sub>n</sub>

$$
\begin{array}{rcl} \frac{\partial E}{\partial y_{n}} & = & \frac{1 - t_{n}}{1 - y_{n}} - \frac{t_{n}}{y_{n}} \\ & = & \frac{y_{n}(1 - t_{n}) - t_{n}(1 - y_{n})}{y_{n}(1 - y_{n})} \\ & = & \frac{y_{n} - y_{n} t_{n} - t_{n} + y_{n} t_{n}}{y_{n}(1 - y_{n})} \\ & & = \frac{y_{n} - t_{n}}{y_{n}(1 - y_{n})}.\end{array}\tag{120}
$$

(121)

(122)

From (4.88), we see that

$$
\frac{\partial y_{n}}{\partial a_{n}} = \frac{\partial \sigma(a_{n})}{\partial a_{n}} = \sigma(a_{n})(1 - \sigma(a_{n})) = y_{n}(1 - y_{n}).\tag{123}
$$

Finally, we have

$$
\nabla a_{n} = \phi_{n}\tag{124}
$$

where $\nabla$ denotes the gradient with respect to w. Combining (122), (123) and (124) using the chain rule, we obtain

$$
\begin{array}{rcl} \nabla E & = & \sum_{n = 1}^{N} \frac{\partial E}{\partial y_{n}} \frac{\partial y_{n}}{\partial a_{n}} \nabla a_{n} \\ & = & \sum_{n = 1}^{N}(y_{n} - t_{n}) \phi_{n} \end{array}
$$

as required.

4.17 From (4.104) we have

$$
\begin{array}{rcl} \frac{\partial y_{k}}{\partial a_{k}} & = & \frac{e^{a_{k}}}{\sum_{i} e^{a_{i}}} - \left(\frac{e^{a_{k}}}{\sum_{i} e^{a_{i}}}\right)^{2} = y_{k}(1 - y_{k}), \\ \frac{\partial y_{k}}{\partial a_{j}} & = & - \frac{e^{a_{k}} e^{a_{j}}}{\left(\sum_{i} e^{a_{i}}\right)^{2}} = - y_{k} y_{j}, \qquad j \neq k.\end{array}
$$

Combining these results we obtain (4.106).

4.19 Using the cross-entropy error function (4.90), and following Exercise 4.13, we have

$$
\frac{\partial E}{\partial y_{n}} = \frac{y_{n} - t_{n}}{y_{n}(1 - y_{n})}.\tag{125}
$$

Also

$$
\nabla a_{n} = \phi_{n}.\tag{126}
$$

From (4.115) and (4.116) we have

$$
\frac{\partial y_{n}}{\partial a_{n}} = \frac{\partial \Phi(a_{n})}{\partial a_{n}} = \frac{1}{\sqrt{2 \pi}} e^{- a_{n}^{2}}.\tag{127}
$$

Combining (125), (126) and (127), we get

$$
\nabla E = \sum_{n = 1}^{N} \frac{\partial E}{\partial y_{n}} \frac{\partial y_{n}}{\partial a_{n}} \nabla a_{n} = \sum_{n = 1}^{N} \frac{y_{n} - t_{n}}{y_{n}(1 - y_{n})} \frac{1}{\sqrt{2 \pi}} e^{- a_{n}^{2}} \phi_{n}.\tag{128}
$$

In order to find the expression for the Hessian, it is is convenient to first determine

$$
\begin{array}{rcl} \frac{\partial}{\partial y_{n}} \frac{y_{n} - t_{n}}{y_{n}(1 - y_{n})} & = & \frac{y_{n}(1 - y_{n})}{y_{n}^{2}(1 - y_{n})^{2}} - \frac{(y_{n} - t_{n})(1 - 2y_{n})}{y_{n}^{2}(1 - y_{n})^{2}} \\ & = & \frac{y_{n}^{2} + t_{n} - 2y_{n} t_{n}}{y_{n}^{2}(1 - y_{n})^{2}}.\end{array}\tag{129}
$$

Then using (126)–(129) we have

$$
\begin{array}{rcl} \nabla \nabla E & = & \sum_{n = 1}^{N} \left\{\frac{\partial}{\partial y_{n}} \left[\frac{y_{n} - t_{n}}{y_{n}(1 - y_{n})} \right] \frac{1}{\sqrt{2 \pi}} e^{- a_{n}^{2}} \phi_{n} \nabla y_{n} \right.\\ & & + \frac{y_{n} - t_{n}}{y_{n}(1 - y_{n})} \frac{1}{\sqrt{2 \pi}} e^{- a_{n}^{2}}(- 2a_{n}) \phi_{n} \nabla a_{n} \Bigg\} \\ & = & \sum_{n = 1}^{N} \left(\frac{y_{n}^{2} + t_{n} - 2y_{n} t_{n}}{y_{n}(1 - y_{n})} \frac{1}{\sqrt{2 \pi}} e^{- a_{n}^{2}} - 2a_{n}(y_{n} - t_{n})\right) \frac{e^{- 2a_{n}^{2}} \phi_{n} \phi_{n}^{\mathrm{T}}}{\sqrt{2 \pi} y_{n}(1 - y_{n})}.\end{array}
$$

4.23 The BIC approximation can be viewed as a large N approximation to the log model evidence. From (4.138), we have

$$
\begin{array}{rcl} \mathbf{A} & = & - \nabla \nabla \ln p(\mathcal{D} | \boldsymbol{\theta}_{\mathrm{MAP}}) p(\boldsymbol{\theta}_{\mathrm{MAP}}) \\ & = & \mathbf{H} - \nabla \nabla \ln p(\boldsymbol{\theta}_{\mathrm{MAP}}) \end{array}
$$

and if $p(\pmb \theta) = \mathcal{N}(\pmb \theta | \mathbf{m}, \mathbf{V}_{0})$ , this becomes

$$
\mathbf{A} = \mathbf{H} + \mathbf{V}_{0}^{- 1}.
$$

If we assume that the prior is broad, or equivalently that the number of data points is large, we can neglect the term $\mathbf{V}_{0}^{- 1}$ compared to H. Using this result, (4.137) can be rewritten in the form

$$
\ln p(\mathcal{D}) \simeq \ln p(\mathcal{D} | \boldsymbol{\theta}_{\mathrm{MAP}}) - \frac{1}{2} \left(\boldsymbol{\theta}_{\mathrm{MAP}} - \mathbf{m}\right) \mathbf{V}_{0}^{- 1} \left(\boldsymbol{\theta}_{\mathrm{MAP}} - \mathbf{m}\right) - \frac{1}{2} \ln | \mathbf{H} | + \text{const} \tag{130}\tag{130}
$$

as required. Note that the phrasing of the question is misleading, since the assumption of a broad prior, or of large $N,$ , is required in order to derive this form, as well as in the subsequent simplification.

We now again invoke the broad prior assumption, allowing us to neglect the second term on the right hand side of (130) relative to the first term.

Since we assume i.i.d. data, $\mathbf{H} = - \nabla \nabla \ln{p(\mathcal{D} | \theta_{\mathrm{MAP}})}$ consists of a sum of terms, one term for each datum, and we can consider the following approximation:

$$
\mathbf{H} = \sum_{n = 1}^{N} \mathbf{H}_{n} = N \widehat{\mathbf{H}}
$$

where $\mathbf{H}_{n}$ is the contribution from the $n^{\mathrm{th}}$ data point and

$$
\widehat{\mathbf{H}} = \frac{1}{N} \sum_{n = 1}^{N} \mathbf{H}_{n}.
$$

Combining this with the properties of the determinant, we have

$$
\ln | \mathbf{H} | = \ln | N \widehat{\mathbf{H}} | = \ln \left(N^{M} | \widehat{\mathbf{H}} |\right) = M \ln N + \ln | \widehat{\mathbf{H}} |
$$

where M is the dimensionality of θ. Note that we are assuming that $\widehat{\bf H}$ has full rank $M$ . Finally, using this result together (130), we obtain (4.139) by dropping the ln $| \widehat{\mathbf{H}} |$ since this $O(1)$ compared to ln $N$

## Chapter 5 Neural Networks

5.2 The likelihood function for an i.i.d. data set, $\left\{(\mathbf{x}_{1}, \mathbf{t}_{1}), \dotsc,(\mathbf{x}_{N}, \mathbf{t}_{N}) \right\}$ , under the conditional distribution (5.16) is given by

$$
\prod_{n = 1}^{N} \mathcal{N} \left(\mathbf{t}_{n} | \mathbf{y}(\mathbf{x}_{n}, \mathbf{w}), \beta^{- 1} \mathbf{I}\right).
$$

If we take the logarithm of this, using (2.43), we get

$$
\begin{array}{ll} \sum_{n = 1}^{N} \ln \mathcal{N} \left(\mathbf{t}_{n} | \mathbf{y}(\mathbf{x}_{n}, \mathbf{w}), \beta^{- 1} \mathbf{I}\right) \\ = & - \frac{1}{2} \sum_{n = 1}^{N} \left(\mathbf{t}_{n} - \mathbf{y}(\mathbf{x}_{n}, \mathbf{w})\right)^{\mathrm{T}}(\beta \mathbf{I}) \left(\mathbf{t}_{n} - \mathbf{y}(\mathbf{x}_{n}, \mathbf{w})\right) + \text{const} \\ = & - \frac{\beta}{2} \sum_{n = 1}^{N} \| \mathbf{t}_{n} - \mathbf{y}(\mathbf{x}_{n}, \mathbf{w}) \|^{2} + \text{const}, \end{array}
$$

where ‘const’ comprises terms which are independent of $\mathbf{w}.$ The first term on the right hand side is proportional to the negative of (5.11) and hence maximizing the log-likelihood is equivalent to minimizing the sum-of-squares error.

5.5 For the given interpretation of $y_{k}(\mathbf{x}, \mathbf{w})$ , the conditional distribution of the target vector for a multiclass neural network is

$$
p(\mathbf{t} | \mathbf{w}_{1}, \dots, \mathbf{w}_{K}) = \prod_{k = 1}^{K} y_{k}^{t_{k}}.
$$

Thus, for a data set of N points, the likelihood function will be

$$
p(\mathbf{T} | \mathbf{w}_{1}, \dots, \mathbf{w}_{K}) = \prod_{n = 1}^{N} \prod_{k = 1}^{K} y_{nk}^{t_{nk}}.
$$

Taking the negative logarithm in order to derive an error function we obtain (5.24) as required. Note that this is the same result as for the multiclass logistic regression model, given by (4.108) .

5.6 Differentiating (5.21) with respect to the activation $a_{n}$ corresponding to a particular data point n, we obtain

$$
\frac{\partial E}{\partial a_{n}} = - t_{n} \frac{1}{y_{n}} \frac{\partial y_{n}}{\partial a_{n}} +(1 - t_{n}) \frac{1}{1 - y_{n}} \frac{\partial y_{n}}{\partial a_{n}}.\tag{131}
$$

From (4.88), we have

$$
\frac{\partial y_{n}}{\partial a_{n}} = y_{n}(1 - y_{n}).\tag{132}
$$

Substituting (132) into (131), we get

$$
\begin{array}{rcl} \frac{\partial E}{\partial a_{n}} & = & - t_{n} \frac{y_{n}(1 - y_{n})}{y_{n}} +(1 - t_{n}) \frac{y_{n}(1 - y_{n})}{(1 - y_{n})} \\ & = & y_{n} - t_{n} \end{array}
$$

as required.

5.9 This simply corresponds to a scaling and shifting of the binary outputs, which directly gives the activation function, using the notation from (5.19), in the form

$$
y = 2 \sigma(a) - 1.
$$

The corresponding error function can be constructed from (5.21) by applying the inverse transform to $y_{n}$ and $t_{n}$ , yielding

$$
\begin{array}{rcl} E(\mathbf{w}) & = & - \sum_{n}^{N} \frac{1 + t_{n}}{2} \ln \frac{1 + y_{n}}{2} + \left(1 - \frac{1 + t_{n}}{2}\right) \ln \left(1 - \frac{1 + y_{n}}{2}\right) \\ & = & - \frac{1}{2} \sum_{n}^{N} \{(1 + t_{n}) \ln(1 + y_{n}) +(1 - t_{n}) \ln(1 - y_{n})\} + N \ln 2 \end{array}
$$

where the last term can be dropped, since it is independent of w.

To find the corresponding activation function we simply apply the linear transformation to the logistic sigmoid given by (5.19), which gives

$$
\begin{array}{rcl} y(a) & = & 2 \sigma(a) - 1 = \frac{2}{1 + e^{- a}} - 1 \\ & = & \frac{1 - e^{- a}}{1 + e^{- a}} = \frac{e^{a / 2} - e^{- a / 2}}{e^{a / 2} + e^{- a / 2}} \\ & = & \tanh(a / 2).\end{array}
$$

5.10 From (5.33) and (5.35) we have

$$
\mathbf{u}_{i}^{\mathrm{T}} \mathbf{H} \mathbf{u}_{i} = \mathbf{u}_{i}^{\mathrm{T}} \lambda_{i} \mathbf{u}_{i} = \lambda_{i}.
$$

Assume that H is positive definite, so that (5.37) holds. Then by setting $\mathbf{v} = \mathbf{u}_{i}$ it follows that

$$
\lambda_{i} = \mathbf{u}_{i}^{\mathrm{T}} \mathbf{H} \mathbf{u}_{i} > 0\tag{133}
$$

for all values of i. Thus, if H is positive definite, all of its eigenvalues will be positive.

Conversely, assume that (133) holds. Then, for any vector, v, we can make use of (5.38) to give

$$
\begin{array}{rcl} \mathbf{v}^{\mathrm{T}} \mathbf{H} \mathbf{v} & = & \left(\sum_{i} c_{i} \mathbf{u}_{i}\right)^{\mathrm{T}} \mathbf{H} \left(\sum_{j} c_{j} \mathbf{u}_{j}\right) \\ & = & \left(\sum_{i} c_{i} \mathbf{u}_{i}\right)^{\mathrm{T}} \left(\sum_{j} \lambda_{j} c_{j} \mathbf{u}_{j}\right) \\ & = & \sum_{i} \lambda_{i} c_{i}^{2} > 0 \end{array}
$$

where we have used (5.33) and (5.34) along with (133). Thus, if all of the eigenvalues are positive, the Hessian matrix will be positive definite.

5.11 We start by making the change of variable given by (5.35) which allows the error function to be written in the form (5.36). Setting the value of the error function $E(\mathbf{w})$ to a constant value C we obtain

$$
E(\mathbf{w}^{\star}) + \frac{1}{2} \sum_{i} \lambda_{i} \alpha_{i}^{2} = C.
$$

Re-arranging gives

$$
\sum_{i} \lambda_{i} \alpha_{i}^{2} = 2C - 2E(\mathbf{w}^{\star}) = \widetilde{C}
$$

where $\widetilde{C}$ is also a constant. This is the equation for an ellipse whose axes are aligned with the coordinates described by the variables $\left\{\alpha_{i} \right\}$ . The length of axis $j$ is found by setting $\alpha_{i} = 0$ for all $i \neq j$ , and solving for $\alpha_{j}$ giving

$$
\alpha_{j} = \left(\frac{\widetilde{C}}{\lambda_{j}}\right)^{1 / 2}
$$

which is inversely proportional to the square root of the corresponding eigenvalue.

5.12 From (5.37) we see that, if H is positive definite, then the second term in (5.32) will be positive whenever $\left(\mathbf{w} - \mathbf{w}^{\star} \right)$ is non-zero. Thus the smallest value which $E(\mathbf{w})$ can take is $E(\mathbf{w}^{\star})$ , and so $\mathbf{w}^{\star}$ is the minimum of $E(\mathbf{w})$

Conversely, if $\mathbf{w}^{\star}$ is the minimum of $E(\mathbf{w})$ , then, for any vector w $\neq{\mathbf{w}}^{\star}, E({\mathbf{w}}) >$ $E(\mathbf{w}^{\star})$ . This will only be the case if the second term of (5.32) is positive for all values of $\mathbf{w} \neq \mathbf{w}^{\star}$ (since the first term is independent of w). Since $\mathbf{w} - \mathbf{w}^{\star}$ can be set to any vector of real numbers, it follows from the definition (5.37) that H must be positive definite.

5.19 If we take the gradient of (5.21) with respect to w, we obtain

$$
\nabla E(\mathbf{w}) = \sum_{n = 1}^{N} \frac{\partial E}{\partial a_{n}} \nabla a_{n} = \sum_{n = 1}^{N}(y_{n} - t_{n}) \nabla a_{n},
$$

where we have used the result proved earlier in the solution to Exercise 5.6. Taking the second derivatives we have

$$
\nabla \nabla E(\mathbf{w}) = \sum_{n = 1}^{N} \left\{\frac{\partial y_{n}}{\partial a_{n}} \nabla a_{n} \nabla a_{n} +(y_{n} - t_{n}) \nabla \nabla a_{n} \right\}.
$$

Dropping the last term and using the result (4.88) for the derivative of the logistic sigmoid function, proved in the solution to Exercise 4.12, we finally get

$$
\nabla \nabla E(\mathbf{w}) \simeq \sum_{n = 1}^{N} y_{n}(1 - y_{n}) \nabla a_{n} \nabla a_{n} = \sum_{n = 1}^{N} y_{n}(1 - y_{n}) \mathbf{b}_{n} \mathbf{b}_{n}^{\mathrm{T}}
$$

where $\mathbf{b}_{n} \equiv \nabla a_{n}$

## 5.25 The gradient of (5.195) is given

$$
\nabla E = \mathbf{H}(\mathbf{w} - \mathbf{w}^{\star})
$$

and hence update formula (5.196) becomes

$$
\mathbf{w}^{(\tau)} = \mathbf{w}^{(\tau - 1)} - \rho \mathbf{H}(\mathbf{w}^{(\tau - 1)} - \mathbf{w}^{\star}).
$$

Pre-multiplying both sides with $\mathbf{u}_{j}^{\mathrm{T}}$ we get

$$
\begin{array}{rcl} w_{j}^{(\tau)} & = & \mathbf{u}_{j}^{\mathrm{T}} \mathbf{w}^{(\tau)} \\ & = & \mathbf{u}_{j}^{\mathrm{T}} \mathbf{w}^{(\tau - 1)} - \rho \mathbf{u}_{j}^{\mathrm{T}} \mathbf{H}(\mathbf{w}^{(\tau - 1)} - \mathbf{w}^{\star}) \\ & = & w_{j}^{(\tau - 1)} - \rho \eta_{j} \mathbf{u}_{j}^{\mathrm{T}}(\mathbf{w} - \mathbf{w}^{\star}) \\ & = & w_{j}^{(\tau - 1)} - \rho \eta_{j}(w_{j}^{(\tau - 1)} - w_{j}^{\star}), \end{array}\tag{134}
$$

(135)

where we have used (5.198). To show that

$$
w_{j}^{(\tau)} = \{1 -(1 - \rho \eta_{j})^{\tau}\} w_{j}^{\star}
$$

for $\tau = 1, 2, \ldots$ , we can use proof by induction. For $\tau = 1$ , we recall that $\mathbf{w}^{(0)} = \mathbf{0}$ and insert this into (135), giving

$$
\begin{array}{rcl} w_{j}^{(1)} & = & w_{j}^{(0)} - \rho \eta_{j}(w_{j}^{(0)} - w_{j}^{\star}) \\ & = & \rho \eta_{j} w_{j}^{\star} \\ & = & \{1 -(1 - \rho \eta_{j})\} w_{j}^{\star}.\end{array}
$$

Now we assume that the result holds for $\tau = N - 1$ and then make use of (135)

$$
\begin{array}{rcl} w_{j}^{(N)} & = & w_{j}^{(N - 1)} - \rho \eta_{j}(w_{j}^{(N - 1)} - w_{j}^{\star}) \\ & = & w_{j}^{(N - 1)}(1 - \rho \eta_{j}) + \rho \eta_{j} w_{j}^{\star} \\ & = & \left\{1 -(1 - \rho \eta_{j})^{N - 1} \right\} w_{j}^{\star}(1 - \rho \eta_{j}) + \rho \eta_{j} w_{j}^{\star} \\ & = & \left\{(1 - \rho \eta_{j}) -(1 - \rho \eta_{j})^{N} \right\} w_{j}^{\star} + \rho \eta_{j} w_{j}^{\star} \\ & = & \left\{1 -(1 - \rho \eta_{j})^{N} \right\} w_{j}^{\star} \end{array}
$$

as required.

Provided that $| 1 - \rho \eta_{j} | < 1$ then we have $(1 - \rho \eta_{j})^{\tau} \to 0$ as $\tau \infty$ , and hence $\left\{1 -(1 - \rho \eta_{j})^{N} \right\} \to 1$ and $\mathbf{w}^{(\tau)} \to \mathbf{w}^{\star}$

If τ is finite but $\eta_{j} \gg(\rho \tau)^{- 1}$ , τ must still be large, since $\eta_{j} \rho \tau \gg 1$ , even though $| 1 - \rho \eta_{j} | < 1$ . If τ is large, it follows from the argument above that $w_{j}^{(\tau)} \simeq w_{j}^{\star}$

If, on the other hand, $\eta_{j} \ll(\rho \tau)^{- 1}$ , this means that $\rho \eta_{j}$ must be small, since $\rho \eta_{j} \tau \ll$ 1 and $\tau$ is an integer greater than or equal to one. If we expand,

$$
(1 - \rho \eta_{j})^{\tau} = 1 - \tau \rho \eta_{j} + O(\rho \eta_{j}^{2})
$$

and insert this into (5.197), we get

$$
\begin{array}{rcl} | w_{j}^{(\tau)} | & = & | \left\{1 -(1 - \rho \eta_{j})^{\tau} \right\} w_{j}^{\star} | \\ & = & | \left\{1 -(1 - \tau \rho \eta_{j} + O(\rho \eta_{j}^{2})) \right\} w_{j}^{\star} | \\ & \simeq & \tau \rho \eta_{j} | w_{j}^{\star} | \ll | w_{j}^{\star} | \end{array}
$$

Recall that in Section 3.5.3 we showed that when the regularization parameter (called α in that section) is much larger than one of the eigenvalues (called $\lambda_{j}$ in that section) then the corresponding parameter value $w_{i}$ will be close to zero. Conversely, when $\alpha$ is much smaller than $\lambda_{i}$ then $w_{i}$ will be close to its maximum likelihood value. Thus α is playing an analogous role to $\rho \tau$

5.27 If ${\bf s}({\bf x}, \pmb{\xi}) ={\bf x} + \pmb{\xi},$ , then

$$
\frac{\partial s_{k}}{\partial \xi_{i}} = I_{ki}, \mathrm{i.e.,} \frac{\partial \mathbf{s}}{\partial \pmb{\xi}} = \mathbf{I},
$$

and since the first order derivative is constant, there are no higher order derivatives. We now make use of this result to obtain the derivatives of y w.r.t. $\xi_{i} \mathbf{:}$

$$
\frac{\partial y}{\partial \xi_{i}} = \sum_{k} \frac{\partial y}{\partial s_{k}} \frac{\partial s_{k}}{\partial \xi_{i}} = \frac{\partial y}{\partial s_{i}} = b_{i}
$$

$$
\frac{\partial y}{\partial \xi_{i} \partial \xi_{j}} = \frac{\partial b_{i}}{\partial \xi_{j}} = \sum_{k} \frac{\partial b_{i}}{\partial s_{k}} \frac{\partial s_{k}}{\partial \xi_{j}} = \frac{\partial b_{i}}{\partial s_{j}} = B_{ij}
$$

Using these results, we can write the expansion of $\widetilde{E}$ as follows:

$$
\begin{array}{rcl} \widetilde{E} & = & \frac{1}{2} \iiint \left\{y(\mathbf{x}) - t \right\}^{2} p(t | \mathbf{x}) p(\mathbf{x}) p(\pmb{\xi}) d \pmb{\xi} d \mathbf{x} d t \\ & + & \iiint \left\{y(\mathbf{x}) - t \right\} \mathbf{b}^{\mathrm{T}} \pmb{\xi} p(\pmb{\xi}) p(t | \mathbf{x}) p(\mathbf{x}) d \pmb{\xi} d \mathbf{x} d t \\ & + & \frac{1}{2} \iiint \pmb{\xi}^{\mathrm{T}} \left(\left\{y(\mathbf{x}) - t \right\} \mathbf{B} + \mathbf{bb}^{\mathrm{T}}\right) \pmb{\xi} p(\pmb{\xi}) p(t | \mathbf{x}) p(\mathbf{x}) d \pmb{\xi} d \mathbf{x} d t.\end{array}
$$

The middle term will again disappear, since $\mathbb{E}[\pmb{\xi}] = \mathbf{0}$ and thus we can write $\widetilde{E}$ on the form of (5.131) with

$$
\Omega = \frac{1}{2} \iiint \boldsymbol{\xi}^{\mathrm{T}} \left(\{y(\mathbf{x}) - t\} \mathbf{B} + \mathbf{bb}^{\mathrm{T}}\right) \boldsymbol{\xi} p(\boldsymbol{\xi}) p(t | \mathbf{x}) p(\mathbf{x}) d \boldsymbol{\xi} d \mathbf{x} d t.
$$

Again the first term within the parenthesis vanishes to leading order in $\boldsymbol{\xi}$ and we are left with

$$
\begin{array}{rcl} \Omega & \simeq & \frac{1}{2} \iint \pmb{\xi}^{\mathrm{T}}(\mathbf{bb}^{\mathrm{T}}) \pmb{\xi} p(\pmb{\xi}) p(\mathbf{x}) d \pmb{\xi} d \mathbf{x} \\ & = & \frac{1}{2} \iint \operatorname{Trace}[(\pmb{\xi} \pmb{\xi}^{\mathrm{T}})(\mathbf{bb}^{\mathrm{T}})] p(\pmb{\xi}) p(\mathbf{x}) d \pmb{\xi} d \mathbf{x} \\ & = & \frac{1}{2} \int \operatorname{Trace}[\mathbf{I}(\mathbf{bb}^{\mathrm{T}})] p(\mathbf{x}) d \mathbf{x} \\ & = & \frac{1}{2} \int \mathbf{b}^{\mathrm{T}} \mathbf{b} p(\mathbf{x}) d \mathbf{x} = \frac{1}{2} \int \| \nabla y(\mathbf{x}) \|^{2} p(\mathbf{x}) d \mathbf{x}, \end{array}
$$

where we used the fact that $\mathbb{E}[\pmb{\xi} \pmb{\xi}^{\mathrm{T}}] = \mathbf{I}.$

5.28 The modifications only affect derivatives with respect to weights in the convolutional layer. The units within a feature map (indexed $m)$ have different inputs, but all share a common weight vector, $\mathbf{w}^{(m)}$ . Thus, errors $\delta^{(m)}$ from all units within a feature map will contribute to the derivatives of the corresponding weight vector. In this situation, (5.50) becomes

$$
\frac{\partial E_{n}}{\partial w_{i}^{(m)}} = \sum_{j} \frac{\partial E_{n}}{\partial a_{j}^{(m)}} \frac{\partial a_{j}^{(m)}}{\partial w_{i}^{(m)}} = \sum_{j} \delta_{j}^{(m)} z_{ji}^{(m)}.
$$

Here $a_{j}^{(m)}$ denotes the activation of the $j^{\mathrm{th}}$ unit in the $m^{\mathrm{th}}$ feature map, whereas $w_{i}^{(m)}$ denotes the $i^{\mathrm{th}}$ element of the corresponding feature vector and, finally, $z_{ji}^{(m)}$ denotes the $i^{\mathrm{th}}$ input for the $j^{\mathrm{th}}$ unit in the $m^{\mathrm{th}}$ feature map; the latter may be an actual input or the output of a preceding layer.

Note that $\delta_{j}^{(m)} = \partial E_{n} / \partial a_{j}^{(m)}$ will typically be computed recursively from the δs of the units in the following layer, using (5.55). If there are layer(s) preceding the convolutional layer, the standard backward propagation equations will apply; the weights in the convolutional layer can be treated as if they were independent param eters, for the purpose of computing the δs for the preceding layer’s units.

5.29 This is easily verified by taking the derivative of (5.138), using (1.46) and standard derivatives, yielding

$$
\frac{\partial \Omega}{\partial w_{i}} = \frac{1}{\sum_{k} \pi_{k} \mathcal{N}(w_{i} | \mu_{k}, \sigma_{k}^{2})} \sum_{j} \pi_{j} \mathcal{N}(w_{i} | \mu_{j}, \sigma_{j}^{2}) \frac{(w_{i} - \mu_{j})}{\sigma^{2}}.
$$

Combining this with (5.139) and (5.140), we immediately obtain the second term of (5.141).

5.34 We start by using the chain rule to write

$$
\frac{\partial E_{n}}{\partial a_{k}^{\pi}} = \sum_{j = 1}^{K} \frac{\partial E_{n}}{\partial \pi_{j}} \frac{\partial \pi_{j}}{\partial a_{k}^{\pi}}.\tag{136}
$$

Note that because of the coupling between outputs caused by the softmax activation function, the dependence on the activation of a single output unit involves all the output units.

For the first factor inside the sum on the r.h.s. of (136), standard derivatives applied to the $n^{\mathrm{th}}$ term of (5.153) gives

$$
\frac{\partial E_{n}}{\partial \pi_{j}} = - \frac{\mathcal{N}_{nj}}{\sum_{l = 1}^{K} \pi_{l} \mathcal{N}_{nl}} = - \frac{\gamma_{nj}}{\pi_{j}}.\tag{137}
$$

For the for the second factor, we have from (4.106) that

$$
\frac{\partial \pi_{j}}{\partial a_{k}^{\pi}} = \pi_{j}(I_{jk} - \pi_{k}).\tag{138}
$$

Combining (136), (137) and (138), we get

$$
\begin{array}{rcl} \frac{\partial E_{n}}{\partial a_{k}^{\pi}} & = & - \sum_{j = 1}^{K} \frac{\gamma_{nj}}{\pi_{j}} \pi_{j}(I_{jk} - \pi_{k}) \\ & = & - \sum_{j = 1}^{K} \gamma_{nj}(I_{jk} - \pi_{k}) = - \gamma_{nk} + \sum_{j = 1}^{K} \gamma_{nj} \pi_{k} = \pi_{k} - \gamma_{nk}, \end{array}
$$

where we have used the fact that, by (5.154), $\textstyle \sum_{j = 1}^{K} \gamma_{nj} = 1$ for all $n.$

5.39 Using (4.135), we can approximate (5.174) as

$$
\begin{array}{l} p(\mathcal{D} | \alpha, \beta) \simeq p(\mathcal{D} | \mathbf{w}_{\mathrm{MAP}}, \beta) p(\mathbf{w}_{\mathrm{MAP}} | \alpha) \\ \int \exp \left\{- \frac{1}{2} \left(\mathbf{w} - \mathbf{w}_{\mathrm{MAP}}\right)^{\mathrm{T}} \mathbf{A} \left(\mathbf{w} - \mathbf{w}_{\mathrm{MAP}}\right) \right\} d \mathbf{w}, \end{array}
$$

where A is given by (5.166), since $p(\mathcal{D} | \mathbf{w}, \beta) p(\mathbf{w} | \alpha)$ is proportional to $p(\mathbf{w} | \mathcal{D}, \alpha, \beta)$ Using (4.135), (5.162) and (5.163), we can rewrite this as

$$
p(\mathcal{D} | \alpha, \beta) \simeq \prod_{n}^{N} \mathcal{N}(t_{n} | y(\mathbf{x}_{n}, \mathbf{w}_{\mathrm{MAP}}), \beta^{- 1}) \mathcal{N}(\mathbf{w}_{\mathrm{MAP}} | \mathbf{0}, \alpha^{- 1} \mathbf{I}) \frac{(2 \pi)^{W / 2}}{| \mathbf{A} |^{1 / 2}}.
$$

Taking the logarithm of both sides and then using (2.42) and (2.43), we obtain the desired result.

5.40 For a $K \cdot$ -class neural network, the likelihood function is given by

$$
\prod_{n}^{N} \prod_{k}^{K} y_{k}(\mathbf{x}_{n}, \mathbf{w})^{t_{nk}}
$$

and the corresponding error function is given by (5.24).

Again we would use a Laplace approximation for the posterior distribution over the weights, but the corresponding Hessian matrix, H, in (5.166), would now be derived from (5.24). Similarly, (5.24), would replace the binary cross entropy error term in the regularized error function (5.184).

The predictive distribution for a new pattern would again have to be approximated, since the resulting marginalization cannot be done analytically. However, in contrast to the two-class problem, there is no obvious candidate for this approximation, although Gibbs (1997) discusses various alternatives.

## Chapter 6 Kernel Methods

6.1 We first of all note that $J(\mathbf{a})$ depends on a only through the form Ka. Since typically the number $N$ of data points is greater than the number M of basis functions, the matrix $\mathbf{K} = \Phi \Phi^{\mathrm{T}}$ will be rank deficient. There will then be M eigenvectors of K having non-zero eigenvalues, and $N - M$ eigenvectors with eigenvalue zero. We can then decompose $\mathbf{a} = \mathbf{a}_{\parallel} + \mathbf{a}_{\perp}$ where $\mathbf{a}_{\parallel}^{\mathrm{T}} \mathbf{a}_{\perp} = 0$ and $\mathbf{K} \mathbf{a}_{\perp} = \mathbf{0}$ . Thus the value of $\mathbf{a}_{\perp}$ is not determined by $J(\mathbf{a})$ . We can remove the ambiguity by setting $\mathbf{a}_{\perp} = \mathbf{0}$ , or equivalently by adding a regularizer term

$$
\frac{\epsilon}{2} \mathbf{a}_{\perp}^{\mathrm{T}} \mathbf{a}_{\perp}
$$

to $J(\mathbf{a})$ where $\epsilon$ is a small positive constant. Then ${\bf a} ={\bf a}_{\parallel}$ where $\mathbf{a}_{\parallel}$ lies in the span of $\mathbf{K} = \Phi \Phi^{\mathrm{T}}$ and hence can be written as a linear combination of the columns of $\Phi$ , so that in component notation

$$
a_{n} = \sum_{i = 1}^{M} u_{i} \phi_{i}(\mathbf{x}_{n})
$$

or equivalently in vector notation

$$
\mathbf{a} = \boldsymbol{\Phi} \mathbf{u}.\tag{139}
$$

Substituting (139) into (6.7) we obtain

$$
\begin{array}{rcl} J(\mathbf{u}) & = & \frac{1}{2} \left(\mathbf{K} \boldsymbol{\Phi} \mathbf{u} - \mathbf{t}\right)^{\mathrm{T}} \left(\mathbf{K} \boldsymbol{\Phi} \mathbf{u} - \mathbf{t}\right) + \frac{\lambda}{2} \mathbf{u}^{\mathrm{T}} \boldsymbol{\Phi}^{\mathrm{T}} \mathbf{K} \boldsymbol{\Phi} \mathbf{u} \\ & = & \frac{1}{2} \left(\boldsymbol{\Phi} \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \mathbf{u} - \mathbf{t}\right)^{\mathrm{T}} \left(\boldsymbol{\Phi} \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \mathbf{u} - \mathbf{t}\right) + \frac{\lambda}{2} \mathbf{u}^{\mathrm{T}} \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \mathbf{u} \end{array}\tag{140}
$$

Since the matrix $\Phi^{\mathrm{T}} \Phi$ has full rank we can define an equivalent parametrization given by

$$
\mathbf{w} = \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \mathbf{u}
$$

and substituting this into (140) we recover the original regularized error function (6.2).

6.5 The results (6.13) and (6.14) are easily proved by using (6.1) which defines the kernel in terms of the scalar product between the feature vectors for two input vectors. If $k_{1}(\mathbf{x}, \mathbf{x}^{\prime})$ is a valid kernel then there must exist a feature vector $\phi(\mathbf{x})$ such that

$$
k_{1}(\mathbf{x}, \mathbf{x}^{\prime}) = \boldsymbol{\phi}(\mathbf{x})^{\mathrm{T}} \boldsymbol{\phi}(\mathbf{x}^{\prime}).
$$

It follows that

$$
ck_{1}(\mathbf{x}, \mathbf{x}^{\prime}) = \mathbf{u}(\mathbf{x})^{\mathrm{T}} \mathbf{u}(\mathbf{x}^{\prime})
$$

where

$$
\mathbf{u}(\mathbf{x}) = c^{1 / 2} \phi(\mathbf{x})
$$

and so $ck_{1}({\bf x},{\bf x}^{\prime})$ can be expressed as the scalar product of feature vectors, and hence is a valid kernel.

Similarly, for (6.14) we can write

$$
f(\mathbf{x}) k_{1}(\mathbf{x}, \mathbf{x}^{\prime}) f(\mathbf{x}^{\prime}) = \mathbf{v}(\mathbf{x})^{\mathrm{T}} \mathbf{v}(\mathbf{x}^{\prime})
$$

where we have defined

$$
\mathbf{v}(\mathbf{x}) = f(\mathbf{x}) \phi(\mathbf{x}).
$$

Again, we see that $f(\mathbf{x}) k_{1}(\mathbf{x}, \mathbf{x}^{\prime}) f(\mathbf{x}^{\prime})$ can be expressed as the scalar product of feature vectors, and hence is a valid kernel.

Alternatively, these results can be proved be appealing to the general result that the Gram matrix, K, whose elements are given by $k(\mathbf{x}_{n}, \mathbf{x}_{m})$ , should be positive semidefinite for all possible choices of the set $\left\{\mathbf{x}_{n} \right\}$ , by following a similar argument to Solution 6.7 below.

6.7 (6.17) is most easily proved by making use of the result, discussed on page 295, that a necessary and sufficient condition for a function $k(\mathbf{x}, \mathbf{x}^{\prime})$ to be a valid kernel is that the Gram matrix K, whose elements are given by $k(\mathbf{x}_{n}, \mathbf{x}_{m})$ , should be positive semidefinite for all possible choices of the set $\left\{\mathbf{x}_{n} \right\}$ . A matrix K is positive semidefinite if, and only if,

$$
\mathbf{a}^{\mathrm{T}} \mathbf{Ka} \geqslant 0
$$

for any choice of the vector a. Let $\mathbf{K}_{1}$ be the Gram matrix for $k_{1}(\mathbf{x}, \mathbf{x}^{\prime})$ and let $\mathbf{K}_{2}$ be the Gram matrix for $k_{2}(\mathbf{x}, \mathbf{x}^{\prime})$ . Then

$$
\mathbf{a}^{\mathrm{T}} \left(\mathbf{K}_{1} + \mathbf{K}_{2}\right) \mathbf{a} = \mathbf{a}^{\mathrm{T}} \mathbf{K}_{1} \mathbf{a} + \mathbf{a}^{\mathrm{T}} \mathbf{K}_{2} \mathbf{a} \geqslant 0
$$

where we have used the fact that ${\bf K}_{1}$ and $\mathbf{K}_{2}$ are positive semi-definite matrices, together with the fact that the sum of two non-negative numbers will itself be nonnegative. Thus, (6.17) defines a valid kernel.

To prove (6.18), we take the approach adopted in Solution 6.5. Since we know that $k_{1}(\mathbf{x}, \mathbf{x}^{\prime})$ and $k_{2}(\mathbf{x}, \mathbf{x}^{\prime})$ are valid kernels, we know that there exist mappings $\phi(\mathbf{x})$ and $\psi(\mathbf{x})$ such that

$$
k_{1}(\mathbf{x}, \mathbf{x}^{\prime}) = \boldsymbol{\phi}(\mathbf{x})^{\mathrm{T}} \boldsymbol{\phi}(\mathbf{x}^{\prime}) \quad \text{and} \quad k_{2}(\mathbf{x}, \mathbf{x}^{\prime}) = \boldsymbol{\psi}(\mathbf{x})^{\mathrm{T}} \boldsymbol{\psi}(\mathbf{x}^{\prime}).
$$

Hence

$$
\begin{array}{rcl} k(\mathbf{x}, \mathbf{x}^{\prime}) & = & k_{1}(\mathbf{x}, \mathbf{x}^{\prime}) k_{2}(\mathbf{x}, \mathbf{x}^{\prime}) \\ & = & \phi(\mathbf{x})^{\mathrm{T}} \phi(\mathbf{x}^{\prime}) \psi(\mathbf{x})^{\mathrm{T}} \psi(\mathbf{x}^{\prime}) \\ & = & \sum_{m = 1}^{M} \phi_{m}(\mathbf{x}) \phi_{m}(\mathbf{x}^{\prime}) \sum_{n = 1}^{N} \psi_{n}(\mathbf{x}) \psi_{n}(\mathbf{x}^{\prime}) \\ & = & \sum_{m = 1}^{M} \sum_{n = 1}^{N} \phi_{m}(\mathbf{x}) \phi_{m}(\mathbf{x}^{\prime}) \psi_{n}(\mathbf{x}) \psi_{n}(\mathbf{x}^{\prime}) \\ & = & \sum_{k = 1}^{K} \varphi_{k}(\mathbf{x}) \varphi_{k}(\mathbf{x}^{\prime}) \\ & = & \varphi(\mathbf{x})^{\mathrm{T}} \varphi(\mathbf{x}^{\prime}), \end{array}
$$

where $K = MN$ and

$$
\varphi_{k}(\mathbf{x}) = \phi_{((k - 1) \oslash N) + 1}(\mathbf{x}) \psi_{((k - 1) \odot N) + 1}(\mathbf{x}),
$$

where in turn $\oslash$ and  denote integer division and remainder, respectively.

6.12 NOTE: In the first printing of PRML, there is an error in the text relating to this exercise. Immediately following (6.27), it says: $| A |$ denotes the number of subsets in A; it should have said: A denotes the number of elements in A.

Since A may be equal to D (the subset relation was not defined to be strict), $\phi(D)$ must be defined. This will map to a vector of $2^{| D |}$ 1s, one for each possible subset of $D,$ including D itself as well as the empty set. For $A \subset D, \phi(A)$ will have 1s in all positions that correspond to subsets of A and 0s in all other positions. Therefore, $\phi({\bar{A}}_{1})^{\mathrm{T}} \phi(A_{2})$ will count the number of subsets shared by $A_{1}$ and $A_{2}.$ . However, this can just as well be obtained by counting the number of elements in the intersection of $A_{1}$ and $A_{2},$ and then raising 2 to this number, which is exactly what (6.27) does.

In order to evaluate the Fisher kernel for the Gaussian we first note that the covariance is assumed to be fixed, and hence the parameters comprise only the elements of the mean $\mu.$ . The first step is to evaluate the Fisher score defined by (6.32). From the definition (2.43) of the Gaussian we have

$$
\mathbf{g}(\boldsymbol{\mu}, \mathbf{x}) = \nabla_{\boldsymbol{\mu}} \ln \mathcal{N}(\mathbf{x} | \boldsymbol{\mu}, \mathbf{S}) = \mathbf{S}^{- 1}(\mathbf{x} - \boldsymbol{\mu}).
$$

Next we evaluate the Fisher information matrix using the definition (6.34), giving

$$
\mathbf{F} = \mathbb{E}_{\mathbf{x}} \left[\mathbf{g}(\boldsymbol{\mu}, \mathbf{x}) \mathbf{g}(\boldsymbol{\mu}, \mathbf{x})^{\mathrm{T}} \right] = \mathbf{S}^{- 1} \mathbb{E}_{\mathbf{x}} \left[(\mathbf{x} - \boldsymbol{\mu})(\mathbf{x} - \boldsymbol{\mu})^{\mathrm{T}} \right] \mathbf{S}^{- 1}.
$$

Here the expectation is with respect to the original Gaussian distribution, and so we can use the standard result

$$
\mathbb{E}_{\mathbf{x}} \left[(\mathbf{x} - \boldsymbol{\mu})(\mathbf{x} - \boldsymbol{\mu})^{\mathrm{T}} \right] = \mathbf{S}
$$

from which we obtain

$$
\mathbf{F} = \mathbf{S}^{- 1}.
$$

Thus the Fisher kernel is given by

$$
k(\mathbf{x}, \mathbf{x}^{\prime}) =(\mathbf{x} - \boldsymbol{\mu})^{\mathrm{T}} \mathbf{S}^{- 1}(\mathbf{x}^{\prime} - \boldsymbol{\mu}),
$$

which we note is just the squared Mahalanobis distance.

6.17 NOTE: In the first printing of PRML, there are typographical errors in the text relating to this exercise. In the sentence following immediately after (6.39), $f(\mathbf{x})$ should be replaced by $y(\mathbf x)$ . Also, on the l.h.s. of $(6.40), y(\mathbf x_{n})$ should be replaced by $y(\mathbf x)$ There were also errors in Appendix $\mathrm{D},$ which might cause confusion; please consult the errata on the PRML website.

Following the discussion in Appendix D we give a first-principles derivation of the solution. First consider a variation in the function $y(\mathbf x)$ of the form

$$
y(\mathbf{x}) \rightarrow y(\mathbf{x}) + \epsilon \eta(\mathbf{x}).
$$

Substituting into (6.39) we obtain

$$
E[y + \epsilon \eta] = \frac{1}{2} \sum_{n = 1}^{N} \int \left\{y(\mathbf{x}_{n} + \boldsymbol{\xi}) + \epsilon \eta(\mathbf{x}_{n} + \boldsymbol{\xi}) - t_{n} \right\}^{2} \nu(\boldsymbol{\xi}) d \boldsymbol{\xi}.
$$

Now we expand in powers of $\epsilon$ and set the coefficient of $\epsilon,$ which corresponds to the functional first derivative, equal to zero, giving

$$
\sum_{n = 1}^{N} \int \left\{y(\mathbf{x}_{n} + \pmb{\xi}) - t_{n} \right\} \eta(\mathbf{x}_{n} + \pmb{\xi}) \nu(\pmb{\xi}) d \pmb{\xi} = 0.\tag{141}
$$

This must hold for every choice of the variation function $\eta(\mathbf{x})$ . Thus we can choose

$$
\eta(\mathbf{x}) = \delta(\mathbf{x} - \mathbf{z})
$$

where $\delta(\cdot)$ is the Dirac delta function. This allows us to evaluate the integral over $\boldsymbol{\xi}$ giving

$$
\sum_{n = 1}^{N} \int \left\{y(\mathbf{x}_{n} + \boldsymbol{\xi}) - t_{n} \right\} \delta(\mathbf{x}_{n} + \boldsymbol{\xi} - \mathbf{z}) \nu(\boldsymbol{\xi}) d \boldsymbol{\xi} = \sum_{n = 1}^{N} \left\{y(\mathbf{z}) - t_{n} \right\} \nu(\mathbf{z} - \mathbf{x}_{n}).
$$

Substing this back into (141) and rearranging we then obtain the required result (6.40).

6.20 Given the joint distribution (6.64), we can identify $t_{N + 1}$ with $\mathbf{x}_{a}$ and t with $\mathbf{x}_{b}$ in (2.65). Note that this means that we are prepending rather than appending $t_{N + 1}$ to t and ${\bf C}_{N + 1}$ therefore gets redefined as

$$
\mathbf{C}_{N + 1} = \left(\begin{array}{cc} c & \mathbf{k}^{\mathrm{T}} \\ \mathbf{k} & \mathbf{C}_{N} \end{array} \right).
$$

It then follows that

$$
\begin{array}{ccc} \pmb{\mu}_{a} = 0 & \pmb{\mu}_{b} = \mathbf{0} & \mathbf{x}_{b} = \mathbf{t} \\ \pmb{\Sigma}_{aa} = c & \pmb{\Sigma}_{bb} = \mathbf{C}_{N} & \pmb{\Sigma}_{ab} = \pmb{\Sigma}_{ba}^{\mathrm{T}} = \mathbf{k}^{\mathrm{T}} \end{array}
$$

in (2.81) and (2.82), from which (6.66) and (6.67) follows directly.

6.21 Both the Gaussian process and the linear regression model give rise to Gaussian predictive distributions $p(t_{N + 1} | \mathbf{x}_{N + 1})$ so we simply need to show that these have the same mean and variance. To do this we make use of the expression (6.54) for the kernel function defined in terms of the basis functions. Using (6.62) the covariance matrix ${\bf C}_{N}$ then takes the form

$$
\mathbf{C}_{N} = \frac{1}{\alpha} \boldsymbol{\Phi} \boldsymbol{\Phi}^{\mathrm{T}} + \beta^{- 1} \mathbf{I}_{N}\tag{142}
$$

where Φ is the design matrix with elements $\Phi_{nk} = \phi_{k} \big(\mathbf{x}_{n} \big)$ , and ${\mathbf{I}}_{N}$ denotes the $N \times N$ unit matrix. Consider first the mean of the Gaussian process predictive distribution, which from (142), (6.54), (6.66) and the definitions in the text preceding (6.66) is given by

$$
m_{N + 1} = \alpha^{- 1} \phi(\mathbf{x}_{N + 1})^{\mathrm{T}} \boldsymbol{\Phi}^{\mathrm{T}} \left(\alpha^{- 1} \boldsymbol{\Phi} \boldsymbol{\Phi}^{\mathrm{T}} + \beta^{- 1} \mathbf{I}_{N}\right)^{- 1} \mathbf{t}.
$$

We now make use of the matrix identity (C.6) to give

$$
\boldsymbol{\Phi}^{T} \left(\alpha^{- 1} \boldsymbol{\Phi} \boldsymbol{\Phi}^{T} + \beta^{- 1} \mathbf{I}_{N}\right)^{- 1} = \alpha \beta \left(\beta \boldsymbol{\Phi}^{T} \boldsymbol{\Phi} + \alpha \mathbf{I}_{M}\right)^{- 1} \boldsymbol{\Phi}^{T} = \alpha \beta \mathbf{S}_{N} \boldsymbol{\Phi}^{T}.
$$

Thus the mean becomes

$$
m_{N + 1} = \beta \phi(\mathbf{x}_{N + 1})^{\mathrm{T}} \mathbf{S}_{N} \boldsymbol{\Phi}^{\mathrm{T}} \mathbf{t}
$$

which we recognize as the mean of the predictive distribution for the linear regression model given by (3.58) with $\mathbf{m}_{N}$ defined by (3.53) and $\mathbf{S}_{N}$ defined by (3.54).

For the variance we similarly substitute the expression (142) for the kernel function into the Gaussian process variance given by (6.67) and then use (6.54) and the definitions in the text preceding (6.66) to obtain

$$
\begin{array}{rcl} \sigma_{N + 1}^{2}(\mathbf{x}_{N + 1}) & = & \alpha^{- 1} \phi(\mathbf{x}_{N + 1})^{\mathrm{T}} \phi(\mathbf{x}_{N + 1}) + \beta^{- 1} \\ & & - \alpha^{- 2} \phi(\mathbf{x}_{N + 1})^{\mathrm{T}} \boldsymbol{\Phi}^{\mathrm{T}} \left(\alpha^{- 1} \boldsymbol{\Phi} \boldsymbol{\Phi}^{\mathrm{T}} + \beta^{- 1} \mathbf{I}_{N}\right)^{- 1} \boldsymbol{\Phi} \phi(\mathbf{x}_{N + 1}) \\ & = & \beta^{- 1} + \phi(\mathbf{x}_{N + 1})^{\mathrm{T}} \left(\alpha^{- 1} \mathbf{I}_{M} \right.\\ & & - \alpha^{- 2} \boldsymbol{\Phi}^{\mathrm{T}} \left(\alpha^{- 1} \boldsymbol{\Phi} \boldsymbol{\Phi}^{\mathrm{T}} + \beta^{- 1} \mathbf{I}_{N}\right)^{- 1} \boldsymbol{\Phi}) \phi(\mathbf{x}_{N + 1}).\end{array} \tag{14}\tag{143}
$$

We now make use of the matrix identity (C.7) to give

$$
\begin{array}{c} \alpha^{- 1} \mathbf{I}_{M} - \alpha^{- 1} \mathbf{I}_{M} \boldsymbol{\Phi}^{\mathrm{T}} \left(\boldsymbol{\Phi}(\alpha^{- 1} \mathbf{I}_{M}) \boldsymbol{\Phi}^{\mathrm{T}} + \beta^{- 1} \mathbf{I}_{N}\right)^{- 1} \boldsymbol{\Phi} \alpha^{- 1} \mathbf{I}_{M} \\ = \left(\alpha \mathbf{I} + \beta \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi}\right)^{- 1} = \mathbf{S}_{N}, \end{array}
$$

where we have also used (3.54). Substituting this in (143), we obtain

$$
\sigma_{N}^{2}(\mathbf{x}_{N + 1}) = \frac{1}{\beta} + \phi(\mathbf{x}_{N + 1})^{\mathrm{T}} \mathbf{S}_{N} \phi(\mathbf{x}_{N + 1})
$$

as derived for the linear regression model in Section 3.3.2.

If we assume that the target variables, $t_{1}, \ldots, t_{D}$ , are independent given the input vector, x, this extension is straightforward.

Using analogous notation to the univariate case,

$$
p(\mathbf{t}_{N + 1} | \mathbf{T}) = \mathcal{N}(\mathbf{t}_{N + 1} | \mathbf{m}(\mathbf{x}_{N + 1}), \sigma(\mathbf{x}_{N + 1}) \mathbf{I}),
$$

where T is a $N \times D$ matrix with the vectors $\mathbf{t}_{1}^{\mathrm{T}}, \ldots, \mathbf{t}_{N}^{\mathrm{T}}$ as its rows,

$$
\mathbf{m}(\mathbf{x}_{N + 1})^{\mathrm{T}} = \mathbf{k}^{\mathrm{T}} \mathbf{C}_{N} \mathbf{T}
$$

and $\sigma({\bf x}_{N + 1})$ is given by (6.67). Note that $\mathbf{C}_{N}$ , which only depend on the input vectors, is the same in the uni- and multivariate models.

6.25 Substituting the gradient and the Hessian into the Newton-Raphson formula we obtain

$$
\begin{array}{rcl} \mathbf{a}_{N}^{\mathrm{new}} & = & \mathbf{a}_{N} +(\mathbf{C}_{N}^{- 1} + \mathbf{W}_{N})^{- 1}[\mathbf{t}_{N} - \pmb{\sigma}_{N} - \mathbf{C}_{N}^{- 1} \mathbf{a}_{N}] \\ & = &(\mathbf{C}_{N}^{- 1} + \mathbf{W}_{N})^{- 1}[\mathbf{t}_{N} - \pmb{\sigma}_{N} + \mathbf{W}_{N} \mathbf{a}_{N}] \\ & = & \mathbf{C}_{N}(\mathbf{I} + \mathbf{W}_{N} \mathbf{C}_{N})^{- 1}[\mathbf{t}_{N} - \pmb{\sigma}_{N} + \mathbf{W}_{N} \mathbf{a}_{N}] \end{array}
$$

## Chapter 7 Sparse Kernel Machines

## 7.1 From Bayes’ theorem we have

$$
p(t | \mathbf{x}) \propto p(\mathbf{x} | t) p(t)
$$

where, from (2.249),

$$
p(\mathbf{x} | t) = \frac{1}{N_{t}} \sum_{n = 1}^{N} \frac{1}{Z_{k}} k(\mathbf{x}, \mathbf{x}_{n}) \delta(t, t_{n}).
$$

Here $N_{t}$ is the number of input vectors with label $t \left(+ 1 \thinspace \mathrm{or} - 1 \right)$ and $N = N_{+ 1} + N_{- 1}$ $\delta(t, t_{n})$ equals 1 if $t = t_{n}$ and 0 otherwise. $Z_{k}$ is the normalisation constant for the kernel. The minimum misclassification-rate is achieved if, for each new input vector, $\tilde{\mathbf{x}},$ we chose <sup>˜</sup>t to maximise $p(\tilde{t} | \tilde{\mathbf{x}})$ . With equal class priors, this is equivalent to maximizing $p(\tilde{\mathbf{x}} | \tilde{t})$ and thus

$$
\tilde{t} = \left\{\begin{array}{ll} + 1 & \text{iff} \frac{1}{N_{+ 1}} \sum_{i: t_{i} = + 1} k(\tilde{\mathbf{x}}, \mathbf{x}_{i}) \geqslant \frac{1}{N_{- 1}} \sum_{j: t_{j} = - 1} k(\tilde{\mathbf{x}}, \mathbf{x}_{j}) \\ - 1 & \text{otherwise.} \end{array} \right.
$$

Here we have dropped the factor $1 / Z_{k}$ since it only acts as a common scaling factor. Using the encoding scheme for the label, this classification rule can be written in the more compact form

$$
\tilde{t} = \mathrm{sign} \left(\sum_{n = 1}^{N} \frac{t_{n}}{N_{t_{n}}} k(\tilde{\mathbf{x}}, \mathbf{x}_{n})\right).
$$

Now we take $k(\mathbf{x}, \mathbf{x}_{n}) = \mathbf{x}^{\mathrm{{T}}} \mathbf{x}_{n}$ , which results in the kernel density

$$
p(\mathbf{x} | t = + 1) = \frac{1}{N_{+ 1}} \sum_{n: t_{n} = + 1} \mathbf{x}^{\mathrm{T}} \mathbf{x}_{n} = \mathbf{x}^{\mathrm{T}} \bar{\mathbf{x}}^{+}.
$$

Here, the sum in the middle experssion runs over all vectors ${\bf x}_{n}$ for which $t_{n} = + 1$ and $\bar{\mathbf{x}}^{+}$ denotes the mean of these vectors, with the corresponding definition for the negative class. Note that this density is improper, since it cannot be normalized. However, we can still compare likelihoods under this density, resulting in the classification rule

$$
\tilde{t} = \left\{\begin{array}{ll} + 1 & \text{if} \tilde{\mathbf{x}}^{\mathrm{T}} \bar{\mathbf{x}}^{+} \geqslant \tilde{\mathbf{x}}^{\mathrm{T}} \bar{\mathbf{x}}^{-}, \\ - 1 & \text{otherwise}.\end{array} \right.
$$

The same argument would of course also apply in the feature space $\phi(\mathbf{x})$

7.4 From Figure 4.1 and (7.4), we see that the value of the margin

$$
\rho = \frac{1}{\| \mathbf{w} \|} \quad \text{and so} \quad \frac{1}{\rho^{2}} = \| \mathbf{w} \|^{2}.
$$

From (7.16) we see that, for the maximum margin solution, the second term of (7.7) vanishes and so we have 1

$$
L(\mathbf{w}, b, \mathbf{a}) = \frac{1}{2} \| \mathbf{w} \|^{2}.
$$

Using this together with (7.8), the dual (7.10) can be written as

$$
\frac{1}{2} \| \mathbf{w} \|^{2} = \sum_{n}^{N} a_{n} - \frac{1}{2} \| \mathbf{w} \|^{2},
$$

from which the desired result follows.

7.8 This follows from (7.67) and (7.68), which in turn follow from the KKT conditions, (E.9)–(E.11), for $\mu_{n}, \xi_{n},{\widehat{\mu}}_{n}$ and $\dot{\xi_{n}}$ , and the results obtained in (7.59) and (7.60). For example, for $\mu_{n}$ and $\xi_{n}$ , the KKT conditions are

$$
\begin{array}{rcl} \xi_{n} & \geqslant & 0 \\ \mu_{n} & \geqslant & 0 \\ \mu_{n} \xi_{n} & = & 0 \end{array}\tag{144}
$$

and from (7.59) we have that

$$
\mu_{n} = C - a_{n}.\tag{145}
$$

Combining (144) and (145), we get (7.67); similar reasoning for $\widehat{\mu}_{n}$ and $\widehat{\xi}_{n}$ lead to (7.68).

7.10 We first note that this result is given immediately from (2.113)–(2.115), but the task set in the exercise was to practice the technique of completing the square. In this solution and that of Exercise 7.12, we broadly follow the presentation in Section 3.5.1. Using (7.79) and (7.80), we can write (7.84) in a form similar to (3.78)

$$
p(\mathbf{t} | \mathbf{X}, \boldsymbol{\alpha}, \beta) = \left(\frac{\beta}{2 \pi}\right)^{N / 2} \frac{1}{(2 \pi)^{N / 2}} \prod_{i = 1}^{M} \alpha_{i} \int \exp \left\{- E(\mathbf{w}) \right\} d \mathbf{w}\tag{146}
$$

where

$$
E(\mathbf{w}) = \frac{\beta}{2} \| \mathbf{t} - \boldsymbol{\Phi} \mathbf{w} \|^{2} + \frac{1}{2} \mathbf{w}^{\mathrm{T}} \mathbf{A} \mathbf{w}
$$

and $\mathbf{A} = \operatorname{diag}(\alpha)$

Completing the square over w, we get

$$
E(\mathbf{w}) = \frac{1}{2}(\mathbf{w} - \mathbf{m})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{w} - \mathbf{m}) + E(\mathbf{t})\tag{147}
$$

where m and Σ are given by (7.82) and (7.83), respectively, and

$$
E(\mathbf{t}) = \frac{1}{2} \left(\beta \mathbf{t}^{\mathrm{T}} \mathbf{t} - \mathbf{m}^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1} \mathbf{m}\right).\tag{148}
$$

Using (147), we can evaluate the integral in (146) to obtain

$$
\int \exp \left\{- E(\mathbf{w}) \right\} d \mathbf{w} = \exp \left\{- E(\mathbf{t}) \right\}(2 \pi)^{M / 2} | \boldsymbol{\Sigma} |^{1 / 2}.\tag{149}
$$

Considering this as a function of t we see from (7.83), that we only need to deal with the factor exp $\{- E(\mathbf{t})\}$ . Using (7.82), (7.83), (C.7) and (7.86), we can re-write (148) as follows

$$
\begin{array}{lll} E(\mathbf{t}) & = & \frac{1}{2} \left(\beta \mathbf{t}^{\mathrm{T}} \mathbf{t} - \mathbf{m}^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1} \mathbf{m}\right) \\ & = & \frac{1}{2} \left(\beta \mathbf{t}^{\mathrm{T}} \mathbf{t} - \beta \mathbf{t}^{\mathrm{T}} \boldsymbol{\Phi} \boldsymbol{\Sigma} \boldsymbol{\Sigma}^{- 1} \boldsymbol{\Sigma} \boldsymbol{\Phi}^{\mathrm{T}} \mathbf{t} \boldsymbol{\beta}\right) \\ & = & \frac{1}{2} \mathbf{t}^{\mathrm{T}} \left(\beta \mathbf{I} - \beta \boldsymbol{\Phi} \boldsymbol{\Sigma} \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\beta}\right) \mathbf{t} \\ & = & \frac{1}{2} \mathbf{t}^{\mathrm{T}} \left(\beta \mathbf{I} - \beta \boldsymbol{\Phi}(\mathbf{A} + \beta \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi})^{- 1} \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\beta}\right) \mathbf{t} \\ & = & \frac{1}{2} \mathbf{t}^{\mathrm{T}} \left(\beta^{- 1} \mathbf{I} + \boldsymbol{\Phi} \mathbf{A}^{- 1} \boldsymbol{\Phi}^{\mathrm{T}}\right)^{- 1} \mathbf{t} \\ & = & \frac{1}{2} \mathbf{t}^{\mathrm{T}} \mathbf{C}^{- 1} \mathbf{t}.\end{array}
$$

This gives us the last term on the r.h.s. of (7.85); the two preceding terms are given implicitly, as they form the normalization constant for the posterior Gaussian distribution $p(\mathbf{t} | \mathbf{X}, \alpha, \beta)$

7.12 Using the results (146)–(149) from Solution 7.10, we can write (7.85) in the form of (3.86):

$$
\ln p(\mathbf{t} | \mathbf{X}, \boldsymbol{\alpha}, \beta) = \frac{N}{2} \ln \beta + \frac{1}{2} \sum_{i}^{N} \ln \alpha_{i} - E(\mathbf{t}) - \frac{1}{2} \ln | \boldsymbol{\Sigma} | - \frac{N}{2} \ln(2 \pi).\tag{150}
$$

By making use of (148) and (7.83) together with (C.22), we can take the derivatives of this w.r.t $\alpha_{i}.$ , yielding

$$
\frac{\partial}{\partial \alpha_{i}} \ln p(\mathbf{t} | \mathbf{X}, \pmb{\alpha}, \beta) = \frac{1}{2 \alpha_{i}} - \frac{1}{2} \Sigma_{ii} - \frac{1}{2} m_{i}^{2}.\tag{151}
$$

Setting this to zero and re-arranging, we obtain

$$
\alpha_{i} = \frac{1 - \alpha_{i} \Sigma_{ii}}{m_{i}^{2}} = \frac{\gamma_{i}}{m_{i}^{2}},
$$

where we have used (7.89). Similarly, for $\beta$ we see that

$$
\frac{\partial}{\partial \beta} \ln p(\mathbf{t} | \mathbf{X}, \boldsymbol{\alpha}, \beta) = \frac{1}{2} \left(\frac{N}{\beta} - \| \mathbf{t} - \boldsymbol{\Phi} \mathbf{m} \|^{2} - \operatorname{Tr} \left[\boldsymbol{\Sigma} \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \right]\right).\tag{152}
$$

Using (7.83), we can rewrite the argument of the trace operator as

$$
\begin{array}{rcl} \boldsymbol{\Sigma} \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} & = & \boldsymbol{\Sigma} \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} + \beta^{- 1} \boldsymbol{\Sigma} \mathbf{A} - \beta^{- 1} \boldsymbol{\Sigma} \mathbf{A} \\ & = & \boldsymbol{\Sigma}(\boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \beta + \mathbf{A}) \beta^{- 1} - \beta^{- 1} \boldsymbol{\Sigma} \mathbf{A} \\ & = &(\mathbf{A} + \beta \boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi})^{- 1}(\boldsymbol{\Phi}^{\mathrm{T}} \boldsymbol{\Phi} \beta + \mathbf{A}) \beta^{- 1} - \beta^{- 1} \boldsymbol{\Sigma} \mathbf{A} \\ & = &(\mathbf{I} - \mathbf{A} \boldsymbol{\Sigma}) \beta^{- 1}.\end{array}\tag{153}
$$

Here the first factor on the r.h.s. of the last line equals (7.89) written in matrix form. We can use this to set (152) equal to zero and then re-arrange to obtain (7.88).

7.15 Using (7.94), (7.95) and (7.97)–(7.99), we can rewrite (7.85) as follows

$$
\begin{array}{rcl} \ln p(\mathbf{t} | \mathbf{X}, \boldsymbol{\alpha}, \beta) & = & - \frac{1}{2} \bigg \{N \ln(2 \pi) + \ln | \mathbf{C}_{- i} | | 1 + \alpha_{i}^{- 1} \boldsymbol{\varphi}_{i}^{\mathrm{T}} \mathbf{C}_{- i}^{- 1} \boldsymbol{\varphi}_{i} | \\ & & + \mathbf{t}^{\mathrm{T}} \left(\mathbf{C}_{- i}^{- 1} - \frac{\mathbf{C}_{- i}^{- 1} \boldsymbol{\varphi}_{i} \boldsymbol{\varphi}_{i}^{\mathrm{T}} \mathbf{C}_{- i}^{- 1}}{\alpha_{i} + \boldsymbol{\varphi}_{i}^{\mathrm{T}} \mathbf{C}_{- i}^{- 1} \boldsymbol{\varphi}_{i}}\right) \mathbf{t} \bigg\} \\ & = & - \frac{1}{2} \left\{N \ln(2 \pi) + \ln | \mathbf{C}_{- i} | + \mathbf{t}^{\mathrm{T}} \mathbf{C}_{- i}^{- 1} \mathbf{t} \right\} \\ & & + \frac{1}{2} \left[- \ln | 1 + \alpha_{i}^{- 1} \boldsymbol{\varphi}_{i}^{\mathrm{T}} \mathbf{C}_{- i}^{- 1} \boldsymbol{\varphi}_{i} | + \mathbf{t}^{\mathrm{T}} \frac{\mathbf{C}_{- i}^{- 1} \boldsymbol{\varphi}_{i} \boldsymbol{\varphi}_{i}^{\mathrm{T}} \mathbf{C}_{- i}^{- 1}}{\alpha_{i} + \boldsymbol{\varphi}_{i}^{\mathrm{T}} \mathbf{C}_{- i}^{- 1} \boldboldsymbol{\varphi}_{i}} \mathbf{t} \right] \\ & = & L(\alpha_{- i}) + \frac{1}{2} \left[\ln \alpha_{i} - \ln(\alpha_{i} + s_{i}) + \frac{q_{i}^{2}}{\alpha_{i} + s_{i}} \right] \\ & = & L(\alpha_{- i}) + \lambda(\alpha_{i}) \end{array}
$$

7.18 As the RVM can be regarded as a regularized logistic regression model, we can follow the sequence of steps used to derive (4.91) in Exercise 4.13 to derive the first term of the r.h.s. of (7.110), whereas the second term follows from standard matrix derivatives (see Appendix C). Note however, that in Exercise 4.13 we are dealing with the negative log-likelhood.

To derive (7.111), we make use of (123) and (124) from Exercise 4.13. If we write the first term of the r.h.s. of (7.110) in component form we get

$$
\begin{array}{rcl} \frac{\partial}{\partial w_{j}} \sum_{n = 1}^{N}(t_{n} - y_{n}) \phi_{ni} & = & - \sum_{n = 1}^{N} \frac{\partial y_{n}}{\partial a_{n}} \frac{\partial a_{n}}{\partial w_{j}} \phi_{ni} \\ & = & - \sum_{n = 1}^{N} y_{n}(1 - y_{n}) \phi_{nj} \phi_{ni}, \end{array}
$$

which, written in matrix form, equals the first term inside the parenthesis on the r.h.s. of (7.111). The second term again follows from standard matrix derivatives.

CHECK! 8.1 We want to show that, for (8.5),

$$
\sum_{x_{1}} \dots \sum_{x_{K}} p(\mathbf{x}) = \sum_{x_{1}} \dots \sum_{x_{K}} \prod_{k = 1}^{K} p(x_{k} | \mathrm{pa}_{k}) = 1.
$$

We assume that the nodes in the graph has been numbered such that $x_{1}$ is the root node and no arrows lead from a higher numbered node to a lower numbered node. We can then marginalize over the nodes in reverse order, starting with $x_{K}$

$$
\begin{array}{rcl} \sum_{x_{1}} \ldots \sum_{x_{K}} p(\mathbf{x}) & = & \sum_{x_{1}} \ldots \sum_{x_{K}} p(x_{K} | \mathrm{pa}_{K}) \prod_{k = 1}^{K - 1} p(x_{k} | \mathrm{pa}_{k}) \\ & = & \sum_{x_{1}} \ldots \sum_{x_{K - 1}} \prod_{k = 1}^{K - 1} p(x_{k} | \mathrm{pa}_{k}), \end{array}
$$

since each of the conditional distributions is assumed to be correctly normalized and none of the other variables depend on $x_{K}$ . Repeating this process $K - 2$ times we are left with

$$
\sum_{x_{1}} p(x_{1} | \emptyset) = 1.
$$

8.2 Consider a directed graph in which the nodes of the graph are numbered such that are no edges going from a node to a lower numbered node. If there exists a directed cycle in the graph then the subset of nodes belonging to this directed cycle must also satisfy the same numbering property. If we traverse the cycle in the direction of the edges the node numbers cannot be monotonically increasing since we must end up back at the starting node. It follows that the cycle cannot be a directed cycle.

8.5 The solution is given in Figure 3.

Figure 3 The graphical representation of the relevance vector machine (RVM); Solution 8.5.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/28c59745a806314efb078d523447f913a62218891ddb914c56def79d56feda14.jpg)

8.8 $a \perp b, c \mid d$ can be written as

$$
p(a, b, c | d) = p(a | d) p(b, c | d).
$$

Summing (or integrating) both sides with respect to c, we obtain

$$
p(a, b | d) = p(a | d) p(b | d) \qquad \text{or} \qquad a \perp \perp b \mid d,
$$

as desired.

8.9 Consider Figure 8.26. In order to apply the d-separation criterion we need to consider all possible paths from the central node $\mathbf{x}_{i}$ to all possible nodes external to the Markov blanket. There are three possible categories of such paths. First, consider paths via the parent nodes. Since the link from the parent node to the node $\mathbf{x}_{i}$ has its tail connected to the parent node, it follows that for any such path the parent node must be either tail-to-tail or head-to-tail with respect to the path. Thus the observation of the parent node will block any such path. Second consider paths via one of the child nodes of node $\mathbf{x}_{i}$ which do not pass directly through any of the co-parents. By definition such paths must pass to a child of the child node and hence will be head-to-tail with respect to the child node and so will be blocked. The third and final category of path passes via a child node of $\mathbf{x}_{i}$ and then a co-parent node. This path will be head-to-head with respect to the observed child node and hence will not be blocked by the observed child node. However, this path will either tail-totail or head-to-tail with respect to the co-parent node and hence observation of the co-parent will block this path. We therefore see that all possible paths leaving node $\mathbf{x}_{i}$ will be blocked and so the distribution of $\mathbf{x}_{i},$ conditioned on the variables in the Markov blanket, will be independent of all of the remaining variables in the graph.

8.12 In an undirected graph of M nodes there could potentially be a link between each pair of nodes. The number of distinct graphs is then 2 raised to the power of the number of potential links. To evaluate the number of distinct links, note that there are M nodes each of which could have a link to any of the other $M - 1$ nodes, making a total of $M(M - 1)$ links. However, each link is counted twice since, in an undirected graph, a link from node a to node b is equivalent to a link from node b to node a. The number of distinct potential links is therefore $M(M - 1) / 2$ and so the number of distinct graphs is $2^{M(M - 1) / 2}$ . The set of 8 possible graphs over three nodes is shown in Figure 4.

![Figure 4](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/f83eb9d21c9dc6ca0aaf2a9ebb054f87d29a0c725420a157a713442465d7caec.jpg)  
Figure 4 The set of 8 distinct undirected graphs which can be constructed over $M = 3$ nodes.

8.15 The marginal distribution $p(x_{n - 1}, x_{n})$ is obtained by marginalizing the joint distribution $p(\mathbf{x})$ over all variables except $x_{n - 1}$ and $x_{n}$

$$
p(x_{n - 1}, x_{n}) = \sum_{x_{1}} \dots \sum_{x_{n - 2}} \sum_{x_{n + 1}} \dots \sum_{x_{N}} p(\mathbf{x}).
$$

This is analogous to the marginal distribution for a single variable, given by (8.50). Following the same steps as in the single variable case described in Section 8.4.1, we arrive at a modified form of (8.52),

$$
\begin{array}{l} p(x_{n}) = \frac{1}{Z} \\ \underbrace{\left[\sum_{x_{n - 2}} \psi_{n - 2, n - 1}(x_{n - 2}, x_{n - 1}) \cdots \left[\sum_{x_{1}} \psi_{1, 2}(x_{1}, x_{2}) \right] \cdots \right]}_{\mu_{\alpha}(x_{n - 1})} \psi_{n - 1, n}(x_{n - 1}, x_{n}) \\ \underbrace{\left[\sum_{x_{n + 1}} \psi_{n, n + 1}(x_{n}, x_{n + 1}) \cdots \left[\sum_{x_{N}} \psi_{N - 1, N}(x_{N - 1}, x_{N}) \right] \cdots \right]}_{\mu_{\beta}(x_{n})}, \end{array}
$$

from which (8.58) immediately follows.

8.18 The joint probability distribution over the variables in a general directed graphical model is given by (8.5). In the particular case of a tree, each node has a single parent, so $\mathrm{pa}_{k}$ will be a singleton for each node, k, except for the root node for which it will empty. Thus, the joint probability distribution for a tree will be similar to the joint probability distribution over a chain, (8.44), with the difference that the same variable may occur to the right of the conditioning bar in several conditional probability distributions, rather than just one (in other words, although each node can only have one parent, it can have several children). Hence, the argument in Section 8.3.4, by which (8.44) is re-written as (8.45), can also be applied to probability distributions over trees. The result is a Markov random field model where each potential function corresponds to one conditional probability distribution in the directed tree. The prior for the root node, $\mathrm{e.g.} p(x_{1})$ in (8.44), can again be incorporated in one of the potential functions associated with the root node or, alternatively, can be incorporated as a single node potential.

This transformation can also be applied in the other direction. Given an undirected tree, we pick a node arbitrarily as the root. Since the graph is a tree, there is a unique path between every pair of nodes, so, starting at root and working outwards, we can direct all the edges in the graph to point from the root to the leaf nodes. An example is given in Figure 5. Since every edge in the tree correspond to a twonode potential function, by normalizing this appropriately, we obtain a conditional probability distribution for the child given the parent.

The graph on the left is an undirected tree. If we pick $x_{4}$ to be the root node and direct all the edges in the graph to point from the root to the leaf nodes $(x_{1}, x_{2}$ and $x_{5})$ , we obtain the directed tree shown on the right.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/d8ec83acb6722e2cc8bdf13acb07aee0177e2ad41c449a39abaea2919b341ec5.jpg)

Since there is a unique path beween every pair of nodes in an undirected tree, once we have chosen the root node, the remainder of the resulting directed tree is given. Hence, from an undirected tree with N nodes, we can construct N different directed trees, one for each choice of root node.

8.20 We do the induction over the size of the tree and we grow the tree one node at a time while, at the same time, we update the message passing schedule. Note that we can build up any tree this way.

For a single root node, the required condition holds trivially true, since there are no messages to be passed. We then assume that it holds for a tree with N nodes. In the induction step we add a new leaf node to such a tree. This new leaf node need not to wait for any messages from other nodes in order to send its outgoing message and so it can be scheduled to send it first, before any other messages are sent. Its parent node will receive this message, whereafter the message propagation will follow the schedule for the original tree with N nodes, for which the condition is assumed to hold.

For the propagation of the outward messages from the root back to the leaves, we first follow the propagation schedule for the original tree with N nodes, for which the condition is assumed to hold. When this has completed, the parent of the new leaf node will be ready to send its outgoing message to the new leaf node, thereby completing the propagation for the tree with $N + 1$ nodes.

8.21 To compute $p(\mathbf{x}_{s})$ , we marginalize $p(\mathbf{x})$ over all other variables, analogously to (8.61),

$$
p(\mathbf{x}_{s}) = \sum_{\mathbf{x} \backslash \mathbf{x}_{s}} p(\mathbf{x}).
$$

Using (8.59) and the defintion of $F_{s}(x, X_{s})$ that followed (8.62), we can write this as

$$
\begin{array}{rcl} p(\mathbf{x}_{s}) & = & \sum_{\mathbf{x} \setminus \mathbf{x}_{s}} f_{s}(\mathbf{x}_{s}) \prod_{i \in \mathrm{ne}(f_{s})} \prod_{j \in \mathrm{ne}(x_{i}) \setminus f_{s}} F_{j}(x_{i}, X_{ij}) \\ & = & f_{s}(\mathbf{x}_{s}) \prod_{i \in \mathrm{ne}(f_{s})} \sum_{\mathbf{x} \setminus \mathbf{x}_{s}} \prod_{j \in \mathrm{ne}(x_{i}) \setminus f_{s}} F_{j}(x_{i}, X_{ij}) \\ & = & f_{s}(\mathbf{x}_{s}) \prod_{i \in \mathrm{ne}(f_{s})} \mu_{x_{i} \to f_{s}}(x_{i}), \end{array}
$$

where in the last step, we used (8.67) and (8.68). Note that the marginalization over the different sub-trees rooted in the neighbours of $f_{s}$ would only run over variables in the respective sub-trees.

8.23 This follows from the fact that the message that a node, $x_{i},$ will send to a factor $f_{s}$ consists of the product of all other messages received by $x_{i}$ . From (8.63) and (8.69), we have

$$
\begin{array}{rcl} p(x_{i}) & = & \prod_{s \in \mathrm{ne}(x_{i})} \mu_{f_{s} \to x_{i}}(x_{i}) \\ & = & \mu_{f_{s} \to x_{i}}(x_{i}) \prod_{t \in \mathrm{ne}(x_{i}) \setminus f_{s}} \mu_{f_{t} \to x_{i}}(x_{i}) \\ & = & \mu_{f_{s} \to x_{i}}(x_{i}) \mu_{x_{i} \to f_{s}}(x_{i}).\end{array}
$$

8.28 If a graph has one or more cycles, there exists at least one set of nodes and edges such that, starting from an arbitrary node in the set, we can visit all the nodes in the set and return to the starting node, without traversing any edge more than once.

Consider one particular such cycle. When one of the nodes $n_{1}$ in the cycle sends a message to one of its neighbours $n_{2}$ in the cycle, this causes a pending messages on the edge to the next node $n_{3}$ in that cycle. Thus sending a pending message along an edge in the cycle always generates a pending message on the next edge in that cycle. Since this is true for every node in the cycle it follows that there will always exist at least one pending message in the graph.

8.29 We show this by induction over the number of nodes in the tree-structured factor graph.

First consider a graph with two nodes, in which case only two messages will be sent across the single edge, one in each direction. None of these messages will induce any pending messages and so the algorithm terminates.

We then assume that for a factor graph with N nodes, there will be no pending messages after a finite number of messages have been sent. Given such a graph, we can construct a new graph with N + 1 nodes by adding a new node. This new node will have a single edge to the original graph (since the graph must remain a tree) and so if this new node receives a message on this edge, it will induce no pending messages. A message sent from the new node will trigger propagation of messages in the original graph with N nodes, but by assumption, after a finite number of messages have been sent, there will be no pending messages and the algorithm will terminate.

## Chapter 9 Mixture Models

9.1 Since both the E- and the M-step minimise the distortion measure (9.1), the algorithm will never change from a particular assignment of data points to prototypes, unless the new assignment has a lower value for (9.1).

Since there is a finite number of possible assignments, each with a corresponding unique minimum of (9.1) w.r.t. the prototypes, $\{\mu_{k}\}$ , the K-means algorithm will converge after a finite number of steps, when no re-assignment of data points to prototypes will result in a decrease of (9.1). When no-reassignment takes place, there also will not be any change in $\{\mu_{k}\}$

9.3 From (9.10) and (9.11), we have

$$
p(\mathbf{x}) = \sum_{\mathbf{z}} p(\mathbf{x} | \mathbf{z}) p(\mathbf{z}) = \sum_{\mathbf{z}} \prod_{k = 1}^{K} \left(\pi_{k} \mathcal{N}(\mathbf{x} | \boldsymbol{\mu}_{k}, \boldsymbol{\Sigma}_{k})\right)^{z_{k}}.
$$

Exploiting the 1-of-K representation for $\mathbf{z},$ we can re-write the r.h.s. as

$$
\sum_{j = 1}^{K} \prod_{k = 1}^{K} \left(\pi_{k} \mathcal{N}(\mathbf{x} | \boldsymbol{\mu}_{k}, \boldsymbol{\Sigma}_{k})\right)^{I_{kj}} = \sum_{j = 1}^{K} \pi_{j} \mathcal{N}(\mathbf{x} | \boldsymbol{\mu}_{j}, \boldsymbol{\Sigma}_{j})
$$

where $I_{kj} = 1{\mathrm{if}} k = j$ and 0 otherwise.

9.7 Consider first the optimization with respect to the parameters $\{\boldsymbol{\mu}_{k}, \boldsymbol{\Sigma}_{k}\}$ . For this we can ignore the terms in (9.36) which depend on ln $\pi_{k}$ . We note that, for each data point n, the quantities $z_{nk}$ are all zero except for a particular element which equals one. We can therefore partition the data set into $K$ groups, denoted $\mathbf{X}_{k}$ , such that all the data points ${\bf x}_{n}$ assigned to component k are in group ${\bf X}_{k}$ . The complete-data log likelihood function can then be written

$$
\ln p \left(\mathbf{X}, \mathbf{Z} \mid \boldsymbol{\mu}, \boldsymbol{\Sigma}, \boldsymbol{\pi}\right) = \sum_{k = 1}^{K} \left\{\sum_{n \in \mathbf{X}_{k}} \ln \mathcal{N}(\mathbf{x}_{n} | \boldsymbol{\mu}_{k}, \boldsymbol{\Sigma}_{k}) \right\}.
$$

This represents the sum of $K$ independent terms, one for each component in the mixture. When we maximize this term with respect to $\mu_{k}$ and $\Sigma_{k}$ we will simply be fitting the $k^{\mathrm{th}}$ component to the data set $\mathbf{X}_{k}$ , for which we will obtain the usual maximum likelihood results for a single Gaussian, as discussed in Chapter 2.

For the mixing coefficients we need only consider the terms in ln $\pi_{k}$ in (9.36), but we must introduce a Lagrange multiplier to handle the constraint $\textstyle \sum_{k} \pi_{k} = 1$ . Thus we maximize

$$
\sum_{n = 1}^{N} \sum_{k = 1}^{K} z_{nk} \ln \pi_{k} + \lambda \left(\sum_{k = 1}^{K} \pi_{k} - 1\right)
$$

which gives

$$
0 = \sum_{n = 1}^{N} \frac{z_{nk}}{\pi_{k}} + \lambda.
$$

Multiplying through by $\pi_{k}$ and summing over k we obtain $\lambda = - N$ , from which we have

$$
\pi_{k} = \frac{1}{N} \sum_{n = 1}^{N} z_{nk} = \frac{N_{k}}{N}
$$

where $N_{k}$ is the number of data points in group $\mathbf{X}_{k}$

9.8 Using (2.43), we can write the r.h.s. of (9.40) as

$$
- \frac{1}{2} \sum_{n = 1}^{N} \sum_{j = 1}^{K} \gamma(z_{nj})(\mathbf{x}_{n} - \boldsymbol{\mu}_{j})^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1}(\mathbf{x}_{n} - \boldsymbol{\mu}_{j}) + \text{const.},
$$

where ‘const.’ summarizes terms independent of $\mu_{j}$ (for all j). Taking the derivative of this w.r.t. $\mu_{k}$ , we get

$$
- \sum_{n = 1}^{N} \gamma(z_{nk}) \left(\boldsymbol{\Sigma}^{- 1} \boldsymbol{\mu}_{k} - \boldsymbol{\Sigma}^{- 1} \mathbf{x}_{n}\right),
$$

and setting this to zero and rearranging, we obtain (9.17).

9.12 Since the expectation of a sum is the sum of the expectations we have

$$
\operatorname{E}[\mathbf{x}] = \sum_{k = 1}^{K} \pi_{k} \operatorname{E}_{k}[\mathbf{x}] = \sum_{k = 1}^{K} \pi_{k} \boldsymbol{\mu}_{k}
$$

where $\operatorname{E}_{k}[\mathbf{x}]$ denotes the expectation of x under the distribution $p(\mathbf{x} | k)$ . To find the covariance we use the general relation

$$
\operatorname{cov}[\mathbf{x}] = \operatorname{E}[\mathbf{xx}^{\mathrm{T}}] - \operatorname{E}[\mathbf{x}] \operatorname{E}[\mathbf{x}]^{\mathrm{T}}
$$

to give

$$
\begin{array}{rcl} \operatorname{cov}[\mathbf{x}] & = & \operatorname{E}[\mathbf{xx}^{\mathrm{T}}] - \operatorname{E}[\mathbf{x}] \operatorname{E}[\mathbf{x}]^{\mathrm{T}} \\ & = & \sum_{k = 1}^{K} \pi_{k} \operatorname{E}_{k}[\mathbf{xx}^{\mathrm{T}}] - \operatorname{E}[\mathbf{x}] \operatorname{E}[\mathbf{x}]^{\mathrm{T}} \\ & = & \sum_{k = 1}^{K} \pi_{k} \left\{\boldsymbol{\Sigma}_{k} + \boldsymbol{\mu}_{k} \boldsymbol{\mu}_{k}^{\mathrm{T}} \right\} - \operatorname{E}[\mathbf{x}] \operatorname{E}[\mathbf{x}]^{\mathrm{T}}.\end{array}
$$

9.15 This is easily shown by calculating the derivatives of (9.55), setting them to zero and solve for $\mu_{ki}$ . Using standard derivatives, we get

$$
\begin{array}{rcl} \frac{\partial}{\partial \mu_{ki}} \mathbb{E}_{\mathbf{Z}}[\ln p(\mathbf{X}, \mathbf{Z} | \boldsymbol{\mu}, \boldsymbol{\pi})] & = & \sum_{n = 1}^{N} \gamma(z_{nk}) \left(\frac{x_{ni}}{\mu_{ki}} - \frac{1 - x_{ni}}{1 - \mu_{ki}}\right) \\ & = & \frac{\sum_{n} \gamma(z_{nk}) x_{ni} - \sum_{n} \gamma(z_{nk}) \mu_{ki}}{\mu_{ki}(1 - \mu_{ki})}.\end{array}
$$

Setting this to zero and solving for $\mu_{ki}$ , we get

$$
\mu_{ki} = \frac{\sum_{n} \gamma(z_{nk}) x_{ni}}{\sum_{n} \gamma(z_{nk})},
$$

which equals (9.59) when written in vector form.

9.17 This follows directly from the equation for the incomplete log-likelihood, (9.51). The largest value that the argument to the logarithm on the r.h.s. of (9.51) can have is 1, since n, $k : 0 \leqslant p(\mathbf{x}_{n} | \pmb{\mu}_{k}) \leqslant 1, 0 \leqslant \pi_{k} \leqslant 1$ and $\begin{array}{r}{\sum_{k}^{K} \pi_{k} = 1} \end{array}$ . Therefore, the maximum value for ln $p(\mathbf{X} | \boldsymbol{\mu}, \pi)$ equals 0.

9.20 If we take the derivatives of (9.62) w.r.t. $\alpha,$ we get

$$
\frac{\partial}{\partial \alpha} \mathbb{E} \left[\ln p(\mathbf{t}, \mathbf{w} | \alpha, \beta) \right] = \frac{M}{2} \frac{1}{\alpha} - \frac{1}{2} \mathbb{E} \left[\mathbf{w}^{\mathrm{T}} \mathbf{w} \right].
$$

Setting this equal to zero and re-arranging, we obtain (9.63).

9.23 NOTE: In the first printing of PRML, the task set in this exercise is to show that the two sets of re-estimation equations are formally equivalent, without any restriction. However, it really should be restricted to the case when the optimization has converged.

Considering the case when the optimization has converged, we can start with $\alpha_{i}.$ , as defined by (7.87), and use (7.89) to re-write this as

$$
\alpha_{i}^{\star} = \frac{1 - \alpha_{i}^{\star} \Sigma_{ii}}{m_{N}^{2}},
$$

where $\alpha_{i}^{\star} = \alpha_{i}^{\mathrm{new}} = \alpha_{i}$ is the value reached at convergence. We can re-write this as

$$
\alpha_{i}^{\star}(m_{i}^{2} + \Sigma_{ii}) = 1
$$

which is easily re-written as (9.67).

For $\beta,$ we start from (9.68), which we re-write as

$$
\frac{1}{\beta^{\star}} = \frac{\| \mathbf{t} - \boldsymbol{\Phi} \mathbf{m}_{N} \|^{2}}{N} + \frac{\sum_{i} \gamma_{i}}{\beta^{\star} N}.
$$

As in the α-case, $\beta^{\star} = \beta^{\mathrm{new}} = \beta$ is the value reached at convergence. We can re-write this as

$$
\frac{1}{\beta^{\star}} \left(N - \sum_{i} \gamma_{i}\right) = \| \mathbf{t} - \boldsymbol{\Phi} \mathbf{m}_{N} \|^{2},
$$

which can easily be re-written as (7.88).

9.25 This follows from the fact that the Kullback-Leibler divergence, $\mathrm{KL}(q \| p)$ , is at its minimum, 0, when $q$ and $p$ are identical. This means that

$$
\frac{\partial}{\partial \boldsymbol{\theta}} \mathrm{KL}(q \| p) = \mathbf{0},
$$

since $p(\mathbf{Z} | \mathbf{X}, \pmb \theta)$ depends on θ. Therefore, if we compute the gradient of both sides of $_{(9.70)}$ w.r.t. θ, the contribution from the second term on the r.h.s. will be 0, and so the gradient of the first term must equal that of the l.h.s.

9.26 From (9.18) we get

$$
N_{k}^{\mathrm{old}} = \sum_{n} \gamma^{\mathrm{old}}(z_{nk}).\tag{154}
$$

We get $N_{k}^{\mathrm{new}}$ by recomputing the responsibilities, $\gamma(z_{mk})$ , for a specific data point, $\mathbf{x}_{m},$ yielding

$$
N_{k}^{\mathrm{new}} = \sum_{n \neq m} \gamma^{\mathrm{old}}(z_{nk}) + \gamma^{\mathrm{new}}(z_{mk}).
$$

Combining this with (154), we get (9.79).

Similarly, from (9.17) we have

$$
\pmb{\mu}_{k}^{\mathrm{old}} = \frac{1}{N_{k}^{\mathrm{old}}} \sum_{n} \gamma^{\mathrm{old}}(z_{nk}) \mathbf{x}_{n}
$$

and recomputing the responsibilities, $\gamma(z_{mk})$ , we get

$$
\begin{array}{rcl} \boldsymbol{\mu}_{k}^{\text{new}} & = & \frac{1}{N_{k}^{\text{new}}} \left(\sum_{n \neq m} \gamma^{\text{old}}(z_{nk}) \mathbf{x}_{n} + \gamma^{\text{new}}(z_{mk}) \mathbf{x}_{m}\right) \\ & = & \frac{1}{N_{k}^{\text{new}}} \left(N_{k}^{\text{old}} \boldsymbol{\mu}_{k}^{\text{old}} - \gamma^{\text{old}}(z_{mk}) \mathbf{x}_{m} + \gamma^{\text{new}}(z_{mk}) \mathbf{x}_{m}\right) \\ & = & \frac{1}{N_{k}^{\text{new}}} \bigg(\left(N_{k}^{\text{new}} - \gamma^{\text{new}}(z_{mk}) + \gamma^{\text{old}}(z_{mk})\right) \boldsymbol{\mu}_{k}^{\text{old}} \\ & & - \gamma^{\text{old}}(z_{mk}) \mathbf{x}_{m} + \gamma^{\text{new}}(z_{mk}) \mathbf{x}_{m} \bigg) \\ & = & \boldsymbol{\mu}_{k}^{\text{old}} + \left(\frac{\gamma^{\text{new}}(z_{mk}) - \gamma^{\text{old}}(z_{mk})}{N_{k}^{\text{new}}}\right)(\mathbf{x}_{m} - \boldsymbol{\mu}_{k}^{\text{old}}), \end{array}
$$

where we have used (9.79).

## Chapter 10 Variational Inference and EM

10.1 Starting from (10.3), we use the product rule together with (10.4) to get

$$
\begin{array}{rcl} \mathcal{L}(q) & = & \int q(\mathbf{Z}) \ln \left\{\frac{p(\mathbf{X}, \mathbf{Z})}{q(\mathbf{Z})} \right\} d \mathbf{Z} \\ & = & \int q(\mathbf{Z}) \ln \left\{\frac{p(\mathbf{X} | \mathbf{Z}) p(\mathbf{X})}{q(\mathbf{Z})} \right\} d \mathbf{Z} \\ & = & \int q(\mathbf{Z}) \left(\ln \left\{\frac{p(\mathbf{X} | \mathbf{Z})}{q(\mathbf{Z})} \right\} + \ln p(\mathbf{X})\right) d \mathbf{Z} \\ & = & - \mathrm{KL}(q \| p) + \ln p(\mathbf{X}).\end{array}
$$

Rearranging this, we immediately get (10.2).

10.3 Starting from (10.16) and optimizing w.r.t. $q_{j} \left(\mathbf{Z}_{j} \right)$ , we get

$$
\begin{array}{lll} \text{KL}(p \parallel q) & = & - \int p(\mathbf{Z}) \left[\sum_{i = 1}^{M} \ln q_{i}(\mathbf{Z}_{i}) \right] d \mathbf{Z} + \text{const.} \\ & = & - \int \left(p(\mathbf{Z}) \ln q_{j}(\mathbf{Z}_{j}) + p(\mathbf{Z}) \sum_{i \neq j} \ln q_{i}(\mathbf{Z}_{i})\right) d \mathbf{Z} + \text{const.} \\ & = & - \int p(\mathbf{Z}) \ln q_{j}(\mathbf{Z}_{j}) d \mathbf{Z} + \text{const.} \\ & = & - \int \ln q_{j}(\mathbf{Z}_{j}) \left[\int p(\mathbf{Z}) \prod_{i \neq j} d \mathbf{Z}_{i} \right] d \mathbf{Z}_{j} + \text{const.} \\ & = & - \int F_{j}(\mathbf{Z}_{j}) \ln q_{j}(\mathbf{Z}_{j}) d \mathbf{Z}_{j} + \text{const.}, \end{array}
$$

where terms independent of $q_{j} \left(\mathbf{Z}_{j} \right)$ have been absorbed into the constant term and we have defined

$$
F_{j}(\mathbf{Z}_{j}) = \int p(\mathbf{Z}) \prod_{i \neq j} d \mathbf{Z}_{i}.
$$

We use a Lagrange multiplier to ensure that $q_{j} \left(\mathbf{Z}_{j} \right)$ integrates to one, yielding

$$
- \int F_{j}(\mathbf{Z}_{j}) \ln q_{j}(\mathbf{Z}_{j}) d \mathbf{Z}_{j} + \lambda \left(\int q_{j}(\mathbf{Z}_{j}) d \mathbf{Z}_{j} - 1\right).
$$

Using the results from Appendix D, we then take the functional derivative of this w.r.t. $q_{j}$ and set this to zero, to obtain

$$
- \frac{F_{j}(\mathbf{Z}_{j})}{q_{j}(\mathbf{Z}_{j})} + \lambda = 0.
$$

From this, we see that

$$
\lambda q_{j} \left(\mathbf{Z}_{j}\right) = F_{j} \left(\mathbf{Z}_{j}\right).
$$

Integrating both sides over $\mathbf{Z}_{j}$ , we see that, since $q_{j} \left(\mathbf{Z}_{j} \right)$ must intgrate to one,

$$
\lambda = \int F_{j}(\mathbf{Z}_{j}) d \mathbf{Z}_{j} = \int \left[\int p(\mathbf{Z}) \prod_{i \neq j} d \mathbf{Z}_{i} \right] d \mathbf{Z}_{j} = 1,
$$

and thus

$$
q_{j} \left(\mathbf{Z}_{j}\right) = F_{j}(\mathbf{Z}_{j}) = \int p \left(\mathbf{Z}\right) \prod_{i \neq j} d \mathbf{Z}_{i}.
$$

10.5 We assume that $q(\mathbf{Z}) = q(\mathbf{z}) q(\pmb{\theta})$ and so we can optimize w.r.t. $q(\mathbf{z})$ and $q(\pmb \theta)$ independently.

For $q(\mathbf{z})$ , this is equivalent to minimizing the Kullback-Leibler divergence, (10.4), which here becomes

$$
\mathrm{KL}(q \parallel p) = - \iint q(\boldsymbol{\theta}) q(\mathbf{z}) \ln \frac{p(\mathbf{z}, \boldsymbol{\theta} \mid \mathbf{X})}{q(\mathbf{z}) q(\boldsymbol{\theta})} d \mathbf{z} d \boldsymbol{\theta}.
$$

For the particular chosen form of $q(\pmb \theta)$ , this is equivalent to

$$
\begin{array}{rcl} \mathrm{KL}(q \| p) & = & - \int q(\mathbf{z}) \ln \frac{p(\mathbf{z}, \boldsymbol{\theta}_{0} | \mathbf{X})}{q(\mathbf{z})} d \mathbf{z} + \mathrm{const.} \\ & = & - \int q(\mathbf{z}) \ln \frac{p(\mathbf{z} | \boldsymbol{\theta}_{0}, \mathbf{X}) p(\boldsymbol{\theta}_{0} | \mathbf{X})}{q(\mathbf{z})} d \mathbf{z} + \mathrm{const.} \\ & = & - \int q(\mathbf{z}) \ln \frac{p(\mathbf{z} | \boldsymbol{\theta}_{0}, \mathbf{X})}{q(\mathbf{z})} d \mathbf{z} + \mathrm{const.}, \end{array}
$$

where const accumulates all terms independent of $q(\mathbf{z})$ . This KL divergence is minimized when $q(\mathbf{z}) = p(\mathbf{z} | \theta_{0}, \mathbf{X})$ , which corresponds exactly to the E-step of the EM algorithm.

To determine $q(\pmb \theta)$ , we consider

$$
\begin{array}{rl} &{\int q(\pmb{\theta}) \int q(\mathbf{z}) \ln \frac{p(\mathbf{X}, \pmb{\theta}, \mathbf{z})}{q(\pmb{\theta}) q(\mathbf{z})} d \mathbf{z} d \pmb{\theta}} \\ &{= \int q(\pmb{\theta}) \mathbb{E}_{q(\mathbf{z})}[\ln p(\mathbf{X}, \pmb{\theta}, \mathbf{z})] d \pmb{\theta} - \int q(\pmb{\theta}) \ln q(\pmb{\theta}) d \pmb{\theta} + \mathrm{const}.} \end{array}
$$

where the last term summarizes terms independent of $q \left(\theta \right)$ . Since $q(\pmb \theta)$ is constrained to be a point density, the contribution from the entropy term (which formally diverges) will be constant and independent of $\theta_{0}$ . Thus, the optimization problem is reduced to maximizing expected complete log posterior distribution

$$
\mathbb{E}_{q(\mathbf{z})} \left[\ln p \left(\mathbf{X}, \boldsymbol{\theta}_{0}, \mathbf{z}\right) \right],
$$

w.r.t. $\pmb{\theta}_{0}.$ , which is equivalent to the M-step of the EM algorithm.

10.10 NOTE: The first printing of PRML contains errors that affect this exercise. ${\mathcal{L}}_{m}$ used in (10.34) and (10.35) should really be , whereas ${\mathcal{L}}_{m}$ used in (10.36) is given in Solution 10.11 below.

This completely analogous to Solution 10.1. Starting from (10.35), we can use the product rule to get,

$$
\begin{array}{rcl} \mathcal{L} & = & \sum_{m} \sum_{\mathbf{Z}} q(\mathbf{Z} | m) q(m) \ln \left\{\frac{p(\mathbf{Z}, \mathbf{X}, m)}{q(\mathbf{Z} | m) q(m)} \right\} \\ & = & \sum_{m} \sum_{\mathbf{Z}} q(\mathbf{Z} | m) q(m) \ln \left\{\frac{p(\mathbf{Z}, m | \mathbf{X}) p(\mathbf{X})}{q(\mathbf{Z} | m) q(m)} \right\} \\ & = & \sum_{m} \sum_{\mathbf{Z}} q(\mathbf{Z} | m) q(m) \ln \left\{\frac{p(\mathbf{Z}, m | \mathbf{X})}{q(\mathbf{Z} | m) q(m)} \right\} + \ln p(\mathbf{X}).\end{array}
$$

Rearranging this, we obtain (10.34).

10.11 NOTE: Consult note preceding Solution 10.10 for some relevant corrections.

We start by rewriting the lower bound as follows

$$
\begin{array}{rcl} \mathcal{L} & = & \sum_{m} \sum_{\mathbf{Z}} q(\mathbf{Z} | m) q(m) \ln \left\{\frac{p(\mathbf{Z}, \mathbf{X}, m)}{q(\mathbf{Z} | m) q(m)} \right\} \\ & = & \sum_{m} \sum_{\mathbf{Z}} q(\mathbf{Z} | m) q(m) \left\{\ln p(\mathbf{Z}, \mathbf{X} | m) + \ln p(m) - \ln q(\mathbf{Z} | m) - \ln q(m) \right\} \\ & = & \sum_{m} q(m) \left(\ln p(m) - \ln q(m) \right.\\ & & \left.+ \sum_{\mathbf{Z}} q(\mathbf{Z} | m) \left\{\ln p(\mathbf{Z}, \mathbf{X} | m) - \ln q(\mathbf{Z} | m) \right\}\right) \\ & = & \sum_{m} q(m) \left\{\ln(p(m) \exp \left\{\mathcal{L}_{m} \right\}) - \ln q(m) \right\}, \end{array} \tag{155}
$$

where

$$
\mathcal{L}_{m} = \sum_{\mathbf{Z}} q(\mathbf{Z} | m) \ln \left\{\frac{p(\mathbf{Z}, \mathbf{X} | m)}{q(\mathbf{Z} | m)} \right\}.
$$

We recognize (155) as the negative KL divergence between $q(m)$ and the (not necessarily normalized) distribution $p(m) \exp \{\mathcal{L}_{m}\}$ . This will be maximized when the KL divergence is minimized, which will be the case when

$$
q(m) \propto p(m) \exp \{\mathcal{L}_{m}\}.
$$

10.13 In order to derive the optimal solution for $q(\pmb{\mu}_{k}, \pmb{\Lambda}_{k})$ we start with the result (10.54) and keep only those term which depend on $\mu_{k}$ or $\mathbf{\Lambda}_{\Lambda_{k}}$ to give

$$
\begin{array}{l} \ln q^{\star}(\boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}) = \ln \mathcal{N}(\boldsymbol{\mu}_{k} | \mathbf{m}_{0}, \beta_{0} \boldsymbol{\Lambda}_{k}) + \ln \mathcal{W}(\boldsymbol{\Lambda}_{k} | \mathbf{W}_{0}, \nu_{0}) \\ \qquad + \sum_{n = 1}^{N} \mathbb{E}[z_{nk}] \ln \mathcal{N}(\mathbf{x}_{n} | \boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}) + \text{const.} \\ = - \frac{\beta_{0}}{2}(\boldsymbol{\mu}_{k} - \mathbf{m}_{0})^{\mathrm{T}} \boldsymbol{\Lambda}_{k}(\boldsymbol{\mu}_{k} - \mathbf{m}_{0}) + \frac{1}{2} \ln | \boldsymbol{\Lambda}_{k} | - \frac{1}{2} \operatorname{Tr} \left(\boldsymbol{\Lambda}_{k} \mathbf{W}_{0}^{- 1}\right) \\ \qquad + \frac{(\nu_{0} - D - 1)}{2} \ln | \boldsymbol{\Lambda}_{k} | - \frac{1}{2} \sum_{n = 1}^{N} \mathbb{E}[z_{nk}](\mathbf{x}_{n} - \boldsymbol{\mu}_{k})^{\mathrm{T}} \boldsymbol{\Lambda}_{k}(\mathbf{x}_{n} - \boldsymbol{\mu}_{k}) \\ \qquad + \frac{1}{2} \left(\sum_{n = 1}^{N} \mathbb{E}[z_{nk}]\right) \ln | \boldsymbol{\Lambda}_{k} | + \text{const.} \end{array}\tag{156}
$$

Using the product rule of probability, we can express ln $q^{\star}(\pmb{\mu}_{k}, \pmb{\Lambda}_{k})$ as ln $q^{\star}(\mu_{k} | \Lambda_{k})$ + ln $q^{\star}(\Lambda_{k})$ . Let us first of all identify the distribution for $\mu_{k}$ . To do this we need only consider terms on the right hand side of (156) which depend on $\pmb{\mu}_{k}$ , giving

$$
\begin{array}{ll} \ln q^{\star}(\boldsymbol{\mu}_{k} | \boldsymbol{\Lambda}_{k}) \\ = & - \frac{1}{2} \boldsymbol{\mu}_{k}^{\mathrm{T}} \left[\beta_{0} + \sum_{n = 1}^{N} \mathbb{E}[z_{nk}] \right] \boldsymbol{\Lambda}_{k} \boldsymbol{\mu}_{k} + \boldsymbol{\mu}_{k}^{\mathrm{T}} \boldsymbol{\Lambda}_{k} \left[\beta_{0} \mathbf{m}_{0} + \sum_{n = 1}^{N} \mathbb{E}[z_{nk}] \mathbf{x}_{n} \right] \\ & + \text{const.} \\ = & - \frac{1}{2} \boldsymbol{\mu}_{k}^{\mathrm{T}} \left[\beta_{0} + N_{k} \right] \boldsymbol{\Lambda}_{k} \boldsymbol{\mu}_{k} + \boldsymbol{\mu}_{k}^{\mathrm{T}} \boldsymbol{\Lambda}_{k} \left[\beta_{0} \mathbf{m}_{0} + N_{k} \overline{{\mathbf{x}}}_{k} \right] + \text{const.}.\end{array}
$$

where we have made use of (10.51) and (10.52). Thus we see that ln $q^{\star}(\mu_{k} | \Lambda_{k})$ depends quadratically on $\mu_{k}$ and hence $q^{\star}(\mu_{k} | \Lambda_{k})$ is a Gaussian distribution. Completing the square in the usual way allows us to determine the mean and precision of this Gaussian, giving

$$
q^{\star}(\boldsymbol{\mu}_{k} | \boldsymbol{\Lambda}_{k}) = \mathcal{N}(\boldsymbol{\mu}_{k} | \mathbf{m}_{k}, \beta_{k} \boldsymbol{\Lambda}_{k})\tag{157}
$$

where

$$
\begin{array}{rcl} \beta_{k} & = & \beta_{0} + N_{k} \\ \mathbf{m}_{k} & = & \frac{1}{\beta_{k}} \left(\beta_{0} \mathbf{m}_{0} + N_{k} \overline{{\mathbf{x}}}_{k}\right).\end{array}
$$

Next we determine the form of $q^{\star}(\Lambda_{k})$ by making use of the relation

$$
\ln q^{\star}(\boldsymbol{\Lambda}_{k}) = \ln q^{\star}(\boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}) - \ln q^{\star}(\boldsymbol{\mu}_{k} | \boldsymbol{\Lambda}_{k}).
$$

On the right hand side of this relation we substitute for ln $q^{\star}(\pmb{\mu}_{k}, \pmb{\Lambda}_{k})$ using (156), and we substitute for ln $q^{\star}(\pmb{\mu}_{k} | \pmb{\Lambda}_{k})$ using the result (157). Keeping only those terms

which depend on $\mathbf{\Lambda}_{\Lambda_{k}}$ we obtain

$$
\begin{array}{rcl} \ln q^{\star}(\boldsymbol{\Lambda}_{k}) & = & - \frac{\beta_{0}}{2}(\boldsymbol{\mu}_{k} - \mathbf{m}_{0})^{\mathrm{T}} \boldsymbol{\Lambda}_{k}(\boldsymbol{\mu}_{k} - \mathbf{m}_{0}) + \frac{1}{2} \ln | \boldsymbol{\Lambda}_{k} | - \frac{1}{2} \operatorname{Tr} \left(\boldsymbol{\Lambda}_{k} \mathbf{W}_{0}^{- 1}\right) \\ & & + \frac{(\nu_{0} - D - 1)}{2} \ln | \boldsymbol{\Lambda}_{k} | - \frac{1}{2} \sum_{n = 1}^{N} \mathbb{E}[z_{nk}](\mathbf{x}_{n} - \boldsymbol{\mu}_{k})^{\mathrm{T}} \boldsymbol{\Lambda}_{k}(\mathbf{x}_{n} - \boldsymbol{\mu}_{k}) \\ & & + \frac{1}{2} \left(\sum_{n = 1}^{N} \mathbb{E}[z_{nk}]\right) \ln | \boldsymbol{\Lambda}_{k} | + \frac{\beta_{k}}{2}(\boldsymbol{\mu}_{k} - \mathbf{m}_{k})^{\mathrm{T}} \boldsymbol{\Lambda}_{k}(\boldsymbol{\mu} - \mathbf{m}_{k}) \\ & & - \frac{1}{2} \ln | \boldsymbol{\Lambda}_{k} | + \text{const.} \\ & = & \frac{(\nu_{k} - D - 1)}{2} \ln | \boldsymbol{\Lambda}_{k} | - \frac{1}{2} \operatorname{Tr} \left(\boldsymbol{\Lambda}_{k} \mathbf{W}_{k}^{- 1}\right) + \text{const.}.\end{array}
$$

Note that the terms involving $\mu_{k}$ have cancelled out as we expect since $q^{\star}(\Lambda_{k})$ is independent of $\mu_{k}$ . Here we have defined

$$
\begin{array}{rcl} \mathbf{W}_{k}^{- 1} & = & \mathbf{W}_{0}^{- 1} + \beta_{0}(\boldsymbol{\mu}_{k} - \mathbf{m}_{0})(\boldsymbol{\mu}_{k} - \mathbf{m}_{0})^{\mathrm{T}} + \sum_{n = 1}^{N} \mathbb{E}[z_{nk}](\mathbf{x}_{n} - \boldsymbol{\mu}_{k})(\mathbf{x}_{n} - \boldsymbol{\mu}_{k})^{\mathrm{T}} \\ & & - \beta_{k}(\boldsymbol{\mu}_{k} - \mathbf{m}_{k})(\boldsymbol{\mu}_{k} - \mathbf{m}_{k})^{\mathrm{T}} \\ & = & \mathbf{W}_{0}^{- 1} + N_{k} \mathbf{S}_{k} + \frac{\beta_{0} N_{k}}{\beta_{0} + N_{k}}(\overline{{\mathbf{x}}}_{k} - \mathbf{m}_{0})(\overline{{\mathbf{x}}}_{k} - \mathbf{m}_{0})^{\mathrm{T}} \\ \nu_{k} & = & \nu_{0} + \sum_{n = 1}^{N} \mathbb{E}[z_{nk}] \\ & = & \nu_{0} + N_{k}, \end{array}
$$

where we have made use of the result

$$
\begin{array}{rcl} \sum_{n = 1}^{N} \mathbb{E}[z_{nk}] \mathbf{x}_{n} \mathbf{x}_{n}^{\mathrm{T}} & = & \sum_{n = 1}^{N} \mathbb{E}[z_{nk}](\mathbf{x}_{n} - \overline{{\mathbf{x}}}_{k})(\mathbf{x}_{n} - \overline{{\mathbf{x}}}_{k})^{\mathrm{T}} + N_{k} \overline{{\mathbf{x}}}_{k} \overline{{\mathbf{x}}}_{k}^{\mathrm{T}} \\ & = & N_{k} \mathbf{S}_{k} + N_{k} \overline{{\mathbf{x}}}_{k} \overline{{\mathbf{x}}}_{k}^{\mathrm{T}} \end{array}\tag{158}
$$

and we have made use of (10.53). Thus we see that $q^{\star}(\Lambda_{k})$ is a Wishart distribution of the form

$$
q^{\star}(\boldsymbol{\Lambda}_{k}) = \mathcal{W}(\boldsymbol{\Lambda}_{k} | \mathbf{W}_{k}, \nu_{k}).
$$

10.16 To derive (10.71) we make use of (10.38) to give

$$
\begin{array}{l} \mathbb{E}[\ln p(D | \mathbf{z}, \boldsymbol{\mu}, \boldsymbol{\Lambda})] \\ = \frac{1}{2} \sum_{n = 1}^{N} \sum_{k = 1}^{K} \mathbb{E}[z_{nk}] \left\{\mathbb{E}[\ln | \boldsymbol{\Lambda}_{k} |] - \mathbb{E}[(\mathbf{x}_{n} - \boldsymbol{\mu}_{k}) \boldsymbol{\Lambda}_{k}(\mathbf{x}_{n} - \boldsymbol{\mu}_{k})] - D \ln(2 \pi) \right\}.\end{array}
$$

We now use $\mathbb{E}[z_{nk}] = r_{nk}$ together with (10.64) and the definition of $\widetilde{\Lambda}_{k}$ given by (10.65) to give

$$
\begin{array}{c} \mathbb{E}[\ln p(D | \mathbf{z}, \boldsymbol{\mu}, \boldsymbol{\Lambda})] = \frac{1}{2} \sum_{n = 1}^{N} \sum_{k = 1}^{K} r_{nk} \big \{\ln \widetilde{\Lambda}_{k} \\ - D \beta_{k}^{- 1} - \nu_{k}(\mathbf{x}_{n} - \mathbf{m}_{k})^{\mathrm{T}} \mathbf{W}_{k}(\mathbf{x}_{n} - \mathbf{m}_{k}) - D \ln(2 \pi) \big\}.\end{array}
$$

Now we use the definitions (10.51) to (10.53) together with the result (158) to give (10.71).

We can derive (10.72) simply by taking the logarithm of $p(\mathbf{z} | \boldsymbol{\pi})$ given by (10.37)

$$
\mathbb{E}[\ln p(\mathbf{z} | \pmb{\pi})] = \sum_{n = 1}^{N} \sum_{k = 1}^{K} \mathbb{E}[z_{nk}] \mathbb{E}[\ln \pi_{k}]
$$

and then making use of $\mathbb{E}[z_{nk}] = r_{nk}$ together with the definition of $\widetilde{\pi}_{k}$ given by (10.65).

10.20 Consider first the posterior distribution over the precision of component k given by

$$
q^{\star}(\boldsymbol{\Lambda}_{k}) = \mathcal{W}(\boldsymbol{\Lambda}_{k} | \mathbf{W}_{k}, \nu_{k}).
$$

From (10.63) we see that for large N we have $\nu_{k} \to N_{k}$ , and similarly from $_{(10.62)}$ we see that $\mathbf{W}_{k} \to N_{k}^{- 1} \mathbf{S}_{k}^{- 1}$ . Thus the mean of the distribution over $\mathbf{\Lambda}_{\mathbf{\Lambda}} \mathbf{\Lambda}_{\mathbf{\Lambda}}$ , given by $\mathbb{E}[\mathbf{A}_{k}] = \nu_{k} \mathbf{W}_{k} \mathbf{S}_{k}^{- 1}$ which is the maximum likelihood value (this assumes that the quantities $r_{nk}$ reduce to the corresponding EM values, which is indeed the case as we shall show shortly). In order to show that this posterior is also sharply peaked, we consider the differential entropy, $\mathrm{H}[\Lambda_{k}]$ given by (B.82), and show that, as $N _ { k } $ <sub>∞</sub><sup>,</sup> $\mathrm{H}[\mathbf{A}_{k}] \to 0$ , corresponding to the density collapsing to a spike. First consider the normalizing constant $B(\mathbf{W}_{k}, \nu_{k})$ given by (B.79). Since $\dot{\mathbf{W}_{k}} N_{k}^{- 1} \mathbf{S}_{k}^{- 1}$ and $\nu_{k} \to N_{k}$

$$
- \ln B(\mathbf{W}_{k}, \nu_{k}) \rightarrow - \frac{N_{k}}{2}(D \ln N_{k} + \ln | \mathbf{S}_{k} | - D \ln 2) + \sum_{i = 1}^{D} \ln \Gamma \left(\frac{N_{k} + 1 - i}{2}\right)
$$

We then make use of Stirling’s approximation (1.146) to obtain

$$
\ln \Gamma \left(\frac{N_{k} + 1 - i}{2}\right) \simeq \frac{N_{k}}{2} \left(\ln N_{k} - \ln 2 - 1\right)
$$

which leads to the approximate limit

$$
\begin{array}{rcl}- \ln B(\mathbf{W}_{k}, \nu_{k})&\rightarrow&- \frac{N_{k} D}{2}(\ln N_{k} - \ln 2 - \ln N_{k} + \ln 2 + 1) - \frac{N_{k}}{2} \ln | \mathbf{S}_{k} |\\&=&- \frac{N_{k}}{2}(\ln | \mathbf{S}_{k} | + D).\end{array}\tag{159}
$$

Next, we use (10.241) and (B.81) in combination with ${\bf W}_{k} \to N_{k}^{- 1}{\bf S}_{k}^{- 1}$ and $\nu _ { k } $ $N_{k}$ to obtain the limit

$$
\begin{array}{rcl}\mathbb{E} \left[\ln | \boldsymbol{\Lambda} | \right]&\rightarrow&D \ln \frac{N_{k}}{2} + D \ln 2 - D \ln N_{k} - \ln | \mathbf{S}_{k} |\\&=&- \ln | \mathbf{S}_{k} |,\end{array}
$$

where we approximated the argument to the digamma function by $N_{k} / 2$ . Substituting this and (159) into (B.82), we get

$$
\mathrm{H}[\boldsymbol{\Lambda}] \rightarrow 0
$$

when $N_{k} \to \infty$

Next consider the posterior distribution over the mean $\pmb{\mu}_{k}$ of the $k^{\mathrm{th}}$ component given by

$$
q^{\star}(\boldsymbol{\mu}_{k} | \boldsymbol{\Lambda}_{k}) = \mathcal{N}(\boldsymbol{\mu}_{k} | \mathbf{m}_{k}, \beta_{k} \boldsymbol{\Lambda}_{k}).
$$

From (10.61) we see that for large N the mean $\mathbf{m}_{k}$ of this distribution reduces to $\overline{{\mathbf{x}}}_{k}$ which is the corresponding maximum likelihood value. From (10.60) we see that $\beta_{k} \to N_{k}$ and Thus the precision $\beta_{k} \Lambda_{k} \to \beta_{k} \nu_{k} \mathbf{W}_{k} \to N_{k} \mathbf{S}_{k}^{- 1}$ which is large for large N and hence this distribution is sharply peaked around its mean.

Now consider the posterior distribution $q^{\star}(\pi)$ given by (10.57). For large $N$ we have $\alpha_{k} N_{k}$ and so from (B.17) and (B.19) we see that the posterior distribution becomes sharply peaked around its mean $\mathbb{E}[\pi_{k}] = \alpha_{k} / \overline{{\alpha}} \longrightarrow N_{k} / N$ which is the maximum likelihood solution.

For the distribution ${{q}^{\star}}(\mathbf{z})$ we consider the responsibilities given by (10.67). Using (10.65) and (10.66), together with the asymptotic result for the digamma function, we again obtain the maximum likelihood expression for the responsibilities for large $N$

Finally, for the predictive distribution we first perform the integration over π, as in the solution to Exercise 10.19, to give

$$
p(\widehat{\mathbf{x}} | D) = \sum_{k = 1}^{K} \frac{\alpha_{k}}{\overline{{\alpha}}} \iint \mathcal{N}(\widehat{\mathbf{x}} | \boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}) q(\boldsymbol{\mu}_{k}, \boldsymbol{\Lambda}_{k}) d \boldsymbol{\mu}_{k} d \boldsymbol{\Lambda}_{k}.
$$

The integrations over $\mu_{k}$ and $\mathbf{\Lambda}_{\Lambda_{k}}$ are then trivial for large N since these are sharply peaked and hence approximate delta functions. We therefore obtain

$$
p(\widehat{\mathbf{x}} | D) = \sum_{k = 1}^{K} \frac{N_{k}}{N} \mathcal{N}(\widehat{\mathbf{x}} | \overline{{\mathbf{x}}}_{k}, \mathbf{W}_{k})
$$

which is a mixture of Gaussians, with mixing coefficients given by $N_{k} / N$

When we are treating π as a parameter, there is neither a prior, nor a variational posterior distribution, over π. Therefore, the only term remaining from the lower bound, (10.70), that involves $\pi$ is the second term, (10.72). Note however, that (10.72) involves the expectations of ln $\pi_{k}$ under $q(\pi)$ , whereas here, we operate directly with $\pi_{k},$ , yielding

$$
\mathbb{E}_{q(\mathbf{Z})}[\ln p(\mathbf{Z} | \boldsymbol{\pi})] = \sum_{n = 1}^{N} \sum_{k = 1}^{K} r_{nk} \ln \pi_{k}.
$$

Adding a Langrange term, as in (9.20), taking the derivative w.r.t. $\pi_{k}$ and setting the result to zero we get

$$
\frac{N_{k}}{\pi_{k}} + \lambda = 0,\tag{160}
$$

where we have used (10.51). By re-arranging this to

$$
N_{k} = - \lambda \pi_{k}
$$

and summing both sides over k, we see that $\begin{array}{r}{- \lambda = \sum_{k} N_{k} = N} \end{array}$ , which we can use to eliminate λ from (160) to get (10.83).

10.24 The singularities that may arise in maximum likelihood estimation are caused by a mixture component, k, collapsing on a data point, ${\bf x}_{n}, \mathrm{i.e.,} r_{kn} = 1, \mu_{k} ={\bf x}_{n}$ and $| \Lambda_{k} | \to \infty$

However, the prior distribution $p(\pmb{\mu}, \pmb{\Lambda})$ defined in (10.40) will prevent this from happening, also in the case of MAP estimation. Consider the product of the expected complete log-likelihood and $p(\pmb{\mu}, \pmb{\Lambda})$ as a function of $\mathbf{\Lambda}_{\Lambda_{k}}$ :

$$
\begin{array}{l} \mathbb{E}_{q(\mathbf{Z})} \left[\ln p(\mathbf{X} | \mathbf{Z}, \boldsymbol{\mu}, \boldsymbol{\Lambda}) p(\boldsymbol{\mu}, \boldsymbol{\Lambda}) \right] \\ = \frac{1}{2} \sum_{n = 1}^{N} r_{kn} \left(\ln | \boldsymbol{\Lambda}_{k} | -(\mathbf{x}_{n} - \boldsymbol{\mu}_{k})^{\mathrm{T}} \boldsymbol{\Lambda}_{k}(\mathbf{x}_{n} - \boldsymbol{\mu}_{k})\right) \\ + \ln | \boldsymbol{\Lambda}_{k} | - \beta_{0}(\boldsymbol{\mu}_{k} - \mathbf{m}_{0})^{\mathrm{T}} \boldsymbol{\Lambda}_{k}(\boldsymbol{\mu}_{k} - \mathbf{m}_{0}) \\ +(\nu_{0} - D - 1) \ln | \boldsymbol{\Lambda}_{k} | - \operatorname{Tr} \left[\mathbf{W}_{0}^{- 1} \boldsymbol{\Lambda}_{k} \right] + \text{const.} \end{array}
$$

where we have used (10.38), (10.40) and (10.50), together with the definitions for the Gaussian and Wishart distributions; the last term summarizes terms independent of $\mathbf{\Lambda}_{\Lambda_{k}}$ . Using (10.51)–(10.53), we can rewrite this as

$$
\left(\nu_{0} + N_{k} - D\right) \ln | \boldsymbol{\Lambda}_{k} | - \operatorname{Tr} \left[\left(\mathbf{W}_{0}^{- 1} + \beta_{0} \left(\boldsymbol{\mu}_{k} - \mathbf{m}_{0}\right) \left(\boldsymbol{\mu}_{k} - \mathbf{m}_{0}\right)^{\mathrm{T}} + N_{k} \mathbf{S}_{k}\right) \boldsymbol{\Lambda}_{k} \right],
$$

where we have dropped the constant term. Using (C.24) and (C.28), we can compute the derivative of this w.r.t. $\mathbf{\Lambda}_{\Lambda_{k}}$ and setting the result equal to zero, we find the MAP estimate for $\mathbf{\Lambda}_{\Lambda_{k}}$ to be

$$
\boldsymbol{\Lambda}_{k}^{- 1} = \frac{1}{\nu_{0} + N_{k} - D}(\mathbf{W}_{0}^{- 1} + \beta_{0}(\boldsymbol{\mu}_{k} - \mathbf{m}_{0})(\boldsymbol{\mu}_{k} - \mathbf{m}_{0})^{\mathrm{T}} + N_{k} \mathbf{S}_{k}).
$$

From this we see that $| \Lambda_{k}^{- 1} |$ can never become $0,$ because of the presence of $\mathbf{W}_{0}^{- 1}$ (which we must chose to be positive definite) in the expression on the r.h.s.

## 10.29 Stardard rules of differentiation give

$$
{\frac{d \ln(x)}{dx}} ={\frac{1}{x}}
$$

$$
{\frac{d^{2} \ln(x)}{dx^{2}}} = -{\frac{1}{x^{2}}}.
$$

Since its second derivative is negative for all value of x, ln(x) is concave for $0 ~ <$ $x < \infty,$

From (10.133) we have

$$
\begin{array}{rcl} g(\lambda) & = & \min_{x} \left\{\lambda x - f(x) \right\} \\ & = & \min_{x} \left\{\lambda x - \ln(x) \right\}.\end{array}
$$

We can minimize this w.r.t. x by setting the corresponding derivative to zero and solving for x:

$$
{\frac{dg}{dx}} = \lambda -{\frac{1}{x}} = 0 \quad \Longrightarrow \quad x ={\frac{1}{\lambda}}.
$$

Substituting this in (10.133), we see that

$$
g(\lambda) = 1 - \ln \left(\frac{1}{\lambda}\right).
$$

If we substitute this into (10.132), we get

$$
f(x) = \min_{\lambda} \left\{\lambda x - 1 + \ln \left(\frac{1}{\lambda}\right) \right\}.
$$

Again, we can minimize this w.r.t. λ by setting the corresponding derivative to zero and solving for λ:

$$
{\frac{df}{d \lambda}} = x -{\frac{1}{\lambda}} = 0 \quad \Longrightarrow \quad \lambda ={\frac{1}{x}},
$$

and substituting this into (10.132), we find that

$$
f(x) = \frac{1}{x} x - 1 + \ln \left(\frac{1}{1 / x}\right) = \ln(x).
$$

10.32 We can see this from the lower bound (10.154), which is simply a sum of the prior and indepedent contributions from the data points, all of which are quadratic in w. A new data point would simply add another term to this sum and we can regard terms from the previously arrived data points and the original prior collectively as a revised prior, which should be combined with the contributions from the new data point.

The corresponding sufficient statistics, (10.157) and (10.158), can be rewritten directly in the corresponding sequential form,

$$
\begin{array}{ll} \mathbf{m}_{N} = \mathbf{S}_{N} \left(\mathbf{S}_{0}^{- 1} \mathbf{m}_{0} + \sum_{n = 1}^{N}(t_{n} - 1 / 2) \phi_{n}\right) \\ = & \mathbf{S}_{N} \left(\mathbf{S}_{0}^{- 1} \mathbf{m}_{0} + \sum_{n = 1}^{N - 1}(t_{n} - 1 / 2) \phi_{n} +(t_{N} - 1 / 2) \phi_{N}\right) \\ = & \mathbf{S}_{N} \left(\mathbf{S}_{N - 1}^{- 1} \mathbf{S}_{N - 1} \left(\mathbf{S}_{0}^{- 1} \mathbf{m}_{0} + \sum_{n = 1}^{N - 1}(t_{n} - 1 / 2) \phi_{n}\right) +(t_{N} - 1 / 2) \phi_{N}\right) \\ = & \mathbf{S}_{N} \left(\mathbf{S}_{N - 1}^{- 1} \mathbf{m}_{N - 1} +(t_{N} - 1 / 2) \phi_{N}\right) \end{array}
$$

and

$$
\begin{array}{rcl} \mathbf{S}_{N}^{- 1} & = & \mathbf{S}_{0}^{- 1} + 2 \sum_{n = 1}^{N} \lambda(\xi_{n}) \phi_{n} \phi_{n}^{\mathrm{T}} \\ & = & \mathbf{S}_{0}^{- 1} + 2 \sum_{n = 1}^{N - 1} \lambda(\xi_{n}) \phi_{n} \phi_{n}^{\mathrm{T}} + 2 \lambda(\xi_{N}) \phi_{N} \phi_{N}^{\mathrm{T}} \\ & = & \mathbf{S}_{N - 1}^{- 1} + 2 \lambda(\xi_{N}) \phi_{N} \phi_{N}^{\mathrm{T}}.\end{array}
$$

The update formula for the variational parameters, (10.163), remain the same, but each parameter is updated only once, although this update will be part of an iterative scheme, alternating between updating ${\bf m}_{N}$ and $\mathbf{S}_{N}$ with $\xi_{N}$ kept fixed, and updating $\xi_{N}$ with ${\bf m}_{N}$ and $\mathbf{S}_{N}$ kept fixed. Note that updating $\xi_{N}$ will not affect $\mathbf{m}_{N - 1}$ and $\mathbf{S}_{N - 1}$ . Note also that this updating policy differs from that of the batch learning scheme, where all variational parameters are updated using statistics based on all data points.

10.37 Here we use the general expectation-propagation equations (10.204)–(10.207). The initial $q(\pmb \theta)$ takes the form

$$
q_{\mathrm{init}}(\boldsymbol{\theta}) = \widetilde{f}_{0}(\boldsymbol{\theta}) \prod_{i \neq 0} \widetilde{f}_{i}(\boldsymbol{\theta})
$$

where $\widetilde{f}_{0}(\pmb{\theta}) = f_{0}(\pmb{\theta})$ . Thus

$$
q^{\backslash 0}(\boldsymbol{\theta}) \propto \prod_{i \neq 0} \widetilde{f}_{i}(\boldsymbol{\theta})
$$

and $q^{\mathrm{new}}(\pmb{\theta})$ is determined by matching moments (sufficient statistics) against

$$
q^{\backslash 0}(\boldsymbol{\theta}) f_{0}(\boldsymbol{\theta}) = q_{\mathrm{init}}(\boldsymbol{\theta}).
$$

Snce by definition this belongs to the same exponential family form as $q^{\mathrm{new}}(\pmb{\theta})$ it follows that

$$
q^{\mathrm{new}}(\boldsymbol{\theta}) = q_{\mathrm{init}}(\boldsymbol{\theta}) = q^{\backslash 0}(\boldsymbol{\theta}) f_{0}(\boldsymbol{\theta}).
$$

Thus

$$
\widetilde{f}_{0}(\boldsymbol{\theta}) = \frac{Z_{0} q^{\mathrm{new}}(\boldsymbol{\theta})}{q^{\backslash 0}(\boldsymbol{\theta})} = Z_{0} f_{0}(\boldsymbol{\theta})
$$

where

$$
Z_{0} = \int q^{\backslash 0}(\pmb{\theta}) f_{0}(\pmb{\theta}) d \pmb{\theta} = \int q^{\mathrm{new}}(\pmb{\theta}) d \pmb{\theta} = 1.
$$

## Chapter 11 Sampling Methods

11.1 Since the samples are independent, for the mean, we have

$$
\mathbb{E} \left[\widehat{f} \right] = \frac{1}{L} \sum_{l = 1}^{L} \int f(z^{(l)}) p(z^{(l)}) d z^{(l)} = \frac{1}{L} \sum_{l = 1}^{L} \mathbb{E}[f] = \mathbb{E}[f].
$$

Using this together with (1.38) and (1.39), for the variance, we have

$$
\begin{array}{rcl} \operatorname{var}[\widehat{f}] & = & \mathbb{E}[(\widehat{f} - \mathbb{E}[\widehat{f}])^{2}] \\ & = & \mathbb{E}[\widehat{f}^{2}] - \mathbb{E}[f]^{2}.\end{array}
$$

Now note

$$
\begin{array}{rcl} \mathbb{E} \left[f(z^{(k)}), f(z^{(m)}) \right] & = & \left\{\begin{array}{ll} \operatorname{var}[f] + \mathbb{E}[f^{2}] & \text{if n = k}, \\ \mathbb{E}[f^{2}] & \text{otherwise}, \end{array} \right.\\ & = & \mathbb{E}[f^{2}] + \delta_{mk} \operatorname{var}[f], \end{array}
$$

where we again exploited the fact that the samples are independent.

Hence

$$
\begin{array}{rcl} \operatorname{var} \left[\widehat{f} \right] & = & \mathbb{E} \left[\frac{1}{L} \sum_{m = 1}^{L} f(z^{(m)}) \frac{1}{L} \sum_{k = 1}^{L} f(z^{(k)}) \right] - \mathbb{E}[f]^{2} \\ & = & \frac{1}{L^{2}} \sum_{m = 1}^{L} \sum_{k = 1}^{L} \left\{\mathbb{E}[f^{2}] + \delta_{mk} \operatorname{var}[f] \right\} - \mathbb{E}[f]^{2} \\ & = & \frac{1}{L} \operatorname{var}[f] \\ & = & \frac{1}{L} \mathbb{E} \left[(f - \mathbb{E}[f])^{2} \right].\end{array}
$$

11.5 Since <sup>E</sup> $[\mathbf{z}] = \mathbf{0}.$

$$
\mathbb{E}[\mathbf{y}] = \mathbb{E}[\boldsymbol{\mu} + \mathbf{Lz}] = \boldsymbol{\mu}.
$$

Similarly, since $\mathbb{E} \left[{\mathbf{z}}{\mathbf{z}}^{\mathrm{T}} \right] ={\mathbf{I}},$

$$
\begin{array}{rcl} \operatorname{cov}[\mathbf{y}] & = & \mathbb{E}[\mathbf{yy}^{\mathrm{T}}] - \mathbb{E}[\mathbf{y}] \mathbb{E}[\mathbf{y}^{\mathrm{T}}] \\ & = & \mathbb{E} \left[(\boldsymbol{\mu} + \mathbf{Lz})(\boldsymbol{\mu} + \mathbf{Lz})^{\mathrm{T}} \right] - \boldsymbol{\mu} \boldsymbol{\mu}^{\mathrm{T}} \\ & = & \mathbf{LL}^{\mathrm{T}} \\ & = & \boldsymbol{\Sigma}.\end{array}
$$

11.6 The probability of acceptance follows trivially from the mechanism used to accept or reject the sample. The probability of a sample u drawn uniformly from the interval $[0, kq(\mathbf{z})]$ being less than or equal to a value $\widetilde{p}(\mathbf{z}) \leqslant kq(\mathbf{z})$ is simply

$$
p(\mathrm{acceptance} | \mathbf{z}) = \int_{0}^{\widetilde{p}(\mathbf{z})} \frac{1}{kq(\mathbf{z})} d u = \frac{\widetilde{p}(\mathbf{z})}{kq(\mathbf{z})}.
$$

Therefore, the probability density for drawing a sample, z, is

$$
q(\mathbf{z}) p(\mathrm{acceptance} | \mathbf{z}) = q(\mathbf{z}) \frac{\widetilde{p}(\mathbf{z})}{kq(\mathbf{z})} = \frac{\widetilde{p}(\mathbf{z})}{k}.\tag{161}
$$

Since $\widetilde{p}(\mathbf{z})$ is proportional to $p(\mathbf{x})$ ,

$$
p(\mathbf{z}) = \frac{1}{Z_{\widetilde{p}}} \widetilde{p}(\mathbf{z}),
$$

where

$$
Z_{\widetilde{p}} = \int \widetilde{p}(\mathbf{z}) d \mathbf{z}.
$$

As the l.h.s. of (161) is a probability density that integrates to 1, it follows that

$$
\int \frac{\widetilde{p}(\mathbf{z})}{k} d \mathbf{z} = 1
$$

and so $k = Z_{\widetilde{p}}$ , and

$$
\frac{\widetilde{p}(\mathbf{z})}{k} = p(\mathbf{z}),
$$

as required.

11.11 This follows from the fact that in Gibbs sampling, we sample a single variable, $z_{k},$ at the time, while all other variables, $\{z_{i}\}_{i \neq k}$ , remain unchanged. Thus, $\{z_{i}^{\prime}\}_{i \neq k} =$ $\{z_{i}\}_{i \neq k}$ and we get

$$
\begin{array}{rcl} p^{\star}(\mathbf{z}) T(\mathbf{z}, \mathbf{z}^{\prime}) & = & p^{\star}(z_{k}, \{z_{i}\}_{i \neq k}) p^{\star}(z_{k}^{\prime} | \{z_{i}\}_{i \neq k}) \\ & = & p^{\star}(z_{k} | \{z_{i}\}_{i \neq k}) p^{\star}(\{z_{i}\}_{i \neq k}) p^{\star}(z_{k}^{\prime} | \{z_{i}\}_{i \neq k}) \\ & = & p^{\star}(z_{k} | \{z_{i}^{\prime}\}_{i \neq k}) p^{\star}(\{z_{i}^{\prime}\}_{i \neq k}) p^{\star}(z_{k}^{\prime} | \{z_{i}^{\prime}\}_{i \neq k}) \\ & = & p^{\star}(z_{k} | \{z_{i}^{\prime}\}_{i \neq k}) p^{\star}(z_{k}^{\prime}, \{z_{i}^{\prime}\}_{i \neq k}) \\ & = & p^{\star}(\mathbf{z}^{\prime}) T(\mathbf{z}^{\prime}, \mathbf{z}), \end{array}
$$

where we have used the product rule together with $T(\mathbf{z}, \mathbf{z}^{\prime}) = p^{\star}(z_{k}^{\prime} | \{z_{i}\}_{i \neq k})$

11.15 Using (11.56), we can differentiate (11.57), yielding

$$
\frac{\partial H}{\partial r_{i}} = \frac{\partial K}{\partial r_{i}} = r_{i}
$$

and thus (11.53) and (11.58) are equivalent.

Similarly, differentiating (11.57) w.r.t. z<sub>i</sub> we get

$$
\frac{\partial H}{\partial z_{i}} = \frac{\partial E}{\partial r_{i}},
$$

and from this, it is immediately clear that (11.55) and (11.59) are equivalent.

11.17 NOTE: In the first printing of PRML, there were sign errors in equations (11.68) and (11.69). In both cases, the sign of the argument to the exponential forming the second argument to the min-function should be changed.

First we note that, if $H(\mathcal{R}) = H(\mathcal{R^{\prime}})$ , then the detailed balance clearly holds, since in this case, (11.68) and (11.69) are identical.

Otherwise, we either have $H(\mathcal{R}) > H(\mathcal{R^{\prime}})$ or $H(\mathcal{R}) < H(\mathcal{R^{\prime}})$ . We consider the former case, for which (11.68) becomes

$$
\frac{1}{Z_{H}} \exp(- H(\mathcal{R})) \delta V \frac{1}{2},
$$

since the min-function will return 1. (11.69) in this case becomes

$$
\frac{1}{Z_{H}} \exp(- H(\mathcal{R}^{\prime})) \delta V \frac{1}{2} \exp(H(\mathcal{R}^{\prime}) - H(\mathcal{R})) = \frac{1}{Z_{H}} \exp(- H(\mathcal{R})) \delta V \frac{1}{2}.
$$

In the same way it can be shown that both (11.68) and (11.69) equal

$$
\frac{1}{Z_{H}} \exp(- H(\mathcal{R}^{\prime})) \delta V \frac{1}{2}
$$

when $H(\mathcal{R}) < H(\mathcal{R^{\prime}})$

## Chapter 12 Latent Variables

12.1 Suppose that the result holds for projection spaces of dimensionality M . The $M +$ 1 dimensional principal subspace will be defined by the M principal eigenvectors $\mathbf{u}_{1}, \dots, \mathbf{u}_{M}$ together with an additional direction vector $\mathbf{u}_{M + 1}$ whose value we wish to determine. We must constrain ${\bf u}_{M + 1}$ such that it cannot be linearly related to $\mathbf{u}_{1}, \dots, \mathbf{u}_{M}$ (otherwise it will lie in the M -dimensional projection space instead of defining an $M + 1$ independent direction). This can easily be achieved by requiring that $\mathbf{u}_{M + 1}$ be orthogonal to $\mathbf{u}_{1}, \dots, \mathbf{u}_{M}$ , and these constraints can be enforced using Lagrange multipliers $\eta_{1}, \dots, \eta_{M}$

Following the argument given in section 12.1.1 for $\mathbf{u}_{1}$ we see that the variance in the direction $\mathbf{u}_{M + 1}$ is given by ${\bf u}_{M + 1}^{\mathrm{T}}{\bf Su}_{M + 1}$ . We now maximize this using a Lagrange multiplier $\lambda_{M + 1}$ to enforce the normalization constraint u $\mathbf{l}_{M + 1}^{\mathrm{T}} \mathbf{u}_{M + 1} = 1$ . Thus we seek a maximum of the function

$$
\mathbf{u}_{M + 1}^{\mathrm{T}} \mathbf{Su}_{M + 1} + \lambda_{M + 1} \left(1 - \mathbf{u}_{M + 1}^{\mathrm{T}} \mathbf{u}_{M + 1}\right) + \sum_{i = 1}^{M} \eta_{i} \mathbf{u}_{M + 1}^{\mathrm{T}} \mathbf{u}_{i}.
$$

with respect to $\mathbf{u}_{M + 1}$ . The stationary points occur when

$$
0 = 2 \mathbf{S} \mathbf{u}_{M + 1} - 2 \lambda_{M + 1} \mathbf{u}_{M + 1} + \sum_{i = 1}^{M} \eta_{i} \mathbf{u}_{i}.
$$

Left multiplying with $\mathbf{u}_{j}^{\mathrm{T}}$ , and using the orthogonality constraints, we see that $\eta_{j} = 0$ for $j = 1, \dots, M$ . We therefore obtain

$$
\mathbf{S} \mathbf{u}_{M + 1} = \lambda_{M + 1} \mathbf{u}_{M + 1}
$$

and so $\mathbf{u}_{M + 1}$ must be an eigenvector of S with eigenvalue $\mathbf{u}_{M + 1}$ . The variance in the direction ${\bf u}_{M + 1}$ is given by $\mathbf{u}_{M + 1}^{\mathrm{T}} \mathbf{S} \mathbf{u}_{M + 1} = \lambda_{M + 1}$ and so is maximized by choosing $\mathbf{u}_{M + 1}$ to be the eigenvector having the largest eigenvalue amongst those not previously selected. Thus the result holds also for projection spaces of dimensionality $M + 1$ , which completes the inductive step. Since we have already shown this result explicitly for $M = 1$ if follows that the result must hold for any $M \leqslant D$

12.4 Using the results of Section 8.1.4, the marginal distribution for this modified probabilistic PCA model can be written

$$
p(\mathbf{x}) = \mathcal{N}(\mathbf{x} | \mathbf{Wm} + \boldsymbol{\mu}, \sigma^{2} \mathbf{I} + \mathbf{W}^{\mathrm{T}} \boldsymbol{\Sigma}^{- 1} \mathbf{W}).
$$

If we now define new parameters

$$
\begin{array}{rcl} \widetilde{\mathbf{W}} & = & \boldsymbol{\Sigma}^{1 / 2} \mathbf{W} \\ \widetilde{\boldsymbol{\mu}} & = & \mathbf{Wm} + \boldsymbol{\mu} \end{array}
$$

then we obtain a marginal distribution having the form

$$
p(\mathbf{x}) = \mathcal{N}(\mathbf{x} | \widetilde{\boldsymbol{\mu}}, \sigma^{2} \mathbf{I} + \widetilde{\mathbf{W}}^{\mathrm{T}} \widetilde{\mathbf{W}}).
$$

Thus any Gaussian form for the latent distribution therefore gives rise to a predictive distribution having the same functional form, and so for convenience we choose the simplest form, namely one with zero mean and unit covariance.

12.6 Omitting the parameters, W, $\mu$ and $\sigma_{\mathrm{{:}}}$ , leaving only the stochastic variables z and $\mathbf{x},$ the graphical model for probabilistic PCA is identical with the the ‘naive Bayes’ model shown in Figure 8.24 in Section 8.2.2. Hence these two models exhibit the same independence structure.

12.8 By matching (12.31) with (2.113) and (12.32) with (2.114), we have from (2.116) and (2.117) that

$$
\begin{array}{rcl} p(\mathbf{z} | \mathbf{x}) & = & \mathcal{N} \left(\mathbf{z} |(\mathbf{I} + \sigma^{- 2} \mathbf{W}^{\mathrm{T}} \mathbf{W})^{- 1} \mathbf{W}^{\mathrm{T}} \sigma^{- 2} \mathbf{I}(\mathbf{x} - \boldsymbol{\mu}),(\mathbf{I} + \sigma^{- 2} \mathbf{W}^{\mathrm{T}} \mathbf{W})^{- 1}\right) \\ & = & \mathcal{N} \left(\mathbf{z} | \mathbf{M}^{- 1} \mathbf{W}^{\mathrm{T}}(\mathbf{x} - \boldsymbol{\mu}), \sigma^{2} \mathbf{M}^{- 1}\right), \end{array}
$$

where we have also used (12.41).

12.11 Taking $\sigma^{2} \to 0$ in (12.41) and substituting into (12.48) we obtain the posterior mean for probabilistic PCA in the form

$$
(\mathbf{W}_{\mathrm{ML}}^{\mathrm{T}} \mathbf{W}_{\mathrm{ML}})^{- 1} \mathbf{W}_{\mathrm{ML}}^{\mathrm{T}}(\mathbf{x} - \overline{{\mathbf{x}}}).
$$

Now substitute for ${\bf W}_{\mathrm{ML}}$ using (12.45) in which we take $\mathbb{R} = \mathbf{I}$ for compatibility with conventional PCA. Using the orthogonality property ${\bf U}_{M}^{\mathrm{T}}{\bf U}_{M} ={\bf I}$ and setting $\sigma^{2} = 0$ , this reduces to

$$
\mathbf{L}^{- 1 / 2} \mathbf{U}_{M}^{\mathrm{T}}(\mathbf{x} - \overline{{\mathbf{x}}})
$$

which is the orthogonal projection is given by the conventional PCA result (12.24).

12.15 Using standard derivatives together with the rules for matrix differentiation from Appendix C, we can compute the derivatives of (12.53) w.r.t. W and $\sigma^{2} \dag$

$$
\frac{\partial}{\partial \mathbf{W}} \mathbb{E}[\ln p(\mathbf{X}, \mathbf{Z} | \boldsymbol{\mu}, \mathbf{W}, \sigma^{2})] = \sum_{n = 1}^{N} \left\{\frac{1}{\sigma^{2}}(\mathbf{x}_{n} - \overline{{\mathbf{x}}}) \mathbb{E}[\mathbf{z}_{n}]^{\mathrm{T}} - \frac{1}{\sigma^{2}} \mathbf{W} \mathbb{E}[\mathbf{z}_{n} \mathbf{z}_{n}^{\mathrm{T}}] \right\}
$$

and

$$
\begin{array}{l} \frac{\partial}{\partial \sigma^{2}} \mathbb{E}[\ln p(\mathbf{X}, \mathbf{Z} | \boldsymbol{\mu}, \mathbf{W}, \sigma^{2})] = \sum_{n = 1}^{N} \left\{\frac{1}{2 \sigma^{4}} \mathbb{E}[\mathbf{z}_{n} \mathbf{z}_{n}^{\mathrm{T}}] \mathbf{W}^{\mathrm{T}} \mathbf{W} + \frac{1}{2 \sigma^{4}} \| \mathbf{x}_{n} - \overline{{\mathbf{x}}} \|^{2} - \frac{1}{\sigma^{4}} \mathbb{E}[\mathbf{z}_{n}]^{\mathrm{T}} \mathbf{W}^{\mathrm{T}}(\mathbf{x}_{n} - \overline{{\mathbf{x}}}) - \frac{D}{2 \sigma^{2}} \right\} \end{array}
$$

Setting these equal to zero and re-arranging we obtain (12.56) and (12.57), respectively.

12.17 Setting the derivative of J with respect to $\mu$ to zero gives

$$
0 = - \sum_{n = 1}^{N}(\mathbf{x}_{n} - \boldsymbol{\mu} - \mathbf{W} \mathbf{z}_{n})
$$

from which we obtain

$$
\pmb{\mu} = \frac{1}{N} \sum_{n = 1}^{N} \mathbf{x}_{n} - \frac{1}{N} \sum_{n = 1}^{N} \mathbf{W} \mathbf{z}_{n} = \overline{{\mathbf{x}}} - \mathbf{W} \overline{{\mathbf{z}}}.
$$

The left plot shows the graphical model corresponding to the general mixture of probabilistic PCA. The right plot shows the corresponding model were the parameter of all probabilist PCA models $(\mu,$ <sup>W</sup> and $\sigma^{2})$ are shared across components. In both plots, <sup>s</sup> denotes the K-nomial latent variable that selects mixture components; it is governed by the parameter, π.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/9628e84b182b4e9cd6c27d81dd5413c2be754a8c7f73f16a1f19c2cb7900d5ff.jpg)

Back-substituting into J we obtain

$$
J = \sum_{n = 1}^{N} \|(\mathbf{x}_{n} - \overline{{\mathbf{x}}} - \mathbf{W}(\mathbf{z}_{n} - \overline{{\mathbf{z}}}) \|^{2}.
$$

We now define X to be a matrix of size $N \times D$ whose $n^{\mathrm{th}}$ row is given by the vector ${\bf x}_{n} - \overline{{\bf x}}$ and similarly we define Z to be a matrix of size $D \times M$ whose $n^{\mathrm{th}}$ row is given by the vector ${\mathbf z}_{n} - \overline{{{\mathbf z}}}$ . We can then write J in the form

$$
J = \mathrm{Tr} \left\{\left(\mathbf{X} - \mathbf{ZW}^{\mathrm{T}}\right) \left(\mathbf{X} - \mathbf{ZW}^{\mathrm{T}}\right)^{\mathrm{T}} \right\}.
$$

Differentiating with respect to Z keeping W fixed gives rise to the PCA E-step (12.58). Similarly setting the derivative of J with respect to W to zero with $\left\{{{\bf{z}}_{n}} \right\}$ fixed gives rise to the PCA M-step (12.59).

12.19 To see this we define a rotated latent space vector $\widetilde{\mathbf z} = \mathbf R \mathbf z$ where R is an $M \times M$ orthogonal matrix, and similarly defining a modified factor loading matrix $\widetilde{{\mathbf W}} ={\mathbf W}{\mathbf R}$ Then we note that the latent space distribution $p(\mathbf{z})$ depends only on ${\mathbf z}^{{\mathrm T}}{\mathbf z} = \widetilde{{\mathbf z}}^{{\mathrm T}} \widetilde{{\mathbf z}},$ where we have used $\mathbb{R}^{\mathrm{T}} \mathbb{R} = \mathbf{\bar{I}}$ . Similarly, the conditional distribution of the observed variable $p(\mathbf{x} | \mathbf{z})$ depends only on $\mathbf{W} \mathbf{z} = \widetilde{\mathbf{W}} \widetilde{\mathbf{z}}$ Thus the joint distribution takes the same form for any choice of R. This is reflected in the predictive distribution $p(\mathbf{x})$ which depends on W only through the quantity $\mathbf{W} \mathbf{W}^{\mathrm{T}} = \widetilde{\mathbf{W}} \widetilde{\mathbf{W}}^{\mathrm{T}}$ and hence is also invariant to different choices of R.

12.23 The solution is given in figure 6. The model in which all parameters are shared (left) is not particularly useful, since all mixture components will have identical parameters and the resulting density model will not be any different to one offered by a single PPCA model. Different models would have arisen if only some of the parameters, e.g. the mean $\mu,$ would have been shared.

12.25 Following the discussion of section 12.2, the log likelihood function for this model

can be written as

$$
\begin{array}{c} L(\boldsymbol{\mu}, \mathbf{W}, \boldsymbol{\Phi}) = - \frac{ND}{2} \ln(2 \pi) - \frac{N}{2} \ln | \mathbf{WW}^{\mathrm{T}} + \boldsymbol{\Phi} | \\ - \frac{1}{2} \sum_{n = 1}^{N} \left\{(\mathbf{x}_{n} - \boldsymbol{\mu})^{\mathrm{T}}(\mathbf{WW}^{\mathrm{T}} + \boldsymbol{\Phi})^{- 1}(\mathbf{x}_{n} - \boldsymbol{\mu}) \right\}, \end{array}
$$

where we have used (12.43).

If we consider the log likelihood function for the transformed data set we obtain

$$
\begin{array}{l} L_{\mathbf{A}}(\boldsymbol{\mu}, \mathbf{W}, \boldsymbol{\Phi}) = - \frac{ND}{2} \ln(2 \pi) - \frac{N}{2} \ln | \mathbf{WW}^{\mathrm{T}} + \boldsymbol{\Phi} | \\ - \frac{1}{2} \sum_{n = 1}^{N} \left\{(\mathbf{Ax}_{n} - \boldsymbol{\mu})^{\mathrm{T}}(\mathbf{WW}^{\mathrm{T}} + \boldsymbol{\Phi})^{- 1}(\mathbf{Ax}_{n} - \boldsymbol{\mu}) \right\}.\end{array}
$$

Solving for the maximum likelihood estimator for $\mu$ in the usual way we obtain

$$
\boldsymbol{\mu}_{\mathbf{A}} = \frac{1}{N} \sum_{n = 1}^{N} \mathbf{Ax}_{n} = \mathbf{A} \overline{{\mathbf{x}}} = \mathbf{A} \boldsymbol{\mu}_{\mathrm{ML}}.
$$

Back-substituting into the log likelihood function, and using the definition of the sample covariance matrix (12.3), we obtain

$$
\begin{array}{c} L_{\mathbf{A}}(\boldsymbol{\mu}, \mathbf{W}, \boldsymbol{\Phi}) = - \frac{ND}{2} \ln(2 \pi) - \frac{N}{2} \ln | \mathbf{WW}^{\mathrm{T}} + \boldsymbol{\Phi} | \\ - \frac{1}{2} \sum_{n = 1}^{N} \operatorname{Tr} \left\{(\mathbf{WW}^{\mathrm{T}} + \boldsymbol{\Phi})^{- 1} \mathbf{ASA}^{\mathrm{T}} \right\}.\end{array}
$$

We can cast the final term into the same form as the corresponding term in the original log likelihood function if we first define

$$
\boldsymbol{\Phi}_{\mathbf{A}} = \mathbf{A} \boldsymbol{\Phi}^{- 1} \mathbf{A}^{\mathrm{T}}, \quad \mathbf{W}_{\mathbf{A}} = \mathbf{AW}.
$$

With these definitions the log likelihood function for the transformed data set takes the form

$$
\begin{array}{rl} & L_{\mathbf{A}}(\boldsymbol{\mu}_{\mathbf{A}}, \mathbf{W}_{\mathbf{A}}, \boldsymbol{\Phi}_{\mathbf{A}}) = - \frac{ND}{2} \ln(2 \pi) - \frac{N}{2} \ln | \mathbf{W}_{\mathbf{A}} \mathbf{W}_{\mathbf{A}}^{\mathrm{T}} + \boldsymbol{\Phi}_{\mathbf{A}} | \\ & \qquad - \frac{1}{2} \sum_{n = 1}^{N} \left\{(\mathbf{x}_{n} - \boldsymbol{\mu}_{\mathbf{A}})^{\mathrm{T}}(\mathbf{W}_{\mathbf{A}} \mathbf{W}_{\mathbf{A}}^{\mathrm{T}} + \boldsymbol{\Phi}_{\mathbf{A}})^{- 1}(\mathbf{x}_{n} - \boldsymbol{\mu}_{\mathbf{A}}) \right\} - N \ln | \mathbf{A} |.\end{array}
$$

This takes the same form as the original log likelihood function apart from an additive constant $- \ln | \mathbf{A} |$ . Thus the maximum likelihood solution in the new variables for the transformed data set will be identical to that in the old variables.

We now ask whether specific constraints on Φ will be preserved by this re-scaling. In the case of probabilistic PCA the noise covariance Φ is proportional to the unit matrix and takes the form $\sigma^{2} \mathbf{I}$ . For this constraint to be preserved we require $\mathbf{A} \mathbf{A}^{\mathrm{T}} = \mathbf{I}$ so that A is an orthogonal matrix. This corresponds to a rotation of the coordinate system. For factor analysis $\Phi$ is a diagonal matrix, and this property will be preserved if A is also diagonal since the product of diagonal matrices is again diagonal. This corresponds to an independent re-scaling of the coordinate system. Note that in general probabilistic PCA is not invariant under component-wise re-scaling and factor analysis is not invariant under rotation. These results are illustrated in Figure 7.

12.28 If we assume that the function $y = f(x)$ is strictly monotonic, which is necessary to exclude the possibility for spikes of infinite density in $p(y)$ , we are guaranteed that the inverse function $\dot{x} = f^{- \mathrm{1}}(y)$ exists. We can then use (1.27) to write

$$
p(y) = q \left(f^{- 1}(y)\right) \left| \frac{d f^{- 1}}{d y} \right|.\tag{162}
$$

Since the only restriction on $f$ is that it is monotonic, it can distribute the probability mass over x arbitrarily over $y.$ . This is illustrated in Figure 1 on page $^{8,}$ as a part of Solution 1.4. From (162) we see directly that

$$
| f^{\prime}(x) | = \frac{q(x)}{p(f(x))}.
$$

12.29 If $z_{1}$ and $z_{2}$ are independent, then

$$
\begin{array}{rcl} \operatorname{cov}[z_{1}, z_{2}] & = & \iint(z_{1} - \bar{z}_{1})(z_{2} - \bar{z}_{2}) p(z_{1}, z_{2}) d z_{1} d z_{2} \\ & = & \iint(z_{1} - \bar{z}_{1})(z_{2} - \bar{z}_{2}) p(z_{1}) p(z_{2}) d z_{1} d z_{2} \\ & = & \int(z_{1} - \bar{z}_{1}) p(z_{1}) d z_{1} \int(z_{2} - \bar{z}_{2}) p(z_{2}) d z_{2} \\ & = & 0, \end{array}
$$

where

$$
\bar{z}_{i} = \mathbb{E}[z_{i}] = \int z_{i} p(z_{i}) d z_{i}.
$$

NOTE: In the first printing of PRML, this exercise contained two mistakes. In the second half of the exercise, we require that $y_{1}$ is symmetrically distributed around 0, not just that $- 1 \leqslant y_{1} \leqslant 1$ . Moreover, $y_{2} = y_{1}^{2}$ (not $y_{2} = y_{2}^{2})$ .

Then we have

$$
p(y_{2} | y_{1}) = \delta(y_{2} - y_{1}^{2}),
$$

![Figure 7](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p601-800/images/9085e95c3586989844159a6c06e6aeaab89735fe0f198dc71fe3b0c55803d941.jpg)  
Figure 7 Factor analysis is covariant under a componentwise re-scaling of the data variables (top plots), while PCA and probabilistic PCA are covariant under rotations of the data space coordinates (lower plots).

i.e., a spike of probability mass one at $y_{1}^{2}$ , which is clearly dependent on $y_{1}$ . With $\bar{y}_{i}$ defined analogously to $\bar{z}_{i}$ above, we get

$$
\begin{array}{rcl} \operatorname{cov}[y_{1}, y_{2}] & = & \iint(y_{1} - \bar{y}_{1})(y_{2} - \bar{y}_{2}) p(y_{1}, y_{2}) d y_{1} d y_{2} \\ & = & \iint y_{1}(y_{2} - \bar{y}_{2}) p(y_{2} | y_{1}) p(y_{1}) d y_{1} d y_{2} \\ & = & \int(y_{1}^{3} - y_{1} \bar{y}_{2}) p(y_{1}) d y_{1} \\ & = & 0, \end{array}
$$

where we have used the fact that all odd moments of $y_{1}$ will be zero, since it is symmetric around zero and hence $\bar{y}_{1}$

## Chapter 13 Sequential Data

13.1 Since the arrows on the path from $x_{m}$ to $x_{n},$ with $m < n - 1$ , will meet head-to-tail at $x_{n - 1}$ , which is in the conditioning set, all such paths are blocked by $x_{n - 1}$ and hence (13.3) holds.

The same argument applies in the case depicted in Figure 13.4, with the modification that $m < n - 2$ and that paths are blocked by $x_{n - 1} \{\mathrm{or}} \x_{n - 2}$

13.4 The learning of w would follow the scheme for maximum learning described in Section 13.2.1, with w replacing φ. As discussed towards the end of Section 13.2.1, the precise update formulae would depend on the form of regression model used and how it is being used.

The most obvious situation where this would occur is in a HMM similar to that depicted in Figure 13.18, where the emmission densities not only depends on the latent variable z, but also on some input variable u. The regression model could then be used to map u to x, depending on the state of the latent variable z.

Note that when a nonlinear regression model, such as a neural network, is used, the M-step for w may not have closed form.

13.8 Only the final term of $Q(\theta, \theta^{\mathrm{old}}$ given by (13.17) depends on the parameters of the emission model. For the multinomial variable x, whose D components are all zero except for a single entry of 1,

$$
\sum_{n = 1}^{N} \sum_{k = 1}^{K} \gamma(z_{nk}) \ln p(\mathbf{x}_{n} | \phi_{k}) = \sum_{n = 1}^{N} \sum_{k = 1}^{K} \gamma(z_{nk}) \sum_{i = 1}^{D} x_{ni} \ln \mu_{ki}.
$$

Now when we maximize with respect to $\mu_{ki}$ we have to take account of the constraints that, for each value of k the components of $\mu_{ki}$ must sum to one. We therefore introduce Lagrange multipliers $\{\lambda_{k}\}$ and maximize the modified function given

by

$$
\sum_{n = 1}^{N} \sum_{k = 1}^{K} \gamma(z_{nk}) \sum_{i = 1}^{D} x_{ni} \ln \mu_{ki} + \sum_{k = 1}^{K} \lambda_{k} \left(\sum_{i = 1}^{D} \mu_{ki} - 1\right).
$$

Setting the derivative with respect to $\mu_{ki}$ to zero we obtain

$$
0 = \sum_{n = 1}^{N} \gamma(z_{nk}) \frac{x_{ni}}{\mu_{ki}} + \lambda_{k}.
$$

Multiplying through by $\mu_{ki}.$ , summing over $i,$ and making use of the constraint on $\mu_{ki}$ together with the result $\textstyle \sum_{i} x_{ni} = 1$ we have

$$
\lambda_{k} = - \sum_{n = 1}^{N} \gamma(z_{nk}).
$$

Finally, back-substituting for $\lambda_{k}$ and solving for $\mu_{ki}$ we again obtain (13.23).

Similarly, for the case of a multivariate Bernoulli observed variable x whose D components independently take the value 0 or 1, using the standard expression for the multivariate Bernoulli distribution we have

$$
\begin{array}{l} \sum_{n = 1}^{N} \sum_{k = 1}^{K} \gamma(z_{nk}) \ln p(\mathbf{x}_{n} | \phi_{k}) \\ \qquad = \sum_{n = 1}^{N} \sum_{k = 1}^{K} \gamma(z_{nk}) \sum_{i = 1}^{D} \left\{x_{ni} \ln \mu_{ki} +(1 - x_{ni}) \ln(1 - \mu_{ki}) \right\}.\end{array}
$$

Maximizing with respect to $\mu_{ki}$ we obtain

$$
\mu_{ki} = \frac{\sum_{n = 1}^{N} \gamma(z_{nk}) x_{ni}}{\sum_{n = 1}^{N} \gamma(z_{nk})}
$$

which is equivalent to (13.23).

13.9 We can verify all these independence properties using d-separation by refering to Figure 13.5.

(13.24) follows from the fact that arrows on paths from any of $\mathbf{x}_{1}, \ldots, \mathbf{x}_{n}$ to any of $\mathbf{x}_{n + 1}, \ldots, \mathbf{x}_{N}$ meet head-to-tail or tail-to-tail at $\mathbf{z}_{n}$ , which is in the conditioning set. (13.25) follows from the fact that arrows on paths from any of $\mathbf{x}_{1}, \ldots, \mathbf{x}_{n - 1}$ to ${\bf x}_{n}$ meet head-to-tail at $\mathbf{z}_{n}.$ , which is in the conditioning set.

(13.26) follows from the fact that arrows on paths from any of $\mathbf{x}_{1}, \ldots, \mathbf{x}_{n - 1}$ to $\mathbf{z}_{n}$ meet head-to-tail or tail-to-tail at $\mathbf{z}_{n - 1}$ , which is in the conditioning set.

(13.27) follows from the fact that arrows on paths from $\mathbf{z}_{n}$ to any of $\mathbf{x}_{n + 1}, \ldots, \mathbf{x}_{N}$ meet head-to-tail at $\mathbf{z}_{n + 1}$ , which is in the conditioning set.

(13.28) follows from the fact that arrows on paths from $\mathbf{x}_{n + 1}$ to any of $\mathbf{x}_{n + 2}, \ldots, \mathbf{x}_{N}$ to meet tail-to-tail at $\mathbf{z}_{n + 1}$ , which is in the conditioning set.

(13.29) follows from (13.24) and the fact that arrows on paths from any of $\mathbf{x}_{1}, \ldots.$ $\mathbf{x}_{n - 1} ~ \mathrm{to} ~ \mathbf{x}_{n}$ meet head-to-tail or tail-to-tail at $\mathbf{z}_{n - 1}$ , which is in the conditioning set.

(13.30) follows from the fact that arrows on paths from any of $\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}$ to $\mathbf{x}_{N + 1}$ meet head-to-tail at $\mathbf{z}_{N + 1}$ , which is in the conditioning set.

(13.31) follows from the fact that arrows on paths from any of $\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}$ to $\mathbf{z}_{N + 1}$ meet head-to-tail or tail-to-tail at $\mathbf{z}_{N}$ , which is in the conditioning set.

13.13 Using (8.64), we can rewrite (13.50) as

$$
\alpha(\mathbf{z}_{n}) = \sum_{\mathbf{z}_{1}, \dots, \mathbf{z}_{n - 1}} F_{n}(\mathbf{z}_{n}, \{\mathbf{z}_{1}, \dots, \mathbf{z}_{n - 1}\}),\tag{163}
$$

where $F_{n}(\cdot)$ is the product of all factors connected to $\mathbf{z}_{n}$ via $f_{n}$ , including $f_{n}$ itself (see Figure 13.15), so that

$$
F_{n}(\mathbf{z}_{n}, \{\mathbf{z}_{1}, \dots, \mathbf{z}_{n - 1}\}) = h(\mathbf{z}_{1}) \prod_{i = 2}^{n} f_{i}(\mathbf{z}_{i}, \mathbf{z}_{i - 1}),\tag{164}
$$

where we have introduced $h(\mathbf{z}_{1})$ and $f_{i}(\mathbf{z}_{i}, \mathbf{z}_{i - 1})$ from (13.45) and (13.46), respectively. Using the corresponding r.h.s. definitions and repeatedly applying the product rule, we can rewrite (164) as

$$
F_{n}(\mathbf{z}_{n}, \{\mathbf{z}_{1}, \dots, \mathbf{z}_{n - 1}\}) = p(\mathbf{x}_{1}, \dots, \mathbf{x}_{n}, \mathbf{z}_{1}, \dots, \mathbf{z}_{2}).
$$

Applying the sum rule, summing over $\mathbf{z}_{1}, \ldots, \mathbf{z}_{n - 1}$ as on the r.h.s. of (163), we obtain (13.34).

13.17 The emission probabilities over observed variables ${\bf x}_{n}$ are absorbed into the corresponding factors, $f_{n},$ analogously to the way in which Figure 13.14 was transformed into Figure 13.15. The factors then take the form

$$
\begin{array}{rcl} h(\mathbf{z}_{1}) & = & p(\mathbf{z}_{1} | \mathbf{u}_{1}) p(\mathbf{x}_{1} | \mathbf{z}_{1}, \mathbf{u}_{1}) \\ f_{n}(\mathbf{z}_{n - 1}, \mathbf{z}_{n}) & = & p(\mathbf{z}_{n} | \mathbf{z}_{n - 1}, \mathbf{u}_{n}) p(\mathbf{x}_{n} | \mathbf{z}_{n}, \mathbf{u}_{n}).\end{array}
$$

13.19 Since the joint distribution over all variables, latent and observed, is Gaussian, we can maximize w.r.t. any chosen set of variables. In particular, we can maximize w.r.t. all the latent variables jointly or maximize each of the marginal distributions separately. However, from (2.98), we see that the resulting means will be the same in both cases and since the mean and the mode coincide for the Gaussian, maximizing w.r.t. to latent variables jointly and individually will yield the same result.

13.20 Making the following substitions from the l.h.s. of (13.87),

$$
\mathbf{x} \Rightarrow \mathbf{z}_{n - 1} \quad \boldsymbol{\mu} \Rightarrow \boldsymbol{\mu}_{n - 1} \quad \boldsymbol{\Lambda}^{- 1} \Rightarrow \mathbf{V}_{n - 1}
$$

$$
\mathbf{y} \Rightarrow \mathbf{z}_{n} \quad \mathbf{A} \Rightarrow \mathbf{A} \quad \mathbf{b} \Rightarrow \mathbf{0} \quad \mathbf{L}^{- 1} \Rightarrow \boldsymbol{\Gamma},
$$

in (2.113) and (2.114), (2.115) becomes

$$
p(\mathbf{z}_{n}) = \mathcal{N}(\mathbf{z}_{n} | \mathbf{A} \boldsymbol{\mu}_{n - 1}, \boldsymbol{\Gamma} + \mathbf{AV}_{n - 1} \mathbf{A}^{\mathrm{T}}),
$$

as desired.

13.22 Using (13.76), (13.77) and (13.84), we can write (13.93), for the case $n = 1$ , as

$$
c_{1} \mathcal{N}(\mathbf{z}_{1} | \boldsymbol{\mu}_{1}, \mathbf{V}_{1}) = \mathcal{N}(\mathbf{z}_{1} | \boldsymbol{\mu}_{0}, \mathbf{V}_{0}) \mathcal{N}(\mathbf{x}_{1} | \mathbf{Cz}_{1}, \boldsymbol{\Sigma}).
$$

The r.h.s. define the joint probability distribution over $\mathbf{x}_{1}$ and $\mathbf{z}_{1}$ in terms of a conditional distribution over $\mathbf{x}_{1}$ given $\mathbf{z}_{1}$ and a distribution over $\mathbf{z}_{1}$ , corresponding to (2.114) and (2.113), respectively. What we need to do is to rewrite this into a conditional distribution over $\mathbf{z}_{1}$ given $\mathbf{x}_{1}$ and a distribution over $\mathbf{x}_{1}$ , corresponding to (2.116) and (2.115), respectively.

If we make the substitutions

$$
\mathbf{x} \Rightarrow \mathbf{z}_{1} \quad \boldsymbol{\mu} \Rightarrow \boldsymbol{\mu}_{0} \quad \boldsymbol{\Lambda}^{- 1} \Rightarrow \mathbf{V}_{0}
$$

$$
\mathbf{y} \Rightarrow \mathbf{x}_{1} \quad \mathbf{A} \Rightarrow \mathbf{C} \quad \mathbf{b} \Rightarrow \mathbf{0} \quad \mathbf{L}^{- 1} \Rightarrow \boldsymbol{\Sigma},
$$

in (2.113) and (2.114), (2.115) directly gives us the r.h.s. of (13.96).

13.24 This extension can be embedded in the existing framework by adopting the following modifications:

$$
\boldsymbol{\mu}_{0}^{\prime} = \left[\begin{array}{c} \boldsymbol{\mu}_{0} \\ 1 \end{array} \right] \quad \mathbf{V}_{0}^{\prime} = \left[\begin{array}{cc} \mathbf{V}_{0} & \mathbf{0} \\ \mathbf{0} & 0 \end{array} \right] \quad \boldsymbol{\Gamma}^{\prime} = \left[\begin{array}{cc} \boldsymbol{\Gamma} & \mathbf{0} \\ \mathbf{0} & 0 \end{array} \right]
$$

$$
\mathbf{A}^{\prime} = \left[\begin{array}{cc} \mathbf{A} & \mathbf{a} \\ \mathbf{0} & 1 \end{array} \right] \quad \mathbf{C}^{\prime} = \left[\begin{array}{cc} \mathbf{C} & \mathbf{cc} \end{array} \right].
$$

This will ensure that the constant terms a and c are included in the corresponding Gaussian means for $\mathbf{z}_{n}$ and ${\bf x}_{n}$ for $n = 1, \ldots, N$

Note that the resulting covariances for ${\mathbf{z}}_{n}, \mathbf{V}_{n},$ will be singular, as will the corresponding prior covariances, ${\bf P}_{n - 1}$ . This will, however, only be a problem where these matrices need to be inverted, such as in (13.102). These cases must be handled separately, using the ‘inversion’ formula

$$
(\mathbb{P}_{n - 1}^{\prime})^{- 1} = \left[\begin{array}{cc} \mathbb{P}_{n - 1}^{- 1} & \mathbf{0} \\ \mathbf{0} & 0 \end{array} \right],
$$

nullifying the contribution from the (non-existent) variance of the element in $\mathbf{z}_{n}$ that accounts for the constant terms a and c.

13.27 NOTE: In the first printing of PRML, this exercise should have made explicit the assumption that C = I in (13.86).

From (13.86), it is easily seen that if Σ goes to 0, the posterior over $\mathbf{z}_{n}$ will become completely determined by ${\bf x}_{n},$ since the first factor on the r.h.s. of (13.86), and hence also the l.h.s., will collapse to a spike at ${\bf x}_{n} ={\bf C}{\bf z}_{n}$

13.32 We can write the expected complete log-likelihood, given by the equation after (13.109), as a function of $\pmb{\mu}_{0}$ and $\mathbf{V}_{0}$ , as follows:

$$
\begin{array}{rl} & Q(\pmb{\theta}, \pmb{\theta}^{\mathrm{old}}) = - \frac{1}{2} \ln | \mathbf{V}_{0} | \\ & \qquad - \frac{1}{2} \mathbb{E}_{\mathbf{Z} | \pmb{\theta}^{\mathrm{old}}} \left[\mathbf{z}_{1}^{\mathrm{T}} \mathbf{V}_{0}^{- 1} \mathbf{z}_{1} - \mathbf{z}_{1}^{\mathrm{T}} \mathbf{V}_{0}^{- 1} \pmb{\mu}_{0} - \pmb{\mu}_{0}^{\mathrm{T}} \mathbf{V}_{0}^{- 1} \mathbf{z}_{1} + \pmb{\mu}_{0}^{\mathrm{T}} \mathbf{V}_{0}^{- 1} \pmb{\mu}_{0} \right] \\ = & \frac{1}{2} \left(\ln | \mathbf{V}_{0}^{- 1} | - \mathrm{Tr} \bigg[\mathbf{V}_{0}^{- 1} \mathbb{E}_{\mathbf{Z} | \pmb{\theta}^{\mathrm{old}}} \left[\mathbf{z}_{1} \mathbf{z}_{1}^{\mathrm{T}} - \mathbf{z}_{1} \pmb{\mu}_{0}^{\mathrm{T}} - \pmb{\mu}_{0} \mathbf{z}_{1}^{\mathrm{T}} + \pmb{\mu}_{0} \pmb{\mu}_{0}^{\mathrm{T}} \right] \bigg]\right).\end{array}\tag{165}
$$

(166)

where we have used (C.13) and omitted terms independent of $\pmb{\mu}_{0}$ and $\mathbf{V}_{0}$ .

From (165), we can calculate the derivative w.r.t. $\pmb{\mu}_{0}$ using (C.19), to get

$$
\frac{\partial Q}{\partial \boldsymbol{\mu}_{0}} = 2 \mathbf{V}_{0}^{- 1} \boldsymbol{\mu}_{0} - 2 \mathbf{V}_{0}^{- 1} \mathbb{E}[\mathbf{z}_{1}].
$$

Setting this to zero and rearranging, we immediately obtain (13.110).

Using (166), (C.24) and (C.28), we can evaluate the derivatives w.r.t. $\mathbf{V}_{0}^{- 1}$

$$
\frac{\partial Q}{\partial \mathbf{V}_{0}^{- 1}} = \frac{1}{2} \left(\mathbf{V}_{0} - \mathbb{E}[\mathbf{z}_{1} \mathbf{z}_{1}^{\mathrm{T}}] - \mathbb{E}[\mathbf{z}_{1}] \boldsymbol{\mu}_{0}^{\mathrm{T}} - \boldsymbol{\mu}_{0} \mathbb{E}[\mathbf{z}_{1}^{\mathrm{T}}] + \boldsymbol{\mu}_{0} \boldsymbol{\mu}_{0}^{\mathrm{T}}\right).
$$

Setting this to zero, rearrangning and making use of (13.110), we get (13.111).

## Chapter 14 Combining Models

14.1 The required predictive distribution is given by

$$
\begin{array}{l} p(\mathbf{t} | \mathbf{x}, \mathbf{X}, \mathbf{T}) = \\ \sum_{h} p(h) \sum_{\mathbf{z}_{h}} p(\mathbf{z}_{h}) \int p(\mathbf{t} | \mathbf{x}, \boldsymbol{\theta}_{h}, \mathbf{z}_{h}, h) p(\boldsymbol{\theta}_{h} | \mathbf{X}, \mathbf{T}, h) d \boldsymbol{\theta}_{h}, \end{array}\tag{167}
$$

where

$$
\begin{array}{lll} p(\boldsymbol{\theta}_{h} | \mathbf{X}, \mathbf{T}, h) & = & \frac{p(\mathbf{T} | \mathbf{X}, \boldsymbol{\theta}_{h}, h) p(\boldsymbol{\theta}_{h} | h)}{p(\mathbf{T} | \mathbf{X}, h)} \\ & \propto & p(\boldsymbol{\theta} | h) \prod_{n = 1}^{N} p(\mathbf{t}_{n} | \mathbf{x}_{n}, \boldsymbol{\theta}, h) \\ & = & p(\boldsymbol{\theta} | h) \prod_{n = 1}^{N} \left(\sum_{\mathbf{z}_{nh}} p(\mathbf{t}_{n}, \mathbf{z}_{nh} | \mathbf{x}_{n}, \boldsymbol{\theta}, h)\right) \end{array}\tag{168}
$$

The integrals and summations in (167) are examples of Bayesian averaging, accounting for the uncertainty about which model, $h,$ is the correct one, the value of the corresponding parameters, $\theta_{h},$ , and the state of the latent variable, $\mathbf{z}_{h}$ . The summation in (168), on the other hand, is an example of the use of latent variables, where different data points correspond to different latent variable states, although all the data are assumed to have been generated by a single model, h.

14.3 We start by rearranging the r.h.s. of (14.10), by moving the factor $1 / M$ inside the sum and the expectation operator outside the sum, yielding

$$
\mathbb{E}_{\mathbf{x}} \left[\sum_{m = 1}^{M} \frac{1}{M} \epsilon_{m}(\mathbf{x})^{2} \right].
$$

If we then identify $\epsilon_{m}(\mathbf{x})$ and $1 / M$ with $x_{i}$ and $\lambda_{i}$ in (1.115), respectively, and take $f(x) = x^{2}$ , we see from (1.115) that

$$
\left(\sum_{m = 1}^{M} \frac{1}{M} \epsilon_{m}(\mathbf{x})\right)^{2} \leqslant \sum_{m = 1}^{M} \frac{1}{M} \epsilon_{m}(\mathbf{x})^{2}.
$$

Since this holds for all values of $\mathbf{x},$ it must also hold for the expectation over $\mathbf{x},$ proving (14.54).

14.5 To prove that (14.57) is a sufficient condition for (14.56) we have to show that (14.56) follows from (14.57). To do this, consider a fixed set of $y_{m}(\mathbf x)$ and imagine varying the $\alpha_{m}$ over all possible values allowed by (14.57) and consider the values taken by $y_{\mathrm{COM}}(\mathbf{x})$ as a result. The maximum value of $y_{\mathrm{COM}}(\mathbf{x})$ occurs when $\alpha_{k} = 1$ where $y_{k}(\mathbf x) \geqslant y_{m}(\mathbf x)$ for m $\neq k$ , and hence all $\alpha_{m} = 0$ for m $\neq k.$ . An analogous result holds for the minimum value. For other settings of $_\alpha$ ,

$$
y_{\min}(\mathbf{x}) < y_{\operatorname{COM}}(\mathbf{x}) < y_{\max}(\mathbf{x}),
$$

since $y_{\mathrm{COM}}(\mathbf{x})$ is a convex combination of points, $y_{m}(\mathbf x)$ , such that

$$
\forall m: y_{\min}(\mathbf{x}) \leqslant y_{m}(\mathbf{x}) \leqslant y_{\max}(\mathbf{x}).
$$

Thus, (14.57) is a sufficient condition for (14.56).

Showing that (14.57) is a necessary condition for (14.56) is equivalent to showing that (14.56) is a sufficient condition for (14.57). The implication here is that if (14.56) holds for any choice of values of the committee members $\{y_{m}(\mathbf{x})\}$ then (14.57) will be satisfied. Suppose, without loss of generality, that $\alpha_{k}$ is the smallest of the α values, i.e. $\alpha_{k} \leqslant \alpha_{m}$ for k $\neq m$ . Then consider $y_{k}(\mathbf{x}) = 1$ , together with $y_{m}(\mathbf{x}) = 0$ for all m $\neq k$ . Then $y_{\mathrm{min}}(\mathbf x) = 0$ while $y_{\mathrm{COM}}(\mathbf{x}) = \alpha_{k}$ and hence from (14.56) we obtain $\alpha_{k} \geqslant 0$ . Since $\alpha_{k}$ is the smallest of the α values it follows that all of the coefficients must satisfy $\alpha_{k} \geqslant 0$ . Similarly, consider the case in which $y_{m}(\mathbf x) = 1$ for all m. Then $y_{\mathrm{min}}(\mathbf x) = y_{\mathrm{max}}(\mathbf x) = 1$ , while $\begin{array}{r}{y_{\mathrm{COM}}(\mathbf{x}) = \sum_{m} \alpha_{m}} \end{array}$ From (14.56) it then follows that $\textstyle \sum_{m} \alpha_{m} = 1$ , as required.

## 14.6 If we differentiate (14.23) w.r.t. $\alpha_{m}$ we obtain

$$
\frac{\partial E}{\partial \alpha_{m}} = \frac{1}{2} \left((e^{\alpha_{m} / 2} + e^{- \alpha_{m} / 2}) \sum_{n = 1}^{N} w_{n}^{(m)} I(y_{m}(\mathbf{x}_{n}) \neq t_{n}) - e^{- \alpha_{m} / 2} \sum_{n = 1}^{N} w_{n}^{(m)}\right).
$$

Setting this equal to zero and rearranging, we get

$$
\frac{\sum_{n} w_{n}^{(m)} I(y_{m}(\mathbf{x}_{n}) \neq t_{n})}{\sum_{n} w_{n}^{(m)}} = \frac{e^{- \alpha_{m} / 2}}{e^{\alpha_{m} / 2} + e^{- \alpha_{m} / 2}} = \frac{1}{e^{\alpha_{m}} + 1}.
$$

Using (14.16), we can rewrite this as

$$
\frac{1}{e^{\alpha_{m}} + 1} = \epsilon_{m},
$$

which can be further rewritten as

$$
e^{\alpha_{m}} = \frac{1 - \epsilon_{m}}{\epsilon_{m}},
$$

from which (14.17) follows directly.

14.9 The sum-of-squares error for the additive model of (14.21) is defined as

$$
E = \frac{1}{2} \sum_{n = 1}^{N}(t_{n} - f_{m}(\mathbf{x}_{n}))^{2}.
$$

Using (14.21), we can rewrite this as

$$
\frac{1}{2} \sum_{n = 1}^{N}(t_{n} - f_{m - 1}(\mathbf{x}_{n}) - \frac{1}{2} \alpha_{m} y_{m}(\mathbf{x}))^{2},
$$

where we recognize the two first terms inside the square as the residual from the $(m - 1)$ -th model. Minimizing this error w.r.t. $y_{m}(\mathbf{x})$ will be equivalent to fitting $y_{m}(\mathbf x)$ to the (scaled) residuals.

14.13 Starting from the mixture distribution in (14.34), we follow the same steps as for mixtures of Gaussians, presented in Section 9.2. We introduce a K-nomial latent variable, z, such that the joint distribution over z and t equals

$$
p(t, \mathbf{z}) = p(t | \mathbf{z}) p(\mathbf{z}) = \prod_{k = 1}^{K} \left(\mathcal{N} \big(t \mid \mathbf{w}_{k}^{\mathrm{T}} \phi, \beta^{- 1} \big) \pi_{k}\right)^{z_{k}}.
$$

Given a set of observations, $\{(t_{n}, \phi_{n})\}_{n = 1}^{N}$ , we can write the complete likelihood over these observations and the corresponding $\mathbf{z}_{1}, \ldots, \mathbf{z}_{N}$ , as

$$
\prod_{n = 1}^{N} \prod_{k = 1}^{K} \left(\pi_{k} \mathcal{N}(t_{n} | \mathbf{w}_{k}^{\mathrm{T}} \boldsymbol{\phi}_{n}, \beta^{- 1})\right)^{z_{nk}}.
$$

Taking the logarithm, we obtain (14.36).

14.15 The predictive distribution from the mixture of linear regression models for a new input feature vector, ${\widehat{\phi}},$ is obtained from (14.34), with $\phi$ replaced by ${\widehat{\phi}}.$ Calculating the expectation of t under this distribution, we obtain

$$
\mathbb{E}[t | \widehat{\boldsymbol{\phi}}, \boldsymbol{\theta}] = \sum_{k = 1}^{K} \pi_{k} \mathbb{E}[t | \widehat{\boldsymbol{\phi}}, \mathbf{w}_{k}, \beta].
$$

Depending on the parameters, this expectation is potentially K-modal, with one mode for each mixture component. However, the weighted combination of these modes output by the mixture model may not be close to any single mode. For example, the combination of the two modes in the left panel of Figure 14.9 will end up in between the two modes, a region with no signicant probability mass.

14.17 If we define $\psi_{k}(t | \mathbf x)$ in (14.58) as

$$
\psi_{k}(t | \mathbf{x}) = \sum_{m = 1}^{M} \lambda_{mk} \phi_{mk}(t | \mathbf{x}),
$$

we can rewrite (14.58) as

$$
\begin{array}{rcl} p(t | \mathbf{x}) & = & \sum_{k = 1}^{K} \pi_{k} \sum_{m = 1}^{M} \lambda_{mk} \phi_{mk}(t | \mathbf{x}) \\ & = & \sum_{k = 1}^{K} \sum_{m = 1}^{M} \pi_{k} \lambda_{mk} \phi_{mk}(t | \mathbf{x}).\end{array}
$$

By changing the indexation, we can write this as

$$
p(t | \mathbf{x}) = \sum_{l = 1}^{L} \eta_{l} \phi_{l}(t | \mathbf{x}),
$$

Figure 8 Left: an illustration of a hierarchical mixture model, where the input dependent mixing coefficients are determined by linear logistic models associated with interior nodes; the leaf nodes correspond to local (conditional) density models. Right: a possible division of the input space into regions where different mixing coefficients dominate, under the model illustrated left.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/pattern-recognition-machine-learning/parts/p801-803/images/094b28b42dafe6278503bbd679ffde08db3afcfaf1bde80ef012a0080e1328dc.jpg)

where $L = KM, l =(k - 1) M + m, \eta_{l} = \pi_{k} \lambda_{mk}$ and $\phi_{l}(\cdot) ~ = ~ \phi_{mk}(\cdot)$ . By construction, $\eta_{l} \geqslant 0$ and $\textstyle \sum_{l = 1}^{L} \eta_{l} = 1$

Note that this would work just as well if $\pi_{k}$ and $\lambda_{mk}$ were to be dependent on x, as long as they both respect the constraints of being non-negative and summing to 1 for every possible value of x.

Finally, consider a tree-structured, hierarchical mixture model, as illustrated in the left panel of Figure 8. On the top (root) level, this is a mixture with two components. The mixing coefficients are given by a linear logistic regression model and hence are input dependent. The left sub-tree correspond to a local conditional density model, $\psi_{1}(t | \mathbf{x})$ In the right sub-tree, the structure from the root is replicated, with the difference that both sub-trees contain local conditional density models, $\psi_{2}(t | \mathbf{x})$ and $\psi_{3}(t | \mathbf{x})$

We can write the resulting mixture model on the form (14.58) with mixing coefficients

$$
\begin{array}{rcl} \pi_{1}(\mathbf{x}) & = & \sigma(\mathbf{v}_{1}^{\mathrm{T}} \mathbf{x}) \\ \pi_{2}(\mathbf{x}) & = &(1 - \sigma(\mathbf{v}_{1}^{\mathrm{T}} \mathbf{x})) \sigma(\mathbf{v}_{2}^{\mathrm{T}} \mathbf{x}) \\ \pi_{3}(\mathbf{x}) & = &(1 - \sigma(\mathbf{v}_{1}^{\mathrm{T}} \mathbf{x}))(1 - \sigma(\mathbf{v}_{2}^{\mathrm{T}} \mathbf{x})), \end{array}
$$

where $\sigma(\cdot)$ is defined in (4.59) and $\mathbf{v}_{1}$ and $\mathbf{v}_{2}$ are the parameter vectors of the logistic regression models. Note that $\pi_{1}(\mathbf{x})$ is independent of the value of $\mathbf{v}_{2}.$ . This would not be the case if the mixing coefficients were modelled using a single level softmax model,

$$
\pi_{k}(\mathbf{x}) = \frac{e^{\mathbf{u}_{k}^{\mathrm{T}} \mathbf{x}}}{\sum_{j}^{3} e^{\mathbf{u}_{j}^{\mathrm{T}} \mathbf{x}}},
$$

where the parameters $\mathbf{u}_{k}$ , corresponding to $\pi_{k}({\bf x})$ , will also affect the other mixing coeffiecients, $\pi_{j \neq k}(\mathbf{x})$ , through the denominator. This gives the hierarchical model different properties in the modelling of the mixture coefficients over the input space, as compared to a linear softmax model. An example is shown in the right panel of

Figure 8, where the red lines represent borders of equal mixing coefficients in the input space. These borders are formed from two straight lines, corresponding to the two logistic units in the left panel of 8. A corresponding division of the input space by a softmax model would involve three straight lines joined at a single point, looking, e.g., something like the red lines in Figure 4.3 in PRML; note that a linear three-class softmax model could not implement the borders show in right panel of Figure 8.


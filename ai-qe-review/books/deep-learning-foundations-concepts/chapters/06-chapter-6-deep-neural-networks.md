---
title: "Chapter 6 \u2014 Deep Neural Networks"
book: "Deep Learning: Foundations and Concepts"
book_slug: deep-learning-foundations-concepts
course: deep-learning
chapter_number: 6
citekey: bishop2023deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-foundations-concepts/reading.md"
source_line_start: 5297
source_line_end: 6092
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 37
source_empty_image_alt: 37
non_semantic_image_alt: 34
caption_derived_image_alt: 3
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: true
  source_control_characters: 5
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 6 — Deep Neural Networks

> [[../README|本书目录]] · [[05-chapter-5-single-layer-networks-classification|上一章]] · [[07-chapter-7-gradient-descent|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning: Foundations and Concepts（bishop2023deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-foundations-concepts/reading.md)，源行 5297–6092。
> - 本章保留 37 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 5；PDF-confirmed exercise difficulty marker (PDF p.222) × 2；PDF-confirmed exercise difficulty marker (PDF p.225) × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 6.1. Limitations of Fixed Basis Functions

Linear basis function models for classification are based on linear combinations of basis functions $\phi_{j}(\mathbf{x})$ and take the form

$$
y(\mathbf x, \mathbf w) = f \left(\sum_{j = 1}^{M} w_{j} \phi_{j}(\mathbf x) + w_{0} \right)\tag{6.1}
$$

where $f(\cdot)$ is a nonlinear output activation function. Linear models for regression take the same form but with ${\bar{f}}(\cdot)$ replaced by the identity. These models allow for an arbitrary set of nonlinear basis functions $\{\phi_{i}(\mathbf{x})\}$ , and because of the generality of these basis functions, such models can in principle provide a solution to any regression or classification problem. This is true in a trivial sense in that if one of the basis functions corresponds to the desired input-to-output transformation, then the learnable linear layer simply has to copy the value of this basis function to the output of the model.

More generally, we would expect that a sufficiently large and rich set of basis functions would allow any desired function to be approximated to arbitrary accuracy. It would seem therefore that such linear models constitute a general purpose framework for solving problems in machine learning. Unfortunately, there are some significant shortcomings with linear models, which arise from the assumption that the basis functions $\phi_{j}(\mathbf{x})$ are fixed and independent of the training data. To understand these limitations, we start by looking at the behaviour of linear models as the number of input variables is increased.

## 6.1.1 The curse of dimensionality

Consider a simple regression model for a single input variable given by a polynomial of order M in the form

$$
y(x, \mathbf{w}) = w_{0} + w_{1} x + w_{2} x^{2} +...+ w_{M} x^{M}\tag{6.2}
$$

and let us see what happens if we increase the number of inputs. If we have D input variables $\{x_{1}, \ldots, x_{D}\}$ , then a general polynomial with coefficients up to order 3

sepal length  
Figure 6.1 Plot of the Iris data in which red, green, and blue points denote three species of iris flower and the axes represent measurements of the length and width of the sepal, respectively. Our goal is to classify a new test point such as the one denoted by <sup>×</sup>.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/ffbe89c240387106724c4585f240c3a9b846176e4f9aa2241221cbbadbcd558c.jpg)

would take the form

$$
y(\mathbf{x}, \mathbf{w}) = w_{0} + \sum_{i = 1}^{D} w_{i} x_{i} + \sum_{i = 1}^{D} \sum_{j = 1}^{D} w_{ij} x_{i} x_{j} + \sum_{i = 1}^{D} \sum_{j = 1}^{D} \sum_{k = 1}^{D} w_{ijk} x_{i} x_{j} x_{k}.\tag{6.3}
$$

As D increases, the growth in the number of independent coefficients is $\mathcal{O}(D^{3})$ whereas for a polynomial of order $M.$ , the growth in the number of coefficients is $\mathcal{O}(D^{M})$ (Bishop, 2006). We see that in spaces of higher dimensionality, polynomials can rapidly become unwieldy and of little practical utility.

The severe difficulties that can arise in spaces of many dimensions is sometimes called the curse $of$ dimensionality (Bellman, 1961). It is not limited to polynomial regression but is in fact quite general. Consider the use of linear models for solving classification problems. Figure 6.1 shows a plot of data from the Iris data set comprising 50 observations taken from each of three species of iris flowers. Each observation has four variables representing measurements of the sepal length, sepal width, petal length, and petal width. For this illustration, we consider only the sepal length and sepal width variables. Given these 150 observations as training data, our goal is to classify a new test point, such as the one denoted by the cross in Figure 6.1, by assigning it to one of the three species. We observe that the cross is close to several red points, and so we might suppose that it belongs to the red class. However, there are also some green points nearby, so we might think that it could instead belong to the green class. It seems less likely that it belongs to the blue class. The intuition here is that the identity of the cross should be determined more strongly by nearby points from the training set and less strongly by more distant points, and this intuition turns out to be reasonable.

One very simple way of converting this intuition into a learning algorithm would be to divide the input space into regular cells, as indicated in Figure 6.2. When we are given a test point and we wish to predict its class, we first decide which cell it belongs to, and then we find all the training data points that fall in the same cell. The identity of the test point is predicted to be the same as the class having the largest number of training points in the same cell as the test point (with ties being broken at random). We can view this as a basis function model in which there is a basis function $\phi_{i}(\mathbf{x})$ for each grid cell, which simply returns zero if x lies outside the grid cell, and otherwise returns the majority class of the training data points that fall inside the cell. The output of the model is then given by the sum of the outputs of all the basis functions.

re 6.2 Illustration of a simple approach for solving classification problems in which the input space is divided into cells and any new test point is assigned to the class that has the most representatives in the same cell as the test point. As we shall see shortly, this simplistic approach has some severe shortcomings.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/62640cb13b63d7ee4c3f368268942c3dc17eb8e0bc90762139b7c4f228354a86.jpg)

There are numerous problems with this naive approach, but one of the most severe becomes apparent when we consider its extension to problems having larger numbers of input variables, corresponding to input spaces of higher dimensionality. The origin of the problem is illustrated in Figure 6.3, which shows that, if we divide a region of a space into regular cells, then the number of such cells grows exponentially with the dimensionality of the space. The challenge with an exponentially large number of cells is that we would need an exponentially large quantity of training data to ensure that the cells are not empty. We have already seen in Figure 6.2 that some cells contain no training points. Hence, a test point in such cells cannot be classified. Clearly, we have no hope of applying such a technique in a space of more than a few variables. The difficulties with both the polynomial regression example and the Iris data classification example arise because the basis functions were chosen independently of the problem being solved. We will need to be more sophisticated in our choice of basis functions if we are to circumvent the curse of dimensionality.

Figure 6.3 Illustration of the curse of dimensionality, showing how the number of regions of a regular grid grows exponentially with the dimensionality D of the space. For clarity, only a subset of the cubical regions are shown for $D = 3$  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/e57e02c4fe6d7176101eef23739a90a00e089c94ed99279b87c9e0c5fd182426.jpg)

Plot of the fraction of the volume of a hypersphere of radius $r = 1$ lying in the range $r = 1 - \epsilon$ to $r = 1$ for various values of the dimensionality D.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/3138ba1c323686b23397fc3fdae41be1ab5796f27d193e91f00701815f0ef6e1.jpg)

## 6.1.2 High-dimensional spaces

First, however, we will look more closely at the properties of spaces with higher dimensionality where our geometrical intuitions, formed through a life spent in a space of three dimensions, can fail badly. As a simple example, consider a hypersphere of radius $r = 1$ in a space of $D$ dimensions, and ask what is the fraction of the volume of the hypersphere that lies between radius $r = 1 - \epsilon$ and $r = 1$ . We can evaluate this fraction by noting that the volume $V_{D}(r)$ of a hypersphere of radius r in D dimensions must scale as $r^{D}$ , and so we write

$$
V_{D}(r) = K_{D} r^{D}\tag{6.4}
$$

where the constant $K_{D}$ depends only on D. Thus, the required fraction is given by

$$
\frac{V_{D}(1) - V_{D}(1 - \epsilon)}{V_{D}(1)} = 1 -(1 - \epsilon)^{D},\tag{6.5}
$$

which is plotted as a function of $\epsilon$ for various values of D in Figure 6.4. We see that, for large $D_{\bullet}$ , this fraction tends to 1 even for small values of $\epsilon$. Thus, we arrive at the remarkable result that, in spaces of high dimensionality, most of the volume of a hypersphere is concentrated in a thin shell near the surface!

Figure 6.5 Plot of the probability density with respect to radius r of a Gaussian distribution for various values of the dimensionality D. In a highdimensional space, most of the probability mass of a Gaussian is located within a thin shell at a specific radius.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/d2079ae754689c8f91b56cac89c61e6a3d43b8f5c51e2e932d083026e6b93902.jpg)

As a further example of direct relevance to machine learning, consider the behaviour of a Gaussian distribution in a high-dimensional space. If we transform from Cartesian to polar coordinates and then integrate out the directional variables, we obtain an expression for the density $p(r)$ as a function of radius $r$ from the origin. Thus, $p(r) \delta r$ is the probability mass inside a thin shell of thickness $\delta r$ located at radius r. This distribution is plotted, for various values of $D_{:}$ , in Figure 6.5, and we see that for large D, the probability mass of the Gaussian is concentrated in a thin shell at a specific radius.

In this book, we make extensive use of illustrative examples involving one or two variables, because this makes it particularly easy to visualize these spaces graphically. The reader should be warned, however, that not all intuitions developed in spaces of low dimensionality will generalize to situations involving many dimensions.

Finally, although we have talked about the curse of dimensionality, there can also be advantages to working in high-dimensional spaces. Consider the situation shown in Figure 6.6. We see that this data set, in which each data point consists of a pair of values $(x_{1}, x_{2})$ , is linearly separable, but when only the value of $x_{1}$ is observed, the classes have a strong overlap. The classification problem is therefore much easier in the higher-dimensional space.

## 6.1.3 Data manifolds

With both the polynomial regression model and the grid-based classifier in Figure 6.2, we saw that the number of basis functions grows rapidly with dimensionality, making such methods impractical for applications involving even a few dozen variables, never mind the millions of inputs that often arise with, say, image processing. The problem is that the basis functions are fixed ahead of time and do not depend on the data, or indeed even on the specific problem being solved. We need to find a way to create basis functions that are tuned to the particular application.

Although the curse of dimensionality certainly raises important issues for machine learning applications, it does not prevent us from finding effective techniques applicable to high-dimensional spaces. One reason for this is that real data will generally be confined to a region of the data space having lower effective dimensionality. Consider the images shown in Figure 6.7. Each image is a point in a high-dimensional space whose dimensionality is determined by the number of pixels. Because the objects can occur at different vertical and horizontal positions within the image and in different orientations, there are three degrees of freedom of variability between images, and a set of images will, to a first approximation, live on a three-dimensional manifold embedded within the high-dimensional space. Due to the complex relationships between the object position or orientation and the pixel intensities, this manifold will be highly nonlinear.

x1  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/256c44b1a96ddda90f094ca8a71ab3043506b30f39ff61352793273b05803b15.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/da1926f4f5bc794e04e78e300f2ed938628c9c18a7e9cc3b9144ead273d4b7b7.jpg)  
(b)  
Figure 6.6 Illustration of a data set in two dimensions $(x_{1}, x_{2})$ in which data points from the two classes depicted using green and red circles can be separated by a linear decision surface, as seen in (a). If, however, only the variable $x_{1}$ is measured then the classes are no longer separable, as seen in (b).

In fact, the number of pixels is really an artefact of the image generation process since they represent measurements of a continuous world. Capturing the same image at a higher resolution increases the dimensionality D of the data space without changing the fact that the images still live on a three-dimensional manifold. If we can associate localized basis functions with the data manifold, rather than with the entire high-dimensional data space, we might expect that the number of required basis functions would grow exponentially with the dimensionality of the manifold rather than with the dimensionality of the data space. Since the manifold will typically have a much lower dimensionality than the data space, this represents a huge improvement. Effectively, neural networks learn a set of basis functions that are adapted to data manifolds. Moreover, for a particular application, not all directions within the manifold may be significant. For example, if we wish to determine only the orientation, and not the position, of the object in Figure 6.7, then there is only one relevant degree of freedom on the manifold and not three. Neural networks are also able to learn which directions on the manifold are relevant to predicting the desired outputs.

Examples of images of a handwritten digit that differ in the location of the digit within the images as well as in their orientation. This data lives on a nonlinear threedimensional manifold within the high-dimensional image space.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/b951f8f429ef55264baf92f7a06625477f2276ba88e09c29ab91f565a47392cd.jpg)

![Figure 6.8](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/18d2046051bde967cbed830b20af9b6398bda9e459b400311d2c62ae52ab6126.jpg)  
Figure 6.8 The top row shows examples of natural images of size 64 × 64 pixels, whereas the bottom row shows randomly generated images of the same size obtained by drawing pixel values from a uniform probability distribution over the possible pixel colours.

Another way to see that real data is confined to low-dimensional manifolds is to consider the task of generating random images. In Figure 6.8 we see examples of natural images along with examples of synthetic images of the same resolution generated by sampling each of the red, green, and blue intensities at each pixel independently at random from a uniform distribution. We see that none of the synthetic images look at all like natural images. The reason is that these random images lack the very strong correlations between pixels that natural images exhibit. For example, two adjacent pixels in a natural image have a much higher probability of having the same, or very similar, colour, than would two adjacent images in the random examples. Each of the images in Figure 6.8 corresponds to a point in a high-dimensional space, yet natural images cover only a tiny fraction of this space.

## 6.1.4 Data-dependent basis functions

We have seen that simple basis functions that are chosen independently of the problem being solved can run into significant limitations, particularly in spaces of high dimensionality. If we want to use basis functions in such situations, then one approach would be to use expert knowledge to hand-craft the basis functions in a way that is specific to each application. For many years, this was the mainstream approach in machine learning. Basis functions, often called features, would be determined by a combination of domain knowledge and trial-and-error. However, this approach met with limited success and was superseded by data-driven approaches in which basis functions are learned from the training data. Domain knowledge still plays a role in modern machine learning, but at a more qualitative level in designing network architectures where it can capture appropriate inductive bias, as we will see in later chapters.

Since data in a high-dimensional space may be confined to a low-dimensional manifold, we do not need basis functions that densely fill the whole input space, but instead we can use basis functions that are themselves associated with the data manifold. One way to do this is to have one basis function associated with each data point in the training set, which ensures that the basis functions are automatically adapted to the underlying data manifold. An example of such a model is that of radial basis functions (Broomhead and Lowe, 1988), which have the property that each basis function depends only on the radial distance (typically Euclidean) from a central vector. If the basis centres are chosen to be the input data values $\left\{\mathbf{x}_{n} \right\}$ then there is one basis function $\phi_{n}(\mathbf{x})$ for each data point, which will therefore capture the whole of the data manifold. A typical choice for a radial basis function is

$$
\phi_{n}(\mathbf{x}) = \exp \left({- \frac{\left\| \mathbf{x} - \mathbf{x}_{n} \right\|^{2}}{s^{2}}} \right)\tag{6.6}
$$

where s is a parameter controlling the width of the basis function. Although it can be quick to set up such a model, a major problem with this technique is that it becomes computationally unwieldy for large data sets. Moreover, the model needs careful regularization to avoid severe over-fitting.

A related approach, called a support vector machine or SVM (Vapnik, 1995; Scholkopf and Smola, 2002; Bishop, 2006), addresses this by again defining basis¨ functions that are centred on each of the training data points and then selecting a subset of these automatically during training. As a result, the effective number of basis functions in the resulting models is generally much smaller than the number of training points, although it is often still relatively large and typically increases with the size of the training set. Support vector machines also do not produce probabilistic outputs, and they do not naturally generalize to more than two classes. Methods such as radial basis functions and support vector machines have been superseded by deep neural networks, which are much better at exploiting very large data sets efficiently. Moreover, as we will see later, neural networks are able to learn deep hierarchical representations, which are crucial to achieving high prediction accuracy in more complex applications.

## 6.2. Multilayer Networks

In the previous section, we saw that to apply linear models of the form (6.1) to problems involving large-scale data sets and high-dimensional spaces, we need to find a set of basis functions that is tuned to the problem being solved. The key idea behind neural networks is to choose basis functions $\phi_{j}(\mathbf{x})$ that themselves have learnable parameters and then allow these parameters to be adjusted, along with the coefficients $\{w_{j}\}$ , during training. We then optimize the whole model by minimizing an error function using gradient-based optimization methods, such as stochastic gradient descent, where the error function is defined jointly across all the parameters in the model.

There are, of course, many ways to construct parametric nonlinear basis functions. One key requirement is that they must be differentiable functions of their learnable parameters so that we can apply gradient-based optimization. The most successful choice has been to use basis functions that follow the same form as (6.1), so that each basis function is itself a nonlinear function of a linear combination of the inputs, where the coefficients in the linear combination are learnable parameters. Note that this construction can clearly be extended recursively to give a hierarchical model with many layers, which forms the basis for deep neural networks.

Consider a basic neural network model having two layers of learnable parameters. First, we construct M linear combinations of the input variables $x_{1}, \ldots, x_{D}$ in the form

$$
a_{j}^{(1)} = \sum_{i = 1}^{D} w_{ji}^{(1)} x_{i} + w_{j0}^{(1)}\tag{6.7}
$$

where $j = 1, \dots, M,$ , and the superscript (1) indicates that the corresponding parameters are in the first ‘layer’ of the network. We will refer to the parameters $w_{ji}^{(1)}$ as weights and the parameters ${w_{j0}^{(1)}}$ as biases, while the quantities $a_{i}^{(1)}$ are called pre-activations. Each of the quantities $a_{j}$ is then transformed using a differentiable, nonlinear activation function $\bar{h}(\cdot)$ to give

$$
z_{j}^{(1)} = h(a_{j}^{(1)}),\tag{6.8}
$$

which represent the outputs of the basis functions in (6.1). In the context of neural networks, these basis functions are called hidden units. We will explore various choices for the nonlinear function $h(\cdot)$ shortly, but here we note that provided the derivative $h^{\prime}(\cdot)$ can be evaluated, then the overall network function will be differentiable. Following (6.1), these values are again linearly combined to give

$$
a_{k}^{(2)} = \sum_{j = 1}^{M} w_{kj}^{(2)} z_{j}^{(1)} + w_{k0}^{(2)}\tag{6.9}
$$

where $k = 1, \ldots, K.$ , and K is the total number of outputs. This transformation corresponds to the second layer of the network, and again the $w_{k0}^{(2)}$ are bias parameters. Finally, the $\{a_{k}^{(2)}\}$ are transformed using an appropriate output-unit activation

Network diagram for a two-layer neural network. The input, hidden, and output variables are represented by nodes, and the weight parameters are represented by links between the nodes. The bias parameters are denoted by links coming from additional input and hidden variables $x_{0}$ and z<sub>0</sub> which are themselves denoted by solid nodes. Arrows denote the direction of information flow through the network during forward propagation.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/8b8842e688a1550043e964402ddee72bde0975f46c3314370253675bde145f2d.jpg)

function $f(\cdot)$ to give a set of network outputs $y_{k}$ . A two-layer neural network can be represented in diagram form as shown in Figure 6.9.

## 6.2.1 Parameter matrices

As we discussed in the context of linear regression models, the bias parameters in (6.7) can be absorbed into the set of weight parameters by defining an additional input variable $x_{0}$ whose value is clamped at $x_{0} = 1$ , so that (6.7) takes the form

$$
a_{j} = \sum_{i = 0}^{D} w_{ji}^{(1)} x_{i}.\tag{6.10}
$$

We can similarly absorb the second-layer biases into the second-layer weights, so that the overall network function becomes

$$
y_{k}(\mathbf x, \mathbf w) = f \left(\sum_{j = 0}^{M} w_{kj}^{(2)} h \left(\sum_{i = 0}^{D} w_{ji}^{(1)} x_{i} \right) \right).\tag{6.11}
$$

Another notation that will prove convenient at various points in the book is to represent the inputs as a column vector ${\bf x} =(x_{1}, \ldots, x_{N})^{\textup T}$ and then to gather the weight and bias parameters in (6.11) into matrices to give

$$
\begin{array}{r}{\mathbf{y}(\mathbf{x}, \mathbf{w}) = f \left(\mathbf{W}^{(2)} h \left(\mathbf{W}^{(1)} \mathbf{x} \right) \right)} \end{array}\tag{6.12}
$$

where $f(\cdot)$ and $h(\cdot)$ are evaluated on each vector element separately.

## 6.2.2 Universal approximation

The capability of a two-layer network to model a broad range of functions is illustrated in Figure 6.10. This figure also shows how individual hidden units work collaboratively to approximate the final function. The role of hidden units in a simple classification problem is illustrated in Figure 6.11.

Figure 6.10 Illustration of the capability of a two-layer neural network to approximate four different functions: (a) $f(x) ~ = ~ x^{2}$ , (b) $f(x) \ =$ sin(x), (c), $\begin{array}{lll}{\dot{f}(x)} &{=} &{| x |,} \end{array}$ and (d) $f(x) ~ = ~ H(x)$ where $H(x)$ is the Heaviside step function. In each case, $N = 50$ data points, shown as blue dots, have been sampled uniformly in x over the interval (−1, 1) and the corresponding values of $f(x)$ evaluated. These data points are then used to train a two-layer network having three hidden units with tanh activation functions and linear output units. The resulting network functions are shown by the red curves, and the outputs of the three hidden units are shown by the three dashed curves.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/30dc9370a620e60e44a9a546daf79027b879eac1634bd3a68e08799f43da1d06.jpg)

(a)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/1f276b4f0965ef9db95c6def5a0be0a88db01ae082f4831b3de960a9678b3854.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/a0f511bd6c3d6a63ee18111620b168c71c359c37ee597d89461ba00a7ddb44a8.jpg)

(b)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/001-200/images/b1ecacd596f2fd4c62991ef4b8ad632c1514a0a4d3bcbb9dac4a1bc710c91415.jpg)  
(d)

The approximation properties of two-layer feed-forward networks were widely studied in the 1980s, with various theorems showing that, for a wide range of activation functions, such networks can approximate any function defined over a continuous subset of $\mathbb{R}^{D}$ to arbitrary accuracy (Funahashi, 1989; Cybenko, 1989; Hornik, Stinchcombe, and White, 1989; Leshno et al., 1993). A similar result holds for functions from any finite-dimensional discrete space to any another. Neural networks are therefore said to be universal approximators.

Although such theorems are reassuring, they tell us only that there exists a network that can represent the required function. In some cases, they may require networks that have an exponentially large number of hidden units. Moreover, they say nothing about whether such a network can be found by a learning algorithm. Furthermore, we will see later that the no free lunch theorem says that we can never find a truly universal machine learning algorithm. Finally, although networks having two layers of weights are universal approximators, in a practical application, there can be huge benefits in considering networks having many more than two layers that can learn hierarchical internal representations. All these points support the drive towards deep learning.

## 6.2.3 Hidden unit activation functions

We have seen that the activation functions for the output units are determined by the kind of distribution being modelled. For the hidden units, however, the only requirement is that they need to be differentiable, which leaves a wide range of pos-


<!-- MinerU source pages 201-400 -->

Example of the solution of a simple two-class classification problem involving synthetic data using a neural network having two inputs, two hidden units with tanh activation functions, and a single output having a logistic-sigmoid activation function. The dashed blue lines show the $z = 0.5$ contours for each of the hidden units, and the red line shows the $y =$ 0.5 decision surface for the network. For comparison, the green lines denote the optimal decision boundary computed from the distributions used to generate the data.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/8adbb7f79c96e4ea214874602325e676597b358cea09a7335a23b777fd5d897a.jpg)

sibilities. In most cases, all the hidden units in a network will be given the same activation function, although in principle there is no reason why different choices could not be applied in different parts of the network.

The simplest option for a hidden unit activation function is the identity function, which means that all the hidden units become linear. However, for any such network, we can always find an equivalent network without hidden units. This follows from the fact that the composition of successive linear transformations is itself a linear transformation, and so its representational capability is no greater than that of a single linear layer. However, if the number of hidden units is smaller than either the number of input or output units, then the transformations that such a network can generate are not the most general possible linear transformation from inputs to outputs because information is lost in the dimensionality reduction at the hidden units. Consider a network with N inputs, M hidden units, and K outputs, and where all activation functions are linear. Such a network has $M(N + K)$ parameters, whereas a linear transformation of inputs directly to outputs would have NK parameters. If M is small relative to N or $\bar{K}$ , or both, this leads to a two-layer linear network having fewer parameters than the direct linear mapping, corresponding to a rank-deficient transformation. Such ‘bottleneck’ networks of linear units corresponds to a standard data analysis technique called principal component analysis. In general, however, there is limited interest in using multilayer networks of linear units since the overall function computed by such a network is still linear.

A simple, nonlinear differentiable function is the logistic sigmoid given by

$$
\sigma(a) = \frac{1}{1 + \exp(- a)},\tag{6.13}
$$

which is plotted in Figure 5.12. This was widely used in the early years of work on multilayer neural networks and was partly inspired by studies of the properties of

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/7cbc50c15ac5e17332913a47d3b6ed5005a5729a934e747fad027d27f3bbc914.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/6eb11c42491a0d0b9b54c29b9a617147584adc1960178f28143cd04008285647.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/60ab3c9568648f684ef647db89c7d9ccd53162eca00703ff1cf322b5fa381df9.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/963be2645de957ccd25d83a604903328b9926baba762614b30ff77d13530748c.jpg)  
(d)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/d52e9e3546ea0d044dafa968b9060672dfa9f81188021d20c68dd80944260938.jpg)  
(e)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/7dc0a43638608c6d04dbe4307425502ff82a1182eedf28d94577fab637d35327.jpg)  
(f)  
Figure 6.12 A variety of nonlinear activation functions.

biological neurons. A closely related function is tanh, which is defined by

$$
\operatorname{tanh}(a) ={\frac{e^{a} - e^{- a}}{e^{a} + e^{- a}}},\tag{6.14}
$$

which is plotted in Figure 6.12(a). This function differs from the logistic sigmoid by a linear transformation of its input and its output values, and so for any network with logistic-sigmoid hidden-unit activation functions, there is an equivalent network with tanh activation functions. However, when training a network, these are not necessarily equivalent because for gradient-based optimization, the network weights and biases need to be initialized, and so if the activation functions are changed, then the initialization scheme must be adjusted accordingly. A ‘hard’ version of the tanh function (Collobert, 2004) is given by

$$
h(a) = \operatorname{max} \left(- 1, \operatorname{min}(1, a) \right)\tag{6.15}
$$

and is plotted in Figure 6.12(b).

A major drawback of both the logistic sigmoid and the tanh activation functions is that the gradients go to zero exponentially when the inputs have either large positive or large negative values. We will discuss this ‘vanishing gradients’ issue later,

but for the moment, we note that it will generally be better to use activation functions with non-zero gradients, at least when the input takes a large positive value. One such choice is the softplus activation function given by

$$
h(a) = \ln \left(1 + \exp(a) \right),\tag{6.16}
$$

which is plotted in Figure 6.12(c). For $a \gg 1$ , we have $h(a) \simeq a,$ , and so the gradient remains non-zero even when the input to the activation function is large and positive, thereby helping to alleviate the vanishing gradients problem.

An even simpler choice of activation function is the rectified linear unit or ReLU, which is defined by

$$
h(a) = \operatorname{max}(0, a)\tag{6.17}
$$

and which is plotted in Figure 6.12(d). Empirically, this is one of the best-performing activation functions, and it is in widespread use. Note that strictly speaking, the derivative of the ReLU function is not defined when $a = 0$ , but in practice this can be safely ignored. The softplus function (6.16) can be viewed as a smoothed version of the ReLU and is therefore also sometimes called soft ReLU.

Although the ReLU has a non-zero gradient for positive input values, this is not the case for negative inputs, which can mean that some hidden units receive no ‘error signal’ during training. A modification of ReLU that seeks to avoid this issue is called a leaky ReLU and is defined by

$$
h(a) = \operatorname{max}(0, a) + \alpha \operatorname{min}(0, a),\tag{6.18}
$$

where $0 < \alpha < 1$ . This function is plotted in Figure 6.12(e). Unlike ReLU, this has a nonzero gradient for input values $a < 0$ , which ensures that there is a signal to drive training. A variant of this activation function uses $\alpha = - 1$ , in which case $h(a) = | a |$ which is plotted in Figure 6.12(f). Another variant allows each hidden unit to have its own value $\alpha_{j}$ , which can be learned during network training by evaluating gradients with respect to the $\{\alpha_{j}\}$ along with the gradients with respect to the weights and biases.

The introduction of ReLU gave a big improvement in training efficiency over previous sigmoidal activation functions (Krizhevsky, Sutskever, and Hinton, 2012). As well as allowing deeper networks to be trained efficiently, it is much less sensitive to the random initialization of the weights. It is also well suited to a low-precision implementation, such as 8-bit fixed versus 64-bit floating point, and it is computationally cheap to evaluate. Many practical applications simply use ReLU units as the default unless the goal is explicitly to explore the effects of different choices of activation function.

## 6.2.4 Weight-space symmetries

One property of feed-forward networks is that multiple distinct choices for the weight vector w can all give rise to the same mapping function from inputs to outputs (Chen, Lu, and Hecht-Nielsen, 1993). Consider a two-layer network of the form shown in Figure 6.9 with M hidden units having tanh activation functions and full connectivity in both layers. If we change the sign of all the weights and the bias feeding into a particular hidden unit, then, for a given input data point, the sign of the pre-activation of the hidden unit will be reversed, and therefore so too will the activation, because tanh is an odd function, so that tanh $(- a) \ : = \ : - \operatorname{tanh}(a)$ This transformation can be exactly compensated for by changing the sign of all the weights leading out of that hidden unit. Thus, by changing the signs of a particular group of weights (and a bias), the input–output mapping function represented by the network is unchanged, and so we have found two different weight vectors that give rise to the same mapping function. For M hidden units, there will be M such ‘sign-flip’ symmetries, and thus, any given weight vector will be one of a set $2^{M}$ equivalent weight vectors .

Similarly, imagine that we interchange the values of all of the weights (and the bias) leading both into and out of a particular hidden unit with the corresponding values of the weights (and bias) associated with a different hidden unit. Again, this clearly leaves the network input–output mapping function unchanged, but it corresponds to a different choice of weight vector. For M hidden units, any given weight vector will belong to a set of $M \times(M - 1) \times \cdots \times 2 \times 1 = M !$ equivalent weight vectors associated with this interchange symmetry, corresponding to the M! different orderings of the hidden units. The network will therefore have an overall weight-space symmetry factor of $M ! 2^{M}$ . For networks with more than two layers of weights, the total level of symmetry will be given by the product of such factors, one for each layer of hidden units.

It turns out that these factors account for all the symmetries in weight space (except for possible accidental symmetries due to specific choices for the weight values). Furthermore, the existence of these symmetries is not a particular property of the tanh function but applies to a wide range of activation functions (Kurkova and´ Kainen, 1994). In general, these symmetries in weight space are of little practical consequence, since network training aims to find a specific setting for the parameters, and the existence of other, equivalent, settings is of little consequence. However, weight-space symmetries do play a role when Bayesian methods are used to evaluate the probability distribution over networks of different sizes (Bishop, 2006).

## 6.3. Deep Networks

We have motivated the development of neural networks by making the basis functions of a linear regression or classification model themselves be governed by learnable parameters, giving rise to the two-layer network model shown in Figure 6.9. For many years, this was the most widely used architecture, primarily because it proved difficult to train networks with more than two layers effectively. However, extending neural networks to have more than two layers, known as deep neural networks, brings many advantages as we will discuss shortly, and recent advances in techniques for training neural networks are effective for networks with many layers.

We can easily extend the two-layer network architecture (6.12) to any finite number L of layers, in which layer $l = 1, \ldots, L$ computes the following function:

$$
\mathbf{z}^{(l)} = h^{(l)} \left(\mathbf{W}^{(l)} \mathbf{z}^{(l - 1)} \right)\tag{6.19}
$$

where $\it{h^{(l)}}$ denotes the activation function associated with layer $l,$ and $\mathbf{W}^{(l)}$ denotes the corresponding matrix of weight and bias parameters. Also, ${\bf z}^{(0)} ={\bf x}$ represents the input vector and $\mathbf{z}^{(L)} = \mathbf{y}$ represents the output vector.

Note that there has been some confusion in the literature regarding the terminology for counting the number of layers in such networks. Thus, the network in Figure 6.9 is sometimes described as a three-layer network (which counts the number of layers of units and treats the inputs as units) or sometimes as a single-hiddenlayer network (which counts the number of layers of hidden units). We recommend a terminology in which Figure 6.9 is called a two-layer network, because it is the number of layers of learnable weights that is important for determining the network properties.

We have seen that a network of the form shown in Figure 6.9, having two layers of learnable parameters, has universal approximation capabilities. However, networks with more than two layers can sometimes represent a given function with far fewer parameters than a two-layer network. Montufar´ et al. (2014) show that the network function divides the input space into a number of regions that is exponential in the depth of the network, but which is only polynomial in the width of the hidden layers. To represent the same function using a two-layer network would require an exponential number of hidden units.

## 6.3.1 Hierarchical representations

Although this is an interesting result, a more compelling reason to explore deep neural networks is that the network architecture encodes a particular form of inductive bias, namely that the outputs are related to the input space through a hierarchical representation. A good example is the task of recognizing objects in images. The relationship between the pixels of an image and a high-level concept such as ‘cat’ is highly complex and nonlinear, and would be an extremely challenging problem for a two-layer network. However, a deep neural network can learn to detect low-level features, such as edges, in the early layers, and can then combine these in subsequent layers to make higher-level features such as eyes or whiskers, which in turn can be combined in later layers to detect the presence of a cat. This can be viewed as a compositional inductive bias, in which higher-level objects, such as a cat, are composed of lower-level objects, such as eyes, which in turn have yet lower-level elements such as edges. We can also think of this in reverse by considering the process of generating an image starting with low-level features such as edges, then combining these to form simple shapes such as circles, and then combining those in turn to form higher-level objects such as cats. At each stage there are many ways to combine different components, giving an exponential gain in the number of possibilities with increasing depth.

## 6.3.2 Distributed representations

Neural networks can take advantage of another form of compositionality called a distributed representation. Conceptually, each unit in a hidden layer can be thought of as representing a ‘feature’ at that level of the network, with a high value of the activation indicating that the corresponding feature is present and a low value indicating its absence. With M units in a given layer, such a network can represent M different features. However, the network could potentially learn a different representation in which combinations of hidden units represent features, thereby potentially allowing a hidden layer with M units to represent 2<sup>M</sup> different features, growing exponentially with the number of units. Consider, for example, a network designed to process images of faces. Each particular face image may or may not have glasses, it may or may not have a hat, and it may or may not have a beard, leading to eight different combinations. Although this could be represented by eight units each of which ‘turns on’ when it detects the corresponding combination, it could also be represented more compactly by just three units, one for each attribute. These can be present independently of each other (although statistically their presence is likely to be correlated to some degree). Later, we will explore in detail the kinds of internal representations that deep learning networks discover for themselves during training.

## 6.3.3 Representation learning

We can view the successive layers of a deep neural network as performing transformations of the data, that make it easier to solve the desired task or tasks. For example, a neural network that successfully learns to classify skin lesions as benign or malignant must have learned to transform the original image data into a new space, represented by the outputs of the final layer of hidden units, such that the final layer of the network can distinguish the two classes. This final layer can be viewed as a simple linear classifier, and so in the representation of the last hidden layer, the two classes must be well separated by a linear surface. This ability to discover a nonlinear transformation of the data that makes subsequent tasks easier to solve is called representation learning (Bengio, Courville, and Vincent, 2012). The learned representation, sometimes called the embedding space, is given by the outputs of one of the hidden layers of the network, so that any input vector, either from the training set or from some new data set, can be transformed into this representation by forward propagation through the network.

Representation learning is especially powerful because it allows us to exploit unlabelled data. Often it is easy to collect a large quantity of unlabelled data, but acquiring the associated labels may be more difficult. For example, a video camera on a vehicle can gather large numbers of images of urban scenes as the vehicle is driven around a city, but taking those images and identifying relevant objects, such as pedestrians and road signs, would require expensive and time-consuming human labelling.

Learning from unlabelled data is called unsupervised learning, and many different algorithms have been developed to do this. For example, a neural network can be trained to take images as input and to create the same images as the output. To make this into a non-trivial task, the network may use hidden layers with fewer units than the number of pixels in the image, thereby forcing the network to learn some kind of compression of the images. Only unlabelled data is needed because each image in the training set acts as both the input vector and the target vector. Such networks are known as autoencoders. The goal is that this type of training will force the network to discover some internal representation for the data that is useful for solving other tasks, such as image classification.

Historically, unsupervised learning played an important role in enabling the first deep networks (apart from convolutional networks) to be successfully trained. Each layer of the network was first pre-trained using unsupervised learning and then the entire network was trained further using gradient-based supervised training. It was later discovered that the pre-training phase could be omitted and a deep network could be trained from scratch purely using supervised learning given appropriate conditions.

However, pre-training and representation learning remain central to deep learning in other contexts. The most notable example of pre-training is in natural language processing in which transformer models are trained on large quantities of text and are able to learn highly sophisticated internal representations of language that facilitates an impressive range of capabilities at human level and beyond.

## 6.3.4 Transfer learning

The internal representation learned for one particular task might also be useful for related tasks. For example, a network trained on a large labelled data set of everyday objects can learn how to transform an image representation into one that is much better suited for classifying objects. Then, the final classification layer of the network can be retrained using a smaller labelled data set of skin lesion images to create a lesion classifier. This is an example of transfer learning (Hospedales et al., 2021), which allows higher accuracy to be achieved than if only the lesion image data were used for training, because the network can exploit commonalities shared by natural images in general. Transfer learning is illustrated in Figure 6.13.

In general, transfer learning can be used to improve performance on some task A, for which training data is in short supply, by using data from a related task B, for which data is more plentiful. The two tasks should have the same kind of inputs, and there should be some commonality between the tasks so that low-level features, or internal representations, learned from task B will be useful for task A. When we look at convolutional networks we will see that many image processing tasks require similar low-level features corresponding to the early layers of a deep neural network, whereas later layers are more specialized to a particular task, making such networks well suited to transfer learning applications.

When data for task A is very scarce, we might simply re-train the final layer of the network. In contrast, if there are more data points, it is feasible to retrain several layers. The process of learning parameters using one task that are then applied to one or more other tasks is called pre-training. Note that for the new task, instead of applying stochastic gradient descent to the whole network, it is much more efficient to send the new training data once through the fixed pre-trained network so as to evaluate the training inputs in the new representation. Iterative gradient-based optimization can then be applied just to the smaller network consisting of the final layers. As well as using a pre-trained network as a fixed pre-processor for a different task, it is also possible to apply fine-tuning in which the whole network is adapted to the data for task A. This is generally done with a very small learning rate for a limited number of iterations to ensure that the network does not over-fit to the relatively small data set available for the new task.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/912184382054faa6b2b95b99f11f7183a4684ac4106fd3a7638eacc4795a2579.jpg)  
(a)

![Figure 6.13](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/0180380abe8de8ccdb9ba44d989894fc95869559fcde68ed28ae5448596ef2a1.jpg)  
Figure 6.13 Schematic illustration of transfer learning. (a) A network is first trained on a task with abundant data, such as object classification of natural images. (b) The early layers of the network (shown in red) are copied from the first task and the final few layers of the network (shown in blue) are then retrained on a new task such as skin lesion classification for which training data is more scarce.

A related approach is multitask learning (Caruana, 1997) in which a network jointly learns more than one related task at the same time. For example, we might wish to construct a spam email filter that allows different users to have different classifiers tuned to their particular preferences. The training data may comprise examples of spam email and non-spam email for many different users, but the number of examples for any one user may be quite limited, and therefore training a separate classifier for each user would give poor results. Instead, we can combine the data sets to train a single larger network that might, for example, share early layers but have separate learnable parameters for the different users in later layers. Sharing data across tasks allows the network to exploit commonalities amongst the tasks, thereby improving the accuracy for all users. With a large number of training examples, a deeper network with more parameters can be used, again leading to improved performance.

Learning across multiple tasks can be extended to meta-learning, which is also called learning to learn. Whereas multitask learning aims to make predictions for a fixed set of tasks, the aim of meta-learning is to make predictions for future tasks that were not seen during training. This can be done by not only learning a shared internal representation across tasks but also by learning the learning algorithm itself (Hospedales et al., 2021). Meta-learning can be used to facilitate generalization of, for example, a classification model to new classes when there are very few labelled examples of the new classes. This is referred to as few-shot learning. When only a single labelled example is used it is called one-shot learning.

## 6.3.5 Contrastive learning

One of the most common and powerful representation learning methods is contrastive learning (Gutmann and Hyvarinen, 2010; Oord, Li, and Vinyals, 2018;¨ Chen, Kornblith, et al., 2020). The idea is to learn a representation such that certain pairs of inputs, referred to as positive pairs, are close in the embedding space, and other pairs of inputs, called negative pairs, are far apart. The intuition is that if we choose our positive pairs in such a way that they are semantically similar and choose negative pairs that are semantically dissimilar, then we will learn a representation space in which similar inputs are close, making downstream tasks, such as classification, much easier. As with other forms of representation learning, the outputs of the trained network are typically not used directly, and instead the activations at some earlier layer are used to form the embedding space. Contrastive learning is unlike most other machine learning tasks, in that the error function for a given input is defined only with respect to other inputs, instead of having a per-input label or target output.

Suppose we have a given data point x called the anchor, for which we have specified another data point $\mathbf{x}^{+}$ that together with x makes up a positive pair. We must also specify a set of data points $\{\mathbf{x}_{1}^{-}, \hdots, \mathbf{x}_{N}^{-}\}$ each of which makes up a negative pair with x. We now need a loss function that will reward close proximity between the representations of x and $\mathbf{x}^{+}$ while encouraging a large distance between each pair $\{\mathbf{x}, \mathbf{x}_{n}^{-}\}$ . One example of such a function, and the most commonly used loss function for contrastive learning, is called the InfoNCE loss (Gutmann and Hyvarinen,¨ 2010; Oord, Li, and Vinyals, 2018), where NCE denotes ‘noise contrastive estimation’. Suppose we have a neural network function ${\bf f}_{\bf w}({\bf x})$ that maps points from the input space x to a representation space, governed by learnable parameters w. This representation is normalized so that $| | \mathbf{f_{w}}(\mathbf{x}) | | = 1$ . Then, for a data point x, the InfoNCE loss is defined by

$$
E(\mathbf{w}) = - \ln \frac{\exp \{\mathbf{f_{w}}(\mathbf{x})^{\mathrm{T}} \mathbf{f_{w}}(\mathbf{x}^{+})\}}{\exp \{\mathbf{f_{w}}(\mathbf{x})^{\mathrm{T}} \mathbf{f_{w}}(\mathbf{x}^{+})\} + \sum_{n = 1}^{N} \exp \{\mathbf{f_{w}}(\mathbf{x})^{\mathrm{T}} \mathbf{f_{w}}(\mathbf{x}_{n}^{-})\}}.\tag{6.20}
$$

We can see that in this function, the cosine similarity $\mathbf{f}_{\mathbf{w}}(\mathbf{x})^{\mathrm{T}} \mathbf{f}_{\mathbf{w}}(\mathbf{x}^{+})$ between the representation ${\bf f}_{\bf w} \left({\bf x} \right)$ of the anchor and the representation ${\bf f}_{\bf w}({\bf x}^{+})$ of the positive example provides our measure of how close the positive pair examples are in the learned space, and the same measure is used to assess how close the anchor is to the negative examples. Note that the function resembles a classification cross-entropy error function in which the cosine similarity of the positive pair gives the logit for the label class and the cosine similarities for the negative pairs give the logits for the incorrect classes. Also note that the negative pairs are crucial as without them the embedding would simply learn the degenerate solution of mapping every point to the same representation.

A particular contrastive learning algorithm is defined predominantly by how the positive and negative pairs are chosen, which is how we use our prior knowledge to specify what a good representation should be. For example, consider the problem of learning representations of images. Here, a common choice is to create positive pairs by corrupting the input images in ways that should preserve the semantic information of the image while greatly altering the image in the pixel space (Wu et al., 2018; He et al., 2019; Chen, Kornblith, et al., 2020). Corruptions are closely related to data augmentations, and examples include rotation, translation, and colour shifts. Other images from the data set can then be used to create the negative pairs. This approach to contrastive learning is known as instance discrimination.

If, however, we have access to class labels, then we can use images of the same class as positive pairs and images of different classes as negative pairs. This relaxes the reliance on specifying the augmentations that the representation should be invariant to and also avoids treating two semantically similar images as a negative pair. This is referred to as supervised contrastive learning (Khosla et al., 2020) because of the reliance on the class labels, and it can often yield better results than simply learning the representation using cross-entropy classification.

The members of positive and negative pairs do not necessarily have to come from the same data modality. In contrastive-language image pretraining, or CLIP (Radford et al., 2021), a positive pair consists of an image and its corresponding text caption, and two separate functions, one for each modality, are used to map the inputs to the same representation space. Negative pairs are then mismatched images and captions. This is often referred to as weakly supervised, as it relies on captioned images, which are often easier to obtain by scraping data from the internet than by manually labelling images with their classes. The loss function in this case is given by

$$
\begin{array}{c}{{\displaystyle{\cal E}({\bf w}) = - \frac{1}{2} \ln \frac{\exp \{{\bf f_{w}}({\bf x}^{+})^{\mathrm{T}}{\bf g}_{\theta}({\bf y}^{+})\}}{\exp \{{\bf f_{w}}({\bf x}^{+})^{\mathrm{T}}{\bf g}_{\theta}({\bf y}^{+})\} + \sum_{n = 1}^{N} \exp \{{\bf f_{w}}({\bf x}_{n}^{-})^{\mathrm{T}}{\bf g}_{\theta}({\bf y}^{+})\}}}} \\{{- \frac{1}{2} \ln \frac{\exp \{{\bf f_{w}}({\bf x}^{+})^{\mathrm{T}}{\bf g}_{\theta}({\bf y}^{+})\}}{\exp \{{\bf f_{w}}({\bf x}^{+})^{\mathrm{T}}{\bf g}_{\theta}({\bf y}^{+})\} + \sum_{m = 1}^{M} \exp \{{\bf f_{w}}({\bf x}^{+})^{\mathrm{T}}{\bf g}_{\theta}({\bf y}_{m}^{-})\}}}} \end{array}\tag{6.21}
$$

where $\mathbf{x}^{+}$ and $\mathbf{y}^{+}$ represent a positive pair in which x is an image and y is its corresponding text caption, $\mathbf{f}_{\mathbf{w}}$ represents the mapping from images to the representation space, and $\mathbf{g}_{\theta}$ is the mapping from text input to the representation space. We also require a set $\bigl \{\mathbf{x}_{1}^{-}, \dotsc, \mathbf{x}_{N}^{-} \bigr\}$ of other images from the data set, for which we can assume the text caption $\mathbf{y}^{+}$ is inappropriate, and a set $\{\mathbf{y}_{1}^{-}, \dotsc, \mathbf{y}_{M}^{-}\}$ of text captions that are similarly mismatched to the input image x. The two terms in the loss function ensure that (a) the representation of the image is close to its text caption representation relative to other image representations and (b) the text caption representation is close to the representation of the image it describes relative to other representations of text captions. Although CLIP uses text and image pairs, any data set with paired modalities can be used to learn representations. A comparison of the different contrastive learning methods we have discussed is shown in Figure 6.14.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/7359101c9bdc19dd12891f7db95dc160841847214bea907306bb681e2c2124cd.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/a58d60e5335a476c735f6b2c1cf613e438c0ef328f2411bccfe5f29168b162d3.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/06f0c4972ac9dc6c87cdef26767fe6b7e4774fa3efd501905ec79c2603396fb7.jpg)  
(c)  
Figure 6.14 Illustration of three different contrastive learning paradigms. (a) The instance discrimination approach, where the positive pair is made up of the anchor and an augmented version of the same image. These are mapped to points in a normalized space that can be thought of as a unit hypersphere. The coloured arrows show that the loss encourages the representations of the positive pair to be closer together but pushes negative pairs further apart. (b) Supervised contrastive learning in which the positive pair consists of two different images from the same class. (c) The CLIP model in which the positive pair is made up of an image and an associated text snippet.

## 6.3.6 General network architectures

So far, we have explored neural network architectures that are organized into a sequence of fully-connected layers. However, because there is a direct correspondence between a network diagram and its mathematical function, we can develop more general network mappings by considering more complex network diagrams. These must be restricted to a feed-forward architecture, in other words to one having no closed directed cycles, to ensure that the outputs are deterministic functions of the inputs. This is illustrated with a simple example in Figure 6.15. Each (hidden or output) unit in such a network computes a function given by

$$
z_{k} = h \left(\sum_{j \in \mathcal{A}(k)} w_{kj} z_{j} + b_{k} \right)\tag{6.22}
$$

where (k) denotes the set of ancestors of node k, in other words the set of units that send connections to unit k, and $b_{k}$ denotes the associated bias parameter. For a given set of values applied to the inputs of the network, successive application of (6.22) allows the activations of all units in the network to be evaluated including those of the output units.

Figure 6.15 Example of a neural network having a general feed-forward topology. Note that each hidden and output unit has an associated bias parameter (omitted for clarity).

outputs

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/020077238f3e3d48a64d9ee496f6bfa631458a276fe73c97cf315e68470f4aca.jpg)

## 6.3.7 Tensors

We see that linear algebra plays a central role in neural networks, with quantities such as data sets, activations, and network parameters represented as scalars, vectors, and matrices. However, we also encounter variables of higher dimensionality. Consider, for example, a data set of N colour images each of which is I pixels high and J pixels wide. Each pixel is indexed by its row and column within the image and has red, green, and blue values. We have one such value for each image in the data set, and so we can represent a particular intensity value by a four-dimensional array X with elements $x_{ijkn}$ where $i \in \{1, \ldots, I\}$ and $j \in \{1, \dotsc, J\}$ index the row and column within the image, $k \in \{1, 2, 3\}$ indexes the red, green, and blue intensities, and $n \in \{1, \ldots, N\}$ indexes the particular image within the data set. These higher-dimensional arrays are called tensors and include scalars, vectors, and matrices as special cases. We will see many examples of such tensors when we discuss more sophisticated neural network architectures later in the book. Massively parallel processors such as GPUs are especially well suited to processing tensors.

## 6.4. Error Functions

In earlier chapters, we explored linear models for regression and classification, and in the process we derived suitable forms for the error functions along with corresponding choices for the output-unit activation function. The same considerations for choosing an error function apply for multilayer neural networks, and so for convenience, we will summarize the key points here.

## 6.4.1 Regression

We start by discussing regression problems, and for the moment we consider a single target variable t that can take any real value. Following the discussion of regression in single-layer networks, we assume that t has a Gaussian distribution with an x-dependent mean, which is given by the output of the neural network, so that

$$
p(t | \mathbf{x}, \mathbf{w}) = \mathcal{N} \left(t | y(\mathbf{x}, \mathbf{w}), \sigma^{2} \right)\tag{6.23}
$$

where $\sigma^{2}$ is the variance of the Gaussian noise. Of course this is a somewhat restrictive assumption, and in some applications we will need to extend this approach to allow for more general distributions. For the conditional distribution given by (6.23), it is sufficient to take the output-unit activation function to be the identity, because such a network can approximate any continuous function from x to $y.$ Given a data set of N i.i.d. observations $\mathbf{X} = \{\mathbf{x}_{1}, \ldots, \mathbf{x}_{N}\}$ , along with corresponding target values $\mathbf{t} = \{t_{1}, \ldots, t_{N}\}$ , we can construct the corresponding likelihood function:

$$
p(\mathbf{t} | \mathbf{X}, \mathbf{w}, \sigma^{2}) = \prod_{n = 1}^{N} p(t_{n} | y(\mathbf{x}_{n}, \mathbf{w}), \sigma^{2}).\tag{6.24}
$$

Note that in the machine learning literature, it is usual to consider the minimization of an error function rather than the maximization of the likelihood, and so here we will follow this convention. Taking the negative logarithm of the likelihood function (6.24), we obtain the error function

$$
{\frac{1}{2 \sigma^{2}}} \sum_{n = 1}^{N} \{y(\mathbf{x}_{n}, \mathbf{w}) - t_{n}\}^{2} +{\frac{N}{2}} \ln \sigma^{2} +{\frac{N}{2}} \ln(2 \pi),\tag{6.25}
$$

which can be used to learn the parameters w and $\sigma^{2}$ . Consider first the determination of w. Maximizing the likelihood function is equivalent to minimizing the sum-ofsquares error function given by

$$
E(\mathbf{w}) = \frac{1}{2} \sum_{n = 1}^{N} \{y(\mathbf{x}_{n}, \mathbf{w}) - t_{n}\}^{2}\tag{6.26}
$$

where we have discarded additive and multiplicative constants. The value of w found by minimizing $E(\mathbf{w})$ will be denoted $\mathbf{w}^{\star}$ . Note that this will typically not correspond to the global maximum of the likelihood function because the nonlinearity of the network function $y(\mathbf{x}_{n}, \mathbf{w})$ causes the error $E(\mathbf{w})$ to be non-convex, and so finding the global optimum is generally infeasible. Moreover, regularization terms may be added to the error function and other modifications may be made to the training process, so that the resulting solution for the network parameters may differ significantly from the maximum likelihood solution.

Having found $\mathbf{w}^{\star}$ , the value of $\sigma^{2}$ can be found by minimizing the error function (6.25) to give

$$
\sigma^{2 \star} = \frac{1}{N} \sum_{n = 1}^{N} \{y(\mathbf{x}_{n}, \mathbf{w}^{\star}) - t_{n}\}^{2}.\tag{6.27}
$$

Note that this can be evaluated once the iterative optimization required to find $\mathbf{w}^{\star}$ is completed.

If we have multiple target variables, and we assume that they are independent, conditional on x and w, with shared noise variance $\sigma^{2}$ , then the conditional distribution of the target values is given by

$$
p(\mathbf{t} | \mathbf{x}, \mathbf{w}) = \mathcal{N} \left(\mathbf{t} | \mathbf{y}(\mathbf{x}, \mathbf{w}), \sigma^{2} \mathbf{I} \right).\tag{6.28}
$$

Following the same argument as for a single target variable, we see that maximizing the likelihood function with respect to the weights is equivalent to minimizing the sum-of-squares error function:

$$
E(\mathbf{w}) = \frac{1}{2} \sum_{n = 1}^{N} \| \mathbf{y}(\mathbf{x}_{n}, \mathbf{w}) - \mathbf{t}_{n} \|^{2}.\tag{6.29}
$$

The noise variance is then given by

$$
\sigma^{2 \star} = \frac{1}{NK} \sum_{n = 1}^{N} \| \mathbf{y}(\mathbf{x}_{n}, \mathbf{w}^{\star}) - \mathbf{t}_{n} \|^{2}\tag{6.30}
$$

where K is the dimensionality of the target variable. The assumption of conditional independence of the target variables can be dropped at the expense of a slightly more complex optimization problem.

Recall that there is a natural pairing of the error function (given by the negative log likelihood) and the output-unit activation function. In regression, we can view the network as having an output activation function that is the identity, so that $y_{k} = a_{k}$ The corresponding sum-of-squares error function then has the property

$$
{\frac{\partial E}{\partial a_{k}}} = y_{k} - t_{k}.\tag{6.31}
$$

## 6.4.2 Binary classification

Now consider binary classification in which we have a single target variable t such that $t ~ = ~ 1$ denotes class $\mathcal{C}_{1}$ and $t ~ = ~ 0$ denotes class $\bar{\mathcal{C}}_{2}$ . Following the discussion of canonical link functions, we consider a network having a single output whose activation function is a logistic sigmoid (6.13) so that $0 \leqslant y(\mathbf{x}, \mathbf{w}) \leqslant 1$ . We can interpret $y(\mathbf{x}, \mathbf{w})$ as the conditional probability $p(\mathcal{C}_{1} | \mathbf{x})$ , with $p(\mathcal{C}_{2} | \mathbf{x})$ given by $1 - y(\mathbf x, \mathbf w)$ . The conditional distribution of targets given inputs is then a Bernoulli distribution of the form

$$
p(t | \mathbf{x}, \mathbf{w}) = y(\mathbf{x}, \mathbf{w})^{t} \left\{1 - y(\mathbf{x}, \mathbf{w}) \right\}^{1 - t}.\tag{6.32}
$$

If we consider a training set of independent observations, then the error function, which is given by the negative log likelihood, is then a cross-entropy error of the form

$$
E(\mathbf{w}) = - \sum_{n = 1}^{N} \{t_{n} \ln y_{n} +(1 - t_{n}) \ln(1 - y_{n})\}\tag{6.33}
$$

where $y_{n}$ denotes $y(\mathbf{x}_{n}, \mathbf{w})$ . Simard, Steinkraus, and Platt (2003) found that using the cross-entropy error function instead of the sum-of-squares for a classification problem leads to faster training as well as improved generalization.

Note that there is no analogue of the noise variance $\sigma^{2}$ in (6.32) because the target values are assumed to be correctly labelled. However, the model is easily extended to allow for labelling errors by introducing a probability $\epsilon$ that the target value t has been flipped to the wrong value (Opper and Winther, 2000). Here $\epsilon$ may be set in advance, or it may be treated as a hyperparameter whose value is inferred from the data.

If we have K separate binary classifications to perform, then we can use a network having K outputs each of which has a logistic-sigmoid activation function. Associated with each output is a binary class label $t_{k} \in \{0, 1\}$ , where $k = 1, \ldots, K$ If we assume that the class labels are independent, given the input vector, then the conditional distribution of the targets is

$$
p({\mathbf t} |{\mathbf x},{\mathbf w}) = \prod_{k = 1}^{K} y_{k}({\mathbf x},{\mathbf w})^{t_{k}} \left[1 - y_{k}({\mathbf x},{\mathbf w}) \right]^{1 - t_{k}}.\tag{6.34}
$$

Taking the negative logarithm of the corresponding likelihood function then gives the following error function:

$$
E(\mathbf{w}) = - \sum_{n = 1}^{N} \sum_{k = 1}^{K} \left\{t_{nk} \ln y_{nk} +(1 - t_{nk}) \ln(1 - y_{nk}) \right\}\tag{6.35}
$$

where $y_{nk}$ denotes $y_{k}(\mathbf{x}_{n}, \mathbf{w})$ . Again, the derivative of the error function with respect to the pre-activation for a particular output unit takes the form (6.31), just as in the regression case.

## 6.4.3 multiclass classification

Finally, we consider the standard multiclass classification problem in which each input is assigned to one of K mutually exclusive classes. The binary target variables $t_{k} ~ \in ~ \{0, 1\}$ have a 1-of-K coding scheme indicating the class, and the network outputs are interpreted as $y_{k}(\mathbf{x}, \mathbf{w}) = p(t_{k} = 1 | \mathbf{x})$ , leading to the error function (5.80), which we reproduce here:

$$
E(\mathbf{w}) = - \sum_{n = 1}^{N} \sum_{k = 1}^{K} t_{kn} \ln y_{k}(\mathbf{x}_{n}, \mathbf{w}).\tag{6.36}
$$

The output-unit activation function, which corresponds to the canonical link, is given by the softmax function:

$$
y_{k}(\mathbf x, \mathbf w) = \frac{\exp(a_{k}(\mathbf x, \mathbf w))}{\sum_{j} \exp(a_{j}(\mathbf x, \mathbf w))},\tag{6.37}
$$

which satisfies $0 \leqslant y_{k} \leqslant 1$ and $\textstyle \sum_{k} y_{k} = 1$ . Note that the $y_{k}(\mathbf{x}, \mathbf{w})$ are unchanged if a constant is added to all of the $a_{k}({\bf x},{\bf w})$ , causing the error function to be constant for some directions in weight space. This degeneracy is removed if an appropriate regularization term is added to the error function. Once again, the derivative of the error function with respect to the pre-activation for a particular output unit takes the familiar form (6.31).

In summary, there is a natural choice of both output-unit activation function and matching error function according to the type of problem being solved. For regression, we use linear outputs and a sum-of-squares error, for multiple independent binary classifications, we use logistic sigmoid outputs and a cross-entropy error function, and for multi-class classification, we use softmax outputs with the corresponding multi-class cross-entropy error function. For classification problems involving two classes, we can use a single logistic sigmoid output, or alternatively, we can use a network with two outputs having a softmax output activation function.

This procedure is quite general, and by considering other forms of conditional distribution, we can derive the associated error functions as the corresponding negative log likelihood. We will see an example of this in the next section when we consider multimodal network outputs.

## 6.5. Mixture Density Networks

So far in this chapter we have discussed neural networks whose outputs represent simple probability distributions comprising either a Gaussian for continuous variables or a binary distribution for discrete variables. We close the chapter by showing how a neural network can represent more general conditional probabilities by treating the outputs of the network as the parameters of a more complex distribution, in this case a Gaussian mixture model. This is known as a mixture density network, and we will see how to define the associated error function and the corresponding output-unit activation functions.

## 6.5.1 Robot kinematics example

The goal of supervised learning is to model a conditional distribution $p(\mathbf{t} | \mathbf{x})$ which for many simple regression problems is chosen to be Gaussian. However, practical machine learning problems can often have significantly non-Gaussian distributions. These can arise, for example, with inverse problems in which the distribution can be multimodal, in which case the Gaussian assumption can lead to very poor predictions.

As a simple illustration of an inverse problem, consider the kinematics of a robot arm, as illustrated in Figure 6.16. The forward problem involves finding the end effector position given the joint angles and has a unique solution. However, in practice we wish to move the end effector of the robot to a specific position, and to do this we must set appropriate joint angles. We therefore need to solve the inverse problem, which has two solutions, as seen in Figure 6.16.

Forward problems often correspond to causality in a physical system and generally have a unique solution. For instance, a specific pattern of symptoms in the human body may be caused by the presence of a particular disease. In machine learning, however, we typically have to solve an inverse problem, such as trying to predict the presence of a disease given a set of symptoms. If the forward problem involves a many-to-one mapping, then the inverse problem will have multiple solutions. For instance, several different diseases may result in the same symptoms.

Figure 6.16 (a) A two-link robot arm, in which the Cartesian coordinates $(x_{1}, x_{2})$ of the end effector are determined uniquely by the two joint angles $\theta_{1}$ and $\dot{\theta_{2}}$ and the (fixed) lengths $L_{1}$ and $L_{2}$ of the arms. This is known as the forward kinematics of the arm. (b) In practice, we have to find the joint angles that will give rise to a desired end effector position. This inverse kinematics has two solutions corresponding to ‘elbow up’ and ‘elbow down’.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/bd133f6bb1189a2162a866c8697ee068ffb6d4574c97e6800b20344bfbaec431.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/196d2938d9ed022baa600e9230cc1feeacce7cc1e4e31f2c2d5de1fd4869a886.jpg)

In the robotics example, the kinematics is defined by geometrical equations, and the multimodality is readily apparent. However, in many machine learning problems the presence of multimodality, particularly in problems involving spaces of high dimensionality, can be less obvious. For tutorial purposes, however, we will consider a simple toy problem for which we can easily visualize the multimodality. The data for this problem is generated by sampling a variable $x$ uniformly over the interval (0, 1), to give a set of values $\{x_{n}\}$ , and the corresponding target values $t_{n}$ are obtained by computing the function $x_{n} + 0.3 \sin(2 \pi x_{n})$ and then adding uniform noise over the interval $(- 0.1, 0.1)$ . The inverse problem is then obtained by keeping the same data points but exchanging the roles of x and t. Figure 6.17 shows the data sets for the forward and inverse problems, along with the results of fitting two-layer neural networks having six hidden units and a single linear output unit by minimizing a sum-of-squares error function. Least squares corresponds to maximum likelihood under a Gaussian assumption. We see that this leads to a good model for the forward problem but a very poor model for the highly non-Gaussian inverse problem.

## 6.5.2 Conditional mixture distributions

We therefore seek a general framework for modelling conditional probability distributions. This can be achieved by using a mixture model for $p(\mathbf{t} | \mathbf{x})$ in which both the mixing coefficients as well as the component densities are flexible functions of the input vector x, giving rise to a mixture density network. For any given value of x, the mixture model provides a general formalism for modelling an arbitrary conditional density function $p(\mathbf{t} | \mathbf{x})$ . Provided we consider a sufficiently flexible network, we then have a framework for approximating arbitrary conditional distributions.

Figure 6.17 On the left is the data set for a simple forward problem in which the red curve shows the result of fitting a two-layer neural network by minimizing the sum-of-squares error function. The corresponding inverse problem, shown on the right, is obtained by exchanging the roles of x and t. Here the same network, again trained by minimizing the sumof-squares error function, gives a poor fit to the data due to the multimodality of the data set.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/323890a19ac01986baf05ca080cab9e85ec3821e2006339ed38c40ab1ab24d1c.jpg)

![Figure 6.18](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/cfe903885745c148d81bc37ee3e9f27fc91a73e3e4b6c89f0a5db704ff36771c.jpg)

Figure 6.18 The mixture density network can represent general conditional probability densities $p(\mathbf{t} | \mathbf{x})$ by considering a parametric mixture model for the distribution of t whose parameters are determined by the outputs of a neural network that takes x as its input vector.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/f015063b7e9eb39a0ffa23b5249da08990689ddb8b033cd3d4a66d3170d63f26.jpg)

Here we will develop the model explicitly for Gaussian components, so that

$$
p(\mathbf{t} | \mathbf{x}) = \sum_{k = 1}^{K} \pi_{k}(\mathbf{x}) \mathcal{N} \left(\mathbf{t} | \pmb{\mu}_{k}(\mathbf{x}), \sigma_{k}^{2}(\mathbf{x}) \right).\tag{6.38}
$$

This is an example of a heteroscedastic model in which the noise variance on the data is a function of the input vector x. Instead of Gaussians, we can use other distributions for the components, such as Bernoulli distributions if the target variables are binary rather than continuous. We have also specialized to the case of isotropic covariances for the components, although the mixture density network can readily be extended to allow for general covariance matrices by representing the covariances using a Cholesky factorization (Williams, 1996). Even with isotropic components, the conditional distribution $p(\mathbf{t} | \mathbf{x})$ does not assume factorization with respect to the components of t (in contrast to the standard sum-of-squares regression model) as a consequence of the mixture distribution.

We now take the various parameters of the mixture model, namely the mixing coefficients $\pi_{k}({\bf x})$ , the means $\mu_{k}({\bf x})$ , and the variances $\sigma_{k}^{2}({\bf x})$ , to be governed by the outputs of a neural network that takes x as its input. The structure of this mixture density network is illustrated in Figure 6.18. The mixture density network is closely related to the mixture-of-experts model (Jacobs et al., 1991). The principal difference is that a mixture of experts has independent parameters for each component model in the mixture, whereas in a mixture density network, the same function is used to predict the parameters of all the component densities as well as the mixing coefficients, and so the nonlinear hidden units are shared amongst the input-dependent functions.

The neural network in Figure 6.18 can, for example, be a two-layer network having sigmoidal (tanh) hidden units. If there are $K$ components in the mixture model (6.38), and if t has L components, then the network will have K outputunit pre-activations denoted by $a_{k}^{\pi}$ that determine the mixing coefficients $\pi_{k}({\bf x})$ , K outputs denoted by $a_{k}^{\sigma}$ that determine the Gaussian standard deviations $\sigma_{k}({\bf x})$ , and $K \times L$ outputs denoted by $a_{kj}^{\mu}$ that determine the components $\mu_{kj}({\bf x})$ of the Gaussian means $\mu_{k}({\bf x})$ . The total number of network outputs is given by $(L + 2) K$ , unlike the usual L outputs for a network that simply predicts the conditional means of the target variables.

The mixing coefficients must satisfy the constraints

$$
\sum_{k = 1}^{K} \pi_{k}(\mathbf{x}) = 1, \qquad 0 \leqslant \pi_{k}(\mathbf{x}) \leqslant 1,\tag{6.39}
$$

which can be achieved using a set of softmax outputs:

$$
\pi_{k}(\mathbf x) = \frac{\exp(a_{k}^{\pi})}{\sum_{l = 1}^{K} \exp(a_{l}^{\pi})}.\tag{6.40}
$$

Similarly, the variances must satisfy $\sigma_{k}^{2}({\bf x}) \geqslant 0$ and so can be represented in terms of the exponentials of the corresponding network pre-activations using

$$
\sigma_{k}({\bf x}) = \exp(a_{k}^{\sigma}).\tag{6.41}
$$

Finally, because the means $\mu_{k}({\bf x})$ have real components, they can be represented directly by the network outputs:

$$
\mu_{kj}(\mathbf{x}) = a_{kj}^{\mu}\tag{6.42}
$$

in which the output-unit activation functions are given by the identity $f(a) = a$

The learnable parameters of the mixture density network comprise the vector w of weights and biases in the neural network, which can be set by maximum likelihood or equivalently by minimizing an error function defined to be the negative logarithm of the likelihood. For independent data, this error function takes the form

$$
E(\mathbf{w}) = - \sum_{n = 1}^{N} \ln \left\{\sum_{k = 1}^{K} \pi_{k}(\mathbf{x}_{n}, \mathbf{w}) \mathcal{N} \left(\mathbf{t}_{n} | \pmb{\mu}_{k}(\mathbf{x}_{n}, \mathbf{w}), \sigma_{k}^{2}(\mathbf{x}_{n}, \mathbf{w}) \right) \right\}\tag{6.43}
$$

where we have made the dependencies on w explicit.

## 6.5.3 Gradient optimization

To minimize the error function, we need to calculate the derivatives of the error $E(\mathbf{w})$ with respect to the components of w. We will see later how to compute these derivatives automatically. It is instructive, however, to derive suitable expressions for the derivatives of the error with respect to the output-unit pre-activations explicitly as this highlights the probabilistic interpretation of these quantities. Because the error function (6.43) is composed of a sum of terms, one for each training data point, we can consider the derivatives for a particular input vector ${\bf x}_{n}$ with associated target vector $\mathbf{t}_{n}$ . The derivatives of the total error $E$ are obtained by summing over all data points, or the individual gradients for each data point can be used directly in gradient-based optimization algorithms.

It is convenient to introduce the following variables:

$$
\gamma_{nk} = \gamma_{k}(\mathbf{t}_{n} | \mathbf{x}_{n}) = \frac{\pi_{k} \mathcal{N}_{nk}}{\sum_{l = 1}^{K} \pi_{l} \mathcal{N}_{nl}}\tag{6.44}
$$

where $\mathcal{N}_{nk}$ denotes $\mathcal{N} \left(\mathbf{t}_{n} | \pmb{\mu}_{k}(\mathbf{x}_{n}), \sigma_{k}^{2}(\mathbf{x}_{n}) \right)$ . These quantities have a natural interpretation as posterior probabilities for the components of the mixture in which the mixing coefficients $\pi_{k}({\bf x})$ are viewed as x-dependent prior probabilities.

The derivatives of the error function with respect to the network output preactivations governing the mixing coefficients are given by

$$
\frac{\partial E_{n}}{\partial a_{k}^{\pi}} = \pi_{k} - \gamma_{nk}.\tag{6.45}
$$

Similarly, the derivatives with respect to the output pre-activations controlling the component means are given by

$$
\frac{\partial E_{n}}{\partial a_{kl}^{\mu}} = \gamma_{nk} \left\{\frac{\mu_{kl} - t_{nl}}{\sigma_{k}^{2}} \right\}.\tag{6.46}
$$

Finally, the derivatives with respect to the output pre-activations controlling the component variances are given by

$$
\frac{\partial E_{n}}{\partial a_{k}^{\sigma}} = \gamma_{nk} \left\{L - \frac{\| \mathbf{t}_{n} - \pmb{\mu}_{k} \|^{2}}{\sigma_{k}^{2}} \right\}.\tag{6.47}
$$

## 6.5.4 Predictive distribution

We illustrate the use of a mixture density network by returning to the toy example of an inverse problem shown in Figure 6.17. Plots of the mixing coefficients $\pi_{k}(x)$ , the means $\mu_{k}(x)$ , and the conditional density contours corresponding to $p(t | x)$ , are shown in Figure 6.19. The outputs of the neural network, and hence the parameters in the mixture model, are necessarily continuous single-valued functions of the input variables. However, we see from Figure 6.19(c) that the model is able to produce a conditional density that is unimodal for some values of x and trimodal for other values by modulating the amplitudes of the mixing components $\pi_{k}({\bf x})$

Once a mixture density network has been trained, it can predict the conditional density function of the target data for any given value of the input vector. This conditional density represents a complete description of the generator of the data, so far as the problem of predicting the value of the output vector is concerned. From this density function, we can calculate more specific quantities that may be of interest in different applications. One of the simplest of these is the mean, corresponding to the conditional average of the target data, and is given by

$$
\mathbb{E} \left[\mathbf{t} | \mathbf{x} \right] = \int \mathbf{t} p(\mathbf{t} | \mathbf{x}) d \mathbf{t} = \sum_{k = 1}^{K} \pi_{k}(\mathbf{x}) \pmb{\mu}_{k}(\mathbf{x})\tag{6.48}
$$

Figure 6.19 (a) Plot of the mixing coefficients $\pi_{k}(x)$ as a function of x for the three mixture components in a mixture density network trained on the data shown in Figure 6.17. The model has three Gaussian components and uses a two-layer neural network with five tanh sigmoidal units in the hidden layer and nine outputs (corresponding to the three means and three variances of the Gaussian components and the three mixing coefficients). At both small and large values of $x,$ where the conditional probability density of the target data is unimodal, only one of the Gaussian components has a high value for its prior probability, whereas at intermediate values of $x,$ where the conditional density is trimodal, the three mixing coefficients have comparable values. (b) Plots of the means $\mu_{k}(x)$ using the same colour coding as for the mixing coefficients. (c) Plot of the contours of the corresponding conditional probability density of the target data for the same mixture density network. (d) Plot of the approximate conditional mode, shown by the red points, of the conditional density.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/49921b2ad279a42b8a71e92ca9f132c8298631e7dda64cedd3914d6886be4ab8.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/cc3ae79caf5b95c3826ebcb0f139973f64508ff288b64d572114ca34573cfdfa.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/1d398c05ed1dd5bd325b292b5d47a94a5b40eec2107300639661b52c3e64dab5.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/1f3fac2ce4cc467f48d5a422ad5fcf05e949f44afa1e63e2b677fce8207a6cdc.jpg)  
(d)

where we have used (6.38). Because a standard network trained by least squares approximates the conditional mean, we see that a mixture density network can reproduce the conventional least-squares result as a special case. Of course, as we have already noted, for a multimodal distribution the conditional mean is of limited value.

Exercise 6.21

We can similarly evaluate the variance of the density function about the conditional average, to give

$$
\begin{array}{lll}{s^{2}(\mathbf{x})} &{=} &{{\mathbb{E}} \left[\left\| \mathbf{t} -{\mathbb{E}}[\mathbf{t} | \mathbf{x}] \right\|^{2} | \mathbf{x} \right]} \\ &{=} &{\displaystyle \sum_{k = 1}^{K} \pi_{k}(\mathbf{x}) \left\{\sigma_{k}^{2}(\mathbf{x}) + \left\|{\pmb{\mu}}_{k}(\mathbf{x}) - \displaystyle \sum_{l = 1}^{K} \pi_{l}(\mathbf{x}){\pmb{\mu}}_{l}(\mathbf{x}) \right\|^{2} \right\}} \end{array}\tag{6.49}
$$

(6.50)

where we have used (6.38) and (6.48). This is more general than the corresponding least-squares result because the variance is a function of $\mathbf{x}.$

We have seen that for multimodal distributions, the conditional mean can give a poor representation of the data. For instance, in controlling the simple robot arm shown in Figure 6.16, we need to pick one of the two possible joint angle settings to achieve the desired end-effector location, but the average of the two solutions is not itself a solution. In such cases, the conditional mode may be of more value. Because the conditional mode for the mixture density network does not have a simple analytical solution, a numerical iteration is required. A simple alternative is to take the mean of the most probable component (i.e., the one with the largest mixing coefficient) at each value of x. This is shown for the toy data set in Figure 6.19(d).

## Exercises

6.1 (★★★) Use the result (2.126) to derive an expression for the surface area $S_{D}$ and the volume $V_{D}$ of a hypersphere of unit radius in $D$ dimensions. To do this, consider the following result, which is obtained by transforming from Cartesian to polar coordinates:

$$
\prod_{i = 1}^{D} \int_{- \infty}^{\infty} e^{- x_{i}^{2}} d x_{i} = S_{D} \int_{0}^{\infty} e^{- r^{2}} r^{D - 1} d r.\tag{6.51}
$$

Using the gamma function, defined by

$$
\Gamma(x) = \int_{0}^{\infty} t^{x - 1} e^{- t} d t\tag{6.52}
$$

together with (2.126), evaluate both sides of this equation, and hence show that

$$
S_{D} = \frac{2 \pi^{D / 2}}{\Gamma(D / 2)}.\tag{6.53}
$$

Next, by integrating with respect to the radius from 0 to 1, show that the volume of the unit hypersphere in D dimensions is given by

$$
V_{D} ={\frac{S_{D}}{D}}.\tag{6.54}
$$

Finally, use the results $\Gamma(1) = 1$ and $\Gamma(3 / 2) = \sqrt{\pi} / 2$ to show that (6.53) and (6.54) reduce to the usual expressions for $D = 2$ and $D = 3$

6.2 (★★★) Consider a hypersphere of radius a in D dimensions together with the concentric hypercube of side 2a, so that the hypersphere touches the hypercube at the centres of each of its sides. By using the results of Exercise 6.1, show that the ratio of the volume of the hypersphere to the volume of the cube is given by

$$
\frac{\mathrm{volume ~ of ~ hypersphere}}{\mathrm{volume ~ of ~ cube}} = \frac{\pi^{D / 2}}{D2^{D - 1} \Gamma(D / 2)}.\tag{6.55}
$$

Now make use of Stirling’s formula in the form

$$
\Gamma(x + 1) \simeq(2 \pi)^{1 / 2} e^{- x} x^{x + 1 / 2},\tag{6.56}
$$

which is valid for $x \gg 1$ , to show that, as $D \to \infty$ , the ratio (6.55) goes to zero. Show also that the distance from the centre of the hypercube to one of the corners divided by the perpendicular distance to one of the sides is $\sqrt{D}$ , which therefore goes to as $D \to \infty$ . From these results, we see that, in a space of high dimensionality, most of the volume of a cube is concentrated in the large number of corners, which themselves become very long ‘spikes’!

6.3 $({\star \star \star \star})$ In this exercise, we explore the behaviour of the Gaussian distribution in highdimensional spaces. Consider a Gaussian distribution in $D$ dimensions given by

$$
p(\mathbf{x}) = \frac{1}{(2 \pi \sigma^{2})^{D / 2}} \exp \left(- \frac{\| \mathbf{x} \|^{2}}{2 \sigma^{2}} \right).\tag{6.57}
$$

We wish to find the density as a function of the radius in polar coordinates in which the direction variables have been integrated out. To do this, show that the integral of the probability density over a thin shell of radius $r$ and thickness $\epsilon,$ where $\epsilon \ll 1$ , is given by $p(r) \epsilon$ where

$$
p(r) ={\frac{S_{D} r^{D - 1}}{(2 \pi \sigma^{2})^{D / 2}}} \exp \left(-{\frac{r^{2}}{2 \sigma^{2}}} \right)\tag{6.58}
$$

where $S_{D}$ is the surface area of a unit hypersphere in $D$ dimensions. Show that the function $p(r)$ has a single stationary point located, for large $D_{;}$ , at $\widehat{r} \simeq \sqrt{D} \sigma$ . By considering $p(\widehat{r} + \epsilon)$ where $\epsilon \ll{\widehat{r}},$ , show that for large $D_{\circ}$

$$
p(\widehat{r} + \epsilon) = p(\widehat{r}) \exp \left(- \frac{3 \epsilon^{2}}{2 \sigma^{2}} \right),\tag{6.59}
$$

which shows that $\widehat{r}$ is a maximum of the radial probability density and also that $p(r)$ decays exponentially away from its maximum at $\widehat{r}$ with length scale $\sigma$ . We have already seen that $\sigma \ll \widehat{r}$ for large $D_{;}$ and so we see that most of the probability mass is concentrated in a thin shell at large radius. Finally, show that the probability density $p(\mathbf{x})$ is larger at the origin than at the radius $\widehat{r}$ by a factor of $\exp(D / 2)$ We therefore see that most of the probability mass in a high-dimensional Gaussian distribution is located at a different radius from the region of high probability density.

6.4 (? ?) Consider a two-layer network function of the form (6.11) in which the hiddenunit nonlinear activation functions $h(\cdot)$ are given by logistic sigmoid functions of the form

$$
\sigma(a) = \left\{1 + \exp(- a) \right\}^{- 1}.\tag{6.60}
$$

Show that there exists an equivalent network, which computes exactly the same function, but with hidden-unit activation functions given by tanh $(a)$ where the tanh function is defined by (6.14). Hint: first find the relation between $\sigma(a)$ and tanh $(a)$ , and then show that the parameters of the two networks differ by linear transformations.

6.5 (? ?) The swish activation function (Ramachandran, Zoph, and Le, 2017) is defined by

$$
h(x) = x \sigma(\beta x)\tag{6.61}
$$

where $\sigma(x)$ is the logistic-sigmoid activation function defined by (6.13). When used in a neural network, β can be treated as a learnable parameter. Either sketch or plot using software graphs of the swish activation function as well as its first derivative for $\beta = 0.1, \beta = 1.0$ , and $\beta = 10$ . Show that when $\beta \to \infty$ , the swish function becomes the ReLU function.

6.6 (?) We saw in (5.72) that the derivative of the logistic-sigmoid activation function can be expressed in terms of the function value itself. Derive the corresponding result for the tanh activation function defined by (6.14).

6.7 (? ?) Show that the softplus activation function $\zeta(a)$ given by (6.16) satisfies the properties:

$$
\zeta(a) - \zeta(- a) = a\tag{6.62}
$$

$$
\ln \sigma(a) = - \zeta(- a)\tag{6.63}
$$

$$
{\frac{d \zeta(a)}{d a}} = \sigma(a)\tag{6.64}
$$

$$
\zeta^{- 1}(a) = \ln \left(\exp(a) - 1 \right)\tag{6.65}
$$

where $\sigma(a)$ is the logistic-sigmoid activation function given by (6.13).

6.8 (?) Show that minimization of the error function (6.25) with respect to the variance $\sigma^{2}$ gives the result (6.27).

6.9 (?) Show that maximizing the likelihood function under the conditional distribution (6.28) for a multioutput neural network is equivalent to minimizing the sum-ofsquares error function (6.29). Also, show that the noise variance that minimizes this error function is given by (6.30).

6.10 (? ?) Consider a regression problem involving multiple target variables in which it is assumed that the distribution of the targets, conditioned on the input vector x, is a Gaussian of the form

$$
p(\mathbf{t} | \mathbf{x}, \mathbf{w}) = \mathcal{N}(\mathbf{t} | \mathbf{y}(\mathbf{x}, \mathbf{w}), \pmb{\Sigma})\tag{6.66}
$$

where $\mathbf{y}(\mathbf{x}, \mathbf{w})$ is the output of a neural network with input vector x and weight vector w, and Σ is the covariance of the assumed Gaussian noise on the targets. Given a set of independent observations of x and t, write down the error function that must be minimized to find the maximum likelihood solution for w, if we assume that Σ is fixed and known. Now assume that Σ is also to be determined from the data, and write down an expression for the maximum likelihood solution for Σ. Note that the optimizations of w and Σ are now coupled, in contrast to the case of independent target variables discussed in Section 6.4.1.

6.11 (? ?) Consider a binary classification problem in which the target values are $t \in$ 0, 1 , with a network output $y(\mathbf{x}, \mathbf{w})$ that represents $p(t = 1 | \mathbf{x})$ , and suppose that there is a probability $\epsilon$ that the class label on a training data point has been incorrectly set. Assuming i.i.d. data, write down the error function corresponding to the negative log likelihood. Verify that the error function (6.33) is obtained when $\epsilon = 0$ . Note that this error function makes the model robust to incorrectly labelled data, in contrast to the usual cross-entropy error function.

6.12 (? ?) The error function (6.33) for binary classification problems was derived for a network having a logistic-sigmoid output activation function, so that $0 \leqslant y(\mathbf{x}, \mathbf{w}) \leqslant$ 1, and data having target values $t \in \{\bar{0}, 1\}$ . Derive the corresponding error function if we consider a network having an output $- 1 \leqslant y(\mathbf{x}, \mathbf{w}) \leqslant 1$ and target values $t = 1$ for class $\mathcal{C}_{1}$ and $t = - 1$ for class $\mathcal{C}_{2}$ . What would be the appropriate choice of output-unit activation function?

6.13 (?) Show that maximizing the likelihood for a multi-class neural network model in which the network outputs have the interpretation $y_{k}(\mathbf{x}, \mathbf{w}) = p(t_{k} = 1 | \mathbf{x})$ is equivalent to minimizing the cross-entropy error function (6.36).

6.14 (?) Show that the derivative of the error function (6.33) with respect to the preactivation $a_{k}$ for an output unit having a logistic-sigmoid activation function $y_{k} =$ $\sigma(a_{k})$ , where $\sigma(a)$ is given by (6.13), satisfies (6.31).

6.15 (?) Show that the derivative of the error function (6.36) with respect to the preactivation $a_{k}$ for output units having a softmax activation function (6.37) satisfies (6.31).

6.16 (? ?) Write down a pair of equations that express the Cartesian coordinates $(x_{1}, x_{2})$ for the robot arm shown in Figure 6.16 in terms of the joint angles $\theta_{1}$ and $\theta_{2}$ and the lengths $L_{1}$ and $L_{2}$ of the links. Assume the origin of the coordinate system is given by the attachment point of the lower arm. These equations define the forward kinematics of the robot arm.

6.17 (? ?) Show that the variable $\gamma_{nk}$ defined by (6.44) can be viewed as the posterior probabilities $p(k | \mathbf{t})$ for the components of the mixture distribution (6.38) in which the mixing coefficients $\pi_{k}({\bf x})$ are viewed as x-dependent prior probabilities $p(k)$ .

6.18 (? ?) Derive the result (6.45) for the derivative of the error function with respect to the network output pre-activations controlling the mixing coefficients in the mixture density network.

6.19 (? ?) Derive the result (6.46) for the derivative of the error function with respect to the network output pre-activations controlling the component means in the mixture density network.

6.20 (? ?) Derive the result (6.47) for the derivative of the error function with respect to the network output pre-activations controlling the component variances in the mixture density network.

6.21 (★★★) Verify the results (6.48) and (6.50) for the conditional mean and variance of the mixture density network model.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/201-400/images/1c4bd11754a923bf0b5cf7e595914554181ae56e1786a55ed47619c752002508.jpg)

In the previous chapter we saw that neural networks are a very broad and flexible class of functions and are able in principle to approximate any desired function to arbitrarily high accuracy given a sufficiently large number of hidden units. Moreover, we saw that deep neural networks can encode inductive biases corresponding to hierarchical representations, which prove valuable in a wide range of practical applications. We now turn to the task of finding a suitable setting for the network parameters (weights and biases), based on a set of training data.

As with the regression and classification models discussed in earlier chapters, we choose the model parameters by optimizing an error function. We have seen how to define a suitable error function for a particular application by using maximum likelihood. Although in principle the error function could be minimized numerically through a series of direct error function evaluations, this turns out to be very inefficient. Instead, we turn to another core concept that is used in deep learning, which is that optimizing the error function can be done much more efficiently by making use of gradient information, in other words by evaluating the derivatives of the error function with respect to the network parameters. This is why we took care to ensure that the function represented by the neural network is differentiable by design. Likewise, the error function itself also needs to be differentiable.

The required derivatives of the error function with respect to each of the parameters in the network can be evaluated efficiently using a technique called backpropagation, which involves successive computations that flow backwards through the network in a way that is analogous to the forward flow of function computations during the evaluation of the network outputs.

Although the likelihood is used to define an error function, the goal when optimizing the error function in a neural network is to achieve good generalization on test data. In classical statistics, maximum likelihood is used to fit a parametric model to a finite data set, in which the number of data points typically far exceeds the number of parameters in the model. The optimal solution has the maximum value of the likelihood function, and the values found for the fitted parameters are of direct interest. By contrast, modern deep learning works with very rich models containing huge numbers of learnable parameters, and the goal is never simply exact optimization. Instead, the properties and behaviour of the learning algorithm itself, along with various methods for regularization, are important in determining how well the solution generalizes to new data.


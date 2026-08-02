---
title: "Chapter 3 \u2014 From Linear Models to Multi-layer Perceptrons"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 3
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 1119
source_line_end: 1176
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 2
source_empty_image_alt: 2
non_semantic_image_alt: 2
caption_derived_image_alt: 0
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
  - natural-language-processing
  - official-syllabus
---

# Chapter 3 — From Linear Models to Multi-layer Perceptrons

> [[../README|本书目录]] · [[02-chapter-2-learning-basics-and-linear-models|上一章]] · [[04-chapter-4-feed-forward-neural-networks|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 1119–1176。
> - 本章保留 2 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 3.1 LIMITATIONS OF LINEAR MODELS: THE XOR PROBLEM

The hypothesis class of linear (and log-linear) models is severely restricted. For example, it cannot represent the XOR function, defined as:

$$
\begin{array}{l} \text{xor}(0, 0) = 0 \\ \text{xor}(1, 0) = 1 \\ \text{xor}(0, 1) = 1 \\ \text{xor}(1, 1) = 0.\end{array}
$$

That is, there is no parameterization $w \in \mathbb{R}^{2}, b \in R$ such that:

$$
\begin{array}{l}(0, 0) \cdot \boldsymbol{w} + b < 0 \\(0, 1) \cdot \boldsymbol{w} + b \geq 0 \\(1, 0) \cdot \boldsymbol{w} + b \geq 0 \\(1, 1) \cdot \boldsymbol{w} + b < 0.\end{array}
$$

To see why, consider the following plot of the XOR function, where blue Os denote the positive class and green Xs the negative class.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/2fe8c03f22580105a22a111b5b6be0e314eb1d58a1e53ff77f6885382e2ea842.jpg)

## 38 3. FROM LINEAR MODELS TO MULTI-LAYER PERCEPTRONS

It is clear that no straight line can separate the two classes.

## 3.2 NONLINEAR INPUT TRANSFORMATIONS

However, if we transform the points by feeding each of them through the nonlinear function $\phi(x_{1}, x_{2}) =[x_{1} \times x_{2}, x_{1} + x_{2}]$ , the XOR problem becomes linearly separable.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/32923007c5239111785a206234d3f90ecf119555e4079fb580e1446e55c1765f.jpg)

The function $\phi$ mapped the data into a representation that is suitable for linear classification. Having $\phi$ at our disposal, we can now easily train a linear classifier to solve the XOR problem.

$$
\hat{\boldsymbol{y}} = f(\boldsymbol{x}) = \phi(\boldsymbol{x}) \boldsymbol{W} + \boldsymbol{b}.
$$

In general, one can successfully train a linear classifier over a dataset which is not linearly separable by defining a function that will map the data to a representation in which it is linearly separable, and then train a linear classifier on the resulting representation. In the XOR example the transformed data has the same dimensions as the original one, but often in order to make the data linearly separable one needs to map it to a space with a much higher dimension.

This solution has one glaring problem, however: we need to manually define the function $\phi$ , a process which is dependent on the particular dataset, and requires a lot of human intuition.

## 3.3 KERNEL METHODS

Kernelized Support Vectors Machines (SVMs) [Boser and et al., 1992], and Kernel Methods in general [Shawe-Taylor and Cristianini, 2004], approach this problem by defining a set of generic mappings, each of them mapping the data into very high dimensional—and sometimes even infinite—spaces, and then performing linear classification in the transformed space. Working in very high dimensional spaces significantly increase the probability of finding a suitable linear separator.

One example mapping is the polynomial mapping, $\phi(x)=(x)^{d}$ . For d=2, we get $\phi(x_{1},x_{2})=(x_{1}x_{1},x_{1}x_{2},x_{2}x_{1},x_{2}x_{2})$ . This gives us all combinations of the two variables, allowing to solve the XOR problem using a linear classifier, with a polynomial increase in the number of parameters. In the XOR problem the mapping increased the dimensionality of the input (and hence the number of parameters) from 2–4. For the language identification example, the input dimensionality would have increased from 784 to $784^{2}=614,656$ dimensions.

Working in very high dimensional spaces can become computationally prohibitive, and the ingenuity in kernel methods is the use of the kernel trick [Aizerman et al., 1964, Schölkopf, 2001] that allows one to work in the transformed space without ever computing the transformed representation. The generic mappings are designed to work on many common cases, and the user needs to select the suitable one for its task, often by trial and error. A downside of the approach is that the application of the kernel trick makes the classification procedure for SVMs dependent linearly on the size of the training set, making it prohibitive for use in setups with reasonably large training sets. Another downside of high dimensional spaces is that they increase the risk of overfitting.

## 3.4 TRAINABLE MAPPING FUNCTIONS

A different approach is to define a trainable nonlinear mapping function, and train it in conjunction with the linear classifier. That is, finding the suitable representation becomes the responsibility of the training algorithm. For example, the mapping function can take the form of a parameterized linear model, followed by a nonlinear activation function g that is applied to each of the output dimensions:

$$
\begin{array}{c} \hat{y} = \phi(x) W + b \\ \phi(x) = g(xW^{\prime} + b^{\prime}).\end{array}\tag{3.1}
$$

By taking $g(x) = \max(0, x)$ and $W' = \begin{pmatrix} 1 & 1 \\ 1 & 1 \end{pmatrix}$ , $b' =(-1, 0)$ we get an equivalent mapping to $(x_1 \times x_2, x_1 + x_2)$ for the our points of interest $(0, 0)$ , $(0, 1)$ , $(1, 0)$ , and $(1, 1)$ , successfully solving the XOR problem. The entire expression $g(xW' + b')W + b$ is differentiable (although not convex), making it possible to apply gradient-based techniques to the model training, learning both the representation function and the linear classifier on top of it at the same time. This is the main idea behind deep learning and neural networks. In fact, Equation (3.1) describes a very common neural network architecture called a multi-layer perceptron (MLP). Having established the motivation, we now turn to describe multi-layer neural networks in more detail.

# Feed-forward Neural Networks


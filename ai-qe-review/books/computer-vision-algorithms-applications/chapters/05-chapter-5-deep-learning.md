---
title: "Chapter 5 \u2014 Deep learning"
book: "Computer Vision: Algorithms and Applications"
book_slug: computer-vision-algorithms-applications
course: deep-learning
chapter_number: 5
citekey: szeliski2022vision
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/computer-vision-algorithms-applications/source.pdf"
source_transcript: "transcripts/mineru/computer-vision-algorithms-applications/reading.md"
source_line_start: 5403
source_line_end: 7106
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 110
source_empty_image_alt: 110
non_semantic_image_alt: 64
caption_derived_image_alt: 46
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: true
  source_control_characters: 0
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 5 — Deep learning

> [[../README|本书目录]] · [[04-chapter-4-model-fitting-and-optimization|上一章]] · [[06-chapter-6-recognition|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Computer Vision: Algorithms and Applications（szeliski2022vision）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/computer-vision-algorithms-applications/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/computer-vision-algorithms-applications/reading.md)，源行 5403–7106。
> - 本章保留 110 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.265) × 4；PDF-confirmed control-symbol repair (PDF p.326) × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## Chapter 5 Deep Learning

5.1 Supervised learning 239   
5.1.1 Nearest neighbors 241   
5.1.2 Bayesian classification 243   
5.1.3 Logistic regression 248   
5.1.4 Support vector machines 250   
5.1.5 Decision trees and forests 254   
5.2 Unsupervised learning 257   
5.2.1 Clustering 257   
5.2.2 K-means and Gaussians mixture models 259   
5.2.3 Principal component analysis 262   
5.2.4 Manifold learning 265   
5.2.5 Semi-supervised learning 266   
5.3 Deep neural networks 268   
5.3.1 Weights and layers 270   
5.3.2 Activation functions 272   
5.3.3 Regularization and normalization 274   
5.3.4 Loss functions 280   
5.3.5 Backpropagation 284   
5.3.6 Training and optimization 287   
5.4 Convolutional neural networks 291   
5.4.1 Pooling and unpooling 295   
5.4.2 Application: Digit classification 298   
5.4.3 Network architectures 299   
5.4.4 Model zoos 304   
5.4.5 Visualizing weights and activations 307   
5.4.6 Adversarial examples 311   
5.4.7 Self-supervised learning 312   
5.5 More complex models 317   
5.5.1 Three-dimensional CNNs 317   
5.5.2 Recurrent neural networks 321   
5.5.3 Transformers 322   
5.5.4 Generative models . 328   
5.6 Additional reading 336   
5.7 Exercises . 337

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/59b5b369224212c404d771a99df339c74c0ceee5ef18945dfbef2ac469279236.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/40accd64a1b374f74bb5fb7c0627643727a6dd3f8e5706f07cb146e801d902ee.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/b337a2de11ec48a255d4d016098c85471c3a4eb75a7d242dd6ed7053ecc6699b.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/eab19fa0be80bb08470901f13f0f141bbd7bb49d26d6a97680b19e3b15bf7fae.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/b1e57008b729a68cc097bdb9a3df22e4871d434513b927ddf97783053ab0d114.jpg)  
(e)

(d)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/e076dc7414801a5ecc9c33feaa3c14ba373960bc46194d6e11096c39e1c9e989.jpg)  
(f)  
Figure 5.1 Machine learning and deep neural networks: (a) nearest neighbor classification © Glassner (2018); (b) Gaussian kernel support vector machine (Bishop 2006) © 2006 Springer; (c) a simple three-layer network © Glassner (2018); (d) the SuperVision deep neural network, courtesy of Matt Deitke after (Krizhevsky, Sutskever, and Hinton 2012); (e) network accuracy vs. size and operation counts (Canziani, Culurciello, and Paszke 2017) © 2017 IEEE; (f) visualizing network features (Zeiler and Fergus 2014) © 2014 Springer.

Machine learning techniques have always played an important and often central role in the development of computer vision algorithms. Computer vision in the 1970s grew out of the fields of artificial intelligence, digital image processing, and pattern recognition (now called machine learning), and one of the premier journals in our field (IEEE Transactions on Pattern Analysis and Machine Intelligence) still bears testament to this heritage.

The image processing, scattered data interpolation, variational energy minimization, and graphical model techniques introduced in the previous two chapters have been essential tools in computer vision over the last five decades. While elements of machine learning and pattern recognition have also been widely used, e.g., for fine-tuning algorithm parameters, they really came into their own with the availability of large-scale labeled image datasets, such as ImageNet (Deng, Dong et al. 2009; Russakovsky, Deng et al. 2015), COCO (Lin, Maire et al. 2014), and LVIS (Gupta, Dollar, and Girshick ´ 2019). Currently, deep neural networks are the most popular and widely used machine learning models in computer vision, not just for semantic classification and segmentation, but even for lower-level tasks such as image enhancement, motion estimation, and depth recovery (Bengio, LeCun, and Hinton 2021).

Figure 5.2 shows the main distinctions between traditional computer vision techniques, in which all of the processing stages were designed by hand, machine learning algorithms, in which hand-crafted features were passed on to a machine learning stage, and deep networks, in which all of the algorithm components, including mid-level representations, are learned directly from the training data.

We begin this chapter with an overview of classical machine learning approaches, such as nearest neighbors, logistic regression, support vector machines, and decision forests. This is a broad and deep subject, and we only provide a brief summary of the main popular approaches. More details on these techniques can be found in textbooks on this subject, which include Bishop (2006), Hastie, Tibshirani, and Friedman (2009), Murphy (2012), Criminisi and Shotton (2013), and Deisenroth, Faisal, and Ong (2020).

The machine learning part of the chapter focuses mostly on supervised learning for classification tasks, in which we are given a collection of inputs $\{{\bf{x}}_{i}\}$ , which may be features derived from input images, paired with their corresponding class labels (or targets) $\{t_{i}\}$ which come from a set of classes $\{\mathcal{C}_{k}\}$ . Most of the techniques described for supervised classification can easily be extended to regression, i.e., associating inputs $\{{\bf{x}}_{i}\}$ with real-valued scalar or vector outputs $\left\{\mathbf{y}_{i} \right\}$ , which we have already studied in Section 4.1. We also look at some examples of unsupervised learning (Section 5.2), where there are no labels or outputs, as well as semi-supervised learning, in which labels or targets are only provided for a subset of the samples.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/656cf91d3f17e782b752c1992e8b251aa6390c6948c4430e837b4d2452504566.jpg)  
(a) Traditional vision pipeline

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/a3cfa52ab22010cf5ee01ad48018dce52726c1611f4737fb92bec05bf47ee3a2.jpg)  
(b) Classic machine learning pipeline

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/fa90af05fbeb10c1e1a689cbb169c9de30a046221911f3921eeb2d376f38fb2e.jpg)  
(c) Deep learning pipeline  
Figure 5.2 Traditional, machine learning, and deep learning pipelines, inspired by Goodfellow, Bengio, and Courville (2016, Figure 1.5). In a classic vision pipeline such as structure from motion, both the features and the algorithm were traditionally designed by hand (although learning techniques could be used, e.g., to design more repeatable features). Classic machine learning approaches take extracted features and use machine learning to build a classifier. Deep learning pipelines learn the whole pipeline, starting from pixels all the way to outputs, using end-to-end training (indicated by the backward dashed arrows) to fine-tune the model parameters.

The second half of this chapter focuses on deep neural networks, which, over the last decade, have become the method of choice for most computer vision recognition and lowerlevel vision tasks. We begin with the elements that make up deep neural networks, including weights and activations, regularization terms, and training using backpropagation and stochastic gradient descents. Next, we introduce convolutional layers, review some of the classic architectures, and talk about how to pre-train networks and visualize their performance. Finally, we briefly touch on more advanced networks, such as three-dimensional and spatio-temporal models, as well as recurrent and generative adversarial networks.

Because machine learning and deep learning are such rich and deep topics, this chapter just briefly summarizes some of the main concepts and techniques. Comprehensive texts on classic machine learning include Bishop (2006), Hastie, Tibshirani, and Friedman (2009), Murphy (2012), and Deisenroth, Faisal, and Ong (2020) while textbooks focusing on deep learning include Goodfellow, Bengio, and Courville (2016), Glassner (2018), Glassner (2021),

![Figure 5.3](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/5f87c06a414ea627fcb1f2339674aef20999880fb63d40581395a5b974d8f36d.jpg)  
Figure 5.3 In supervised learning, paired training inputs and labels are used to estimate the model parameters that best predict the labels from their corresponding inputs. At run time, the model parameters are (usually) frozen, and the model is applied to new inputs to generate the desired outputs. © Zhang, Lipton et al. (2021, Figure 1.3)

and Zhang, Lipton et al. (2021).

## 5.1 Supervised learning

Machine learning algorithms are usually categorized as either supervised, where paired inputs and outputs are given to the learning algorithm (Figure 5.3), or unsupervised, where statistical samples are provided without any corresponding labeled outputs (Section 5.2).

As shown in Figure 5.3, supervised learning involves feeding pairs of inputs $\{\mathbf{x}_i\}$ and their corresponding *target* output values $\{t_i\}$ into a learning algorithm, which adjusts the model’s parameters so as to maximize the agreement between the model’s predictions and the target outputs. The outputs can either be discrete labels that come from a set of classes $\{\mathcal{C}_k\}$, or they can be a set of continuous, potentially vector-valued *values*, which we denote by $\mathbf{y}_i$ to make the distinction between the two cases clearer. The first task is called *classification*, since we are trying to predict class membership, while the second is called *regression*, since historically, fitting a trend to data was called by that name (Section 4.1).[^cvaa-ch5-note1]

[^cvaa-ch5-note1]: Note that in software engineering, a *regression* sometimes means a change in the code that results in degraded performance. That is not the kind of regression we will be studying here.

After a *training phase* during which all of the *training data* (labeled input-output pairs) have been processed (often by iterating over them many times), the trained model can now be used to predict new output values for previously unseen inputs. This phase is often called the *test phase*, although this sometimes fools people into focusing excessively on performance on a given test set, rather than building a system that works robustly for any plausible inputs that might arise.

In this section, we focus more on classification, since we’ve already covered some of the simpler (linear and kernel) methods for regression in the previous chapter. One of the most common applications of classification in computer vision is semantic image classification, where we wish to label a complete image (or predetermined portion) with its most likely semantic category, e.g., horse, cat, or car (Section 6.2). This is the main application for which deep networks (Sections 5.3–5.4) were originally developed. More recently, however, such networks have also been applied to continuous pixel labeling tasks such as semantic segmentation, image denoising, and depth and motion estimation. More sophisticated tasks, such as object detection and instance segmentation, will be covered in Chapter 6.

Before we begin our review of traditional supervised learning techniques, we should define a little more formally what the system is trying to learn, i.e., what we meant by “maximize the agreement between the model’s predictions and the target outputs.” Ultimately, like any other computer algorithm that will occasionally make mistakes under uncertain, noisy, and/or incomplete data, we would like to maximize its expected utility, or conversely, minimize its expected loss or risk. This is the subject of decision theory, which is explained in more detail in textbooks on machine learning (Bishop 2006, Section 1.5; Hastie, Tibshirani, and Friedman 2009, Section 2.4; Murphy 2012, Section 6.5; Deisenroth, Faisal, and Ong 2020, Section 8.2).

We usually do not have access to the true probability distribution over the inputs, let alone the joint distribution over inputs and corresponding outputs. For this reason, we often use the training data distribution as a proxy for the real-world distribution. This approximation is known as empirical risk minimization (see above citations on decision theory), where the expected risk can be estimated with

$$
E_{\mathrm{Risk}}(\mathbf{w}) = \frac{1}{N} \sum L(\mathbf{y}_{i}, \mathbf{f}(\mathbf{x}_{i}; \mathbf{w})).\tag{5.1}
$$

The loss function L measures the “cost” of predicting an output $\mathbf{f} \left(\mathbf{x}_{i}; \mathbf{w} \right)$ for input $\mathbf{x}_{i}$ and model parameters w when the corresponding target is ${\bf y}_{i}.^{2}$

This formula should by now be quite familiar, since it is the same one we introduced in the previous chapter (4.2; 4.15) for regression. In those cases, the cost (penalty) is a simple quadratic or robust function of the difference between the target output $\mathbf{y}_{i}$ and the output predicted by the model $f(\mathbf{x}_{i}; \mathbf{w})$ . In some situations, we may want the loss to model specific asymmetries in misprediction. For example, in autonomous navigation, it is usually more costly to over-estimate the distance to the nearest obstacle, potentially resulting in a collision, than to more conservatively under-estimate. We will see more examples of loss functions later on in this chapter, including Section 5.1.3 on Bayesian classification (5.19–5.24) and Section 5.3.4 on neural network loss (5.54–5.56).

In classification tasks, it is common to minimize the misclassification rate, i.e., penalizing all class prediction errors equally using a class-agnostic delta function (Bishop 2006, Sections 1.5.1–1.5.2). However, asymmetries often exist. For example, the cost of producing a false negative diagnosis in medicine, which may result in an untreated illness, is often greater than that of a false positive, which may suggest further tests. We will discuss true and false positives and negatives, along with error rates, in more detail in Section 7.1.3.

## Data preprocessing

Before we start our review of widely used machine learning techniques, we should mention that it is usually a good idea to center, standardize, and if possible, whiten the input data (Glassner 2018, Section 10.5; Bishop 2006, Section 12.1.3). Centering the feature vectors means subtracting their mean value, while standardizing means also re-scaling each component so that its variance (average squared distance from the mean) is 1.

Whitening is a more computationally expensive process, which involves computing the covariance matrix of the inputs, taking its SVD, and then rotating the coordinate system so that the final dimensions are uncorrelated and have unit variance (under a Gaussian model). While this may be quite practical and helpful for low-dimension inputs, it can become prohibitively expensive for large sets of images. (But see the discussion in Section 5.2.3 on principal component analysis, where it can be feasible and useful.)

With this background in place, we now turn our attention to some widely used supervised learning techniques, namely nearest neighbors, Bayesian classification, logistic regression, support vector machines, and decision trees and forests.

## 5.1.1 Nearest neighbors

Nearest neighbors is a very simple non-parametric technique, i.e., one that does not involve a low-parameter analytic form for the underlying distribution. Instead, the training examples are all retained, and at evaluation time the “nearest” k neighbors are found and then averaged to produce the output.

Figure 5.4 shows a simple graphical example for various values of k, i.e., from using the k = 1 nearest neighbor all the way to finding the k = 25 nearest neighbors and selecting the class with the highest count as the output label. As you can see, changing the number of neighbors affects the final class label, which changes from red to blue.

![Figure 5.4](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/3a96465a0c11302f843fa9565d44544d332b5ea4f62919f2092758a9af769269.jpg)  
Figure 5.4 Nearest neighbor classification. To determine the class of the star (<sup>F</sup>) test sample, we find the k nearest neighbors and select the most popular class. This figure shows the results for k = 1, 9, and 25 samples. © Glassner (2018)

![Figure 5.5](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/ee804e802a51b8e5a14163af7a6c5f863ad8091e7eed5565d7f8c3029280fef3.jpg)  
Figure 5.5 For noisy (intermingled) data, selecting too small a value of k results in irregular decision surfaces. Selecting too large a value can cause small regions to shrink or disappear. © Glassner (2018)

Figure 5.5 shows the effect of varying the number of neighbors in another way. The left half of the figure shows the initial samples, which fall into either blue or orange categories. As you can see, the training samples are highly intermingled, i.e., there is no clear (plausible) boundary that will correctly label all of the samples. The right side of this figure shows the decision boundaries for a k-NN classifier as we vary the values of k from 1 to 50. When k is too small, the classifier acts in a very random way, i.e., it is overfitting to the training data (Section 4.1.2). As k gets larger, the classifier underfits (over-smooths) the data, resulting in the shrinkage of the two smaller regions. The optimal number of nearest neighbors to use k is a hyperparameter for this algorithm. Techniques for determining a good value include cross-validation, which we discussed in Section 4.1.2.

While nearest neighbors is a rather brute-force machine learning technique (although

## 5.1 Supervised learning

Cover and Hart (1967) showed that it is statistically optimal in the large sample limit), but it can still be useful in many computer vision applications, such as large-scale matching and indexing (Section 7.1.4). As the number of samples gets large, however, efficient techniques must be used to find the (exact or approximate) nearest neighbors. Good algorithms for finding nearest neighbors have been developed in both the general computer science and more specialized computer vision communities.

Muja and Lowe (2014) developed a Fast Library for Approximate Nearest Neighbors (FLANN), which collects a number of previously developed algorithms and is incorporated as part of OpenCV. The library implements several powerful approximate nearest neighbor algorithms, including randomized k-d trees (Silpa-Anan and Hartley 2008), priority search k-means trees, approximate nearest neighbors (Friedman, Bentley, and Finkel 1977), and locality sensitive hashing (LSH) (Andoni and Indyk 2006). Their library can empirically determine which algorithm and parameters to use based on the characteristics of the data being indexed.

More recently, Johnson, Douze, and Jegou´ (2021) developed the GPU-enabled Faiss library<sup>4</sup> for scaling similarity search (Section 6.2.3) to billions of vectors. The library is based on product quantization (Jegou, Douze, and Schmid´ 2010), which had been shown by the authors to perform better than LSH (Gordo, Perronnin et al. 2013) on the kinds of large-scale datasets the Faiss library was developed for.

## 5.1.2 Bayesian classification

For some simple machine learning problems, e.g., if we have an analytic model of feature construction and noising, or if we can gather enough samples, we can determine the probability distributions of the feature vectors for each class $p(\mathbf{x} | \mathcal{C}_{k})$ as well as the prior class likelihoods $p(\mathcal{C}_{k}).$ <sup>5</sup> According to Bayes’ rule (4.33), the likelihood of class $\mathcal{C}_{k}$ given a feature vector x (Figure 5.6) is given by

$$
p_{k} = p(\mathcal{C}_{k} | \mathbf{x}) = \frac{p(\mathbf{x} | \mathcal{C}_{k}) p(\mathcal{C}_{k})}{\sum_{j} p(\mathbf{x} | \mathcal{C}_{j}) p(\mathcal{C}_{j})}\tag{5.2}
$$

$$
= \frac{\exp{l_{k}}}{\sum_{j} \exp{l_{j}}},\tag{5.3}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/dc4e81711c3575e379b13f673138998e7ffffcc89ddab8d12af242e3dbf02ffb.jpg)

![Figure 5.6](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/4c8099669b860fdce3dfd747bcc9e28969f18999d06ff38d1bab8a1b814e6e22.jpg)  
Figure 5.6 An example with two class conditional densities $p(x | \mathcal{C}_{k})$ along with the corresponding posterior class probabilities $p(\mathcal{C}_{k} | x)$ , which can be obtained using Bayes’ rule, i.e., by dividing by the sum of the two curves (Bishop 2006) © 2006 Springer. The vertical green line is the optimal decision boundary for minimizing the misclassification rate.

where the second form (using the exp functions) is known as the normalized exponential or softmax function.<sup>6</sup> The quantity

$$
l_{k} = \log p(\mathbf{x} | \mathcal{C}_{k}) + \log p(\mathcal{C}_{k})\tag{5.4}
$$

is the log-likelihood of sample x being from class $\mathcal{C}_{k}.{}^{7}$ It is sometimes convenient to denote the softmax function (5.3) as a vector-to-vector valued function,

$$
\begin{array}{r}{\mathbf{p} = \operatorname{softmax}(1).} \end{array}\tag{5.5}
$$

The softmax function can be viewed as a soft version of a maximum indicator function, which returns 1 for the largest value of $l_{k}$ whenever it dominates the other values. It is widely used in machine learning and statistics, including its frequent use as the final non-linearity in deep neural classification networks (Figure 5.27).

The process of using formula (5.2) to determine the likelihood of a class $\mathcal{C}_{k}$ given a feature vector x is known as Bayesian classification, since it combines a conditional feature likelihood $p(\mathbf{x} | \mathcal{C}_{k})$ with a prior distribution over classes $p(\mathcal{C}_{k})$ using Bayes’ rule to determine the posterior class probabilities. In the case where the components of the feature vector are generated independently, i.e.,

![Figure 5.7](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/21e70310011aa2f4847e9dc92a3cd87b1b146cb1d8d3f538bcee6d9eb3e346a3.jpg)  
Figure 5.7 The logistic sigmoid function $\sigma(l)$ , shown in red, along with a scaled error function, shown in dashed blue (Bishop 2006) © 2006 Springer.

$$
p(\mathbf{x} | \mathcal{C}_{k}) = \prod_{i} p(x_{i} | \mathcal{C}_{k}),\tag{5.6}
$$

the resulting technique is called a na¨ıve Bayes classifier.

For the binary (two class) classification task, we can re-write (5.3) as

$$
p(\mathcal{C}_{0} | \mathbf{x}) = \frac{1}{1 + \exp(- l)} = \sigma(l),\tag{5.7}
$$

where $l = l_{0} - l_{1}$ is the difference between the two class log likelihood and is known as the log odds or logit.

The $\sigma(l)$ function is called the logistic sigmoid function (or simply the logistic function or logistic curve), where sigmoid means an S-shaped curve (Figure 5.7). The sigmoid was a popular activation function in earlier neural networks, although it has now been replaced by functions, as discussed in Section 5.3.2.

## Linear and quadratic discriminant analysis

While probabilistic generative classification based on the normalized exponential and sigmoid can be applied to any set of log likelihoods, the formulas become much simpler when the distributions are multi-dimensional Gaussians.

For Gaussians with identical covariance matrices Σ, we have

$$
p({\bf x} |{\mathcal C}_{k}) = \frac{1}{(2 \pi)^{D / 2}} \frac{1}{\|{\boldsymbol \Sigma} \|^{1 / 2}} \exp \left\{- \frac{1}{2}({\bf x} -{\pmb \mu}_{k})^{T}{\pmb \Sigma}^{- 1}({\bf x} -{\pmb \mu}_{k}).\right\}\tag{5.8}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/59397b2ac474f2e780f20909b15d8f3ec9736a682c1f9e8762ee1b357a667897.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/6d536d95e314f07234f040b136f3cc9d80d9a506bfcd18c4a564a0ff1e12aa97.jpg)  
(b)  
Figure 5.8 Logistic regression for two identically distributed Gaussian classes (Bishop 2006) © 2006 Springer: (a) two Gaussian distributions shown in red and blue; (b) the posterior probability $p(\mathcal{C}_{0} \vert \mathbf{x})$ , shown as both the height of the function and the proportion of red ink.

In the case of two classes (binary classification), we obtain (Bishop 2006, Section 4.2.1)

$$
p(\mathcal{C}_{0} | \mathbf{x}) = \sigma(\mathbf{w}^{T} \mathbf{x} + b),\tag{5.9}
$$

with

$$
{\bf w} = \Sigma^{- 1}({\pmb \mu}_{0} -{\pmb \mu}_{1}), \quad \mathrm{and}\tag{5.10}
$$

$$
b = \frac{1}{2} \pmb{\mu}_{0}^{T} \pmb{\Sigma}^{- 1} \pmb{\mu}_{0} + \frac{1}{2} \pmb{\mu}_{1}^{T} \pmb{\Sigma}^{- 1} \pmb{\mu}_{1} + \log \frac{p(\mathcal{C}_{0})}{p(\mathcal{C}_{1})}.\tag{5.11}
$$

Equation (5.9), which we will revisit shortly in the context of non-generative (discriminative) classification (5.18), is called logistic regression, since we pass the output of a linear regression formula

$$
l(\mathbf{x}) = \mathbf{w}^{T} \mathbf{x} + b\tag{5.12}
$$

through the logistic function to obtain a class probability. Figure 5.8 illustrates this in two dimensions, there the posterior likelihood of the red class $p(\mathcal{C}_{0} \vert \mathbf{x})$ is shown on the right side.

In linear regression (5.12), w plays the role of the weight vector along which we project the feature vector x, and b plays the role of the bias, which determines where to set the classification boundary. Note that the weight direction (5.10) aligns with the vector joining the distribution means (after rotating the coordinates by the inverse covariance $\pmb{\Sigma}^{- 1})$ , while the bias term is proportional to the mean squared moments and the log class prior ratio log ${\cdot}(p(\mathcal{C}_{0}) / p(\mathcal{C}_{1}))$ .

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/d67f6980d1650336ed6cb0d87632a65fd9a37c863a73270c0c6e675468015dce.jpg)

![Figure 5.9](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/17552a0323c8a1c9e0e1a3fa71323e1f122f103a4aa6ebe8ad30d55f0dd7265f.jpg)  
Figure 5.9 Quadratic discriminant analysis (Bishop 2006) © 2006 Springer. When the class covariances $\Sigma_{k}$ are different, the decision surfaces between Gaussian distributions become quadratic surfaces.

For $K > 2$ classes, the softmax function (5.3) can be applied to the linear regression log likelihoods,

$$
l_{k}({\bf x}) ={\bf w}_{k}^{T}{\bf x} + b_{k},\tag{5.13}
$$

with

$$
\mathbf w_{k} = \Sigma^{- 1} \pmb{\mu}_{k}, \quad \mathrm{and}\tag{5.14}
$$

$$
b_{k} = - \frac{1}{2} \pmb{\mu}_{k}^{T} \pmb{\Sigma}^{- 1} \pmb{\mu}_{k} + \log p(\mathcal{C}_{k}).\tag{5.15}
$$

Because the decision boundaries along which the classification switches from one class to another are linear,

$$
\mathbf{w}_{k} \mathbf{x} + b_{k} > \mathbf{w}_{l} \mathbf{x} + b_{l},\tag{5.16}
$$

the technique of classifying examples using such criteria is known as linear discriminant analysis (Bishop 2006, Section 4.1; Murphy 2012, Section 4.2.2).<sup>8</sup>

Thus far, we have looked at the case where all of the class covariance matrices $\Sigma_{k}$ are identical. When they vary between classes, the decision surfaces are no longer linear and they become quadratic (Figure 5.9). The derivation of these quadratic decision surfaces is known as quadratic discriminant analysis (Murphy 2012, Section 4.2.1).

In the case where Gaussian class distributions are not available, we can still find the best discriminant direction using Fisher discriminant analysis (Bishop 2006, Section 4.1.4; Murphy 2012, Section 8.6.3), as shown in Figure 5.10. Such analysis can be useful in separately modeling variability within different classes, e.g., the appearance variation of different people (Section 5.2.3).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/fdbfc74431f815b64a2d36589cfc30e9c66ba0c87120ca5c196159eb53a08d59.jpg)

![Figure 5.10](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/154be1b5f85b7c36db610f370dc1aeb0d60b20ed1e35cb68afb4070f749f46a0.jpg)  
Figure 5.10 Fisher linear discriminant (Bishop 2006) © 2006 Springer. To find the projection direction to best separate two classes, we compute the sum of the two class covariances and then use its inverse to rotate the vector between the two class means.

## 5.1.3 Logistic regression

In the previous section, we derived classification rules based on posterior probabilities applied to multivariate Gaussian distributions. Quite often, however, Gaussians are not appropriate models of our class distributions and we must resort to alternative techniques.

One of the simplest among these is logistic regression, which applies the same ideas as in the previous section, i.e., a linear projection onto a weight vector,

$$
l_{i} = \mathbf{w} \cdot \mathbf{x}_{i} + b\tag{5.17}
$$

followed by a logistic function

$$
p_{i} = p(\mathcal{C}_{0} | \mathbf{x}_{i}) = \sigma(l_{i}) = \sigma(\mathbf{w}^{T} \mathbf{x}_{i} + b)\tag{5.18}
$$

to obtain (binary) class probabilities. Logistic regression is a simple example of a discriminative model, since it does not construct or assume a prior distribution over unknowns, and hence is not generative, i.e., we cannot generate random samples from the class (Bishop 2006, Section 1.5.4).

As we no longer have analytic estimates for the class means and covariances (or they are poor models of the class distributions), we need some other method to determine the weights w and bias b. We do this by maximizing the posterior log likelihoods of the correct labels.

For the binary classification task, let $t_{i} ~ \in ~ \{0, 1\}$ be the class label for each training sample $\mathbf{x}_{i}$ and $p_{i} ~ = ~ p(\mathcal{C}_{0} | \mathbf{x})$ be the estimated likelihood predicted by (5.18) for a given

## 5.1 Supervised learning

weight and bias $\big(\mathbf{w}, b \big)$ . We can maximize the likelihood of the correct labels being predicted by minimizing the negative log likelihood, i.e., the cross-entropy loss or error function,

$$
E_{\mathrm{CE}}(\mathbf{w}, b) = - \sum_{i} \{t_{i} \log p_{i} +(1 - t_{i}) \log(1 - p_{i})\}\tag{5.19}
$$

(Bishop 2006, Section 4.3.2).<sup>9</sup> Note how whenever the label $t_{i} = 0$ , we want $p_{i} = p(\mathcal{C}_{0} \vert \mathbf{x}_{i})$ to be high, and vice versa.

This formula can easily be extended to a multi-class loss by again defining the posterior probabilities as normalized exponentials over per-class linear regressions, as in (5.3) and (5.13),

$$
p_{ik} = p(\mathcal{C}_{k} | \mathbf{x}_{i}) = \frac{\exp l_{ik}}{\sum_{j} \exp l_{ij}} = \frac{1}{Z_{i}} \exp l_{ik},\tag{5.20}
$$

with

$$
l_{ik} = \mathbf{w}_{k}^{T} \mathbf{x}_{i} + b_{k}.\tag{5.21}
$$

The term $\begin{array}{r}{Z_{i} = \sum_{j} \exp l_{ij}} \end{array}$ can be a useful shorthand in derivations and is sometimes called the partition function. After some manipulation (Bishop 2006, Section 4.3.4), the corresponding multi-class cross-entropy loss (a.k.a. multinomial logistic regression objective) becomes

$$
E_{\mathrm{MCCE}}(\{{\bf w}_{k}, b_{k}\}) = - \sum_{i} \sum_{k} \tilde{t}_{ik} \log p_{ik},\tag{5.22}
$$

where the 1-of-K (or one-hot) encoding has $\tilde{t}_{ik} = 1$ if sample i belongs to class k (and 0 otherwise).<sup>10</sup> It is more common to simply use the integer class value $t_{i}$ as the target, in which case we can re-write this even more succinctly as

$$
E(\{\mathbf{w}_{k}, b_{k}\}) = - \sum_{i} \log p_{it_{i}},\tag{5.23}
$$

i.e., we simply sum up the log likelihoods of the correct class for each training sample. Substituting the softmax formula (5.20) into this loss, we can re-write it as

$$
E(\{\mathbf{w}_{k}, b_{k}\}) = \sum_{i} \left(\log Z_{i} - l_{it_{i}} \right).\tag{5.24}
$$

To determine the best set of weights and biases, $\big \{\mathbf{w}_{k}, b_{k} \big\}$ , we can use gradient descent, i.e., update their values using a Newton-Raphson second-order optimization scheme (Bishop 2006, Section 4.3.3),

$$
\mathbf{w} \mathbf{w} - \mathbf{H}^{- 1} \nabla E(\mathbf{w}),\tag{5.25}
$$

where E is the gradient of the loss function E with respect to the weight variables w, and H is the Hessian matrix of second derivatives of E. Because the cross-entropy functions are not linear in the unknown weights, we need to iteratively solve this equation a few times to arrive at a good solution. Since the elements in H are updated after each iteration, this technique is also known as iteratively reweighted least squares, which we will study in more detail in Section 8.1.4. While many non-linear optimization problems have multiple local minima, the cross-entropy functions described in this section do not, so we are guaranteed to arrive at a unique solution.

Logistic regression does have some limitations, which is why it is often used for only the simplest classification tasks. If the classes in feature space are not linearly separable, using simple projections onto weight vectors may not produce adequate decision surfaces. In this case, kernel methods (Sections 4.1.1 and 5.1.4; Bishop 2006, Chapter $\begin{array}{r}{6;} \end{array}$ Murphy 2012, Chapter 14), which measure the distances between new (test) feature vectors and select training examples, can often provide good solutions.

Another problem with logistic regression is that if the classes actually are separable (either in the original feature space, or the lifted kernel space), there can be more than a single unique separating plane, as illustrated in Figure 5.11a. Furthermore, unless regularized, the weights w will continue to grow larger, as larger values of $\mathbf{w}_{k}$ lead to larger $p_{ik}$ values (once a separating plane has been found) and hence a smaller overall loss.

For this reason, techniques that place the decision surfaces in a way that maximizes their separation to labeled examples have been developed, as we discuss next.

## 5.1.4 Support vector machines

As we have just mentioned, in some applications of logistic regression we cannot determine a single optimal decision surface (choice of weight and bias vectors $\big \{\mathbf{w}_{k}, b_{k} \big\}$ in (5.21)) because there are gaps in the feature space where any number of planes could be introduced. Consider Figure 5.11a, where the two classes are denoted in cyan and magenta colors. In addition to the two dashed lines and the solid line, there are infinitely many other lines that will also cleanly separate the two classes, including a swath of horizontal lines. Since the classification error for any of these lines is zero, how can we choose the best decision surface, keeping in mind that we only have a limited number of training examples, and that actual run-time examples

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/02fe745d7c6cff803d7730a63cab7a6f403a3ac23880f0dd911364133e910549.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/f8016d9243caf9070d42895fd5ff54ca1c55c0226152098a93856f4194436600.jpg)  
(b)  
Figure 5.11 (a) A support vector machine (SVM) finds the linear decision surface (hyperplane) that maximizes the margin to the nearest training examples, which are called the support vectors © Glassner (2018). (b) A two-dimensional two class example of a Gaussian kernel support vector machine (Bishop 2006) © 2006 Springer. The red and blue s indicate the training samples, and the samples circled in green are the support vectors. The black lines indicate iso-contours of the kernel regression function, with the contours containing the blue and red support vectors indicating the 1 contours and the dark contour in between being the decision surface.

## may fall somewhere in between?

The answer to this problem is to use maximum margin classifiers (Bishop 2006, Section 7.1), as shown in Figure 5.11a, where the dashed lines indicate two parallel decision surfaces that have the maximum margin, i.e., the largest perpendicular distance between them. The solid line, which represents the hyperplane half-way between the dashed hyperplanes, is the maximum margin classifier.

Why is this a good idea? There are several potential derivations (Bishop 2006, Section 7.1), but a fairly intuitive explanation is that there may be real-world examples coming from the cyan and magenta classes that we have not yet seen. Under certain assumptions, the maximum margin classifier provides our best bet for correctly classifying as many of these unseen examples as possible.

To determine the maximum margin classifier, we need to find a weight-bias pair $\mathbf{\Psi}({\mathbf{w}}, b)$ for which all regression values $l_{i} = \mathbf{w} \cdot \mathbf{x}_{i} + b(5.17)$ have an absolute value of at least 1 as well as the correct sign. To denote this more compactly, let

$$
\hat{t}_{i} = 2t_{i} - 1, \quad \hat{t}_{i} \in \{- 1, 1\}\tag{5.26}
$$

be the signed class label. We can now re-write the inequality condition as

$$
\hat{t}_{i}(\mathbf{w} \cdot \mathbf{x}_{i} + b) \geq 1.\tag{5.27}
$$

To maximize the margin, we simply find the smallest norm weight vector w that satisfies (5.27), i.e., we solve the optimization problem

$$
\arg \operatorname{min}_{\mathbf{w}, b} \left\| \mathbf{w} \right\|^{2}\tag{5.28}
$$

subject to (5.27). This is a classic quadratic programming problem, which can be solved using the method of Lagrange multipliers, as described in Bishop (2006, Section 7.1).

The inequality constraints are exactly satisfied, i.e., they turn into equalities, along the two dashed lines in Figure 5.11a, where we have $l_{i} = \mathbf{wx}_{i} + b = \pm 1$ . The circled points that touch the dashed lines are called the support vectors.<sup>11</sup> For a simple linear classifier, which can be denoted with a single weight and bias pair $({\bf w}, b)$ , there is no real advantage to computing the support vectors, except that they help us estimate the decision surface. However, as we will shortly see, when we apply kernel regression, having a small number of support vectors is a huge advantage.

What happens if the two classes are not linearly separable, and in fact require a complex curved surface to correctly classify samples, as in Figure 5.11b? In this case, we can replace linear regression with kernel regression (4.3), which we introduced in Section 4.1.1. Rather than multiplying the weight vector w with the feature vector x, we instead multiply it with the value of K kernel functions centered at the data point locations $\mathbf{x}_{k}$

$$
l_{i} = f(\mathbf{x}_{i}; \mathbf{w}, b) = \sum_{k} w_{k} \phi(\| \mathbf{x}_{i} - \mathbf{x}_{k} \|) + b.\tag{5.29}
$$

This is where the power of support vector machines truly comes in.

Instead of requiring the summation over all training samples $\mathbf{x}_{k}$ , once we solve for the maximum margin classifier only a small subset of support vectors needs to be retained, as shown by the circled crosses in Figure 5.11b. As you can see in this figure, the decision boundary denoted by the dark black line nicely separates the red and blue class samples. Note that as with other applications of kernel regression, the width of the radial basis functions is still a free hyperparameter that must be reasonably tuned to avoid underfitting and overfitting.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/b1de32fb68842e1c16c09e9ad190f4b45a8a844ef27aad824aa4ccc99f605af6.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/b5bdf754dde62aaa72332e8401f1b767c02841522ff09fe5ed0b242836070f81.jpg)  
(b)  
Figure 5.12 Support vector machine for overlapping class distributions (Bishop 2006) © 2006 Springer. (a) The green circled point is on the wrong side of the $y = 1$ decision contour and has a penalty of $\xi = 1 - y > 0.$ . (b) The “hinge” loss used in support vector machines is shown in blue, along with a rescaled version of the logistic regression loss function, shown in red, the misclassification error in black, and the squared error in green.

Hinge loss. So far, we have focused on classification problems that are separable, i.e., for which a decision boundary exists that correctly classifies all the training examples. Support vector machines can also be applied to overlapping (mixed) class distributions (Figure 5.12a), which we previously approached using logistic regression. In this case, we replace the inequality conditions (5.27), i.e., $\hat{t}_{i} l_{i} \geq 1$ , with a hinge loss penalty

$$
\begin{array}{r}{E_{\mathrm{HL}}(l_{i}, \hat{t}_{i}) =[1 - \hat{t}_{i} l_{i}]_{+},[1 - \hat{t}_{i} l_{i}]_{+},} \end{array}\tag{5.30}
$$

where $[\cdot]_{+}$ denotes the positive part, i.e. $[x] + = \operatorname{max}(0, x)$ . The hinge loss penalty, shown in blue in Figure 5.12b, is 0 whenever the (previous) inequality is satisfied and ramps up linearly depending on how much the inequality is violated. To find the optimal weight values $\mathbf{\Psi}({\mathbf{w}}, b)$ we minimize the regularized sum of hinge loss values,

$$
E_{\mathrm{SV}}(\mathbf{w}, b) = \sum_{i} E_{\mathrm{HL}}(l_{i}(\mathbf{x}_{i}; \mathbf{w}, b), \hat{t}_{i}) + \lambda \| \mathbf{w} \|^{2}.\tag{5.31}
$$

Figure 5.12b compares the hinge loss to the logistic regression (cross-entropy) loss in (5.19). The hinge loss imposes no penalty on training samples that are on the correct side of the $| l_{i} | > 1$ boundary, whereas the cross-entropy loss prefers larger absolute values. While, in this section, we have focused on the two-class version of support vector machines, Bishop (2006, Chapter 7) describes the extension to multiple classes as well as efficient optimization algorithms such as sequential minimal optimization (SMO) (Platt 1989). There’s also a nice online tutorial on the scikit-learn website.<sup>12</sup> A survey of SVMs and other kernel methods applied to computer vision can be found in Lampert (2008).

## 5.1.5 Decision trees and forests

In contrast to most of the supervised learning techniques we have studied so far in this chapter, which process complete feature vectors all at once (with either linear projections or distances to training examples), decision trees perform a sequence of simpler operations, often just looking at individual feature elements before deciding which element to look at next (Hastie, Tibshirani, and Friedman 2009, Chapter 17; Glassner 2018, Section 14.5; Criminisi, Shotton, and Konukoglu 2012; Criminisi and Shotton 2013). (Note that the boosting approaches we study in Section 6.3.1 also use similar simple decision stumps.) While decision trees have been used in statistical machine learning for several decades (Breiman, Friedman et al. 1984), the application of their more powerful extension, namely decision forests, only started gaining traction in computer vision a little over a decade ago (Lepetit and Fua 2006; Shotton, Johnson, and Cipolla 2008; Shotton, Girshick et al. 2013). Decision trees, like support vector machines, are discriminative classifiers (or regressors), since they never explicitly form a probabilistic (generative) model of the data they are classifying.

Figure 5.13 illustrates the basic concepts behind decision trees and random forests. In this example, training samples come from four different classes, each shown in a different color (a). A decision tree (b) is constructed top-to-bottom by selecting decisions at each node that split the training samples that have made it to that node into more specific (lower entropy) distributions. The thickness of each link shows the number of samples that get classified along that path, and the color of the link is the blend of the class colors that flow through that link. The color histograms show the class distributions at a few of the interior nodes.

A random forest (c) is created by building a set of decision trees, each of which makes slightly different decisions. At test (classification) time, a new sample is classified by each of the trees in the random forest, and the class distributions at the final leaf nodes are averaged to provide an answer that is more accurate than could be obtained with a single tree (with a given depth).

Random forests have several design parameters, which can be used to tailor their accuracy, generalization, and run-time and space complexity. These parameters include:

- the depth of each tree D,

- the number of trees T , and

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/4768f6ead5df055a3ddca589785c7b5bd982c60c8989e2e66421a51989a3ae58.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/ede54078fc26b7dbb19f2d04663c1786e9e78654dfb2307b92120a35a68eacb5.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/0507dbf8cac4fb5d259d62798901e8497e55cdf6e7b4466020c978e2d93e00ed.jpg)  
(b)  
(c)  
Figure 5.13 Decision trees and forests (Criminisi and Shotton 2013) © 2013 Springer. The top left figure (a) shows a set of training samples tags with four different class colors. The top right (b) shows a single decision tree with a distribution of classes at each node (the root node has the same distribution as the entire training set). During testing (c), each new example (feature vector) is tested at the root node, and depending on this test result (e.g., the comparison of some element to a threshold), a decision is made to walk down the tree to one of its children. This continues until a leaf node with a particular class distribution is reached. During training (b), decisions are selected such that they reduce the entropy (increase class specificity) at the node’s children. The bottom diagram (c) shows an ensemble of three trees. After a particular test example has been classified by each tree, the class distributions of the leaf nodes of all the constituent trees are averaged.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/e22ba7afc708cd8b2a25bfdcc957e98c3986eaca697559b2a0ee525b06563ad8.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/616981cd418d3ae3ea93bad610f1d4feca28ff2af7f0d1a9c007a5994840d339.jpg)  
(b)  
Figure 5.14 Random forest decision surfaces (Criminisi and Shotton 2013) © 2013 Springer. Figures (a) and (b) show smaller and larger amounts of “noise” between the $T = 400$ tree forests obtained by using $\rho \ : = \ : 500$ and $\rho = 5$ random hypotheses at each split node. Withing each figure, the two rows show trees of different depths (D = 5 and 13), while the columns show the effects of using axis-aligned or linear decision surfaces (“weak learners”).

- the number of samples examined at node construction time $\rho.$

By only looking at a random subset $\rho$ of all the training examples, each tree ends up having different decision functions at each node, so that the ensemble of trees can be averaged to produce softer decision boundaries.

Figure 5.14 shows the effects of some of these parameters on a simple four-class twodimensional spiral dataset. In this figure, the number of trees has been fixed to $T = 400$ Criminisi and Shotton (2013, Chapter 4) have additional figures showing the effect of varying more parameters. The left (a) and right (b) halves of this figure show the effects of having less randomness $(\rho = 500)$ and more randomness $(\rho = 5)$ at the decision nodes. Less random trees produce sharper decision surfaces but may not generalize as well. Within each $2 \times 2$ grid of images, the top row shows a shallower $D = 5$ tree, while the bottom row shows a deeper $D = 13$ tree, which leads to finer details in the decision boundary. (As with all machine learning, better performance on training data may not lead to better generalization because of overfitting.) Finally, the right column shows what happens if axis-aligned (single element) decisions are replaced with linear combinations of feature elements.

When applied to computer vision, decision trees first made an impact in keypoint recognition (Lepetit and Fua 2006) and image segmentation (Shotton, Johnson, and Cipolla 2008). They were one of the key ingredients (along with massive amounts of synthetic training data) in the breakthrough success of human pose estimation from Kinect depth images (Shotton, Girshick et al. 2013). They also led to state-of-the-art medical image segmentation systems (Criminisi, Robertson et al. 2013), although these have now been supplanted by deep neural networks (Kamnitsas, Ferrante et al. 2016). Most of these applications, along with additional ones, are reviewed in the book edited by Criminisi and Shotton (2013).

## 5.2 Unsupervised learning

Thus far in this chapter, we have focused on supervised learning techniques where we are given training data consisting of paired input and target examples. In some applications, however, we are only given a set of data, which we wish to characterize, e.g., to see if there are any patterns, regularities, or typical distributions. This is typically the realm of classical statistics. In the machine learning community, this scenario is usually called unsupervised learning, since the sample data comes without labels. Examples of applications in computer vision include image segmentation (Section 7.5) and face and body recognition and reconstruction (Sections 13.6.2).

In this section, we look at some of the more widely used techniques in computer vision, namely clustering and mixture modeling (e.g., for segmentation) and principal component analysis (for appearance and shape modeling). Many other techniques are available, and are covered in textbooks on machine learning, such as Bishop (2006, Chapter 9), Hastie, Tibshirani, and Friedman (2009, Chapter 14), and Murphy (2012, Section 1.3).

## 5.2.1 Clustering

One of the simplest things you can do with your sample data is to group it into sets based on similarities (e.g., vector distances). In statistics, this problem is known as cluster analysis and is a widely studied area with hundreds of different algorithms (Jain and Dubes 1988; Kaufman and Rousseeuw 1990; Jain, Duin, and Mao 2000; Jain, Topchy et al. 2004). Murphy (2012, Chapter 25) has a nice exposition on clustering algorithms, including affinity propagation, spectral clustering, graph Laplacian, hierarchical, agglomerative, and divisive clustering. The survey by Xu and Wunsch (2005) is even more comprehensive, covering almost 300 different papers and such topics as similarity measures, vector quantization, mixture modeling, kernel methods, combinatorial and neural network algorithms, and visualization. Figure 5.15 shows some of the algorithms implemented in the https://scikit-learn.org cluster analysis package applied to some simple two-dimensional examples.

![Figure 5.15](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/40596c0facf956c286c00376c0ed8f72d8132a62eba3f31a13f202ef59b0e2ba.jpg)  
Figure 5.15 Comparison of different clustering algorithms on some toy datasets, generated using a simplified version of https:// scikit-learn.org/ stable/ auto examples/ cluster/ plot cluster comparison.html#sphx-glr-auto-examples-cluster-plot-cluster-comparison-py.

Splitting an image into successively finer regions (divisive clustering) is one of the oldest techniques in computer vision. Ohlander, Price, and Reddy (1978) present such a technique, which first computes a histogram for the whole image and then finds a threshold that best separates the large peaks in the histogram. This process is repeated until regions are either fairly uniform or below a certain size. More recent splitting algorithms often optimize some metric of intra-region similarity and inter-region dissimilarity. These are covered in Sections 7.5.3 and 4.3.2.

Region merging techniques also date back to the beginnings of computer vision. Brice and Fennema (1970) use a dual grid for representing boundaries between pixels and merge regions based on their relative boundary lengths and the strength of the visible edges at these boundaries.

In data clustering, algorithms can link clusters together based on the distance between their closest points (single-link clustering), their farthest points (complete-link clustering), or something in between (Jain, Topchy et al. 2004). Kamvar, Klein, and Manning (2002) provide a probabilistic interpretation of these algorithms and show how additional models can be incorporated within this framework. Applications of such agglomerative clustering (region merging) algorithms to image segmentation are discussed in Section 7.5.

Mean-shift (Section 7.5.2) and mode finding techniques, such as k-means and mixtures of Gaussians, model the feature vectors associated with each pixel (e.g., color and position) as samples from an unknown probability density function and then try to find clusters (modes) in this distribution.

Consider the color image shown in Figure 7.53a. How would you segment this image based on color alone? Figure 7.53b shows the distribution of pixels in ${\bf L}^{*}{\bf u}^{*}{\bf v}^{*}$ space, which is equivalent to what a vision algorithm that ignores spatial location would see. To make the visualization simpler, let us only consider the $\mathrm{L}^{*} u^{*}$ coordinates, as shown in Figure 7.53c. How many obvious (elongated) clusters do you see? How would you go about finding these clusters?

The k-means and mixtures of Gaussians techniques use a parametric model of the density function to answer this question, i.e., they assume the density is the superposition of a small number of simpler distributions (e.g., Gaussians) whose locations (centers) and shape (covariance) can be estimated. Mean shift, on the other hand, smoothes the distribution and finds its peaks as well as the regions of feature space that correspond to each peak. Since a complete density is being modeled, this approach is called non-parametric (Bishop 2006).

## 5.2.2 K-means and Gaussians mixture models

K-means implicitly model the probability density as a superposition of spherically symmetric distributions and does not require any probabilistic reasoning or modeling (Bishop 2006). Instead, the algorithm is given the number of clusters k it is supposed to find and is initialized by randomly sampling k centers from the input feature vectors. It then iteratively updates the cluster center location based on the samples that are closest to each center (Figure 5.16). Techniques have also been developed for splitting or merging cluster centers based on their statistics, and for accelerating the process of finding the nearest mean center (Bishop 2006).

In mixtures of Gaussians, each cluster center is augmented by a covariance matrix whose values are re-estimated from the corresponding samples (Figure 5.17). Instead of using nearest neighbors to associate input samples with cluster centers, a Mahalanobis distance (Ap-

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/fbcda3618f7e7c93c42e8c51278673a8f7fafecf17413f2f94643fd49bc6f55e.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/a5a9e899b72eb18ef89175e794f915d26c9af0fc6907ba66a564867d5582907e.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/245636f3a777129ab7cd9c58ae58ddd0233781fba2691052f36adb49d8e263f9.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/1090bb34298829e263b120ddc17420a346a78ac4c17fc4d5455331bc9b56b19f.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/d5628bf63fa8c3555dbaa57cb4ba3543b41ae6e20a5436975f6d0ba027ab81cd.jpg)

![Figure 5.16](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/af2b1b6cc0769a7b7ce32706def9fcdb300254e7382a54623cfd94be647e3bea.jpg)  
Figure 5.16 The k-means algorithm starts with a set of samples and the number of desired clusters (in this case, k = 2) (Bishop 2006) © 2006 Springer. It iteratively assigns samples to the nearest mean, and then re-computes the mean center until convergence.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/69614b2332ded938781531b373ba16d4696ce4a6c1036ee136f24b3162232202.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/6775743e0375147d5a5c4023d21677973728a3dc415f9e9143b236ad41ca4a02.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/8f938fe0064bb997f7879d21dcea6b5dca550b6e603e3a97ed45c7ee5c88273f.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/a781bf5a3771df8cbf314420b72f6f563fae76d8f6d2cc60332e486d043b3b78.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/caf4a843986c1f7be4f159ac2e35ec6c7ccb9b99031acbf22c5a7e4586ecd62b.jpg)

![Figure 5.17](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/e98da0f6da35ae4290b151194f88924d52f1c320b3cbdb5a7e5da10cd0d1ae42.jpg)  
Figure 5.17 Gaussian mixture modeling (GMM) using expectation maximization (EM) (Bishop 2006) © 2006 Springer. Samples are softly assigned to cluster centers based on their Mahalanobis distance (inverse covariance weighted distance), and the new means and covariances are recomputed based on these weighted assignments.

## 5.2 Unsupervised learning

pendix B.1) is used:

$$
d(\mathbf{x}_{i},{\pmb \mu}_{k};{\pmb \Sigma}_{k}) = \| \mathbf{x}_{i} -{\pmb \mu}_{k} \|_{{\pmb \Sigma}_{k}^{- 1}} =(\mathbf{x}_{i} -{\pmb \mu}_{k})^{T}{\pmb \Sigma}_{k}^{- 1}(\mathbf{x}_{i} -{\pmb \mu}_{k})\tag{5.32}
$$

where $\mathbf{x}_{i}$ are the input samples, $\mu_{k}$ are the cluster centers, and $\Sigma_{k}$ are their covariance estimates. Samples can be associated with the nearest cluster center (a hard assignment of membership) or can be softly assigned to several nearby clusters.

This latter, more commonly used, approach corresponds to iteratively re-estimating the parameters for a Gaussians mixture model,

$$
p({\mathbf x} | \{\pi_{k}, \pmb{\mu}_{k}, \pmb{\Sigma}_{k}\}) = \sum_{k} \pi_{k} \mathcal{N}({\mathbf x} | \pmb{\mu}_{k}, \pmb{\Sigma}_{k}),\tag{5.33}
$$

where $\pi_{k}$ are the mixing coefficients, $\mu_{k}$ and $\Sigma_{k}$ are the Gaussian means and covariances, and

$$
\mathcal{N}({\mathbf{x}} |{\boldsymbol{\mu}}_{k}, \Sigma_{k}) = \frac{1}{| \Sigma_{k} |} e^{- d({\mathbf{x}},{\boldsymbol{\mu}}_{k}; \Sigma_{k})}\tag{5.34}
$$

is the normal (Gaussian) distribution (Bishop 2006).

To iteratively compute (a local) maximum likely estimate for the unknown mixture parameters $\{\pi_{k}, \mu_{k}, \Sigma_{k}\}$ , the expectation maximization (EM) algorithm (Shlezinger 1968; Dempster, Laird, and Rubin 1977) proceeds in two alternating stages:

1. The expectation stage (E step) estimates the responsibilities

$$
z_{ik} = \frac{1}{Z_{i}} \pi_{k} \mathcal{N}({\bf x} |{\pmb \mu}_{k},{\pmb \Sigma}_{k}) \qquad \mathrm{with} \qquad \sum_{k} z_{ik} = 1,\tag{5.35}
$$

which are the estimates of how likely a sample $\mathbf{x}_{i}$ was generated from the kth Gaussian cluster.

2. The maximization stage (M step) updates the parameter values

$$
\pmb{\mu}_{k} = \frac{1}{N_{k}} \sum_{i} z_{ik} \mathbf{x}_{i},\tag{5.36}
$$

$$
\pmb{\Sigma}_{k} = \frac{1}{N_{k}} \sum_{i} z_{ik}(\mathbf x_{i} - \pmb \mu_{k})(\mathbf x_{i} - \pmb \mu_{k})^{T},\tag{5.37}
$$

$$
\pi_{k} ={\frac{N_{k}}{N}},\tag{5.38}
$$

where

$$
N_{k} = \sum_{i} z_{ik}.\tag{5.39}
$$

is an estimate of the number of sample points assigned to each cluster.

Bishop (2006) has a wonderful exposition of both mixture of Gaussians estimation and the more general topic of expectation maximization.

In the context of image segmentation, Ma, Derksen et al. (2007) present a nice review of segmentation using mixtures of Gaussians and develop their own extension based on Minimum Description Length (MDL) coding, which they show produces good results on the Berkeley segmentation dataset.

## 5.2.3 Principal component analysis

As we just saw in mixture analysis, modeling the samples within a cluster with a multivariate Gaussian can be a powerful way to capture their distribution. Unfortunately, as the dimensionality of our sample space increases, estimating the full covariance quickly becomes infeasible.

Consider, for example, the space of all frontal faces (Figure 5.18). For an image consisting of P pixels, the covariance matrix has a size of $P \times P$ . Fortunately, the full covariance normally does not have to be modeled, since a lower-rank approximation can be estimated using principal component analysis, as described in Appendix A.1.2.

PCA was originally used in computer vision for modeling faces, i.e., eigenfaces, initially for gray-scale images (Kirby and Sirovich 1990; Turk and Pentland 1991), and then for 3D models (Blanz and Vetter 1999; Egger, Smith et al. 2020) (Section 13.6.2) and active appearance models (Section 6.2.4), where they were also used to model facial shape deformations (Rowland and Perrett 1995; Cootes, Edwards, and Taylor 2001; Matthews, Xiao, and Baker 2007).

Eigenfaces. Eigenfaces rely on the observation first made by Kirby and Sirovich (1990) that an arbitrary face image x can be compressed and reconstructed by starting with a mean image m (Figure 6.1b) and adding a small number of scaled signed images $\mathbf{u}_{i}$

$$
\tilde{\mathbf{x}} = \mathbf{m} + \sum_{i = 0}^{M - 1} a_{i} \mathbf{u}_{i},\tag{5.40}
$$

where the signed basis images (Figure 5.18b) can be derived from an ensemble of training images using principal component analysis (also known as eigenvalue analysis or the Karhunen–Loeve transform\` ). Turk and Pentland (1991) recognized that the coefficients $a_{i}$ in the eigenface expansion could themselves be used to construct a fast image matching algorithm.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/31a39be17c8a10d9cce4afe7a738b3c1499d22f921ecdb6dae856da187845ddd.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/f95a503311266288449d93a92c3a9be5f1c4562179510f8ba0442f08dab7b357.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/b0d4cd39a661eca48a55826ee2084197cbbe30200e123b8ee30d810e34893e92.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/e7806bf0278c308c22250b52971519583de85bc6993e94c1abc2641a461a7788.jpg)  
(d)  
Figure 5.18 Face modeling and compression using eigenfaces (Moghaddam and Pentland 1997) © 1997 IEEE: (a) input image; (b) the first eight eigenfaces; (c) image reconstructed by projecting onto this basis and compressing the image to 85 bytes; (d) image reconstructed using JPEG (530 bytes).

In more detail, we start with a collection of training images $\{\mathbf{x}_{j}\}$ , from which we compute the mean image m and a scatter or covariance matrix

$$
\mathbf{C} = \frac{1}{N} \sum_{j = 0}^{N - 1}(\mathbf{x}_{j} - \mathbf{m})(\mathbf{x}_{j} - \mathbf{m})^{T}.\tag{5.41}
$$

We can apply the eigenvalue decomposition (A.6) to represent this matrix as

$$
\mathbf{C} = \mathbf{U} \mathbf{A} \mathbf{U}^{T} = \sum_{i = 0}^{N - 1} \lambda_{i} \mathbf{u}_{i} \mathbf{u}_{i}^{T},\tag{5.42}
$$

where the $\lambda_{i}$ are the eigenvalues of C and the $\mathbf{u}_{i}$ are the eigenvectors. For general images, Kirby and Sirovich (1990) call these vectors eigenpictures; for faces, Turk and Pentland (1991) call them eigenfaces (Figure 5.18b).<sup>13</sup>

Two important properties of the eigenvalue decomposition are that the optimal (best approximation) coefficients $a_{i}$ for any new image x can be computed as

$$
a_{i} =({\bf x} -{\bf m}) \cdot{\bf u}_{i},\tag{5.43}
$$

and that, assuming the eigenvalues $\{\lambda_{i}\}$ are sorted in decreasing order, truncating the approximation given in (5.40) at any point M gives the best possible approximation (least error) between ˜x and x. Figure 5.18c shows the resulting approximation corresponding to Figure 5.18a and shows how much better it is at compressing a face image than JPEG.

Truncating the eigenface decomposition of a face image (5.40) after M components is equivalent to projecting the image onto a linear subspace F , which we can call the face space (Figure 5.19). Because the eigenvectors (eigenfaces) are orthogonal and of unit norm, the distance of a projected face ˜x to the mean face m can be written as

![Figure 5.19](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/e0d1aca6c9421daa7fa0f50bc423185cbe4a7d81ca5c55c08a7923020d86a212.jpg)  
Figure 5.19 Projection onto the linear subspace spanned by the eigenface images (Moghaddam and Pentland 1997) © 1997 IEEE. The distance from face space (DFFS) is the orthogonal distance to the plane, while the distance in face space (DIFS) is the distance along the plane from the mean image. Both distances can be turned into Mahalanobis distances and given probabilistic interpretations.

$$
\mathrm{DIFS} = \| \tilde{\mathbf{x}} - \mathbf{m} \| = \left[\sum_{i = 0}^{M - 1} a_{i}^{2} \right]^{1 / 2},\tag{5.44}
$$

where DIFS stands for distance in face space (Moghaddam and Pentland 1997). The remaining distance between the original image x and its projection onto face space ˜x, i.e., the distance from face space (DFFS), can be computed directly in pixel space and represents the “faceness” of a particular image. It is also possible to measure the distance between two different faces in face space by taking the norm of their eigenface coefficients difference.

Computing such distances in Euclidean vector space, however, does not exploit the additional information that the eigenvalue decomposition of the covariance matrix (5.42) provides. To properly weight the distance based on the measured covariance, we can use the Mahalanobis distance (5.32) (Appendix B.1). A similar analysis can be performed for computing a sensible difference from face space (DFFS) (Moghaddam and Pentland 1997) and the two terms can be combined to produce an estimate of the likelihood of being a true face, which can be useful in doing face detection (Section 6.3.1). More detailed explanations of probabilistic and Bayesian PCA can be found in textbooks on statistical learning (Bishop 2006; Hastie, Tibshirani, and Friedman 2009; Murphy 2012), which also discuss techniques for selecting the optimum number of components M to use in modeling a distribution.

## 5.2 Unsupervised learning

The original work on eigenfaces for recognition (Turk and Pentland 1991) was extended in Moghaddam and Pentland (1997), Heisele, Ho et al. (2003), and Heisele, Serre, and Poggio (2007) to include modular eigenenspaces for separately modeling the appearance of different facial components such as the eyes, nose, and mouth, as well as view-based eigenspaces to separately model different views of a face. It was also extended by Belhumeur, Hespanha, and Kriegman (1997) to handle appearance variation due to illumination, modeling intrapersonal and extrapersonal variability separately, and using Fisher linear discriminant analysis (Figure 5.10) to perform recognition. A Bayesian extension of this work was subsequently developed by Moghaddam, Jebara, and Pentland (2000). These extensions are described in more detail in the cited papers, as well as the first edition of this book (Szeliski 2010, Section 14.2).

It is also possible to generalize the bilinear factorization implicit in PCA and SVD approaches to multilinear (tensor) formulations that can model several interacting factors simultaneously (Vasilescu and Terzopoulos 2007). These ideas are related to additional topics in machine learning such as subspace learning (Cai, He et al. 2007), local distance functions (Frome, Singer et al. 2007; Ramanan and Baker 2009), and metric learning (Kulis 2013).

## 5.2.4 Manifold learning

In many cases, the data we are analyzing does not reside in a globally linear subspace, but does live on a lower-dimensional manifold. In this case, non-linear dimensionality reduction can be used (Lee and Verleysen 2007). Since these systems extract lower-dimensional manifolds in a higher-dimensional space, they are also known as manifold learning techniques (Zheng and Xue 2009). Figure 5.20 shows some examples of two-dimensional manifolds extracted from the three-dimensional S-shaped ribbon using the scikit-learn manifold learning package.<sup>14</sup>

These results are just a small sample from the large number of algorithms that have been developed, which include multidimensional scaling (Kruskal 1964a,b), Isomap (Tenenbaum, De Silva, and Langford 2000), Local Linear Embedding (Roweis and Saul 2000), Hessian Eigenmaps (Donoho and Grimes 2003), Laplacian Eigenmaps (Belkin and Niyogi 2003), local tangent space alignment (Zhang and Zha 2004), Dimensionality Reduction by Learning an Invariant Mapping (Hadsell, Chopra, and LeCun 2006), Modified LLE (Zhang and Wang 2007), t-distributed Stochastic Neighbor Embedding (t-SNE) (van der Maaten and Hinton 2008; van der Maaten 2014), and UMAP (McInnes, Healy, and Melville 2018). Many of these algorithms are reviewed in Lee and Verleysen (2007), Zheng and Xue (2009), and on

![Figure 5.20](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/3581bf47523cafb83b8e256717c1e9bcd0736fe711233f6b4bfe5566b4ee9f52.jpg)  
Figure 5.20 Examples of manifold learning, i.e., non-linear dimensionality reduction, applied to 1,000 points with 10 neighbors each, from https:// scikit-learn.org/ stable/ modules/ manifold.html. The eight sample outputs were produced by eight different embedding algorithms, as described in the scikit-learn manifold learning documentation page.

Wikipedia.<sup>15</sup> Bengio, Paiement et al. (2004) describe a method for extending such algorithms to compute the embedding of new (“out-of-sample”) data points. McQueen, Meila et al. (2016) describe their megaman software package, which can efficiently solve embedding problems with millions of data points.

In addition to dimensionality reduction, which can be useful for regularizing data and accelerating similarity search, manifold learning algorithms can be used for visualizing input data distributions or neural network layer activations. Figure 5.21 show an example of applying two such algorithms (UMAP and t-SNE) to three different computer vision datasets.

## 5.2.5 Semi-supervised learning

In many machine learning settings, we have a modest amount of accurately labeled data and a far larger set of unlabeled or less accurate data. For example, an image classification dataset such as ImageNet may only contain one million labeled images, but the total number of images that can be found on the web is orders of magnitudes larger. Can we use this larger dataset, which still captures characteristics of our expect future inputs, to construct a better classifier or predictor?

![Figure 5.21](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/a88a8fe83d7ce738c775733d865f4fc4a9fb324e3fdc7c9411ec49b75e874cdf.jpg)  
Figure 5.21 Comparison of UMAP and t-SNE manifold learning algorithms © McInnes, Healy, and Melville (2018) on three different computer vision learning recognition tasks: COIL (Nene, Nayar, and Murase 1996), MNIST (LeCun, Cortes, and Burges 1998), and Fashion MNIST (Xiao, Rasul, and Vollgraf 2017).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/22ad6b3d26017ee3d34e2cea0618773020e788f67e41db9a81a7acfa724258f5.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/227d9bc476ad5297f534adbdabb613ad9850e98ca98cda7b750570823c7ce7c7.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/01828abd89d897f32e2d2733e07296b7c00a1f647037bbd2b1303e07ffced8b7.jpg)  
(c)  
Figure 5.22 Examples of semi-supervised learning (Zhu and Goldberg 2009) © 2009 Morgan & Claypool: (a) two labeled samples and a graph connecting all of the samples; (b) solving binary labeling with harmonic functions, interpreted as a resistive electrical network; (c) using semi-supervised support vector machine (S3VM).

Consider the simple diagrams in Figure 5.22. Even if only a small number of examples are labeled with the correct class (in this case, indicated by red and blue circles or dots), we can still imagine extending these labels (inductively) to nearby samples and therefore not only labeling all of the data, but also constructing appropriate decision surfaces for future inputs.

This area of study is called semi-supervised learning (Zhu and Goldberg 2009; Subramanya and Talukdar 2014). In general, it comes in two varieties. In transductive learning, the goal is to classify all of the unlabeled inputs that are given as one batch at the same time as the labeled examples, i.e., all of the dots and circles shown in Figure 5.22. In inductive learning, we train a machine learning system that will classify all future inputs, i.e., all the regions in the input space. The second form is much more widely used, since in practice, most machine learning systems are used for online applications such as autonomous driving or new content classification.

Semi-supervised learning is a subset of the larger class of weakly supervised learning problems, where the training data may not only be missing labels, but also have labels of questionable accuracy (Zhou 2018). Some early examples from computer vision (Torresani 2014) include building whole image classifiers from image labels found on the internet (Fergus, Perona, and Zisserman 2004; Fergus, Weiss, and Torralba 2009) and object detection and/or segmentation (localization) with missing or very rough delineations in the training data (Nguyen, Torresani et al. 2009; Deselaers, Alexe, and Ferrari 2012). In the deep learning era, weakly supervised learning continues to be widely used (Pathak, Krahenbuhl, and Darrell 2015; Bilen and Vedaldi 2016; Arandjelovic, Gronat et al. 2016; Khoreva, Benenson et al. 2017; Novotny, Larlus, and Vedaldi 2017; Zhai, Oliver et al. 2019). A recent example of weakly supervised learning being applied to billions of noisily labeled images is pre-training deep neural networks on Instagram images with hashtags (Mahajan, Girshick et al. 2018). We will look at weakly and self-supervised learning techniques for pre-training neural networks in Section 5.4.7.

## 5.3 Deep neural networks

As we saw in the introduction to this chapter (Figure 5.2), deep learning pipelines take an endto-end approach to machine learning, optimizing every stage of the processing by searching for parameters that minimize the training loss. In order for such search to be feasible, it helps if the loss is a differentiable function of all these parameters. Deep neural networks provide a uniform, differentiable computation architecture, while also automatically discovering useful internal representations.

Interest in building computing systems that mimic neural (biological) computation has

## 5.3 Deep neural networks

waxed and waned since the late 1950s, when Rosenblatt (1958) developed the perceptron and Widrow and Hoff (1960) derived the weight adaptation delta rule. Research into these topics was revitalized in the late 1970s by researchers who called themselves connectionists, organizing a series of meetings around this topic, which resulted in the foundation of the Neural Information Processing Systems (NeurIPS) conference in 1987. The recent book by Sejnowski (2018) has a nice historical review of this field’s development, as do the introductions in Goodfellow, Bengio, and Courville (2016) and Zhang, Lipton et al. (2021), the review paper by Rawat and Wang (2017), and the Turing Award lecture by Bengio, LeCun, and Hinton (2021). And while most of the deep learning community has moved away from biologically plausible models, some research still studies the connection between biological visual systems and neural network models (Yamins and DiCarlo 2016; Zhuang, Yan et al. 2020).

A good collection of papers from this era can be found in McClelland, Rumelhart, and PDP Research Group (1987), including the seminal paper on backpropagation (Rumelhart, Hinton, and Williams 1986a), which laid the foundation for the training of modern feedforward neural networks. During that time, and in the succeeding decades, a number of alternative neural network architectures were developed, including ones that used stochastic units such as Boltzmann Machines (Ackley, Hinton, and Sejnowski 1985) and Restricted Boltzmann Machines (Hinton and Salakhutdinov 2006; Salakhutdinov and Hinton 2009). The survey by Bengio (2009) has a review of some of these earlier approaches to deep learning. Many of these architectures are examples of the generative graphical models we saw in Section 4.3.

Today’s most popular deep neural networks are deterministic discriminative feedforward networks with real-valued activations, trained using gradient descent, i.e., the the backpropagation training rule (Rumelhart, Hinton, and Williams 1986b). When combined with ideas from convolutional networks (Fukushima 1980; LeCun, Bottou et al. 1998), deep multi-layer neural networks produced the breakthroughs in speech recognition (Hinton, Deng et al. 2012) and visual recognition (Krizhevsky, Sutskever, and Hinton 2012; Simonyan and Zisserman 2014b) seen in the early 2010s. Zhang, Lipton et al. (2021, Chapter 7) have a nice description of the components that went into these breakthroughs and the rapid evolution in deep networks that has occurred since then, as does the earlier review paper by (Rawat and Wang 2017).

Compared to other machine learning techniques, which normally rely on several preprocessing stages to extract features on which classifiers can be built, deep learning approaches are usually trained end-to-end, going directly from raw pixels to final desired outputs (be they classifications or other images). In the next few sections, we describe the basic components that go into constructing and training such neural networks. More detailed explanations on each topic can be found in textbooks on deep learning (Nielsen 2015; Goodfellow, Bengio, and Courville 2016; Glassner 2018, 2021; Zhang, Lipton et al. 2021) as well as the excellent course notes by Li, Johnson, and Yeung (2019) and Johnson (2020).

![Figure 5.23](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/2e9ad7ddda4769043b88f7dbd940cb721b0350336ddc6bed4e8e2c47fd5f3e15.jpg)  
Figure 5.23 A perceptron unit (a) explicitly showing the weights being multiplied by the inputs, (b) with the weights written on the input connections, and (c) the most common form, with the weights and bias omitted. A non-linear activation function follows the weighted summation. © Glassner (2018)

## 5.3.1 Weights and layers

Deep neural networks (DNNs) are feedforward computation graphs composed of thousands of simple interconnected “neurons” (units), which, much like logistic regression (5.18), perform weighted sums of their inputs

$$
s_{i} = \mathbf{w}_{i}^{T} \mathbf{x}_{i} + b_{i}\tag{5.45}
$$

followed by a non-linear activation function re-mapping,

$$
y_{i} = h(s_{i}),\tag{5.46}
$$

as illustrated in Figure 5.23. The $\mathbf{x}_{i}$ are the inputs to the ith unit, $\mathbf{w}_{i}$ and $b_{i}$ are its learnable weights and bias, $s_{i}$ is the output of the weighted linear sum, and $y_{i}$ is the final output after $s_{i}$ is fed through the activation function ${h.}^{16}$ The outputs of each stage, which are often called the activations, are then fed into units in later stages, as shown in Figure 5.24.<sup>17</sup>

![Figure 5.24](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/e152fef2ecf6dc07f0da72636c6df560e35d93379dc54d12ec599760756df240.jpg)  
Figure 5.24 A multi-layer network, showing how the outputs of one unit are fed into additional units. © Glassner (2018)

The earliest such units were called perceptrons (Rosenblatt 1958) and were diagramed as shown in Figure 5.23a. Note that in this first diagram, the weights, which are optimized during the learning phase (Section 5.3.5), are shown explicitly along with the element-wise multiplications. Figure 5.23b shows a form in which the weights are written on top of the connections (arrows between units, although the arrowheads are often omitted). It is even more common to diagram nets as in Figure 5.23c, in which the weights (and bias) are completely omitted and assumed to be present.

Instead of being connected into an irregular computation graph as in Figure 5.24, neural networks are usually organized into consecutive layers, as shown in Figure 5.25. We can now think of all the units within a layer as being a vector, with the corresponding linear combinations written as

$$
\mathbf{s}_{l} = \mathbf{W}_{l} \mathbf{x}_{l},\tag{5.47}
$$

where $\mathbf{x}_{l}$ are the inputs to layer l, $\mathbf{W}_{l}$ is a weight matrix, and $\mathbf{s}_{l}$ is the weighted sum, to which an element-wise non-linearity is applied using a set of activation functions,

$$
\mathbf{x}_{l + 1} = \mathbf{y}_{l} = \mathbf{h}(\mathbf{s}_{l}).\tag{5.48}
$$

A layer in which a full (dense) weight matrix is used for the linear combination is called a fully connected (FC) layer, since all of the inputs to one layer are connected to all of its outputs. As we will see in Section 5.4, when processing pixels (or other signals), early stages of processing use convolutions instead of dense connections for both spatial invariance and better efficiency.<sup>18</sup> A network that consists only of fully connected (and no convolutional) layers is now often called a multi-layer perceptron (MLP).

![Figure 5.25](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/7cf53b0d6629f31c288944663d26c34db8e9acdf02dcff7e57a0f820ed1368b7.jpg)  
Figure 5.25 Two different ways to draw neural networks: (a) inputs at bottom, outputs at top, (b) inputs at left, outputs at right. © Glassner (2018)

## 5.3.2 Activation functions

Most early neural networks (Rumelhart, Hinton, and Williams 1986b; LeCun, Bottou et al. 1998) used sigmoidal functions similar to the ones used in logistic regression. Newer networks, starting with Nair and Hinton (2010) and Krizhevsky, Sutskever, and Hinton (2012), use Rectified Linear Units (ReLU) or variants. The ReLU activation function is defined as

$$
h(y) = \operatorname{max}(0, y)\tag{5.49}
$$

and is shown in the upper-left corner of Figure 5.26, along with some other popular functions, whose definitions can be found in a variety of publications (e.g., Goodfellow, Bengio, and Courville 2016, Section 6.3; Clevert, Unterthiner, and Hochreiter 2015; He, Zhang et al. 2015) and the Machine Learning Cheatsheet.<sup>19</sup>

While the ReLU is currently the most popular activation function, a widely cited observation in the CS231N course notes (Li, Johnson, and Yeung 2019) attributed to Andrej Karpathy

![Figure 5.26](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/85660e20c46580d91657648ad99e0805af765df926b6279537402f5fb09de1b0.jpg)  
Figure 5.26 Some popular non-linear activation functions from © Glassner (2018): From top-left to bottom-right: ReLU, leaky ReLU, shifted ReLU, maxout, softplus, ELU, sigmoid, tanh, swish.

warns that<sup>20</sup>

Unfortunately, ReLU units can be fragile during training and can “die”. For example, a large gradient flowing through a ReLU neuron could cause the weights to update in such a way that the neuron will never activate on any datapoint again. If this happens, then the gradient flowing through the unit will forever be zero from that point on. That is, the ReLU units can irreversibly die during training since they can get knocked off the data manifold. ... With a proper setting of the learning rate this is less frequently an issue.

The CS231n course notes advocate trying some alternative non-clipping activation functions

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/3457c48464c422bcfdd543c6b2975851e51bfeb9fa652fb5e337ebdaf393b52c.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/6ef84d0c4a414cb1e592db9492a4e76af5d679274e1172240de46ed1dcbba3dc.jpg)  
(b)  
Figure 5.27 (a) A softmax layer used to convert from neural network activations (“score”) to class likelihoods (b) The top row shows the activations, while the bottom shows the result of running the scores through softmax to obtain properly normalized likelihoods. © Glassner (2018).

if this problem arises.

For the final layer in networks used for classification, the softmax function (5.3) is normally used to convert from real-valued activations to class likelihoods, as shown in Figure 5.27. We can thus think of the penultimate set of neurons as determining directions in activation space that most closely match the log likelihoods of their corresponding class, while minimizing the log likelihoods of alternative classes. Since the inputs flow forward to the final output classes and probabilities, feedforward networks are discriminative, i.e., they have no statistical model of the classes they are outputting, nor any straightforward way to generate samples from such classes (but see Section 5.5.4 for techniques to do this).

## 5.3.3 Regularization and normalization

As with other forms of machine learning, regularization and other techniques can be used to prevent neural networks from overfitting so they can better generalize to unseen data. In this section, we discuss traditional methods such as regularization and data augmentation that can be applied to most machine learning systems, as well as techniques such as dropout and batch normalization, which are specific to neural networks.

## Regularization and weight decay

As we saw in Section 4.1.1, quadratic or p-norm penalties on the weights (4.9) can be used to improve the conditioning of the system and to reduce overfitting. Setting p = 2 results in the usual $L_{2}$ regularization and makes large weights smaller, whereas using p = 1 is called lasso (least absolute shrinkage and selection operator) and can drive some weights all the way to zero. As the weights are being optimized inside a neural network, these terms make the weights smaller, so this kind of regularization is also known as weight decay (Bishop 2006, Section 3.1.4; Goodfellow, Bengio, and Courville 2016, Section 7.1; Zhang, Lipton et al. 2021, Section 4.5).<sup>21</sup> Note that for more complex optimization algorithms such as Adam, $L_{2}$ regularization and weight decay are not equivalent, but the desirable properties of weight decay can be restored using a modified algorithm (Loshchilov and Hutter 2019).

![Figure 5.28](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/531fc09453b9c7d27ec9e4e3ffaf4d97b7f512f50308c966185a8d67a9b2b495.jpg)  
Figure 5.28 An original “6” digit from the MNIST database and two elastically distorted versions (Simard, Steinkraus, and Platt 2003) © 2003 IEEE.

## Dataset augmentation

Another powerful technique to reduce over-fitting is to add more training samples by perturbing the inputs and/or outputs of the samples that have already been collected. This technique is known as dataset augmentation (Zhang, Lipton et al. 2021, Section 13.1) and can be particularly effective on image classification tasks, since it is expensive to obtain labeled examples, and also since image classes should not change under small local perturbations.

An early example of such work applied to a neural network classification task is the elastic distortion technique proposed by Simard, Steinkraus, and Platt (2003). In their approach, random low-frequency displacement (warp) fields are synthetically generated for each training example and applied to the inputs during training (Figure 5.28). Note how such distortions are not the same as simply adding pixel noise to the inputs. Instead, distortions move pixels around, and therefore introduce much larger changes in the input vector space, while still preserving the semantic meaning of the examples (in this case, MNIST digits (LeCun, Cortes, and Burges 1998)).

![Figure 5.29](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/2e0c29f7bda92195df49354cc0b888a6b2447f63dd4818c12c2b7cfca12e9634.jpg)  
Figure 5.29 When using dropout, during training some fraction of units p is removed from the network (or, equivalently, clamped to zero) © Srivastava, Hinton et al. (2014). Doing this randomly for each mini-batch injects noise into the training process (at all levels of the network) and prevents the network from overly relying on particular units.

## Dropout

Dropout is a regularization technique introduced by Srivastava, Hinton et al. (2014), where at each mini-batch during training (Section 5.3.6), some percentage p (say 50%) of the units in each layer are clamped to zero, as shown in Figure 5.29. Randomly setting units to zero injects noise into the training process and also prevents the network from overly specializing units to particular samples or tasks, both of which can help reduce overfitting and improve generalization.

Because dropping (zeroing out) p of the units reduces the expected value of any sum the unit contributes to by a fraction $(1 - p)$ , the weighted sums $s_{i}$ in each layer (5.45) are multiplied (during training) by $(1 - p)^{- 1}$ . At test time, the network is run with no dropout and no compensation on the sums. A more detailed description of dropout can be found in Zhang, Lipton et al. (2021, Section 4.6) and Johnson (2020, Lecture 10).

## Batch normalization

Optimizing the weights in a deep neural network, which we discuss in more detail in Section 5.3.6, is a tricky process and may be slow to converge.

One of the classic problems with iterative optimization techniques is poor conditioning, where the components of the gradient vary greatly in magnitude. While it is sometimes possible to reduce these effects with preconditioning techniques that scale individual elements in a gradient before taking a step (Section 5.3.6 and Appendix A.5.2), it is usually preferable to control the condition number of the system during the problem formulation.

In deep networks, one way in which poor conditioning can manifest itself is if the sizes of the weights or activations in successive layers become imbalanced. Say we take a given network and scale all of the weights in one layer by 100 and scale down the weights in the next layer by the same amount. Because the ReLU activation function is linear in both of its domains, the outputs of the second layer will still be the same, although the activations at the output of the first layer with be 100 times larger. During the gradient descent step, the derivatives with respect to the weights will be vastly different after this rescaling, and will in fact be opposite in magnitude to the weights themselves, requiring tiny gradient descent steps to prevent overshooting (see Exercise 5.4).<sup>22</sup>

The idea behind batch normalization (Ioffe and Szegedy 2015) is to re-scale (and recenter) the activations at a given unit so that they have unit variance and zero mean (which, for a ReLU activation function, means that the unit will be active half the time). We perform this normalization by considering all of the training samples n in a given minibatch (5.71) and computing the mean and variance statistics for unit i as

$$
\mu_{i} = \frac{1}{| B |} \sum_{n \in B} s_{i}^{(n)}\tag{5.50}
$$

$$
\sigma_{i}^{2} = \frac{1}{| \boldsymbol{\mathcal{B}} |} \sum_{n \in \boldsymbol{\mathcal{B}}}(s_{i}^{(n)} - \mu_{i})^{2}\tag{5.51}
$$

$$
\hat{s}_{i}^{(n)} = \frac{s_{i}^{(n)} - \mu_{i}}{\sqrt{\sigma_{i}^{2} + \epsilon}},\tag{5.52}
$$

where $s_{i}^{n}$ is the weighted sum of unit i for training sample $n, \hat{s}_{i}^{(n)}$ is the corresponding batch normalized sum, and $\epsilon(\mathrm{often ~} 10^{- 5})$ is a small constant to prevent division by zero.

After batch normalization, the $\hat{s}_{i}^{(n)}$ activations now have zero mean and unit variance. However, this normalization may run at cross-purpose to the minimization of the loss function during training. For this reason, Ioffe and Szegedy (2015) add an extra gain $\gamma_{i}$ and bias $\beta_{i}$ parameter to each unit i and define the output of a batch normalization stage to be

$$
y_{i} = \gamma_{i}{\hat{s}}_{i} + \beta_{i}.\tag{5.53}
$$

These parameters act just like regular weights, i.e., they are modified using gradient descent during training to reduce the overall training loss.<sup>23</sup>

One subtlety with batch normalization is that the $\mu_{i}$ and $\sigma_{i}^{2}$ quantities depend analytically on all of the activation for a given unit in a minibatch. For gradient descent to be properly defined, the derivatives of the loss function with respect to these variables, and the derivatives of the quantities $\hat{s}_{i}$ and $y_{i}$ with respect to these variables, must be computed as part of the gradient computation step, using similar chain rule computations as the original backpropagation algorithm (5.65–5.68). These derivations can be found in Ioffe and Szegedy (2015) as well as several blogs.<sup>24</sup>

When batch normalization is applied to convolutional layers (Section 5.4), one could in principle compute a normalization separately for each pixel, but this would add a tremendous number of extra learnable bias and gain parameters $(\beta_{i}, \gamma_{i})$ . Instead, batch normalization is usually implemented by computing the statistics as sums over all the pixels with the same convolution kernel, and then adding a single bias and gain parameter for each convolution kernel (Ioffe and Szegedy 2015; Johnson 2020, Lecture 10; Zhang, Lipton et al. 2021, Section 7.5).

Having described how batch normalization operates during training, we still need to decide what to do at test or inference time, i.e., when applying the trained network to new data. We cannot simply skip this stage, as the network was trained while removing common mean and variance estimates. For this reason, the mean and variance estimates are usually recomputed over the whole training set, or some running average of the per-batch statistics are used. Because of the linear form of (5.45) and (5.52–5.53), it is possible to fold the $\mu_{i}$ and $\sigma_{i}$ estimates and learned $(\beta_{i}, \gamma_{i})$ parameters into the original weight and bias terms in (5.45).

Since the publication of the seminal paper by Ioffe and Szegedy (2015), a number of variants have been developed, some of which are illustrated in Figure 5.30. Instead of accumulating statistics over the samples in a minibatch , we can compute them over different subsets of activations in a layer. These subsets include:

- all the activations in a layer, which is called layer normalization (Ba, Kiros, and Hinton 2016);

- all the activations in a given convolutional output channel (see Section 5.4), which is called instance normalization (Ulyanov, Vedaldi, and Lempitsky 2017);

![Figure 5.30](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/c34d1bc5e1b152b138cb74b8fad8236fe65f8bc32ec8b8d7a659d7a9618c8591.jpg)  
Figure 5.30 Batch norm, layer norm, instance norm, and group norm, from Wu and He (2018) © 2018 Springer. The (H, W ) dimension denotes pixels, C denotes channels, and N denotes training samples in a minibatch. The pixels in blue are normalized by the same mean and variance.

- different sub-groups of output channels, which is called group normalization (Wu and He 2018).

The paper by Wu and He (2018) describes each of these in more detail and also compares them experimentally. More recent work by Qiao, Wang et al. (2019a) and Qiao, Wang et al. (2019b) discusses some of the disadvantages of these newer variants and proposes two new techniques called weight standardization and batch channel normalization to mitigate these problems.

Instead of modifying the activations in a layer using their statistics, it is also possible to modify the weights in a layer to explicitly make the weight norm and weight vector direction separate parameters, which is called weight normalization (Salimans and Kingma 2016). A related technique called spectral normalization (Miyato, Kataoka et al. 2018) constrains the largest singular value of the weight matrix in each layer to be 1.

The bias and gain parameters $(\beta_{i}, \gamma_{i})$ may also depend on the activations in some other layer in the network, e.g., derived from a guide image.<sup>25</sup> Such techniques are referred to as conditional batch normalization and have been used to select between different artistic styles (Dumoulin, Shlens, and Kudlur 2017) and to enable local semantic guidance in image synthesis (Park, Liu et al. 2019). Related techniques and applications are discussed in more detail in Section 14.6 on neural rendering.

The reasons why batch and other kinds of normalization help deep networks converge faster and generalize better are still being debated. Some recent papers on this topic include Bjorck, Gomes et al. (2018), Hoffer, Banner et al. (2018), Santurkar, Tsipras et al. (2018), and Kohler, Daneshmand et al. (2019).

## 5.3.4 Loss functions

In order to optimize the weights in a neural network, we need to first define a loss function that we minimize over the training examples. We have already seen the main loss functions used in machine learning in previous parts of this chapter.

For classification, most neural networks use a final softmax layer (5.3), as shown in Figure 5.27. Since the outputs are meant to be class probabilities that sum up to 1, it is natural to use the cross-entropy loss given in (5.19) or (5.23–5.24) as the function to minimize during training. Since in our description of the feedforward networks we have used indices i and j to denote neural units, we will, in this section, use n to index a particular training example.

The multi-class cross-entropy loss can thus be re-written as

$$
E(\mathbf{w}) = \sum_{n} E_{n}(\mathbf{w}) = - \sum_{n} \log p_{nt_{n}},\tag{5.54}
$$

where w is the vector of all weights, biases, and other model parameters, and $p_{nk}$ is the network’s current estimate of the probability of class k for sample n, and $t_{n}$ is the integer denoting the correct class. Substituting the definition of $p_{nk}$ from (5.20) with the appropriate replacement of $l_{ik}$ with $s_{nk}$ (the notation we use for neural nets), we get

$$
E_{n}(\mathbf{w}) = \log Z_{n} - s_{nt_{n}}\tag{5.55}
$$

with $\begin{array}{r}{Z_{n} = \sum_{j} \exp{s_{nj}}} \end{array}$ . Gomez´ (2018) has a nice discussion of some of the losses widely used in deep learning.

For networks that perform regression, i.e., generate one or more continuous variables such as depth maps or denoised images, it is common to use an $L_{2}$ loss,

$$
E(\mathbf{w}) = \sum_{n} E_{n}(\mathbf{w}) = - \sum_{n} \| \mathbf{y}_{n} - \mathbf{t}_{n} \|^{2},\tag{5.56}
$$

where ${\bf y}_{n}$ is the network output for sample n and $\mathbf{t}_{n}$ is the corresponding training (target) value, since this is a natural measure of error between continuous variables. However, if we believe there may be outliers in the training data, or if gross errors are not so harmful as to merit a quadratic penalty, more robust norms such as $L_{1}$ can be used (Barron 2019; Ranftl, Lasinger et al. 2020). (It is also possible to use robust norms for classification, e.g., adding an outlier probability to the class labels.)

As it is common to interpret the final outputs of a network as a probability distribution, we need to ask whether it is wise to use such probabilities as a measure of confidence in a particular answer. If a network is properly trained and predicting answers with good accuracy, it is tempting to make this assumption. The training losses we have presented so far, however, only encourage the network to maximize the probability-weighted correct answers, and do not, in fact, encourage the network outputs to be properly confidence calibrated. Guo, Pleiss et al. (2017) discuss this issue, and present some simple measures, such as multiplying the log-likelihoods by a temperature (Platt 2000a), to improve the match between classifier probabilities and true reliability. The GrokNet image recognition system (Bell, Liu et al. 2020), which we discuss in Section 6.2.3, uses calibration to obtain better attribute probability estimates.

For networks that hallucinate new images, e.g., when introducing missing high-frequency details (Section 10.3) or doing image transfer tasks (Section 14.6), we may want to use a perceptual loss (Johnson, Alahi, and Fei-Fei 2016; Dosovitskiy and Brox 2016; Zhang, Isola et al. 2018), which uses intermediate layer neural network responses as the basis of comparison between target and output images. It is also possible to train a separate discriminator network to evaluate the quality (and plausibility) of synthesized images, as discussed in Section 5.5.4 More details on the application of loss functions to image synthesis can be found in Section 14.6 on neural rendering.

While loss functions are traditionally applied to supervised learning tasks, where the correct label or target value $\mathbf{t}_{n}$ is given for each input, it is also possible to use loss functions in an unsupervised setting. An early example of this was the contrastive loss function proposed by Hadsell, Chopra, and LeCun (2006) to cluster samples that are similar together while spreading dissimilar samples further apart. More formally, we are given a set of inputs $\{{\bf{x}}_{i}\}$ and pairwise indicator variables $\{t_{ij}\}$ that indicate whether two inputs are similar.<sup>26</sup> The goal is now to compute an embedding $\mathbf{v}_{i}$ for each input $\mathbf{x}_{i}$ such that similar input pairs have similar embeddings (low distances), while dissimilar inputs have large embedding distances. Finding mappings or embeddings that create useful distances between samples is known as (distance) metric learning (Kostinger, Hirzer ¨ et al. 2012; Kulis 2013) and is a commonly used tool in machine learning. The losses used to encourage the creation of such meaningful distances are collectively known as ranking losses (Gomez´ 2019) and can be used to relate features from different domains such as text and images (Karpathy, Joulin, and Fei-Fei 2014).

The contrastive loss from (Hadsell, Chopra, and LeCun 2006) is defined as

$$
E_{\mathrm{CL}} = \sum_{(i, j) \in \mathcal{P}} \{t_{ij} \log L_{\mathrm{S}}(d_{ij}) +(1 - t_{ij}) \log L_{\mathrm{D}}(d_{ij})\},\tag{5.57}
$$

where $\mathcal{P}$ is the set of all labeled input pairs, $L_{\mathrm{S}}$ and $L_{\mathrm{D}}$ are the similar and dissimilar loss functions, and $d_{ij} = \| \mathbf{v}_{i} - \mathbf{v}_{j} \|$ are the pairwise distance between paired embeddings.<sup>27</sup>

This has a form similar to the cross-entropy loss given in (5.19), except that we measure squared distances between encodings $\mathbf{v}_{i}$ and $\mathbf{v}_{j}$ . In their paper, Hadsell, Chopra, and LeCun (2006) suggest using a quadratic function for $L_{\mathrm{S}}$ and a quadratic hinge loss (c.f. (5.30)) ${\cal L_{\mathrm{D}}} =[m - d_{ij}]_{+}^{2}$ for dissimilarity, where m is a margin beyond which there is no penalty.

To train with a contrastive loss, you can run both pairs of inputs through the neural network, compute the loss, and then backpropagate the gradients through both instantiations (activations) of the network. This can also be thought of as constructing a Siamese network consisting of two copies with shared weights (Bromley, Guyon et al. 1994; Chopra, Hadsell, and LeCun 2005). It is also possible to construct a triplet loss that takes as input a pair of matching samples and a third non-matching sample and ensures that the distance between non-matching samples is greater than the distance between matches plus some margin (Weinberger and Saul 2009; Weston, Bengio, and Usunier 2011; Schroff, Kalenichenko, and Philbin 2015; Rawat and Wang 2017).

Both pairwise contrastive and triplet losses can be used to learn embeddings for visual similarity search (Bell and Bala 2015; Wu, Manmatha et al. 2017; Bell, Liu et al. 2020), as discussed in more detail in Section 6.2.3. They have also been recently used for unsupervised pre-training of neural networks (Wu, Xiong et al. 2018; He, Fan et al. 2020; Chen, Kornblith et al. 2020), which we discuss in Section 5.4.7. In this case, it is more common to use a different contrastive loss function, inspired by softmax (5.3) and multi-class cross-entropy (5.20–5.22), which was first proposed by (Sohn 2016). Before computing the loss, the embeddings are all normalized to unit norm, $\| \hat{\mathbf{v}}_{i} \|^{2} = 1$ . Then, the following loss is summed over all matching embeddings,

$$
l_{ij} = - \log \frac{\exp(\hat{\bf v}_{i} \cdot \hat{\bf v}_{j} / \tau)}{\sum_{k} \exp(\hat{\bf v}_{i} \cdot \hat{\bf v}_{k} / \tau)},\tag{5.58}
$$

with the denominator summed over non-matches as well. The τ variable denotes the “temperature” and controls how tight the clusters will be; it is sometimes replaced with an s multiplier parameterizing the hyper-sphere radius (Deng, Guo et al. 2019). The exact details of how the matches are computed vary by exact implementation.

This loss goes by several names, including InfoNCE (Oord, Li, and Vinyals 2018), and NT-Xent (normalized temperature cross-entropy loss) in Chen, Kornblith et al. (2020). Generalized versions of this loss called SphereFace, CosFace, and ArcFace are discussed and compared in the ArcFace paper (Deng, Guo et al. 2019) and used by Bell, Liu et al. (2020) as part of their visual similarity search system. The smoothed average precision loss recently proposed by Brown, Xie et al. (2020) can sometimes be used as an alternative to the metric losses discussed in this section. Some recent papers that compare and discuss deep metric learning approaches include (Jacob, Picard et al. 2019; Musgrave, Belongie, and Lim 2020).

## 5.3 Deep neural networks

## Weight initialization

Before we can start optimizing the weights in our network, we must first initialize them. Early neural networks used small random weights to break the symmetry, i.e., to make sure that all of the gradients were not zero. It was observed, however, that in deeper layers, the activations would get progressively smaller.

To maintain a comparable variance in the activations of successive layers, we must take into account the fan-in of each layer, i.e., the number of incoming connections where activations get multiplied by weights. Glorot and Bengio (2010) did an initial analysis of this issue, and came up with a recommendation to set the random initial weight variance as the inverse of the fan-in. Their analysis, however, assumed a linear activation function (at least around the origin), such as a tanh function.

Since most modern deep neural networks use the ReLU activation function (5.49), He, Zhang et al. (2015) updated this analysis to take into account this asymmetric non-linearity. If we initialize the weights to have zero mean and variance $V_{l}$ for layer l and set the original biases to zero, the linear summation in (5.45) will have a variance of

$$
Var[s_{l}] = n_{l} V_{l} E[x_{l}^{2}],\tag{5.59}
$$

where $n_{l}$ is the number of incoming activations/weights and $E[x_{l}^{2}]$ is the expectation of the squared incoming activations. When the summations $s_{l}.$ , which have zero mean, are fed through the ReLU, the negative ones will get clamped to zero, so the expectation of the squared output $E[y_{l}^{2}]$ is half the variance of $s_{l}, Var[s_{l}]$

In order to avoid decaying or increasing average activations in deeper layers, we want the magnitude of the activations in successive layers to stay about the same. Since we have

$$
E[y_{l}^{2}] = \frac{1}{2} Var[s_{l}] = \frac{1}{2} n_{l} V_{l} E[x_{l}^{2}],\tag{5.60}
$$

we conclude that the variance in the initial weights $V_{l}$ should be set to

$$
V_{l} ={\frac{2}{n_{l}}},\tag{5.61}
$$

i.e., the inverse of half the fan-in of a given unit or layer. This weight initialization rule is commonly called He initialization.

Neural network initialization continues to be an active research area, with publications that include Krahenb¨ uhl, Doersch¨ et al. (2016), Mishkin and Matas (2016), Frankle and Carbin (2019), and Zhang, Dauphin, and Ma (2019)

## 5.3.5 Backpropagation

Once we have set up our neural network by deciding on the number of layers, their widths and depths, added some regularization terms, defined the loss function, and initialized the weights, we are ready to train the network with our sample data. To do this, we use gradient descent or one of its variants to iteratively modify the weights until the network has converged to a good set of values, i.e., an acceptable level of performance on the training and validation data.

To do this, we compute the derivatives (gradients) of the loss function $E_{n}$ for training sample n with respect to the weights w using the chain rule, starting with the outputs and working our way back through the network towards the inputs, as shown in Figure 5.31. This procedure is known as backpropagation (Rumelhart, Hinton, and Williams 1986b) and stands for backward propagation of errors. You can find alternative descriptions of this technique in textbooks and course notes on deep learning, including Bishop (2006, Section 5.3.1), Goodfellow, Bengio, and Courville (2016, Section 6.5), Glassner (2018, Chapter 18), Johnson (2020, Lecture 6), and Zhang, Lipton et al. (2021).

Recall that in the forward (evaluation) pass of a neural network, activations (layer outputs) are computed layer-by-layer, starting with the first layer and finishing at the last. We will see in the next section that many newer DNNs have an acyclic graph structure, as shown in Figures 5.42–5.43, rather than just a single linear pipeline. In this case, any breadth-first traversal of the graph can be used. The reason for this evaluation order is computational efficiency. Activations need only be computed once for each input sample and can be re-used in succeeding stages of computation.

During backpropagation, we perform a similar breadth-first traversal of the reverse graph. However, instead of computing activations, we compute derivatives of the loss with respect to the weights and inputs, which we call errors. Let us look at this in more detail, starting with the loss function.

The derivative of the cross-entropy loss $E_{n}$ (5.54) with respect to the output probability $p_{nk}$ is simply $- \delta_{nt_{n}} / p_{nk}$ . What is more interesting is the derivative of the loss with respect to the scores $s_{nk}$ going into the softmax layer (5.55) shown in Figure 5.27,

$$
\frac{\partial E_{n}}{\partial s_{nk}} = - \delta_{nt_{n}} + \frac{1}{Z_{n}} \exp{s_{nk}} = p_{nk} - \delta_{nt_{n}} = p_{nk} - \tilde{t}_{nk}.\tag{5.62}
$$

(The last form is useful if we are using one-hot encoding or the targets have non-binary probabilities.) This has a satisfyingly intuitive explanation as the difference between the predicted class probability $p_{nk}$ and the true class identity $t_{nk}$

## 5.3 Deep neural networks

![Figure 5.31](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/f2e3a09473f54fc95b25a382b2e3e87dadb763dbeeb73752116aa239d663d90c.jpg)  
Figure 5.31 Backpropagating the derivatives (errors) through an intermediate layer of the deep network © Glassner (2018). The derivatives of the loss function applied to a single training example with respect to each of the pink unit inputs are summed together and the process is repeated chaining backward through the network.

For the $L_{2}$ loss in (5.56), we get a similar result,

$$
{\frac{\partial E_{n}}{\partial y_{nk}}} = y_{nk} - t_{nk},\tag{5.63}
$$

which in this case denotes the real-valued difference between the predicted and target values.

In the rest of this section, we drop the sample index $n$ from the activations $x_{in}$ and $y_{in}$ , since the derivatives for each sample n can typically be computed independently from other samples.<sup>28</sup>

To compute the partial derivatives of the loss term with respect to earlier weights and activations, we work our way back through the network, as shown in Figure 5.31. Recall from (5.45–5.46) that we first compute a weighted sum $s_{i}$ by taking a dot product between the input activations $\mathbf{x}_{i}$ and the unit’s weight vector $\mathbf{w}_{i}$

$$
s_{i} = \mathbf{w}_{i}^{T} \mathbf{x}_{i} + b_{i} = \sum_{j} w_{ij} x_{ij} + b_{i}.\tag{5.64}
$$

We then pass this weighted sum through an activation function $h$ to obtain $y_{i} = h(s_{i})$

To compute the derivative of the loss $E_{n}$ with respect to the weights, bias, and input

activations, we use the chain rule,

$$
e_{i} ={\frac{\partial E_{n}}{\partial s_{i}}} = h^{\prime}(s_{i}){\frac{\partial E_{n}}{\partial y_{i}}},\tag{5.65}
$$

$$
\frac{\partial E_{n}}{\partial w_{ij}} = x_{ij} \frac{\partial E_{n}}{\partial s_{i}} = x_{ij} e_{i},\tag{5.66}
$$

$$
\frac{\partial E_{n}}{\partial b_{i}} = \frac{\partial E_{n}}{\partial s_{i}} = e_{i}, \quad \mathrm{and}\tag{5.67}
$$

$$
\frac{\partial E_{n}}{\partial x_{ij}} = w_{ij} \frac{\partial E_{n}}{\partial s_{i}} = w_{ij} e_{i}.\tag{5.68}
$$

We call the term $e_{i} = \partial E_{n} / \partial s_{i}$ , i.e., the partial derivative of the loss $E_{n}$ with respect to the summed activation $s_{i}$ , the error, as it gets propagated backward through the network.

Now, where do these errors come from, i.e., how do we obtain $\partial E_{n} / \partial y_{i} ?$ Recall from Figure 5.24 that the outputs from one unit or layer become the inputs for the next layer. In fact, for a simple network like the one in Figure 5.24, if we let $\boldsymbol{x}_{ij}$ be the activation that unit i receives from unit $j$ (as opposed to just the jth input to unit i), we can simply set $x_{ij} = y_{j}$

Since $y_{i}$ , the output of unit i, now serves as input for the other units k $> i$ (assuming the units are ordered breadth first), we have

$$
{\frac{\partial E_{n}}{\partial y_{i}}} = \sum_{k > i}{\frac{\partial E_{n}}{\partial x_{ki}}} = \sum_{k > i} w_{ki} e_{k}\tag{5.69}
$$

and

$$
e_{i} = h^{\prime}(s_{i}){\frac{\partial E_{n}}{\partial y_{i}}} = h^{\prime}(s_{i}) \sum_{k > i} w_{ki} e_{k}.\tag{5.70}
$$

In other words, to compute a unit’s (backpropagation) error, we compute a weighted sum of the errors coming from the units it feeds into and then multiply this by the derivative of the current activation function $h^{\prime}(s_{i})$ . This backward flow of errors is shown in Figure 5.31, where the errors for the three units in the shaded box are computed using weighted sums of the errors coming from later in the network.

This backpropagation rule has a very intuitive explanation. The error (derivative of the loss) for a given unit depends on the errors of the units that it feeds multiplied by the weights that couple them together. This is a simple application of the chain rule. The slope of the activation function $h^{\prime}(s_{i})$ modulates this interaction. If the unit’s output is clamped to zero or small, e.g., with a negative-input ReLU or the “flat” part of a sigmoidal response, the unit’s error is itself zero or small. The gradient of the weight, i.e., how much the weight should be perturbed to reduce the loss, is a signed product of the incoming activation and the unit’s error, $x_{ij} e_{i}$ . This is closely related to the Hebbian update rule (Hebb 1949), which observes that synaptic efficiency in biological neurons increases with correlated firing in the presynaptic and postsynaptic cells. An easier way to remember this rule is “neurons wire together if they fire together” (Lowel and Singer 1992).

There are, of course, other computational elements in modern neural networks, including convolutions and pooling, which we cover in the next section. The derivatives and error propagation through such other units follows the same procedure as we sketched here, i.e., recursively apply the chain rule, taking analytic derivatives of the functions being applied, until you have the derivatives of the loss function with respect to all the parameters being optimized, i.e., the gradient of the loss.

As you may have noticed, the computation of the gradients with respect to the weights requires the unit activations computed in the forward pass. A typical implementation of neural network training stores the activations for a given sample and uses these during the backprop (backward error propagation) stage to compute the weight derivatives. Modern neural networks, however, may have millions of units and hence activations (Figure 5.44). The number of activations that need to be stored can be reduced by only storing them at certain layers and then re-computing the rest as needed, which goes under the name gradient checkpointing (Griewank and Walther 2000; Chen, Xu et al. 2016; Bulatov 2018).<sup>29</sup> A more extensive review of low-memory training can be found in the technical report by Sohoni, Aberger et al. (2019).

## 5.3.6 Training and optimization

At this point, we have all of the elements needed to train a neural network. We have defined the network’s topology in terms of the sizes and depths of each layer, specified our activation functions, added regularization terms, specified our loss function, and initialized the weights. We have even described how to compute the gradients, i.e., the derivatives of the regularized loss with respect to all of our weights. What we need at this point is some algorithm to turn these gradients into weight updates that will optimize the loss function and produce a network that generalizes well to new, unseen data.

In most computer vision algorithms such as optical flow (Section 9.1.3), 3D reconstruction using bundle adjustment (Section 11.4.2), and even in smaller-scale machine learning problems such as logistic regression (Section 5.1.3), the method of choice is linearized least squares (Appendix A.3). The optimization is performed using a second-order method such as Gauss-Newton, in which we evaluate all of the terms in our loss function and then take an optimally-sized downhill step using a direction derived from the gradients and the Hessian of the energy function.

Unfortunately, deep learning problems are far too large (in terms of number of parameters and training samples; see Figure 5.44) to make this approach practical. Instead, practitioners have developed a series of optimization algorithms based on extensions to stochastic gradient descent (SGD) (Zhang, Lipton et al. 2021, Chapter 11). In SGD, instead of evaluating the loss function by summing over all the training samples, as in (5.54) or (5.56), we instead just evaluate a single training sample n and compute the derivatives of the associated loss $E_{n}(\mathbf{w})$ We then take a tiny downhill step along the direction of this gradient.

In practice, the directions obtained from just a single sample are incredibly noisy estimates of a good descent direction, so the losses and gradients are usually summed over a small subset of the training data,

$$
E_{B}(\mathbf{w}) = \sum_{n \in B} E_{n}(\mathbf{w}),\tag{5.71}
$$

where each subset is called a minibatch. Before we start to train, we randomly assign the training samples into a fixed set of minibatches, each of which has a fixed size that commonly ranges from 32 at the low end to 8k at the higher end (Goyal, Dollar´ et al. 2017). The resulting algorithm is called minibatch stochastic gradient descent, although in practice, most people just call it SGD (omitting the reference to minibatches).<sup>30</sup>

After evaluating the gradients $\mathbf{g} = \nabla_{\mathbf{w}} E_{B}$ by summing over the samples in the minibatch, it is time to update the weights. The simplest way to do this is to take a small step in the gradient direction,

$$
\mathbf{w} \mathbf{w} - \alpha \mathbf{g} \qquad \mathrm{or}\tag{5.72}
$$

$$
\mathbf{w}_{t + i} = \mathbf{w}_{t} - \alpha_{t} \mathbf{g}_{t}\tag{5.73}
$$

where the first variant looks more like an assignment statement (see, e.g., Zhang, Lipton et al. 2021, Chapter 11; Loshchilov and Hutter 2019), while the second makes the temporal dependence explicit, using t to denote each successive step in the gradient descent.<sup>31</sup>

The step size parameter α is often called the learning rate and must be carefully adjusted to ensure good progress while avoiding overshooting and exploding gradients. In practice, it is common to start with a larger (but still small) learning rate $\alpha_{t}$ and to decrease it over time so that the optimization settles into a good minimum (Johnson 2020, Lecture 11; Zhang, Lipton et al. 2021, Chapter 11).

![Figure 5.32](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/c0a33c9788b67cecb4886c1efec7e139c4b295a7cd5b6d0cde32bb3ebb1f4ec5.jpg)  
Figure 5.32 Screenshot from http:// playground.tensorflow.org, where you can build and train your own small network in your web browser. Because the input space is twodimensional, you can visualize the responses to all 2D inputs at each unit in the network.

Regular gradient descent is prone to stalling when the current solution reaches a “flat spot” in the search space, and stochastic gradient descent only pays attention to the errors in the current minibatch. For these reasons, the SGD algorithms may use the concept of momentum, where an exponentially decaying (“leaky”) running average of the gradients is accumulated and used as the update direction,

$$
\mathbf{v}_{t + i} = \rho \mathbf{v}_{t} + \mathbf{g}_{t}\tag{5.74}
$$

$$
\mathbf{w}_{t + i} = \mathbf{w}_{t} - \alpha_{t} \mathbf{v}_{t}.\tag{5.75}
$$

A relatively large value of $\rho \in[0.9, 0.99]$ is used to give the algorithm good memory, effectively averaging gradients over more batches.<sup>32</sup>

Over the last decade, a number of more sophisticated optimization techniques have been applied to deep network training, as described in more detail in Johnson (2020, Lecture 11) and Zhang, Lipton et al. (2021, Chapter 11)). These algorithms include:

- Nesterov momentum, where the gradient is (effectively) computed at the state predicted from the velocity update;

- AdaGrad (Adaptive Gradient), where each component in the gradient is divided by the square root of the per-component summed squared gradients (Duchi, Hazan, and Singer 2011);

- RMSProp, where the running sum of squared gradients is replaced with a leaky (decaying) sum (Hinton 2012);

- Adadelta, which augments RMSProp with a leaky sum of the actual per-component changes in the parameters and uses these in the gradient re-scaling equation (Zeiler 2012);

- Adam, which combines elements of all the previous ideas into a single framework and also de-biases the initial leaky estimates (Kingma and Ba 2015); and

- AdamW, which is Adam with decoupled weight decay (Loshchilov and Hutter 2019).

Adam and AdamW are currently the most popular optimizers for deep networks, although even with all their sophistication, learning rates need to be set carefully (and probably decayed over time) to achieve good results. Setting the right hyperparameters, such as the learning rate initial value and decay rate, momentum terms such as ρ, and amount of regularization, so that the network achieves good performance within a reasonable training time is itself an open research area. The lecture notes by Johnson (2020, Lecture 11) provide some guidance, although in many cases, people perform a search over hyperparameters to find which ones produce the best performing network.

## A simple two-input example

A great way to get some intuition on how deep networks update the weights and carve out a solution space during training is to play with the interactive visualization at http: //playground.tensorflow.org.<sup>33</sup> As shown in Figure 5.32, just click the “run” (.) button to get started, then reset the network to a new start (button to the left of run) and try single-stepping the network, using different numbers of units per hidden layer and different activation functions. Especially when using ReLUs, you can see how the network carves out different parts of the input space and then combines these sub-pieces together. Section 5.4.5 discusses visualization tools to get insights into the behavior of larger, deeper networks.

![Figure 5.33](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/712fa69da0d75cfe2f2510fc9c29848cd28a4533d720ddda5ff1a5a55fb67d6a.jpg)  
Figure 5.33 Architecture of LeNet-5, a convolutional neural network for digit recognition (LeCun, Bottou et al. 1998) © 1998 IEEE. This network uses multiple channels in each layer and alternates multi-channel convolutions with downsampling operations, followed by some fully connected layers that produce one activation for each of the 10 digits being classified.

## 5.4 Convolutional neural networks

The previous sections on deep learning have covered all of the essential elements of constructing and training deep networks. However, they have omitted what is likely the most crucial component of deep networks for image processing and computer vision, which is the use of trainable multi-layer convolutions. The idea of convolutional neural networks was popularized by LeCun, Bottou et al. (1998), where they introduced the LeNet-5 network for digit recognition shown in Figure 5.33.<sup>34</sup>

Instead of connecting all of the units in a layer to all the units in a preceding layer, convolutional networks organize each layer into feature maps (LeCun, Bottou et al. 1998), which you can think of as parallel planes or channels, as shown in Figure 5.33. In a convolutional layer, the weighted sums are only performed within a small local window, and weights are identical for all pixels, just as in regular shift-invariant image convolution and correlation (3.12–3.15).

Unlike image convolution, however, where the same filter is applied to each (color) channel, neural network convolutions typically linearly combine the activations from each of the $C_{1}$ input channels in a previous layer and use different convolution kernels for each of the $C_{2}$ output channels, as shown in Figures 5.34–5.35.<sup>35</sup> This makes sense, as the main task in convolutional neural network layers is to construct local features (Figure 3.40c) and to then combine them in different ways to produce more discriminative and semantically meaningful features.<sup>36</sup> Visualizations of the kinds of features that deep networks extract are shown in Figure 5.47 in Section 5.4.5.

![Figure 5.34](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/91ef23be74ac8db85bb22927344a67bee12ee447e3f1fe94a7e7f525a447fc12.jpg)  
Figure 5.34 2D convolution with multiple input and output channels © Glassner (2018). Each 2D convolution kernel takes as input all of the $C_{1}$ channels in the preceding layer, windowed to a small area, and produces the values (after the activation function non-linearity) in one of the $C_{2}$ channels in the next layer. For each of the output channels, we have $S^{2} \times C_{1}$ kernel weights, so the total number of learnable parameters in each convolutional layer is $S^{2} \times C_{1} \times C_{2}$ . In this figure, we have $C_{1} = 6$ input channels and $C_{2} = 4$ output channels, with an $S = 3$ convolution window, for a total of $9 \times 6 \times$ 4 learnable weights, shown in the middle column of the figure. Since the convolution is applied at each of the $W \times H$ pixels in a given layer, the amount of computation (multiply-adds) in each forward and backward pass over one sample in a given layer is $WHS^{2} C_{1} C_{2}$

With these intuitions in place, we can write the weighted linear sums (5.45) performed in a convolutional layer as

$$
s(i, j, c_{2}) = \sum_{c_{1} \in \{C_{1}\}} \sum_{(k, l) \in{\cal N}} w(k, l, c_{1}, c_{2}) x(i + k, j + l, c_{1}) + b(c_{2}),\tag{5.76}
$$

where the $x(i, j, c_{1})$ are the activations in the previous layer, just as in (5.45),  are the $S^{2}$ signed offsets in the 2D spatial kernel, and the notation $c_{1} \in \{C_{1}\}$ denotes $c_{1} \in[0, C_{1})$ . Note that because the offsets $(k, l)$ are added to (instead of subtracted from) the $(i, j)$ pixel coordinates, this operation is actually a correlation (3.13), but this distinction is usually glossed

![Figure 5.35](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/619ef5a2e1a625cb064874ed06483af038cb21f6962463e2aefe76eac14aeb12.jpg)  
Figure 5.35 2D convolution with multiple batches, input, and output channels, © Johnson (2020). When doing mini-batch gradient descent, a whole batch of training images or features is passed into a convolutional layer, which takes as input all of the $C_{\mathrm{in}}$ channels in the preceding layer, windowed to a small area, and produces the values (after the activation function non-linearity) in one of the $C_{\mathrm{out}}$ channels in the next layer. As before, for each of the output channels, we have $K_{w} \times K_{h} \times C_{\mathrm{in}}$ kernel weights, so the total number of learnable parameters in each convolutional layer is $K_{w} \times K_{h} \times C_{\mathrm{in}} \times C_{\mathrm{in}}$ . In this figure, we have $C_{\mathrm{in}} = 3$ input channels and $C_{\mathrm{out}} = 6$ output channels.

over.<sup>37</sup>

In neural network diagrams such as those shown in Figures 5.33 and 5.39–5.43, it is common to indicate the convolution kernel size S and the number of channels in a layer C, and only sometimes to show the image dimensions, as in Figures 5.33 and 5.39. Note that some neural networks such as the Inception module in GoogLeNet (Szegedy, Liu et al. 2015) shown in Figure 5.42 use 1  1 convolutions, which do not actually perform convolutions but rather combine various channels on a per-pixel basis, often with the goal of reducing the dimensionality of the feature space.

Because the weights in a convolution kernel are the same for all of the pixels within a given layer and channel, these weights are actually shared across what would result if we drew all of the connections between different pixels in different layers. This means that there are many fewer weights to learn than in fully connected layers. It also means that during backpropagation, kernel weight updates are summed over all of the pixels in a given layer/channel.

To fully determine the behavior of a convolutional layer, we still need to specify a few

additional parameters.<sup>38</sup> These include:

- Padding. Early networks such as LeNet-5 did not pad the image, which therefore shrank after each convolution. Modern networks can optionally specify a padding width and mode, using one of the choices used with traditional image processing, such as zero padding or pixel replication, as shown in Figure 3.13.

- Stride. The default stride for convolution is 1 pixel, but it is also possible to only evaluate the convolution at every nth column and row. For example, the first convolution layer in AlexNet (Figure 5.39) uses a stride of 4. Traditional image pyramids (Figure 3.31) use a stride of 2 when constructing the coarser levels.

- Dilation. Extra “space” (skipped rows and column) can be inserted between pixel samples during convolution, also known as dilated or a trous \` (with holes, in French, or often just “atrous”) convolution (Yu and Koltun 2016; Chen, Papandreou et al. 2018). While in principle this can lead to aliasing, it can also be effective at pooling over a larger region while using fewer operations and learnable parameters.

- Grouping. While, by default, all input channels are used to produce each output channel, we can also group the input and output layers into G separate groups, each of which is convolved separately (Xie, Girshick et al. 2017). G = 1 corresponds to regular convolution, while $G = C_{1}$ means that each corresponding input channel is convolved independently from the others, which is known as depthwise or channelseparated convolution (Howard, Zhu et al. 2017; Tran, Wang et al. 2019).

A nice animation of the effects of these different parameters created by Vincent Dumoulin can be found at https://github.com/vdumoulin/conv arithmetic as well as Dumoulin and Visin (2016).

In certain applications such as image inpainting (Section 10.5.1), the input image may come with an associated binary mask, indicating which pixels are valid and which need to be filled in. This is similar to the concept of alpha-matted images we studied in Section 3.1.3. In this case, one can use partial convolutions (Liu, Reda et al. 2018), where the input pixels are multiplied by the mask pixels and then normalized by the count of non-zero mask pixels. The mask channel output is set to 1 if any input mask pixels are non-zero. This resembles the pull-push algorithm of Gortler, Grzeszczuk et al. (1996) that we presented in Figure 4.2, except that the convolution weights are learned.

A more sophisticated version of partial convolutions is gated convolutions (Yu, Lin et al. 2019; Chang, Liu et al. 2019), where the per-pixel masks are derived from the previous layer using a learned convolution followed by a sigmoid non-linearity. This enables the network not only to learn a better measure of per-pixel confidence (weighting), but also to incorporate additional features such as user-drawn sketches or derived semantic information.

## 5.4.1 Pooling and unpooling

As we just saw in the discussion of convolution, strides of greater than 1 can be used to reduce the resolution of a given layer, as in the first convolutional layer of AlexNet (Figure 5.39). When the weights inside the convolution kernel are identical and sum up to 1, this is called average pooling and is typically applied in a channel-wise manner.

A widely used variant is to compute the maximum response within a square window, which is called max pooling. Common strides and window sizes for max pooling are a stride of 2 and $2 \times 2$ non-overlapping windows or $3 \times 3$ overlapping windows. Max pooling layers can be thought of as a “logical $\mathrm{or}^{\prime \prime}$ , since they only require one of the units in the pooling region to be turned on. They are also supposed to provide some shift invariance over the inputs. However, most deep networks are not all that shift-invariant, which degrades their performance. The paper by Zhang (2019) has a nice discussion of this issue and some simple suggestions to mitigate this problem.

One issue that commonly comes up is how to backpropagate through a max pooling layer. The max pool operator acts like a “switch” that shunts (connects) one of the input units to the output unit. Therefore, during backpropagation, we only need to pass the error and derivatives down to this maximally active unit, as long as we have remembered which unit has this response.

This same max unpooling mechanism can be used to create a “deconvolution network” when searching for the stimulus (Figure 5.47) that most strongly activates a particular unit (Zeiler and Fergus 2014).

If we want a more continuous behavior, we could construct a pooling unit that computes an $L_{p}$ norm over its inputs, since the $L_{p \to \infty}$ effectively computes a maximum over its components (Springenberg, Dosovitskiy et al. 2015). However, such a unit requires more computation, so it is not widely used in practice, except sometimes at the final layer, where it is known as generalized mean (GeM) pooling (Dollar, Tu´ et al. 2009; Tolias, Sicre, and Jegou´ 2016; Gordo, Almazan´ et al. 2017; Radenovic, Tolias, and Chum´ 2019) or dynamic mean (DAME) pooling (Yang, Kien Nguyen et al. 2019). In their paper, Springenberg, Dosovitskiy et al. (2015) also show that using strided convolution instead of max pooling can produce competitive results.

![Figure 5.36](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/4c692c59cef13aa9f0164d31770c0852867bb0a8158f27a05c72572efaba60ed.jpg)  
Figure 5.36 Transposed convolution (© Dumoulin and Visin (2016)) can be used to upsample (increase the size of) an image. Before applying the convolution operator, (s  1) extra rows and columns of zeros are inserted between the input samples, where s is the upsampling stride.

While unpooling can be used to (approximately) reverse the effect of max pooling operation, if we want to reverse a convolutional layer, we can look at learned variants of the interpolation operator we studied in Sections 3.5.1 and 3.5.3. The easiest way to visualize this operation is to add extra rows and columns of zeros between the pixels in the input layer, and to then run a regular convolution (Figure 5.36). This operation is sometimes called backward convolution with a fractional stride (Long, Shelhamer, and Darrell 2015), although it is more commonly known as transposed convolution (Dumoulin and Visin 2016), because when convolutions are written in matrix form, this operation is a multiplication with a transposed sparse weight matrix. Just as with regular convolution, padding, stride, dilation, and grouping parameters can be specified. However, in this case, the stride specifies the factor by which the image will be upsampled instead of downsampled.

## U-Nets and Feature Pyramid Networks

When discussing the Laplacian pyramid in Section 3.5.3, we saw how image downsampling and upsampling can be combined to achieve a variety of multi-resolution image processing tasks (Figure 3.33). The same kinds of combinations can be used in deep convolutional networks, in particular, when we want the output to be a full-resolution image. Examples of such applications include pixel-wise semantic labeling (Section 6.4), image denoising and super-resolution (Section 10.3), monocular depth inference (Section 12.8), and neural style transfer (Section 14.6). The idea of reducing the resolution of a network and then expanding it again is sometimes called a bottleneck and is related to earlier self-supervised network training using autoencoders (Hinton and Zemel 1994; Goodfellow, Bengio, and Courville 2016, Chapter 14).

One of the earliest applications of this idea was the fully convolutional network developed by Long, Shelhamer, and Darrell (2015). This paper inspired myriad follow-on architectures, including the hourglass-shaped “deconvolution” network of Noh, Hong, and Han (2015), the U-Net of Ronneberger, Fischer, and Brox (2015), the atrous convolution network with CRF refinement layer of Chen, Papandreou et al. (2018), and the panoptic feature pyramid networks of Kirillov, Girshick et al. (2019). Figure 5.37 shows the general layout of two of these networks, which are discussed in more detail in Section 6.4 on semantic segmentation. We will see other uses of these kinds of backbone networks (He, Gkioxari et al. 2017) in later sections on image denoising and super-resolution (Section 10.3), monocular depth inference (Section 12.8), and neural style transfer (Section 14.6).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/5f70078801f292e71c173c923f6baa9ab915e44acae513ff8b1e231bd8a02d64.jpg)

(a)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/5934f6bf0c02a5b4440cbb82e5b65f426d1b21ff683dcdcfd5f21a25d83f2ea9.jpg)

(b)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/fa276078573da21ad1859cfd5f21642fd026d4a5c7694d9c7e94e632a89e0ceb.jpg)  
(c)  
Figure 5.37 (a) The deconvolution network of Noh, Hong, and Han (2015) © 2015 IEEE and (b–c) the U-Net of Ronneberger, Fischer, and Brox (2015), drawn using the PlotNeural-Net LaTeX package. In addition to the fine-to-coarse-to-fine bottleneck used in (a), the U-Net also has skip connections between encoding and decoding layers at the same resolution.

![Figure 5.38](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/b03dd8ff881d900e88d9bf70f6d489e4ab5b3290b992a875d149ea7d955e9871.jpg)  
Figure 5.38 Screenshot from Andrej Karpathy’s web browser demos at https://cs.stanford. edu/ people/karpathy/convnetjs, where you can run a number of small neural networks, including CNNs for digit and tiny image classification.

## 5.4.2 Application: Digit classification

One of the earliest commercial application of convolutional neural networks was the LeNet-5 system created by LeCun, Bottou et al. (1998) whose architecture is shown in Figure 5.33. This network contained most of the elements of modern CNNs, although it used sigmoid non-linearities, average pooling, and Gaussian RBF units instead of softmax at its output. If you want to experiment with this simple digit recognition CNN, you can visit the interactive JavaScript demo created by Andrej Karpathy at https://cs.stanford.edu/people/karpathy/ convnetjs (Figure 5.38).

The network was initially deployed around 1995 by AT&T to automatically read checks deposited in NCR ATM machines to verify that the written and keyed check amounts were the same. The system was then incorporated into NCR’s high-speed check reading systems, which at some point were processing somewhere between 10% and 20% of all the checks in the US.<sup>39</sup>

![Figure 5.39](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/24e9785fdd15cdfc01350985875bdba41db769ec5da6f27875c6f3fd104f236e.jpg)  
Figure 5.39 Architecture of the SuperVision deep neural network (more commonly known as “AlexNet”), courtesy of Matt Deitke (redrawn from (Krizhevsky, Sutskever, and Hinton 2012)). The network consists of multiple convolutional layers with ReLU activations, max pooling, some fully connected layers, and a softmax to produce the final class probabilities.

Today, variants of the LeNet-5 architecture (Figure 5.33) are commonly used as the first convolutional neural network introduced in courses and tutorials on the subject.<sup>40</sup> Although the MNIST dataset (LeCun, Cortes, and Burges 1998) originally used to train LeNet-5 is still sometimes used, it is more common to use the more challenging CIFAR-10 (Krizhevsky 2009) or Fashion MNIST (Xiao, Rasul, and Vollgraf 2017) as datasets for training and testing.

## 5.4.3 Network architectures

While modern convolutional neural networks were first developed and deployed in the late 1990s, it was not until the breakthrough publication by Krizhevsky, Sutskever, and Hinton (2012) that they started outperforming more traditional techniques on natural image classification (Figure 5.40). As you can see in this figure, the AlexNet system (the more widely used name for their SuperVision network) led to a dramatic drop in error rates from 25.8% to 16.4%. This was rapidly followed in the next few years with additional dramatic performance improvements, due to further developments as well as the use of deeper networks, e.g., from the original 8-layer AlexNet to a 152-layer ResNet.

Figure 5.39 shows the architecture of the SuperVision network, which contains a series of convolutional layers with ReLU (rectified linear) non-linearities, max pooling, some fully connected layers, and a final softmax layer, which is fed into a multi-class cross-entropy loss. Krizhevsky, Sutskever, and Hinton (2012) also used dropout (Figure 5.29), small translation and color manipulation for data augmentation, momentum, and weight decay ($L_2$ weight penalties).

![Figure 5.40](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/b33caad11b70c871c521f277261e93b52f8c7ca1e9a6c1314a60e8806203f3fc.jpg)  
Figure 5.40 *Top-5 error rate and network depths of winning entries from the ImageNet Large Scale Visual Recognition Challenge (ILSVRC)* © Li, Johnson, and Yeung (2019).

The next few years after the publication of this paper saw dramatic improvement in the classification performance on the ImageNet Large Scale Visual Recognition Challenge (Russakovsky, Deng et al. 2015), as shown in Figure 5.40. A nice description of the innovations in these various networks, as well as their capacities and computational cost, can be found in the lecture slides by Justin Johnson (2020, Lecture 8).

The winning entry from 2013 by Zeiler and Fergus (2014) used a larger version of AlexNet with more channels in the convolution stages and lowered the error rate by about 30%. The 2014 Oxford Visual Geometry Group (VGG) winning entry by Simonyan and Zisserman (2014b) used repeated $3 \times 3$ convolution/ReLU blocks interspersed with $2 \times 2$ max pooling and channel doubling (Figure 5.41), followed by some fully connected layers, to produce 16– 19 layer networks that further reduced the error by 40%. However, as shown in Figure 5.44, this increased performance came at a greatly increased amount of computation.

The 2015 GoogLeNet of Szegedy, Liu et al. (2015) focused instead on efficiency. Goog-LeNet begins with an aggressive stem network that uses a series of strided and regular convolutions and max pool layers to quickly reduce the image resolutions from $224^{2}$ to $28^{2}$ . It then uses a number of Inception modules (Figure 5.42), each of which is a small branching neural network whose features get concatenated at the end. One of the important characteristics of this module is that it uses $1 \times 1$ “bottleneck” convolutions to reduce the number of channels before performing larger 3  3 and $5 \times 5$ convolutions, thereby saving a significant amount of computation. This kind of projection followed by an additional convolution is similar in spirit to the approximation of filters as a sum of separable convolutions proposed by Perona (1995). GoogLeNet also removed the fully connected (MLP) layers at the end, relying instead on global average pooling followed by one linear layer before the softmax. Its performance was similar to that of VGG but at dramatically lower computation and model size costs (Figure 5.44).

![Figure 5.41](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/1455c702a2340eeeb2bd534b9a2b06fd9fc703bf96fb614516624f77dbed66f9.jpg)

Figure 5.41 The VGG16 network of Simonyan and Zisserman (2014b) © Glassner (2018). (a) The network consists of repeated zero-pad, $3 \times 3$ convolution, ReLU blocks interspersed with $2 \times 2$ max pooling and a doubling in the number of channels. This is followed by some fully connected and dropout layers, with a final softmax into the 1,000 ImagetNet categories. (b) Some of the schematic neural network symbols used by Glassner (2018).  
![Figure 5.42](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/4cad28161f5bdafeb4c0a5f435019e05bed9d611da8d5ebdc4ae37825c834401.jpg)  
Figure 5.42 An Inception module from (Szegedy, Liu et al. 2015) © 2015 IEEE, which combines dimensionality reduction, multiple convolution sizes, and max pooling as different channels that get stacked together into a final feature map.

![Figure 5.43](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/c16d23873eba726a342ff94dec522c549b2022f4b1fe392b54bee18c8b038ec8.jpg)  
Figure 5.43 ResNet residual networks (He, Zhang et al. 2016a) © 2016 IEEE, showing skip connections going around a series of convolutional layers. The figure on the right uses a bottleneck to reduce the number of channels before the convolution. Having direct connections that shortcut the convolutional layer allows gradients to more easily flow backward through the network during training.

The following year saw the introduction of Residual Networks (He, Zhang et al. 2016a), which dramatically expanded the number of layers that could be successfully trained (Figure 5.40). The main technical innovation was the introduction of skip connections (originally called “shortcut connections”), which allow information (and gradients) to flow around a set of convolutional layers, as shown in Figure 5.43. The networks are called residual networks because they allow the network to learn the residuals (differences) between a set of incoming and outgoing activations. A variant on the basic residual block is the “bottleneck block” shown on the right side of Figure 5.43, which reduces the number of channels before performing the $3 \times 3$ convolutional layer. A further extension, described in (He, Zhang et al. 2016b), moves the ReLU non-linearity to before the residual summation, thereby allowing true identity mappings to be modeled at no cost.

To build a ResNet, various residual blocks are interspersed with strided convolutions and channel doubling to achieve the desired number of layers. (Similar downsampling stems and average pooled softmax layers as in GoogLeNet are used at the beginning and end.) By combining various numbers of residual blocks, ResNets consisting of 18, 34, 50, 101, and 152 layers have been constructed and evaluated. The deeper networks have higher accuracy but more computational cost (Figure 5.44). In 2015, ResNet not only took first place in the ILSVRC (ImageNet) classification, detection, and localization challenges, but also took first place in the detection and segmentation challenges on the newer COCO dataset and benchmark (Lin, Maire et al. 2014).

Since then, myriad extensions and variants have been constructed and evaluated. The ResNeXt system from Xie, Girshick et al. (2017) used grouped convolutions to slightly improve accuracy. Denseley connected CNNs (Huang, Liu et al. 2017) added skip connections between non-adjacent convolution and/or pool blocks. Finally, the Squeeze-and-Excitation network (SENet) by Hu, Shen, and Sun (2018) added global context (via global pooling) to each layer to obtain a noticeable increase in accuracy. More information about these and other CNN architectures can be found in both the original papers as well as class notes on this topic (Li, Johnson, and Yeung 2019; Johnson 2020).

## Mobile networks

As deep neural networks were getting deeper and larger, a countervailing trend emerged in the construction of smaller, less computationally expensive networks that could be used in mobile and embedded applications. One of the earliest networks tailored for lighter-weight execution was MobileNets (Howard, Zhu et al. 2017), which used depthwise convolutions, a special case of grouped convolutions where the number of groups equals the number of channels. By varying two hyperparameters, namely a width multiplier and a resolution multiplier, the network architecture could be tuned along an accuracy vs. size vs. computational efficiency tradeoff. The follow-on MobileNetV2 system (Sandler, Howard et al. 2018) added an “inverted residual structure”, where the shortcut connections were between the bottleneck layers. ShuffleNet (Zhang, Zhou et al. 2018) added a “shuffle” stage between grouped convolutions to enable channels in different groups to co-mingle. ShuffleNet V2 (Ma, Zhang et al. 2018) added a channel split operator and tuned the network architectures using end-to-end performance measures. Two additional networks designed for computational efficiency are ESPNet (Mehta, Rastegari et al. 2018) and ESPNetv2 (Mehta, Rastegari et al. 2019), which use pyramids of (depth-wide) dilated separable convolutions.

The concepts of grouped, depthwise, and channel-separated convolutions continue to be a widely used tool for managing computational efficiency and model size (Choudhary, Mishra et al. 2020), not only in mobile networks, but also in video classification (Tran, Wang et al. 2019), which we discuss in more detail in Section 5.5.2.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/14a544523b5ffb6c53ff863b073e941dcce32a352aadf87444164b2a88cf6a48.jpg)

![Figure 5.44](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/9fd4b70155a80413bd76e6a920cfce17ef5f0bff286d431d1a65e46383c7c3ce.jpg)  
Figure 5.44 Network accuracy vs. size and operation counts (Canziani, Culurciello, and Paszke 2017) © 2017 IEEE: In the right figure, the network accuracy is plotted against operation count (1–40 G-Ops), while the size of the circle indicates the number of parameters (10–155 M). The initials BN indicate a batch normalized version of a network.

## 5.4.4 Model zoos

A great way to experiment with these various CNN architectures is to download pre-trained models from a model zoo<sup>41</sup> such as the TorchVision library at https://github.com/pytorch/ vision. If you look in the torchvision/models folder, you will find implementations of AlexNet, VGG, GoogleNet, Inception, ResNet, DenseNet, MobileNet, and ShuffleNet, along with other models for classification, object detection, and image segmentation. Even more recent models, some of which are discussed in the upcoming sections, can be found in the PyTorch Image Models library (timm), https://github.com/rwightman/pytorch-image-models. Similar collections of pre-trained models exist for other languages, e.g., https://www.tensorflow.org/ lite/models for efficient (mobile) TensorFlow models.

While people often download and use pre-trained neural networks for their applications, it is more common to at least fine-tune such networks on data more characteristic of the application (as opposed to the public benchmark data on which most zoo models are trained).<sup>42</sup> It is also quite common to replace the last few layers, i.e., the head of the network (so called because it lies at the top of a layer diagram when the layers are stacked bottom-to-top) while leaving the backbone intact. The terms backbone and head(s) are widely used and were popularized by the Mask-RCNN paper (He, Gkioxari et al. 2017). Some more recent papers refer to the backbone and head as the trunk and its branches (Ding and Tao 2018; Kirillov, Girshick et al. 2019; Bell, Liu et al. 2020), with the term neck also being occasionally used (Chen, Wang et al. 2019).<sup>43</sup>

When adding a new head, its parameters can be trained using the new data specific to the intended application. Depending on the amount and quality of new training data available, the head can be as simple as a linear model such as an SVM or logistic regression/softmax (Donahue, Jia et al. 2014; Sharif Razavian, Azizpour et al. 2014), or as complex as a fully connected or convolutional network (Xiao, Liu et al. 2018). Fine-tuning some of the layers in the backbone is also an option, but requires sufficient data and a slower learning rate so that the benefits of the pre-training are not lost. The process of pre-training a machine learning system on one dataset and then applying it to another domain is called transfer learning (Pan and Yang 2009). We will take a closer look at transfer learning in Section 5.4.7 on self-supervised learning.

## Model size and efficiency

As you can tell from the previous discussion, neural network models come in a large variety of sizes (typically measured in number of parameters, i.e., weights and biases) and computational loads (often measured in FLOPs per forward inference pass). The evaluation by Canziani, Culurciello, and Paszke (2017), summarized in Figure 5.44, gives a snapshot of the performance (accuracy and size+operations) of the top-performing networks on the ImageNet challenge from 2012–2017. In addition to the networks we have already discussed, the study includes Inception-v3 (Szegedy, Vanhoucke et al. 2016) and Inception-v4 (Szegedy, Ioffe et al. 2017).

Because deep neural networks can be so memory- and compute-intensive, a number of researchers have investigated methods to reduce both, using lower precision (e.g., fixed-point) arithmetic and weight compression (Han, Mao, and Dally 2016; Iandola, Han et al. 2016). The XNOR-Net paper by Rastegari, Ordonez et al. (2016) investigates using binary weights (on-off connections) and optionally binary activations. It also has a nice review of previous binary networks and other compression techniques, as do more recent survey papers (Sze, Chen et al. 2017; Gu, Wang et al. 2018; Choudhary, Mishra et al. 2020).

## Neural Architecture Search (NAS)

One of the most recent trends in neural network design is the use of Neural Architecture Search (NAS) algorithms to try different network topologies and parameterizations (Zoph and Le 2017; Zoph, Vasudevan et al. 2018; Liu, Zoph et al. 2018; Pham, Guan et al. 2018; Liu, Simonyan, and Yang 2019; Hutter, Kotthoff, and Vanschoren 2019). This process is more efficient (in terms of a researcher’s time) than the trial-and-error approach that characterized earlier network design. Elsken, Metzen, and Hutter (2019) survey these and additional papers on this rapidly evolving topic. More recent publications include FBNet (Wu, Dai et al. 2019), RandomNets (Xie, Kirillov et al. 2019) , EfficientNet (Tan and Le 2019), RegNet (Radosavovic, Kosaraju et al. 2020), FBNetV2 (Wan, Dai et al. 2020), and EfficientNetV2 (Tan and Le 2021). It is also possible to do unsupervised neural architecture search (Liu, Dollar´ et al. 2020). Figure 5.45 shows the top-1% accuracy on ImageNet vs. the network size (# of parameters) and forward inference operation counts for a number of recent network architectures (Wan, Dai et al. 2020). Compared to the earlier networks shown in Figure 5.44, the newer networks use 10 (or more) fewer parameters.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/8f953121a5e05d94ef780c8690b0b3f0ec1678ffd1aa90b52bc448269d00fb2f.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/0bfc5aca68c199fa967c6e955cc6d304e29acc20ef9e0a0e405b378e24832242.jpg)  
(b)  
Figure 5.45 ImageNet accuracy vs. (a) size (# of parameters) and (b) operation counts for a number of recent efficient networks (Wan, Dai et al. 2020) © 2020 IEEE.

## Deep learning software

Over the last decade, a large number of deep learning software frameworks and programming language extensions have been developed. The Wikipedia entry on deep learning software lists over twenty such frameworks, about a half of which are still being actively developed.<sup>44</sup> While Caffe (Jia, Shelhamer et al. 2014) was one of the first to be developed and used for computer vision applications, it has mostly been supplanted by PyTorch and TensorFlow, at least if we judge by the open-source implementations that now accompany most computer vision research papers.

![Figure 5.46](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/c03890d80e1498dade99c35b7e8e5a2199c0495e19e4ab4f1da3df9e50b2a0c2.jpg)  
Figure 5.46 A Hinton diagram showing the weights connecting the units in a a three layer neural network, courtesy of Geoffrey Hinton. The size of each small box indicates the magnitude of each weight and its color (black or white) indicates the sign.

Andrew Glassner’s (2018) introductory deep learning book uses the Keras library because of its simplicity. The Dive into Deep Learning book (Zhang, Lipton et al. 2021) and associated course (Smola and Li 2019) use MXNet for all the examples in the text, but they have recently released PyTorch and TensorFlow code samples as well. Stanford’s CS231n (Li, Johnson, and Yeung 2019) and Johnson (2020) include a lecture on the fundamentals of Py-Torch and TensorFlow. Some classes also use simplified frameworks that require the students to implement more components, such as the Educational Framework (EDF) developed by McAllester (2020) and used in Geiger (2021).

In addition to software frameworks and libraries, deep learning code development usually benefits from good visualization libraries such as TensorBoard<sup>45</sup> and Visdom.<sup>46</sup> And in addition to the model zoos mentioned earlier in this section, there are even higher-level packages such as Classy Vision,<sup>47</sup> which allow you to train or fine-tune your own classifier with no or minimal programming. Andrej Karpathy also provides a useful guide for training neural networks at http://karpathy.github.io/2019/04/25/recipe, which may help avoid common issues.

## 5.4.5 Visualizing weights and activations

Visualizing intermediate and final results has always been an integral part of computer vision algorithm development (e.g., Figures 1.7–1.11) and is an excellent way to develop intuitions and debug or refine results. In this chapter, we have already seen examples of tools for simple two-input neural network visualizations, e.g., the TensorFlow Playground in Figure 5.32 and ConvNetJS in Figure 5.38. In this section, we discuss tools for visualizing network weights and, more importantly, the response functions of different units or layers in a network.

For a simple small network such as the one shown in Figure 5.32, we can indicate the strengths of connections using line widths and colors. What about networks with more units? A clever way to do this, called Hinton diagrams in honor of its inventor, is to indicate the strengths of the incoming and outgoing weights as black or white boxes of different sizes, as shown in Figure 5.46 (Ackley, Hinton, and Sejnowski 1985; Rumelhart, Hinton, and Williams 1986b).<sup>48</sup>

If we wish to display the set of activations in a given layer, e.g., the response of the final 10-category layer in MNIST or CIFAR-10, across some or all of the inputs, we can use non-linear dimensionality reduction techniques such as t-SNE and UMap discussed in Section 5.2.4 and Figure 5.21.

How can we visualize what individual units (“neurons”) in a deep network respond to? For the first layer in a network (Figure 5.47, upper left corner), the response can be read directly from the incoming weights (grayish images) for a given channel. We can also find the patches in the validation set that produce the largest responses across the units in a given channel (colorful patches in the upper left corner of Figure 5.47). (Remember that in a convolutional neural network, different units in a particular channel respond similarly to shifted versions of the input, ignoring boundary and aliasing effects.)

For deeper layers in a network, we can again find maximally activating patches in the input images. Once these are found, Zeiler and Fergus (2014) pair a deconvolution network with the original network to backpropagate feature activations all the way back to the image patch, which results in the grayish images in layers 2–5 in Figure 5.47. A related technique called guided backpropagation developed by Springenberg, Dosovitskiy et al. (2015) produces slightly higher contrast results.

Another way to probe a CNN feature map is to determine how strongly parts of an input image activate units in a given channel. Zeiler and Fergus (2014) do this by masking subregions of the input image with a gray square, which not only produces activation maps, but can also show the most likely labels associated with each image region (Figure 5.48). Simonyan, Vedaldi, and Zisserman (2013) describe a related technique they call saliency maps, Nguyen, Yosinski, and Clune (2016) call their related technique activation maximization, and Selvaraju, Cogswell et al. (2017) call their visualization technique gradient-weighted class activation mapping (Grad-CAM).

![Figure 5.47](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/cea81da75540e878f6fe9004c732a4217e31a36d9b13f814e4876ece1d2e3a08.jpg)  
Figure 5.47 Visualizing network weights and features (Zeiler and Fergus 2014) © 2014 Springer. Each visualized convolutional layer is taken from a network adapted from the SuperVision net of Krizhevsky, Sutskever, and Hinton (2012). The 3 3 subimages denote the top nine responses in one feature map (channel in a given layer) projected back into pixel space (higher layers project to larger pixel patches), with the color images on the right showing the most responsive image patches from the validation set, and the grayish signed images on the left showing the corresponding maximum stimulus pre-images.

![Figure 5.48](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/77e7d25660ff2e90e56a61c1af89c7b180ee04e163d040870110fd03d756b0a6.jpg)  
Figure 5.48 Heat map visualization from Zeiler and Fergus (2014) © 2014 Springer. By covering up portions of the input image with a small gray square, the response of a highly active channel in layer 5 can be visualized (second column), as can the feature map projections (third column), the likelihood of the correct class, and the most likely class per pixel.

![Figure 5.49](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/bf54ccd580eeabe96b7b96bd54780d6726ce08b1360d4779bf7bb45b7704ef66.jpg)  
Figure 5.49 Feature visualization of how GoogLeNet (Szegedy, Liu et al. 2015) trained on ImageNet builds up its representations over different layers, from Olah, Mordvintsev, and Schubert (2017).

![Figure 5.50](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/5cf8ed624f41f746fc64ddb73549a7e40aa9c1ed70cc21959c0e9288bf5d0f21.jpg)  
Figure 5.50 Examples of adversarial images © Szegedy, Zaremba et al. (2013). For each original image in the left column, a small random perturbation (shown magnified by 10 in the middle column) is added to obtain the image in the right column, which is always classified as an ostrich.

Many more techniques for visualizing neural network responses and behaviors have been described in various papers and blogs (Mordvintsev, Olah, and Tyka 2015; Zhou, Khosla et al. 2015; Nguyen, Yosinski, and Clune 2016; Bau, Zhou et al. 2017; Olah, Mordvintsev, and Schubert 2017; Olah, Satyanarayan et al. 2018; Cammarata, Carter et al. 2020), as well as the extensive lecture slides by Johnson (2020, Lecture 14). Figure 5.49 shows one example, visualizing different layers in a pre-trained GoogLeNet. OpenAI also recently released a great interactive tool called Microscope,<sup>49</sup> which allows people to visualize the significance of every neuron in many common neural networks.

## 5.4.6 Adversarial examples

While techniques such as guided backpropagation can help us better visualize neural network responses, they can also be used to “trick” deep networks into misclassifying inputs by subtly perturbing them, as shown in Figure 5.50. The key to creating such images is to take a set of final activations and to then backpropagate a gradient in the direction of the “fake” class, updating the input image until the fake class becomes the dominant activation. Szegedy, Zaremba et al. (2013) call such perturbed images adversarial examples.

Running this backpropagation requires access to the network and its weights, which means that this is a white box attack, as opposed to a black box attack, where nothing is known about the network. Surprisingly, however, the authors find “... that adversarial examples are relatively robust, and are shared by neural networks with varied number of layers, activations or trained on different subsets of the training data.”

The initial discovery of adversarial attacks spurred a flurry of additional investigations (Goodfellow, Shlens, and Szegedy 2015; Nguyen, Yosinski, and Clune 2015; Kurakin, Goodfellow, and Bengio 2016; Moosavi-Dezfooli, Fawzi, and Frossard 2016; Goodfellow, Papernot et al. 2017). Eykholt, Evtimov et al. (2018) show how adding simple stickers to real world objects (such as stop signs) can cause neural networks to misclassify photographs of such objects. Hendrycks, Zhao et al. (2021) have created a database of natural images that consistently fool popular deep classification networks trained on ImageNet. And while adversarial examples are mostly used to demonstrate the weaknesses of deep learning models, they can also be used to improve recognition (Xie, Tan et al. 2020).

Ilyas, Santurkar et al. (2019) try to demystify adversarial examples, finding that instead of making the anticipated large-scale perturbations that affect a human label, they are performing a type of shortcut learning (Lapuschkin, Waldchen ¨ et al. 2019; Geirhos, Jacobsen et al. 2020). They find that optimizers are exploiting the non-robust features for an image label; that is, non-random correlations for an image class that exist in the dataset, but are not easily detected by humans. These non-robust features look merely like noise to a human observer, leaving images perturbed by them predominantly the same. Their claim is supported by training classifiers solely on non-robust features and finding that they correlate with image classification performance.

Are there ways to guard against adversarial attacks? The cleverhans software library (Papernot, Faghri et al. 2018) provides implementations of adversarial example construction techniques and adversarial training. There’s also an associated http://www.cleverhans.io blog on security and privacy in machine learning. Madry, Makelov et al. (2018) show how to train a network that is robust to bounded additive perturbations in known test images. There’s also recent work on detecting (Qin, Frosst et al. 2020b) and deflecting adversarial attacks (Qin, Frosst et al. 2020a) by forcing the perturbed images to visually resemble their (false) target class. This continues to be an evolving area, with profound implications for the robustness and safety of machine learning-based applications, as is the issue of dataset bias (Torralba and Efros 2011), which can be guarded against, to some extent, by testing cross-dataset transfer performance (Ranftl, Lasinger et al. 2020).

## 5.4.7 Self-supervised learning

As we mentioned previously, it is quite common to pre-train a backbone (or trunk) network for one task, e.g., whole image classification, and to then replace the final (few) layers with a new head (or one or more branches), which are then trained for a different task, e.g., semantic image segmentation (He, Gkioxari et al. 2017). Optionally, the last few layers of the original backbone network can be fine-tuned.

The idea of training on one task and then using the learning on another is called transfer learning, while the process of modifying the final network to its intended application and statistics is called domain adaptation. While this idea was originally applied to backbones trained on labeled datasets such as ImageNet, i.e., in a fully supervised manner, the possibility of pre-training on the immensely larger set of unlabeled real-world images always remained a tantalizing possibility.

The central idea in self-supervised learning is to create a supervised pretext task where the labels can be automatically derived from unlabeled images, e.g., by asking the network to predict a subset of the information from the rest. Once pre-trained, the network can then be modified and fine-tuned on the final intended downstream task. Weng (2019) has a wonderful introductory blog post on this topic, and Zisserman (2018) has a great lecture, where the term proxy task is used. Additional good introductions can be found in the survey by Jing and Tian (2020) and the bibliography by Ren (2020).

Figure 5.51 shows some examples of pretext tasks that have been proposed for pretraining image classification networks. These include:

- Context prediction (Doersch, Gupta, and Efros 2015): take nearby image patches and predict their relative positions.

- Context encoders (Pathak, Krahenbuhl et al. 2016): inpaint one or more missing regions in an image.

- 9-tile jigsaw puzzle (Noroozi and Favaro 2016): rearrange the tiles into their correct positions.

- Colorizing black and white images (Zhang, Isola, and Efros 2016).

- Rotating images by multiples of 90° to make them upright (Gidaris, Singh, and Komodakis 2018). The paper compares itself against 11 previous self-supervised techniques.

In addition to using single-image pretext tasks, many researchers have used video clips, since successive frames contain semantically related content. One way to use this information is to order video frames correctly in time, i.e., to use a temporal version of context prediction and jigsaw puzzles (Misra, Zitnick, and Hebert 2016; Wei, Lim et al. 2018). Another is to extend colorization to video, with the colors in the first frame given (Vondrick,

Reference Frame  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/2431125c142d8089aa2ec3bbc5f085d212b8e50a30fbc90d4b64b2c50039f5c3.jpg)  
Question 1:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/78cf527c4cddbd91f035db9ac02ea5c40efeff112d498acc531eac48a5134186.jpg)  
Question 2:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/06989fa04ac4faffb8795150763d8a37526f74fd37591ed6aa2b912eb10d20d2.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/2b6562fcdaf74c50e27b3c9bf2026ca8e8f4ab25cc0c4da1b23df4a1c5e43e59.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/d7795a7ee8d981d64fe8ac4def667997ea13b5791d00bd7b2833d3ce5a8c12f6.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/aa84da2ed314b65c863bc85acc72b75c08b6a510c35fac47ab15252c580d5ff2.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/5c63a6f9274dd2dd65c15697872ca48474798e8db94a8547a5507bb370f9d725.jpg)

(a)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/f3d389785f23f24b528f3fc556f19a271e7d9c5c9bda82a8851a1e61f3977b30.jpg)  
(c)

(b)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/3b213195c477f4ed99a373ebe8e2197f394e417c54354279bdbcd0842d6e9c37.jpg)  
(d)  
Figure 5.51 Examples of self-supervised learning tasks: (a) guessing the relative positions of image patches—can you guess the answers to Q1 and Q2? (Doersch, Gupta, and Efros 2015) © 2015 IEEE; (b) solving a nine-tile jigsaw puzzle (Noroozi and Favaro 2016) © 2016 Springer; (c) image colorization (Zhang, Isola, and Efros 2016) © 2016 Springer; (d) video color transfer for tracking (Vondrick, Shrivastava et al. 2018) © 2016 Springer.

Shrivastava et al. 2018), which encourages the network to learn semantic categories and correspondences. And since videos usually come with sounds, these can be used as additional cues in self-supervision, e.g., by asking a network to align visual and audio signals (Chung and Zisserman 2016; Arandjelovic and Zisserman 2018; Owens and Efros 2018), or in an unsupervised (contrastive) framework (Alwassel, Mahajan et al. 2020; Patrick, Asano et al. 2020).

Since self-supervised learning shows such great promise, an open question is whether such techniques could at some point surpass the performance of fully-supervised networks trained on smaller fully-labeled datasets.<sup>50</sup> Some impressive results have been shown using semi-supervised (weak) learning (Section 5.2.5) on very large (300M–3.5B) partially or noisily labeled datasets such as JFT-300M (Sun, Shrivastava et al. 2017) and Instagram hashtags (Mahajan, Girshick et al. 2018). Other researchers have tried simultaneously using supervised learning on labeled data and self-supervised pretext task learning on unlabeled data (Zhai, Oliver et al. 2019; Sun, Tzeng et al. 2019). It turns out that getting the most out of such approaches requires careful attention to dataset size, model architecture and capacity, and the extract details (and difficulty) of the pretext tasks (Kolesnikov, Zhai, and Beyer 2019; Goyal, Mahajan et al. 2019; Misra and Maaten 2020). At the same time, others are investigating how much real benefit pre-training actually gives in downstream tasks (He, Girshick, and Dollar´ 2019; Newell and Deng 2020; Feichtenhofer, Fan et al. 2021).

Semi-supervised training systems automatically generate ground truth labels for pretext tasks so that these can be used in a supervised manner (e.g, by minimizing classification errors). An alternative is to use unsupervised learning with a contrastive loss (Section 5.3.4) or other ranking loss (Gomez ´ 2019) to encourage semantically similar inputs to produce similar encodings while spreading dissimilar inputs further apart. This is commonly now called contrastive (metric) learning.

Wu, Xiong et al. (2018) train a network to produce a separate embedding for each instance (training example), which they store in a moving average memory bank as new samples are fed through the neural network being trained. They then classify new images using nearest neighbors in the embedding space. Momentum Contrast (MoCo) replaces the memory bank with a fixed-length queue of encoded samples fed through a temporally adapted momentum encoder, which is separate from the actual network being trained (He, Fan et al. 2020). Pretext-invariant representation learning (PIRL) uses pretext tasks and “multi-crop” data augmentation, but then compares their outputs using a memory bank and contrastive loss (Misra and Maaten 2020). SimCLR (simple framework for contrastive learning) uses fixed mini-batches and applies a contrastive loss (normalized temperature cross-entropy, similar to (5.58)) between each sample in the batch and all the other samples, along with aggressive data augmentation (Chen, Kornblith et al. 2020). MoCo v2 combines ideas from MoCo and SimCLR to obtain even better results (Chen, Fan et al. 2020). Rather than directly comparing the generated embeddings, a fully connected network (MLP) is first applied.

Contrastive losses are a useful tool in metric learning, since they encourage distances in an embedding space to be small for semantically related inputs. An alternative is to use deep clustering to similarly encourage related inputs to produce similar outputs (Caron, Bojanowski et al. 2018; Ji, Henriques, and Vedaldi 2019; Asano, Rupprecht, and Vedaldi 2020; Gidaris, Bursuc et al. 2020; Yan, Misra et al. 2020). Some of the latest results using clustering for unsupervised learning now produce results competitive with contrastive metric learning and also suggest that the kinds of data augmentation being used are even more important than the actual losses that are chosen (Caron, Misra et al. 2020; Tian, Chen, and Ganguli 2021). In the context of vision and language (Section 6.6), CLIP (Radford, Kim et al. 2021) has achieved remarkable generalization for image classification using contrastive learning and “natural-language supervision.” With a dataset of 400 million text and image pairs, their task is to take in a single image and a random sample of 32,768 text snippets and predict which text snippet is truly paired with the image.

Interestingly, it has recently been discovered that representation learning that only enforces similarity between semantically similar inputs also works well. This seems counterintuitive, because without negative pairs as in contrastive learning, the representation can easily collapse to trivial solutions by predicting a constant for any input and maximizing similarity. To avoid this collapse, careful attention is often paid to the network design. Bootstrap Your Own Latent (BYOL) (Grill, Strub et al. 2020) shows that with a momentum encoder, an extra predictor MLP on the online network side, and a stop-gradient operation on the target network side, one can successfully remove the negatives from MoCo v2 training. SimSiam (Chen and He 2021) further shown that even the momentum encoder is not required and only a stop-gradient operation is sufficient for the network to learn meaningful representations. While both systems jointly train the predictor MLP and the encoder with gradient updates, it has been even more recently shown that the predictor weights can be directly set using statistics of the input right before the predictor layer (Tian, Chen, and Ganguli 2021). Feichtenhofer, Fan et al. (2021) compare a number of these unsupervised representation learning techniques on a variety of video understanding tasks and find that the learned spatiotemporal representations generalize well to different tasks.

Contrastive learning and related work rely on compositions of data augmentations (e.g. color jitters, random crops, etc.) to learn representations that are invariant to such changes (Chen and He 2021). An alternative attempt is to use generative modeling (Chen, Radford et al. 2020), where the representations are pre-trained by predicting pixels either in an autoregressive (GPT- or other language model) manner or a de-noising (BERT-, masked autoencoder) manner. Generative modeling has the potential to bridge self-supervised learning across domains from vision to NLP, where scalable pre-trained models are now dominant.

One final variant on self-supervised learning is using a student-teacher model, where the teacher network is used to provide training examples to a student network. These kinds of architectures were originally called model compression (Bucila, Caruana, and Niculescu-ˇ Mizil 2006) and knowledge distillation (Hinton, Vinyals, and Dean 2015) and were used to produce smaller models. However, when coupled with additional data and larger capacity networks, they can also be used to improve performance. Xie, Luong et al. (2020) train an EfficientNet (Tan and Le 2019) on the labeled ImageNet training set, and then use this network to label an additional 300M unlabeled images. The true labels and pseudo-labeled images are then used to train a higher-capacity “student”, using regularization (e.g., dropout) and data augmentation to improve generalization. The process is then repeated to yield further improvements.

In all, self-supervised learning is currently one of the most exciting sub-areas in deep learning,<sup>51</sup> and many leading researchers believe that it may hold the key to even better deep learning (LeCun and Bengio 2020). To explore implementations further, VISSL provides open-source PyTorch implementations of many state-of-the-art self-supervised learning models (with weights) that were described in this section.<sup>52</sup>

## 5.5 More complex models

While deep neural networks started off being used in 2D image understanding and processing applications, they are now also widely used for 3D data such as medical images and video sequences. We can also chain a series of deep networks together in time by feeding the results from one time frame to the next (or even forward-backward). In this section, we look first at three-dimensional convolutions and then at recurrent models that propagate information forward or bi-directionally in time. We also look at generative models that can synthesize completely new images from semantic or related inputs.

## 5.5.1 Three-dimensional CNNs

As we just mentioned, deep neural networks in computer vision started off being used in the processing of regular two-dimensional images. However, as the amount of video being shared and analyzed increases, deep networks are also being applied to video understanding, which we discuss in more detail Section 6.5. We are also seeing applications in three-dimensional volumetric models such as occupancy maps created from range data (Section 13.5) and volumetric medical images (Section 6.4.1).

It may appear, at first glance, that the convolutional networks we have already studied, such as the ones illustrated in Figures 5.33, 5.34, and 5.39 already perform 3D convolutions, since their input receptive fields are 3D boxes in $(x, y, c)$ , where c is the (feature) channel dimension. So, we could in principle fit a sliding window (say in time, or elevation) into a 2D network and be done. Or, we could use something like grouped convolutions. However, it’s more convenient to operate on a complete 3D volume all at once, and to have weight sharing across the third dimension for all kernels, as well as multiple input and output feature channels at each layer.

![Figure 5.52](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/c146d14e30e10c6fed846bc6faf3498cfa8726f65aae25d414a9a94bd7186cbe.jpg)  
Figure 5.52 Alternative approaches to information fusion over the temporal dimensions (Karpathy, Toderici et al. 2014) © 2014 IEEE.

One of the earliest applications of 3D convolutions was in the processing of video data to classify human actions (Kim, Lee, and Yang 2007; Ji, Xu et al. 2013; Baccouche, Mamalet et al. 2011). Karpathy, Toderici et al. (2014) describe a number of alternative architectures for fusing temporal information, as illustrated in Figure 5.52. The single frame approach classifies each frame independently, depending purely on that frame’s content. Late fusion takes features generated from each frame and makes a per-clip classification. Early fusion groups small sets of adjacent frames into multiple channels in a 2D CNN. As mentioned before, the interactions across time do not have the convolutional aspects of weight sharing and temporal shift invariance. Finally, 3D CNNs (Ji, Xu et al. 2013) (not shown in this figure) learn 3D space and time-invariance kernels that are run over spatio-temporal windows and fused into a final score.

Tran, Bourdev et al. (2015) show how very simple 3 3 3 convolutions combined with pooling in a deep network can be used to obtain even better performance. Their C3D network can be thought of as the “VGG of 3D CNNs” (Johnson 2020, Lecture 18). Carreira and Zisserman (2017) compare this architecture to alternatives that include two-stream models built by analyzing pixels and optical flows in parallel pathways (Figure 6.44b). Section 6.5 on video understanding discusses these and other architectures used for such problems, which have also been attacked using sequential models such as recurrent neural networks (RNNs) and LSTM, which we discuss in Section 5.5.2. Lecture 18 on video understanding by Johnson (2020) has a nice review of all these video understanding architectures.

In addition to video processing, 3D convolutional neural networks have been applied to volumetric image processing. Two examples of shape modeling and recognition from range data, i.e., 3D ShapeNets (Wu, Song et al. 2015) and VoxNet (Maturana and Scherer 2015)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/8c4af38070be8845ab8c7b39ded5050fe52119afb754e6dd587b1dda6ee8e112.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/1445de8369d7b88ee4755b78e57da134543b8651cd2a9c91b24b6f713e1f89d2.jpg)  
(b)  
Figure 5.53 3D convolutional networks applied to volumetric data for object detection: (a) 3D ShapeNets (Wu, Song et al. 2015) © 2015 IEEE; (b) VoxNet (Maturana and Scherer 2015) © 2015 IEEE.

are shown in Figure 5.53. Examples of their application to medical image segmentation (Kamnitsas, Ferrante et al. 2016; Kamnitsas, Ledig et al. 2017) are discussed in Section 6.4.1. We discuss neural network approaches to 3D modeling in more detail in Sections 13.5.1 and 14.6.

Like regular 2D CNNs, 3D CNN architectures can exploit different spatial and temporal resolutions, striding, and channel depths, but they can be very computation and memory intensive. To counteract this, Feichtenhofer, Fan et al. (2019) develop a two-stream SlowFast architecture, where a slow pathway operates at a lower frame rate and is combined with features from a fast pathway with higher temporal sampling but fewer channels (Figure 6.44c). Video processing networks can also be made more efficient using channel-separated convolutions (Tran, Wang et al. 2019) and neural architecture search (Feichtenhofer 2020). Multigrid techniques (Appendix A.5.3) can also be used to accelerate the training of video recognition models (Wu, Girshick et al. 2020).

![Figure 5.54](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/cd8135b8e69db963a64c96b961c97e60e4e6bfb4557af97ae6c356d28bd7077f.jpg)  
Figure 5.54 Overview of the Mesh R-CNN system (Gkioxari, Malik, and Johnson 2019) © 2019 IEEE. A Mask R-CNN backbone is augmented with two 3D shape inference branches. The voxel branch predicts a coarse shape for each detected object, which is further deformed with a sequence of refinement stages in the mesh refinement branch.

## 3D point clouds and meshes

In addition to processing 3D gridded data such as volumetric density, implicit distance functions, and video sequences, neural networks can be used to infer 3D models from single images. One approach is to predict per-pixel depth, which we study in Section 12.8. Another is to reconstruct full 3D models represented using volumetric density (Choy, Xu et al. 2016), which we study in Sections 13.5.1 and 14.6. Some more recent experiments, however, suggest that some of these 3D inference networks (Tatarchenko, Dosovitskiy, and Brox 2017; Groueix, Fisher et al. 2018; Richter and Roth 2018) may just be recognizing the general object category and doing a small amount of fitting (Tatarchenko, Richter et al. 2019).

Generating and processing 3D point clouds has also been extensively studied (Fan, Su, and Guibas 2017; Qi, Su et al. 2017; Wang, Sun et al. 2019). Guo, Wang et al. (2020) provide a comprehensive survey that reviews over 200 publications in this area.

A final alternative is to infer 3D triangulated meshes from either RGB-D (Wang, Zhang et al. 2018) or regular RGB (Gkioxari, Malik, and Johnson 2019; Wickramasinghe, Fua, and Knott 2021) images. Figure 5.54 illustrates the components of the Mesh R-CNN system, which detects images of 3D objects and turns each one into a triangulated mesh after first reconstructing a volumetric model. The primitive operations and representations needed to process such meshes using deep neural networks can be found in the PyTorch3D library.<sup>53</sup>

![Figure 5.55](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/df8f722a66f5cf5ce976c8bed08f98b854e66c5f152dbc76dc1ea4ad260495ee.jpg)  
Figure 5.55 A deep recurrent neural network (RNN) uses multiple stages to process sequential data, with the output of one stage feeding the input of the next © Glassner (2018). Each stage maintains its own state and backpropagates its own gradients, although weights are shared between all stages. Column (a) shows a more compact rolled-up diagram, while column (b) shows the corresponding unrolled version.

## 5.5.2 Recurrent neural networks

While 2D and 3D convolutional networks are a good fit for images and volumes, sometimes we wish to process a sequence of images, audio signals, or text. A good way to exploit previously seen information is to pass features detected at one time instant (e.g., video frame) as input to the next frame’s processing. Such architectures are called Recurrent Neural Networks (RNNs) and are described in more detail in Goodfellow, Bengio, and Courville (2016, Chapter 10) and Zhang, Lipton et al. (2021, Chapter 8). Figure 5.55 shows a schematic sketch of such an architecture. Deep network layers not only pass information on to subsequent layers (and an eventual output), but also feed some of their information as input to the layer processing the next frame of data. Individual layers share weights across time (a bit like 3D convolution kernels), and backpropagation requires computing derivatives for all of the “unrolled” units (time instances) and summing these derivatives to obtain weight updates.

Because gradients can propagate for a long distance backward in time, and can therefore vanish or explode (just as in deep networks before the advent of residual networks), it is also possible to add extra gating units to modulate how information flows between frames. Such architectures are called Gated Recurrent Units (GRUs) and Long short-term memory (LSTM)

(Hochreiter and Schmidhuber 1997; Zhang, Lipton et al. 2021, Chapter 9).

RNNs and LSTMs are often used for video processing, since they can fuse information over time and model temporal dependencies (Baccouche, Mamalet et al. 2011; Donahue, Hendricks et al. 2015; Ng, Hausknecht et al. 2015; Srivastava, Mansimov, and Salakhudinov 2015; Ballas, Yao et al. 2016), as well as language modeling, image captioning, and visual question answering. We discuss these topics in more detail in Sections 6.5 and 6.6. They have also occasionally been used to merge multi-view information in stereo (Yao, Luo et al. 2019; Riegler and Koltun 2020a) and to simulate iterative flow algorithms in a fully differentiable (and hence trainable) manner (Hur and Roth 2019; Teed and Deng 2020b).

To propagate information forward in time, RNNs, GRUs, and LSTMs need to encode all of the potentially useful previous information in the hidden state being passed between time steps. In some situations, it is useful for a sequence modeling network to look further back (or even forward) in time. This kind of capability is often called attention and is described in more detail in Zhang, Lipton et al. (2021, Chapter 10), Johnson (2020, Lecture 12), and Section 5.5.3 on transformers. In brief, networks with attention store lists of keys and values, which can be probed with a query to return a weighted blend of values depending on the alignment between the query and each key. In this sense, they are similar to kernel regression (4.12–4.14), which we studied in Section 4.1.1, except that the query and the keys are multiplied (with appropriate weights) before being passed through a softmax to determine the blending weights.

Attention can either be used to look backward at the hidden states in previous time instances (which is called self-attention), or to look at different parts of the image (visual attention, as illustrated in Figure 6.46). We discuss these topics in more detail in Section 6.6 on vision and language. When recognizing or generating sequences, such as the words in a sentence, attention modules often used to work in tandem with sequential models such as RNNs or LSTMs. However, more recent works have made it possible to apply attention to the entire input sequence in one parallel step, as described in Section 5.5.3 on transformers.

The brief descriptions in this section just barely skim the broad topic of deep sequence modeling, which is usually covered in several lectures in courses on deep learning (e.g., Johnson 2020, Lectures 12–13) and several chapters in deep learning textbooks (Zhang, Lipton et al. 2021, Chapters 8–10). Interested readers should consult these sources for more detailed information.

## 5.5.3 Transformers

Transformers, which are a novel architecture that adds attention mechanisms (which we describe below) to deep neural networks, were first introduced by Vaswani, Shazeer et al. (2017)

in the context of neural machine translation, where the task consists of translating text from one language to another (Mikolov, Sutskever et al. 2013). In contrast to RNNs and their variants (Section 5.5.2), which process input tokens one at a time, transformers can to operate on the entire input sequence at once. In the years after first being introduced, transformers became the dominant paradigm for many tasks in natural language processing (NLP), enabling the impressive results produced by BERT (Devlin, Chang et al. 2018), RoBERTa (Liu, Ott et al. 2019), and GPT-3 (Brown, Mann et al. 2020), among many others. Transformers then began seeing success when processing the natural language component and later layers of many vision and language tasks (Section 6.6). More recently, they have gained traction in pure computer vision tasks, even outperforming CNNs on several popular benchmarks.

The motivation for applying transformers to computer vision is different than that of applying it to NLP. Whereas RNNs suffer from sequentially processing the input, convolutions do not have this problem, as their operations are already inherently parallel. Instead, the problem with convolutions has to do with their inductive biases, i.e., the default assumptions encoded into convolutional models.

A convolution operation assumes that nearby pixels are more important than far away pixels. Only after several convolutional layers are stacked together does the receptive field grow large enough to attend to the entire image (Araujo, Norris, and Sim 2019), unless the network is endowed with non-local operations (Wang, Girshick et al. 2018) similar to those used in some image denoising algorithms (Buades, Coll, and Morel 2005a). As we have seen in this chapter, convolution’s spatial locality bias has led to remarkable success across many aspects of computer vision. But as datasets, models, and computational power grow by orders of magnitude, these inductive biases may become a factor inhibiting further progress.<sup>54</sup>

The fundamental component of a transformer is self-attention, which is itself built out of applying attention to each of N unit activations in a given layer in the network.<sup>55</sup> Attention is often described using an analogy to the concept of associative maps or dictionaries found as data structures in programming languages and databases. Given a set of key-value pairs, $\{(\mathbf{k}_{i}, \mathbf{v}_{i})\}$ and a query q, a dictionary returns the value $\mathbf{v}_{i}$ corresponding to the key $\mathbf{k}_{i}$ that exactly matches the query. In neural networks, the key and query values are real-valued vectors (e.g., linear projections of activations), so the corresponding operation returns a weighted sum of values where the weights depend on the pairwise distances between a query and the set of keys. This is basically the same as scattered data interpolation, which we studied in

![Figure 5.56](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/c43f50e8ce41e9fd08c7563f44a23654b17b1bcf3e64727c7f88c1864a791cc8.jpg)  
Figure 5.56 The self-attention computation graph to compute a single output vector $\mathbf{x}_{2}^{\prime}$ courtesy of Matt Deitke, adapted from Vaswani, Huang, and Manning (2019). Note that the full self-attention operation also computes outputs for $\mathbf{x}_{1}^{\prime}, \mathbf{x}_{3}^{\prime}.$ , and $\mathbf{x}_{4}^{\prime}$ by shifting the input to the query $\mathbf{\tau}(\mathbf{x}_{2}$ in this case) between $\mathbf{x}_{1}, \ \mathbf{x}_{3},$ , and $\mathbf{x}_{4}$ , respectively. For each of matmul<sub>V</sub> , matmul , and matmul , there is a single matrix of weights that gets reused with each call.

Section 4.1.1, as pointed out in Zhang, Lipton et al. (2021, Section 10.2). However, instead of using radial distances as in (4.14), attention mechanisms in neural networks more commonly use scaled dot-product attention (Vaswani, Shazeer et al. 2017; Zhang, Lipton et al. 2021, Section 10.3.3), which involves taking the dot product between the query and key vectors, scaling down by the square root of the dimension of these embeddings $D,^{56}$ and then applying the softmax function of (5.5), i.e.,

$$
\mathbf{y} = \sum_{i} \alpha(\mathbf{q} \cdot \mathbf{k}_{i} / D) \mathbf{v}_{i} = \mathrm{softmax}(\mathbf{q}^{T} \mathbf{K} / D)^{T} \mathbf{V},\tag{5.77}
$$

where K and V are the row-stacked matrices composed of the key and value vectors, respectively, and y is the output of the attention operator.<sup>57</sup>

Given a set of input vectors $\left\{\mathbf{x}_{0}, \mathbf{x}_{1}, \ldots, \mathbf{x}_{N - 1} \right\}$ , the self-attention operation produces a set of output vectors $\big \{\mathbf{x}_{0}^{\prime}, \mathbf{x}_{1}^{\prime}, \ldots, \mathbf{x}_{N - 1}^{\prime} \big\}$ . Figure 5.56 shows the case for $N = 4$ , where

the self-attention computation graph is used to obtain a single output vector $\mathbf{x}_{2}^{\prime}$ . As pictured, self-attention uses three learned weight matrices, $\mathbf{W_{q}}, \mathbf{W_{k}}$ , and $\mathbf{W_{v}}$ , which determine the

$$
\mathbf{q}_{i} = \mathbf{W}_{\mathbf{q}} \mathbf{x}_{i}, \mathbf{k}_{i} = \mathbf{W}_{\mathbf{k}} \mathbf{x}_{i}, \mathrm{and} \mathbf{v}_{i} = \mathbf{W}_{\mathbf{v}} \mathbf{x}_{i}\tag{5.78}
$$

per-unit query, key, and value vectors going into each attention block. The weighted sum of values is then optionally passed through a multi-layer perceptron (MLP) to produce $\mathbf{x}_{2}^{\prime}$

In comparison to a fully connected or convolutional layer, self-attention computes each output $(\mathbf{e.g., x}_{i}^{\prime})$ based on all of the input vectors $\left\{\mathbf{x}_{0}, \mathbf{x}_{1}, \ldots, \mathbf{x}_{N - 1} \right\}$ . In that sense, it is often compared to a fully connected layer, but instead of the weights being fixed for each input, the weights are adapted on the spot, based on the input (Khan, Naseer et al. 2021). Compared to convolutions, self-attention is able to attend to every part of the input from the start, instead of constraining itself to local regions of the input, which may help it introduce the kind of context information needed to disambiguate the objects shown in Figure 6.8.

There are several components that are combined with self-attention to produce a transformer block, as described in Vaswani, Shazeer et al. (2017). The full transformer consists of both an encoder and a decoder block, although both share many of the same components. In many applications, an encoder can be used without a decoder (Devlin, Chang et al. 2018; Dosovitskiy, Beyer et al. 2021) and vice versa (Razavi, van den Oord, and Vinyals 2019).

The right side of Figure 5.57 shows an example of a transformer encoder block. For both the encoder and decoder:

- Instead of modeling set-to-set operations, we can model sequence-to-sequence operations by adding a positional encoding to each input vector (Gehring, Auli et al. 2017). The positional encoding typically consists of a set of temporally shifted sine waves from which position information can be decoded. (Such position encodings have also recently been added to implicit neural shape representations, which we study in Sections 13.5.1 and 14.6.)

- In lieu of applying a single self-attention operation to the input, multiple self-attention operations, with different learned weight matrices to build different keys, values, and queries, are often joined together to form multi-headed self-attention (Vaswani, Shazeer et al. 2017). The result of each head is then concatenated together before everything is passed through an MLP.

- Layer normalization (Ba, Kiros, and Hinton 2016) is then applied to the output of the MLP. Each vector may then independently be passed through another MLP with shared weights before layer normalization is applied again.

- Residual connections (He, Zhang et al. 2016a) are employed after multi-headed attention and after the final MLP.

During training, the biggest difference in the decoder is that some of the input vectors to self-attention may be masked out, which helps support parallel training in autoregressive prediction tasks. Further exposition of the details and implementation of the transformer architecture is provided in Vaswani, Shazeer et al. (2017) and in the additional reading (Section 5.6).

A key challenge of applying transformers to the image domain has to do with the size of image input (Vaswani, Shazeer et al. 2017). Let N denote the length of the input, D denote the number of dimensions for each input entry, and K denote a convolution’s (on side) kernel size.<sup>58</sup> The number of floating point operations (FLOPs) required for self-attention is on the order of $O(N^{2} D)$ , whereas the FLOPs for a convolution operation is on the order of $O(ND^{2} K^{2})$ . For instance, with an ImageNet image scaled to size $224 \times 224 \times 3$ , if each pixel is treated independently, $N = 224 \times 224 = 50176$ and $D = 3$ . Here, a convolution is significantly more efficient than self-attention. In contrast, applications like neural machine translation may only have N as the number of words in a sentence and D as the dimension for each word embedding (Mikolov, Sutskever et al. 2013), which makes self-attention much more efficient.

The Image Transformer (Parmar, Vaswani et al. 2018) was the first attempt at applying the full transformer model to the image domain, with many of the same authors that introduced the transformer. It used both an encoder and decoder to try and build an autoregressive generative model that predicts the next pixel, given a sequence of input pixels and all the previously predicted pixels. (The earlier work on non-local networks by Wang, Girshick et al. (2018) also used ideas inspired by transformers, but with a simpler attention block and a fully two-dimensional setup.) Each vector input to the transformer corresponded to a single pixel, which ultimately constrained them to generate small images $(i.e., 32 \times 32)$ , since the quadratic cost of self-attention was too expensive otherwise.

Dosovitskiy, Beyer et al. (2021) had a breakthrough that allowed transformers to process much larger images. Figure 5.57 shows the diagram of the model, named the Vision Transformer (ViT). For the task of image recognition, instead of treating each pixel as a separate input vector to the transformer, they divide an image (of size $224 \times 224)$ into 196 distinct $16 \times 16$ gridded image patches. Each patch is then flattened, and passed through a shared embedding matrix, which is equivalent to a strided $16 \times 16$ convolution, and the results are combined with a positional encoding vector and then passed to the transformer. Earlier work from Cordonnier, Loukas, and Jaggi (2019) introduced a similar patching approach, but on a smaller scale with 2 2 patches.

![Figure 5.57](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/64e6a713067029ba02bec2f60a5e1d1dcfb2134f0091826ce8f369a8d77e62e7.jpg)  
Figure 5.57 The Vision Transformer (ViT) model from (Dosovitskiy, Beyer et al. 2021) breaks an image into a 16 16 grid of patches. Each patch is then flattened, passed through a shared embedding matrix, and combined with a positional encoding vector. These inputs are then passed through a transformer encoder (right) several times before predicting an image’s class.

ViT was only able to outperform their convolutional baseline BiT (Kolesnikov, Beyer et al. 2020) when using over 100 million training images from JFT-300M (Sun, Shrivastava et al. 2017). When using ImageNet alone, or a random subset of 10 or 30 million training samples from JPT-300, the ViT model typically performed much worse than the BiT baseline. Their results suggest that in low-data domains, the inductive biases present in convolutions are typically quite useful. But, with orders of magnitude of more data, a transformer model might discover even better representations that are not representable with a CNN.

Some works have also gone into combining the inductive biases of convolutions with transformers (Srinivas, Lin et al. 2021; Wu, Xiao et al. 2021; Lu, Batra et al. 2019; Yuan, Guo et al. 2021). An influential example of such a network is DETR (Carion, Massa et al. 2020), which is applied to the task of object detection. It first processes the image with a ResNet backbone, with the output getting passed to a transformer encoder-decoder architecture. They find that the addition of a transformer improves the ability to detect large objects, which is believed to be because of its ability to reason globally about correspondences between inputted encoding vectors.

The application and usefulness of transformers in the realm of computer vision is still being widely researched. Already, however, they have achieved impressive performance on a wide range of tasks, with new papers being published rapidly.<sup>59</sup> Some more notable applications include image classification (Liu, Lin et al. 2021; Touvron, Cord et al. 2020), object detection (Dai, Cai et al. 2020; Liu, Lin et al. 2021), image pre-training (Chen, Radford et al. 2020), semantic segmentation (Zheng, Lu et al. 2020), pose recognition (Li, Wang et al. 2021), super-resolution (Zeng, Fu, and Chao 2020), colorization (Kumar, Weissenborn, and Kalchbrenner 2021), generative modeling (Jiang, Chang, and Wang 2021; Hudson and Zitnick 2021), and video classification (Arnab, Dehghani et al. 2021; Fan, Xiong et al. 2021; Li, Zhang et al. 2021). Recent works have also found success extending ViT’s patch embedding to pure MLP vision architectures (Tolstikhin, Houlsby et al. 2021; Liu, Dai et al. 2021; Touvron, Bojanowski et al. 2021). Applications to vision and language are discussed in Section 6.6.

## 5.5.4 Generative models

Throughout this chapter, I have mentioned that machine learning algorithms such as logistic regression, support vector machines, random trees, and feedforward deep neural networks are all examples of discriminative systems that never form an explicit generative model of the quantities they are trying to estimate (Bishop 2006, Section 1.5; Murphy 2012, Section 8.6). In addition to the potential benefits of generative models discussed in these two textbooks, Goodfellow (2016) and Kingma and Welling (2019) list some additional ones, such as the ability to visualize our assumptions about our unknowns, training with missing or incompletely labeled data, and the ability to generate multiple, alternative, results.

In computer graphics, which is sometimes called image synthesis (as opposed to the image understanding or image analysis we do in computer vision), the ability to easily generate realistic random images and models has long been an essential tool. Examples of such algorithms include texture synthesis and style transfer, which we study in more detail in Section 10.5, as well as fractal terrain (Fournier, Fussel, and Carpenter 1982) and tree generation (Prusinkiewicz and Lindenmayer 1996). Examples of deep neural networks being used to generate such novel images, often under user control, are shown in Figures 5.60 and 10.58. Related techniques are also used in the nascent field of neural rendering, which we discuss in Section 14.6.

How can we unlock the demonstrated power of deep neural networks to capture semantics in order to visualize sample images and generate new ones? One approach could be to use the visualization techniques introduced in Section 5.4.5. But as you can see from Figure 5.49, while such techniques can give us insights into individual units, they fail to create

fully realistic images.

Another approach might be to construct a decoder network to undo the classification performed by the original (encoder) network. This kind of “bottleneck” architecture is widely used, as shown in Figure 5.37a, to derive semantic per-pixel labels from images. Can we use a similar idea to generate realistic looking images?

## Variational autoencoders

A network that encodes an image into small compact codes and then attempts to decode it back into the same image is called an autoencoder. The compact codes are typically represented as a vector, which is often called the latent vector to emphasize that it is hidden and unknown. Autoencoders have a long history of use in neural networks, even predating today’s feedforward networks (Kingma and Welling 2019). It was once believed that this might be a good way to pre-train networks, but the more challenging proxy tasks we studied in Section 5.4.7 have proven to be more effective.

At a high level, to train an autoencoder on a dataset of images, we can use an unsupervised objective that tries to have the output image of the decoder match the training image input to the encoder. To generate a new image, we can then randomly sample a latent vector and hope that from that vector, the decoder can generate a new image that looks like it came from the distribution of training images in our dataset.

With an autoencoder, there is a deterministic, one-to-one mapping from each input to its latent vector. Hence, the number of latent vectors that are generated exactly matches the number of input data points. If the encoder’s objective is to produce a latent vector that makes it easy to decode, one possible solution would be for every latent vector to be extremely far away from every other latent vector. Here, the decoder can overfit all the latent vectors it has seen since they would all be unique with little overlap. However, as our goal is to randomly generate latent vectors that can be passed to the decoder to generate realistic images, we want the latent space to both be well explored and to encode some meaning, such as nearby vectors being semantically similar. Ghosh, Sajjadi et al. (2019) propose one potential solution, where they inject noise into the latent vector and empirically find that it works quite well.

Another extension of the autoencoder is the variational autoencoder (VAE) (Kingma and Welling 2013; Rezende, Mohamed, and Wierstra 2014; Kingma and Welling 2019). Instead of generating a single latent vector for each input, it generates the mean and covariance that define a chosen distribution of latent vectors. The distribution can then be sampled from to produce a single latent vector, which gets passed into the decoder. To avoid having the covariance matrix become the zero matrix, making the sampling process deterministic, the objective function often includes a regularization term to penalize the distribution if it is far from some chosen (e.g., Gaussian) distribution. Due to their probabilistic nature, VAEs can explore the space of possible latent vectors significantly better than autoencoders, making it harder for the decoder to overfit the training data.

![Figure 5.58](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/2d28156d0295bdfa8216715fc24b5d82ef5227e78a34aabe28c55b11a0113411.jpg)  
Figure 5.58 The VQ-VAE model. On the left, $z_{e}(x)$ represents the output of the encoder, the embedding space on top represents the codebook of K embedding vectors, and $q(z \mid x)$ represents the process of replacing each spatial (i.e., channel-wise) vector in the output of the encoder with its nearest vector in the codebook. On the right, we see how $az_{e}(x)$ vector (green) may be rounded to $e_{2},$ , and that the gradient in the encoder network (red) may push the vector away from $e_{2}$ during backpropagation. © van den Oord, Vinyals, and Kavukcuoglu (2017)

Motivated by how natural language is discrete and by how images can typically be described in language (Section 6.6), the vector quantized VAE (VQ-VAE) of van den Oord, Vinyals, and Kavukcuoglu (2017) takes the approach of modeling the latent space with categorical variables Figure 5.58 shows an outline of the VQ-VAE architecture. The encoder and decoder operate like a normal VAE, where the encoder predicts some latent representation from the input, and the decoder generates an image from the latent representation. However, in contrast to the normal VAE, the VQ-VAE replaces each spatial dimension of the predicted latent representation with its nearest vector from a discrete set of vectors (named the codebook). The discretized latent representation is then passed to the decoder. The vectors in the codebook are trained simultaneously with the VAE’s encoder and decoder. Here, the codebook vectors are optimized to move closer to the spatial vectors outputted by the encoder.

Although a VQ-VAE uses a discrete codebook of vectors, the number of possible images it can represent is still monstrously large. In some of their image experiments, they set the size of the codebook to $K = 512$ vectors and set the size of the latent variable to be $z = 32$ $\times 32 \times 1$ . Here, they can represent $512^{32 \cdot 32 \cdot 1}$ possible images.

Compared to a VAE, which typically assumes a Gaussian latent distribution, the latent distribution of a VQ-VAE is not as clearly defined, so a separate generative model is trained to sample latent variables z. The model is trained on the final latent variables outputted from the trained VQ-VAE encoder across the training data. For images, entries in z are often spatially dependent, e.g., an object may be encoded over many neighboring entries. With entries being chosen from a discrete codebook of vectors, we can use a PixelCNN (van den Oord, Kalchbrenner et al. 2016) to autoregressively sample new entries in the latent variable based on previously sampled neighboring entries. The PixelCNN can also be conditionally trained, which enables the ability to sample latent variables corresponding to a particular image class or feature.

A follow-up to the VQ-VAE model, named VQ-VAE-2 (Razavi, van den Oord, and Vinyals 2019), uses a two-level approach to decoding images, where with both a small and large latent vector, they can get much higher fidelity reconstructed and generated images. Section 6.6 discusses Dall·E (Ramesh, Pavlov et al. 2021), a model that applies VQ-VAE-2 to text-to-image generation and achieves remarkable results.

## Generative adversarial networks

Another possibility for image synthesis is to use the multi-resolution features computed by pre-trained networks to match the statistics of a given texture or style image, as described in Figure 10.57. While such networks are useful for matching the style of a given artist and the high-level content (layout) of a photograph, they are not sufficient to generate completely photorealistic images.

In order to create truly photorealistic synthetic images, we want to determine if an image is real(istic) or fake. If such a loss function existed, we could use it to train networks to generate synthetic images. But, since such a loss function is incredibly difficult to write by hand, why not train a separate neural network to play the critic role? This is the main insight behind the generative adversarial networks introduced by Goodfellow, Pouget-Abadie et al. (2014). In their system, the output of the generator network G is fed into a separate discriminator network $D,$ , whose task is to tell “fake” synthetically generated images apart from real ones, as shown in Figure 5.59a. The goal of the generator is to create images that “fool” the discriminator into accepting them as real, while the goal of the discriminator is to catch the “forger” in their act. Both networks are co-trained simultaneously, using a blend of loss functions that encourage each network to do its job. The joint loss function can be written as

$$
E_{\mathrm{GAN}}(\mathbf{w}_{G}, \mathbf{w}_{D}) = \sum_{n} \log D(\mathbf{x}_{n}) + \log \left(1 - D(G(\mathbf{z}_{n})) \right),\tag{5.79}
$$

where the $\{{\bf{x}}_{n}\}$ are the real-world training images, $\left\{{{\bf{z}}_{n}} \right\}$ are random vectors, which are passed through the generator G to produce synthetic images $ { \mathbf { x } } _ { n } ^ { \prime }$ , and the $\left\{{\bf w}_{G},{\bf w}_{D} \right\}$ are the weights (parameters) in the generator and discriminator.

![Figure 5.59](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/6c814f09c68f5a238e86d5f9a4042bfef540fbe3002797744b1af2ea1a9111c6.jpg)  
Figure 5.59 Generative adversarial network (GAN) architectures from Pan, Yu et al. (2019) © 2019 IEEE. (a) In a regular GAN, random “latent” noise vectors z are fed into a generator network G, which produces synthetic “fake” images $x^{\prime} = G(z)$ . The job of the discriminator D is to tell the fake images apart from real samples x. (b) In a conditional GAN (cGAN), the network iterates (during training) over all the classes that we wish to synthesize. The generator G gets both a class id c and a random noise vector z as input, and the discriminator D gets the class id as well and needs to determine if its input is a real member of the given class. (c) The discriminator in an InfoGAN does not have access to the class id, but must instead infer it from the samples it is given.

Instead of minimizing this loss, we adjust the weights of the generator to minimize the second term (they do not affect the first), and adjust the weights of the discriminator to maximize both terms, i.e., minimize the discriminator’s error. This process is often called a minimax game.<sup>60</sup> More details about the formulation and how to optimize it can be found in the original paper by Goodfellow, Pouget-Abadie et al. (2014), as well as deep learning textbooks (Zhang, Lipton et al. 2021, Chapter 17), lectures (Johnson 2020, Lecture 20), tutorials (Goodfellow, Isola et al. 2018), and review articles (Creswell, White et al. 2018; Pan, Yu et al. 2019).

The original paper by Goodfellow, Pouget-Abadie et al. (2014) used a small, fully connected network to demonstrate the basic idea, so it could only generate 32  32 images such as MNIST digits and low-resolution faces. The Deep Convolutional GAN (DCGAN) introduced by Radford, Metz, and Chintala (2015) uses the second half of the deconvolution network shown in Figure 5.37a to map from the random latent vectors z to arbitrary size images and can therefore generate a much wider variety of outputs, while LAPGAN uses a Laplacian pyramid of adversarial networks (Denton, Chintala et al. 2015). Blending between different latent vectors (or perturbing them in certain directions) generates in-between synthetic images.

GANs and DCGANs can be trained to generate new samples from a given class, but it is even more useful to generate samples from different classes using the same trained network. The conditional GAN (cGAN) proposed by Mirza and Osindero (2014) achieves this by feeding a class vector into both the generator, which conditions its output on this second input, as well as the discriminator, as shown in Figure 5.59b. It is also possible to make the discriminator predict classes that correlate with the class vector using an extra mutual information term, as shown in Figure 5.59c (Chen, Duan et al. 2016). This allows the resulting InfoGAN network to learn disentangled representations, such as the digit shapes and writing styles in MNIST, or pose and lighting.

While generating random images can have many useful graphics applications, such as generating textures, filling holes, and stylizing photographs, as discussed in Section 10.5, it becomes even more useful when it can be done under a person’s artistic control (Lee, Zitnick, and Cohen 2011). The iGAN interactive image editing system developed by Zhu, Krahenb¨ uhl¨ et al. (2016) does this by learning a manifold of photorealistic images using a generative adversarial network and then constraining user edits (or even sketches) to produce images that lie on this manifold.

This approach was generalized by Isola, Zhu et al. (2017) to all kinds of other image-toimage translation tasks, as shown in Figure 5.60a. In their pix2pix system, images, which can just be sketches or semantic labels, are fed into a modified U-Net, which converts them to images with different semantic meanings or styles (e.g., photographs or road maps). When the input is a semantic label map and the output is a photorealistic image, this process is often called semantic image synthesis. The translation network is trained with a conditional GAN, which takes paired images from the two domains at training time and has the discriminator decide if the synthesized (translated) image together with the input image are a real or fake pair. Referring back to Figure 5.59b, the class c is now a complete image, which is fed into both G and the discriminator D, along with its paired or synthesized output. Instead of making a decision for the whole image, the discriminator looks at overlapping patches and makes decisions on a patch-by-patch basis, which requires fewer parameters and provides more training data and more discriminative feedback. In their implementation, there is no random vector z; instead, dropout is used during both training and “test” (translation) time, which is equivalent to injecting noise at different levels in the network.

In many situations, paired images are not available, e.g., when you have collections of paintings and photographs from different locations, or pictures of animals in two different classes, as shown in Figure 5.60b. In this case, a cycle-consistent adversarial network (Cycle-GAN) can be used to require the mappings between the two domains to encourage identity, while also ensuring that generated images are perceptually similar to the training images (Zhu, Park et al. 2017). DualGAN (Yi, Zhang et al. 2017) and DiscoGAN (Kim, Cha et al. 2017) use related ideas. The BicycleGAN system of Zhu, Zhang et al. (2017) uses a similar idea of transformation cycles to encourage encoded latent vectors to correspond to different modes in the outputs for better interpretability and control.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/3f14064ef4384a493ea4fc0b31ea0da3ea7d4533a2e52d0d1d57c31915d5e826.jpg)  
(b)  
Figure 5.60 Image-to-image translation. (a) Given paired training images, the original pix2pix system learns how to turn sketches into photos, semantic maps to images, and other pixel remapping tasks (Isola, Zhu et al. 2017) © 2017 IEEE. (b) CycleGAN does not require paired training images, just collections coming from different sources, such as painting and photographs or horses and zebras (Zhu, Park et al. 2017) © 2017 IEEE.

Since the publication of the original GAN paper, the number of extensions, applications, and follow-on papers has exploded. The GAN Zoo website<sup>61</sup> lists over 500 GAN papers published between 2014 and mid-2018, at which point it stopped being updated. Large number of papers continue to appear each year in vision, machine learning, and graphics conferences.

Semantic Pyramid Generation Levels  
![Figure 5.61](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/3329e5cf6c186371e2854c227df9787ab865f48651ccb1d31409c142854acdc5.jpg)  
Figure 5.61 The Semantic Image Pyramid can be used to choose which semantic level in a deep network to modify when editing an image (Shocher, Gandelsman et al. 2020) © 2020 IEEE.

Some of the more important papers since 2017 include Wasserstein GANs (Arjovsky, Chintala, and Bottou 2017), Progressive GANs (Karras, Aila et al. 2018), UNIT (Liu, Breuel, and Kautz 2017) and MUNIT (Huang, Liu et al. 2018), spectral normalization (Miyato, Kataoka et al. 2018), SAGAN (Zhang, Goodfellow et al. 2019), BigGAN (Brock, Donahue, and Simonyan 2019), StarGAN (Choi, Choi et al. 2018) and StyleGAN (Karras, Laine, and Aila 2019) and follow-on papers (Choi, Uh et al. 2020; Karras, Laine et al. 2020; Viazovetskyi, Ivashkin, and Kashin 2020), SPADE (Park, Liu et al. 2019), GANSpace (Hark¨ onen,¨ Hertzmann et al. 2020), and VQGAN (Esser, Rombach, and Ommer 2020). You can find more detailed explanations and references to many more papers in the lectures by Johnson (2020, Lecture 20), tutorials by Goodfellow, Isola et al. (2018), and review articles by Creswell, White et al. (2018), Pan, Yu et al. (2019), and Tewari, Fried et al. (2020).

In summary, generative adversarial networks and their myriad extensions continue to be an extremely vibrant and useful research area, with applications such as image superresolution (Section 10.3), photorealistic image synthesis (Section 10.5.3), image-to-image translation, and interactive image editing. Two very recent examples of this last application are the Semantic Pyramid for Image Generation by Shocher, Gandelsman et al. (2020), in which the semantic manipulation level can be controlled (from small texture changes to higher-level layout changes), as shown in Figure 5.61, and the Swapping Autoencoder by Park, Zhu et al. (2020), where structure and texture can be independently edited.

## 5.6 Additional reading

Machine learning and deep learning are rich, broad subjects which properly deserve their own course of study to master. Fortunately, there are a large number of good textbooks and online courses available to learn this material.

My own favorite for machine learning is the book by Bishop (2006), since it provides a broad treatment with a Bayesian flavor and excellent figures, which I have re-used in this book. The books by Glassner (2018, 2021) provide an even gentler introduction to both classic machine learning and deep learning, as well as additional figures I reference in this book. Two additional widely used textbooks for machine learning are Hastie, Tibshirani, and Friedman (2009) and Murphy (2012). Deisenroth, Faisal, and Ong (2020) provide a nice compact treatment of mathematics for machine learning, including linear and matrix algebra, probability theory, model fitting, regression, PCA, and SVMs, with a more in-depth exposition than the terse summaries I provide in this book. The book on Automated Machine Learning edited by Hutter, Kotthoff, and Vanschoren (2019) surveys automated techniques for designing and optimizing machine learning algorithms.

For deep learning, Goodfellow, Bengio, and Courville (2016) were the first to provide a comprehensive treatment, but it has not recently been revised. Glassner (2018, 2021) provides a wonderful introduction to deep learning, with lots of figures and no equations. I recommend it even to experienced practitioners since it helps develop and solidify intuitions about how learning works. An up-to-date reference on deep learning is the Dive into Deep Learning online textbook by Zhang, Lipton et al. (2021), which comes with interactive Python notebooks sprinkled throughout the text, as well as an associated course (Smola and Li 2019). Some introductory courses to deep learning use Charniak (2019).

Rawat and Wang (2017) provide a nice review article on deep learning, including a history of early and later neural networks, as well in-depth discussion of many deep learning components, such as pooling, activation functions, losses, regularization, and optimization. Additional surveys related to advances in deep learning include Sze, Chen et al. (2017), Elsken, Metzen, and Hutter (2019), Gu, Wang et al. (2018), and Choudhary, Mishra et al. (2020). Sejnowski (2018) provides an in-depth history of the early days of neural networks.

The Deep Learning for Computer Vision course slides by Johnson (2020) are an outstanding reference and a great way to learn the material, both for the depth of their information and how up-to-date the presentations are kept. They are based on Stanford’s CS231n course (Li, Johnson, and Yeung 2019), which is also a great up-to-date source. Additional classes on deep learning with slides and/or video lectures include Grosse and Ba (2019), McAllester (2020), Leal-Taixe and Nießner´ (2020), Leal-Taixe and Nießner´ (2021), and Geiger (2021)

For transformers, Bloem (2019) provides a nice starting tutorial on implementing the standard transformer encoder and decoder block in PyTorch, from scratch. More comprehensive surveys of transformers applied to computer vision include Khan, Naseer et al. (2021) and Han, Wang et al. (2020). Tay, Dehghani et al. (2020) provides an overview of many attempts to reduce the quadratic cost of self-attention.Wightman (2021) makes available a fantastic collection of computer vision transformer implementations in PyTorch, with pre-trained weights and great documentation. Additional course lectures introducing transformers with videos and slides include Johnson (2020, Lecture 13), Vaswani, Huang, and Manning (2019, Lecture 14) and LeCun and Canziani (2020, Week 12).

For GANs, the new deep learning textbook by Zhang, Lipton et al. (2021, Chapter 17), lectures by Johnson (2020, Lecture 20), tutorials by Goodfellow, Isola et al. (2018), and review articles by Creswell, White et al. (2018), Pan, Yu et al. (2019), and Tewari, Fried et al. (2020) are all good sources. For a survey of the latest visual recognition techniques, the tutorials presented at ICCV (Xie, Girshick et al. 2019), CVPR (Girshick, Kirillov et al. 2020), and ECCV (Xie, Girshick et al. 2020) are excellent up-to-date sources.

## 5.7 Exercises

Ex 5.1: Backpropagation and weight updates. Implement the forward activation, backward gradient and error propagation, and weight update steps in a simple neural network. You can find examples of such code in HW3 of the 2020 UW CSE 576 class<sup>62</sup> or the Educational Framework (EDF) developed by McAllester (2020) and used in Geiger (2021).

Ex 5.2: LeNet. Download, train, and test a simple “LeNet” (LeCun, Bottou et al. 1998) convolutional neural network on the CIFAR-10 (Krizhevsky 2009) or Fashion MNIST (Xiao, Rasul, and Vollgraf 2017) datasets. You can find such code in numerous places on the web, including HW4 of the 2020 UW CSE 576 class or the PyTorch beginner tutorial on Neural Networks.<sup>63</sup>

Modify the network to remove the non-linearities. How does the performance change? Can you improve the performance of the original network by increasing the number of channels, layers, or convolution sizes? Do the training and testing accuracies move in the same or different directions as you modify your network?

Ex 5.3: Deep learning textbooks. Both the Deep Learning: From Basics to Practice book by Glassner (2018, Chapters 15, 23, and 24) and the Dive into Deep Learning book by Zhang,

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/d4631729e087c62098e7cc86e2b62e3482ce9f824e89ad7079bcbe14dec5c102.jpg)  
(a)  
(b)  
(c)  
Figure 5.62 Simple two hidden unit network with a ReLU activation function and no bias parameters for regressing the function $y = | x_{1} + 1.1x_{2} |.$ : (a) can you guess a set of weights that would fit this function?; (b) a reasonable set of starting weights; (c) a poorly scaled set of weights.

Lipton et al. (2021) contain myriad graded exercises with code samples to develop your understanding of deep neural networks. If you have the time, try to work through most of these.

Ex 5.4: Activation and weight scaling. Consider the two hidden unit network shown in Figure 5.62, which uses ReLU activation functions and has no additive bias parameters. Your task is to find a set of weights that will fit the function

$$
y = | x_{1} + 1.1x_{2} |.\tag{5.80}
$$

1. Can you guess a set of weights that will fit this function?

2. Starting with the weights shown in column b, compute the activations for the hidden and final units as well as the regression loss for the nine input values $(x_{1}, x_{2}) \in$ $\{- 1, 0, 1\} \times \{- 1, 0, 1\}$

3. Now compute the gradients of the squared loss with respect to all six weights using the backpropagation chain rule equations (5.65–5.68) and sum them up across the training samples to get a final gradient.

4. What step size should you take in the gradient direction, and what would your update squared loss become?

5. Repeat this exercise for the initial weights in column (c) of Figure 5.62.

6. Given this new set of weights, how much worse is your error decrease, and how many iterations would you expect it to take to achieve a reasonable solution?

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/fad4a4e4c19dd12a1dae861bd04efd3c4b927a0cc9e53f6657a01634f0d71111.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/afa8fda55ec593bfc7db6ff26ab529822f694c27f7e114407af88d090415ce88.jpg)  
(b)  
Figure 5.63 Function optimization: (a) the contour plot of $f(x, y) = x^{2} + 20y^{2}$ with the function being minimized at (0, 0); (b) ideal gradient descent optimization that quickly converges towards the minimum at $x = 0, y = 0$

7. Would batch normalization help in this case?

Note: the following exercises were suggested by Matt Deitke.

Ex 5.5: Function optimization. Consider the function $f(x, y) = x^{2} + 20y^{2}$ shown in Figure 5.63a. Begin by solving for the following:

1. Calculate $\nabla f,$ i.e., the gradient of $f.$

2. Evaluate the gradient at $x = - 20, y = 5$

Implement some of the common gradient descent optimizers, which should take you from the starting point $x = - 20, y = 5$ to near the minimum at $x = 0, y = 0$ . Try each of the following optimizers:

1. Standard gradient descent.

2. Gradient descent with momentum, starting with the momentum term as $\rho = 0.99$

3. Adam, starting with decay rates of $\beta_{1} = 0.9$ and $b_{2} = 0.999$

Play around with the learning rate α. For each experiment, plot how x and y change over time, as shown in Figure 5.63b.

How do the optimizers behave differently? Is there a single learning rate that makes all the optimizers converge towards x = 0, $y = 0$ in under 200 steps? Does each optimizer monotonically trend towards $x = 0, y = 0 ?$

Ex 5.6: Weight initialization. For an arbitrary neural network, is it possible to initialize the weights of a neural network such that it will never train on any non-trivial task, such as image classification or object detection? Explain why or why not.

Ex 5.7: Convolutions. Consider convolving a $256 \times 256 \times 3$ image with 64 separate convolution kernels. For kernels with heights and widths of (3 3), (5 5), (7 7), and (9 9) , answer each of the following:

1. How many parameters (i.e., weights) make up the convolution operation?

2. What is the output size after convolving the image with the kernels?

Ex 5.8: Data augmentation. The figure below shows image augmentations that translate and scale an image.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/201-400/images/13488cc7ab7c12fba6b1141580001296bb4ff9382051154c768d4f87bf29f6d1.jpg)

Let CONV denote a convolution operation, f denote an arbitrary function (such as scaling or translating an image), and IMAGE denote the input image. A function f has invariance, with respect to a convolution, when CONV(IMAGE) = CONV(f(IMAGE)), and equivariance when $\mathrm{CONV}(f(\mathrm{IMAGE})) = f(\mathrm{CONV}(\mathrm{IMAGE}))$ . Answer and explain each of the following:

1. Are convolutions translation invariant?

2. Are convolutions translation equivariant?

3. Are convolutions scale invariant?

4. Are convolutions scale equivariant?

Ex 5.9: Training vs. validation. Suppose your model is performing significantly better on the training data than it is on the validation data. What changes might be made to the loss function, training data, and network architecture to prevent such overfitting?

Ex 5.10: Cascaded convolutions. With only a single matrix multiplication, how can multiple convolutional kernel’s convolve over an entire input image? Here, let the input image be of size $256 \times 256 \times 3$ and each of the 64 kernels be of size 3 3 3.<sup>64</sup>

Ex 5.11: Pooling vs. 1 1 convolutions. Pooling layers and 1 1 convolutions are both commonly used to shrink the size of the proceeding layer. When would you use one over the other?

Ex 5.12: Inception. Why is an inception module more efficient than a residual block? What are the comparative disadvantages of using an inception module?

Ex 5.13: ResNets. Why is it easier to train a ResNet with 100 layers than a VGG network with 100 layers?

Ex 5.14: U-Nets. An alternative to the U-Net architecture is to not change the size of the height and width intermediate activations throughout the network. The final layer would then be able to output the same transformed pixel-wise representation of the input image. What is the disadvantage of this approach?

Ex 5.15: Early vs. late fusion in video processing. What are two advantages of early fusion compared to late fusion?

Ex 5.16: Video-to-video translation. Independently pass each frame in a video through a pix2pix model. For instance, if the video is of the day, then the output might be each frame at night. Stitch the output frames together to form a video. What do you notice? Does the video look plausible?

Ex 5.17: Vision Transformer. Using a Vision Transformer (ViT) model, pass several images through it and create a histogram of the activations after each layer normalization operation. Do the histograms tend to form of a normal distribution?

Ex 5.18: GAN training. In the GAN loss formulation, suppose the discriminator D is nearperfect, such that it correctly outputs near 1 for real images ${\bf x}_{n}$ and near 0 for synthetically generated images $G(\mathbf{z}_{n})$

1. For both the discriminator and the generator, compute its approximate loss with

$$
\mathcal{L}_{\mathrm{GAN}}(\mathbf{x}_{n}, \mathbf{z}_{n}) = \log D(\mathbf{x}_{n}) + \log(1 - D(G(\mathbf{z}_{n}))),\tag{5.81}
$$

where the discriminator tries to minimize ${\mathcal{L}}_{\mathrm{GAN}}$ and the generator tries to maximize ${\mathcal{L}}_{\mathrm{GAN}}$

2. How well can this discriminator be used to train the generator?

3. Can you modify the generator’s loss function, min log $\left(1 - D(G(\mathbf{z}_{n})) \right)$ , such that it is easier to train with both a great discriminator and a discriminator that is no better than random?<sup>65</sup>

Ex 5.19: Colorization. Even though large amounts of unsupervised data can be collected for image colorization, it often does not train well using a pixel-wise regression loss between an image’s predicted colors and its true colors. Why is that? Is there another loss function that may be better suited for the problem?

## Chapter 6


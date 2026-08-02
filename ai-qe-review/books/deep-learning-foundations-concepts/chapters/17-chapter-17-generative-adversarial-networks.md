---
title: "Chapter 17 \u2014 Generative Adversarial Networks"
book: "Deep Learning: Foundations and Concepts"
book_slug: deep-learning-foundations-concepts
course: deep-learning
chapter_number: 17
citekey: bishop2023deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-foundations-concepts/reading.md"
source_line_start: 13250
source_line_end: 13512
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 12
source_empty_image_alt: 12
non_semantic_image_alt: 8
caption_derived_image_alt: 4
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

# Chapter 17 — Generative Adversarial Networks

> [[../README|本书目录]] · [[16-chapter-16-continuous-latent-variables|上一章]] · [[18-chapter-18-normalizing-flows|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning: Foundations and Concepts（bishop2023deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-foundations-concepts/reading.md)，源行 13250–13512。
> - 本章保留 12 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed exercise difficulty marker (PDF p.557) × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 17.1. Adversarial Training

Consider a generative model based on a nonlinear transformation from a latent space z to a data space x. We introduce a latent distribution $p(\mathbf{z})$ , which might take the form of a simple Gaussian

$$
\begin{array}{r}{p(\mathbf{z}) = \mathcal{N}(\mathbf{z} | \mathbf{0}, \mathbf{I}),} \end{array}\tag{17.1}
$$

along with with a nonlinear transformation $\mathbf{x} = \mathbf{g}(\mathbf{z}, \mathbf{w})$ defined by a deep neural network with learnable parameters w known as the generator. Together these implicitly define a distribution over x, and our goal is to fit this distribution to a data set of training examples $\left\{\mathbf{x}_{n} \right\}$ where $n = 1, \ldots, N$ . However, we cannot determine w by optimizing the likelihood function because this cannot, in general, be evaluated in closed form. The key idea of generative adversarial networks, or GANs, (Goodfellow et al., 2014; Ruthotto and Haber, 2021) is to introduce a second discriminator network, which is trained jointly with the generator network and which provides a training signal to update the weights of the generator. This is illustrated in Figure 17.1.

The goal of the discriminator network is to distinguish between real examples from the data set and synthetic, or ‘fake’, examples produced by the generator network, and it is trained by minimizing a conventional classification error function. Conversely, the goal of the generator network is to maximize this error by synthesizing examples from the same distribution as the training set. The generator and discriminator networks are therefore working against each other, hence the term ‘adversarial’. This is an example of a zero-sum game in which any gain by one network represents a loss to the other. It allows the discriminator network to provide a training signal, which can be used to train the generator network, and this turns the unsupervised density modelling problem into a form of supervised learning.

## 17.1.1 Loss function

To make this precise, we define a binary target variable given by

$$
t = 1, \quad \mathrm{realdata},\tag{17.2}
$$

$$
t = 0,{\mathrm{synthetic ~ data.}}\tag{17.3}
$$

The discriminator network has a single output unit with a logistic-sigmoid activation function, whose output represents the probability that a data vector x is real:

$$
P(t = 1) = d(\mathbf{x}, \phi).\tag{17.4}
$$

We train the discriminator network using the standard cross-entropy error function, which takes the form

$$
E(\mathbf{w}, \phi) = - \frac{1}{N} \sum_{n = 1}^{N} \left\{t_{n} \ln d_{n} +(1 - t_{n}) \ln(1 - d_{n}) \right\}\tag{17.5}
$$

where $d_{n} = d(\mathbf{x}_{n}, \phi)$ is the output of the discriminator network for input vector $n,$ and we have normalized by the total number of data points. The training set comprises both real data examples denoted ${\bf x}_{n}$ and synthetic examples given by the output of the generator network $\mathbf{g}(\mathbf{z}_{n}, \mathbf{w})$ where $\mathbf{z}_{n}$ is a random sample from the latent space distribution $p(\mathbf{z})$ . Since $t_{n} ~ = ~ 1$ for real examples and $t_{n} ~ = ~ 0$ for synthetic examples, we can write the error function (17.5) in the form

$$
\begin{array}{l}{{\displaystyle E_{\mathrm{GAN}}(\mathbf{w}, \phi) = - \frac{1}{N_{\mathrm{real}}} \sum_{n \in \mathrm{real}} \ln d(\mathbf{x}_{n}, \phi)} \ ~} \\{{\displaystyle ~ - \frac{1}{N_{\mathrm{synth}}} \sum_{n \in \mathrm{synth}} \ln(1 - d(\mathbf{g}(\mathbf{z}_{n}, \mathbf{w}), \phi))}} \end{array}\tag{17.6}
$$

where typically the number $N_{\mathrm{real}}$ of real data points is equal to the number $N_{\mathrm{synth}}$ of synthetic data points. This combination of generator and discriminator networks can be trained end-to-end using stochastic gradient descent with gradients evaluated using backpropagation. However, the unusual aspect is the adversarial training whereby the error is minimized with respect to $\phi$ but maximized with respect to w.

This maximization can be done using standard gradient-based methods with the sign of the gradient reversed, so that the parameter updates become

$$
\Delta \phi = - \lambda \nabla_{\phi} E_{n}(\mathbf{w}, \phi)\tag{17.7}
$$

$$
\Delta \mathbf{w} = \lambda \nabla_{\mathbf{w}} E_{n}(\mathbf{w}, \phi)\tag{17.8}
$$

where $E_{n}(\mathbf{w}, \phi)$ denotes the error defined for data point n or more generally for a mini-batch of data points. Note that the two terms in (17.7) and (17.8) have different signs since the discriminator is trained to decrease the error rate whereas the generator is trained to increase it. In practice, training alternates between updating the parameters of the generative network and updating those of the discriminative network, in each case taking just one gradient descent step using a mini-batch, after which a new set of synthetic samples is generated. If the generator succeeds in finding a perfect solution, then the discriminator network will be unable to tell the difference between the real and synthetic data and hence will always produce an output of 0.5. Once the GAN is trained, the discriminator network is discarded and the generator network can be used to synthesize new examples in the data space by sampling from the latent space and propagating those samples through the trained generator network. We can show that for generative and discriminative networks having unlimited flexibility, a fully optimized GAN will have a generative distribution that matches the data distribution exactly. Some impressive examples of synthetic face images generated by a GAN are shown in Figure 1.3.

The GAN model discussed so far generates samples from the unconditional distribution $p(\mathbf{x})$ . For example, it could generate synthetic images of dogs if it is trained on dog images. We can also create conditional GANs (Mirza and Osindero, 2014), which sample from a conditional distribution $p(\mathbf{x} | \mathbf{c})$ in which the conditioning vector c might, for example, represent different species of dog. To do this, both the generator and the discriminator network take c as an additional input, and labelled examples of images, comprising pairs $\{\mathbf{x}_{n}, \mathbf{c}_{n}\}$ , are used for training. Once the GAN has been trained, images from a desired class can be generated by setting c to the corresponding class vector. Compared to training separate GANs for each class, this has the advantage that shared internal representations can be learned jointly across all classes, thereby making more efficient use of the data.

## 17.1.2 GAN training in practice

Although GANs can produce high quality results, they are not easy to train successfully due to the adversarial learning. Also, unlike standard error function minimization, there is no metric of progress because the objective can go up as well as down during training.

One challenge that can arise is called mode collapse, in which the generator network weights adapt during training such that all latent-variable samples z are mapped to a subset of possible valid outputs. In extreme cases the output can correspond to just one, or a small number, of the output values x. The discriminator then assigns the value 0.5 to these instances, and training ceases. For example, a GAN trained on handwritten digits might learn to generate only examples of the digit ‘3’, and while the discriminator is unable to distinguish these from genuine examples of the digit $\cdot_{3},$ , it fails to recognize that the generator is not generating the full range of digits.

![Figure 17.2](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/014c4d07181467688263d4c969725aae70913e494d79d7f7c64789fcce0c5095.jpg)  
Figure 17.2 Conceptual illustration of why it can be difficult to train GANs, showing a simple onedimensional data space x with the fixed, but unknown, data distribution $p_{\mathrm{Data}}(x)$ and the initial generative distribution $p_{\mathrm{G}}(x)$ . The optimal discriminator function $d(x)$ has virtually zero gradient in the vicinity of either the training or synthetic data points, making learning very slow. A smoothed version $\widetilde d(\boldsymbol{x})$ of the discriminator function can lead to faster learning.

Insight into the difficulty of training GANs can be obtained by considering Figure 17.2, which shows a simple one§-dimensional data space x with samples $\{x_{n}\}$ drawn from the fixed, but unknown, data distribution $p_{\mathrm{Data}}(x)$ . Also shown is the initial generative distribution $p_{\mathrm{G}}(x)$ together with samples drawn from this distribution. Because the data and generative distributions are so different, the optimal discriminator function $d(x)$ is easy to learn and has a very steep fall-off with virtually zero gradient in the vicinity of either the real or synthetic samples. Consider the second term in the GAN error function (17.6). Because $d(\mathbf{g}(\mathbf{z}, \mathbf{w}), \phi)$ is equal to zero across the region spanned by the generated samples, small changes in the parameters w of the generative network produce very little change in the output of the discriminator and so the gradients are small and learning proceeds slowly.

This can be addressed by using a smoothed version $\widetilde d(\boldsymbol{x})$ of the discriminator function, illustrated in Figure 17.2, thereby providing a stronger gradient to drive the training of the generator network. The least-squares GAN (Mao et al., 2016) achieves smoothing by modifying the discriminator to produce a real-valued output rather than a probability in the range (0, 1) and by replacing the cross-entropy error function with a sum-of-squares error function. Alternatively, the technique of instance noise (Sønderby et al., 2016) adds Gaussian noise to both the real data and the synthetic samples, again leading to a smoother discriminator function.

Numerous other modifications to the GAN error function and training procedure have been proposed to improve training (Mescheder, Geiger, and Nowozin, 2018). One change that is often used is to replace the generative network term in the original error function

Figure 17.3 Plots of $- \ln(d)$ and ln $(1 - d)$ showing the very different behaviour of the gradients close to $d = \dot{0}$ and $d = 1$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/4dacf97521f764ba2e7d9d3df9111b88cb5ca14aca6e1cfdd243fb3cdb0edd86.jpg)

$$
- \frac{1}{N_{\mathrm{synth}}} \sum_{n \in \mathrm{synth}} \ln(1 - d(\mathbf{g}(\mathbf{z}_{n}, \mathbf{w}), \phi))\tag{17.9}
$$

with the modified form

$$
\frac{1}{N_{\mathrm{synth}}} \sum_{n \in \mathrm{synth}} \ln d(\mathbf{g}(\mathbf{z}_{n}, \mathbf{w}), \phi).\tag{17.10}
$$

Although the first form minimizes the probability that the image is fake, the second version maximizes the probability that the image is real. The different properties of these two forms can be understood from Figure 17.3. When the generative distribution $p_{\mathrm{G}}(x)$ is very different from the true data distribution $p_{\mathrm{Data}}(x)$ , the quantity $d(\mathbf{g}(\mathbf{z}, \mathbf{w}))$ is close to zero, and hence the first form has a very small gradient, whereas the second form has a large gradient, leading to faster training.

A more direct way to ensure that the generator distribution $p_{\mathrm{G}}(x)$ moves towards the data distribution $p_{\mathrm{data}}(x)$ is to modify the error criterion to reflect how far apart the two distributions are in data space. This can be measured using the Wasserstein distance, also known as the earth mover’s distance. Imagine the distribution $p_{\mathrm{G}}(x)$ as a pile of earth that is transported in small increments to construct the distribution $p_{\mathrm{data}}(x)$ . The Wasserstein metric is the total amount of earth moved multiplied by the mean distance moved. Of the many ways of rearranging the pile of earth to build $p_{\mathrm{data}}(x)$ , the one that yields the smallest mean distance is the one used to define the metric. In practice, this cannot be implemented directly, and it is approximated by using a discriminator network that has real-valued outputs and then limiting the gradient $\nabla_{x} d({\bf x}, \phi)$ of the discriminator function with respect to x by using weight clipping, giving rise to the Wasserstein GAN (Arjovsky, Chintala, and Bottou, 2017). An improved approach is to introduce a penalty on the gradient, giving rise to the gradient penalty Wasserstein GAN (Gulrajani et al., 2017) whose error function is given by

$$
\begin{array}{l}{{\displaystyle{\cal E}_{\mathrm{WGAN - GP}}({\bf w}, \phi) = - \frac{1}{N_{\mathrm{real}}} \sum_{n \in \mathrm{real}} \left[\ln d({\bf x}_{n}, \phi) - \eta \left(\| \nabla_{{\bf x}_{n}} d({\bf x}_{n}, \phi) \|^{2} - 1 \right)^{2} \right]} \ ~} \\{{\displaystyle ~ + \frac{1}{N_{\mathrm{synth}}} \sum_{n \in \mathrm{synth}} \ln d({\bf g}({\bf z}_{n},{\bf w}, \phi))} \ ~} \end{array}\tag{1}
$$

where η controls the relative importance of the penalty term.

## 17.2. Image GANs

The basic concept of the GAN has given rise to a huge research literature, with many algorithmic developments and numerous applications. One of the most widespread and successful application areas for GANs is the generation of images. Early GAN models used fully connected networks for the generator and discriminator. However, there are many benefits to using convolutional networks, especially for images of higher resolution. The discriminator network takes an image as input and provides a scalar probability as output, so a standard convolutional network is appropriate. The generator network needs to map a lower-dimensional latent space into a high-resolution image, and so a network based on transpose convolutions is used, as illustrated in Figure 17.4.

High quality images can be obtained by progressively growing both the generator network and the discriminator network starting from a low resolution and then successively adding new layers that model increasingly fine details as training progresses (Karras et al., 2017). This speeds up the training and permits the synthesis of high-resolution images of size 1024 1024 starting from images of size 4 4. As an example of the scale and complexity of some GAN architectures, consider the GAN model for class-conditional image generation called BigGAN, whose architecture is shown in Figure 17.5.

## 17.2.1 CycleGAN

As an example of the broad variety of GANs we consider an architecture called a CycleGAN (Zhu et al., 2017). This also illustrates how techniques in deep learning can be adapted to solve different kinds of problems beyond traditional tasks such as

![Figure 17.4](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/48b4b6b5c6e22753f14257787dc99d3c27715ef312e8f586a53b5d6bddf36b0c.jpg)  
Figure 17.4 Example architecture of a deep convolutional GAN showing the use of transpose convolutions to expand the dimensionality in successive blocks of the network.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/2dc5f5470100a5b0c08b7ca9ecaa35b1ff48311dd1d97cb11afcd4ef86548c13.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/8a0b59660d7d90fd68749d07af555a7dc1a45e95efd0ba18cb28a28685a506e9.jpg)  
(b)  
Figure 17.5 (a) Architecture of the generative network in the BigGAN model, which has over 70 million parameters. (b) Details of each of the residual blocks in the generative network. The discriminative network, which has 88 million parameters, has a somewhat analogous structure except that it uses average pooling layers to reduce the dimensionality, instead of using up-sampling to increase the dimensionality. [Based on Brock, Donahue, and Simonyan (2018).]

classification and density estimation. Consider the problem of turning a photograph into a Monet painting of the same scene, or vice versa. In Figure 17.6 we show examples of image pairs from a trained CycleGAN that has learned to perform such an image-to-image translation.

The aim is to learn two bijective (one-to-one) mappings, one that goes from the domain X of photographs to the domain $Y$ of Monet paintings and one in the reverse direction. To achieve this, CycleGAN makes use of two conditional generators, g<sub>X</sub> and $\mathbf{g}_{Y}$ , and two discriminators, $d_{X}$ and $d_{Y}$ . The generator $\mathbf{g}_{X}(\mathbf{y}, \mathbf{w}_{X})$ takes as input a sample painting $\mathbf y \in Y$ and generates a corresponding synthetic photograph, whereas the discriminator $d_{X}(\mathbf{x}, \phi_{X})$ distinguishes between synthetic and real photographs. Similarly, the generator $\mathbf{g}_{Y}(\mathbf{x}, \mathbf{w}_{Y})$ takes a photograph $\mathbf{x} \in X$ as input and generates a synthetic painting $\mathbf{y},$ and the discriminator $d_{Y}(\mathbf{y}, \phi_{Y})$ distinguishes between synthetic paintings and real ones. The discriminator $d_{X}$ is therefore trained on a combination of synthetic photographs generated by $\mathbf{g}_{X}$ and real photographs, whereas $d_{Y}$ is trained on a combination of synthetic paintings generated by $\mathbf{g}_{Y}$ and

Figure 17.6 Examples of image translation using a CycleGAN showing the synthesis of a photographic-style image from a Monet painting (top row) and the synthesis of an image in the style of a Monet painting from a photograph (bottom row). [From Zhu et al. (2017) with permission.]  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/b41888c3a3b8f8f8f2a544f6ff56d6e2c0d5eced6c98f5100b93b43266a63819.jpg)

Monet → photograph  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/1315f8f2065d6a85ec37d685d2f35e3ff11ba59dd16fefb4c5a2561d03c5c5d9.jpg)  
photograph → Monet

real paintings.

If we train this architecture using the standard GAN loss function, it would learn to generate realistic synthetic Monet paintings and realistic synthetic photographs, but there would be nothing to force a generated painting to look anything like the corresponding photograph, or vice versa. We therefore introduce an additional term in the loss function called the cycle consistency error, containing two terms, whose construction is illustrated in Figure 17.7.

The goal is to ensure that when a photograph is translated into a painting and then back into a photograph it should be close to the original photograph, thereby ensuring that the generated painting retains sufficient information about the photograph to allow the photograph to be reconstructed. Similarly, when a painting is translated into a photograph and then back into a painting it should be close to the original painting. Applying this to all the photographs and paintings in the training set then gives a cycle consistency error of the form

Figure 17.7 Diagram showing how the cycle consistency error is calculated for an example photograph ${\bf x}_{n}$ . The photograph is first mapped into the painting domain using the generator g<sub>Y</sub> , and the resulting vector is then mapped back into the photograph domain using the generator $\mathbf{g}_{X}$ . The discrepancy between the resulting photograph and the original ${\bf x}_{n}$ defines a contribution to the cycle consistency error. An analogous process is used to calculate the contribution to the cycle consistency error from a painting ${\bf y}_{n}$ by mapping it to a photograph using g<sub>X</sub> and then back to a painting using g<sub>Y</sub> .  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/0f1cdd2a92827678bc8b3a86a5b908af486aa3990447bb81f9babc55f1659489.jpg)

![Figure 17.8](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/f94c1cfd5eb66ed84bd3ec5168b170f40e8089d12e7bf70b33fca20a2b0c63b8.jpg)  
Figure 17.8 Flow of information through a CycleGAN. The total error for the data points ${\bf x}_{n}$ and ${\bf y}_{n}$ is the sum of the four component errors.

$$
\begin{array}{r}{E_{\mathrm{cyc}}(\mathbf{w}_{X}, \mathbf{w}_{Y}) = \displaystyle \frac{1}{N_{X}} \sum_{n \in X} \| \mathbf{g}_{X}(\mathbf{g}_{Y}(\mathbf{x}_{n})) - \mathbf{x}_{n} \|_{1}} \\{+ \displaystyle \frac{1}{N_{Y}} \sum_{n \in Y} \| \mathbf{g}_{Y}(\mathbf{g}_{X}(\mathbf{y}_{n})) - \mathbf{y}_{n} \|_{1}} \end{array}\tag{17.12}
$$

where $\Vert \cdot \Vert_{1}$ denotes the L1 norm. The cycle consistency error is added to the usual GAN loss functions defined by (17.6) to give a total error function:

$$
E_{\mathrm{GAN}}(\mathbf{w}_{X}, \phi_{X}) + E_{\mathrm{GAN}}(\mathbf{w}_{Y}, \phi_{Y}) + \eta E_{\mathrm{cyc}}(\mathbf{w}_{X}, \mathbf{w}_{Y})\tag{17.13}
$$

where the coefficient η determines the relative importance of the GAN errors and the cycle consistency error. Information flow through the CycleGAN when calculating the error function for one image and one painting is shown in Figure 17.8.

We have seen that GANs can perform well as generative models, but they can also be used for representation learning in which rich statistical structure in a data set is revealed through unsupervised learning. When the deep convolutional GAN shown in Figure 17.4 is trained on a data set of bedroom images (Radford, Metz, and Chintala, 2015) and random samples from the latent space are propagated through the trained network, the generated images also look like bedrooms, as expected. In addition, however, the latent space has become organized in ways that are semantically meaningful. For example, if we follow a smooth trajectory through the latent space and generate the corresponding series of images, we obtain smooth transitions from one image to the next, as seen in Figure 17.9.

Moreover, it is possible to identify directions in latent space that correspond to semantically meaningful transformations. For example, for faces, one direction might correspond to changes in the orientation of the face, whereas other directions might correspond to changes in lighting or the degree to which the face is smiling or not. These are called disentangled representations and allow new images to be synthesized having specified properties. Figure 17.10 is an example from a GAN trained on face images, showing that semantic attributes such as gender or the presence of glasses correspond to particular directions in latent space.

![Figure 17.9](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/d636f63be557185393654b32d2eb3b9be9e9585f82c04c7a39a3ad2ab9d8eb20.jpg)  
Figure 17.9 Samples generated by a deep convolutional GAN trained on images of bedrooms. Each row is generated by taking a smooth walk through latent space between randomly generated locations. We see smooth transitions, with each image plausibly looking like a bedroom. In the bottom row, for example, we see a TV on the wall gradually morph into a window. [From Radford, Metz, and Chintala (2015) with permission.]

Figure 17.10 An example of vector arithmetic in the latent space of a trained GAN. In each of the three columns, the latent space vectors that generated these images are averaged and then vector arithmetic is applied to the resulting mean vectors to create a new vector corresponding to the central image in the 3 × 3 array on the right. Adding noise to this vector generates another eight sample images. The four images on the bottom row show that the same arithmetic applied directly in data space simply results in a blurred image due to misalignment. [From Radford, Metz, and Chintala (2015) with permission.]

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/b071014fc35f1d79d57e119ac35e4287badd5086d26f3afd8b231e6ef4ec401f.jpg)

(★★★) We would like the GAN error function (17.6) to have the property that, given sufficiently flexible neural networks, the stationary point is obtained when the generator distribution matches the true data distribution. In this exercise we prove this result for network models with infinite flexibility by optimizing over the full space of probability distributions $p_{\mathrm{G}}(\mathbf{x})$ and over the full space of functions $d(\mathbf{x})$ corresponding to the generative and discriminative networks, respectively. Specifically, we assume that the discriminative model is optimized in an inner loop, giving rise to an effective outer loop error function for the generative model. First, show that, in the limit of an infinite number of data samples, the GAN error function (17.6) can be rewritten in the form

$$
E(p_{\mathrm{G}}, d) = - \int p_{\mathrm{data}}(\mathbf{x}) \ln d(\mathbf{x}) d \mathbf{x} - \int p_{\mathrm{G}}(\mathbf{x}) \ln(1 - d(\mathbf{x})) d \mathbf{x}\tag{17.14}
$$

where $p_{\mathrm{data}}(\mathbf{x})$ is the fixed distribution of real data points. Now consider a variational optimization over all functions $d(\mathbf{x})$ . Show that, for a fixed generative network, the solution for the discriminator $d(\mathbf{x})$ that minimizes $E$ is given by

$$
d^{\star}(\mathbf{x}) = \frac{p_{\mathrm{data}}(\mathbf{x})}{p_{\mathrm{data}}(\mathbf{x}) + p_{\mathrm{G}}(\mathbf{x})}.\tag{17.15}
$$

Hence, show that the error function $E$ can be written as a function of the generator network $p_{\mathrm{G}}(\mathbf{x})$ in the form

$$
\begin{array}{r}{C(p_{\mathrm{G}}) = - \int p_{\mathrm{data}}(\mathbf{x}) \ln \left\{\frac{p_{\mathrm{data}}(\mathbf{x})}{p_{\mathrm{data}}(\mathbf{x}) + p_{\mathrm{G}}(\mathbf{x})} \right\} d \mathbf{x}} \\{- \int p_{\mathrm{G}}(\mathbf{x}) \ln \left\{\frac{p_{\mathrm{G}}(\mathbf{x})}{p_{\mathrm{data}}(\mathbf{x}) + p_{\mathrm{G}}(\mathbf{x})} \right\} d \mathbf{x}.} \end{array}\tag{17.16}
$$

Now show that this can be rewritten in the form

$$
C(p_{\mathrm{G}}) = - \ln(4) + \mathrm{KL} \left(p_{\mathrm{data}} \left\| \frac{p_{\mathrm{data}} + p_{\mathrm{G}}}{2} \right.\right) + \mathrm{KL} \left(p_{\mathrm{G}} \left\| \frac{p_{\mathrm{data}} + p_{\mathrm{G}}}{2} \right) \right.\tag{17.17}
$$

where the Kullback–Leibler divergence $\mathrm{KL}(p | | q)$ is defined by (2.100). Finally, using the property that KL $(p \| q) \geqslant 0$ with equality if, and only if, $p(\mathbf{x}) = q(\mathbf{x})$ for all x, show that the minimum of $C(p_{\mathrm{G}})$ occurs when $p_{\mathrm{G}}(\mathbf{x}) \ = \p_{\mathrm{data}}(\mathbf{x})$ . Note that the sum of the two Kullback–Leibler divergence terms in $(17.17)$ is known as the Jensen–Shannon divergence between $p_{\mathrm{data}}$ and $p_{\mathrm{G}}$ . Like the Kullback–Leibler divergence, this is a non-negative quantity that vanishes if, and only if, the two distributions are equal, but unlike the KL divergence, it is symmetric with respect to the two distributions.

17.2 (★★★) In this exercise we explore the problems that can arise from the adversarial nature of GAN training. Consider a cost function $E(a, b) = ab$ defined over two parameters a and b, analogous to the parameters of a generative and discriminative network, respectively. Show that the point $a = 0, b = 0$ is a stationary point of the cost function. By considering the second derivatives along the lines $b = a$ and $b = - a$ show that the point $a = 0, b = 0$ is a saddle point. Now suppose that we optimize this error function by taking infinitesimal steps, so that the variables become functions of continuous time $a(t), b(t)$ defined by a continuous-time gradient descent, in which the parameter $a(t)$ of the generative network is updated so as to increase $E(a, b)$ , whereas the parameter $b(t)$ is updated so as to decrease $E(a, b)$ Show that the evolution of the parameters is governed by the equations

$$
{\frac{d a}{d t}} = \eta{\frac{\partial E}{\partial a}}, \quad \quad{\frac{d b}{d t}} = - \eta{\frac{\partial E}{\partial b}}.\tag{17.18}
$$

Hence, show that $a(t)$ satisfies the second-order differential equation

$$
{\frac{d^{2} a}{d t^{2}}} = - \eta^{2} a(t).\tag{17.19}
$$

Verify that the following expression is a solution of (17.19):

$$
a(t) = C \cos(\eta t) + D \sin(\eta t)\tag{17.20}
$$

where $C$ and D are arbitrary constants. If the system is initialized at $t = 0$ with the values $a = 1, b = 0$ , find the values of C and D and hence show that the resulting values of $a(t)$ and $b(t)$ trace out a circle of unit radius in $a, b$ space centred on the origin, and that they therefore never converge to the saddle point.

17.3 (?) Consider a GAN in which the training set consists of equal numbers of cat and dog images and in which the generator network has learned to produce high quality images of dogs. Show that, when presented with a dog image, the optimal output for the discriminator network (trained to generate the probability that the image is real) is $1 / 3$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/cc654b23903843319bf06af01085ad193edfef330afb059b9483cb155eafc231.jpg)

We have seen how generative adversarial networks (GANs) extend the framework of linear latent-variable models by using deep neural networks to represent highly flexible and learnable nonlinear transformations from the latent space to the data space. However, the likelihood function is generally either intractable, because the network function cannot be inverted, or may not even be defined if the latent space has a lower dimensionality than the data space. In GANs, a second, discriminative network was therefore introduced to facilitate adversarial training.

Here we discuss the second of our four approaches to training nonlinear latent variable models that involves restricting the form of the neural network model such that the likelihood function can be evaluated without approximation while still ensuring that sampling from the trained model is straightforward. Suppose we define a distribution $p_{\mathbf{z}}(\mathbf{z})$ , sometimes also called a base distribution, over a latent variable z along with a nonlinear function $\mathbf{x} = \mathbf{f}(\mathbf{z}, \mathbf{w})$ , given by a deep neural network, that transforms the latent space into the data space. Assuming $p_{\mathbf{z}}(\mathbf{z})$ is a simple distribution such as a Gaussian, sampling from such a model is easy as each latent sample $\mathbf{z}^{\star} \sim p_{\mathbf{z}}(\mathbf{z})$ is simply passed through the neural network to generate a corresponding data sample $\mathbf{x}^{\star} = \mathbf{f}(\mathbf{z}^{\star}, \mathbf{w})$

To calculate the likelihood function for this model, we need the data-space distribution, which depends on the inverse of the neural network function. We write this as $\mathbf{z} = \mathbf{g}(\mathbf{x}, \mathbf{w})$ , and it satisfies $\mathbf{z} = \mathbf{g}(\mathbf{f}(\mathbf{z}, \mathbf{w}), \mathbf{w})$ . This requires that, for every value of w, the functions $\mathbf{f} \left(\mathbf{z}, \mathbf{w} \right)$ and $\mathbf{g}(\mathbf{x}, \mathbf{w})$ are invertible, also called bijective, so that each value of x corresponds to a unique value of z and vice versa. We can then use the change of variables formula to calculate the data density:

$$
p_{\mathbf{x}}(\mathbf{x} | \mathbf{w}) = p_{\mathbf{z}}(\mathbf{g}(\mathbf{x}, \mathbf{w})) \left| \operatorname{det} \mathbf{J}(\mathbf{x}) \right|\tag{18.1}
$$

where $\mathbf{J}(\mathbf{x})$ is the Jacobian matrix of partial derivatives whose elements are given by

$$
J_{ij}(\mathbf{x}) = \frac{\partial g_{i}(\mathbf{x}, \mathbf{w})}{\partial x_{j}}\tag{18.2}
$$

and $| \cdot |$ denotes the modulus or absolute value. We will continue to refer to z as a ‘latent’ variable even though the deterministic mapping means that any given data value x corresponds to a unique value of z whose value is therefore no longer uncertain.

The mapping function $\mathbf{f} \left(\mathbf{z}, \mathbf{w} \right)$ will be defined in terms of a special form of neural network, whose structure we will discuss shortly. One consequence of requiring an invertible mapping is that the dimensionality of the latent space must be the same as that of the data space, which can lead to large models for high-dimensional data such as images. Also, in general, the cost of evaluating the determinant of a $D \times D$ matrix is $\mathcal{O}(D^{3})$ , so we will seek to impose some further restrictions on the model in order that evaluation of the Jacobian matrix determinant is more efficient.

If we consider a training set $\mathcal{D} = \{\mathbf{x}_{1}, \dotsc, \mathbf{x}_{N}\}$ of independent data points, the log likelihood function is given from (18.1) by

$$
\begin{array}{l}{\displaystyle \ln p \big(\mathcal{D} |{\bf w} \big) = \sum_{n = 1}^{N} \ln p_{\bf x} \big({\bf x}_{n} |{\bf w} \big)} \\{\displaystyle = \sum_{n = 1}^{N} \Big \{\ln p_{\bf z} \big({\bf g}({\bf x}_{n},{\bf w}) \big) + \ln \big | \operatorname{det} \mathbf{J} \big({\bf x}_{n} \big) \big | \Big\}} \end{array}\tag{18.3}
$$

(18.4)

and our goal is to use the likelihood function to train the neural network. To be able to model a wide range of distributions, we want the transformation function $\bf{x} =$ $\mathbf{f} \left(\mathbf{z}, \mathbf{w} \right)$ to be highly flexible, and so we use a deep neural network architecture. We can ensure that the overall function is invertible if we make each layer of the network invertible. To see this, consider three successive transformations, each corresponding to one layer, of the form:

$$
\mathbf{x} = \mathbf{f}^{A}(\mathbf{f}^{B}(\mathbf{f}^{C}(\mathbf{z}))).\tag{18.5}
$$

Then the inverse function is given by

$$
\mathbf{z} = \mathbf{g}^{C}(\mathbf{g}^{B}(\mathbf{g}^{A}(\mathbf{x})))\tag{18.6}
$$

where $\mathbf{g}^{A}, \mathbf{g}^{B}$ , and $\mathbf{g}^{C}$ are the inverse functions of $\mathbf{f}^{A}, \mathbf{f}^{B}$ , and $\mathbf{f}^{C}$ , respectively. Moreover, the determinant of the Jacobian for such a layered structure is also easy to evaluate in terms of the Jacobian determinants for each of the individual layers by making use of the chain rule of calculus:

$$
J_{ij} = \frac{\partial z_{i}}{\partial x_{j}} = \sum_{k} \sum_{l} \frac{\partial g_{i}^{C}}{\partial g_{k}^{B}} \frac{\partial g_{k}^{B}}{\partial g_{l}^{A}} \frac{\partial g_{l}^{A}}{\partial x_{j}}.\tag{18.7}
$$

We recognize the right-hand side as the product of three matrices, and the determinant of a product is the product of the determinants. Therefore, the log determinant of the overall Jacobian will be the sum of the log determinants corresponding to each layer.

This approach to modelling a flexible distribution is called a normalizing flow because the transformation of a probability distribution through a sequence of mappings is somewhat analogous to the flow of a fluid. Also, the effect of the inverse mapping is to transform the complex data distribution into a normalized form, typically a Gaussian or normal distribution. Normalizing flows have been reviewed by Kobyzev, Prince, and Brubaker (2019) and Papamakarios et al. (2019). Here we discuss the core concepts from the two main classes of normalizing flows used in practice: coupling flows and autoregressive flows. We also look at the use of neural differential equations to define invertible mappings, leading to continuous flows.


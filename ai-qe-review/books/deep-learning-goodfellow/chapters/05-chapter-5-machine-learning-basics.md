---
title: "Chapter 5 \u2014 Machine Learning Basics"
book: "Deep Learning"
book_slug: deep-learning-goodfellow
course: deep-learning
chapter_number: 5
citekey: goodfellow2016deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-goodfellow/reading.md"
source_line_start: 2271
source_line_end: 3471
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 20
source_empty_image_alt: 20
non_semantic_image_alt: 7
caption_derived_image_alt: 13
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

# Chapter 5 — Machine Learning Basics

> [[../README|本书目录]] · [[04-chapter-4-numerical-computation|上一章]] · [[06-chapter-6-deep-feedforward-networks|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning（goodfellow2016deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-goodfellow/reading.md)，源行 2271–3471。
> - 本章保留 20 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Machine Learning Basics

Deep learning is a specific kind of machine learning. To understand deep learning well, one must have a solid understanding of the basic principles of machine learning. This chapter provides a brief course in the most important general principles that are applied throughout the rest of the book. Novice readers or those who want a wider perspective are encouraged to consider machine learning textbooks with a more comprehensive coverage of the fundamentals, such as Murphy (2012) or Bishop (2006). If you are already familiar with machine learning basics, feel free to skip ahead to section 5.11. That section covers some perspectives on traditional machine learning techniques that have strongly influenced the development of deep learning algorithms.

We begin with a definition of what a learning algorithm is and present an example: the linear regression algorithm. We then proceed to describe how the challenge of fitting the training data differs from the challenge of finding patterns that generalize to new data. Most machine learning algorithms have settings called hyperparameters, which must be determined outside the learning algorithm itself; we discuss how to set these using additional data. Machine learning is essentially a form of applied statistics with increased emphasis on the use of computers to statistically estimate complicated functions and a decreased emphasis on proving confidence intervals around these functions; we therefore present the two central approaches to statistics: frequentist estimators and Bayesian inference. Most machine learning algorithms can be divided into the categories of supervised learning and unsupervised learning; we describe these categories and give some examples of simple learning algorithms from each category. Most deep learning algorithms are based on an optimization algorithm called stochastic gradient descent. We describe how to combine various algorithm components, such as an optimization algorithm, a cost function, a model, and a dataset, to build a machine learning algorithm. Finally, in section 5.11, we describe some of the factors that have limited the ability of traditional machine learning to generalize. These challenges have motivated the development of deep learning algorithms that overcome these obstacles.

## 5.1 Learning Algorithms

A machine learning algorithm is an algorithm that is able to learn from data. But what do we mean by learning? Mitchell (1997) provides a succinct definition: "A computer program is said to learn from experience $E$ with respect to some class of tasks $T$ and performance measure $P$ , if its performance at tasks in $T$ , as measured by $P$ , improves with experience $E$ ." One can imagine a wide variety of experiences $E$ , tasks $T$ , and performance measures $P$ , and we do not attempt in this book to formally define what may be used for each of these entities. Instead, in the following sections, we provide intuitive descriptions and examples of the different kinds of tasks, performance measures, and experiences that can be used to construct machine learning algorithms.

## 5.1.1 The Task, T

Machine learning enables us to tackle tasks that are too difficult to solve with fixed programs written and designed by human beings. From a scientific and philosophical point of view, machine learning is interesting because developing our understanding of it entails developing our understanding of the principles that underlie intelligence.

In this relatively formal definition of the word “task,” the process of learning itself is not the task. Learning is our means of attaining the ability to perform the task. For example, if we want a robot to be able to walk, then walking is the task. We could program the robot to learn to walk, or we could attempt to directly write a program that specifies how to walk manually.

Machine learning tasks are usually described in terms of how the machine learning system should process an example. An example is a collection of features that have been quantitatively measured from some object or event that we want the machine learning system to process. We typically represent an example as a vector $x \in \mathbb{R}^{n}$ where each entry $x_{i}$ of the vector is another feature. For example, the features of an image are usually the values of the pixels in the image.

Many kinds of tasks can be solved with machine learning. Some of the most common machine learning tasks include the following:

\- Classification: In this type of task, the computer program is asked to specify which of $k$ categories some input belongs to. To solve this task, the learning algorithm is usually asked to produce a function $f: \mathbb{R}^n \to \{1, \dots, k\}$ . When $y = f(x)$ , the model assigns an input described by vector $x$ to a category identified by numeric code $y$ . There are other variants of the classification task, for example, where $f$ outputs a probability distribution over classes. An example of a classification task is object recognition, where the input is an image (usually described as a set of pixel brightness values), and the output is a numeric code identifying the object in the image. For example, the Willow Garage PR2 robot is able to act as a waiter that can recognize different kinds of drinks and deliver them to people on command (Goodfellow et al., 2010). Modern object recognition is best accomplished with deep learning (Krizhevsky et al., 2012; Ioffe and Szegedy, 2015). Object recognition is the same basic technology that enables computers to recognize faces (Taigman et al., 2014), which can be used to automatically tag people in photo collections and for computers to interact more naturally with their users.

\- Classification with missing inputs: Classification becomes more challenging if the computer program is not guaranteed that every measurement in its input vector will always be provided. To solve the classification task, the learning algorithm only has to define a single function mapping from a vector input to a categorical output. When some of the inputs may be missing, rather than providing a single classification function, the learning algorithm must learn a set of functions. Each function corresponds to classifying $\mathbf{x}$ with a different subset of its inputs missing. This kind of situation arises frequently in medical diagnosis, because many kinds of medical tests are expensive or invasive. One way to efficiently define such a large set of functions is to learn a probability distribution over all the relevant variables, then solve the classification task by marginalizing out the missing variables. With $n$ input variables, we can now obtain all $2^{n}$ different classification functions needed for each possible set of missing inputs, but the computer program needs to learn only a single function describing the joint probability distribution. See Goodfellow et al. (2013b) for an example of a deep probabilistic model applied to such a task in this way. Many of the other tasks described in this section can also be generalized to work with missing inputs; classification with missing inputs is just one example of what machine learning can do.

\- Regression: In this type of task, the computer program is asked to predict a numerical value given some input. To solve this task, the learning algorithm is asked to output a function $f: \mathbb{R}^n \to \mathbb{R}$ . This type of task is similar to classification, except that the format of output is different. An example of a regression task is the prediction of the expected claim amount that an insured person will make (used to set insurance premiums), or the prediction of future prices of securities. These kinds of predictions are also used for algorithmic trading.

\- Transcription: In this type of task, the machine learning system is asked to observe a relatively unstructured representation of some kind of data and transcribe the information into discrete textual form. For example, in optical character recognition, the computer program is shown a photograph containing an image of text and is asked to return this text in the form of a sequence of characters (e.g., in ASCII or Unicode format). Google Street View uses deep learning to process address numbers in this way (Goodfellow et al., 2014d). Another example is speech recognition, where the computer program is provided an audio waveform and emits a sequence of characters or word ID codes describing the words that were spoken in the audio recording. Deep learning is a crucial component of modern speech recognition systems used at major companies, including Microsoft, IBM and Google (Hinton et al., 2012b).

\- Machine translation: In a machine translation task, the input already consists of a sequence of symbols in some language, and the computer program must convert this into a sequence of symbols in another language. This is commonly applied to natural languages, such as translating from English to French. Deep learning has recently begun to have an important impact on this kind of task (Sutskever et al., 2014; Bahdanau et al., 2015).

\- Structured output: Structured output tasks involve any task where the output is a vector (or other data structure containing multiple values) with important relationships between the different elements. This is a broad category and subsumes the transcription and translation tasks described above, as well as many other tasks. One example is parsing mapping a natural language sentence into a tree that describes its grammatical structure by tagging nodes of the trees as being verbs, nouns, adverbs, and so on. See Collobert (2011) for an example of deep learning applied to a parsing task. Another example is pixel-wise segmentation of images, where the computer program assigns every pixel in an image to a specific category.

For example, deep learning can be used to annotate the locations of roads in aerial photographs (Mnih and Hinton, 2010). The output form need not mirror the structure of the input as closely as in these annotation-style tasks. For example, in image captioning, the computer program observes an image and outputs a natural language sentence describing the image (Kiros et al., 2014a,b; Mao et al., 2015; Vinyals et al., 2015b; Donahue et al., 2014; Karpathy and Li, 2015; Fang et al., 2015; Xu et al., 2015). These tasks are called structured output tasks because the program must output several values that are all tightly interrelated. For example, the words produced by an image captioning program must form a valid sentence.

\- Anomaly detection: In this type of task, the computer program sifts through a set of events or objects and flags some of them as being unusual or atypical. An example of an anomaly detection task is credit card fraud detection. By modeling your purchasing habits, a credit card company can detect misuse of your cards. If a thief steals your credit card or credit card information, the thief's purchases will often come from a different probability distribution over purchase types than your own. The credit card company can prevent fraud by placing a hold on an account as soon as that card has been used for an uncharacteristic purchase. See Chandola et al. (2009) for a survey of anomaly detection methods.

\- Synthesis and sampling: In this type of task, the machine learning algorithm is asked to generate new examples that are similar to those in the training data. Synthesis and sampling via machine learning can be useful for media applications when generating large volumes of content by hand would be expensive, boring, or require too much time. For example, video games can automatically generate textures for large objects or landscapes, rather than requiring an artist to manually label each pixel (Luo et al., 2013). In some cases, we want the sampling or synthesis procedure to generate a specific kind of output given the input. For example, in a speech synthesis task, we provide a written sentence and ask the program to emit an audio waveform containing a spoken version of that sentence. This is a kind of structured output task, but with the added qualification that there is no single correct output for each input, and we explicitly desire a large amount of variation in the output, in order for the output to seem more natural and realistic.

\- Imputation of missing values: In this type of task, the machine learning algorithm is given a new example $\boldsymbol{x} \in \mathbb{R}^n$ , but with some entries $x_i$ of $\boldsymbol{x}$ missing. The algorithm must provide a prediction of the values of the missing entries.

\- Denoising: In this type of task, the machine learning algorithm is given in input a corrupted example $\tilde{\boldsymbol{x}} \in \mathbb{R}^n$ obtained by an unknown corruption process from a clean example $\boldsymbol{x} \in \mathbb{R}^n$ . The learner must predict the clean example $\boldsymbol{x}$ from its corrupted version $\tilde{\boldsymbol{x}}$ , or more generally predict the conditional probability distribution $p(\boldsymbol{x} \mid \tilde{\boldsymbol{x}})$ .

\- Density estimation or probability mass function estimation: In the density estimation problem, the machine learning algorithm is asked to learn a function $p_{\text{model}} : \mathbb{R}^n \to \mathbb{R}$ , where $p_{\text{model}}(\boldsymbol{x})$ can be interpreted as a probability density function (if $\boldsymbol{x}$ is continuous) or a probability mass function (if $\boldsymbol{x}$ is discrete) on the space that the examples were drawn from. To do such a task well (we will specify exactly what that means when we discuss performance measures $P$ ), the algorithm needs to learn the structure of the data it has seen. It must know where examples cluster tightly and where they are unlikely to occur. Most of the tasks described above require the learning algorithm to at least implicitly capture the structure of the probability distribution. Density estimation enables us to explicitly capture that distribution. In principle, we can then perform computations on that distribution to solve the other tasks as well. For example, if we have performed density estimation to obtain a probability distribution $p(\boldsymbol{x})$ , we can use that distribution to solve the missing value imputation task. If a value $x_i$ is missing, and all the other values, denoted $\boldsymbol{x}_{-i}$ , are given, then we know the distribution over it is given by $p(x_i | \boldsymbol{x}_{-i})$ . In practice, density estimation does not always enable us to solve all these related tasks. because in many cases the required operations on $p(\boldsymbol{x})$ are computationally intractable.

Of course, many other tasks and types of tasks are possible. The types of tasks we list here are intended only to provide examples of what machine learning can do, not to define a rigid taxonomy of tasks.

## 5.1.2 The Performance Measure, $P$

To evaluate the abilities of a machine learning algorithm, we must design a quantitative measure of its performance. Usually this performance measure P is specific to the task T being carried out by the system.

For tasks such as classification, classification with missing inputs, and transcription, we often measure the accuracy of the model. Accuracy is just the proportion of examples for which the model produces the correct output. We can also obtain equivalent information by measuring the error rate, the proportion of examples for which the model produces an incorrect output. We often refer to the error rate as the expected 0-1 loss. The 0-1 loss on a particular example is 0 if it is correctly classified and 1 if it is not. For tasks such as density estimation, it does not make sense to measure accuracy, error rate, or any other kind of 0-1 loss. Instead, we must use a different performance metric that gives the model a continuous-valued score for each example. The most common approach is to report the average log-probability the model assigns to some examples.

Usually we are interested in how well the machine learning algorithm performs on data that it has not seen before, since this determines how well it will work when deployed in the real world. We therefore evaluate these performance measures using a test set of data that is separate from the data used for training the machine learning system.

The choice of performance measure may seem straightforward and objective, but it is often difficult to choose a performance measure that corresponds well to the desired behavior of the system.

In some cases, this is because it is difficult to decide what should be measured. For example, when performing a transcription task, should we measure the accuracy of the system at transcribing entire sequences, or should we use a more fine-grained performance measure that gives partial credit for getting some elements of the sequence correct? When performing a regression task, should we penalize the system more if it frequently makes medium-sized mistakes or if it rarely makes very large mistakes? These kinds of design choices depend on the application.

In other cases, we know what quantity we would ideally like to measure, but measuring it is impractical. For example, this arises frequently in the context of density estimation. Many of the best probabilistic models represent probability distributions only implicitly. Computing the actual probability value assigned to a specific point in space in many such models is intractable. In these cases, one must design an alternative criterion that still corresponds to the design objectives, or design a good approximation to the desired criterion.

## 5.1.3 The Experience, E

Machine learning algorithms can be broadly categorized as unsupervised or supervised by what kind of experience they are allowed to have during the learning process.

Most of the learning algorithms in this book can be understood as being allowed to experience an entire dataset. A dataset is a collection of many examples, as defined in section 5.1.1. Sometimes we call examples data points.

One of the oldest datasets studied by statisticians and machine learning researchers is the Iris dataset (Fisher, 1936). It is a collection of measurements of different parts of 150 iris plants. Each individual plant corresponds to one example. The features within each example are the measurements of each part of the plant: the sepal length, sepal width, petal length and petal width. The dataset also records which species each plant belonged to. Three different species are represented in the dataset.

Unsupervised learning algorithms experience a dataset containing many features, then learn useful properties of the structure of this dataset. In the context of deep learning, we usually want to learn the entire probability distribution that generated a dataset, whether explicitly, as in density estimation, or implicitly, for tasks like synthesis or denoising. Some other unsupervised learning algorithms perform other roles, like clustering, which consists of dividing the dataset into clusters of similar examples.

Supervised learning algorithms experience a dataset containing features, but each example is also associated with a label or target. For example, the Iris dataset is annotated with the species of each iris plant. A supervised learning algorithm can study the Iris dataset and learn to classify iris plants into three different species based on their measurements.

Roughly speaking, unsupervised learning involves observing several examples of a random vector x and attempting to implicitly or explicitly learn the probability distribution $p(\mathbf{x})$ , or some interesting properties of that distribution; while supervised learning involves observing several examples of a random vector x and an associated value or vector y, then learning to predict y from x, usually by estimating $p(\mathbf{y} \mid \mathbf{x})$ . The term supervised learning originates from the view of the target y being provided by an instructor or teacher who shows the machine learning system what to do. In unsupervised learning, there is no instructor or teacher, and the algorithm must learn to make sense of the data without this guide.

Unsupervised learning and supervised learning are not formally defined terms. The lines between them are often blurred. Many machine learning technologies can be used to perform both tasks. For example, the chain rule of probability states that for a vector $x \in \mathbb{R}^{n}$ , the joint distribution can be decomposed as

$$
p(\mathbf{x}) = \prod_{i = 1}^{n} p \left(x_{i} \mid x_{1}, \dots, x_{i - 1}\right).\tag{5.1}
$$

This decomposition means that we can solve the ostensibly unsupervised problem of modeling $p(\mathbf{x})$ by splitting it into n supervised learning problems. Alternatively, we can solve the supervised learning problem of learning $p(y \mid \mathbf{x})$ by using traditional unsupervised learning technologies to learn the joint distribution $p(\mathbf{x}, y)$ , then inferring

$$
p(y \mid \mathbf{x}) = \frac{p(\mathbf{x}, y)}{\sum_{y^{\prime}} p(\mathbf{x}, y^{\prime})}.\tag{5.2}
$$

Though unsupervised learning and supervised learning are not completely formal or distinct concepts, they do help roughly categorize some of the things we do with machine learning algorithms. Traditionally, people refer to regression, classification and structured output problems as supervised learning. Density estimation in support of other tasks is usually considered unsupervised learning.

Other variants of the learning paradigm are possible. For example, in semi-supervised learning, some examples include a supervision target but others do not. In multi-instance learning, an entire collection of examples is labeled as containing or not containing an example of a class, but the individual members of the collection are not labeled. For a recent example of multi-instance learning with deep models, see Kotzias et al. (2015).

Some machine learning algorithms do not just experience a fixed dataset. For example, reinforcement learning algorithms interact with an environment, so there is a feedback loop between the learning system and its experiences. Such algorithms are beyond the scope of this book. Please see Sutton and Barto (1998) or Bertsekas and Tsitsiklis (1996) for information about reinforcement learning, and Mnih et al. (2013) for the deep learning approach to reinforcement learning.

Most machine learning algorithms simply experience a dataset. A dataset can be described in many ways. In all cases, a dataset is a collection of examples, which are in turn collections of features.

One common way of describing a dataset is with a design matrix. A design matrix is a matrix containing a different example in each row. Each column of the matrix corresponds to a different feature. For instance, the Iris dataset contains 150 examples with four features for each example. This means we can represent the dataset with a design matrix $X \in R^{150 \times 4}$ , where $X_{i,1}$ is the sepal length of plant i, $X_{i,2}$ is the sepal width of plant i, etc. We describe most of the learning algorithms in this book in terms of how they operate on design matrix datasets.

Of course, to describe a dataset as a design matrix, it must be possible to describe each example as a vector, and each of these vectors must be the same size. This is not always possible. For example, if you have a collection of photographs with different widths and heights, then different photographs will contain different numbers of pixels, so not all the photographs may be described with the same length of vector. In Section 9.7 and chapter 10, we describe how to handle different types of such heterogeneous data. In cases like these, rather than describing the dataset as a matrix with m rows, we describe it as a set containing m elements: $\{\boldsymbol{x}^{(1)},\boldsymbol{x}^{(2)},\ldots,\boldsymbol{x}^{(m)}\}$ . This notation does not imply that any two example vectors $\boldsymbol{x}^{(i)}$ and $\boldsymbol{x}^{(j)}$ have the same size.

In the case of supervised learning, the example contains a label or target as well as a collection of features. For example, if we want to use a learning algorithm to perform object recognition from photographs, we need to specify which object appears in each of the photos. We might do this with a numeric code, with 0 signifying a person, 1 signifying a car, 2 signifying a cat, and so forth. Often when working with a dataset containing a design matrix of feature observations X, we also provide a vector of labels y, with $y_{i}$ providing the label for example i.

Of course, sometimes the label may be more than just a single number. For example, if we want to train a speech recognition system to transcribe entire sentences, then the label for each example sentence is a sequence of words.

Just as there is no formal definition of supervised and unsupervised learning, there is no rigid taxonomy of datasets or experiences. The structures described here cover most cases, but it is always possible to design new ones for new applications.

## 5.1.4 Example: Linear Regression

Our definition of a machine learning algorithm as an algorithm that is capable of improving a computer program's performance at some task via experience is somewhat abstract. To make this more concrete, we present an example of a simple machine learning algorithm: linear regression. We will return to this example repeatedly as we introduce more machine learning concepts that help to understand the algorithm's behavior.

As the name implies, linear regression solves a regression problem. In other words, the goal is to build a system that can take a vector $x \in \mathbb{R}^{n}$ as input and predict the value of a scalar $y \in R$ as its output. The output of linear regression is a linear function of the input. Let $\hat{y}$ be the value that our model predicts y should take on. We define the output to be

$$
\hat{y} = \boldsymbol{w}^{\top} \boldsymbol{x},\tag{5.3}
$$

where $w \in \mathbb{R}^{n}$ is a vector of parameters.

Parameters are values that control the behavior of the system. In this case, $w_{i}$ is the coefficient that we multiply by feature $x_{i}$ before summing up the contributions from all the features. We can think of w as a set of weights that determine how each feature affects the prediction. If a feature $x_{i}$ receives a positive weight $w_{i}$ , then increasing the value of that feature increases the value of our prediction $\hat{y}$ .

If a feature receives a negative weight, then increasing the value of that feature decreases the value of our prediction. If a feature's weight is large in magnitude, then it has a large effect on the prediction. If a feature's weight is zero, it has no effect on the prediction.

We thus have a definition of our task T: to predict y from x by outputting $\hat{y} = w^{\top}x$ . Next we need a definition of our performance measure, P.

Suppose that we have a design matrix of m example inputs that we will not use for training, only for evaluating how well the model performs. We also have a vector of regression targets providing the correct value of y for each of these examples. Because this dataset will only be used for evaluation, we call it the test set. We refer to the design matrix of inputs as $X^{(test)}$ and the vector of regression targets as $y^{(test)}$ .

One way of measuring the performance of the model is to compute the mean squared error of the model on the test set. If $\hat{y}^{(test)}$ gives the predictions of the model on the test set, then the mean squared error is given by

$$
\mathrm{MSE}_{\text{test}} = \frac{1}{m} \sum_{i}(\hat{\boldsymbol{y}}^{(\text{test})} - \boldsymbol{y}^{(\text{test})})_{i}^{2}.\tag{5.4}
$$

Intuitively, one can see that this error measure decreases to 0 when $\hat{\pmb{y}}^{(\mathrm{test})} = \pmb{y}^{(\mathrm{test})}$ . We can also see that

$$
\mathrm{MSE}_{\mathrm{test}} = \frac{1}{m} | | \hat{\pmb{y}}^{(\mathrm{test})} - \pmb{y}^{(\mathrm{test})} | |_{2}^{2},\tag{5.5}
$$

so the error increases whenever the Euclidean distance between the predictions and the targets increases.

To make a machine learning algorithm, we need to design an algorithm that will improve the weights w in a way that reduces $MSE_{test}$ when the algorithm is allowed to gain experience by observing a training set $(X^{(train)}, y^{(train)})$ . One intuitive way of doing this (which we justify later, in section 5.5.1) is just to minimize the mean squared error on the training set, $MSE_{train}$ .

To minimize $MSE_{train}$ , we can simply solve for where its gradient is 0:

$$
\nabla_{\pmb{w}} \mathrm{MSE}_{\mathrm{train}} = 0\tag{5.6}
$$

$$
\Rightarrow \nabla_{\boldsymbol{w}} \frac{1}{m} | | \hat{\boldsymbol{y}}^{(\mathrm{train})} - \boldsymbol{y}^{(\mathrm{train})} | |_{2}^{2} = 0\tag{5.7}
$$

$$
\Rightarrow \frac{1}{m} \nabla_{\boldsymbol{w}} | | \boldsymbol{X}^{(\mathrm{train})} \boldsymbol{w} - \boldsymbol{y}^{(\mathrm{train})} | |_{2}^{2} = 0\tag{5.8}
$$

$$
\Rightarrow \nabla_{\boldsymbol{w}} \left(\boldsymbol{X}^{(\text{train})} \boldsymbol{w} - \boldsymbol{y}^{(\text{train})}\right)^{\top} \left(\boldsymbol{X}^{(\text{train})} \boldsymbol{w} - \boldsymbol{y}^{(\text{train})}\right) = 0\tag{5.9}
$$

$$
\Rightarrow \nabla_{\boldsymbol{w}} \left(\boldsymbol{w}^{\top} \boldsymbol{X}^{(\text{train}) \top} \boldsymbol{X}^{(\text{train})} \boldsymbol{w} - 2 \boldsymbol{w}^{\top} \boldsymbol{X}^{(\text{train}) \top} \boldsymbol{y}^{(\text{train})} + \boldsymbol{y}^{(\text{train}) \top} \boldsymbol{y}^{(\text{train})}\right) = 0\tag{5.10}
$$

$$
\Rightarrow 2 \boldsymbol{X}^{(\mathrm{train}) \top} \boldsymbol{X}^{(\mathrm{train})} \boldsymbol{w} - 2 \boldsymbol{X}^{(\mathrm{train}) \top} \boldsymbol{y}^{(\mathrm{train})} = 0\tag{5.11}
$$

$$
\Rightarrow \boldsymbol{w} = \left(\boldsymbol{X}^{\text{(train)} \top} \boldsymbol{X}^{\text{(train)}}\right)^{- 1} \boldsymbol{X}^{\text{(train)} \top} \boldsymbol{y}^{\text{(train)}}\tag{5.12}
$$

The system of equations whose solution is given by equation 5.12 is known as the normal equations. Evaluating equation 5.12 constitutes a simple learning algorithm. For an example of the linear regression learning algorithm in action, see figure 5.1.

It is worth noting that the term linear regression is often used to refer to a slightly more sophisticated model with one additional parameter an intercept term b. In this model

$$
\hat{y} = \boldsymbol{w}^{\top} \boldsymbol{x} + b,\tag{5.13}
$$

so the mapping from parameters to predictions is still a linear function but the mapping from features to predictions is now an affine function. This extension to affine functions means that the plot of the model's predictions still looks like a line, but it need not pass through the origin. Instead of adding the bias parameter b, one can continue to use the model with only weights but augment x with an extra entry that is always set to 1. The weight corresponding to the extra 1 entry plays the role of the bias parameter. We frequently use the term “linear” when referring to affine functions throughout this book.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/ae1ef64c09fa0ed0310c23ac240918bb344198b5f37bee9d9b4dd06b31c82612.jpg)

![Figure 5.1](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/8f4fa85cec36ddcb20fe7546d881dce99448f42ad68dd946246846d530c55631.jpg)  
Figure 5.1: A linear regression problem, with a training set consisting of ten data points, each containing one feature. Because there is only one feature, the weight vector w contains only a single parameter to learn, $w_{1}$ . (Left)Observe that linear regression learns to set $w_{1}$ such that the line $y = w_{1}x$ comes as close as possible to passing through all the training points. (Right)The plotted point indicates the value of $w_{1}$ found by the normal equations, which we can see minimizes the mean squared error on the training set.

The intercept term $b$ is often called the bias parameter of the affine transformation. This terminology derives from the point of view that the output of the transformation is biased toward being $b$ in the absence of any input. This term is different from the idea of a statistical bias, in which a statistical estimation algorithm's expected estimate of a quantity is not equal to the true quantity.

Linear regression is of course an extremely simple and limited learning algorithm, but it provides an example of how a learning algorithm can work. In subsequent sections we describe some of the basic principles underlying learning algorithm design and demonstrate how these principles can be used to build more complicated learning algorithms.

## 5.2 Capacity, Overfitting and Underfitting

The central challenge in machine learning is that our algorithm must perform well on new, previously unseen inputs not just those on which our model was trained. The ability to perform well on previously unobserved inputs is called generalization.

Typically, when training a machine learning model, we have access to a training set; we can compute some error measure on the training set, called the training error; and we reduce this training error. So far, what we have described is simply an optimization problem. What separates machine learning from optimization is that we want the generalization error, also called the test error, to be low as well. The generalization error is defined as the expected value of the error on a new input. Here the expectation is taken across different possible inputs, drawn from the distribution of inputs we expect the system to encounter in practice.

We typically estimate the generalization error of a machine learning model by measuring its performance on a test set of examples that were collected separately from the training set.

In our linear regression example, we trained the model by minimizing the training error,

$$
\frac{1}{m^{\mathrm{(train)}}} | | \pmb{X}^{\mathrm{(train)}} \pmb{w} - \pmb{y}^{\mathrm{(train)}} | |_{2}^{2},\tag{5.14}
$$

but we actually care about the test error, $\frac{1}{m^{(\mathrm{test})}} ||\boldsymbol{X}^{(\mathrm{test})}\boldsymbol{w} - \boldsymbol{y}^{(\mathrm{test})}||_2^2$ .

How can we affect performance on the test set when we can observe only the training set? The field of statistical learning theory provides some answers. If the training and the test set are collected arbitrarily, there is indeed little we can do. If we are allowed to make some assumptions about how the training and test set are collected, then we can make some progress.

The training and test data are generated by a probability distribution over datasets called the data-generating process. We typically make a set of assumptions known collectively as the i.i.d. assumptions. These assumptions are that the examples in each dataset are independent from each other, and that the training set and test set are identically distributed, drawn from the same probability distribution as each other. This assumption enables us to describe the data-generating process with a probability distribution over a single example. The same distribution is then used to generate every train example and every test example. We call that shared underlying distribution the data-generating distribution, denoted $p_{data}$ . This probabilistic framework and the i.i.d. assumptions enables us to mathematically study the relationship between training error and test error.

One immediate connection we can observe between training error and test error is that the expected training error of a randomly selected model is equal to the expected test error of that model. Suppose we have a probability distribution $p(\boldsymbol{x}, y)$ and we sample from it repeatedly to generate the training set and the test set. For some fixed value w, the expected training set error is exactly the same as the expected test set error, because both expectations are formed using the same dataset sampling process. The only difference between the two conditions is the name we assign to the dataset we sample.

Of course, when we use a machine learning algorithm, we do not fix the parameters ahead of time, then sample both datasets. We sample the training set, then use it to choose the parameters to reduce training set error, then sample the test set. Under this process, the expected test error is greater than or equal to the expected value of training error. The factors determining how well a machine learning algorithm will perform are its ability to

1. Make the training error small.

2. Make the gap between training and test error small.

These two factors correspond to the two central challenges in machine learning: underfitting and overfitting. Underfitting occurs when the model is not able to obtain a sufficiently low error value on the training set. Overfitting occurs when the gap between the training error and test error is too large.

We can control whether a model is more likely to overfit or underfit by altering its capacity. Informally, a model's capacity is its ability to fit a wide variety of functions. Models with low capacity may struggle to fit the training set. Models with high capacity can overfit by memorizing properties of the training set that do not serve them well on the test set.

One way to control the capacity of a learning algorithm is by choosing its hypothesis space, the set of functions that the learning algorithm is allowed to select as being the solution. For example, the linear regression algorithm has the set of all linear functions of its input as its hypothesis space. We can generalize linear regression to include polynomials, rather than just linear functions, in its hypothesis space. Doing so increases the model's capacity.

A polynomial of degree 1 gives us the linear regression model with which we are already familiar, with the prediction

$$
\hat{y} = b + wx.\tag{5.15}
$$

By introducing $x^{2}$ as another feature provided to the linear regression model, we can learn a model that is quadratic as a function of x:

$$
\hat{y} = b + w_{1} x + w_{2} x^{2}.\tag{5.16}
$$

Though this model implements a quadratic function of its input, the output is still a linear function of the parameters, so we can still use the normal equations to train the model in closed form. We can continue to add more powers of x as additional features, for example, to obtain a polynomial of degree 9:

$$
\hat{y} = b + \sum_{i = 1}^{9} w_{i} x^{i}.\tag{5.17}
$$

Machine learning algorithms will generally perform best when their capacity is appropriate for the true complexity of the task they need to perform and the amount of training data they are provided with. Models with insufficient capacity are unable to solve complex tasks. Models with high capacity can solve complex tasks, but when their capacity is higher than needed to solve the present task, they may overfit.

Figure 5.2 shows this principle in action. We compare a linear, quadratic and degree-9 predictor attempting to fit a problem where the true underlying function is quadratic. The linear function is unable to capture the curvature in the true underlying problem, so it underfits. The degree-9 predictor is capable of representing the correct function, but it is also capable of representing infinitely many other functions that pass exactly through the training points, because we have more parameters than training examples. We have little chance of choosing a solution that generalizes well when so many wildly different solutions exist. In this example, the quadratic model is perfectly matched to the true structure of the task, so it generalizes well to new data.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/4884a0711d325a2c6e06f218ace5af364d1bcef463ab5f755b9c7b312ce84fd0.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/7bfc2319f4ecf46cd8a368dc7e8866ccb7de683801aac0551eb13f57892fb72a.jpg)

![Figure 5.2](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/b8f70614fe9e3decb53b81053aa682fdf11745e777444bf5dab0962cc0af1b7b.jpg)  
Figure 5.2: We fit three models to this example training set. The training data was generated synthetically, by randomly sampling x values and choosing y deterministically by evaluating a quadratic function. (Left)A linear function fit to the data suffers from underfitting it cannot capture the curvature that is present in the data. (Center)A quadratic function fit to the data generalizes well to unseen points. It does not suffer from a significant amount of overfitting or underfitting. (Right)A polynomial of degree 9 fit to the data suffers from overfitting. Here we used the Moore-Penrose pseudoinverse to solve the underdetermined normal equations. The solution passes through all the training points exactly, but we have not been lucky enough for it to extract the correct structure. It now has a deep valley between two training points that does not appear in the true underlying function. It also increases sharply on the left side of the data, while the true function decreases in this area.

So far we have described only one way of changing a model's capacity: by changing the number of input features it has, and simultaneously adding new parameters associated with those features. There are in fact many ways to change a model's capacity. Capacity is not determined only by the choice of model. The model specifies which family of functions the learning algorithm can choose from when varying the parameters in order to reduce a training objective. This is called the representational capacity of the model. In many cases, finding the best function within this family is a difficult optimization problem. In practice, the learning algorithm does not actually find the best function, but merely one that significantly reduces the training error. These additional limitations, such as the imperfection of the optimization algorithm, mean that the learning algorithm's effective capacity may be less than the representational capacity of the model family.

Our modern ideas about improving the generalization of machine learning models are refinements of thought dating back to philosophers at least as early as Ptolemy. Many early scholars invoke a principle of parsimony that is now most widely known as Occam's razor (c. 1287–1347). This principle states that among competing hypotheses that explain known observations equally well, we should choose the “simplest” one. This idea was formalized and made more precise in the twentieth century by the founders of statistical learning theory (Vapnik and Chervonenkis, 1971; Vapnik, 1982; Blumer et al., 1989; Vapnik, 1995).

Statistical learning theory provides various means of quantifying model capacity. Among these, the most well known is the Vapnik-Chervonenkis dimension, or VC dimension. The VC dimension measures the capacity of a binary classifier. The VC dimension is defined as being the largest possible value of m for which there exists a training set of m different x points that the classifier can label arbitrarily.

Quantifying the capacity of the model enables statistical learning theory to make quantitative predictions. The most important results in statistical learning theory show that the discrepancy between training error and generalization error is bounded from above by a quantity that grows as the model capacity grows but shrinks as the number of training examples increases (Vapnik and Chervonenkis, 1971; Vapnik, 1982; Blumer et al., 1989; Vapnik, 1995). These bounds provide intellectual justification that machine learning algorithms can work, but they are rarely used in practice when working with deep learning algorithms. This is in part because the bounds are often quite loose and in part because it can be quite difficult to determine the capacity of deep learning algorithms. The problem of determining the capacity of a deep learning model is especially difficult because the effective capacity is limited by the capabilities of the optimization algorithm, and we have little theoretical understanding of the general nonconvex optimization problems involved in deep learning.

We must remember that while simpler functions are more likely to generalize (to have a small gap between training and test error), we must still choose a sufficiently complex hypothesis to achieve low training error. Typically, training error decreases until it asymptotes to the minimum possible error value as model capacity increases (assuming the error measure has a minimum value). Typically, generalization error has a U-shaped curve as a function of model capacity. This is illustrated in figure 5.3.

To reach the most extreme case of arbitrarily high capacity, we introduce the concept of nonparametric models. So far, we have seen only parametric models, such as linear regression. Parametric models learn a function described by a parameter vector whose size is finite and fixed before any data is observed. Nonparametric models have no such limitation.

![Figure 5.3](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/69815ae727177fac06054973363a09204f8cf922d08a0c766776511bfffefd76.jpg)  
Figure 5.3: Typical relationship between capacity and error. Training and test error behave differently. At the left end of the graph, training error and generalization error are both high. This is the underfitting regime. As we increase capacity, training error decreases, but the gap between training and generalization error increases. Eventually, the size of this gap outweighs the decrease in training error, and we enter the overfitting regime, where capacity is too large, above the optimal capacity.

Sometimes, nonparametric models are just theoretical abstractions (such as an algorithm that searches over all possible probability distributions) that cannot be implemented in practice. However, we can also design practical nonparametric models by making their complexity a function of the training set size. One example of such an algorithm is nearest neighbor regression. Unlike linear regression, which has a fixed-length vector of weights, the nearest neighbor regression model simply stores the X and y from the training set. When asked to classify a test point x, the model looks up the nearest entry in the training set and returns the associated regression target. In other words, $\hat{y} = y_{i}$ where $i = \arg\min ||X_{i,:} - x||_{2}^{2}$ . The algorithm can also be generalized to distance metrics other than the $L^{2}$ norm, such as learned distance metrics (Goldberger et al., 2005). If the algorithm is allowed to break ties by averaging the $y_{i}$ values for all $X_{i,:}$ that are tied for nearest, then this algorithm is able to achieve the minimum possible training error (which might be greater than zero, if two identical inputs are associated with different outputs) on any regression dataset.

Finally, we can also create a nonparametric learning algorithm by wrapping a parametric learning algorithm inside another algorithm that increases the number of parameters as needed. For example, we could imagine an outer loop of learning that changes the degree of the polynomial learned by linear regression on top of a polynomial expansion of the input.

The ideal model is an oracle that simply knows the true probability distribution that generates the data. Even such a model will still incur some error on many problems, because there may still be some noise in the distribution. In the case of supervised learning, the mapping from x to y may be inherently stochastic, or y may be a deterministic function that involves other variables besides those included in x. The error incurred by an oracle making predictions from the true distribution $p(\boldsymbol{x}, y)$ is called the Bayes error.

Training and generalization error vary as the size of the training set varies. Expected generalization error can never increase as the number of training examples increases. For nonparametric models, more data yield better generalization until the best possible error is achieved. Any fixed parametric model with less than optimal capacity will asymptote to an error value that exceeds the Bayes error. See figure 5.4 for an illustration. Note that it is possible for the model to have optimal capacity and yet still have a large gap between training and generalization errors. In this situation, we may be able to reduce this gap by gathering more training examples.

## 5.2.1 The No Free Lunch Theorem

Learning theory claims that a machine learning algorithm can generalize well from a finite training set of examples. This seems to contradict some basic principles of logic. Inductive reasoning, or inferring general rules from a limited set of examples, is not logically valid. To logically infer a rule describing every member of a set, one must have information about every member of that set.

In part, machine learning avoids this problem by offering only probabilistic rules, rather than the entirely certain rules used in purely logical reasoning. Machine learning promises to find rules that are probably correct about most members of the set they concern.

Unfortunately, even this does not resolve the entire problem. The no free lunch theorem for machine learning (Wolpert, 1996) states that, averaged over all possible data-generating distributions, every classification algorithm has the same error rate when classifying previously unobserved points. In other words, in some sense, no machine learning algorithm is universally any better than any other. The most sophisticated algorithm we can conceive of has the same average performance (over all possible tasks) as merely predicting that every point belongs to the same class.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/f6166b446a542e93e049f0a4f28cf7702cc30231b8d1521a41c974a4d68f4b3c.jpg)

![Figure 5.4](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/cab261af71f3be33bc922a267d6fb861f4200403835e88fb4bee5813f689ab9c.jpg)  
Figure 5.4: The effect of the training dataset size on the train and test error, as well as on the optimal model capacity. We constructed a synthetic regression problem based on adding a moderate amount of noise to a degree-5 polynomial, generated a single test set, and then generated several different sizes of training set. For each size, we generated 40 different training sets in order to plot error bars showing 95 percent confidence intervals. (Top)The MSE on the training and test set for two different models: a quadratic model, and a model with degree chosen to minimize the test error. Both are fit in closed form. For the quadratic model, the training error increases as the size of the training set increases. This is because larger datasets are harder to fit. Simultaneously, the test error decreases, because fewer incorrect hypotheses are consistent with the training data. The quadratic model does not have enough capacity to solve the task, so its test error asymptotes to a high value. The test error at optimal capacity asymptotes to the Bayes error. The training error can fall below the Bayes error, due to the ability of the training algorithm to memorize specific instances of the training set. As the training size increases to infinity, the training error of any fixed-capacity model (here, the quadratic model) must rise to at least the Bayes error. (Bottom)As the training set size increases, the optimal capacity (shown here as the degree of the optimal polynomial regressor) increases. The optimal capacity plateaus after reaching sufficient complexity to solve the task.

Fortunately, these results hold only when we average over all possible data-generating distributions. If we make assumptions about the kinds of probability distributions we encounter in real-world applications, then we can design learning algorithms that perform well on these distributions.

This means that the goal of machine learning research is not to seek a universal learning algorithm or the absolute best learning algorithm. Instead, our goal is to understand what kinds of distributions are relevant to the “real world” that an AI agent experiences, and what kinds of machine learning algorithms perform well on data drawn from the kinds of data-generating distributions we care about.

## 5.2.2 Regularization

The no free lunch theorem implies that we must design our machine learning algorithms to perform well on a specific task. We do so by building a set of preferences into the learning algorithm. When these preferences are aligned with the learning problems that we ask the algorithm to solve, it performs better.

So far, the only method of modifying a learning algorithm that we have discussed concretely is to increase or decrease the model's representational capacity by adding or removing functions from the hypothesis space of solutions the learning algorithm is able to choose from. We gave the specific example of increasing or decreasing the degree of a polynomial for a regression problem. The view we have described so far is oversimplified.

The behavior of our algorithm is strongly affected not just by how large we make the set of functions allowed in its hypothesis space, but by the specific identity of those functions. The learning algorithm we have studied so far, linear regression, has a hypothesis space consisting of the set of linear functions of its input. These linear functions can be useful for problems where the relationship between inputs and outputs truly is close to linear. They are less useful for problems that behave in a very nonlinear fashion. For example, linear regression would not perform well if we tried to use it to predict $\sin(x)$ from x. We can thus control the performance of our algorithms by choosing what kind of functions we allow them to draw solutions from, as well as by controlling the amount of these functions.

We can also give a learning algorithm a preference for one solution over another in its hypothesis space. This means that both functions are eligible, but one is preferred. The unpreferred solution will be chosen only if it fits the training data significantly better than the preferred solution.

For example, we can modify the training criterion for linear regression to include weight decay. To perform linear regression with weight decay, we minimize a sum comprising both the mean squared error on the training and a criterion $J(\boldsymbol{w})$ that expresses a preference for the weights to have smaller squared $L^{2}$ norm. Specifically,

$$
J(\pmb{w}) = \mathrm{MSE}_{\mathrm{train}} + \lambda \pmb{w}^{\top} \pmb{w},\tag{5.18}
$$

where $\lambda$ is a value chosen ahead of time that controls the strength of our preference for smaller weights. When $\lambda = 0$ , we impose no preference, and larger $\lambda$ forces the weights to become smaller. Minimizing $J(\boldsymbol{w})$ results in a choice of weights that make a tradeoff between fitting the training data and being small. This gives us solutions that have a smaller slope, or that put weight on fewer of the features. As an example of how we can control a model's tendency to overfit or underfit via weight decay, we can train a high-degree polynomial regression model with different values of $\lambda$ . See figure 5.5 for the results.

More generally, we can regularize a model that learns a function $f(\boldsymbol{x};\boldsymbol{\theta})$ by adding a penalty called a regularizer to the cost function. In the case of weight decay, the regularizer is $\Omega(\boldsymbol{w})=\boldsymbol{w}^{\top}\boldsymbol{w}$ . In chapter 7, we will see that many other regularizers are possible.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/4302b2b9ac6ef55d09d746f5159f3562062c9b184f63875a63394f8a76a525dd.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/99296a4da48ec27c96a77c2849bed3a78b05d4a6c77279bbc306cadbd1ab1ca1.jpg)

![Figure 5.5](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/1c787969155aa3e45057705cc08d089ffd24211575295e9a89935e382b405960.jpg)  
Figure 5.5: We fit a high-degree polynomial regression model to our example training set from figure 5.2. The true function is quadratic, but here we use only models with degree 9. We vary the amount of weight decay to prevent these high-degree models from overfitting. (Left)With very large $\lambda$ , we can force the model to learn a function with no slope at all. This underfits because it can only represent a constant function. (Center)With a medium value of $\lambda$ , the learning algorithm recovers a curve with the right general shape. Even though the model is capable of representing functions with much more complicated shapes, weight decay has encouraged it to use a simpler function described by smaller coefficients. (Right)With weight decay approaching zero (i.e., using the Moore-Penrose pseudoinverse to solve the underdetermined problem with minimal regularization), the degree-9 polynomial overfits significantly, as we saw in figure 5.2.

Expressing preferences for one function over another is a more general way of controlling a model's capacity than including or excluding members from the hypothesis space. We can think of excluding a function from a hypothesis space as expressing an infinitely strong preference against that function.

In our weight decay example, we expressed our preference for linear functions defined with smaller weights explicitly, via an extra term in the criterion we minimize. There are many other ways of expressing preferences for different solutions, both implicitly and explicitly. Together, these different approaches are known as regularization. Regularization is any modification we make to a learning algorithm that is intended to reduce its generalization error but not its training error. Regularization is one of the central concerns of the field of machine learning, rivaled in its importance only by optimization.

The no free lunch theorem has made it clear that there is no best machine learning algorithm, and, in particular, no best form of regularization. Instead we must choose a form of regularization that is well suited to the particular task we want to solve. The philosophy of deep learning in general and this book in particular is that a wide range of tasks (such as all the intellectual tasks that people can do) may all be solved effectively using very general-purpose forms of regularization.

## 5.3 Hyperparameters and Validation Sets

Most machine learning algorithms have hyperparameters, settings that we can use to control the algorithm's behavior. The values of hyperparameters are not adapted by the learning algorithm itself (though we can design a nested learning procedure in which one learning algorithm learns the best hyperparameters for another learning algorithm).

The polynomial regression example in figure 5.2 has a single hyperparameter: the degree of the polynomial, which acts as a capacity hyperparameter. The $\lambda$ value used to control the strength of weight decay is another example of a hyperparameter.

Sometimes a setting is chosen to be a hyperparameter that the learning algorithm does not learn because the setting is difficult to optimize. More frequently, the setting must be a hyperparameter because it is not appropriate to learn that hyperparameter on the training set. This applies to all hyperparameters that control model capacity. If learned on the training set, such hyperparameters would always choose the maximum possible model capacity, resulting in overfitting (refer to figure 5.3). For example, we can always fit the training set better with a higher-degree polynomial and a weight decay setting of $\lambda = 0$ than we could with a lower-degree polynomial and a positive weight decay setting.

To solve this problem, we need a validation set of examples that the training algorithm does not observe.

Earlier we discussed how a held-out test set, composed of examples coming from the same distribution as the training set, can be used to estimate the generalization error of a learner, after the learning process has completed. It is important that the test examples are not used in any way to make choices about the model, including its hyperparameters. For this reason, no example from the test set can be used in the validation set. Therefore, we always construct the validation set from the training data. Specifically, we split the training data into two disjoint subsets. One of these subsets is used to learn the parameters. The other subset is our validation set, used to estimate the generalization error during or after training, allowing for the hyperparameters to be updated accordingly. The subset of data used to learn the parameters is still typically called the training set, even though this may be confused with the larger pool of data used for the entire training process. The subset of data used to guide the selection of hyperparameters is called the validation set. Typically, one uses about 80 percent of the training data for training and 20 percent for validation. Since the validation set is used to “train” the hyperparameters, the validation set error will underestimate the generalization error, though typically by a smaller amount than the training error does. After all hyperparameter optimization is complete, the generalization error may be estimated using the test set.

In practice, when the same test set has been used repeatedly to evaluate performance of different algorithms over many years, and especially if we consider all the attempts from the scientific community at beating the reported state-of-the-art performance on that test set, we end up having optimistic evaluations with the test set as well. Benchmarks can thus become stale and then do not reflect the true field performance of a trained system. Thankfully, the community tends to move on to new (and usually more ambitious and larger) benchmark datasets.

## 5.3.1 Cross-Validation

Dividing the dataset into a fixed training set and a fixed test set can be problematic if it results in the test set being small. A small test set implies statistical uncertainty around the estimated average test error, making it difficult to claim that algorithm A works better than algorithm B on the given task.

When the dataset has hundreds of thousands of examples or more, this is not a serious issue. When the dataset is too small, are alternative procedures enable one to use all the examples in the estimation of the mean test error, at the price of increased computational cost. These procedures are based on the idea of repeating the training and testing computation on different randomly chosen subsets or splits of the original dataset. The most common of these is the k-fold cross-validation procedure, shown in algorithm 5.1, in which a partition of the dataset is formed by splitting it into k nonoverlapping subsets. The test error may then be estimated by taking the average test error across k trials. On trial i, the i-th subset of the data is used as the test set, and the rest of the data is used as the training set. One problem is that no unbiased estimators of the variance of such average error estimators exist (Bengio and Grandvalet, 2004), but approximations are typically used.

## 5.4 Estimators, Bias and Variance

The field of statistics gives us many tools to achieve the machine learning goal of solving a task not only on the training set but also to generalize. Foundational concepts such as parameter estimation, bias and variance are useful to formally characterize notions of generalization, underfitting and overfitting.

## 5.4.1 Point Estimation

Point estimation is the attempt to provide the single “best” prediction of some quantity of interest. In general the quantity of interest can be a single parameter or a vector of parameters in some parametric model, such as the weights in our linear regression example in section 5.1.4, but it can also be a whole function.

To distinguish estimates of parameters from their true value, our convention will be to denote a point estimate of a parameter $\theta$ by $\hat{\theta}$ .

Let $\{\pmb{x}^{(1)},\dots,\pmb{x}^{(m)}\}$ be a set of $m$ independent and identically distributed (i.i.d.) data points. A point estimator or statistic is any function of the data:

$$
\hat{\boldsymbol{\theta}}_{m} = g(\boldsymbol{x}^{(1)}, \dots, \boldsymbol{x}^{(m)}).\tag{5.19}
$$

The definition does not require that g return a value that is close to the true $\theta$ or even that the range of g be the same as the set of allowable values of $\theta$ . This definition of a point estimator is very general and would enable the designer of an estimator great flexibility. While almost any function thus qualifies as an estimator, a good estimator is a function whose output is close to the true underlying $\theta$ that generated the training data.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Algorithm 5.1 The k-fold cross-validation algorithm. It can be used to estimate generalization error of a learning algorithm A when the given dataset D is too small for a simple train/test or train/valid split to yield accurate estimation of generalization error, because the mean of a loss L on a small test set may have too high a variance. The dataset D contains as elements the abstract examples  $z^{(i)}$  (for the i-th example), which could stand for an (input,target) pair  $z^{(i)} =(x^{(i)}, y^{(i)})$  in the case of supervised learning, or for just an input  $z^{(i)} = x^{(i)}$  in the case of unsupervised learning. The algorithm returns the vector of errors e for each example in D, whose mean is the estimated generalization error. The errors on individual examples can be used to compute a confidence interval around the mean (equation 5.47). Though these confidence intervals are not well justified after the use of cross-validation, it is still common practice to use them to declare that algorithm A is better than algorithm B only if the confidence interval of the error of algorithm A lies below and does not intersect the confidence interval of algorithm B.

Define KFoldXV(D, A, L, k):

Require: D, the given dataset, with elements  $z^{(i)}$ 

Require: A, the learning algorithm, seen as a function that takes a dataset as input and outputs a learned function

Require: L, the loss function, seen as a function from a learned function f and an example  $z^{(i)} \in D$  to a scalar  $\in R$ 

Require: k, the number of folds

Split D into k mutually exclusive subsets  $D_i$ , whose union is D

for i from 1 to k do

 $f_i = A(\mathbb{D} \backslash \mathbb{D}_i)$ 

for  $z^{(j)}$  in  $D_i$  do

 $e_j = L(f_i, z^{(j)})$ 

end for

end for

Return e
</div>

For now, we take the frequentist perspective on statistics. That is, we assume that the true parameter value $\theta$ is fixed but unknown, while the point estimate $\hat{\theta}$ is a function of the data. Since the data is drawn from a random process, any function of the data is random. Therefore $\hat{\theta}$ is a random variable.

Point estimation can also refer to the estimation of the relationship between input and target variables. We refer to these types of point estimates as function estimators.

Function Estimation Sometimes we are interested in performing function estimation (or function approximation). Here, we are trying to predict a variable y given an input vector x. We assume that there is a function $f(\boldsymbol{x})$ that describes the approximate relationship between y and x. For example, we may assume that $y = f(\boldsymbol{x}) + \epsilon$ , where $\epsilon$ stands for the part of y that is not predictable from x. In function estimation, we are interested in approximating f with a model or estimate $\hat{f}$ . Function estimation is really just the same as estimating a parameter $\theta$ ; the function estimator $\hat{f}$ is simply a point estimator in function space. The linear regression example (discussed in section 5.1.4) and the polynomial regression example (discussed in section 5.2) both illustrate scenarios that may be interpreted as either estimating a parameter w or estimating a function $\hat{f}$ mapping from x to y.

We now review the most commonly studied properties of point estimators and discuss what they tell us about these estimators.

## 5.4.2 Bias

The bias of an estimator is defined as

$$
\mathrm{bias}(\hat{\pmb{\theta}}_{m}) = \mathbb{E}(\hat{\pmb{\theta}}_{m}) - \pmb{\theta},\tag{5.20}
$$

where the expectation is over the data (seen as samples from a random variable) and $\theta$ is the true underlying value of $\theta$ used to define the data-generating distribution. An estimator $\hat{\theta}_{m}$ is said to be unbiased if bias( $\hat{\theta}_{m}$ ) = 0, which implies that $\mathbb{E}(\hat{\theta}_{m}) = \theta$ . An estimator $\hat{\theta}_{m}$ is said to be asymptotically unbiased if $\lim_{m \to \infty} \text{bias}(\hat{\theta}_{m}) = 0$ , which implies that $\lim_{m \to \infty} \mathbb{E}(\hat{\theta}_{m}) = \theta$ .

Example: Bernoulli Distribution Consider a set of samples $\{x^{(1)},\ldots,x^{(m)}\}$ that are independently and identically distributed according to a Bernoulli distribution with mean $\theta$ :

$$
P(x^{(i)}; \theta) = \theta^{x^{(i)}}(1 - \theta)^{(1 - x^{(i)})}.\tag{5.21}
$$

A common estimator for the $\theta$ parameter of this distribution is the mean of the training samples:

$$
\hat{\theta}_{m} = \frac{1}{m} \sum_{i = 1}^{m} x^{(i)}.\tag{5.22}
$$

To determine whether this estimator is biased, we can substitute equation 5.22 into equation 5.20:

$$
\mathrm{bias}(\hat{\theta}_{m}) = \mathbb{E}[\hat{\theta}_{m}] - \theta\tag{5.23}
$$

$$
= \mathbb{E} \left[\frac{1}{m} \sum_{i = 1}^{m} x^{(i)} \right] - \theta\tag{5.24}
$$

$$
= \frac{1}{m} \sum_{i = 1}^{m} \mathbb{E} \left[x^{(i)} \right] - \theta\tag{5.25}
$$

$$
= \frac{1}{m} \sum_{i = 1}^{m} \sum_{x^{(i)} - 0}^{1} \left(x^{(i)} \theta^{x^{(i)}}(1 - \theta)^{(1 - x^{(i)})}\right) - \theta\tag{5.26}
$$

$$
= \frac{1}{m} \sum_{i = 1}^{m}(\theta) - \theta\tag{5.27}
$$

$$
= \theta - \theta = 0\tag{5.28}
$$

Since $\text{bias}(\hat{\theta}) = 0$ , we say that our estimator $\hat{\theta}$ is unbiased.

Example: Gaussian Distribution Estimator of the Mean Now, consider a set of samples $\{x^{(1)},\ldots,x^{(m)}\}$ that are independently and identically distributed according to a Gaussian distribution $p(x^{(i)})=\mathcal{N}(x^{(i)};\mu,\sigma^{2})$ , where $i\in\{1,\ldots,m\}$ . Recall that the Gaussian probability density function is given by

$$
p(x^{(i)}; \mu, \sigma^{2}) = \frac{1}{\sqrt{2 \pi \sigma^{2}}} \exp \left(- \frac{1}{2} \frac{(x^{(i)} - \mu)^{2}}{\sigma^{2}}\right).\tag{5.29}
$$

A common estimator of the Gaussian mean parameter is known as the sample mean:

$$
\hat{\mu}_{m} = \frac{1}{m} \sum_{i = 1}^{m} x^{(i)}\tag{5.30}
$$

To determine the bias of the sample mean, we are again interested in calculating its expectation:

$$
\mathrm{bias}(\hat{\mu}_{m}) = \mathbb{E}[\hat{\mu}_{m}] - \mu\tag{5.31}
$$

$$
= \mathbb{E} \left[\frac{1}{m} \sum_{i = 1}^{m} x^{(i)} \right] - \mu\tag{5.32}
$$

$$
= \left(\frac{1}{m} \sum_{i = 1}^{m} \mathbb{E}[x^{(i)}]\right) - \mu\tag{5.33}
$$

$$
= \left(\frac{1}{m} \sum_{i = 1}^{m} \mu\right) - \mu\tag{5.34}
$$

$$
= \mu - \mu = 0\tag{5.35}
$$

Thus we find that the sample mean is an unbiased estimator of Gaussian mean parameter.

Example: Estimators of the Variance of a Gaussian Distribution For this example, we compare two different estimators of the variance parameter $\sigma^{2}$ of a Gaussian distribution. We are interested in knowing if either estimator is biased.

The first estimator of $\sigma^2$ we consider is known as the sample variance

$$
\hat{\sigma}_{m}^{2} = \frac{1}{m} \sum_{i = 1}^{m} \left(x^{(i)} - \hat{\mu}_{m}\right)^{2},\tag{5.36}
$$

where $\hat{\mu}_{m}$ is the sample mean. More formally, we are interested in computing

$$
\mathrm{bias}(\hat{\sigma}_{m}^{2}) = \mathbb{E}[\hat{\sigma}_{m}^{2}] - \sigma^{2}.\tag{5.37}
$$

We begin by evaluating the term $E[\hat{\sigma}_{m}^{2}]$ :

$$
\begin{array}{l} \mathbb{E}[\hat{\sigma}_{m}^{2}] = \mathbb{E} \left[\frac{1}{m} \sum_{i = 1}^{m} \left(x^{(i)} - \hat{\mu}_{m}\right)^{2} \right] \\ = \frac{m - 1}{m} \sigma^{2} \end{array}\tag{5.38}
$$

(5.39)

Returning to equation 5.37, we conclude that the bias of $\hat{\sigma}_{m}^{2}$ is $-\sigma^{2}/m$ . Therefore, the sample variance is a biased estimator.

The unbiased sample variance estimator

$$
\tilde{\sigma}_{m}^{2} = \frac{1}{m - 1} \sum_{i = 1}^{m} \left(x^{(i)} - \hat{\mu}_{m}\right)^{2}\tag{5.40}
$$

provides an alternative approach. As the name suggests this estimator is unbiased. That is, we find that $E[\tilde{\sigma}_{m}^{2}] = \sigma^{2}$ :

$$
\mathbb{E}[\tilde{\sigma}_{m}^{2}] = \mathbb{E} \left[\frac{1}{m - 1} \sum_{i = 1}^{m} \left(x^{(i)} - \hat{\mu}_{m}\right)^{2} \right]\tag{5.41}
$$

$$
= \frac{m}{m - 1} \mathbb{E}[\hat{\sigma}_{m}^{2}]\tag{5.42}
$$

$$
= \frac{m}{m - 1} \left(\frac{m - 1}{m} \sigma^{2}\right)\tag{5.43}
$$

$$
= \sigma^{2}.\tag{5.44}
$$

We have two estimators: one is biased, and the other is not. While unbiased estimators are clearly desirable, they are not always the “best” estimators. As we will see we often use biased estimators that possess other important properties.

## 5.4.3 Variance and Standard Error

Another property of the estimator that we might want to consider is how much we expect it to vary as a function of the data sample. Just as we computed the expectation of the estimator to determine its bias, we can compute its variance. The variance of an estimator is simply the variance

$$
\operatorname{Var}(\hat{\theta})\tag{5.45}
$$

where the random variable is the training set. Alternately, the square root of the variance is called the standard error, denoted $\mathrm{SE}(\hat{\theta})$ .

The variance, or the standard error, of an estimator provides a measure of how we would expect the estimate we compute from data to vary as we independently resample the dataset from the underlying data-generating process. Just as we might like an estimator to exhibit low bias, we would also like it to have relatively low variance.

When we compute any statistic using a finite number of samples, our estimate of the true underlying parameter is uncertain, in the sense that we could have obtained other samples from the same distribution and their statistics would have been different. The expected degree of variation in any estimator is a source of error that we want to quantify.

The standard error of the mean is given by

$$
\mathrm{SE}(\hat{\mu}_{m}) = \sqrt{\operatorname{Var} \left[\frac{1}{m} \sum_{i = 1}^{m} x^{(i)} \right]} = \frac{\sigma}{\sqrt{m}},\tag{5.46}
$$

where $\sigma^{2}$ is the true variance of the samples $x^{i}$ . The standard error is often estimated by using an estimate of $\sigma$ . Unfortunately, neither the square root of the sample variance nor the square root of the unbiased estimator of the variance provide an unbiased estimate of the standard deviation. Both approaches tend to underestimate the true standard deviation but are still used in practice. The square root of the unbiased estimator of the variance is less of an underestimate. For large m, the approximation is quite reasonable.

The standard error of the mean is very useful in machine learning experiments. We often estimate the generalization error by computing the sample mean of the error on the test set. The number of examples in the test set determines the accuracy of this estimate. Taking advantage of the central limit theorem, which tells us that the mean will be approximately distributed with a normal distribution, we can use the standard error to compute the probability that the true expectation falls in any chosen interval. For example, the 95 percent confidence interval centered on the mean $\hat{\mu}_{m}$ is

$$
(\hat{\mu}_{m} - 1.96 \mathrm{SE}(\hat{\mu}_{m}), \hat{\mu}_{m} + 1.96 \mathrm{SE}(\hat{\mu}_{m})),\tag{5.47}
$$

under the normal contribution with mean $\hat{\mu}_{m}$ and variance $\mathrm{SE}(\hat{\mu}_{m})^{2}$ . In machine learning experiments, it is common to say that algorithm A is better than algorithm B if the upper bound of the 95 percent confidence interval for the error of algorithm A is less than the lower bound of the 95 percent confidence interval for the error of algorithm B.

Example: Bernoulli Distribution We once again consider a set of samples $\{x^{(1)},\ldots,x^{(m)}\}$ drawn independently and identically from a Bernoulli distribution (recall $P(x^{(i)};\theta)=\theta^{x^{(i)}}(1-\theta)^{(1-x^{(i)})}$ ). This time we are interested in computing the variance of the estimator $\hat{\theta}_{m}=\frac{1}{m}\sum_{i=1}^{m}x^{(i)}$ .

$$
\operatorname{Var} \left(\hat{\theta}_{m}\right) = \operatorname{Var} \left(\frac{1}{m} \sum_{i = 1}^{m} x^{(i)}\right)\tag{5.48}
$$

$$
= \frac{1}{m^{2}} \sum_{i = 1}^{m} \operatorname{Var} \left(x^{(i)}\right)\tag{5.49}
$$

$$
= \frac{1}{m^{2}} \sum_{i = 1}^{m} \theta(1 - \theta)\tag{5.50}
$$

$$
= \frac{1}{m^{2}} m \theta(1 - \theta)\tag{5.51}
$$

$$
= \frac{1}{m} \theta(1 - \theta)\tag{5.52}
$$

The variance of the estimator decreases as a function of m, the number of examples in the dataset. This is a common property of popular estimators that we will return to when we discuss consistency (see section 5.4.5).

## 5.4.4 Trading Off Bias and Variance to Minimize Mean Squared Error

Bias and variance measure two different sources of error in an estimator. Bias measures the expected deviation from the true value of the function or parameter. Variance on the other hand, provides a measure of the deviation from the expected estimator value that any particular sampling of the data is likely to cause.

What happens when we are given a choice between two estimators, one with more bias and one with more variance? How do we choose between them? For example, imagine that we are interested in approximating the function shown in figure 5.2 and we are only offered the choice between a model with large bias and one that suffers from large variance. How do we choose between them?

The most common way to negotiate this trade-off is to use cross-validation. Empirically, cross-validation is highly successful on many real-world tasks. Alternatively, we can also compare the mean squared error (MSE) of the estimates:

$$
\mathrm{MSE} = \mathbb{E}[(\hat{\theta}_{m} - \theta)^{2}]\tag{5.53}
$$

$$
= \mathrm{Bias}(\hat{\theta}_{m})^{2} + \operatorname{Var}(\hat{\theta}_{m})\tag{5.54}
$$

The MSE measures the overall expected deviation in a squared error sense—between the estimator and the true value of the parameter $\theta$ . As is clear from equation 5.54, evaluating the MSE incorporates both the bias and the variance. Desirable estimators are those with small MSE and these are estimators that manage to keep both their bias and variance somewhat in check.

The relationship between bias and variance is tightly linked to the machine learning concepts of capacity, underfitting and overfitting. When generalization error is measured by the MSE (where bias and variance are meaningful components of generalization error), increasing capacity tends to increase variance and decrease bias. This is illustrated in figure 5.6, where we see again the U-shaped curve of generalization error as a function of capacity.

## 5.4.5 Consistency

So far we have discussed the properties of various estimators for a training set of fixed size. Usually, we are also concerned with the behavior of an estimator as the amount of training data grows. In particular, we usually wish that, as the number of data points m in our dataset increases, our point estimates converge to the true value of the corresponding parameters. More formally, we would like that

![Figure 5.6](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/63b040523ba1f490dd2a20c4f2a2d13a5227c10762cb1eb39c3453e1e53ad719.jpg)  
Figure 5.6: As capacity increases (x-axis), bias (dotted) tends to decrease and variance (dashed) tends to increase, yielding another U-shaped curve for generalization error (bold curve). If we vary capacity along one axis, there is an optimal capacity, with underfitting when the capacity is below this optimum and overfitting when it is above. This relationship is similar to the relationship between capacity, underfitting, and overfitting, discussed in section 5.2 and figure 5.3.

$$
\mathrm{plim}_{m \to \infty} \hat{\theta}_{m} = \theta.\tag{5.55}
$$

The symbol plim indicates convergence in probability, meaning that for any $\epsilon > 0$ , $P(|\hat{\theta}_{m} - \theta| > \epsilon) \to 0$ as $m \to \infty$ . The condition described by equation 5.55 is known as consistency. It is sometimes referred to as weak consistency, with strong consistency referring to the almost sure convergence of $\hat{\theta}$ to $\theta$ . Almost sure convergence of a sequence of random variables $\mathbf{x}^{(1)}, \mathbf{x}^{(2)}, \ldots$ to a value x occurs when $p(\lim_{m \to \infty} \mathbf{x}^{(m)} = \mathbf{x}) = 1$ .

Consistency ensures that the bias induced by the estimator diminishes as the number of data examples grows. However, the reverse is not true—asymptotic unbiasedness does not imply consistency. For example, consider estimating the mean parameter $\mu$ of a normal distribution $\mathcal{N}(x;\mu,\sigma^{2})$ , with a dataset consisting of m samples: $\{x^{(1)},\ldots,x^{(m)}\}$ . We could use the first sample $x^{(1)}$ of the dataset as an unbiased estimator: $\hat{\theta}=x^{(1)}$ . In that case, $\mathbb{E}(\hat{\theta}_{m})=\theta$ , so the estimator is unbiased no matter how many data points are seen. This, of course, implies that the estimate is asymptotically unbiased. However, this is not a consistent estimator as it is not the case that $\hat{\theta}_{m}\to\theta$ as $m\to\infty$ .

## 5.5 Maximum Likelihood Estimation

We have seen some definitions of common estimators and analyzed their properties. But where did these estimators come from? Rather than guessing that some function might make a good estimator and then analyzing its bias and variance, we would like to have some principle from which we can derive specific functions that are good estimators for different models.

The most common such principle is the maximum likelihood principle.

Consider a set of $m$ examples $\mathbb{X} = \{\pmb{x}^{(1)},\dots,\pmb{x}^{(m)}\}$ drawn independently from the true but unknown data-generating distribution $p_{\mathrm{data}}(\mathbf{x})$ .

Let $p_{\mathrm{model}}(\mathbf{x}; \boldsymbol{\theta})$ be a parametric family of probability distributions over the same space indexed by $\theta$ . In other words, $p_{\mathrm{model}}(\mathbf{x}; \boldsymbol{\theta})$ maps any configuration x to a real number estimating the true probability $p_{\mathrm{data}}(\mathbf{x})$ .

The maximum likelihood estimator for $\theta$ is then defined as

$$
\boldsymbol{\theta}_{\mathrm{ML}} = \underset{\boldsymbol{\theta}}{\arg \max} p_{\text{model}}(\mathbb{X}; \boldsymbol{\theta}),\tag{5.56}
$$

$$
= \arg \max_{\boldsymbol{\theta}} \prod_{i = 1}^{m} p_{\text{model}}(\boldsymbol{x}^{(i)}; \boldsymbol{\theta}).\tag{5.57}
$$

This product over many probabilities can be inconvenient for various reasons. For example, it is prone to numerical underflow. To obtain a more convenient but equivalent optimization problem, we observe that taking the logarithm of the likelihood does not change its arg max but does conveniently transform a product into a sum:

$$
\boldsymbol{\theta}_{\mathrm{ML}} = \arg \max_{\boldsymbol{\theta}} \sum_{i = 1}^{m} \log p_{\text{model}}(\boldsymbol{x}^{(i)}; \boldsymbol{\theta}).\tag{5.58}
$$

Because the arg max does not change when we rescale the cost function, we can divide by m to obtain a version of the criterion that is expressed as an expectation with respect to the empirical distribution $\hat{p}_{data}$ defined by the training data:

$$
\boldsymbol{\theta}_{\mathrm{ML}} = \underset{\boldsymbol{\theta}}{\arg \max} \mathbb{E}_{\mathbf{x} \sim \hat{p}_{\mathrm{data}}} \log p_{\mathrm{model}}(\boldsymbol{x}; \boldsymbol{\theta}).\tag{5.59}
$$

One way to interpret maximum likelihood estimation is to view it as minimizing the dissimilarity between the empirical distribution $\hat{p}_{data}$ , defined by the training set and the model distribution, with the degree of dissimilarity between the two measured by the KL divergence. The KL divergence is given by

$$
D_{\mathrm{KL}} \left(\hat{p}_{\mathrm{data}} \| p_{\mathrm{model}}\right) = \mathbb{E}_{\mathbf{x} \sim \hat{p}_{\mathrm{data}}} \left[\log \hat{p}_{\mathrm{data}}(\boldsymbol{x}) - \log p_{\mathrm{model}}(\boldsymbol{x}) \right].\tag{5.60}
$$

The term on the left is a function only of the data-generating process, not the model. This means when we train the model to minimize the KL divergence, we need only minimize

$$
- \mathbb{E}_{\mathbf{x} \sim \hat{p}_{\mathrm{data}}} \left[\log p_{\mathrm{model}}(\pmb{x}) \right],\tag{5.61}
$$

which is of course the same as the maximization in equation 5.59.

Minimizing this KL divergence corresponds exactly to minimizing the cross-entropy between the distributions. Many authors use the term “cross-entropy” to identify specifically the negative log-likelihood of a Bernoulli or softmax distribution, but that is a misnomer. Any loss consisting of a negative log-likelihood is a cross-entropy between the empirical distribution defined by the training set and the probability distribution defined by model. For example, mean squared error is the cross-entropy between the empirical distribution and a Gaussian model.

We can thus see maximum likelihood as an attempt to make the model distribution match the empirical distribution $\hat{p}_{data}$ . Ideally, we would like to match the true data-generating distribution $p_{data}$ , but we have no direct access to this distribution.

While the optimal $\theta$ is the same regardless of whether we are maximizing the likelihood or minimizing the KL divergence, the values of the objective functions are different. In software, we often phrase both as minimizing a cost function. Maximum likelihood thus becomes minimization of the negative log-likelihood (NLL), or equivalently, minimization of the cross-entropy. The perspective of maximum likelihood as minimum KL divergence becomes helpful in this case because the KL divergence has a known minimum value of zero. The negative log-likelihood can actually become negative when x is real-valued.

## 5.5.1 Conditional Log-Likelihood and Mean Squared Error

The maximum likelihood estimator can readily be generalized to estimate a conditional probability $P(\mathbf{y} \mid \mathbf{x}; \boldsymbol{\theta})$ in order to predict y given x. This is actually the most common situation because it forms the basis for most supervised learning. If X represents all our inputs and Y all our observed targets, then the conditional maximum likelihood estimator is

$$
\boldsymbol{\theta}_{\mathrm{ML}} = \underset{\boldsymbol{\theta}}{\arg \max} P(\boldsymbol{Y} \mid \boldsymbol{X}; \boldsymbol{\theta}).\tag{5.62}
$$

If the examples are assumed to be i.i.d., then this can be decomposed into

$$
\boldsymbol{\theta}_{\mathrm{ML}} = \underset{\boldsymbol{\theta}}{\arg \max} \sum_{i = 1}^{m} \log P(\boldsymbol{y}^{(i)} \mid \boldsymbol{x}^{(i)}; \boldsymbol{\theta}).\tag{5.63}
$$

Example: Linear Regression as Maximum Likelihood Linear regression, introduced in section 5.1.4, may be justified as a maximum likelihood procedure. Previously, we motivated linear regression as an algorithm that learns to take an input x and produce an output value $\hat{y}$ . The mapping from x to $\hat{y}$ is chosen to minimize mean squared error, a criterion that we introduced more or less arbitrarily. We now revisit linear regression from the point of view of maximum likelihood estimation. Instead of producing a single prediction $\hat{y}$ , we now think of the model as producing a conditional distribution $p(y \mid x)$ . We can imagine that with an infinitely large training set, we might see several training examples with the same input value x but different values of y. The goal of the learning algorithm is now to fit the distribution $p(y \mid x)$ to all those different y values that are all compatible with x. To derive the same linear regression algorithm we obtained before, we define $p(y \mid x) = \mathcal{N}(y; \hat{y}(x; w), \sigma^2)$ . The function $\hat{y}(x; w)$ gives the prediction of the mean of the Gaussian. In this example, we assume that the variance is fixed to some constant $\sigma^2$ chosen by the user. We will see that this choice of the functional form of $p(y \mid x)$ causes the maximum likelihood estimation procedure to yield the same learning algorithm as we developed before. Since the examples are assumed to be i.i.d., the conditional log-likelihood (equation 5.63) is given by

$$
\sum_{i = 1}^{m} \log p(y^{(i)} \mid \pmb{x}^{(i)}; \pmb{\theta})\tag{5.64}
$$

$$
= - m \log \sigma - \frac{m}{2} \log(2 \pi) - \sum_{i = 1}^{m} \frac{\left\| \hat{y}^{(i)} - y^{(i)} \right\|^{2}}{2 \sigma^{2}},\tag{5.65}
$$

where $\hat{y}^{(i)}$ is the output of the linear regression on the i-th input $\boldsymbol{x}^{(i)}$ and m is the number of the training examples. Comparing the log-likelihood with the mean squared error,

$$
\mathrm{MSE}_{\mathrm{train}} = \frac{1}{m} \sum_{i = 1}^{m} | | \hat{y}^{(i)} - y^{(i)} | |^{2},\tag{5.66}
$$

we immediately see that maximizing the log-likelihood with respect to w yields the same estimate of the parameters w as does minimizing the mean squared error. The two criteria have different values but the same location of the optimum. This justifies the use of the MSE as a maximum likelihood estimation procedure. As we will see, the maximum likelihood estimator has several desirable properties.

## 5.5.2 Properties of Maximum Likelihood

The main appeal of the maximum likelihood estimator is that it can be shown to be the best estimator asymptotically, as the number of examples $m \rightarrow \infty$ , in terms of its rate of convergence as m increases.

Under appropriate conditions, the maximum likelihood estimator has the property of consistency (see section 5.4.5), meaning that as the number of training examples approaches infinity, the maximum likelihood estimate of a parameter converges to the true value of the parameter. These conditions are as follows:

\- The true distribution $p_{\text{data}}$ must lie within the model family $p_{\text{model}}(\cdot; \boldsymbol{\theta})$ . Otherwise, no estimator can recover $p_{\text{data}}$ .

\- The true distribution $p_{data}$ must correspond to exactly one value of $\theta$ . Otherwise, maximum likelihood can recover the correct $p_{data}$ but will not be able to determine which value of $\theta$ was used by the data-generating process.

There are other inductive principles besides the maximum likelihood estimator, many of which share the property of being consistent estimators. Consistent estimators can differ, however, in their statistical efficiency, meaning that one consistent estimator may obtain lower generalization error for a fixed number of samples m, or equivalently, may require fewer examples to obtain a fixed level of generalization error.

Statistical efficiency is typically studied in the parametric case (as in linear regression), where our goal is to estimate the value of a parameter (assuming it is possible to identify the true parameter), not the value of a function. A way to measure how close we are to the true parameter is by the expected mean squared error, computing the squared difference between the estimated and true parameter values, where the expectation is over m training samples from the data-generating distribution. That parametric mean squared error decreases as m increases, and for m large, the Cramér-Rao lower bound (Rao, 1945; Cramér, 1946) shows that no consistent estimator has a lower MSE than the maximum likelihood estimator.

For these reasons (consistency and efficiency), maximum likelihood is often considered the preferred estimator to use for machine learning. When the number of examples is small enough to yield overfitting behavior, regularization strategies such as weight decay may be used to obtain a biased version of maximum likelihood that has less variance when training data is limited.

## 5.6 Bayesian Statistics

So far we have discussed frequentist statistics and approaches based on estimating a single value of $\theta$ , then making all predictions thereafter based on that one estimate. Another approach is to consider all possible values of $\theta$ when making a prediction. The latter is the domain of Bayesian statistics.

As discussed in section 5.4.1, the frequentist perspective is that the true parameter value $\theta$ is fixed but unknown, while the point estimate $\hat{\theta}$ is a random variable on account of it being a function of the dataset (which is seen as random).

The Bayesian perspective on statistics is quite different. The Bayesian uses probability to reflect degrees of certainty in states of knowledge. The dataset is directly observed and so is not random. On the other hand, the true parameter $\theta$ is unknown or uncertain and thus is represented as a random variable.

Before observing the data, we represent our knowledge of $\theta$ using the prior probability distribution, $p(\theta)$ (sometimes referred to as simply “the prior”). Generally, the machine learning practitioner selects a prior distribution that is quite broad (i.e., with high entropy) to reflect a high degree of uncertainty in the value of $\theta$ before observing any data. For example, one might assume a priori that $\theta$ lies in some finite range or volume, with a uniform distribution. Many priors instead reflect a preference for “simpler” solutions (such as smaller magnitude coefficients, or a function that is closer to being constant).

Now consider that we have a set of data samples $\{x^{(1)},\ldots,x^{(m)}\}$ . We can recover the effect of data on our belief about $\theta$ by combining the data likelihood $p(x^{(1)},\ldots,x^{(m)}\mid\theta)$ with the prior via Bayes' rule:

$$
p(\boldsymbol{\theta} \mid x^{(1)}, \dots, x^{(m)}) = \frac{p(x^{(1)}, \dots, x^{(m)} \mid \boldsymbol{\theta}) p(\boldsymbol{\theta})}{p(x^{(1)}, \dots, x^{(m)})}\tag{5.67}
$$

In the scenarios where Bayesian estimation is typically used, the prior begins as a relatively uniform or Gaussian distribution with high entropy, and the observation of the data usually causes the posterior to lose entropy and concentrate around a few highly likely values of the parameters.

Relative to maximum likelihood estimation, Bayesian estimation offers two important differences. First, unlike the maximum likelihood approach that makes predictions using a point estimate of $\theta$ , the Bayesian approach is to make predictions using a full distribution over $\theta$ . For example, after observing m examples, the predicted distribution over the next data sample, $x^{(m+1)}$ , is given by

$$
p(x^{(m + 1)} \mid x^{(1)}, \dots, x^{(m)}) = \int p(x^{(m + 1)} \mid \boldsymbol{\theta}) p(\boldsymbol{\theta} \mid x^{(1)}, \dots, x^{(m)}) d \boldsymbol{\theta}.\tag{5.68}
$$

Here each value of $\theta$ with positive probability density contributes to the prediction of the next example, with the contribution weighted by the posterior density itself. After having observed $\{x^{(1)},\ldots,x^{(m)}\}$ , if we are still quite uncertain about the value of $\theta$ , then this uncertainty is incorporated directly into any predictions we might make.

In section 5.4, we discussed how the frequentist approach addresses the uncertainty in a given point estimate of $\theta$ by evaluating its variance. The variance of the estimator is an assessment of how the estimate might change with alternative samplings of the observed data. The Bayesian answer to the question of how to deal with the uncertainty in the estimator is to simply integrate over it, which tends to protect well against overfitting. This integral is of course just an application of the laws of probability, making the Bayesian approach simple to justify, while the frequentist machinery for constructing an estimator is based on the rather ad hoc decision to summarize all knowledge contained in the dataset with a single point estimate.

The second important difference between the Bayesian approach to estimation and the maximum likelihood approach is due to the contribution of the Bayesian prior distribution. The prior has an influence by shifting probability mass density towards regions of the parameter space that are preferred a priori. In practice, the prior often expresses a preference for models that are simpler or more smooth. Critics of the Bayesian approach identify the prior as a source of subjective human judgment affecting the predictions.

Bayesian methods typically generalize much better when limited training data is available but typically suffer from high computational cost when the number of training examples is large.

Example: Bayesian Linear Regression Here we consider the Bayesian estimation approach to learning the linear regression parameters. In linear regression, we learn a linear mapping from an input vector $x \in \mathbb{R}^{n}$ to predict the value of a scalar $y \in R$ . The prediction is parametrized by the vector $w \in \mathbb{R}^{n}$ :

$$
\hat{y} = \boldsymbol{w}^{\top} \boldsymbol{x}.\tag{5.69}
$$

Given a set of $m$ training samples $(X^{(\mathrm{train})}, y^{(\mathrm{train})})$ , we can express the prediction of $y$ over the entire training set as

$$
\hat{\boldsymbol{y}}^{(\text{train})} = \boldsymbol{X}^{(\text{train})} \boldsymbol{w}.\tag{5.70}
$$

Expressed as a Gaussian conditional distribution on $\pmb{y}^{(\mathrm{train})}$ , we have

$$
\begin{array}{l} p(\boldsymbol{y}^{\text{(train)}} \mid \boldsymbol{X}^{\text{(train)}}, \boldsymbol{w}) = \mathcal{N}(\boldsymbol{y}^{\text{(train)}}; \boldsymbol{X}^{\text{(train)}} \boldsymbol{w}, \boldsymbol{I}) \\ \propto \exp \left(- \frac{1}{2}(\boldsymbol{y}^{\text{(train)}} - \boldsymbol{X}^{\text{(train)}} \boldsymbol{w})^{\top}(\boldsymbol{y}^{\text{(train)}} - \hat{\boldsymbol{X}}^{\text{(train)}} \boldsymbol{w})\right), \end{array} \tag{5.71}\tag{5.72}
$$

where we follow the standard MSE formulation in assuming that the Gaussian variance on y is one. In what follows, to reduce the notational burden, we refer to $(\boldsymbol{X}^{\mathrm{(train)}}, \boldsymbol{y}^{\mathrm{(train)}})$ as simply $(\boldsymbol{X}, \boldsymbol{y})$ .

To determine the posterior distribution over the model parameter vector w, we first need to specify a prior distribution. The prior should reflect our naive belief about the value of these parameters. While it is sometimes difficult or unnatural to express our prior beliefs in terms of the parameters of the model, in practice we typically assume a fairly broad distribution, expressing a high degree of uncertainty about $\theta$ . For real-valued parameters it is common to use a Gaussian as a prior distribution,

$$
p(\boldsymbol{w}) = \mathcal{N}(\boldsymbol{w}; \boldsymbol{\mu}_{0}, \boldsymbol{\Lambda}_{0}) \propto \exp \left(- \frac{1}{2}(\boldsymbol{w} - \boldsymbol{\mu}_{0})^{\top} \boldsymbol{\Lambda}_{0}^{- 1}(\boldsymbol{w} - \boldsymbol{\mu}_{0})\right),\tag{5.73}
$$

where $\mu_{0}$ and $\Lambda_{0}$ are the prior distribution mean vector and covariance matrix respectively. $^{1}$

With the prior thus specified, we can now proceed in determining the posterior distribution over the model parameters:

$$
p(\boldsymbol{w} \mid \boldsymbol{X}, \boldsymbol{y}) \propto p(\boldsymbol{y} \mid \boldsymbol{X}, \boldsymbol{w}) p(\boldsymbol{w})\tag{5.74}
$$

$$
\propto \exp \left(- \frac{1}{2}(\boldsymbol{y} - \boldsymbol{X} \boldsymbol{w})^{\top}(\boldsymbol{y} - \boldsymbol{X} \boldsymbol{w})\right) \exp \left(- \frac{1}{2}(\boldsymbol{w} - \boldsymbol{\mu}_{0})^{\top} \boldsymbol{\Lambda}_{0}^{- 1}(\boldsymbol{w} - \boldsymbol{\mu}_{0})\right)\tag{5.75}
$$

$$
\propto \exp \left(- \frac{1}{2} \left(- 2 \boldsymbol{y}^{\top} \boldsymbol{X} \boldsymbol{w} + \boldsymbol{w}^{\top} \boldsymbol{X}^{\top} \boldsymbol{X} \boldsymbol{w} + \boldsymbol{w}^{\top} \boldsymbol{\Lambda}_{0}^{- 1} \boldsymbol{w} - 2 \boldsymbol{\mu}_{0}^{\top} \boldsymbol{\Lambda}_{0}^{- 1} \boldsymbol{w}\right)\right)\tag{5.76}
$$

We now define $\mathbf{\Lambda}_m =(X^\top X + \mathbf{\Lambda}_0^{-1})^{-1}$ and $\boldsymbol{\mu}_m = \mathbf{\Lambda}_m(X^\top y + \mathbf{\Lambda}_0^{-1}\boldsymbol{\mu}_0)$ . Using these new variables, we find that the posterior may be rewritten as a Gaussian distribution:

$$
p(\boldsymbol{w} \mid \boldsymbol{X}, \boldsymbol{y}) \propto \exp \left(- \frac{1}{2}(\boldsymbol{w} - \boldsymbol{\mu}_{m})^{\top} \boldsymbol{\Lambda}_{m}^{- 1}(\boldsymbol{w} - \boldsymbol{\mu}_{m}) + \frac{1}{2} \boldsymbol{\mu}_{m}^{\top} \boldsymbol{\Lambda}_{m}^{- 1} \boldsymbol{\mu}_{m}\right)\tag{5.77}
$$

$$
\propto \exp \left(- \frac{1}{2}(\boldsymbol{w} - \boldsymbol{\mu}_{m})^{\top} \boldsymbol{\Lambda}_{m}^{- 1}(\boldsymbol{w} - \boldsymbol{\mu}_{m})\right).\tag{5.78}
$$

All terms that do not include the parameter vector w have been omitted; they are implied by the fact that the distribution must be normalized to integrate to 1. Equation 3.23 shows how to normalize a multivariate Gaussian distribution.

Examining this posterior distribution enables us to gain some intuition for the effect of Bayesian inference. In most situations, we set $\mu_{0}$ to 0. If we set $\Lambda_{0} = \frac{1}{\alpha} I$ , then $\mu_{m}$ gives the same estimate of w as does frequentist linear regression with a weight decay penalty of $\alpha w^{\top} w$ . One difference is that the Bayesian estimate is undefined if $\alpha$ is set to zero—we are not allowed to begin the Bayesian learning process with an infinitely wide prior on w. The more important difference is that the Bayesian estimate provides a covariance matrix, showing how likely all the different values of w are, rather than providing only the estimate $\mu_{m}$ .

## 5.6.1 Maximum A Posteriori (MAP) Estimation

While the most principled approach is to make predictions using the full Bayesian posterior distribution over the parameter $\theta$ , it is still often desirable to have a single point estimate. One common reason for desiring a point estimate is that most operations involving the Bayesian posterior for most interesting models are intractable, and a point estimate offers a tractable approximation. Rather than simply returning to the maximum likelihood estimate, we can still gain some of the benefit of the Bayesian approach by allowing the prior to influence the choice of the point estimate. One rational way to do this is to choose the maximum a posteriori (MAP) point estimate. The MAP estimate chooses the point of maximal posterior probability (or maximal probability density in the more common case of continuous $\theta$ ):

$$
\boldsymbol{\theta}_{\text{MAP}} = \underset{\boldsymbol{\theta}}{\arg \max} p(\boldsymbol{\theta} \mid \boldsymbol{x}) = \underset{\boldsymbol{\theta}}{\arg \max} \log p(\boldsymbol{x} \mid \boldsymbol{\theta}) + \log p(\boldsymbol{\theta}).\tag{5.79}
$$

We recognize, on the righthand side, $\log p(\boldsymbol{x} \mid \boldsymbol{\theta})$ , that is, the standard log-likelihood term, and $\log p(\boldsymbol{\theta})$ , corresponding to the prior distribution.

As an example, consider a linear regression model with a Gaussian prior on the weights w. If this prior is given by $\mathcal{N}(\boldsymbol{w};\boldsymbol{0},\frac{1}{\lambda}\boldsymbol{I}^{2})$ , then the log-prior term in equation 5.79 is proportional to the familiar $\lambda w^{\dagger}w$ weight decay penalty, plus a term that does not depend on w and does not affect the learning process. MAP Bayesian inference with a Gaussian prior on the weights thus corresponds to weight decay.

As with full Bayesian inference, MAP Bayesian inference has the advantage of leveraging information that is brought by the prior and cannot be found in the training data. This additional information helps to reduce the variance in the MAP point estimate (in comparison to the ML estimate). However, it does so at the price of increased bias.

Many regularized estimation strategies, such as maximum likelihood learning regularized with weight decay, can be interpreted as making the MAP approximation to Bayesian inference. This view applies when the regularization consists of adding an extra term to the objective function that corresponds to $\log p(\theta)$ . Not all regularization penalties correspond to MAP Bayesian inference. For example, some regularizer terms may not be the logarithm of a probability distribution. Other regularization terms depend on the data, which of course a prior probability distribution is not allowed to do.

MAP Bayesian inference provides a straightforward way to design complicated yet interpretable regularization terms. For example, a more complicated penalty term can be derived by using a mixture of Gaussians, rather than a single Gaussian distribution, as the prior (Nowlan and Hinton, 1992).

## 5.7 Supervised Learning Algorithms

Recall from section 5.1.3 that supervised learning algorithms are, roughly speaking, learning algorithms that learn to associate some input with some output, given a training set of examples of inputs x and outputs y. In many cases the outputs y may be difficult to collect automatically and must be provided by a human "supervisor," but the term still applies even when the training set targets were collected automatically.

## 5.7.1 Probabilistic Supervised Learning

Most supervised learning algorithms in this book are based on estimating a probability distribution $p(y \mid x)$ . We can do this simply by using maximum likelihood estimation to find the best parameter vector $\theta$ for a parametric family of distributions $p(y \mid x; \theta)$ .

We have already seen that linear regression corresponds to the family

$$
p(y \mid \boldsymbol{x}; \boldsymbol{\theta}) = \mathcal{N}(y; \boldsymbol{\theta}^{\top} \boldsymbol{x}, \boldsymbol{I}).\tag{5.80}
$$

We can generalize linear regression to the classification scenario by defining a different family of probability distributions. If we have two classes, class 0 and class 1, then we need only specify the probability of one of these classes. The probability of class 1 determines the probability of class 0, because these two values must add up to 1.

The normal distribution over real-valued numbers that we used for linear regression is parametrized in terms of a mean. Any value we supply for this mean is valid. A distribution over a binary variable is slightly more complicated, because its mean must always be between 0 and 1. One way to solve this problem is to use the logistic sigmoid function to squash the output of the linear function into the interval $(0, 1)$ and interpret that value as a probability:

$$
p(y = 1 \mid \boldsymbol{x}; \boldsymbol{\theta}) = \sigma(\boldsymbol{\theta}^{\top} \boldsymbol{x}).\tag{5.81}
$$

This approach is known as logistic regression (a somewhat strange name since we use the model for classification rather than regression).

In the case of linear regression, we were able to find the optimal weights by solving the normal equations. Logistic regression is somewhat more difficult. There is no closed-form solution for its optimal weights. Instead, we must search for them by maximizing the log-likelihood. We can do this by minimizing the negative log-likelihood using gradient descent.

This same strategy can be applied to essentially any supervised learning problem, by writing down a parametric family of conditional probability distributions over the right kind of input and output variables.

## 5.7.2 Support Vector Machines

One of the most influential approaches to supervised learning is the support vector machine (Boser et al., 1992; Cortes and Vapnik, 1995). This model is similar to logistic regression in that it is driven by a linear function $w^{\top}x + b$ . Unlike logistic regression, the support vector machine does not provide probabilities, but only outputs a class identity. The SVM predicts that the positive class is present when $w^{\top}x + b$ is positive. Likewise, it predicts that the negative class is present when $w^{\top}x + b$ is negative.

One key innovation associated with support vector machines is the kernel trick. The kernel trick consists of observing that many machine learning algorithms can be written exclusively in terms of dot products between examples. For example, it can be shown that the linear function used by the support vector machine can be re-written as

$$
\boldsymbol{w}^{\top} \boldsymbol{x} + b = b + \sum_{i = 1}^{m} \alpha_{i} \boldsymbol{x}^{\top} \boldsymbol{x}^{(i)},\tag{5.82}
$$

where $\boldsymbol{x}^{(i)}$ is a training example, and $\alpha$ is a vector of coefficients. Rewriting the learning algorithm this way enables us to replace x with the output of a given feature function $\phi(\boldsymbol{x})$ and the dot product with a function $k(\boldsymbol{x},\boldsymbol{x}^{(i)})=\phi(\boldsymbol{x})\cdot\phi(\boldsymbol{x}^{(i)})$ called a kernel. The $\cdot$ operator represents an inner product analogous to $\phi(\boldsymbol{x})^{\top}\phi(\boldsymbol{x}^{(i)})$ . For some feature spaces, we may not use literally the vector inner product. In some infinite dimensional spaces, we need to use other kinds of inner products, for example, inner products based on integration rather than summation. A complete development of these kinds of inner products is beyond the scope of this book.

After replacing dot products with kernel evaluations, we can make predictions using the function

$$
f(\boldsymbol{x}) = b + \sum_{i} \alpha_{i} k(\boldsymbol{x}, \boldsymbol{x}^{(i)}).\tag{5.83}
$$

This function is nonlinear with respect to x, but the relationship between $\phi(\mathbf{x})$ and $f(\mathbf{x})$ is linear. Also, the relationship between $\alpha$ and $f(\mathbf{x})$ is linear. The kernel-based function is exactly equivalent to preprocessing the data by applying $\phi(\mathbf{x})$ to all inputs, then learning a linear model in the new transformed space.

The kernel trick is powerful for two reasons. First, it enables us to learn models that are nonlinear as a function of x using convex optimization techniques that are guaranteed to converge efficiently. This is possible because we consider $\phi$ fixed and optimize only $\alpha$ , that is, the optimization algorithm can view the decision function as being linear in a different space. Second, the kernel function k often admits an implementation that is significantly more computationally efficient than naively constructing two $\phi(\boldsymbol{x})$ vectors and explicitly taking their dot product.

In some cases, $\phi(\boldsymbol{x})$ can even be infinite dimensional, which would result in an infinite computational cost for the naive, explicit approach. In many cases, $k(\boldsymbol{x},\boldsymbol{x}^{\prime})$ is a nonlinear, tractable function of x even when $\phi(\boldsymbol{x})$ is intractable. As an example of an infinite-dimensional feature space with a tractable kernel, we construct a feature mapping $\phi(x)$ over the nonnegative integers x. Suppose that this mapping returns a vector containing x ones followed by infinitely many zeros. We can write a kernel function $k(x,x^{(i)})=\min(x,x^{(i)})$ that is exactly equivalent to the corresponding infinite-dimensional dot product.

The most commonly used kernel is the Gaussian kernel,

$$
k(\boldsymbol{u}, \boldsymbol{v}) = \mathcal{N}(\boldsymbol{u} - \boldsymbol{v}; 0, \sigma^{2} \boldsymbol{I}),\tag{5.84}
$$

where $\mathcal{N}(\boldsymbol{x};\boldsymbol{\mu},\boldsymbol{\Sigma})$ is the standard normal density. This kernel is also known as the radial basis function (RBF) kernel, because its value decreases along lines in v space radiating outward from u. The Gaussian kernel corresponds to a dot product in an infinite-dimensional space, but the derivation of this space is less straightforward than in our example of the min kernel over the integers.

We can think of the Gaussian kernel as performing a kind of template matching. A training example x associated with training label y becomes a template for class y. When a test point $x'$ is near x according to Euclidean distance, the Gaussian kernel has a large response, indicating that $x'$ is very similar to the x template. The model then puts a large weight on the associated training label y. Overall, the prediction will combine many such training labels weighted by the similarity of the corresponding training examples.

Support vector machines are not the only algorithm that can be enhanced using the kernel trick. Many other linear models can be enhanced in this way. The category of algorithms that employ the kernel trick is known as kernel machines, or kernel methods (Williams and Rasmussen, 1996; Schölkopf et al., 1999).

A major drawback to kernel machines is that the cost of evaluating the decision function is linear in the number of training examples, because the i-th example contributes a term $\alpha_{i}k(\boldsymbol{x},\boldsymbol{x}^{(i)})$ to the decision function. Support vector machines are able to mitigate this by learning an $\alpha$ vector that contains mostly zeros. Classifying a new example then requires evaluating the kernel function only for the training examples that have nonzero $\alpha_{i}$ . These training examples are known as support vectors.

Kernel machines also suffer from a high computational cost of training when the dataset is large. We revisit this idea in section 5.9. Kernel machines with generic kernels struggle to generalize well. We explain why in section 5.11. The modern incarnation of deep learning was designed to overcome these limitations of kernel machines. The current deep learning renaissance began when Hinton et al. (2006) demonstrated that a neural network could outperform the RBF kernel SVM on the MNIST benchmark.

## 5.7.3 Other Simple Supervised Learning Algorithms

We have already briefly encountered another nonprobabilistic supervised learning algorithm, nearest neighbor regression. More generally, k-nearest neighbors is a family of techniques that can be used for classification or regression. As a nonparametric learning algorithm, k-nearest neighbors is not restricted to a fixed number of parameters. We usually think of the k-nearest neighbors algorithm as not having any parameters but rather implementing a simple function of the training data. In fact, there is not even really a training stage or learning process. Instead, at test time, when we want to produce an output y for a new test input x, we find the k-nearest neighbors to x in the training data X. We then return the average of the corresponding y values in the training set. This works for essentially any kind of supervised learning where we can define an average over y values. In the case of classification, we can average over one-hot code vectors c with $c_{y}=1$ and $c_{i}=0$ for all other values of i. We can then interpret the average over these one-hot codes as giving a probability distribution over classes. As a nonparametric learning algorithm, k-nearest neighbor can achieve very high capacity. For example, suppose we have a multiclass classification task and measure performance with 0-1 loss. In this setting, 1-nearest neighbor converges to double the Bayes error as the number of training examples approaches infinity. The error in excess of the Bayes error results from choosing a single neighbor by breaking ties between equally distant neighbors randomly. When there is infinite training data, all test points x will have infinitely many training set neighbors at distance zero. If we allow the algorithm to use all these neighbors to vote, rather than randomly choosing one of them, the procedure converges to the Bayes error rate. The high capacity of k-nearest neighbors enables it to obtain high accuracy given a large training set. It does so at high computational cost, however, and it may generalize very badly given a small finite training set. One weakness of k-nearest neighbors is that it cannot learn that one feature is more discriminative than another. For example, imagine we have a regression task with $x\in \mathbb{R}^{100}$ drawn from an isotropic Gaussian distribution, but only a single variable $x_{1}$ is relevant to the output. Suppose further that this feature simply encodes the output directly, that $y=x_{1}$ in all cases. Nearest neighbor regression will not be able to detect this simple pattern. The nearest neighbor of most points x will be determined by the large number of features $x_{2}$ through $x_{100}$ , not by the lone feature $x_{1}$ . Thus the output on small training sets will essentially be random.

Another type of learning algorithm that also breaks the input space into regions and has separate parameters for each region is the decision tree (Breiman et al., 1984) and its many variants. As shown in figure 5.7, each node of the decision tree is associated with a region in the input space, and internal nodes break that region into one subregion for each child of the node (typically using an axis-aligned cut). Space is thus subdivided into nonoverlapping regions, with a one-to-one correspondence between leaf nodes and input regions. Each leaf node usually maps every point in its input region to the same output. Decision trees are usually trained with specialized algorithms that are beyond the scope of this book. The learning algorithm can be considered nonparametric if it is allowed to learn a tree of arbitrary size, though decision trees are usually regularized with size constraints that turn them into parametric models in practice. Decision trees as they are typically used, with axis-aligned splits and constant outputs within each node, struggle to solve some problems that are easy even for logistic regression. For example, if we have a two-class problem, and the positive class occurs wherever $x_{2} > x_{1}$ , the decision boundary is not axis aligned. The decision tree will thus need to approximate the decision boundary with many nodes, implementing a step function that constantly walks back and forth across the true decision function with axis-aligned steps.

![Figure 5.7](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/194f4e73f4d37b82c0d50b0e8d9f3aa06ccea548177743a52522d97d526bd268.jpg)  
Figure 5.7: Diagrams describing how a decision tree works. (Top)Each node of the tree chooses to send the input example to the child node on the left (0) or to the child node on the right (1). Internal nodes are drawn as circles and leaf nodes as squares. Each node is displayed with a binary string identifier corresponding to its position in the tree, obtained by appending a bit to its parent identifier (0 choose left or top, 1 = choose right or bottom). (Bottom)The tree divides space into regions. The 2-D plane shows how a decision tree might divide $\mathbb{R}^2$ . The nodes of the tree are plotted in this plane, with each internal node drawn along the dividing line it uses to categorize examples, and leaf nodes drawn in the center of the region of examples they receive. The result is a piecewise-constant function, with one piece per leaf. Each leaf requires at least one training example to define, so it is not possible for the decision tree to learn a function that has more local maxima than the number of training examples.

As we have seen, nearest neighbor predictors and decision trees have many limitations. Nonetheless, they are useful learning algorithms when computational resources are constrained. We can also build intuition for more sophisticated learning algorithms by thinking about the similarities and differences between sophisticated algorithms and k-nearest neighbors or decision tree baselines.

See Murphy (2012), Bishop (2006), Hastie et al. (2001) or other machine learning textbooks for more material on traditional supervised learning algorithms.

## 5.8 Unsupervised Learning Algorithms

Recall from section 5.1.3 that unsupervised algorithms are those that experience only “features” but not a supervision signal. The distinction between supervised and unsupervised algorithms is not formally and rigidly defined because there is no objective test for distinguishing whether a value is a feature or a target provided by a supervisor. Informally, unsupervised learning refers to most attempts to extract information from a distribution that do not require human labor to annotate examples. The term is usually associated with density estimation, learning to draw samples from a distribution, learning to denoise data from some distribution, finding a manifold that the data lies near, or clustering the data into groups of related examples.

A classic unsupervised learning task is to find the “best” representation of the data. By “best” we can mean different things, but generally speaking we are looking for a representation that preserves as much information about x as possible while obeying some penalty or constraint aimed at keeping the representation simpler or more accessible than x itself.

There are multiple ways of defining a simpler representation. Three of the most common include lower-dimensional representations, sparse representations, and independent representations. Low-dimensional representations attempt to compress as much information about x as possible in a smaller representation. Sparse representations (Barlow, 1989; Olshausen and Field, 1996; Hinton and Ghahramani, 1997) embed the dataset into a representation whose entries are mostly zeros for most inputs. The use of sparse representations typically requires increasing the dimensionality of the representation, so that the representation becoming mostly zeros does not discard too much information. This results in an overall structure of the representation that tends to distribute data along the axes of the representation space. Independent representations attempt to disentangle the sources of variation underlying the data distribution such that the dimensions of the representation are statistically independent.

Of course these three criteria are certainly not mutually exclusive. Low-dimensional representations often yield elements that have fewer or weaker dependencies than the original high-dimensional data. This is because one way to reduce the size of a representation is to find and remove redundancies. Identifying and removing more redundancy enables the dimensionality reduction algorithm to achieve more compression while discarding less information.

The notion of representation is one of the central themes of deep learning and therefore one of the central themes in this book. In this section, we develop some simple examples of representation learning algorithms. Together, these example algorithms show how to operationalize all three of the criteria above. Most of the remaining chapters introduce additional representation learning algorithms that develop these criteria in different ways or introduce other criteria.

## 5.8.1 Principal Components Analysis

In section 2.12, we saw that the principal components analysis algorithm provides a means of compressing data. We can also view PCA as an unsupervised learning algorithm that learns a representation of data. This representation is based on two of the criteria for a simple representation described above. PCA learns a representation that has lower dimensionality than the original input. It also learns a representation whose elements have no linear correlation with each other. This is a first step toward the criterion of learning representations whose elements are statistically independent. To achieve full independence, a representation learning algorithm must also remove the nonlinear relationships between variables.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/ec2443d8f0025b8a3920ce766c3aa60b7da13cc4ccca059e5ef697bde822d39d.jpg)

![Figure 5.8](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/fb7b310f0039b0938ae6e9afb072c145e947dece0158c7ab36d9faf498f3f16f.jpg)  
Figure 5.8: PCA learns a linear projection that aligns the direction of greatest variance with the axes of the new space. (Left)The original data consist of samples of $\pmb{x}$ . In this space, the variance might occur along directions that are not axis aligned. (Right)The transformed data $z = x^{\intercal}W$ now varies most along the axis $z_{1}$ . The direction of second-most variance is now along $z_{2}$ .

PCA learns an orthogonal, linear transformation of the data that projects an input x to a representation z as shown in figure 5.8. In section 2.12, we saw that we could learn a one-dimensional representation that best reconstructs the original data (in the sense of mean squared error) and that this representation actually corresponds to the first principal component of the data. Thus we can use PCA as a simple and effective dimensionality reduction method that preserves as much of the information in the data as possible (again, as measured by least-squares reconstruction error). In the following, we will study how the PCA representation decorrelates the original data representation X.

Let us consider the $m \times n$ design matrix X. We will assume that the data has a mean of zero, $E[x] = 0$ . If this is not the case, the data can easily be centered by subtracting the mean from all examples in a preprocessing step.

The unbiased sample covariance matrix associated with X is given by

$$
\operatorname{Var}[\pmb{x}] = \frac{1}{m - 1} \pmb{X}^{\top} \pmb{X}.\tag{5.85}
$$

PCA finds a representation (through linear transformation) $z = W^{\top}x$ , where $\operatorname{Var}[z]$ is diagonal.

In section 2.12, we saw that the principal components of a design matrix X are given by the eigenvectors of $X^{\top}X$ . From this view,

$$
\boldsymbol{X}^{\top} \boldsymbol{X} = \boldsymbol{W} \boldsymbol{\Lambda} \boldsymbol{W}^{\top}.\tag{5.86}
$$

In this section, we exploit an alternative derivation of the principal components. The principal components may also be obtained via singular value decomposition (SVD). Specifically, they are the right singular vectors of X. To see this, let W be the right singular vectors in the decomposition $X = U \Sigma W^{\top}$ . We then recover the original eigenvector equation with W as the eigenvector basis:

$$
\boldsymbol{X}^{\top} \boldsymbol{X} = \left(\boldsymbol{U} \boldsymbol{\Sigma} \boldsymbol{W}^{\top}\right)^{\top} \boldsymbol{U} \boldsymbol{\Sigma} \boldsymbol{W}^{\top} = \boldsymbol{W} \boldsymbol{\Sigma}^{2} \boldsymbol{W}^{\top}.\tag{5.87}
$$

The SVD is helpful to show that PCA results in a diagonal Var[z]. Using the SVD of X, we can express the variance of X as:

$$
\operatorname{Var}[\boldsymbol{x}] = \frac{1}{m - 1} \boldsymbol{X}^{\top} \boldsymbol{X}\tag{5.88}
$$

$$
= \frac{1}{m - 1}(\boldsymbol{U} \boldsymbol{\Sigma} \boldsymbol{W}^{\top})^{\top} \boldsymbol{U} \boldsymbol{\Sigma} \boldsymbol{W}^{\top}\tag{5.89}
$$

$$
= \frac{1}{m - 1} \boldsymbol{W} \boldsymbol{\Sigma}^{\top} \boldsymbol{U}^{\top} \boldsymbol{U} \boldsymbol{\Sigma} \boldsymbol{W}^{\top}\tag{5.90}
$$

$$
= \frac{1}{m - 1} \boldsymbol{W} \boldsymbol{\Sigma}^{2} \boldsymbol{W}^{\top},\tag{5.91}
$$

where we use the fact that $U^{\top}U = I$ because the U matrix of the singular value decomposition is defined to be orthogonal. This shows that the covariance of z is diagonal as required:

$$
\operatorname{Var}[\boldsymbol{z}] = \frac{1}{m - 1} \boldsymbol{Z}^{\top} \boldsymbol{Z}\tag{5.92}
$$

$$
= \frac{1}{m - 1} \boldsymbol{W}^{\top} \boldsymbol{X}^{\top} \boldsymbol{X} \boldsymbol{W}\tag{5.93}
$$

$$
= \frac{1}{m - 1} \boldsymbol{W}^{\top} \boldsymbol{W} \boldsymbol{\Sigma}^{2} \boldsymbol{W}^{\top} \boldsymbol{W}\tag{5.94}
$$

$$
= \frac{1}{m - 1} \pmb{\Sigma}^{2},\tag{5.95}
$$

where this time we use the fact that $W^{\top}W = I$ , again from the definition of the SVD.

The above analysis shows that when we project the data x to z, via the linear transformation W, the resulting representation has a diagonal covariance matrix (as given by $\Sigma^{2}$ ), which immediately implies that the individual elements of z are mutually uncorrelated.

This ability of PCA to transform data into a representation where the elements are mutually uncorrelated is a very important property of PCA. It is a simple example of a representation that attempts to disentangle the unknown factors of variation underlying the data. In the case of PCA, this disentangling takes the form of finding a rotation of the input space (described by W) that aligns the principal axes of variance with the basis of the new representation space associated with z.

While correlation is an important category of dependency between elements of the data, we are also interested in learning representations that disentangle more complicated forms of feature dependencies. For this, we will need more than what can be done with a simple linear transformation.

## 5.8.2 $k$ -means Clustering

Another example of a simple representation learning algorithm is k-means clustering. The k-means clustering algorithm divides the training set into k different clusters of examples that are near each other. We can thus think of the algorithm as providing a k-dimensional one-hot code vector h representing an input x. If x belongs to cluster i, then $h_{i} = 1$ , and all other entries of the representation h are zero.

The one-hot code provided by k-means clustering is an example of a sparse representation, because the majority of its entries are zero for every input. Later, we develop other algorithms that learn more flexible sparse representations, where more than one entry can be nonzero for each input x. One-hot codes are an extreme example of sparse representations that lose many of the benefits of a distributed representation. The one-hot code still confers some statistical advantages (it naturally conveys the idea that all examples in the same cluster are similar to each other), and it confers the computational advantage that the entire representation may be captured by a single integer.

The k-means algorithm works by initializing k different centroids $\{\boldsymbol{\mu}^{(1)},\ldots,\boldsymbol{\mu}^{(k)}\}$ to different values, then alternating between two different steps until convergence. In one step, each training example is assigned to cluster i, where i is the index of the nearest centroid $\boldsymbol{\mu}^{(i)}$ . In the other step, each centroid $\boldsymbol{\mu}^{(i)}$ is updated to the mean of all training examples $\boldsymbol{x}^{(j)}$ assigned to cluster i.

One difficulty pertaining to clustering is that the clustering problem is inherently ill posed, in the sense that there is no single criterion that measures how well a clustering of the data corresponds to the real world. We can measure properties of the clustering, such as the average Euclidean distance from a cluster centroid to the members of the cluster. This enables us to tell how well we are able to reconstruct the training data from the cluster assignments. We do not know how well the cluster assignments correspond to properties of the real world. Moreover, there may be many different clusterings that all correspond well to some property of the real world. We may hope to find a clustering that relates to one feature but obtain a different, equally valid clustering that is not relevant to our task. For example, suppose that we run two clustering algorithms on a dataset consisting of images of red trucks, images of red cars, images of gray trucks, and images of gray cars. If we ask each clustering algorithm to find two clusters, one algorithm may find a cluster of cars and a cluster of trucks, while another may find a cluster of red vehicles and a cluster of gray vehicles. Suppose we also run a third clustering algorithm, which is allowed to determine the number of clusters. This may assign the examples to four clusters, red cars, red trucks, gray cars, and gray trucks. This new clustering now at least captures information about both attributes, but it has lost information about similarity. Red cars are in a different cluster from gray cars, just as they are in a different cluster from gray trucks. The output of the clustering algorithm does not tell us that red cars are more similar to gray cars than they are to gray trucks. They are different from both things, and that is all we know.

These issues illustrate some of the reasons that we may prefer a distributed representation to a one-hot representation. A distributed representation could have two attributes for each vehicle—one representing its color and one representing whether it is a car or a truck. It is still not entirely clear what the optimal distributed representation is (how can the learning algorithm know whether the two attributes we are interested in are color and car-versus-truck rather than manufacturer and age?), but having many attributes reduces the burden on the algorithm to guess which single attribute we care about, and gives us the ability to measure similarity between objects in a fine-grained way by comparing many attributes instead of just testing whether one attribute matches.

## 5.9 Stochastic Gradient Descent

Nearly all of deep learning is powered by one very important algorithm: stochastic gradient descent (SGD). Stochastic gradient descent is an extension of the gradient descent algorithm introduced in section 4.3.

A recurring problem in machine learning is that large training sets are necessary for good generalization, but large training sets are also more computationally expensive.

The cost function used by a machine learning algorithm often decomposes as a sum over training examples of some per-example loss function. For example, the negative conditional log-likelihood of the training data can be written as

$$
J(\pmb{\theta}) = \mathbb{E}_{\mathbf{x}, y \sim \hat{p}_{\mathrm{data}}} L(\pmb{x}, y, \pmb{\theta}) = \frac{1}{m} \sum_{i = 1}^{m} L(\pmb{x}^{(i)}, y^{(i)}, \pmb{\theta}),\tag{5.96}
$$

where L is the per-example loss $L(\boldsymbol{x}, y, \boldsymbol{\theta}) = -\log p(y \mid \boldsymbol{x}; \boldsymbol{\theta})$ .

For these additive cost functions, gradient descent requires computing

$$
\nabla_{\boldsymbol{\theta}} J(\boldsymbol{\theta}) = \frac{1}{m} \sum_{i = 1}^{m} \nabla_{\boldsymbol{\theta}} L \left(\boldsymbol{x}^{(i)}, y^{(i)}, \boldsymbol{\theta}\right).\tag{5.97}
$$

The computational cost of this operation is $O(m)$ . As the training set size grows to billions of examples, the time to take a single gradient step becomes prohibitively long.

The insight of SGD is that the gradient is an expectation. The expectation may be approximately estimated using a small set of samples. Specifically, on each step of the algorithm, we can sample a minibatch of examples $\mathbb{B}=\{\boldsymbol{x}^{(1)},\ldots,\boldsymbol{x}^{(m^{\prime})}\}$ drawn uniformly from the training set. The minibatch size $m^{\prime}$ is typically chosen to be a relatively small number of examples, ranging from one to a few hundred. Crucially, $m^{\prime}$ is usually held fixed as the training set size m grows. We may fit a training set with billions of examples using updates computed on only a hundred examples.

The estimate of the gradient is formed as

$$
\boldsymbol{g} = \frac{1}{m^{\prime}} \nabla_{\boldsymbol{\theta}} \sum_{i = 1}^{m^{\prime}} L(\boldsymbol{x}^{(i)}, y^{(i)}, \boldsymbol{\theta})\tag{5.98}
$$

using examples from the minibatch B. The stochastic gradient descent algorithm then follows the estimated gradient downhill:

$$
\theta \leftarrow \theta - \epsilon g,\tag{5.99}
$$

where $\epsilon$ is the learning rate.

Gradient descent in general has often been regarded as slow or unreliable. In the past, the application of gradient descent to nonconvex optimization problems was regarded as foolhardy or unprincipled. Today, we know that the machine learning models described in part II work very well when trained with gradient descent. The optimization algorithm may not be guaranteed to arrive at even a local minimum in a reasonable amount of time, but it often finds a very low value of the cost function quickly enough to be useful.

Stochastic gradient descent has many important uses outside the context of deep learning. It is the main way to train large linear models on very large datasets. For a fixed model size, the cost per SGD update does not depend on the training set size m. In practice, we often use a larger model as the training set size increases, but we are not forced to do so. The number of updates required to reach convergence usually increases with training set size. However, as m approaches infinity, the model will eventually converge to its best possible test error before SGD has sampled every example in the training set. Increasing m further will not extend the amount of training time needed to reach the model's best possible test error. From this point of view, one can argue that the asymptotic cost of training a model with SGD is $O(1)$ as a function of m.

Prior to the advent of deep learning, the main way to learn nonlinear models was to use the kernel trick in combination with a linear model. Many kernel learning algorithms require constructing an $m \times m$ matrix $G_{i,j} = k(\boldsymbol{x}^{(i)}, \boldsymbol{x}^{(j)})$ . Constructing this matrix has computational cost $O(m^{2})$ , which is clearly undesirable for datasets with billions of examples. In academia, starting in 2006, deep learning was initially interesting because it was able to generalize to new examples better than competing algorithms when trained on medium-sized datasets with tens of thousands of examples. Soon after, deep learning garnered additional interest in industry because it provided a scalable way of training nonlinear models on large datasets.

Stochastic gradient descent and many enhancements to it are described further in chapter 8.

## 5.10 Building a Machine Learning Algorithm

Nearly all deep learning algorithms can be described as particular instances of a fairly simple recipe: combine a specification of a dataset, a cost function, an optimization procedure and a model.

For example, the linear regression algorithm combines a dataset consisting of $X$ and $y$ , the cost function

$$
J(\pmb{w}, b) = - \mathbb{E}_{\mathbf{x}, y \sim \hat{p}_{\mathrm{data}}} \log p_{\mathrm{model}}(y \mid \pmb{x}),\tag{5.100}
$$

the model specification $p_{\mathrm{model}}(y \mid \boldsymbol{x}) = \mathcal{N}(y; \boldsymbol{x}^{\top} \boldsymbol{w} + b, 1)$ , and, in most cases, the optimization algorithm defined by solving for where the gradient of the cost is zero using the normal equations.

By realizing that we can replace any of these components mostly independently from the others, we can obtain a wide range of algorithms.

The cost function typically includes at least one term that causes the learning process to perform statistical estimation. The most common cost function is the negative log-likelihood, so that minimizing the cost function causes maximum likelihood estimation.

The cost function may also include additional terms, such as regularization terms. For example, we can add weight decay to the linear regression cost function to obtain

$$
J(\boldsymbol{w}, b) = \lambda | | \boldsymbol{w} | |_{2}^{2} - \mathbb{E}_{\mathbf{x}, y \sim \hat{p}_{\mathrm{data}}} \log p_{\mathrm{model}}(y \mid \boldsymbol{x}).\tag{5.101}
$$

This still allows closed form optimization.

If we change the model to be nonlinear, then most cost functions can no longer be optimized in closed form. This requires us to choose an iterative numerical optimization procedure, such as gradient descent.

The recipe for constructing a learning algorithm by combining models, costs, and optimization algorithms supports both supervised and unsupervised learning. The linear regression example shows how to support supervised learning. Unsupervised learning can be supported by defining a dataset that contains only X and providing an appropriate unsupervised cost and model. For example, we can obtain the first PCA vector by specifying that our loss function is

$$
J(\pmb{w}) = \mathbb{E}_{\mathbf{x} \sim \hat{p}_{\mathrm{data}}} | | \pmb{x} - r(\pmb{x}; \pmb{w}) | |_{2}^{2}\tag{5.102}
$$

while our model is defined to have w with norm one and reconstruction function $r(\boldsymbol{x}) = \boldsymbol{w}^{\top} \boldsymbol{x} \boldsymbol{w}$ .

In some cases, the cost function may be a function that we cannot actually evaluate, for computational reasons. In these cases, we can still approximately minimize it using iterative numerical optimization, as long as we have some way of approximating its gradients.

Most machine learning algorithms make use of this recipe, though it may not be immediately obvious. If a machine learning algorithm seems especially unique or hand designed, it can usually be understood as using a special-case optimizer. Some models, such as decision trees and k-means, require special-case optimizers because their cost functions have flat regions that make them inappropriate for minimization by gradient-based optimizers. Recognizing that most machine learning algorithms can be described using this recipe helps to see the different algorithms as part of a taxonomy of methods for doing related tasks that work for similar reasons, rather than as a long list of algorithms that each have separate justifications.

## 5.11 Challenges Motivating Deep Learning

The simple machine learning algorithms described in this chapter work well on a wide variety of important problems. They have not succeeded, however, in solving the central problems in AI, such as recognizing speech or recognizing objects.

The development of deep learning was motivated in part by the failure of traditional algorithms to generalize well on such AI tasks.

This section is about how the challenge of generalizing to new examples becomes exponentially more difficult when working with high-dimensional data, and how the mechanisms used to achieve generalization in traditional machine learning are insufficient to learn complicated functions in high-dimensional spaces. Such spaces also often impose high computational costs. Deep learning was designed to overcome these and other obstacles.

## 5.11.1 The Curse of Dimensionality

Many machine learning problems become exceedingly difficult when the number of dimensions in the data is high. This phenomenon is known as the curse of dimensionality. Of particular concern is that the number of possible distinct configurations of a set of variables increases exponentially as the number of variables increases.

The curse of dimensionality arises in many places in computer science, especially in machine learning.

One challenge posed by the curse of dimensionality is a statistical challenge. As illustrated in figure 5.9, a statistical challenge arises because the number of possible configurations of x is much larger than the number of training examples. To understand the issue, let us consider that the input space is organized into a grid, as in the figure. We can describe low-dimensional space with a small number of grid cells that are mostly occupied by the data. When generalizing to a new data point, we can usually tell what to do simply by inspecting the training examples that lie in the same cell as the new input. For example, if estimating the probability density at some point x, we can just return the number of training examples in the same unit volume cell as x, divided by the total number of training examples. If we wish to classify an example, we can return the most common class of training examples in the same cell. If we are doing regression, we can average the target values observed over the examples in that cell. But what about the cells for which we have seen no example? Because in high-dimensional spaces, the number of configurations is huge, much larger than our number of examples, a typical grid cell has no training example associated with it. How could we possibly say something meaningful about these new configurations? Many traditional machine learning algorithms simply assume that the output at a new point should be approximately the same as the output at the nearest training point.

![Figure 5.9](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/1fee9736cc079286689a6f5e3c3ad11847fe4afcd50c825e7724b4bdd85c125f.jpg)  
Figure 5.9: As the number of relevant dimensions of the data increases (from left to right), the number of configurations of interest may grow exponentially. (Left)In this one-dimensional example, we have one variable for which we only care to distinguish 10 regions of interest. With enough examples falling within each of these regions (each region corresponds to a cell in the illustration), learning algorithms can easily generalize correctly. A straightforward way to generalize is to estimate the value of the target function within each region (and possibly interpolate between neighboring regions). (Center)With two dimensions, it is more difficult to distinguish 10 different values of each variable. We need to keep track of up to $10 \times 10 = 100$ regions, and we need at least that many examples to cover all those regions. (Right)With three dimensions, this grows to $10^3 = 1,000$ regions and at least that many examples. For $d$ dimensions and $v$ values to be distinguished along each axis, we seem to need $O(v^d)$ regions and examples. This is an instance of the curse of dimensionality. Figure graciously provided by Nicolas Chapados.

## 5.11.2 Local Constancy and Smoothness Regularization

To generalize well, machine learning algorithms need to be guided by prior beliefs about what kind of function they should learn. We have seen these priors incorporated as explicit beliefs in the form of probability distributions over parameters of the model. More informally, we may also discuss prior beliefs as directly influencing the function itself and influencing the parameters only indirectly, as a result of the relationship between the parameters and the function. Additionally, we informally discuss prior beliefs as being expressed implicitly by choosing algorithms that are biased toward choosing some class of functions over another, even though these biases may not be expressed (or even be possible to express) in terms of a probability distribution representing our degree of belief in various functions.

Among the most widely used of these implicit “priors” is the smoothness prior, or local constancy prior. This prior states that the function we learn should not change very much within a small region.

Many simpler algorithms rely exclusively on this prior to generalize well, and as a result, they fail to scale to the statistical challenges involved in solving AI-level tasks. Throughout this book, we describe how deep learning introduces additional (explicit and implicit) priors in order to reduce the generalization error on sophisticated tasks. Here, we explain why the smoothness prior alone is insufficient for these tasks.

There are many different ways to implicitly or explicitly express a prior belief that the learned function should be smooth or locally constant. All these different methods are designed to encourage the learning process to learn a function $f^{*}$ that satisfies the condition

$$
f^{*}(\boldsymbol{x}) \approx f^{*}(\boldsymbol{x} + \epsilon)\tag{5.103}
$$

for most configurations x and small change $\epsilon$ . In other words, if we know a good answer for an input $\epsilon$ (for example, if x is a labeled training example), then that answer is probably good in the neighborhood of x. If we have several good answers in some neighborhood, we would combine them (by some form of averaging or interpolation) to produce an answer that agrees with as many of them as much as possible.

An extreme example of the local constancy approach is the k-nearest neighbors family of learning algorithms. These predictors are literally constant over each region containing all the points x that have the same set of k nearest neighbors in the training set. For k = 1, the number of distinguishable regions cannot be more than the number of training examples.

While the k-nearest neighbors algorithm copies the output from nearby training examples, most kernel machines interpolate between training set outputs associated with nearby training examples. An important class of kernels is the family of local kernels, where $k(\boldsymbol{u}, \boldsymbol{v})$ is large when u = v and decreases as u and v grow further apart from each other. A local kernel can be thought of as a similarity function that performs template matching, by measuring how closely a test example x resembles each training example $\boldsymbol{x}^{(i)}$ . Much of the modern motivation for deep learning is derived from studying the limitations of local template matching and how deep models are able to succeed in cases where local template matching fails (Bengio et al., 2006b).

Decision trees also suffer from the limitations of exclusively smoothness-based learning, because they break the input space into as many regions as there are leaves and use a separate parameter (or sometimes many parameters for extensions of decision trees) in each region. If the target function requires a tree with at least n leaves to be represented accurately, then at least n training examples are required to fit the tree. A multiple of n is needed to achieve some level of statistical confidence in the predicted output.

In general, to distinguish $O(k)$ regions in input space, all these methods require $O(k)$ examples. Typically there are $O(k)$ parameters, with $O(1)$ parameters associated with each of the $O(k)$ regions. The nearest neighbor scenario, in which each training example can be used to define at most one region, is illustrated in figure 5.10.

Is there a way to represent a complex function that has many more regions to be distinguished than the number of training examples? Clearly, assuming only smoothness of the underlying function will not allow a learner to do that. For example, imagine that the target function is a kind of checkerboard. A checkerboard contains many variations, but there is a simple structure to them. Imagine what happens when the number of training examples is substantially smaller than the number of black and white squares on the checkerboard. Based on only local generalization and the smoothness or local constancy prior, the learner would be guaranteed to correctly guess the color of a new point if it lay within the same checkerboard square as a training example. There is no guarantee, however, that the learner could correctly extend the checkerboard pattern to points lying in squares that do not contain training examples. With this prior alone, the only information that an example tells us is the color of its square, and the only way to get the colors of the entire checkerboard right is to cover each of its cells with at least one example.

![Figure 5.10](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/11e24c7b434f006eae0a8ab79de02029c7d4cde297460d9e2bc5984fed5b0e93.jpg)  
Figure 5.10: Illustration of how the nearest neighbor algorithm breaks up the input space into regions. An example (represented here by a circle) within each region defines the region boundary (represented here by the lines). The y value associated with each example defines what the output should be for all points within the corresponding region. The regions defined by nearest neighbor matching form a geometric pattern called a Voronoi diagram. The number of these contiguous regions cannot grow faster than the number of training examples. While this figure illustrates the behavior of the nearest neighbor algorithm specifically, other machine learning algorithms that rely exclusively on the local smoothness prior for generalization exhibit similar behaviors: each training example only informs the learner about how to generalize in some neighborhood immediately surrounding that example.

The smoothness assumption and the associated nonparametric learning algorithms work extremely well as long as there are enough examples for the learning algorithm to observe high points on most peaks and low points on most valleys of the true underlying function to be learned. This is generally true when the function to be learned is smooth enough and varies in few enough dimensions. In high dimensions, even a very smooth function can change smoothly but in a different way along each dimension. If the function additionally behaves differently in various regions, it can become extremely complicated to describe with a set of training examples. If the function is complicated (we want to distinguish a huge number of regions compared to the number of examples), is there any hope to generalize well?

The answer to both of these questions—whether it is possible to represent a complicated function efficiently, and whether it is possible for the estimated function to generalize well to new inputs—is yes. The key insight is that a very large number of regions, such as $O(2^{k})$ , can be defined with $O(k)$ examples, so long as we introduce some dependencies between the regions through additional assumptions about the underlying data-generating distribution. In this way, we can actually generalize nonlocally (Bengio and Monperrus, 2005; Bengio et al., 2006c). Many different deep learning algorithms provide implicit or explicit assumptions that are reasonable for a broad range of AI tasks in order to capture these advantages.

Other approaches to machine learning often make stronger, task-specific assumptions. For example, we could easily solve the checkerboard task by providing the assumption that the target function is periodic. Usually we do not include such strong, task-specific assumptions in neural networks so that they can generalize to a much wider variety of structures. AI tasks have structure that is much too complex to be limited to simple, manually specified properties such as periodicity, so we want learning algorithms that embody more general-purpose assumptions. The core idea in deep learning is that we assume that the data was generated by the composition of factors, or features, potentially at multiple levels in a hierarchy. Many other similarly generic assumptions can further improve deep learning algorithms. These apparently mild assumptions allow an exponential gain in the relationship between the number of examples and the number of regions that can be distinguished. We describe these exponential gains more precisely in sections 6.4.1, 15.4 and 15.5. The exponential advantages conferred by the use of deep distributed representations counter the exponential challenges posed by the curse of dimensionality.

## 5.11.3 Manifold Learning

An important concept underlying many ideas in machine learning is that of a manifold.

A manifold is a connected region. Mathematically, it is a set of points associated with a neighborhood around each point. From any given point, the manifold locally appears to be a Euclidean space. In everyday life, we experience the surface of the world as a 2-D plane, but it is in fact a spherical manifold in 3-D space.

The concept of a neighborhood surrounding each point implies the existence of transformations that can be applied to move on the manifold from one position to a neighboring one. In the example of the world's surface as a manifold, one can walk north, south, east, or west.

Although there is a formal mathematical meaning to the term “manifold,” in machine learning it tends to be used more loosely to designate a connected set of points that can be approximated well by considering only a small number of degrees of freedom, or dimensions, embedded in a higher-dimensional space. Each dimension corresponds to a local direction of variation. See figure 5.11 for an example of training data lying near a one-dimensional manifold embedded in two-dimensional space. In the context of machine learning, we allow the dimensionality of the manifold to vary from one point to another. This often happens when a manifold intersects itself. For example, a figure eight is a manifold that has a single dimension in most places but two dimensions at the intersection at the center.

Many machine learning problems seem hopeless if we expect the machine learning algorithm to learn functions with interesting variations across all of $\mathbb{R}^{n}$ . Manifold learning algorithms surmount this obstacle by assuming that most of $\mathbb{R}^{n}$ consists of invalid inputs, and that interesting inputs occur only along a collection of manifolds containing a small subset of points, with interesting variations in the output of the learned function occurring only along directions that lie on the manifold, or with interesting variations happening only when we move from one manifold to another. Manifold learning was introduced in the case of continuous-valued data and in the unsupervised learning setting, although this probability concentration idea can be generalized to both discrete data and the supervised learning setting: the key assumption remains that probability mass is highly concentrated.

![Figure 5.11](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/03766773576781e80844669346aaa14a0b862d2c4c244f840ebba82c7e93ff03.jpg)  
Figure 5.11: Data sampled from a distribution in a two-dimensional space that is actually concentrated near a one-dimensional manifold, like a twisted string. The solid line indicates the underlying manifold that the learner should infer.

The assumption that the data lies along a low-dimensional manifold may not always be correct or useful. We argue that in the context of AI tasks, such as those that involve processing images, sounds, or text, the manifold assumption is at least approximately correct. The evidence in favor of this assumption consists of two categories of observations.

The first observation in favor of the manifold hypothesis is that the probability distribution over images, text strings, and sounds that occur in real life is highly concentrated. Uniform noise essentially never resembles structured inputs from these domains. Figure 5.12 shows how, instead, uniformly sampled points look like the patterns of static that appear on analog television sets when no signal is available. Similarly, if you generate a document by picking letters uniformly at random, what is the probability that you will get a meaningful English-language text? Almost zero, again, because most of the long sequences of letters do not correspond to a natural language sequence: the distribution of natural language sequences occupies a very little volume in the total space of sequences of letters.

Of course, concentrated probability distributions are not sufficient to show that the data lies on a reasonably small number of manifolds. We must also establish that the examples we encounter are connected to each other by other examples, with each example surrounded by other highly similar examples that can be reached by applying transformations to traverse the manifold. The second argument in favor of the manifold hypothesis is that we can imagine such neighborhoods and transformations, at least informally. In the case of images, we can certainly think of many possible transformations that allow us to trace out a manifold in image space: we can gradually dim or brighten the lights, gradually move or rotate objects in the image, gradually alter the colors on the surfaces of objects, and so forth. Multiple manifolds are likely involved in most applications. For example, the manifold of human face images may not be connected to the manifold of cat face images.

![Figure 5.12](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/08e0369ac2f96cf379f7cd2cda45fe83a1ffdf1d322cd555fb096ee76cd97dde.jpg)  
Figure 5.12: Sampling images uniformly at random (by randomly picking each pixel according to a uniform distribution) gives rise to noisy images. Although there is a nonzero probability of generating an image of a face or of any other object frequently encountered in AI applications, we never actually observe this happening in practice. This suggests that the images encountered in AI applications occupy a negligible proportion of the volume of image space.

These thought experiments convey some intuitive reasons supporting the manifold hypothesis. More rigorous experiments (Cayton, 2005; Narayanan and Mitter, 2010; Schölkopf et al., 1998; Roweis and Saul, 2000; Tenenbaum et al., 2000; Brand, 2003; Belkin and Niyogi, 2003; Donoho and Grimes, 2003; Weinberger and Saul, 2004) clearly support the hypothesis for a large class of datasets of interest in AI.

When the data lies on a low-dimensional manifold, it can be most natural for machine learning algorithms to represent the data in terms of coordinates on the manifold, rather than in terms of coordinates in $\mathbb{R}^{n}$ . In everyday life, we can think of roads as 1-D manifolds embedded in 3-D space. We give directions to specific addresses in terms of address numbers along these 1-D roads, not in terms of coordinates in 3-D space. Extracting these manifold coordinates is challenging but holds the promise of improving many machine learning algorithms. This general principle is applied in many contexts. Figure 5.13 shows the manifold structure of a dataset consisting of faces. By the end of this book, we will have developed the methods necessary to learn such a manifold structure. In figure 20.6, we will see how a machine learning algorithm can successfully accomplish this goal.

This concludes part I, which has provided the basic concepts in mathematics and machine learning that are employed throughout the remaining parts of the book. You are now prepared to embark on your study of deep learning.

![Figure 5.13](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/3818091911be57549f07ef15a55dc381ffd024c829b83480a03c1e4ec34445ca.jpg)  
Figure 5.13: Training examples from the QMUL Multiview Face Dataset (Gong et al., 2000), for which the subjects were asked to move in such a way as to cover the two-dimensional manifold corresponding to two angles of rotation. We would like learning algorithms to be able to discover and disentangle such manifold coordinates. Figure 20.6 illustrates such a feat.

II

Deep Networks: Modern Practices

This part of the book summarizes the state of modern deep learning as it is used to solve practical applications.

Deep learning has a long history and many aspirations. Several proposed approaches have yet to entirely bear fruit. Several ambitious goals have yet to be realized. These less-developed branches of deep learning appear in the final part of the book.

This part focuses only on those approaches that are essentially working technologies that are already used heavily in industry.

Modern deep learning provides a powerful framework for supervised learning. By adding more layers and more units within a layer, a deep network can represent functions of increasing complexity. Most tasks that consist of mapping an input vector to an output vector, and that are easy for a person to do rapidly, can be accomplished via deep learning, given sufficiently large models and sufficiently large datasets of labeled training examples. Other tasks, that cannot be described as associating one vector to another, or that are difficult enough that a person would require time to think and reflect in order to accomplish the task, remain beyond the scope of deep learning for now.

This part of the book describes the core parametric function approximation technology that is behind nearly all modern practical applications of deep learning. We begin by describing the feedforward deep network model that is used to represent these functions. Next, we present advanced techniques for regularization and optimization of such models. Scaling these models to large inputs such as high-resolution images or long temporal sequences requires specialization. We introduce the convolutional network for scaling to large images and the recurrent neural network for processing temporal sequences. Finally, we present general guidelines for the practical methodology involved in designing, building, and configuring an application involving deep learning and review some of its applications.

These chapters are the most important for a practitioner—someone who wants to begin implementing and using deep learning algorithms to solve real-world problems today.


---
title: "Chapter 5 \u2014 Logistic Regression"
book: "Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models"
book_slug: speech-language-processing
course: natural-language-processing
chapter_number: 5
citekey: jurafsky2026slp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf"
source_transcript: "transcripts/mineru/speech-language-processing/reading.md"
source_line_start: 2410
source_line_end: 3009
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 7
source_empty_image_alt: 7
non_semantic_image_alt: 3
caption_derived_image_alt: 4
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

# Chapter 5 — Logistic Regression

> [[../README|本书目录]] · [[04-chapter-4-naive-bayes-and-sentiment-classification|上一章]] · [[06-chapter-6-vector-semantics-and-embeddings|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models（jurafsky2026slp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/speech-language-processing/reading.md)，源行 2410–3009。
> - 本章保留 7 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Logistic Regression

“And how do you know that these fine begonias are not of equal importance?” Hercule Poirot, in Agatha Christie’s The Mysterious Affair at Styles

Detective stories are as littered with clues as texts are with words. Yet for the poor reader it can be challenging to know how to weigh the author’s clues in order to make the crucial classification task: deciding whodunnit.

In this chapter we introduce an algorithm that is admirably suited for discovering the link between features or cues and some particular outcome: logistic regression. Indeed, logistic regression is one of the most important analytic tools in the social and natural sciences. In natural language processing, logistic regression is the baseline supervised machine learning algorithm for classification, and also has a very close relationship with neural networks. As we will see in Chapter 7, a neural network can be viewed as a series of logistic regression classifiers stacked on top of each other. Thus the classification and machine learning techniques introduced here will play an important role throughout the book.

Logistic regression can be used to classify an observation into one of two classes (like ‘positive sentiment’ and ‘negative sentiment’), or into one of many classes. Because the mathematics for the two-class case is simpler, we’ll describe this special case of logistic regression first in the next few sections, and then briefly summarize the use of multinomial logistic regression for more than two classes in Section 5.6.

We’ll introduce the mathematics of logistic regression in the next few sections. But let’s begin with some high-level issues.

Generative and Discriminative Classifiers: The most important difference between naive Bayes and logistic regression is that logistic regression is a discriminative classifier while naive Bayes is a generative classifier.

These are two very different frameworks for how to build a machine learning model. Consider a visual metaphor: imagine we’re trying to distinguish dog images from cat images. A generative model would have the goal of understanding what dogs look like and what cats look like. You might literally ask such a model to ‘generate’, i.e., draw, a dog. Given a test

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/2e7b9f0240ce35c3ebedf7d63328087cf9c8a17b5312cb4b60bc2565a7da3603.jpg)

image, the system then asks whether it’s the cat model or the dog model that better fits (is less surprised by) the image, and chooses that as its label.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/fb2b3273867074ef03bf88de65db4edac4cf0517accaa4966dcee645f399ad5d.jpg)

A discriminative model, by contrast, is only trying to learn to distinguish the classes (perhaps without learning much about them). So maybe all the dogs in the training data are wearing collars and the cats aren’t. If that one feature neatly separates the classes, the model is satisfied. If you ask such a model what it knows about cats all it can say is that they don’t wear collars.

More formally, recall that the naive Bayes assigns a class c to a document d not by directly computing $P(c | d)$ but by computing a likelihood and a prior

$$
\hat{c} = \underset{c \in C}{\operatorname{argmax}} \overbrace{P(d | c)}^{\text{likelihood}} \overbrace{P(c)}^{\text{prior}}\tag{5.1}
$$

A generative model like naive Bayes makes use of this likelihood term, which expresses how to generate the features of a document $if$ we knew it was of class c.

By contrast a discriminative model in this text categorization scenario attempts to directly compute $P(c | d)$ . Perhaps it will learn to assign a high weight to document features that directly improve its ability to discriminate between possible classes, even if it couldn’t generate an example of one of the classes.

Components of a probabilistic machine learning classifier: Like naive Bayes, logistic regression is a probabilistic classifier that makes use of supervised machine learning. Machine learning classifiers require a training corpus of m input/output pairs $(\mathbf{\bar{\boldsymbol{x}}^{(i)}}, \mathbf{\boldsymbol{y}}^{(i)})$ . (We’ll use superscripts in parentheses to refer to individual instances in the training set—for sentiment classification each instance might be an individual document to be classified). A machine learning system for classification then has four components:

1. A feature representation of the input. For each input observation $x^{(i)}$ , this will be a vector of features $\left[x_{1}, x_{2},..., x_{n} \right]$ . We will generally refer to feature i for input $x^{(j)}$ as $x_{i}^{(j)}$ , sometimes simplified as $x_{i}$ , but we will also see the notation $f_{i}, f_{i}(x)$ , or, for multiclass classification, $f_{i}(c, x)$

2. A classification function that computes ${\hat{y}},$ the estimated class, via $p(y | x)$ . In the next section we will introduce the sigmoid and softmax tools for classification.

3. An objective function for learning, usually involving minimizing error on training examples. We will introduce the cross-entropy loss function.

4. An algorithm for optimizing the objective function. We introduce the stochastic gradient descent algorithm.

Logistic regression has two phases:

training: we train the system (specifically the weights w and b) using stochastic gradient descent and the cross-entropy loss.

test: Given a test example x we compute $p(y | x)$ and return the higher probability label $y = 1 \ \mathrm{or} \y = 0$

## 5.1 Classification: the sigmoid

The goal of binary logistic regression is to train a classifier that can make a binary decision about the class of a new input observation. Here we introduce the sigmoid classifier that will help us make this decision.

Consider a single input observation x, which we will represent by a vector of features $\left[x_{1}, x_{2},..., x_{n} \right]$ (we’ll show sample features in the next subsection). The classifier output y can be 1 (meaning the observation is a member of the class) or 0 (the observation is not a member of the class). We want to know the probability $P(y = 1 | x)$ that this observation is a member of the class. So perhaps the decision is “positive sentiment” versus “negative sentiment”, the features represent counts of words in a document, $P(y = 1 | x)$ is the probability that the document has positive sentiment, and $P(y = 0 | x)$ is the probability that the document has negative sentiment.

Logistic regression solves this task by learning, from a training set, a vector of weights and a bias term. Each weight w<sub>i</sub> is a real number, and is associated with one of the input features x<sub>i</sub>. The weight w<sub>i</sub> represents how important that input feature is to the classification decision, and can be positive (providing evidence that the instance being classified belongs in the positive class) or negative (providing evidence that the instance being classified belongs in the negative class). Thus we might expect in a sentiment task the word awesome to have a high positive weight, and abysmal to have a very negative weight. The bias term, also called the intercept, is another real number that’s added to the weighted inputs.

To make a decision on a test instance— after we’ve learned the weights in training— the classifier first multiplies each $x_{i}$ by its weight $w_{i},$ sums up the weighted features, and adds the bias term b. The resulting single number z expresses the weighted sum of the evidence for the class.

$$
z = \left(\sum_{i = 1}^{n} w_{i} x_{i}\right) + b\tag{5.2}
$$

In the rest of the book we’ll represent such sums using the dot product notation from linear algebra. The dot product of two vectors a and $^{b,}$ written as a b is the sum of the products of the corresponding elements of each vector. Thus the following is an equivalent formation to Eq. 5.2:

$$
z = w \cdot x + b\tag{5.3}
$$

But note that nothing in Eq. 5.3 forces z to be a legal probability, that is, to lie between 0 and 1. In fact, since weights are real-valued, the output might even be negative; z ranges from ∞ to ∞.

![Figure 5.1](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/0d9b7831bd9425981d458aa1a5f456386658adffa66d0a75a16b57b95e6d2160.jpg)  
Figure 5.1 The sigmoid function $\begin{array}{r}{y = \frac{1}{1 + e^{- z}}} \end{array}$ takes a real value and maps it to the range [0, 1]. It is nearly linear around 0 but outlier values get squashed toward 0 or 1.

To create a probability, we’ll pass z through the sigmoid function, $\sigma(z)$ . The sigmoid function (named because it looks like an s) is also called the logistic function, and gives logistic regression its name. The sigmoid has the following equation, shown graphically in Fig. 5.1:

$$
y = \sigma(z) = \frac{1}{1 + e^{- z}} = \frac{1}{1 + \exp(- z)}\tag{5.4}
$$

(For the rest of the book, we’ll use the notation exp(x) to mean $e^{x}.)$ The sigmoid has a number of advantages; it takes a real-valued number and maps it into the range [0, 1], which is just what we want for a probability. Because it is nearly linear around 0 but flattens toward the ends, it tends to squash outlier values toward 0 or 1. And it’s differentiable, which as we’ll see in Section 5.8 will be handy for learning.

We’re almost there. If we apply the sigmoid to the sum of the weighted features, we get a number between 0 and 1. To make it a probability, we just need to make sure that the two cases, $p(y = 1)$ and $p(y = 0)$ ), sum to 1. We can do this as follows:

$$
\begin{array}{rcl} P(y = 1) & = & \sigma(w \cdot x + b) \\ & = & \frac{1}{1 + \exp(-(w \cdot x + b))} \end{array}
$$

$$
\begin{array}{rcl} P(y = 0) & = & 1 - \sigma(w \cdot x + b) \\ & = & 1 - \frac{1}{1 + \exp(-(w \cdot x + b))} \\ & = & \frac{\exp(-(w \cdot x + b))}{1 + \exp(-(w \cdot x + b))} \end{array}\tag{5.5}
$$

The sigmoid function has the property

$$
1 - \sigma(x) = \sigma(- x)\tag{5.6}
$$

so we could also have expressed $P(y = 0)$ as $\sigma(-(w \cdot x + b))$

Now we have an algorithm that given an instance x computes the probability $P(y = 1 | x)$ . How do we make a decision? For a test instance x, we say yes if the probability $P(y = 1 | x)$ is more than .5, and no otherwise. We call .5 the decision boundary:

$$
\hat{y} = \left\{\begin{array}{ll} 1 & \text{if} P(y = 1 | x) > 0.5 \\ 0 & \text{otherwise} \end{array} \right.
$$

## 5.1.1 Example: sentiment classification

Let’s have an example. Suppose we are doing binary sentiment classification on movie review text, and we would like to know whether to assign the sentiment class + or to a review document doc. We’ll represent each input observation by the 6 features $x_{1}...x_{6}$ of the input shown in the following table; Fig. 5.2 shows the features in a sample mini test document.

<table><tr><td>Var</td><td>Definition</td><td>Value in Fig. 5.2</td></tr><tr><td> $x_{1}$ </td><td>count(positive lexicon) ∈ doc)</td><td>3</td></tr><tr><td> $x_{2}$ </td><td>count(negative lexicon) ∈ doc)</td><td>2</td></tr><tr><td> $x_{3}$ </td><td> $\left\{\begin{array}{ll} 1 & \text{if “no” \in doc} \\ 0 & \text{otherwise} \end{array} \right.$ </td><td>1</td></tr><tr><td> $x_{4}$ </td><td>count(1st and 2nd pronouns ∈ doc)</td><td>3</td></tr><tr><td> $x_{5}$ </td><td> $\left\{\begin{array}{ll} 1 & \text{if “!” \in doc} \\ 0 & \text{otherwise} \end{array} \right.$ </td><td>0</td></tr><tr><td> $x_{6}$ </td><td>log(word count of doc)</td><td>ln(66) = 4.19</td></tr></table>

Let’s assume for the moment that $\mathbf{we}^{\prime} \mathbf{ve}$ already learned a real-valued weight for each of these features, and that the 6 weights corresponding to the 6 features are $[2.5, - 5.0, - 1.2, 0.5, 2.0, 0.7]$ , while $b = 0.1$ . (We’ll discuss in the next section how the weights are learned.) The weight w<sub>1</sub>, for example indicates how important a feature the number of positive lexicon words (great, nice, enjoyable, etc.) is to a positive sentiment decision, while $w_{2}$ tells us the importance of negative lexicon words. Note that $w_{1} = 2.5$ is positive, while $w_{2} = - 5.0$ , meaning that negative words are negatively associated with a positive sentiment decision, and are about twice as important as positive words.

![Figure 5.2](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/c6fa632c872d01448babf03a2dc4434e5b20d42f8893d35ed5b9a3426300c82d.jpg)  
Figure 5.2 A sample mini test document showing the extracted features in the vector x.

Given these 6 features and the input review x, $P(+ | x)$ and $P(- | x)$ can be computed using Eq. 5.5:

$$
\begin{array}{rcl} p(+ | x) = P(Y = 1 | x) & = & \sigma(w \cdot x + b) \\ & = & \sigma([2.5, - 5.0, - 1.2, 0.5, 2.0, 0.7] \cdot[3, 2, 1, 3, 0, 4.19] \\ & = & \sigma(.833) \\ & = & 0.70 \\ p(- | x) = P(Y = 0 | x) & = & 1 - \sigma(w \cdot x + b) \\ & = & 0.30 \end{array}\tag{+0.1}
$$

(5.7)

Logistic regression is commonly applied to all sorts of NLP tasks, and any property of the input can be a feature. Consider the task of period disambiguation: deciding if a period is the end of a sentence or part of a word, by classifying each period into one of two classes EOS (end-of-sentence) and not-EOS. We might use features like $x_{1}$ below expressing that the current word is lower case and the class is EOS (perhaps with a positive weight), or that the current word is in our abbreviations dictionary (“Prof.”) and the class is EOS (perhaps with a negative weight). A feature can also express a quite complex combination of properties. For example a period following an upper case word is likely to be an EOS, but if the word itself is St. and the previous word is capitalized, then the period is likely part of a shortening of the word street.

$$
\begin{array}{l} x_{1} = \left\{\begin{array}{ll} 1 & \text{if ``Case(w_{i}) = Lower''} \\ 0 & \text{otherwise} \end{array} \right.\\ x_{2} = \left\{\begin{array}{ll} 1 & \text{if ``w_{i} \in AcronymDict''} \\ 0 & \text{otherwise} \end{array} \right.\\ x_{3} = \left\{\begin{array}{ll} 1 & \text{if ``w_{i} = St.~\&~Case(w_{i-1}) = Cap''} \\ 0 & \text{otherwise} \end{array} \right.\end{array}
$$

Designing features: Features are generally designed by examining the training set with an eye to linguistic intuitions and the linguistic literature on the domain. A careful error analysis on the training set or devset of an early version of a system often provides insights into features.

For some tasks it is especially helpful to build complex features that are combinations of more primitive features. We saw such a feature for period disambiguation above, where a period on the word St. was less likely to be the end of the sentence if the previous word was capitalized. For logistic regression and naive Bayes these combination features or feature interactions have to be designed by hand.

For many tasks (especially when feature values can reference specific words) we’ll need large numbers of features. Often these are created automatically via feature templates, abstract specifications of features. For example a bigram template for period disambiguation might create a feature for every pair of words that occurs before a period in the training set. Thus the feature space is sparse, since we only have to create a feature if that n-gram exists in that position in the training set. The feature is generally created as a hash from the string descriptions. A user description of a feature as, “bigram(American breakfast)” is hashed into a unique integer i that becomes the feature number $f_{i}.$

In order to avoid the extensive human effort of feature design, recent research in NLP has focused on representation learning: ways to learn features automatically in an unsupervised way from the input. We’ll introduce methods for representation learning in Chapter 6 and Chapter 7.

Choosing a classifier Logistic regression has a number of advantages over naive Bayes. Naive Bayes has overly strong conditional independence assumptions. Consider two features which are strongly correlated; in fact, imagine that we just add the same feature $f_{1}$ twice. Naive Bayes will treat both copies of $f_{1}$ as if they were separate, multiplying them both in, overestimating the evidence. By contrast, logistic regression is much more robust to correlated features; if two features $f_{1}$ and $f_{2}$ are perfectly correlated, regression will simply assign part of the weight to w<sub>1</sub> and part to w<sub>2</sub>. Thus when there are many correlated features, logistic regression will assign a more accurate probability than naive Bayes. So logistic regression generally works better on larger documents or datasets and is a common default.

Despite the less accurate probabilities, naive Bayes still often makes the correct classification decision. Furthermore, naive Bayes can work extremely well (sometimes even better than logistic regression) on very small datasets (Ng and Jordan, 2002) or short documents (Wang and Manning, 2012). Furthermore, naive Bayes is easy to implement and very fast to train (there’s no optimization step). So it’s still a reasonable approach to use in some situations.

## 5.2 Learning in Logistic Regression

How are the parameters of the model, the weights w and bias $^{b,}$ learned? Logistic regression is an instance of supervised classification in which we know the correct label y (either 0 or 1) for each observation x. What the system produces via Eq. 5.5 is ${\hat{y}},$ the system’s estimate of the true y. We want to learn parameters (meaning w and b) that make $\hat{y}$ for each training observation as close as possible to the true y.

This requires two components that we foreshadowed in the introduction to the chapter. The first is a metric for how close the current label ( ˆy) is to the true gold label y. Rather than measure similarity, we usually talk about the opposite of this: the distance between the system output and the gold output, and we call this distance the loss function or the cost function. In the next section we’ll introduce the loss function that is commonly used for logistic regression and also for neural networks,

the cross-entropy loss.

The second thing we need is an optimization algorithm for iteratively updating the weights so as to minimize this loss function. The standard algorithm for this is gradient descent; we’ll introduce the stochastic gradient descent algorithm in the following section.

## 5.3 The cross-entropy loss function

We need a loss function that expresses, for an observation x, how close the classifier output $({\hat{y}} = \sigma(w \cdot x + b))$ is to the correct output (y, which is 0 or 1). We’ll call this:

$$
L(\hat{y}, y) = \text{How much} \hat{y} \text{differs from the true} y\tag{5.8}
$$

We do this via a loss function that prefers the correct class labels of the training examples to be more $likely$ . This is called conditional maximum likelihood estimation: we choose the parameters w, b that maximize the log probability of the true y labels in the training data given the observations x. The resulting loss function is the negative log likelihood loss, generally called the cross-entropy loss.

Let’s derive this loss function, applied to a single observation x. We’d like to learn weights that maximize the probability of the correct label $p(y | x)$ . Since there are only two discrete outcomes (1 or 0), this is a Bernoulli distribution, and we can express the probability $p(y | x)$ that our classifier produces for one observation as the following (keeping in mind that if $\scriptstyle{y = 1}$ , Eq. 5.9 simplifies to ˆy; if $\scriptstyle { \mathsf { y } } = 0 $ , Eq. 5.9 simplifies to $1 - \hat{y})$

$$
p(y | x) = \hat{y}^{y}(1 - \hat{y})^{1 - y}\tag{5.9}
$$

Now we take the log of both sides. This will turn out to be handy mathematically, and doesn’t hurt us; whatever values maximize a probability will also maximize the log of the probability:

$$
\begin{array}{rcl} \log p(y | x) & = & \log \left[\hat{y}^{y}(1 - \hat{y})^{1 - y} \right] \\ & = & y \log \hat{y} +(1 - y) \log(1 - \hat{y}) \end{array}\tag{5.10}
$$

Eq. 5.10 describes a log likelihood that should be maximized. In order to turn this into loss function (something that we need to minimize), we’ll just flip the sign on Eq. 5.10. The result is the cross-entropy loss $L_{\mathrm{CE}}$

$$
L_{\mathrm{CE}}(\hat{y}, y) = - \log p(y | x) = -[y \log \hat{y} +(1 - y) \log(1 - \hat{y})]\tag{5.11}
$$

Finally, we can plug in the definition of ${\hat{y}} = \sigma(w \cdot x + b)$

$$
L_{\mathrm{CE}}(\hat{y}, y) = - \left[y \log \sigma(w \cdot x + b) +(1 - y) \log(1 - \sigma(w \cdot x + b)) \right]\tag{5.12}
$$

Let’s see if this loss function does the right thing for our example from Fig. 5.2. We want the loss to be smaller if the model’s estimate is close to correct, and bigger if the model is confused. So first let’s suppose the correct gold label for the sentiment example in Fig. 5.2 is positive, i.e., y = 1. In this case our model is doing well, since from Eq. 5.7 it indeed gave the example a higher probability of being positive (.69) than negative (.31). If we plug $\sigma(w \cdot x + b) =.69$ and $y = 1$ into Eq. 5.12, the right side of the equation drops out, leading to the following loss (we’ll use log to mean natural log when the base is not specified):

$$
\begin{array}{rlr} L_{\mathrm{CE}}(\hat{y}, y) = & & -[y \log \sigma(w \cdot x + b) +(1 - y) \log(1 - \sigma(w \cdot x + b))] \\ = & & -[\log \sigma(w \cdot x + b)] \\ = & & - \log(.69) \\ = & &.37 \end{array}
$$

By contrast, let’s pretend instead that the example in Fig. 5.2 was actually negative, i.e., $y = 0$ (perhaps the reviewer went on to say “But bottom line, the movie is terrible! I beg you not to see it!”). In this case our model is confused and we’d want the loss to be higher. Now if we plug $y = 0$ and $1 - \sigma(w \cdot x + b) =.31$ from Eq. 5.7 into Eq. 5.12, the left side of the equation drops out:

$$
\begin{array}{rlr} L_{\mathrm{CE}}(\hat{y}, y) = & -[y \log \sigma(w \cdot x + b) +(1 - y) \log(1 - \sigma(w \cdot x + b))] \\ = & -[\log(1 - \sigma(w \cdot x + b))] \\ = & - \log(.31) \\ = & 1.17 \end{array}
$$

Sure enough, the loss for the first classifier (.37) is less than the loss for the second classifier (1.17).

Why does minimizing this negative log probability do what we want? A perfect classifier would assign probability 1 to the correct outcome $(y{=} 1 ~ \mathrm{or} ~ y{=} 0)$ and probability 0 to the incorrect outcome. That means the higher ˆy (the closer it is to 1), the better the classifier; the lower ˆy is (the closer it is to 0), the worse the classifier. The negative log of this probability is a convenient loss metric since it goes from 0 (negative log of 1, no loss) to infinity (negative log of 0, infinite loss). This loss function also ensures that as the probability of the correct answer is maximized, the probability of the incorrect answer is minimized; since the two sum to one, any increase in the probability of the correct answer is coming at the expense of the incorrect answer. It’s called the cross-entropy loss, because Eq. 5.10 is also the formula for the cross-entropy between the true probability distribution y and our estimated distribution ˆy.

Now we know what we want to minimize; in the next section, we’ll see how to find the minimum.

## 5.4 Gradient Descent

Our goal with gradient descent is to find the optimal weights: minimize the loss function we’ve defined for the model. In Eq. 5.13 below, we’ll explicitly represent the fact that the loss function L is parameterized by the weights, which we’ll refer to in machine learning in general as θ (in the case of logistic regression $\theta = w, b)$ . So the goal is to find the set of weights which minimizes the loss function, averaged over all examples:

$$
\hat{\theta} = \underset{\theta}{\operatorname{argmin}} \frac{1}{m} \sum_{i = 1}^{m} L_{\mathrm{CE}}(f(x^{(i)}; \theta), y^{(i)})\tag{5.13}
$$

How shall we find the minimum of this (or any) loss function? Gradient descent is a method that finds a minimum of a function by figuring out in which direction (in the space of the parameters θ ) the function’s slope is rising the most steeply, and moving in the opposite direction. The intuition is that if you are hiking in a canyon and trying to descend most quickly down to the river at the bottom, you might look around yourself 360 degrees, find the direction where the ground is sloping the steepest, and walk downhill in that direction.

For logistic regression, this loss function is conveniently convex. A convex function has just one minimum; there are no local minima to get stuck in, so gradient descent starting from any point is guaranteed to find the minimum. (By contrast, the loss for multi-layer neural networks is non-convex, and gradient descent may get stuck in local minima for neural network training and never find the global optimum.)

Although the algorithm (and the concept of gradient) are designed for direction vectors, let’s first consider a visualization of the case where the parameter of our system is just a single scalar w, shown in Fig. 5.3.

Given a random initialization of w at some value $w^{1}$ , and assuming the loss function L happened to have the shape in Fig. 5.3, we need the algorithm to tell us whether at the next iteration we should move left (making $w^{2}$ smaller than $w^{1})$ or right (making $w^{2}$ bigger than $w^{1})$ to reach the minimum.

![Figure 5.3](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/3d259060c427070b07b73de5ee5c2c3e9084537baea987aceef285d0b5d030d9.jpg)  
Figure 5.3 The first step in iteratively finding the minimum of this loss function, by moving w in the reverse direction from the slope of the function. Since the slope is negative, we need to move w in a positive direction, to the right. Here superscripts are used for learning steps, so $w^{1}$ means the initial value of w (which is $0), w^{2}$ at the second step, and so on.

The gradient descent algorithm answers this question by finding the gradient of the loss function at the current point and moving in the opposite direction. The gradient of a function of many variables is a vector pointing in the direction of the greatest increase in a function. The gradient is a multi-variable generalization of the slope, so for a function of one variable like the one in Fig. 5.3, we can informally think of the gradient as the slope. The dotted line in Fig. 5.3 shows the slope of this hypothetical loss function at point $w = w^{1}$ . You can see that the slope of this dotted line is negative. Thus to find the minimum, gradient descent tells us to go in the opposite direction: moving w in a positive direction.

The magnitude of the amount to move in gradient descent is the value of the slope $\textstyle{\frac{d}{dw}} f(x; w)$ weighted by a learning rate η. A higher (faster) learning rate means that we should move w more on each step. The change we make in our parameter is the learning rate times the gradient (or the slope, in our single-variable example):

$$
w^{t + 1} = w^{t} - \eta \frac{d}{dw} f(x; w)\tag{5.14}
$$

Now let’s extend the intuition from a function of one scalar variable w to many variables, because we don’t just want to move left or right, we want to know where in the N-dimensional space (of the N parameters that make up θ ) we should move. The gradient is just such a vector; it expresses the directional components of the sharpest slope along each of those N dimensions. If we’re just imagining two weight dimensions (say for one weight w and one bias $^{b)}$ , the gradient might be a vector with two orthogonal components, each of which tells us how much the ground slopes in the w dimension and in the b dimension. Fig. 5.4 shows a visualization of the value of a 2-dimensional gradient vector taken at the red point.

![Figure 5.4](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/7133771220900b7290a3e4b0d336f9202ea6d8e96a221be70ce6d560788ddd6e.jpg)  
Figure 5.4 Visualization of the gradient vector at the red point in two dimensions w and $^{b,}$ showing the gradient as a red arrow in the $\mathbf{X}{-} \mathbf{y}$ plane.

In an actual logistic regression, the parameter vector w is much longer than 1 or 2, since the input feature vector x can be quite long, and we need a weight $w_{i}$ for each $x_{i}.$ . For each dimension/variable $w_{i}$ in w (plus the bias $b)_{\scriptscriptstyle \mathrm{(}}$ , the gradient will have a component that tells us the slope with respect to that variable. Essentially we’re asking: “How much would a small change in that variable $w_{i}$ influence the total loss function $L ?^{\prime}$

In each dimension $w_{i},$ we express the slope as a partial derivative $\frac{\partial}{\partial w_{i}}$ of the loss function. The gradient is then defined as a vector of these partials. We’ll represent $\hat{y}$ as $f(x; \theta)$ to make the dependence on $\theta$ more obvious:

$$
\nabla_{\theta} L(f(x; \theta), y)) = \left[\begin{array}{c} \frac{\partial}{\partial w_{1}} L(f(x; \theta), y) \\ \frac{\partial}{\partial w_{2}} L(f(x; \theta), y) \\ \vdots \\ \frac{\partial}{\partial w_{n}} L(f(x; \theta), y) \end{array} \right]\tag{5.15}
$$

The final equation for updating θ based on the gradient is thus

$$
\theta_{t + 1} = \theta_{t} - \eta \nabla L(f(x; \theta), y)\tag{5.16}
$$

## 5.4.1 The Gradient for Logistic Regression

In order to update θ , we need a definition for the gradient $\nabla L(f(x; \theta), y)$ ). Recall that for logistic regression, the cross-entropy loss function is:

$$
L_{\mathrm{CE}}(\hat{y}, y) = - \left[y \log \sigma(w \cdot x + b) +(1 - y) \log \left(1 - \sigma(w \cdot x + b)\right) \right]\tag{5.17}
$$

It turns out that the derivative of this function for one observation vector x is Eq. 5.18 (the interested reader can see Section 5.8 for the derivation of this equation):

$$
\frac{\partial L_{\mathrm{CE}}(\hat{y}, y)}{\partial w_{j}} =[\sigma(w \cdot x + b) - y] x_{j}\tag{5.18}
$$

Note in Eq. 5.18 that the gradient with respect to a single weight $w_{j}$ represents a very intuitive value: the difference between the true y and our estimated $\hat{y} = \sigma(w$ x + b) for that observation, multiplied by the corresponding input value $x_{j}.$

## 5.4.2 The Stochastic Gradient Descent Algorithm

Stochastic gradient descent is an online algorithm that minimizes the loss function by computing its gradient after each training example, and nudging θ in the right direction (the opposite direction of the gradient). Fig. 5.5 shows the algorithm.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
function STOCHASTIC GRADIENT DESCENT(L(), f(), x, y) returns  $\theta$ 

# where: L is the loss function

# f is a function parameterized by  $\theta$ 

# x is the set of training inputs  $x^{(1)}$ ,  $x^{(2)}$ , ...,  $x^{(m)}$ 

# y is the set of training outputs (labels)  $y^{(1)}$ ,  $y^{(2)}$ , ...,  $y^{(m)}$ $\theta \leftarrow 0$ 

repeat til done # see caption

For each training tuple  $(x^{(i)}, y^{(i)})$  (in random order)

1. Optional (for reporting): # How are we doing on this tuple?

Compute  $\hat{y}^{(i)} = f(x^{(i)}; \theta)$  # What is our estimated output  $\hat{y}$ ?

Compute the loss  $L(\hat{y}^{(i)}, y^{(i)})$  # How far off is  $\hat{y}^{(i)}$  from the true output  $y^{(i)}$ ?

2.  $g \leftarrow \nabla_{\theta} L(f(x^{(i)}; \theta), y^{(i)})$  # How should we move  $\theta$  to maximize loss?

3.  $\theta \leftarrow \theta - \eta g$  # Go the other way instead

return  $\theta$
</div>

Figure 5.5 The stochastic gradient descent algorithm. Step 1 (computing the loss) is used to report how well we are doing on the current tuple. The algorithm can terminate when it converges (or when the gradient norm $< \epsilon)$ , or when progress halts (for example when the loss starts going up on a held-out set).

The learning rate η is a hyperparameter that must be adjusted. If it’s too high, the learner will take steps that are too large, overshooting the minimum of the loss function. If it’s too low, the learner will take steps that are too small, and take too long to get to the minimum. It is common to start with a higher learning rate and then slowly decrease it, so that it is a function of the iteration k of training; the notation η can be used to mean the value of the learning rate at iteration k.

We’ll discuss hyperparameters in more detail in Chapter 7, but briefly they are a special kind of parameter for any machine learning model. Unlike regular parameters of a model (weights like w and b), which are learned by the algorithm from the training set, hyperparameters are special parameters chosen by the algorithm designer that affect how the algorithm works.

## 5.4.3 Working through an example

Let’s walk though a single step of the gradient descent algorithm. We’ll use a simplified version of the example in Fig. 5.2 as it sees a single observation x, whose correct value is $y = 1$ (this is a positive review), and with only two features:

$$
\begin{array}{ll} x_{1} = 3 & \text{(count of positive lexicon words)} \\ x_{2} = 2 & \text{(count of negative lexicon words)} \end{array}
$$

Let’s assume the initial weights and bias in $\theta^{0}$ are all set to 0, and the initial learning rate η is 0.1:

$$
\begin{array}{rl} w_{1} = w_{2} = b & = 0 \\ \eta & = 0.1 \end{array}
$$

The single update step requires that we compute the gradient, multiplied by the learning rate

$$
\theta^{t + 1} = \theta^{t} - \eta \nabla_{\theta} L(f(x^{(i)}; \theta), y^{(i)})
$$

In our mini example there are three parameters, so the gradient vector has 3 dimensions, for w<sub>1</sub>, w<sub>2</sub>, and b. We can compute the first gradient as follows:

$$
\nabla_{w, b} = \left[\begin{array}{c} \frac{\partial L_{\mathrm{CE}}(\hat{y}, y)}{\partial w_{1}} \\ \frac{\partial L_{\mathrm{CE}}(\hat{y}, y)}{\partial w_{2}} \\ \frac{\partial L_{\mathrm{CE}}(\hat{y}, y)}{\partial b} \end{array} \right] = \left[\begin{array}{c}(\sigma(w \cdot x + b) - y) x_{1} \\(\sigma(w \cdot x + b) - y) x_{2} \\ \sigma(w \cdot x + b) - y \end{array} \right] = \left[\begin{array}{c}(\sigma(0) - 1) x_{1} \\(\sigma(0) - 1) x_{2} \\ \sigma(0) - 1 \end{array} \right] = \left[\begin{array}{c} - 0.5x_{1} \\ - 0.5x_{2} \\ - 0.5 \end{array} \right] = \left[\begin{array}{c} - 1.5 \\ - 1.0 \\ - 0.5 \end{array} \right]
$$

Now that we have a gradient, we compute the new parameter vector $\theta^{1}$ by moving $\theta^{0}$ in the opposite direction from the gradient:

$$
\theta^{1} = \left[\begin{array}{c} w_{1} \\ w_{2} \\ b \end{array} \right] - \eta \left[\begin{array}{c} - 1.5 \\ - 1.0 \\ - 0.5 \end{array} \right] = \left[\begin{array}{c}.15 \\.1 \\.05 \end{array} \right]
$$

So after one step of gradient descent, the weights have shifted to be: $w_{1} =.15$ $w_{2} =.1$ , and $b =.05$

Note that this observation x happened to be a positive example. We would expect that after seeing more negative examples with high counts of negative words, that the weight $w_{2}$ would shift to have a negative value.

## 5.4.4 Mini-batch training

Stochastic gradient descent is called stochastic because it chooses a single random example at a time, moving the weights so as to improve performance on that single example. That can result in very choppy movements, so it’s common to compute the gradient over batches of training instances rather than a single instance.

For example in batch training we compute the gradient over the entire dataset. By seeing so many examples, batch training offers a superb estimate of which direction to move the weights, at the cost of spending a lot of time processing every single example in the training set to compute this perfect direction.

A compromise is mini-batch training: we train on a group of m examples (perhaps 512, or 1024) that is less than the whole dataset. (If m is the size of the dataset, then we are doing batch gradient descent; if $m = 1$ , we are back to doing stochastic gradient descent). Mini-batch training also has the advantage of computational efficiency. The mini-batches can easily be vectorized, choosing the size of the minibatch based on the computational resources. This allows us to process all the examples in one mini-batch in parallel and then accumulate the loss, something that’s not possible with individual or batch training.

We just need to define mini-batch versions of the cross-entropy loss function we defined in Section 5.3 and the gradient in Section 5.4.1. Let’s extend the crossentropy loss for one example from Eq. 5.11 to mini-batches of size m. We’ll continue to use the notation that $x^{(\bar{i})}$ and $\boldsymbol{y}^{(i)}$ mean the ith training features and training label, respectively. We make the assumption that the training examples are independent:

$$
\begin{array}{rcl} \log p(\text{training labels}) & = & \log \prod_{i = 1}^{m} p(y^{(i)} | x^{(i)}) \\ & = & \sum_{i = 1}^{m} \log p(y^{(i)} | x^{(i)}) \\ & = & - \sum_{i = 1}^{m} L_{\mathrm{CE}}(\hat{y}^{(i)}, y^{(i)}) \end{array}\tag{5.19}
$$

Now the cost function for the mini-batch of m examples is the average loss for each example:

$$
\begin{array}{l} \text{Cost}(\hat{y}, y) = \frac{1}{m} \sum_{i = 1}^{m} L_{\mathrm{CE}}(\hat{y}^{(i)}, y^{(i)}) \\ = - \frac{1}{m} \sum_{i = 1}^{m} y^{(i)} \log \sigma(w \cdot x^{(i)} + b) +(1 - y^{(i)}) \log \left(1 - \sigma(w \cdot x^{(i)} + b)\right) \end{array}\tag{5.20}
$$

The mini-batch gradient is the average of the individual gradients from Eq. 5.18:

$$
\frac{\partial \operatorname{Cost}(\hat{y}, y)}{\partial w_{j}} = \frac{1}{m} \sum_{i = 1}^{m} \left[\sigma(w \cdot x^{(i)} + b) - y^{(i)} \right] x_{j}^{(i)}\tag{5.21}
$$

## 5.5 Regularization

Numquam ponenda est pluralitas sine necessitate ‘Plurality should never be proposed unless needed’ William of Occam

There is a problem with learning weights that make the model perfectly match the training data. If a feature is perfectly predictive of the outcome because it happens to only occur in one class, it will be assigned a very high weight. The weights for features will attempt to perfectly fit details of the training set, in fact too perfectly, modeling noisy factors that just accidentally correlate with the class. This problem is called overfitting. A good model should be able to generalize well from the training

overfitting generalize

data to the unseen test set, but a model that overfits will have poor generalization.

To avoid overfitting, a new regularization term $R(\theta)$ is added to the objective function in Eq. 5.13, resulting in the following objective for a batch of m examples (slightly rewritten from Eq. 5.13 to be maximizing log probability rather than minimizing loss, and removing the $\frac{1}{m}$ term which doesn’t affect the argmax):

$$
\hat{\theta} = \underset{\theta}{\operatorname{argmax}} \sum_{i = 1}^{m} \log P(y^{(i)} | x^{(i)}) - \alpha R(\theta)\tag{5.22}
$$

The new regularization term $R(\theta)$ is used to penalize large weights. Thus a setting of the weights that matches the training data perfectly— but uses many weights with high values to do so—will be penalized more than a setting that matches the data a little less well, but does so using smaller weights. There are two common ways to compute this regularization term $R(\theta)$ ). L2 regularization is a quadratic function of the weight values, named because it uses the (square of the) L2 norm of the weight values. The L2 norm, $| | \theta | |_{2},$ , is the same as the Euclidean distance of the vector θ from the origin. If θ consists of n weights, then:

$$
R(\theta) = | | \theta | |_{2}^{2} = \sum_{j = 1}^{n} \theta_{j}^{2}\tag{5.23}
$$

The L2 regularized objective function becomes:

$$
\hat{\theta} = \underset{\theta}{\operatorname{argmax}} \left[\sum_{i = 1}^{m} \log P(y^{(i)} | x^{(i)}) \right] - \alpha \sum_{j = 1}^{n} \theta_{j}^{2}\tag{5.24}
$$

L1 regularization is a linear function of the weight values, named after the L1 norm $| | W | |_{1}$ , the sum of the absolute values of the weights, or Manhattan distance (the Manhattan distance is the distance you’d have to walk between two points in a city with a street grid like New York):

$$
R(\theta) = | | \theta | |_{1} = \sum_{i = 1}^{n} | \theta_{i} |\tag{5.25}
$$

The L1 regularized objective function becomes:

$$
\hat{\theta} = \underset{\theta}{\operatorname{argmax}} \left[\sum_{1 = i}^{m} \log P(y^{(i)} | x^{(i)}) \right] - \alpha \sum_{j = 1}^{n} | \theta_{j} |\tag{5.26}
$$

These kinds of regularization come from statistics, where L1 regularization is called lasso regression (Tibshirani, 1996) and L2 regularization is called ridge regression, and both are commonly used in language processing. L2 regularization is easier to optimize because of its simple derivative (the derivative of $\theta^{2}$ is just 2θ ), while L1 regularization is more complex (the derivative of θ is non-continuous at zero). But where L2 prefers weight vectors with many small weights, L1 prefers sparse solutions with some larger weights but many more weights set to zero. Thus L1 regularization leads to much sparser weight vectors, that is, far fewer features.

Both L1 and L2 regularization have Bayesian interpretations as constraints on the prior of how weights should look. L1 regularization can be viewed as a Laplace prior on the weights. L2 regularization corresponds to assuming that weights are distributed according to a Gaussian distribution with mean $\mu = 0$ . In a Gaussian or normal distribution, the further away a value is from the mean, the lower its probability (scaled by the variance σ). By using a Gaussian prior on the weights, we are saying that weights prefer to have the value 0. A Gaussian for a weight $\theta_{j}$ is

$$
\frac{1}{\sqrt{2 \pi \sigma_{j}^{2}}} \exp \left(- \frac{(\theta_{j} - \mu_{j})^{2}}{2 \sigma_{j}^{2}}\right)\tag{5.27}
$$

If we multiply each weight by a Gaussian prior on the weight, we are thus maximizing the following constraint:

$$
\hat{\theta} = \underset{\theta}{\operatorname{argmax}} \prod_{i = 1}^{M} P(y^{(i)} | x^{(i)}) \times \prod_{j = 1}^{n} \frac{1}{\sqrt{2 \pi \sigma_{j}^{2}}} \exp \left(- \frac{(\theta_{j} - \mu_{j})^{2}}{2 \sigma_{j}^{2}}\right)\tag{5.28}
$$

which in log space, with $\mu = 0$ , and assuming $2 \sigma^{2} = 1$ , corresponds to

$$
\hat{\theta} = \underset{\theta}{\operatorname{argmax}} \sum_{i = 1}^{m} \log P(y^{(i)} | x^{(i)}) - \alpha \sum_{j = 1}^{n} \theta_{j}^{2}\tag{5.29}
$$

which is in the same form as Eq. 5.24.

## 5.6 Multinomial logistic regression

Sometimes we need more than two classes. Perhaps we might want to do 3-way sentiment classification (positive, negative, or neutral). Or we could be assigning some of the labels we will introduce in Chapter 8, like the part of speech of a word (choosing from 10, 30, or even 50 different parts of speech), or the named entity type of a phrase (choosing from tags like person, location, organization).

In such cases we use multinomial logistic regression, also called softmax regression (or, historically, the maxent classifier). In multinomial logistic regression the target y is a variable that ranges over more than two classes; we want to know the probability of y being in each potential class $c \in C, p(y = c | x)$

The multinomial logistic classifier uses a generalization of the sigmoid, called the softmax function, to compute the probability $p(y = c | x)$ . The softmax function takes a vector $z =[z_{1}, z_{2},..., z_{k}]$ of k arbitrary values and maps them to a probability distribution, with each value in the range (0,1), and all the values summing to 1. Like the sigmoid, it is an exponential function.

For a vector z of dimensionality k, the softmax is defined as:

$$
\operatorname{softmax} \left(z_{i}\right) = \frac{\exp \left(z_{i}\right)}{\sum_{j = 1}^{k} \exp \left(z_{j}\right)} 1 \leq i \leq k\tag{5.30}
$$

The softmax of an input vector $z =[z_{1}, z_{2},..., z_{k}]$ is thus a vector itself:

$$
\operatorname{softmax}(z) = \left[\frac{\exp \left(z_{1}\right)}{\sum_{i = 1}^{k} \exp \left(z_{i}\right)}, \frac{\exp \left(z_{2}\right)}{\sum_{i = 1}^{k} \exp \left(z_{i}\right)},..., \frac{\exp \left(z_{k}\right)}{\sum_{i = 1}^{k} \exp \left(z_{i}\right)} \right]\tag{5.31}
$$

The denominator $\sum_{i = 1}^{k} \exp \left(z_{i} \right)$ is used to normalize all the values into probabilities. Thus for example given a vector:

$$
z =[0.6, 1.1, - 1.5, 1.2, 3.2, - 1.1]
$$

the resulting (rounded) softmax(z) is

$$
[0.055, 0.090, 0.006, 0.099, 0.74, 0.010]
$$

Again like the sigmoid, the input to the softmax will be the dot product between a weight vector w and an input vector x (plus a bias). But now we’ll need separate weight vectors (and bias) for each of the K classes.

$$
p(y = c | x) = \frac{\exp \left(w_{c} \cdot x + b_{c}\right)}{\sum_{j = 1}^{k} \exp \left(w_{j} \cdot x + b_{j}\right)}\tag{5.32}
$$

Like the sigmoid, the softmax has the property of squashing values toward 0 or 1. Thus if one of the inputs is larger than the others, it will tend to push its probability toward 1, and suppress the probabilities of the smaller inputs.

## 5.6.1 Features in Multinomial Logistic Regression

Features in multinomial logistic regression function similarly to binary logistic regression, with one difference that we’ll need separate weight vectors (and biases) for each of the K classes. Recall our binary exclamation point feature x<sub>5</sub> from page 79:

$$
x_{5} = \left\{\begin{array}{ll} 1 & \text{if ``!"} \in \text{doc} \\ 0 & \text{otherwise} \end{array} \right.
$$

In binary classification a positive weight w<sub>5</sub> on a feature influences the classifier toward $y = 1$ (positive sentiment) and a negative weight influences it toward $y = 0$ (negative sentiment) with the absolute value indicating how important the feature is. For multinominal logistic regression, by contrast, with separate weights for each class, a feature can be evidence for or against each individual class.

In 3-way multiclass sentiment classification, for example, we must assign each document one of the 3 classes +, , or 0 (neutral). Now a feature related to exclamation marks might have a negative weight for 0 documents, and a positive weight for + or documents:

<table><tr><td>Feature</td><td>Definition</td><td> $w_{5,+}$ </td><td> $w_{5,-}$ </td><td> $w_{5,0}$ </td></tr><tr><td> $f_5(x)$ </td><td> $\begin{cases} 1 & \text{if} “!” \in \text{doc} \\ 0 & \text{otherwise} \end{cases}$ </td><td>3.5</td><td>3.1</td><td>-5.3</td></tr></table>

## 5.6.2 Learning in Multinomial Logistic Regression

The loss function for multinomial logistic regression generalizes the loss function for binary logistic regression from 2 to K classes. Recall that that the cross-entropy loss for binary logistic regression (repeated from Eq. 5.11) is:

$$
L_{\mathrm{CE}}(\hat{y}, y) = - \log p(y | x) = -[y \log \hat{y} +(1 - y) \log(1 - \hat{y})]\tag{5.33}
$$

interpretable

The loss function for multinominal logistic regression generalizes the two terms in Eq. 5.33 (one that is non-zero when $y = 1$ and one that is non-zero when $y = 0)$ to K terms. The loss function for a single example x is thus the sum of the logs of the K output classes, each weighted by y<sub>k</sub>, the probability of the true class :

$$
\begin{array}{rcl} L_{\mathrm{CE}}(\hat{y}, y) & = & - \sum_{k = 1}^{K} y_{k} \log \hat{y}_{k} \\ & = & - \sum_{k = 1}^{K} y_{k} \log \hat{p}(y = k | x) \end{array}\tag{5.34}
$$

Because only one class (let’s call it i) is the correct one, the vector y takes the value 1 only for this value of $k, \mathrm{i.e.}.$ has $y_{i} = 1$ and $y_{j} = 0 \forall j \neq i.$ A vector like this, with one value=1 and the rest 0, is called a one-hot vector. The terms in the sum in Eq. 5.34 will thus be 0 except for the term corresponding to the true class, i.e.:

$$
\begin{array}{rcl} L_{\mathrm{CE}}(\hat{y}, y) & = & - \sum_{k = 1}^{K} \mathbb{1} \{y = k\} \log \hat{p}(y = k | x) \\ & = & - \sum_{k = 1}^{K} \mathbb{1} \{y = k\} \log \frac{\exp \left(w_{k} \cdot x + b_{k}\right)}{\sum_{j = 1}^{K} \exp \left(w_{j} \cdot x + b_{j}\right)} \end{array}\tag{5.35}
$$

Hence the cross-entropy loss is simply the log of the output probability corresponding to the correct class, and we therefore also call this the negative log likelihood loss:

$$
\begin{array}{ll} L_{\mathrm{CE}}(\hat{y}, y) & = - \log \hat{y}_{k}, \quad \text{(where k is the correct class)} \\ & = - \log \frac{\exp(w_{k} \cdot x + b_{k})}{\sum_{j = 1}^{K} \exp(w_{j} \cdot x + b_{j})} \quad \text{(where k is the correct class(5.36)} \end{array}
$$

The gradient for a single example turns out to be very similar to the gradient for binary logistic regression, although we don’t show the derivation here. It is the difference between the value for the true class k (which is 1) and the probability the classifier outputs for class k, weighted by the value of the input $x_{i}$ corresponding to the ith element of the weight for class k $w_{k, i} \colon$

$$
\begin{array}{rcl} \frac{\partial L_{\mathrm{CE}}}{\partial w_{k, i}} & = & -(\mathbb{1} \{y = k\} - p(y = k | x)) x_{i} \\ & = & - \left(\mathbb{1} \{y = k\} - \frac{\exp(w_{k} \cdot x + b_{k})}{\sum_{j = 1}^{K} \exp(w_{j} \cdot x + b_{j})}\right) x_{i} \end{array}\tag{5.37}
$$

## 5.7 Interpreting models

Often we want to know more than just the correct classification of an observation. We want to know why the classifier made the decision it did. That is, we want our decision to be interpretable. Interpretability can be hard to define strictly, but the core idea is that as humans we should know why our algorithms reach the conclusions they do. Because the features to logistic regression are often human-designed, one way to understand a classifier’s decision is to understand the role each feature plays in the decision. Logistic regression can be combined with statistical tests (the likelihood ratio test, or the Wald test); investigating whether a particular feature is significant by one of these tests, or inspecting its magnitude (how large is the weight w associated with the feature?) can help us interpret why the classifier made the decision it makes. This is enormously important for building transparent models.

Furthermore, in addition to its use as a classifier, logistic regression in NLP and many other fields is widely used as an analytic tool for testing hypotheses about the effect of various explanatory variables (features). In text classification, perhaps we want to know if logically negative words (no, not, never) are more likely to be associated with negative sentiment, or if negative reviews of movies are more likely to discuss the cinematography. However, in doing so it’s necessary to control for potential confounds: other factors that might influence sentiment (the movie genre, the year it was made, perhaps the length of the review in words). Or we might be studying the relationship between NLP-extracted linguistic features and non-linguistic outcomes (hospital readmissions, political outcomes, or product sales), but need to control for confounds (the age of the patient, the county of voting, the brand of the product). In such cases, logistic regression allows us to test whether some feature is associated with some outcome above and beyond the effect of other features.

## 5.8 Advanced: Deriving the Gradient Equation

In this section we give the derivation of the gradient of the cross-entropy loss function $L_{\mathrm{CE}}$ for logistic regression. Let’s start with some quick calculus refreshers. First, the derivative of $\ln(x)$

$$
{\frac{d}{dx}} \ln(x) ={\frac{1}{x}}\tag{5.38}
$$

Second, the (very elegant) derivative of the sigmoid:

$$
\frac{d \sigma(z)}{dz} = \sigma(z)(1 - \sigma(z))\tag{5.39}
$$

Finally, the chain rule of derivatives. Suppose we are computing the derivative of a composite function $f(x) = u(\nu(x))$ . The derivative of $f(x)$ is the derivative of $u(x)$ with respect to $\nu(x)$ times the derivative of $\nu(x)$ with respect to x:

$$
{\frac{df}{dx}} ={\frac{du}{dv}} \cdot{\frac{dv}{dx}}\tag{5.40}
$$

First, we want to know the derivative of the loss function with respect to a single weight $w_{j}$ (we’ll need to compute it for each weight, and for the bias):

$$
\begin{array}{rcl} \frac{\partial L_{\mathrm{CE}}}{\partial w_{j}} & = & \frac{\partial}{\partial w_{j}} -[y \log \sigma(w \cdot x + b) +(1 - y) \log(1 - \sigma(w \cdot x + b))] \\ & = & - \left[\frac{\partial}{\partial w_{j}} y \log \sigma(w \cdot x + b) + \frac{\partial}{\partial w_{j}}(1 - y) \log[1 - \sigma(w \cdot x + b)] \right] \end{array}\tag{5.41}
$$

Next, using the chain rule, and relying on the derivative of log:

$$
\frac{\partial L_{\mathrm{CE}}}{\partial w_{j}} = - \frac{y}{\sigma(w \cdot x + b)} \frac{\partial}{\partial w_{j}} \sigma(w \cdot x + b) - \frac{1 - y}{1 - \sigma(w \cdot x + b)} \frac{\partial}{\partial w_{j}} 1 - \sigma(w \cdot x + b)\tag{5.42}
$$

Rearranging terms:

$$
\frac{\partial L_{\mathrm{CE}}}{\partial w_{j}} = - \left[\frac{y}{\sigma(w \cdot x + b)} - \frac{1 - y}{1 - \sigma(w \cdot x + b)} \right] \frac{\partial}{\partial w_{j}} \sigma(w \cdot x + b)\tag{5.43}
$$

And now plugging in the derivative of the sigmoid, and using the chain rule one more time, we end up with Eq. 5.44:

$$
\begin{array}{rcl} \frac{\partial L_{\mathrm{CE}}}{\partial w_{j}} & = & - \left[\frac{y - \sigma(w \cdot x + b)}{\sigma(w \cdot x + b)[1 - \sigma(w \cdot x + b)]} \right] \sigma(w \cdot x + b)[1 - \sigma(w \cdot x + b)] \frac{\partial(w \cdot x + b)}{\partial w_{j}} \\ & = & - \left[\frac{y - \sigma(w \cdot x + b)}{\sigma(w \cdot x + b)[1 - \sigma(w \cdot x + b)]} \right] \sigma(w \cdot x + b)[1 - \sigma(w \cdot x + b)] x_{j} \\ & = & -[y - \sigma(w \cdot x + b)] x_{j} \\ & = &[\sigma(w \cdot x + b) - y] x_{j} \end{array} \tag{5.44}
$$

## 5.9 Summary

This chapter introduced the logistic regression model of classification.

- Logistic regression is a supervised machine learning classifier that extracts real-valued features from the input, multiplies each by a weight, sums them, and passes the sum through a sigmoid function to generate a probability. A threshold is used to make a decision.

- Logistic regression can be used with two classes (e.g., positive and negative sentiment) or with multiple classes (multinomial logistic regression, for example for n-ary text classification, part-of-speech labeling, etc.).

- Multinomial logistic regression uses the softmax function to compute probabilities.

- The weights (vector w and bias b) are learned from a labeled training set via a loss function, such as the cross-entropy loss, that must be minimized.

- Minimizing this loss function is a convex optimization problem, and iterative algorithms like gradient descent are used to find the optimal weights.

- Regularization is used to avoid overfitting.

- Logistic regression is also one of the most useful analytic tools, because of its ability to transparently study the importance of individual features.

## Bibliographical and Historical Notes

Logistic regression was developed in the field of statistics, where it was used for the analysis of binary data by the 1960s, and was particularly common in medicine (Cox, 1969). Starting in the late 1970s it became widely used in linguistics as one of the formal foundations of the study of linguistic variation (Sankoff and Labov, 1979).

Nonetheless, logistic regression didn’t become common in natural language processing until the 1990s, when it seems to have appeared simultaneously from two directions. The first source was the neighboring fields of information retrieval and speech processing, both of which had made use of regression, and both of which lent many other statistical techniques to NLP. Indeed a very early use of logistic regression for document routing was one of the first NLP applications to use (LSI) embeddings as word representations (Schutze et al., 1995) ¨ .

At the same time in the early 1990s logistic regression was developed and applied to NLP at IBM Research under the name maximum entropy modeling or maxent (Berger et al., 1996), seemingly independent of the statistical literature. Under that name it was applied to language modeling (Rosenfeld, 1996), part-of-speech tagging (Ratnaparkhi, 1996), parsing (Ratnaparkhi, 1997), coreference resolution (Kehler, 1997b), and text classification (Nigam et al., 1999).

More on classification can be found in machine learning textbooks (Hastie et al. 2001, Witten and Frank 2005, Bishop 2006, Murphy 2012).

CHAPTER

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/42fb8a24e0fe2dfc9e168685b638e0c849de5d3f64482ee412ffa458d3fc32d5.jpg)


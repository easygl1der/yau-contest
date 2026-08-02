---
title: "Chapter 10 \u2014 Pre-trained Word Representations"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 10
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 2488
source_line_end: 2849
source_pdf_page_range: null
review_status: machine-verified
image_count: 0
source_empty_image_alt: 0
non_semantic_image_alt: 0
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

# Chapter 10 — Pre-trained Word Representations

> [[../README|本书目录]] · [[09-chapter-9-language-modeling|上一章]] · [[11-chapter-11-using-word-embeddings|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 2488–2849。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 10.1 RANDOM INITIALIZATION

When enough supervised training data is available, one can just treat the feature embeddings the same as the other model parameters: initialize the embedding vectors to random values, and let the network-training procedure tune them into “good” vectors.

Some care has to be taken in the way the random initialization is performed. The method used by the effective Word2Vec implementation [Mikolov et al., 2013b,a] is to initialize the word vectors to uniformly sampled random numbers in the range $[- \frac{1}{2d}, \frac{1}{2d}]$ where $d$ is the number of dimensions. Another option is to use xavier initialization (see Section 5.2.2) and initialize with uniformly sampled values from $\left[-\frac{\sqrt{6}}{\sqrt{d}}, \frac{\sqrt{6}}{\sqrt{d}}\right]$ .

In practice, one will often use the random initialization approach to initialize the embedding vectors of commonly occurring features, such as part-of-speech tags or individual letters, while using some form of supervised or unsupervised pre-training to initialize the potentially rare features, such as features for individual words. The pre-trained vectors can then either be treated as fixed during the network training process, or, more commonly, treated like the randomly initialized vectors and further tuned to the task at hand.

## 10.2 SUPERVISED TASK-SPECIFIC PRE-TRAINING

If we are interested in task A, for which we only have a limited amount of labeled data (for example, syntactic parsing), but there is an auxiliary task B (say, part-of-speech tagging) for which we have much more labeled data, we may want to pre-train our word vectors so that they perform well as predictors for task B, and then use the trained vectors for training task A. In this way, we can utilize the larger amounts of labeled data we have for task B. When training task A we can either treat the pre-trained vectors as fixed, or tune them further for task A. Another option is to train jointly for both objectives; see Chapter 20 for more details.

## 116 10. PRE-TRAINED WORD REPRESENTATIONS 10.3 UNSUPERVISED PRE-TRAINING

The common case is that we do not have an auxiliary task with large enough amounts of annotated data (or maybe we want to help bootstrap the auxiliary task training with better vectors). In such cases, we resort to “unsupervised” auxiliary tasks, which can be trained on huge amounts of unannotated text.

The techniques for training the word vectors are essentially those of supervised learning, but instead of supervision for the task that we care about, we instead create practically unlimited number of supervised training instances from raw text, hoping that the tasks that we created will match (or be close enough to) the final task we care about. $^{1}$

The key idea behind the unsupervised approaches is that one would like the embedding vectors of “similar” words to have similar vectors. While word similarity is hard to define and is usually very task-dependent, the current approaches derive from the distributional hypothesis [Harris, 1954], stating that words are similar if they appear in similar contexts. The different methods all create supervised training instances in which the goal is to either predict the word from its context, or predict the context from the word.

In the final section of Chapter 9, we saw how language modeling creates word vectors as a byproduct of training. Indeed, language modeling can be treated as an “unsupervised” approach in which a word is predicted based on the context of the k preceding words. Historically, the algorithm of Collobert and Weston [Collobert and Weston, 2008, Collobert et al., 2011] and the WORD2Vec family of algorithms described below [Mikolov et al., 2013b,a] were inspired by this property of language modeling. The WORD2Vec algorithms are designed to perform the same side effects as language modeling, using a more efficient and more flexible framework. The GLOVE algorithm by Pennington et al. [2014] follows a similar objective. These algorithms are also deeply connected to another family of algorithms which evolved in the NLP and IR communities, and that are based on matrix factorization [Levy and Goldberg, 2014]. Word embeddings algorithms are discussed in Section 10.4.

An important benefit of training word embeddings on large amounts of unannotated data is that it provides vector representations for words that do not appear in the supervised training set. Ideally, the representations for these words will be similar to those of related words that do appear in the training set, allowing the model to generalize better on unseen events. It is thus desired that the similarity between word vectors learned by the unsupervised algorithm captures the same aspects of similarity that are useful for performing the intended task of the network.

Arguably, the choice of auxiliary problem (what is being predicted, based on what kind of context) affects the resulting vectors much more than the learning method that is being used to train them. Section 10.5 surveys different choices of auxiliary problems.

Word embeddings derived by unsupervised training algorithms have applications in NLP beyond using them for initializing the word-embeddings layer of neural network model. These are discussed in Chapter 11.

## 10.3.1 USING PRE-TRAINED EMBEDDINGS

When using pre-trained word embeddings, there are some choices that should be taken. The first choice is about pre-processing: Should the pre-trained word vectors be used as is, or should each vector be normalized to unit length? This is task dependent. For many word embedding algorithms, the norm of the word vector correlates with the word's frequency. Normalizing the words to unit length removes the frequency information. This could either be a desirable unification, or an unfortunate information loss.

The second choice regards fine-tuning the pre-trained vectors for the task. Consider an embedding matrix $E \in R^{|V| \times d}$ associating words from vocabulary V with d-dimensional vectors. A common approach is to treat E as model parameters, and change it with the rest of the network. While this works well, it has the potential undesirable effect of changing the representations for words that appear in the training data, but not for other words that used to be close to them in the original pre-trained vectors E. This may hurt the generalization properties we aim to get from the pre-training procedure. An alternative is to leave the pre-trained vectors E fixed. This keeps the generalization, but prevents the model from adapting the representations for the given task. A middle ground is to keep E fixed, but use an additional matrix $T \in R^{d \times d}$ . Instead of looking at the rows of E, we look at rows of a transformed matrix $E' = ET$ . The transformation matrix T is tuned as part of the network, allowing to fine-tune some aspects of the pre-trained vectors for the task. However, the task-specific adaptations are in the form of linear transformations that apply to all words, not just those seen in training. The downside of this approach is the inability to change the representations of some words but not others (for example, if hot and cold received very similar vectors, it could be very hard for a linear transformation T to separate them). Another option is to keep E fixed, but use an additional matrix $\Delta \in R^{|V| \times d}$ and take the embedding matrix to be $E' = E + \Delta$ or $E' = ET + \Delta$ . The $\Delta$ matrix is initialized to 0 and trained with the network, allowing to learn additive changes to specific words. Adding a strong regularization penalty over $\Delta$ will encourage the fine-tuned representations to stay close to the original ones. $^{2}$

## 10.4 WORD EMBEDDING ALGORITHMS

The neural networks community has a tradition of thinking in terms of distributed representations [Hinton et al., 1987]. In contrast to local representations, in which entities are represented as discrete symbols and the interactions between entities are encoded as a set of discrete relations between symbols forming a graph, in distributed representations each entity is instead represented as a vector of value (“a pattern of activations”), and the meaning of the entity and its relation to other entities are captured by the activations in the vector, and the similarities between different vectors. In the context of language processing, it means that words (and sentences) should not be mapped to discrete dimensions but rather mapped to a shared low dimensional space, where

## 10. PRE-TRAINED WORD REPRESENTATIONS

each word will be associated with a d-dimensional vector, and the meaning of the word will be captured by its relation to other words and the activation values in its vector.

The natural language processing community has a tradition in thinking in terms of distributional semantics, in which a meaning of a word could be derived from its distribution in a corpus, i.e., from the aggregate of the contexts in which it is being used. Words that tend to occur in similar contexts tend to have similar meanings.

These two approaches to representing words—in terms of patterns of activations that are learned in the context of a larger algorithm and in terms of co-occurrence patterns with other words or syntactic structures, give rise to seemingly very different views of word representations, leading to different algorithmic families and lines of thinking.

In Section 10.4.1 we will explore the distributional approach to word representation, and in Section 10.4.2 we'll explore the distributed approaches. Section 10.4.3 will connect the two worlds, and show that for the most part, current state-of-the-art distributed representations of words are using distributional signals to do most of their heavy lifting, and that the two algorithmic families are deeply connected.

## 10.4.1 DISTRIBUTIONAL HYPOTHESIS AND WORD REPRESENTATIONS

The Distributional Hypothesis about language and word meaning states that words that occur in the same contexts tend to have similar meanings [Harris, 1954]. The idea was popularized by Firth [1957] through the saying “you shall know a word by the company it keeps.” Intuitively, when people encounter a sentence with an unknown word such as the word wampimuk in Marco saw a hairy little wampinuk crouching behind a tree, they infer the meaning of the word based on the context in which it occurs. This idea has given rise to the field of distributional semantics: a research area interested in quantifying semantic similarities between linguistic items according to their distributional properties in large text corpora. For a discussion of the linguistic and philosophical basis of the distributional hypothesis, see Sahlgren [2008].

## Word-context Matrices

In NLP, a long line of research $^{5}$ captures the distributional properties of words using word-context matrices, in which each row i represents a word, each column j represents a linguistic context in which words can occur, and a matrix entry $M_{[i,j]}$ quantifies the strength of association between a word and a context in a large corpus. In other words, each word is represented as a sparse vector in high dimensional space, encoding the weighted bag of contexts in which it occurs. Different definitions of contexts and different ways of measuring the association between a word and a context give rise to different word representations. Different distance functions can be used to measure the distances between word vectors, which are taken to represent the semantic distances between the associated words.

More formally, denote by $V_{W}$ the set of words (the words vocabulary) and by $V_{C}$ the set of possible contexts. We assume each word and each context are indexed, such that $w_{i}$ is the i th word in the words vocabulary and $c_{j}$ is the j th word in the context vocabulary. The matrix $M^{f} \in R^{|V_{W}| \times |V_{C}|}$ is the word-context matrix, defined as $M_{[i,j]}^{f} = f(w_{i}, c_{j})$ , where f is an association measure of the strength between a word and a context.

## Similarity Measures

Once words are represented as vectors, one can compute similarities between words by computing the similarities between the corresponding vectors. A common and effective measure is the cosine similarity, measuring the cosine of the angle between the vectors:

$$
\mathrm{sim}_{\cos}(\boldsymbol{u}, \boldsymbol{v}) = \frac{\boldsymbol{u} \cdot \boldsymbol{v}}{\| \boldsymbol{u} \|_{2} \| \boldsymbol{v} \|_{2}} = \frac{\sum_{i} \boldsymbol{u}_{[i]} \cdot \boldsymbol{v}_{[i]}}{\sqrt{\sum_{i}(\boldsymbol{u}_{[i]})^{2}} \sqrt{\sum_{i}(\boldsymbol{v}_{[i]})^{2}}}.\tag{10.1}
$$

Another popular measure is the generalized Jacaard similarity, defined as: $^{4}$

$$
\operatorname{sim}_{\text{J a c a a r d}}(\boldsymbol{u}, \boldsymbol{v}) = \frac{\sum_{i} \min(\boldsymbol{u}_{[i]}, \boldsymbol{v}_{[i]})}{\sum_{i} \max(\boldsymbol{u}_{[i]}, \boldsymbol{v}_{[i]})}.\tag{10.2}
$$

## Word-context Weighting and PMI

The function $f$ is usually based on counts from a large corpus. Denote by $\#(w, c)$ the number of times word $w$ occurred in the context $c$ in the corpus $D$ , and let $|D|$ be the corpus size ( $|D| = \sum_{w' \in V_W, c' \in V_C} \#(w', c')$ ). It is intuitive to define $f(w, c)$ to be the count $f(w, c) = \#(w, c)$ or the normalized count $f(w, c) = P(w, c) = \frac{\#(w, c)}{|D|}$ . However, this has the undesired effect of assigning high weights to word-context pairs involving very common contexts (for example, consider the context of a word to be the previous word. Then for a word such as cat the events the cat and a cat will receive much higher scores than cute cat and small cat even though the later are much more informative). To counter this effect, it is better to define $f$ to favor informative contexts for a given word—contexts that co-occur more with the given word than with other words. An effective metric that captures this behavior is the pointwise mutual information (PMI): an information-theoretic association measure between a pair of discrete outcomes $x$ and $y$ , defined as:

$$
\operatorname{PMI}(x, y) = \log \frac{P(x, y)}{P(x) P(y)}.\tag{10.3}
$$

In our case, $\mathrm{PMI}(w,c)$ measures the association between a word w and a context c by calculating the log of the ratio between their joint probability (the frequency in which they co-occur together) and their marginal probabilities (the frequencies in which they occur individually). PMI can be estimated empirically by considering the actual number of observations in a corpus:

$$
f(w, c) = \operatorname{PMI}(w, c) = \log \frac{\#(w, c) \cdot | D |}{\#(w) \cdot \#(c)},\tag{10.4}
$$

where $\#(w) = \sum_{c' \in V_C} \#(w, c')$ and $\#(c) = \sum_{w' \in V_W} \#(w', c)$ are the corpus frequencies of $w$ and $c$ respectively. The use of PMI as a measure of association in NLP was introduced by Church and Hanks [1990] and widely adopted for word similarity and distributional semantic tasks [Dagan et al., 1994, Turney, 2001, Turney and Pantel, 2010].

Working with the PMI matrix presents some computational challenges. The rows of $M^{PMI}$ contain many entries of word-context pairs $(w, c)$ that were never observed in the corpus, for which $PMI(w, c) = \log 0 = -\infty$ . A common solution is to use the positive PMI (PPMI) metric, in which all negative values are replaced by 0: $^{5}$

$$
\operatorname{PPMI}(w, c) = \max(\operatorname{PMI}(w, c), 0).\tag{10.5}
$$

Systematic comparisons of various weighting schemes for entries in the word-context similarity matrix show that the PMI, and more so the positive-PMI (PPMI) metrics provide the best results for a wide range of word-similarity tasks [Bullinaria and Levy, 2007, Kiela and Clark, 2014].

A deficiency of PMI is that it tends to assign high value to rare events. For example, if two events occur only once, but occur together, they will receive a high PMI value. It is therefore advisable to apply a count threshold before using the PMI metric, or to otherwise discount rare events.

## Dimensionality Reduction through Matrix Factorization

A potential obstacle of representing words as the explicit set of contexts in which they occur is that of data sparsity—some entries in the matrix M may be incorrect because we did not observe enough data points. Additionally, the explicit word vectors are of a very high dimensions (depending on the definition of context, the number of possible contexts can be in the hundreds of thousands, or even millions).

Both issues can be alleviated by considering a low-rank representation of the data using a dimensionality reduction technique such as the singular value decomposition (SVD).

SVD works by factorizing the matrix $M \in R^{|V_{W}| \times |V_{C}|}$ into two narrow matrices: a $W \in R^{|V_{W}| \times d}$ word matrix and a $C \in R^{|V_{C}| \times d}$ context matrix, such that $WC^{\top} = M' \in R^{|V_{W}| \times |V_{C}|}$ is the best rank-d approximation of M in the sense that no other rank-d matrix has a closer $L_{2}$ distance to M than $M'$ .

The low-rank representation $M'$ can be seen as a “smoothed” version of M: based on robust patterns in the data, some of the measurements are “fixed.” This has the effect, for example, of adding words to contexts that they were not seen with, if other words in this context seem to co-locate with each other. Moreover, the matrix W allows to represent each word as a dense d-dimensional vector instead of a sparse $|V_{C}|$ -dimensional one, where $d \ll |V_{C}|$ (typical choices are 50 < d < 300), such that the d-dimensional vectors captures the most important directions of variation in the original matrix. One can then compute similarities based on the dense d-dim vectors instead of the sparse high-dimensional ones.

The mathematics of SVD The Singular Value Decomposition (SVD) is an algebraic technique by which an $m \times n$ real or complex matrix M is factorized into three matrices:

$$
\boldsymbol{M} = \boldsymbol{U} \boldsymbol{D} \boldsymbol{V},
$$

where U is an $m \times m$ real or complex matrix, D is an $m \times n$ real or complex matrix, and V is an $n \times n$ matrix. The matrices U and $V^{\top}$ are orthonormal, meaning that their rows are unit-length and orthogonal to each other. The matrix D is diagonal, where the elements on the diagonal are the singular values of M, in decreasing order.

The factorization is exact. The SVD has many uses, in machine learning and elsewhere. For our purposes, SVD is used for dimensionality reduction—finding low-dimensional representations of high-dimensional data that preserve most of the information in the original data.

Consider the multiplication $U \tilde{D} V$ where $\tilde{D}$ is a version of D in which all but the first k elements on the diagonal are replaced by zeros. We can now zero out all but the first k rows of U and columns of V, as they will be zeroed out by the multiplication anyhow. Deleting the rows and columns leaves us with three matrices, $\tilde{U}(m \times k)$ , $\times D(k \times k$ , diagonal) and $V(k \times n)$ . The product:

$$
M^{\prime} = \tilde{U} \tilde{D} \tilde{V}
$$

is a $(m \times n)$ matrix of rank k.

The matrix $M'$ is the product of thin matrices ( $\tilde{U}$ and $\tilde{V}$ , with k much smaller than m and n), and can be thought of as a low rank approximation of M.

According to the Eckart-Young theorem [Eckart and Young, 1936], the matrix $M'$ is the best rank-k approximation of $M$ under $L_2$ loss. That is, $M'$ is the minimizer of:

$$
M^{\prime} = \underset{X \in \mathbb{R}^{m \times n}}{\text{argmin}} \| X - M \|_{2} \quad s.t.X \text{is rank-} k.
$$

The matrix $M'$ can be thought of as a smoothed version of M, in the sense that it uses only the k most influential directions in the data.

Approximating row distances The low-dimensional rows of $E = \tilde{U} \tilde{D}$ are low-rank approximations of the high-dimensional rows of the original matrix M, in the sense that computing the dot product between rows of E is equivalent to computing the dot-product between the rows of the reconstructed matrix $M'$ . That is, $E_{[i]} \cdot E_{[j]} = M'_{[i]} \cdot M'_{[j]}$ .

## 122 10. PRE-TRAINED WORD REPRESENTATIONS

To see why, consider the $m \times m$ matrix $S^{E} = EE^{\top}$ . An entry $[i, j]$ in this matrix is equal to the dot product between rows i and j in $E: S^{E}_{[i,j]} = E_{[i]} \cdot E_{[j]}$ . Similarly for the matrix $S^{M'} = M'M'^{\top}$ .

We will show that $S^{E} = S^{M'}$ . Recall that $\tilde{V}\tilde{V}^{\top} = I$ because $\tilde{V}$ is orthonormal. Now:

$$
\begin{array}{rl} S^{M^{\prime}} = M^{\prime} M^{\top} & =(\tilde{U} \tilde{D} \tilde{V})(\tilde{U} \tilde{D} \tilde{V})^{\top} =(\tilde{U} \tilde{D} \tilde{V})(\tilde{V}^{\top} \tilde{D}^{\top} \tilde{U}^{\top}) = \\ & =(\tilde{U} \tilde{D})(\tilde{V} \tilde{V}^{\top})(\tilde{D}^{\top} \tilde{U}^{\top}) =(\tilde{U} \tilde{D})(\tilde{U} \tilde{D})^{\top} = EE^{\top} = S^{E}.\end{array}
$$

We can thus use the rows of E instead of the high-dimensional rows of $M'$ (and instead of the high-dimensional rows of M. Using a similar argument, we can also use the rows of $(\tilde{D}\tilde{V})^{\top}$ instead of the columns of $M'$ ).

When using SVD for word similarity, the rows of M correspond to words, the columns to contexts, and the vectors comprising the rows of E are low-dimensional word representations. In practice, it is often better to not use $E = \tilde{U} \tilde{D}$ but instead to use the more “balanced” version $E = \tilde{U} \sqrt{\tilde{D}}$ , or even ignoring the singular values $\tilde{D}$ completely and taking $E = \tilde{U}$ .

## 10.4.2 FROM NEURAL LANGUAGE MODELS TO DISTRIBUTED REPRESENTATIONS

In contrast to the so-called count-based methods described above, the neural networks community advocates the use of distributed representations of word meanings. In a distributed representation, each word is associated with a vector in $\mathbb{R}^{d}$ , where the “meaning” of the word with respect to some task is captured in the different dimensions of the vector, as well as in the dimensions of other words. Unlike the explicit distributional representations in which each dimension corresponds to a specific context the word occurs in, the dimensions in the distributed representation are not interpretable, and specific dimensions do not necessarily correspond to specific concepts. The distributed nature of the representation means that a given aspect of meaning may be captured by (distributed over) a combination of many dimensions, and that a given dimension may contribute to capturing several aspects of meaning. $^{6}$

Consider the language modeling network in Equation (9.3) in Chapter 9. The context of a word is the $k$ gram of words preceding it. Each word is associated with a vector, and their concatenation is encoded into a $d_{\mathrm{hid}}$ dimensional vector $\pmb{h}$ using a nonlinear transformation. The vector $\pmb{h}$ is then multiplied by a matrix $W^2$ in which each column corresponds to a word, and interactions between $\pmb{h}$ and columns in $W^2$ determine the probabilities of the different words given the context. The columns of $W^2$ (as well as the rows of the embeddings matrix $\mathbb{E}$ ) are distributed representations of words: the training process determines good values to the embeddings such that they produce correct probability estimates for a word in the context of a kgram, capturing the “meaning” of the words in the columns of $W^{2}$ associated with them.

## Collobert and Weston

The design of the network in Equation (9.3) is driven by the language modeling task, which poses two important requirements: the need to produce a probability distributions over words, and the need to condition on contexts that can be combined using the chain-rule of probability to produce sentence-level probability estimates. The need to produce a probability distribution dictates the need to compute an expensive normalization term involving all the words in the output vocabulary, while the need to decompose according to the chain-rule restricts the conditioning context to preceding kgrams.

If we only care about the resulting representations, both of the constraints can be relaxed, as was done by Collobert and Weston [2008] in a model which was refined and presented in greater depth by Bengio et al. [2009]. The first change introduced by Collobert and Weston was changing the context of a word from the preceding $k$ gram (the words to its left) to a word-window surrounding it (i.e., computing $P(w_{3}|w_{1}w_{2}\square w_{4}w_{5})$ instead of $P(w_{5}|w_{1}w_{2}w_{3}w_{4}\square)$ ). The generalization to other kinds of fixed-sized contexts $c_{1:k}$ is straightforward.

The second change introduced by Collobert and Weston is to abandon the probabilistic output requirement. Instead of computing a probability distribution over target words given a context, their model only attempts to assign a score to each word, such that the correct word scores above incorrect ones. This removes the need to perform the computationally expensive normalization over the output vocabulary, making the computation time independent of the output vocabulary size. This not only makes the network much faster to train and use, but also makes it scalable to practically unlimited vocabularies (the only cost of increasing the vocabulary is a linear increase in memory usage).

Let w be a target word, $c_{1:k}$ be an ordered list of context items, and $v_{w}(w)$ and $v_{c}(c)$ embedding functions mapping word and context indices to $d_{emb}$ dimensional vectors (from now on we assume the word and context vectors have the same number of dimensions). The model of Collobert and Weston computes a score $s(w, c_{1:k})$ of a word-context pair by concatenating the word and the context embeddings into a vector x, which is fed into an MLP with one hidden layer whose single output is the score assigned to the word-context combination:

$$
\begin{array}{c} s(w, c_{1: k}) = g(\boldsymbol{x} \boldsymbol{U}) \cdot \boldsymbol{v} \\ \boldsymbol{x} =[v_{c}(c_{1}); \ldots; v_{c}(c_{k}); v_{w}(w)] \end{array}\tag{10.6}
$$

$$
\boldsymbol{U} \in \mathbb{R}^{(k + 1) d_{\mathrm{emb}} \times d_{h}} \quad \boldsymbol{v} \in \mathbb{R}^{d_{h}}.
$$

The network is trained with a margin-based ranking loss to score correct word-context pairs $(w, c_{1:k})$ above incorrect word-context pairs $(w', c_{1:k})$ with a margin of at least 1. The loss

## 124 10. PRE-TRAINED WORD REPRESENTATIONS

$L(w, c_{1:k})$ for a given word-context pair is given by:

$$
L(w, c, w^{\prime}) = \max(0, 1 -(s(w, c_{1: k}) - s(w^{\prime}, c_{1: k})))\tag{10.7}
$$

where $w'$ is a random word from the vocabulary. The training procedure repeatedly goes over word-context pairs from the corpus, and for each one samples a random word $w'$ , computes the loss $L(w, c, w')$ using $w'$ , and updates parameters U, v and the word and context embeddings to minimize the loss.

The use of randomly sampled words to produce negative examples of incorrect word-context to drive the optimization is also at the core of the WORD2Vec algorithm, to be described next.

## Word2Vec

The widely popular WORD2Vec algorithm was developed by Tomáš Mikolov and colleagues over a series of papers [Mikolov et al., 2013b,a]. Like the algorithm of Collobert and Weston, WORD2Vec also starts with a neural language model and modifies it to produce faster results. textscWord2Vec is not a single algorithm: it is a software package implementing two different context representations (CBOW and Skip-Gram) and two different optimization objectives (Negative-Sampling and Hierarchical Softmax). Here, we focus on the Negative-Sampling objective (NS).

Like Collobert and Weston's algorithm, the NS variant of WORD2Vec works by training the network to distinguish "good" word-context pairs from "bad" ones. However, WORD2Vec replaces the margin-based ranking objective with a probabilistic one. Consider a set $D$ of correct word-context pairs, and a set $\bar{D}$ of incorrect word-context pairs. The goal of the algorithm is to estimate the probability $P(D = 1|w,c)$ that the word-context pair came from the correct set $D$ . This should be high (1) for pairs from $D$ and low (0) for pairs from $\bar{D}$ . The probability constraint dictates that $P(D = 1|w,c) = 1 - P(D = 0|w,c)$ . The probability function is modeled as a sigmoid over the score $s(w,c)$ :

$$
P(D = 1 | w, c) = \frac{1}{1 + e^{- s(w, c)}}.\tag{10.8}
$$

The corpus-wide objective of the algorithm is to maximize the log-likelihood of the data $D \cup \bar{D}$ :

$$
\mathcal{L}(\Theta; D, \bar{D}) = \sum_{(w, c) \in D} \log P(D = 1 | w, c) + \sum_{(w, c) \in \bar{D}} \log P(D = 0 | w, c).\tag{10.9}
$$

The positive examples D are generated from a corpus. The negative examples $\bar{D}$ can be generated in many ways. In WORD2Vec, they are generated by the following process: for each good pair $(w, c) \in D$ , sample k words $w_{1:k}$ and add each of $(w_i, c)$ as a negative example to $\bar{D}$ . This results in the negative samples data $\bar{D}$ being k times larger than D. The number of negative samples k is a parameter of the algorithm.

The negative words w can be sampled according to their corpus-based frequency $\frac{\#(w)}{\sum_{w'}\#(w')}$ , or, as done in the Word2Vec implementation, according to a smoothed version in which the counts are raised to the power of $\frac{3}{4}$ before normalizing: $\frac{\#(w)^{0.75}}{\sum_{w'}\#(w')^{0.75}}$ . This second version gives more relative weight to less frequent words, and results in better word similarities in practice.

CBOW Other than changing the objective from margin-based to a probabilistic one, WORD2Vec also considerably simplify the definition of the word-context scoring function, $s(w,c)$ . For a multi-word context $c_{1:k}$ , the CBOW variant of WORD2Vec defines the context vector c to be a sum of the embedding vectors of the context components: $c = \sum_{i=1}^{k} c_i$ . It then defines the score to be simply $s(w,c) = w \cdot c$ , resulting in:

$$
P(D = 1 | w, c_{1: k}) = \frac{1}{1 + e^{-(\boldsymbol{w} \cdot \boldsymbol{c}_{1} + \boldsymbol{w} \cdot \boldsymbol{c}_{2} +...+ \boldsymbol{w} \cdot \boldsymbol{c}_{k})}}.
$$

The CBOW variant loses the order information between the context's elements. In return, it allows the use of variable-length contexts. However, note that for contexts with bound length, the CBOW can still retain the order information by including the relative position as part of the content element itself, i.e., by assigning different embedding vector to context elements in different relative positions.

Skip-Gram The skip-gram variant of WORD2Vec scoring decouples the dependence between the context elements even further. For a $k$ -elements context $c_{1:k}$ , the skip-gram variant assumes that the elements $c_i$ in the context are independent from each other, essentially treating them as $k$ different contexts, i.e., a word-context pair $(w, c_{i:k})$ will be represented in $D$ as $k$ different contexts: $(w, c_1), \ldots,(w, c_k)$ . The scoring function $s(w, c)$ is defined as in the CBOW version, but now each context is single embedding vector:

$$
P(D = 1 | w, c_{i}) = \frac{1}{1 + e^{- \boldsymbol{w} \cdot \boldsymbol{c}_{i}}}
$$

$$
P(D = 1 | w, c_{1: k}) = \prod_{i = 1}^{k} P(D = 1 | w, c_{i}) = \prod_{1 = i}^{k} \frac{1}{1 + e^{- \boldsymbol{w} \cdot \boldsymbol{c}_{i}}}\tag{10.10}
$$

$$
\log P(D = 1 | w, c_{1: k}) = \sum_{i = 1}^{k} \log \frac{1}{1 + e^{- \boldsymbol{w} \cdot \boldsymbol{c}_{i}}}.
$$

While introducing strong independence assumptions between the elements of the context, the skip-gram variant is very effective in practice, and very commonly used.

## 10.4.3 CONNECTING THE WORLDS

Both the distributional “count-based” method and the distributed “neural” ones are based on the distributional hypothesis, attempting capture the similarity between words based on the similarity between the contexts in which they occur. In fact, Levy and Goldberg [2014] show that the ties between the two worlds are deeper than appear at first sight.

The training of WORD2Vec models result in two embedding matrices, $E^{W} \in R^{|V_{W}| \times d_{emb}}$ and $E^{C} \in R^{|V_{C}| \times d_{emb}}$ representing the words and the contexts, respectively. The context embeddings are discarded after training, and the word embeddings are kept. However, imagine keeping the context embedding matrix $E^{C}$ and consider the product $E^{W} \times E^{C^{\top}} = M' \in R^{|V_{W}| \times |V_{C}|}$ . Viewed this way, WORD2Vec is factorizing an implicit word-context matrix $M'$ . What are the elements of matrix $M'$ ? An entry $M'_{[w,c]}$ corresponds to the dot product of the word and context embedding vectors $w \cdot c$ . Levy and Goldberg show that for the combination of skip-grams contexts and the negative sampling objective with k negative samples, the global objective is minimized by setting $w \cdot c = M'_{[w,c]} = \text{PMI}(w, c) - \log k$ . That is, WORD2Vec is implicitly factorizing a matrix which is closely related to the well-known word-context PMI matrix! Remarkably, it does so without ever explicitly constructing the matrix $M'$ .

The above analysis assumes that the negative samples are sampled according to the corpus frequency of the words $P(w) = \frac{\#(w)}{\sum_{w'} \#(w')}$ . Recall that the WORD2Vec implementation samples instead from a modified distribution $P^{0.75}(w) = \frac{\#(w)^{0.75}}{\sum_{w'} \#(w')^{0.75}}$ . Under this sampling scheme, the optimal value changes to $\mathrm{PMI}^{0.75}(w, c) - \log k = \log \frac{P(w, c)}{P^{0.75}(w)P(c)} - \log k$ . Indeed, using this modified version of PMI when constructing sparse and explicit distributional vectors improves the similarity in that setup as well.

The WORD2Vec algorithms are very effective in practice, and are highly scalable, allowing to train word representations with very large vocabularies over billions of words of text in a matter of hours, with very modest memory requirements. The connection between the SGNS variant of WORD2Vec and word-context matrix-factorization approaches ties the neural methods and the traditional “count-based” ones, suggesting that lessons learned in the study of “distributional” representation can transfer to the “distributed” algorithms, and vice versa, and that in a deep sense the two algorithmic families are equivalent.

## 10.4.4 OTHER ALGORITHMS

Many variants on the WORD2Vec algorithms exist, none of which convincingly produce qualitatively or quantitatively superior word representations. This sections list a few of the popular ones.

NCE The noise-contrastive estimation (NCE) approach of Mth and Kavukeuoglu [2013] is very similar to the SGNS variant of WORD2Vec, but instead of modeling $P(D = 1 \mid w, c_i)$ as in

Equation (10.10), it is modeled as:

$$
P(D = 1 \mid w, c_{i}) = \frac{e^{- \boldsymbol{w} \cdot \boldsymbol{c}_{i}}}{e^{- \boldsymbol{w} \cdot \boldsymbol{c}_{i}} + k \times q(w)}\tag{10.11}
$$

$$
P(D = 0 \mid w, c_{i}) = \frac{k \times q(w)}{e^{- \boldsymbol{w} \cdot \boldsymbol{c}_{i}} + k \times q(w)},\tag{10.12}
$$

where $q(w) = \frac{\#(w)}{|D|}$ is the observed unigram frequency of w in the corpus. This algorithm is based on the noise-contrastive estimation probability modeling technique [Gutmann and Hyvärinen, 2010]. According to Levy and Goldberg [2014], this objective is equivalent to factorizing the word-context matrix whose entries are the log conditional probabilities $\log P(w|c) - \log k$ .

GloVe The GloVe algorithm [Peunington et al., 2014] constructs an explicit word-context matrix, and trains the word and context vectors w and c attempting to satisfy:

$$
\boldsymbol{w} \cdot \boldsymbol{c} + \boldsymbol{b}_{[w]} + \boldsymbol{b}_{[c]} = \log \#(w, c) \quad \forall(w, c) \in D,\tag{10.13}
$$

where $b_{[w]}$ and $b_{[c]}$ are word-specific and context-specific trained biases. The optimization procedure looks at observed word context pairs while skipping zero count events. In terms of matrix factorization, if we fix $\boldsymbol{b}_{[w]} = \log\#(\boldsymbol{w})$ and $\boldsymbol{b}_{[c]} = \log\#(\boldsymbol{c})$ we'll get an objective that is very similar to factorizing the word-context PMI matrix, shifted by $\log(|D|)$ . However, in GloVe these parameters are learned and not fixed, giving it another degree of freedom. The optimization objective is weighted least-squares loss, assigning more weight to the correct reconstruction of frequent items. Finally, when using the same word and context vocabularies, the GloVe model suggests representing each word as the sum of its corresponding word and context embedding vectors.

## 10.5 THE CHOICE OF CONTEXTS

The choice of context by which a word is predicted has a profound effect on the resulting word vectors and the similarities they encode.

In most cases, the contexts of a word are taken to be other words that appear in its surrounding, either in a short window around it, or within the same sentence, paragraph or document. In some cases the text is automatically parsed by a syntactic parser, and the contexts are derived from the syntactic neighborhood induced by the automatic parse trees. Sometimes, the definitions of words and context change to include also parts of words, such as prefixes or suffixes.

## 10.5.1 WINDOW APPROACH

The most common approach is a sliding window approach, in which auxiliary tasks are created by looking at a sequence of $2m + 1$ words. The middle word is called the focus word and the m words to each side are the contexts. Then, either a single task is created in which the goal is to predict the focus word based on all of the context words (represented either using CBOW [Mikolov et al.,

## 10. PRE-TRAINED WORD REPRESENTATIONS

[2013b] or vector concatenation [Collobert and Weston, 2008]), or $2m$ distinct tasks are created, each pairing the focus word with a different context word. The $2m$ tasks approach, popularized by Mikolov et al. [2013a] is referred to as a skip-gram model. Skip-gram-based approaches are shown to be robust and efficient to train [Mikolov et al., 2013a, Pennington et al., 2014], and often produce state of the art results.

Effect of Window Size The size of the sliding window has a strong effect on the resulting vector similarities. Larger windows tend to produce more topical similarities (i.e., “dog,” “bark” and “leash” will be grouped together, as well as “walked,” “run” and “walking”), while smaller windows tend to produce more functional and syntactic similarities (i.e., “Poodle,” “Pitbull,” “Rottweiler,” or “walking,” “running,” “approaching”).

Positional Windows When using the CBOW or skip-gram context representations, all the different context words within the window are treated equally. There is no distinction between context words that are close to the focus words and those that are farther from it, and likewise there is no distinction between context words that appear before the focus words to context words that appear after it. Such information can easily be factored in by using positional contexts: indicating for each context word also its relative position to the focus words (i.e., instead of the context word being “the” it becomes “the:+2,” indicating the word appears two positions to the right of the focus word). The use of positional context together with smaller windows tend to produce similarities that are more syntactic, with a strong tendency of grouping together words that share a part of speech, as well as being functionally similar in terms of their semantics. Positional vectors were shown by Ling et al. [2015a] to be more effective than window-based vectors when used to initialize networks for part-of-speech tagging and syntactic dependency parsing.

Variants Many variants on the window approach are possible. One may lemmatize words before learning, apply text normalization, filter too short or too long sentences, or remove capitalization (see, e.g., the pre-processing steps described by dos Santos and Gatti [2014]). One may subsample part of the corpus, skipping with some probability the creation of tasks from windows that have too common or too rare focus words. The window size may be dynamic, using a different window size at each turn. One may weigh the different positions in the window differently, focusing more on trying to predict correctly close word-context pairs than further away ones. Each of these choices is a hyperparameter to be manually set before training, and will effect the resulting vectors. Ideally, these will be tuned for the task at hand. Much of the strong performance of the WORD2VEC implementation can be attributed to specifying good default values for these hyperparameters. Some of these hyperparameters (and others) are discussed in detail in Levy et al. [2015].

## 10.5.2 SENTENCES, PARAGRAPHS, OR DOCUMENTS

Using a skip-gram (or CBOW) approach, one can consider the contexts of a word to be all the other words that appear with it in the same sentence, paragraph, or document. This is equivalent to using very large window sizes, and is expected to result in word vectors that capture topical similarity (words from the same topic, i.e., words that one would expect to appear in the same document, are likely to receive similar vectors).

## 10.5.3 SYNTACTIC WINDOW

Some work replace the linear context within a sentence with a syntactic one [Bansal et al., 2014, Levy and Goldberg, 2014]. The text is automatically parsed using a dependency parser, and the context of a word is taken to be the words that are in its proximity in the parse tree, together with the syntactic relation by which they are connected. Such approaches produce highly functional similarities, grouping together words than can fill the same role in a sentence (e.g., colors, names of schools, verbs of movement). The grouping is also syntactic, grouping together words that share an inflection [Levy and Goldberg, 2014].

The effect of context The following table, taken from Levy and Goldberg [2014], shows the top-5 most similar words to some seed words, when using bag-of-words windows of size 5 and 2 (BoW5 and BoW2), as well as dependency-based contexts (DEPS), using the same underlying corpora (Wikipedia), and the same embeddings algorithm (WORD2VEC).

Notice how for some words (e.g., batman) the induced word similarities are somewhat agnostic to the contexts, while for others there is a clear trend: the larger window contexts result in more topical similarities (hogwars is similar to other terms in the Harry Potter universe, turing is related to computability, dancing is similar to other inflections of the word) while the syntactic-dependency contexts result in more functional similarities (hogwarts similar to other fictional or non-fictional schools, turing is similar to other scientists, and dancing to other gerunds of entrainment activities). The smaller context window is somewhere in between the two.

This re-affirms that context choices strongly affects the resulting word representations, and stresses the need to take the choice of context into consideration when using “unsupervised” word embeddings.

<table><tr><td>Target Word</td><td>BoW5</td><td>BoW2</td><td>Page</td></tr><tr><td rowspan="5">batman</td><td>nightwing</td><td>superman</td><td>superman</td></tr><tr><td>aquaman</td><td>superboy</td><td>superboy</td></tr><tr><td>catwoman</td><td>aquaman</td><td>supergirl</td></tr><tr><td>superman</td><td>catwoman</td><td>catwoman</td></tr><tr><td>manhunter</td><td>batgirl</td><td>aquaman</td></tr><tr><td rowspan="5">hogwarts</td><td>dumbledore</td><td>overnight</td><td>sunnydale</td></tr><tr><td>hallows</td><td>sunnydale</td><td>collinwood</td></tr><tr><td>half-blood</td><td>garderobe</td><td>calarts</td></tr><tr><td>malfoy</td><td>blandings</td><td>greendale</td></tr><tr><td>snape</td><td>collinwood</td><td>millfield</td></tr><tr><td rowspan="5">turing</td><td>nondeterministic</td><td>non-deterministic</td><td>pauling</td></tr><tr><td>non-deterministic</td><td>finite-state</td><td>hotelling</td></tr><tr><td>computability</td><td>nondeterministic</td><td>heting</td></tr><tr><td>deterministic</td><td>buchi</td><td>lessing</td></tr><tr><td>finite-state</td><td>primality</td><td>hamming</td></tr><tr><td rowspan="5">florida</td><td>gainesville</td><td>fla</td><td>texas</td></tr><tr><td>fla</td><td>alabama</td><td>louisiana</td></tr><tr><td>jacksonville</td><td>gainesville</td><td>georgia</td></tr><tr><td>tampa</td><td>tallahassee</td><td>california</td></tr><tr><td>lauderdale</td><td>texas</td><td>carolina</td></tr><tr><td rowspan="5">object-oriented</td><td>aspect-oriented</td><td>aspect-oriented</td><td>event-driven</td></tr><tr><td>smalltalk</td><td>event-driven</td><td>domain-specific</td></tr><tr><td>event-driven</td><td>objective-c</td><td>rule-based</td></tr><tr><td>prolog</td><td>dataflow</td><td>data-driven</td></tr><tr><td>domain-specific</td><td>4gl</td><td>human-centered</td></tr><tr><td rowspan="5">dancing</td><td>singing</td><td>singing</td><td>singing</td></tr><tr><td>dance</td><td>dance</td><td>rapping</td></tr><tr><td>dances</td><td>dances</td><td>breakdancing</td></tr><tr><td>dancers</td><td>breakdancing</td><td>miming</td></tr><tr><td>tap-dancing</td><td>clowning</td><td>busking</td></tr></table>

## 10.5.4 MULTILINGUAL

Another option is using multilingual, translation-based contexts [Faruqui and Dyer, 2014, Hermann and Blunsom, 2014]. For example, given a large amount of sentence-aligned parallel text, one can run a bilingual alignment model such as the IBM model 1 or model 2 (i.e., using the GIZA++ software), and then use the produced alignments to derive word contexts. Here, the context of a word instance is the foreign language words that are aligned to it. Such alignments tend to result in synonym words receiving similar vectors. Some authors work instead on the sentence alignment level, without relying on word alignments [Gouws et al., 2015] or train an end-to-end machine-translation neural network and use the resulting word embeddings [Hill et al., 2014]. An appealing method is to mix a monolingual window-based approach with a multilingual approach, creating both kinds of auxiliary tasks. This is likely to produce vectors that are similar to the window-based approach, but reducing the somewhat undesired effect of the window-based approach in which antonyms (e.g., hot and cold, high and low) tend to receive similar vectors [Farajini and Dyer, 2014]. For further discussion on multilingual word embeddings and a comparison of different methods see Levy et al. [2017].

## 10.5.5 CHARACTER-BASED AND SUB-WORD REPRESENTATIONS

An interesting line of work attempts to derive the vector representation of a word from the characters that compose it. Such approaches are likely to be particularly useful for tasks which are syntactic in nature, as the character patterns within words are strongly related to their syntactic function. These approaches also have the benefit of producing very small model sizes (only one vector for each character in the alphabet together with a handful of small matrices needs to be stored), and being able to provide an embedding vector for every word that may be encountered. dos Santos and Guiti [2014], dos Santos and Zadrozny [2014], and Kim et al. [2015] model the embedding of a word using a convolutional network (see Chapter 13) over the characters. Lang et al. [2015b] model the embedding of a word using the concatenation of the final states of two RNN (LSTM) encoders (Chapter 14), one reading the characters from left to right, and the other from right to left. Both produce very strong results for part-of-speech tagging. The work of Ballosteros et al. [2015] show that the two-LSTMs encoding of Ling et al. [2015b] is beneficial also for representing words in dependency parsing of morphologically rich languages.

Deriving representations of words from the representations of their characters is motivated by the unknown words problem—what do you do when you encounter a word for which you do not have an embedding vector? Working on the level of characters alleviates this problem to a large extent, as the vocabulary of possible characters is much smaller than the vocabulary of possible words. However, working on the character level is very challenging, as the relationship between form (characters) and function (syntax, semantics) in language is quite loose. Restricting oneself to stay on the character level may be an unnecessarily hard constraint. Some researchers propose a middle-ground, in which a word is represented as a combination of a vector for the word itself with vectors of sub-word units that comprise it. The sub-word embeddings then help in sharing information between different words with similar forms, as well as allowing back-off to the sub-word level when the word is not observed. At the same time, the models are not forced to rely solely on form when enough observations of the word are available. Botha and Blunsom [2014]

## 10. PRE-TRAINED WORD REPRESENTATIONS

suggest to model the embedding vector of a word as a sum of the word-specific vector if such vector is available, with vectors for the different morphological components that comprise it (the components are derived using Morfessor [Creutz and Lagus, 2007], an unsupervised morphological segmentation method). Gao et al. [2014] suggest using as core features not only the word form itself but also a unique feature (hence a unique embedding vector) for each of the letter-trigrams in the word.

Another middle ground between characters and words is breaking up words into “meaningful units” which are larger than characters and are automatically derived from the corpus. One such approach is to use Byte-Pair Encoding (BPE) [Gage, 1994], which was introduced by Sennrich et al. [2016a] in the context of Machine Translation and proved to be very effective. In the BPE approach, one decides on a vocabulary size (say 10,000), and then looks for 10,000 units that can represent all the words in the corpus vocabulary according to the following algorithm, taken from Sennrich et al. [2016a].

We initialize the symbol vocabulary with the character vocabulary, and represent each word as a sequence of characters, plus a special end-of-word symbol ‘’, which allows us to restore the original tokenization after translation. We iteratively count all symbol pairs and replace each occurrence of the most frequent pair (A, B) with a new symbol AB. Each merge operation produces a new symbol which represents a character n-gram. Frequent character n-grams (or whole words) are eventually merged into a single symbol, thus BPE requires no shortlist. The final symbol vocabulary size is equal to the size of the initial vocabulary, plus the number of merge operations—the latter is the only hyperparameter of the algorithm. For efficiency, we do not consider pairs that cross word boundaries. The algorithm can thus be run on the dictionary extracted from a text, with each word being weighted by its frequency.

## 10.6 DEALING WITH MULTI-WORD UNITS AND WORD INFLECTIONS

Two issues that are still under-explored with respect to word representations have to do with the definition of a word. The unsupervised word embedding algorithms assume words correspond to tokens (consecutive characters without whitespace or punctuation, see the "What is a word?" discussion in Section 6.1). This definition often breaks.

In English, we have many multi-token units such as New York and ice cream, as well as looser cases such as Boston University or Volga River, that we may want to assign to single vectors.

In many languages other than English, rich morphological inflection systems make forms that relate to the same underlying concept look differently. For example, in many languages adjectives are inflected for number and gender, causing the word yellow describing a plural, masculine noun to have a different form from the word yellow describing a singular, feminine noun. Even worse, as the inflection system also dictates the forms of the neighboring words (nouns near the singular feminine form of yellow are themselves in a singular feminine form), different inflections of the same word often do not end up similar to each other.

While there are no good solutions to either of these problems, they can both be addressed to a reasonable degree by deterministically pre-processing the text such that it better fits the desired definitions of words.

In the multi-token units case, one can derive a list of such multi-token items, and replace them in the text with single entities (i.e., replacing occurrences of New York with New\_York. Mikolov et al. [2013a] proposes a PMI-based method for automatically creating such a list, by considering the PMI of a word pair, and merging pairs with PMI scores that pass some predefined thresholds. The process then iteratively repeats to merge pairs + words into triplets, and so on. Then, the embedding algorithm is run over the pre-processed corpus. This coarse but effective heuristic is implemented as part of the Word2Vec package, allowing to derive embeddings also for some prominent multi-token items. $^{8}$

In the inflections case, one can mitigate the problem to a large extent by pre-processing the corpus by lemmatizing some or all of the words, embedding the lemmas instead of the inflected forms.

A related pre-processing is POS-tagging the corpus, and replacing words with (word,POS) pairs, creating, for example, the two different token types bookNOUN and bookVERB, that will each receive a different embedding vector. For further discussion on the interplay of morphological inflections and word embeddings algorithms see Avraham and Goldberg [2017], Cotterell and Schutze [2015].

## 10.7 LIMITATIONS OF DISTRIBUTIONAL METHODS

The distributional hypothesis offers an appealing platform for deriving word similarities by representing words according to the contexts in which they occur. It does, however, have some inherent limitations that should be considered when using the derived representations.

Definition of similarity The definition of similarity in distributional approaches is completely operational: words are similar if used in similar contexts. But in practice, there are many facets of similarity. For example, consider the words dog, cat, and tiger. On the one hand, cat is more similar to dog than to tiger, as both are pets. On the other hand, cat can be considered more similar to tiger than to dog as they are both felines. Some facets may be preferred over others in certain use cases, and some may not be attested by the text as strongly as others. The distributional methods provide very little control over the kind of similarities they induce. This could be controlled to some extent by the choice of conditioning contexts (Section 10.5), but it is far from being a complete solution. BlackSheeps When using texts as the conditioning contexts, many of the more “trivial” properties of the word may not be reflected in the text, and thus not captured in the representation. This happens because of a well-documented bias in people’s use of language, stemming from efficiency constraints on communication: people are less likely to mention known information than they are

## 10. PRE-TRAINED WORD REPRESENTATIONS

to mention novel one. Thus, when people talk of white sheep, they will likely refer to them as sheep, while for black sheep they are much more likely to retain the color information and say black sheep. A model trained on text data only can be greatly misled by this.

Antonyms Words that are the opposite of each other (good vs. bad, buy vs. sell, hot vs cold) tend to appear in similar contexts (things that can be hot can also be cold, things that are bought are often sold). As a consequence, models based on the distributional hypothesis tend to judge antonyms as very similar to each other.

Corpus Biases For better or worse, the distributional methods reflect the usage patterns in the corpora on which they are based, and the corpora in turn reflect human biases in the real world (cultural or otherwise). Indeed, Caliskan-Islam et al. [2016] found that distributional word vectors encode “every linguistic bias documented in psychology that we have looked for,” including racial and gender stereotypes (i.e., European American names are closer to pleasant terms while African American names are closer to unpleasant terms; female names are more associated with family terms than with career terms; it is possible to predict the percentage of women in an occupation according to U.S. census based on the vector representation of the occupation name). Like with the antonyms case, this behavior may or may not be desired, depending on the use case: if our task is to guess the gender of a character, knowing that nurses are stereotypically females while doctors are stereotypically males may be a desired property of the algorithm. In many other cases, however, we would like to ignore such biases. In any case, these tendencies of the induced word similarities should be taken into consideration when using distributional representations. For further discussion, see Caliskan-Islam et al. [2016] and Bolukbasi et al. [2016].

Lack of Context The distributional approaches aggregate the contexts in which a term occurs in a large corpus. The result is a word representation which is context independent. In reality, there is no such thing as a context-independent meaning for a word. As argued by Firth [1935], “the complete meaning of a word is always contextual, and no study of meaning apart from context can be taken seriously”. An obvious manifestation of this is the case of polysemy: some words have obvious multiple senses: a bank may refer to a financial institution or to the side of a river, a star may an abstract shape, a celebrity, an astronomical entity, and so on. Using a single vector for all forms is problematic. In addition to the multiple senses problem, there are also much subtler context-dependent variations in word meaning.

# Using Word Embeddings

In Chapter 10 we discussed algorithms for deriving word vectors from large quantities of unannotated text. Such vectors can be very useful as initialization for the word embedding matrices in dedicated neural networks. They also have practical uses on their own, outside the context of neural networks. This chapter discusses some of these uses.

Notation In this chapter, we assume each word is assigned an integer index, and use symbols such as w or $w_{i}$ to refer to both a word and its index. $E_{[w]}$ is then the row in E corresponding to word w. We sometimes use w, $w_{i}$ to denote the vectors corresponding to w and $w_{i}$ .


---
title: "Chapter 13 \u2014 Ngram Detectors: Convolutional Neural Networks"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 13
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 3102
source_line_end: 3298
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 6
source_empty_image_alt: 6
non_semantic_image_alt: 2
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

# Chapter 13 — Ngram Detectors: Convolutional Neural Networks

> [[../README|本书目录]] · [[12-chapter-12-case-study-a-feed-forward-architecture-for-sentence-meaning-i|上一章]] · [[14-chapter-14-recurrent-neural-networks-modeling-sequences-and-stacks|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 3102–3298。
> - 本章保留 6 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Ngram Detectors: Convolutional Neural Networks

Sometimes we are interested in making predictions based on ordered sets of items (e.g., the sequence of words in a sentence, the sequence of sentences in a document, and so on). Consider, for example, predicting the sentiment (positive, negative, or neutral) of sentences such as the following.

\- Part of the charm of Satin Rouge is that it avoids the obvious with humor and lightness.

- Still, this flick is fun and host to some truly excellent sequences.

Some of the sentence words are very informative of the sentiment (charm, fun, excellent) other words are less informative (Still, host, flick, lightness, obvious, avoids) and to a good approximation, an informative clue is informative regardless of its position in the sentence. We would like to feed all of the sentence words into a learner, and let the training process figure out the important clues. One possible solution is feeding a CBOW representation into a fully connected network such as an MLP. However, a downside of the CBOW approach is that it ignores the ordering information completely, assigning the sentences “it was not good, it was actually quite bad” and “it was not bad, it was actually quite good” the exact same representation. While the global positions of the indicators “not good” and “not bad” do not matter for the classification task, the local ordering of the words (that the word “not” appears right before the word “bad”) is very important. Similarly, in the corpus-based example Montias pumps a lot of energy into his nuanced narrative, and surrounds himself with a cast of quirky—but not stereotyped—street characters, there is a big difference between “not stereotyped” (positive indicator) and “not nuanced” (negative indicator). While the examples above are simple cases of negation, some patterns are not as obvious, e.g., “avoids the obvious” vs. “obvious” or vs. “avoids the charm” in the first example. In short, looking at ngrams is much more informative than looking at a bag-of-words.

A naive approach would suggest embedding word-pairs (bi-grams) or word-triplets (trigrams) rather than words, and building a CBOW over the embedded ngrams. While such an architecture is indeed quite effective, it will result huge embedding matrices, will not scale for longer ngrams, and will suffer from data sparsity problems as it does not share statistical strength between different ngrams (the embedding of “quite good” and “very good” are completely independent of one another, so if the learner saw only one of them during training, it will not be able to deduce anything about the other based on its component words).

## 152 13. NGRAM DETECTORS: CONVOLUTIONAL NEURAL NETWORKS

The CNN architecture This chapter introduces the convolution-and-pooling (also called convolutional neural networks, or CNNs) architecture, which is tailored to this modeling problem. A convolutional neural network is designed to identify indicative local predictors in a large structure, and to combine them to produce a fixed size vector representation of the structure, capturing the local aspects that are most informative for the prediction task at hand. I.e., the convolutional architecture will identify ngrams that are predictive for the task at hand, without the need to pre-specify an embedding vector for each possible ngram. (In Section 13.2, we discuss an alternative method that allows working with unbounded ngram vocabularies while keeping a bounded size embedding matrix). The convolutional architecture also allows to share predictive behavior between ngrams that share similar components, even if the exact ngram was never seen at test time.

The convolutional architecture could be expanded into a hierarchy of convolution layers, each one effectively looking at a longer range of ngrams in the sentence. This also allows the model to be sensitive to some non-contiguous ngrams. This is discussed in Section 13.3.

As discussed in the opening section of this part of the book, the CNN is in essence a feature-extracting architecture. It does not constitute a standalone, useful network on its own, but rather is meant to be integrated into a larger network, and to be trained to work in tandem with it in order to produce an end result. The CNN layer's responsibility is to extract meaningful sub-structures that are useful for the overall prediction task at hand.

History and Terminology Convolution-and-pooling architectures [LeCim and Bengio, 1995] evolved in the neural networks vision community, where they showed great success as object detectors—recognizing an object from a predefined category (“cat,” “bicycles”) regardless of its position in the image [Krizhevsky et al., 2012]. When applied to images, the architecture is using 2D (grid) convolutions. When applied to text, we are mainly concerned with 1D (sequence) convolutions. Convolutional networks were introduced to the NLP community in the pioneering work of Collobert et al. [2011] who used them for semantic-role labeling, and later by Kalchbrenner et al. [2014] and Kim [2014] who used them for sentiment and question-type classification.

Because of their origins in the computer-vision community, a lot of the terminology around convolutional neural networks is borrowed from computer vision and signal processing, including terms such as filter, channel, and receptive-field which are often used also in the context of text processing. We will mention these terms when introducing the corresponding concepts.

## 13.1 BASIC CONVOLUTION + POOLING

The main idea behind a convolution and pooling architecture for language tasks is to apply a nonlinear (learned) function over each instantiation of a k-word sliding window over the sentence. $^{1}$ This function (also called “filter”) transforms a window of k words into a scalar value. Several such filters can be applied, resulting in $\ell$ dimensional vector (each dimension corresponding to a filter)

that captures important properties of the words in the window. Then, a “pooling” operation is used to combine the vectors resulting from the different windows into a single $\ell$ -dimensional vector, by taking the max or the average value observed in each of the $\ell$ dimensions over the different windows. The intention is to focus on the most important “features” in the sentence, regardless of their location—each filter extracts a different indicator from the window, and the pooling operation zooms in on the important indicators. The resulting $\ell$ -dimensional vector is then fed further into a network that is used for prediction. The gradients that are propagated back from the network’s loss during the training process are used to tune the parameters of the filter function to highlight the aspects of the data that are important for the task the network is trained for. Intuitively, when the sliding window of size k is run over a sequence, the filter function learns to identify informative kgrams. Figure 13.2 illustrates an application of a convolution-and-pooling network over a sentence.

## 13.1.1 1D CONVOLUTIONS OVER TEXT

We begin by focusing on the one-dimensional convolution operation. $^{2}$ The next section will focus on pooling.

Consider a sequence of words $w_{1:n}=w_{1},\ldots,w_{n}$ , each with their corresponding $d_{emb}$ dimensional word embedding $E_{[w_{i}]}=w_{i}$ . A 1D convolution of width-k works by moving a sliding-window of size k over the sentence, and applying the same “filter” to each window in the sequence, where a filter is a dot-product with a weight vector u, which is often followed by a nonlinear activation function. Define the operator $\oplus(w_{i:i+k-1})$ to be the concatenation of the vectors $w_{i},\ldots,w_{i+k-1}$ . The concatenated vector of the ith window is then $x_{i}=\oplus(w_{i:i+k-1})=[w_{i};w_{i+1};\ldots;w_{i+k-1}]$ , $x_{i}\in R^{k\cdot d_{emb}}$ .

We then apply the filter to each window-vector, resulting scalar values $p_{i}$ :

$$
p_{i} = g(\boldsymbol{x}_{i} \cdot \boldsymbol{u})\tag{13.1}
$$

$$
x_{i} = \oplus(w_{i: i + k - 1})\tag{13.2}
$$

$$
p_{i} \in \mathbb{R} \quad \boldsymbol{x}_{i} \in \mathbb{R}^{k \cdot d_{\mathrm{emb}}} \quad \boldsymbol{u} \in \mathbb{R}^{k \cdot d_{\mathrm{emb}}},
$$

where g is a nonlinear activation.

It is customary to use $\ell$ different filters, $u_{1}, \ldots, u_{\ell}$ , which can be arranged into a matrix U, and a bias vector b is often added:

$$
\mathbf{p}_{i} = g(\boldsymbol{x}_{i} \cdot \boldsymbol{U} + \boldsymbol{b})\tag{13.3}
$$

$$
\boldsymbol{p}_{i} \in \mathbb{R}^{\ell} \quad \boldsymbol{x}_{i} \in \mathbb{R}^{k \cdot d_{\mathrm{emb}}} \quad \boldsymbol{U} \in \mathbb{R}^{k \cdot d_{\mathrm{emb}} \times \ell} \quad \boldsymbol{b} \in \mathbb{R}^{\ell}.
$$

Each vector $p_{i}$ is a collection of $\ell$ values that represent (or summarize) the i th window. Ideally, each dimension captures a different kind of indicative information.

## 154 13. NGRAM DETECTORS: CONVOLUTIONAL NEURAL NETWORKS

Narrow vs. Wide Convolutions How many vectors $p_i$ do we have? For a sentence of length $n$ with a window of size $k$ , there are $n - k + 1$ positions in which to start the sequence, and we get $n - k + 1$ vectors $p_{1:n-k+1}$ . This is called a narrow convolution. An alternative is to pad the sentence with $k - 1$ padding-words to each side, resulting in $n + k + 1$ vectors $p_{1:n+k+1}$ . This is called a wide convolution [Kalchbrenner et al., 2014]. We use $m$ to denote the number of resulting vectors.

An Alternative Formulation of Convolutions In our description of convolutions over a sequence of $n$ items $w_{1:n}$ each item is associated with a $d$ -dimensional vector, and the vector are concatenated into a large $1 \times d \cdot n$ sentence vector. The convolution network with a window of size $k$ and $\ell$ output values is then based on a $k \cdot d \times \ell$ matrix. This matrix is applied to segments of the $1 \times d \cdot n$ sentence matrix that correspond to $k$ -word windows. Each such multiplication results in $\ell$ values. Each of these $k$ values can be thought of as the result of a dot product between a $k \cdot d \times 1$ vector (a row in the matrix) and a sentence segment.

Another (equivalent) formulation that is often used in the literature is one in which the n vectors are stacked on top of each other, resulting in an $n \times d$ sentence matrix. The convolution operation is then performed by sliding $\ell$ different $k \times d$ matrices (called “kernels” or “filters”) over the sentence matrix, and performing a matrix convolution between each kernel and the corresponding sentence-matrix segment. The matrix convolution operation between two matrices is defined as performing element-wise multiplication of the two matrices, and summing the results. Each of the $\ell$ sentence-kernel convolution operations produces a single value, for a total of $\ell$ values. It is easy to convince oneself that the two approaches are indeed equivalent, by observing that each kernel corresponds to a row in the $k \cdot d \times \ell$ matrix, and the convolution with a kernel corresponds to a dot-product with a matrix row.

Figure 13.1 show narrow and wide convolutions in the two notations.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/17dc10041eca03999062aaa51da1deceae46b9ceb48e6e18bd0bc6b3f88b1444.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/fd1df47be1379b37d575851d9ba360def5b2fe6af4f94e34d4a7b8f3d5622f20.jpg)  
(b)  
Figure 13.1: The inputs and outputs of a narrow and a wide convolution in the vector-concatenation and the vector-stacking notations. (a) A narrow convolution with a window of size k = 2 and 3-dimensional output ( $\ell = 3$ ), in the vector-concatenation notation. (b) A wide convolution with a window of size k = 2, a 3-dimensional output ( $\ell = 3$ ), in the vector-stacking notation.

Channels In computer vision, a picture is represented as a collection of pixels, each representing the color intensity of a particular point. When using an RGB color scheme, each pixel is a combination of three intensity values—one for each of the Red, Green, and Blue components. These are then stored in three different matrices. Each matrix provides a different “view” of the image, and is referred to as a Channel. When applying a convolution to an image in computer vision, it is common to apply a different set of filters to each channel, and then combine the three resulting vectors into a single vector. Taking the different-views-of-the-data metaphor, we can have multiple channels in text processing as well. For example, one channel will be the sequence of words, while another channel is the sequence of corresponding POS tags. Applying the convolution over the words will result in m vectors $p_{1:m}^{w}$ , and applying it over the POS-tags will result in m vectors $p_{1:m}^{t}$ . These two views can then be combined either by summation $p_{i} = p_{i}^{w} + p_{i}^{t}$ or by concatenation $p_{i} =[p_{i}^{w}; p_{i}^{t}]$ .

To summarize The main idea behind the convolution layer is to apply the same parameterized function over all k-grams in the sequence. This creates a sequence of m vectors, each representing a particular k-gram in the sequence. The representation is sensitive to the identity and order of the words within a k-gram, but the same representation will be extracted for a k-gram regardless of its position within the sequence.

## 13.1.2 VECTOR POOLING

Applying the convolution over the text results in m vectors $p_{1:m}$ , each $p_{i} \in R^{\ell}$ . These vectors are then combined (pooled) into a single vector $c \in R^{\ell}$ representing the entire sequence. Ideally, the vector c will capture the essence of the important information in the sequence. The nature of the important information that needs to be encoded in the vector c is task dependent. For example, if we are performing sentiment classification, the essence are informative ngrams that indicate sentiment, and if we are performing topic-classification, the essence are informative ngrams that indicate a particular topic.

During training, the vector c is fed into downstream network layers (i.e., an MLP), culminating in an output layer which is used for prediction. $^{3}$ The training procedure of the network calculates the loss with respect to the prediction task, and the error gradients are propagated all the way back through the pooling and convolution layers, as well as the embedding layers. The training process tunes the convolution matrix U, the bias vector b, the downstream network, and potentially also the embeddings matrix E such that the vector c resulting from the convolution and pooling process indeed encodes information relevant to the task at hand. $^{4}$

Max-pooling The most common pooling operation is max pooling, taking the maximum value across each dimension.

$$
\boldsymbol{c}_{[j]} = \max_{1 < i \leq m} \boldsymbol{p}_{i[j]} \quad \forall j \in[1, \ell],\tag{13.4}
$$

$p_{i[j]}$ denotes the jth component of $p_{i}$ . The effect of the max-pooling operation is to get the most salient information across window positions. Ideally, each dimension will “specialize” in a particular sort of predictors, and max operation will pick on the most important predictor of each type.

Figure 13.2 provides an illustration of the convolution and pooling process with a max-pooling operation.

![Figure 13.2](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/69f3376f187cd3e4dd0625fdf6bdd73e6a19049577d88aae84af90c589573853.jpg)  
Figure 13.2: 1D convolution+pooling over the sentence “the quick brown fox jumped over the lazy dog.” This is a narrow convolution (no padding is added to the sentence) with a window size of 3. Each word is translated to a 2-dim embedding vector (not shown). The embedding vectors are then concatenated, resulting in 6-dim window representations. Each of the seven windows is transferred through a $6 \times 3$ filter (linear transformation followed by element-wise tanh), resulting in seven 3-dimensional filtered representations. Then, a max-pooling operation is applied, taking the max over each dimension, resulting in a final 3-dimensional pooled vector.

Average Pooling The second most common pooling type being average-pooling—taking the average value of each index instead of the max:

$$
c = \frac{1}{m} \sum_{i = 1}^{m} p_{i}.\tag{13.5}
$$

One view of average-pooling is that of taking a continuous bag-of-words (CBOW) of the k-gram representations resulting from the convolutions rather than from the sentence words.

K-max Pooling Another variation, introduced by Kalchbrenner et al. [2014] is k-max pooling operation, in which the top k values in each dimension are retained instead of only the best one, while preserving the order in which they appeared in the text. $^{5}$ For example, consider the following matrix:

$$
\left[\begin{array}{ccc} 1 & 2 & 3 \\ 9 & 6 & 5 \\ 2 & 3 & 1 \\ 7 & 8 & 1 \\ 3 & 4 & 1 \end{array} \right].
$$

A 1-max pooling over the column vectors will result in $[9\quad8\quad5]$ , while a 2-max pooling will result in the following matrix: $\begin{bmatrix}9&6&3\\ 7&8&5\end{bmatrix}$ whose rows will then be concatenated to $[9\quad6\quad3\quad7\quad8\quad5]$ .

The k-max pooling operation makes it possible to pool the k most active indicators that may be a number of positions apart; it preserves the order of the features, but is insensitive to their specific positions. It can also discern more finely the number of times the feature is highly activated [Kalchbrenner et al., 2014].

Dynamic Pooling Rather than performing a single pooling operation over the entire sequence, we may want to retain some positional information based on our domain understanding of the prediction problem at hand. To this end, we can split the vectors $p_{i}$ into r distinct groups, apply the pooling separately on each group, and then concatenate the r resulting $\ell$ -dimensional vectors $c_{1},\ldots,c_{r}$ . The division of the $p_{i}$ s into groups is performed based on domain knowledge. For example, we may conjecture that words appearing early in the sentence are more indicative than words appearing late. We can then split the sequence into r equally sized regions, applying a separate max-pooling to each region. For example, Johnson and Zhang [2015] found that when classifying documents into topics, it is useful to have 20 average-pooling regions, clearly separating the initial sentences (where the topic is usually introduced) from later ones, while for a sentiment classification task a single max-pooling operation over the entire sentence was optimal (suggesting that one or two very strong signals are enough to determine the sentiment, regardless of the position in the sentence).

Similarly, in a relation extraction kind of task we may be given two words and asked to determine the relation between them. We could argue that the words before the first word, the words after the second word, and the words between them provide three different kinds of information [Chen et al., 2015]. We can thus split the $p_i$ vectors accordingly, pooling separately the windows resulting from each group.

## 13.1.3 VARIATIONS

Rather than a single convolutional layer, several convolutional layers may be applied in parallel. For example, we may have four different convolutional layers, each with a different window size in the range 2–5, capturing k-gram sequences of varying lengths. The result of each convolutional layer will then be pooled, and the resulting vectors concatenated and fed to further processing [Kim, 2014].

The convolutional architecture need not be restricted into the linear ordering of a sentence. For example, Ma et al. [2015] generalize the convolution operation to work over syntactic dependency trees. There, each window is around a node in the syntactic tree, and the pooling is performed over the different nodes. Similarly, Liu et al. [2015] apply a convolutional architecture on top of dependency paths extracted from dependency trees. Le and Zuidema [2015] propose performing max pooling over vectors representing the different derivations leading to the same chart item in a chart parser.

## 13.2 ALTERNATIVE: FEATURE HASHING

Convolutional networks for text work as very effective feature detectors for consecutive k-grams. However, they require many matrix multiplications, resulting in non-negligible computation. A more time-efficient alternative would be to just use k-gram embeddings directly, and then pool the k-grams using average pooling (resulting in a continuous-bag-of-ngrams representations) or max pooling. A downside of the approach is that it requires allocating a dedicated embedding vector for each possible k-gram, which can be prohibitive in terms of memory as the number of k-grams in the training corpus can be very large.

A solution to the problems is the use of the feature hashing technique that originated in linear models [Ganchev and Dredze, 2008, Shi et al., 2009, Weinberger et al., 2009] and recently adopted to neural networks [Joulin et al., 2016]. The idea behind feature hashing is that we don't pre-compute vocabulary-to-index mapping. Instead, we allocate an embedding matrix $E$ with $N$ rows ( $N$ should be sufficiently large, but not prohibitive, say in the millions or tens of millions). When a $k$ -gram is seen in training, we assign it to a row in $E$ by applying a hash function $h$ that will deterministically map it into a number in the range $[1, N]$ , $i = h(\text{k-gram}) \in[1, N]$ . We then use the corresponding row $E_{[h(\text{k-gram})]}$ as the embedding vector. Every $k$ -gram will be dynamically assigned a row index this way, without the need to store an explicit kgram-to-index mapping or to dedicate an embedding vector to each $k$ -gram. Some $k$ -grams may share the same embedding vector due to hash collisions (indeed, with the space of possible $k$ -grams being much larger than the number of allocated embedding vectors such collisions are bound to happen), but as most $k$ -grams are not informative for the task the collisions will be smoothed out by the training process. If one wants to be more careful, several distinct hash functions $h_1, \ldots, h_r$ can be used, and each k-gram represented as the sum of the rows corresponding to its hashes ( $\sum_{i=1}^{r} E_{[h_{i}(k\text{-gram})]}$ ). This way, if an informative k-gram happens to collide with another informative k-gram using one hash, it still likely to have a non-colliding representation from one of the other hashes.

This hashing trick (also called hash kernel) works very well in practice, resulting in very efficient bag-of-ngrams models. It is recommended as a go-to baseline before considering more complex approaches or architectures.

## 13.3 HIERARCHICAL CONVOLUTIONS

The 1D convolution approach described so far can be thought of as an ngram detector. A convolution layer with a window of size k is learning to identify indicative k-grams in the input.

The approach can be extended into a hierarchy of convolutional layers, in which a sequence of convolution layers are applied one after the other. Let $\mathrm{CONV}_{\Theta}^{k}(\boldsymbol{w}_{1:n})$ be the result of applying a convolution with window size k and parameters $\Theta$ to each k-size window in the sequence $w_{1:n}$ :

$$
\begin{array}{l} p_{1: m} = \mathrm{CONV}_{\boldsymbol{U}, \boldsymbol{b}}^{k}(\boldsymbol{w}_{1: n}) \\ p_{i} = g(\oplus(\boldsymbol{w}_{i: i + k - 1}) \cdot \boldsymbol{U} + \boldsymbol{b}) \\ m = \left\{\begin{array}{ll} n - k + 1 & \text{narrow convolution} \\ n + k + 1 & \text{wide convolution.} \end{array} \right.\end{array}\tag{13.6}
$$

We can now have a succession of $r$ convolutional layers that feed into each other as follows:

$$
\begin{array}{l} p_{\mathbf{1}: m_{1}}^{\mathbf{1}} = \mathrm{CONV}_{\boldsymbol{U}^{\mathbf{1}}, \boldsymbol{b}^{\mathbf{1}}}^{k_{1}}(\boldsymbol{w}_{\mathbf{1}: n}) \\ p_{\mathbf{1}: m_{2}}^{2} = \mathrm{CONV}_{\boldsymbol{U}^{2}, \boldsymbol{b}^{2}}^{k_{2}}(p_{\mathbf{1}: m_{1}}^{\mathbf{1}}) \\ \dots \end{array}\tag{13.7}
$$

$$
p_{1: m_{r}}^{r} = \mathrm{CONV}_{\boldsymbol{U}^{r}, \boldsymbol{b}^{r}}^{k_{r}}(p_{1: m_{r - 1}}^{r - 1}).
$$

The resulting vectors $p_{1:m_{r}}^{r}$ capture increasingly larger effective windows (“receptive-fields”) of the sentence. For r layers with a window of size k, each vector $p_{i}^{r}$ will be sensitive to a window of $r(k-1)+1$ words. $^{b}$ Moreover, the vector $p_{i}^{r}$ can be sensitive to gappy-ngrams of $k+r-1$ words, potentially capturing patterns such as “not \_\_\_\_ good” or “obvious \_\_\_\_ predictable \_\_\_\_ plot” where \_\_\_\_ stands for a short sequence of words, as well more specialized patterns where the gaps

## 160 13. NGRAM DETECTORS: CONVOLUTIONAL NEURAL NETWORKS

can be further specialized (i.e., “a sequence of words that do not contain not” or “a sequence of words that are adverb-like”). $^{7}$ Figure 13.3 shows a two-layer hierarchical convolution with k = 2.

![Figure 13.3](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/6a8825041ebc22db4c46823b408a39b26a1db5a52deba7079d730f6bdceba894.jpg)  
Figure 13.3: Two-layer hierarchical convolution with k=2.

Strides, Dilation and Pooling So far, the convolution operation is applied to each $k$ -word window in the sequence, i.e., windows starting at indices 1, 2, 3, .... This is said to have a stride of size 1. Larger strides are also possible, i.e., with a stride of size 2 the convolution operation will be applied to windows starting at indices 1, 3, 5, .... More generally, we define $\mathrm{CONV}^{k,s}$ as:

$$
p_{1: m} = \mathrm{CONV}_{\boldsymbol{U}, \boldsymbol{b}}^{k, s}(\boldsymbol{w}_{1: n})\tag{13.8}
$$

$$
\boldsymbol{p}_{i} = g \left(\oplus \left(\boldsymbol{w}_{\mathbf{1} +(i - 1) s:(s + k) i}\right) \cdot \boldsymbol{U} + \boldsymbol{b}\right),
$$

where s is the stride size. The result will be a shorter output sequence from the convolutional layer.

In a dilated convolution architecture [Strubell et al., 2017, Yu and Koltun, 2016] the hierarchy of convolution layers each has a stride size of k-1 (i.e., $CONV^{k,k-1}$ ). This allows an exponential growth in the effective window size as a function of the number of layers. Figure 13.4 shows convolution layers with different stride lengths. Figure 13.5 shows a dilated convolution architecture.

An alternative to the dilation approach is to keep the stride-size fixed at 1, but shorten the sequence length between each layer by applying local pooling, i.e., consecutive $k'$ -gram of vectors can be converted into a single vector using max pooling or averaged pooling. Even if we pool just every two neighboring vectors, each convolutional-and-pooling layer in the hierarchy will halve the length of the sequence. Similar to the dilation approach, we again gain an exponential decrease in sequence length as a function of the number of layers.

![Figure 13.4](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/122beab4687534f660e8658fb226347c603a3866caf3a5d4fd41dacca8d2cd04.jpg)  
Figure 13.4: Strides. (a–c) Convolution layer with k=3 and stride sizes 1, 2, 3.

Parameter Tying and Skip-connections Another variation that can be applied to the hierarchical convolution architecture is performing parameter-tying, using the same set of parameters U, b in all the parameter layers. This results in more parameter sharing, as well as allowing to use an unbounded number of convolution layers (as all the convolution layers share the same parameters, the number of convolution layers need not be set in advance), which in turn allows to reduce arbitrary length sequences into a single vector by using a sequence of narrow convolutions, each resulting in a shorter sequence of vectors.

When using deep architectures, skip-connections are sometimes useful: these work by feeding into the $i$ th layer not only the vectors resulting from the $i - 1$ th layer, but also vectors from previous layers which are combined to the vectors of the i - 1th layer using either concatenation, averaging, or summation.

![Figure 13.5](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/781de11bf1f9b218134a851ba614f65cd11e4b0bddd85f2b4428772598d6181c.jpg)  
Figure 13.5: Three-layer dilated hierarchical convolution with k=3.

Further Reading The use of hierarchical and dilated convolution and pooling architectures is very common in the computer-vision community, where various deep architectures—comprising of arrangements of many convolutions and pooling layers with different strides—have been proposed, resulting in very strong image classification and object recognition results [He et al., 2016, Krizhevsky et al., 2012, Simonyan and Zisserman, 2015]. The use of such deep architectures for NLP is still more preliminary. Zhang et al. [2015] provide initial experiments with text classification with hierarchical convolutions over characters, and Conneau et al. [2016] provide further results, this time with very deep convolutional networks. The work of Strubell et al. [2017] provides a good overview of hierarchical and dilated architectures for a sequence labeling task. Kalchbrenner et al. [2016] use dilated convolutions as encoders in an encoder-decoder architecture (Section 17.2) for machine translation. The hierarchy of convolutions with local pooling approach is used by Xiao and Cho [2016], who apply it to a sequence of character in a document-classification task, and then feed the resulting vectors into a recurrent neural network. We return to this example in Section 16.2.2, after discussing recurrent-neural-networks.


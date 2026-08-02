---
title: "Chapter 16 \u2014 Modeling with Recurrent Networks"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 16
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 3626
source_line_end: 3813
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 3
source_empty_image_alt: 3
non_semantic_image_alt: 1
caption_derived_image_alt: 2
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

# Chapter 16 — Modeling with Recurrent Networks

> [[../README|本书目录]] · [[15-chapter-15-concrete-recurrent-neural-network-architectures|上一章]] · [[17-chapter-17-conditioned-generation|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 3626–3813。
> - 本章保留 3 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Modeling with Recurrent Networks

After enumerating common usage patterns in Chapter 14 and learning the details of concrete RNN architectures in Chapter 15, we now explore the use of RNNs in NLP applications through some concrete examples. While we use the generic term RNN, we usually mean gated architectures such as the LSTM or the GRU. The Simple RNN consistently results in lower accuracies.

## 16.1 ACCEPTORS

The simplest use of RNNs is as acceptors: read in an input sequence, and produce a binary or multi-class answer at the end. RNNs are very strong sequence learners, and can pick-up on very intricate patterns in the data.

This power is often not needed for many natural language classification tasks: the word-order and sentence structure turn out to not be very important in many cases, and bag-of-words or bag-of-ngrams classifier often works just as well or even better than RNN-acceptors.

This section presents two examples of acceptor usages for language problems. The first is a canonical one: sentiment classification. The approach works well, but less powerful approaches can also prove competitive. The second is a somewhat contrived example: it does not solve any “useful” task on its own, but demonstrates the power of RNNs and the kind of patterns they are capable of learning.

## 16.1.1 SENTIMENT CLASSIFICATION

## Sentence-Level Sentiment Classification

In the sentence-level sentiment classification task, we are given a sentence, often as part of a review, and need to assign it one of two values: POSITIVE or NEGATIVE. $^{1}$ This is a somewhat simplistic view of the sentiment detection task—but one which is often used nonetheless. This is also the task that motivated our discussion of convolutional neural networks, in Chapter 13. An example of naturally occurring POSITIVE and NEGATIVE sentences in the movie-reviews domain would be the following: $^{2}$

## 16. MODELING WITH RECURRENT NETWORKS

POSITIVE: It's not life-affirming—it's vulgar and mean, but I liked it.

NEGATIVE: It's a disappointing that it only manages to be decent instead of dead brilliant.

Note that the positive example contains some negative phrases (not life affirming, vulgar, and mean), while the negative examples contains some positive ones (dead brilliant). Correctly predicting the sentiment requires understanding not only the individual phrases but also the context in which they occur, linguistic constructs such as negation, and the overall structure of the sentence. Sentiment classification is a tricky and challenging task, and properly solving it involves handling such issues as sarcasm and metaphor. The definition of sentiment is also not straightforward. For a good overview of the challenges in sentiment classification and its definition, see the comprehensive review by Pang and Lee [2008]. For our current purpose, however, we will ignore the complexities in definition and treat it as a data-driven, binary classification task.

The task is straightforward to model using an RNN-acceptor: after tokenization, the RNN reads in the words of the sentence one at a time. The final RNN state is then fed into an MLP followed by a softmax-layer with two outputs. The network is trained with cross-entropy loss based on the gold sentiment labels. For a finer-grained classification task, where one needs to assign a sentiment on scale of 1–5 or 1–10 (a “star rating”), it is straightforward to change the MLP to produce 5 outputs instead of 2. To summarize the architecture:

$$
\begin{array}{c} p(\text{label} = k \mid w_{1: n}) = \hat{y}_{[k]} \\ \hat{y} = \text{softmax}(\text{MLP}(\text{RNN}(x_{1: n}))) \\ x_{1: n} = E_{[w_{1}], \ldots, E_{[w_{n}]}}.\end{array}\tag{16.1}
$$

The word embeddings matrix E is initialized using pre-trained embeddings learned over a large external corpus using an algorithm such as WORD2VEC or GLOVE with a relatively wide window.

It is often helpful to extend the model in Equation (16.1) by considering two RNNs, one reading the sentence in its given order and the other one reading it in reverse. The end states of the two RNNs are then concatenated and fed into the MLP for classification:

$$
\begin{array}{c} p(\text{label} = k \mid w_{1: n}) = \hat{\mathbf{y}}_{[k]} \\ \hat{\mathbf{y}} = \operatorname{softmax}(\operatorname{MLP}([\operatorname{RNN}^{f}(x_{1: n}); \operatorname{RNN}^{b}(x_{n: 1})])) \\ x_{1: n} = E_{[w_{1}], \dots, E_{[w_{n}]}.} \end{array}\tag{16.2}
$$

These bidirectional models produce strong results for the task [Li et al., 2015].

For longer sentences, Li et al. [2015] found it useful to use a hierarchical architecture, in which the sentence is split into smaller spans based on punctuation. Then, each span is fed into a forward and a backward RNN as described in Equation (16.2). Sequence of resulting vectors (one for each span) are then fed into an RNN acceptor such as the one in Equation (16.1). Formally, given a sentence $w_{1:n}$ which is split into $m$ spans, $w_{1:\ell_1}^1, \ldots, w_{1:\ell_m}^m$ , the architecture is given by:

$$
\begin{array}{c} p(\text{label} = k \mid w_{\mathbf{1}: n}) = \hat{y}_{[k]} \\ \hat{y} = \text{softmax}(\text{MLP}(\text{RNN}(z_{\mathbf{1}: m}))) \\ z_{i} =[\text{RNN}^{f}(x_{\mathbf{1}: \ell_{i}}^{i}); \text{RNN}^{b}(x_{\ell_{i}: \mathbf{1}}^{i})] \\ x_{\mathbf{1}: \ell_{i}}^{i} = E_{[w_{1}^{i}], \ldots, E_{[w_{\ell_{i}}^{i}]}.} \end{array}\tag{16.3}
$$

Each of the m different spans may convey a different sentiment. The higher-level acceptor reads the summary $z_{1:m}$ produced by the lower level encoders, and decides on the overall sentiment.

Sentiment classification is also used as a test-bed for hierarchical, tree-structured recursive neural networks, as described in Chapter 18.

## Document Level Sentiment Classification

The document level sentiment classification is similar to the sentence level one, but the input text is much longer—consisting of multiple sentences—and the supervision signal (sentiment label) is given only at the end, not for the individual sentences. The task is harder than sentence-level classification, as the individual sentences may convey different sentiments than the overall one conveyed by the document.

Tang et al. [2015] found it useful to use a hierarchical architecture for this task, similar to the one used by Li et al. [2015]. [Equation (16.3)]: each sentence $s_{i}$ is encoded using a gated RNN producing a vector $z_{i}$ , and the vectors $z_{1:n}$ are then fed into a second gated RNN, producing a vector $\boldsymbol{h} = \text{RNN}(z_{1:n})$ which is then used for prediction: $\hat{\boldsymbol{y}} = \text{softmax}(\text{MLP}(\boldsymbol{h}))$ .

The authors experimented also with a variant in which all the intermediate vectors from the document-level RNN are kept, and their average is fed into the MLP $(h_{1:n}=RNN^{*}(z_{1:n}),\hat{y}=softmax(MLP(\frac{1}{n}\sum_{i=1}^{n}h_{i}))$ . This produced slightly higher results in some cases.

## 16.1.2 SUBJECT-VERB AGREEMENT GRAMMATICALITY DETECTION

Grammatical English sentences obey the constraint that the head of the subject of a present-tense verb must agree with in on the number inflection (\* denote ungrammatical sentences):

(1) a. The key is on the table.

b. \*The key are on the table.

c. \*The keys is on the table.

d. The keys are on the table.

This relationship is non-trivial to infer from the sequence alone, as the two elements can be separated by arbitrary long sentential material, which may include nouns of the opposite number:

## 188 16. MODELING WITH RECURRENT NETWORKS

(2) a. The keys to the cabinet in the corner of the room are on the table.

b. \*The keys to the cabinet in the corner of the room is on the table.

Given the difficulty in identifying the subject from the linear sequence of the sentence, dependencies such as subject-verb agreement serve as an argument for structured syntactic representations in humans [Everaert et al., 2015]. Indeed, given a correct syntactic parse tree of the sentence, the relation between the verb and its subject becomes trivial to extract:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/8c82230a23bfe2c92aeefd4cda384f40233df4327d9f02390e07c6b54830c396.jpg)

In work with Linzen and Dupoux [Linzen et al., 2016], we set out to find if RNNs, which are sequential learners, can pick up on this rather syntactic regularity, by learning from word sequences alone. We set up several prediction tasks based on naturally occurring text from Wikipedia to test this. One of the tasks was grammaticality detection: the RNN is tasked with reading a sentence, and at the end deciding if it is grammatical or not. In our setup, grammatical sentences were Wikipedia sentences that contain a present-tense verb, while ungrammatical ones are Wikipedia sentences with a present-tense verb in which we picked up one of the present-tense verbs at random and flipped its form from singular to plural or the other way around. $^{3}$ Note that a bag-of-words or bag-of-ngrams model is likely to have a very hard time solving this particular problem, as the dependency between the verb and the subject relies on the structure of the sentence which is lost when moving to a bag-of-words representation, and can also span more than any number of words n.

The model was trained as a straightforward acceptor:

$$
\hat{y} = \operatorname{softmax}(\operatorname{MLP}(\operatorname{RNN}(E_{[w_{1}]}, \dots, E_{[w_{n}]})))
$$

using cross-entropy loss. We had tens of thousands training sentences, and hundreds of thousands test sentences (many of the agreement cases are not hard, and we wanted the test set to contain a substantial amount of hard cases).

This is a hard task, with very indirect supervision: the supervision signal did not include any clue as to where the grammaticality clue is. The RNN had to learn the concept of number (that plural and singular words belong to different groups), the concept of agreement (that the form of the verb should match the form of the subject) and the concept of subjecthood (to identify which of the nouns preceding the verb determines the verb's form). Identification of the correct subject requires learning to identify syntactic markers of nested structures, in order to be able to skip over distracting nouns in nested clauses. The RNN handled the learning task remarkably well, and managed to solve the vast majority (> 99% accuracy) of the test set cases. When focusing on the really hard cases, in which the verb and its subject were separated by 4 nouns of the opposite number, the RNN still managed to get accuracy of over 80%. Note that if it were to learn a heuristic of predicting the number of the last noun, its accuracy would have been 0% on these cases, and for a heuristic of choosing a random preceding noun the accuracy would have been 20%.

To summarize, this experiment demonstrates the learning power of gated RNNs, and the kinds of subtle patterns and regularities in the data they can pick up on.

## 16.2 RNNS AS FEATURE EXTRACTORS

A major use case of RNNs is as flexible, trainable feature extractors, that can replace parts of the more traditional feature extraction pipelines when working with sequences. In particular, RNNs are good replacements for window-based extractors.

## 16.2.1 PART-OF-SPEECH TAGGING

Let's re-consider the part-of-speech tagging problem under the RNN setup.

The skeleton: deep biRNN POS-tagging is a special case of the sequence tagging task, assigning an output tag to each of the n input words. This makes a biRNN an ideal candidate for the basic structure.

Given a sentence with words $s = w_{1:n}$ , we will translate them into input vectors $x_{1:n}$ using a feature function $x_{i} = \phi(s, i)$ . The input vectors will be fed into a deep biRNN, producing output vectors $y_{1:n} = \text{biRNN}^{*}(x_{1:n})$ . Each of the vectors $y_{i}$ will then be fed into an MLP which will predict one of k possible output tags for the word. Each vector $y_{i}$ is focused on position i in the sequence, but also has information regarding the entire sequence surrounding that position (an “infinite window”). Through the training procedure, the biRNN will learn to focus on the sequential aspects that are informative for predicting the label for $w_{i}$ , and encode them in the vector $y_{i}$ .

From words to inputs with character-level RNNs. How do we map a word $w_{i}$ to an input vector $x_{i}$ ? One possibility is to use an embedding matrix, which can be either randomly initialized or pre-trained using a technique such as WORD2Vec with positional window contexts. Such mapping will be performed through an embedding matrix $E$ , mapping words to embedding vectors $e_{i} = E_{[w_{i}]}$ . While this works well, it can also suffer from coverage problems for vocabulary items not seen during training or pre-training. Words are made of characters, and certain suffixes and prefixes, as well as other orthographic cues such as the presence of capitalization, hyphens, or dig-

## 190 16. MODELING WITH RECURRENT NETWORKS

its can provide strong hints regarding the word's ambiguity class. In Chapters 7 and 8 we discussed integrating such information using designated features. Here, we will replace these manually designed feature extractors with RNNs. Specifically, we will use two character-level RNNs. For a word $w$ made of characters $c_1, \ldots, c_\ell$ , we will map each character into a corresponding embedding vector $c_i$ . The word will then be encoded using a forward RNN and reverse RNN over the characters. These RNNs can then either replace the word embedding vector, or, better yet, be concatenated to it:

$$
\boldsymbol{x}_{i} = \phi(s, i) =[E_{[w_{i}]}; \mathrm{RNN}^{f}(\boldsymbol{c_{1 : \ell}}); \mathrm{RNN}^{b}(\boldsymbol{c_{\ell : 1}})].
$$

Note that the forward-running RNN focuses on capturing suffixes, the backward-running RNN focuses on prefixes, and both RNNs can be sensitive to capitalization, hyphens, and even word length.

The final model The tagging models then becomes:

$$
\begin{array}{c} p(t_{i} = j | w_{1}, \ldots, w_{n}) = \text{softmax}(\text{MLP}(\text{biRNN}(x_{\mathbf{1 : n}}, i)))_{[j]} \\ x_{i} = \phi(s, i) =[E_{[w_{i}]}; \text{RNN}^{f}(c_{\mathbf{1 : \ell}}); \text{RNN}^{b}(c_{\ell; \mathbf{1}})].\end{array}\tag{16.4}
$$

The model is trained using cross-entropy loss. Making use of word dropout (Section 8.4.2) for the word embeddings is beneficial. An illustration of the architecture is given in Figure 16.1.

A similar tagging model is described in the work of Plank et al. [2016], in which it was shown to produce very competitive results for a wide range of languages.

Character-level Convolution and Pooling In the architecture above, words are mapped to vectors using forward-moving and backward-moving RNNs over the word's characters. An alternative is to represent words using character-level convolution and pooling neural networks (CNN, Chapter 13). Ma and Hovy [2016] demonstrate that using a one-layer convolutional-and-pooling layer with a window-size of $k = 3$ over each word's characters is indeed effective for part-of-speech tagging and named-entity recognition tasks.

Structured models In the above model, the tagging prediction for word i is performed independently of the other tags. This may work well, but one could also condition the ith tag on the previous model predictions. The conditioning can be either the previous k tags (following a markov assumption), in which case we use tag embeddings $E_{[t]}$ , resulting in:

$$
p(t_{i} = j \mid w_{1}, \dots, w_{n}, t_{i - 1}, \dots, t_{i - k}) = \operatorname{softmax}(\operatorname{MLP}([\text{biRNN}(x_{\mathbf{1}: n}, i); E_[t_{i - 1}]; \dots; E_{[t_{i - k}]}))]_{[j]},
$$

or on the entire sequence of previous predictions $t_{1:i-1}$ , in which case an RNN is used for encoding the tag sequence:

$$
p(t_{i} = j \mid w_{1}, \dots, w_{n}, t_{1: i - 1}) = \operatorname{softmax}(\operatorname{MLP}([\text{biRNN}(x_{1: n}, i); \operatorname{RNN}^{t}(t_{1: i - 1}))])_{[j]}.
$$

![Figure 16.1](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/3d85a8afcef7e1e1cbecae6f2ef2015dabedac4d4be1bef6406ce7b2e11da890.jpg)  
Figure 16.1: Illustration of the RNN tagging architecture. Each word $w_{i}$ is converted into a vector $\phi(w_{i})$ which is a concatenation of an embedding vector and the end states of forward- and backward-moving character level RNNs. The word vectors are then fed into a deep biRNN. The output of each of the outer layer biRNN states is then fed into a predicting network (MLP followed by softmax) resulting in a tag prediction. Note that each tagging prediction can conditions on the entire input sentence.

In both cases, the model can be run in greedy mode, predicting the tags $t_{i}$ in sequence, or using dynamic programming search (in the markov case) or beam-search (in both cases) to find a high-scoring tagging sequence. Such a model was used for CCG-supertagging (assigning each word one of a large number of tags encoding a rich syntactic structure) by Vaswani et al. [2016]. Structured prediction training for such models is discussed in Chapter 19.

## 16.2.2 RNN-CNN DOCUMENT CLASSIFICATION

In the sentiment classification examples in Section 16.1.1, we had embedding vectors feeding into a forward-moving RNN and a backward-moving RNN, followed by a classification layer [Equation (16.2)]. In the tagger example in Section 16.2.1, we saw that the word embeddings can be supplemented (or replaced) with character-level models such as RNNs or CNNs over

## 192 16. MODELING WITH RECURRENT NETWORKS

the characters, in order to improve the model's coverage and help it deal with unseen words, inflections, and typos.

The same approach can be effective also for document classification: instead of feeding word-embeddings into the two RNNs, we feed vectors that result either from character-level RNNs over each word, or from a convolutional-and-pooling layer applied over each word.

Another alternative is to apply a hierarchical convolution-and-pooling network (Section 13.3) on the characters, in order to get a shorter sequence of vectors that represent units that are beyond characters but are not necessarily words (the captured information may capture either more or less than a single word), and then feed the resulting sequence of vectors into the two RNNs and the classification layer. Such an approach is explored by Xiao and Cho [2016] on several document classification tasks. More specifically, their hierarchical architecture includes a series of convolutional and pooling layers. At each layer, a convolution with window size k is applied to the sequence of input vectors, and then max-pooling is applied between each two neighboring resulting vectors, halving the sequence length. After several such layers (with window sizes varying between 5 and 3 as a function of the layer, i.e., widths of 5, 5, 3), the resulting vectors are fed into forward-running and backward-running GRU RNNs, which are then fed into a classification component (a fully connected layer followed by softmax). They also apply dropout between the last convolutional layer and the RNNs, and between the RNN and the classification component. This approach is effective for several document classification tasks.

## 16.2.3 ARC-FACTORED DEPENDENCY PARSING

We revisit the arc-factored dependency-parsing task from Section 7.7. Recall that we are given a sentence sent with words $w_{1:n}$ and corresponding POS-tags $t_{1:n}$ , and need to assign, for each word pair $(w_{i}, w_{j})$ a score indicating the strength assigned to word $w_{i}$ being the head of word $w_{j}$ . In Section 8.6 we derived an intricate feature function for the task, based on windows surrounding the head and modifier words, the words between the head and modifier words, and their POS tags. This intricate feature function can be replaced by a concatenation of two biRNN vectors, corresponding to the head and the modifier words.

Specifically, given words and POS-tags $w_{1:n}$ and $t_{1:n}$ with the corresponding embedding vectors $w_{1:n}$ and $t_{1:n}$ , we create a biRNN encoding $v_{i}$ for each sentence position by concatenating the word and POS vectors, and feeding them into a deep-biRNN:

$$
\begin{array}{l} \boldsymbol{v_{1: n}} = \mathrm{biRNN}^{\star}(\boldsymbol{x_{1: n}}) \\ x_{i} =[w_{i}; t_{i}].\end{array}\tag{16.5}
$$

We then score a head-modifier candidate by passing the concatenation of the biRNN vectors through an MLP:

$$
\operatorname{ARCSCORE}(h, m, w_{1: n}, t_{1: n}) = MLP(\phi(h, m, s)) = MLP([v_{h}; v_{m}]).\tag{16.6}
$$

Illustration of the architecture is given in Figure 16.2. Notice that the biRNN vectors $v_{i}$ encode the words in context, essentially forming an infinite window to each side of the word $w_{i}$ , which is sensitive to both the POS-tag sequence and the word sequence. Moreover, the concatenation $[v_{h}; v_{m}]$ include RNNs running up to each word in each direction, and in particular it covers the sequence of positions between $w_{h}$ and $w_{m}$ , and the distance between them. The biRNN is trained as part of the larger network, and learns to focus on the important aspects of the sequence the syntactic parsing task (structured-training of the arc-factored parser is explained in Section 19.4.1).

![Figure 16.2](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/576474a15f3ed1d723f233d49f95747e91ed798958cb854df8e8ebc3c55c21dc.jpg)  
Figure 16.2: Illustration of the arc-factored parser feature extractor for the arc between fox and over.

Such a feature extractor was used in the work of Kiperwasser and Goldberg [2016b], in which it was shown to produce state-of-the-art parsing results for the arc-factored approach, rivaling the scores of much more complex parsing models. A similar approach was taken also by Zhang et al. [2016], achieving similar results with a different training regime.

In general, whenever one is using words as features in a task that is sensitive to word order or sentence structure, the words can be replaced by their trained biLSTM vectors. Such an approach was taken by Kiperwasser and Goldberg [2016b] and Cross and Huang [2016a,b] in the context of transition-based syntactic parsing, with impressive results.


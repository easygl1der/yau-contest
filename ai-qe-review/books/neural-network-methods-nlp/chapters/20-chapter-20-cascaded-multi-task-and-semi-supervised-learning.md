---
title: "Chapter 20 \u2014 Cascaded, Multi-task and Semi-supervised Learning"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 20
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 4533
source_line_end: 4782
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 6
source_empty_image_alt: 6
non_semantic_image_alt: 0
caption_derived_image_alt: 6
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

# Chapter 20 — Cascaded, Multi-task and Semi-supervised Learning

> [[../README|本书目录]] · [[19-chapter-19-structured-output-prediction|上一章]] · [[21-chapter-21-conclusion|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 4533–4782。
> - 本章保留 6 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Cascaded, Multi-task and Semi-supervised Learning

When processing natural language, it is often the case that we have several tasks that feed into each other. For example, the syntactic parser we discussed in Sections 7.7, 16.2.3, and 19.4.1 takes as input parts of speech tags, that are in themselves automatically predicted by a statistical model. Feeding the predictions of one model as the input of another, when the two models are independent, is called a pipeline system. An alternative approach is model cascading. In model cascading, rather than feeding the predictions of model A (the tagger) into model B (the parser), we instead feed into the parser the intermediate representations that are informative for predicting the tags. That is, rather than committing to a particular tagging decision, we pass on the tagging uncertainty to the parser. Model cascading is very easy to implement in deep learning system, by simply passing the vector before the argmax, or even one of the hidden vectors.

A related technique is multi-task learning [Caruana, 1997], in which we have several related predictions tasks (that may or may not feed into each other). We would like to leverage the information in one of the tasks in order to improve the accuracy on the other tasks. In deep learning, the idea is to have different networks for the different tasks, but let the networks share some of their structure and parameters. This way, a common predictive core (the shared structure) is influenced by all the tasks, and training data for one task may help improve the predictions of the other ones.

A cascading approach lends itself naturally to the multi-task learning framework: instead of just passing in the intermediate output of the tagger to the parser, we can instead plug in the subgraph of the computation graph that is responsible for the intermediate tagging representation as input to the parser's computation graph, and backpropagate the parser's error all the way back to the (now shared) base of the tagging component.

Another related and similar case is that of semi-supervised learning, in which we have supervised training data for task A, and what to use annotated or unannotated data for other tasks in order to improve the performance on task A.

This chapter deals with these three techniques.

## 20.1 MODEL CASCADING

In model-cascading, large networks are built by composing them out of smaller component networks. For example, in Section 16.2.1 we describe an RNN-based neural network for predicting the part of speech of a word based on its sentential context and the characters that compose it. In a pipeline approach, we would use this network for predicting parts of speech, and then feed the predictions as input features to a neural network that does syntactic chunking or parsing.

Instead, we could think of the hidden layers of this network as an encoding that captures the relevant information for predicting the part of speech. In a cascading approach, we take the hidden layers of this network and connect them (and not the part of speech prediction themselves) as the inputs for the syntactic network. We now have a larger network that takes as input sequences of words and characters, and outputs a syntactic structure.

As a concrete example, consider the tagging and parsing networks described in Sections 16.2.1 and 16.2.3. The tagging network [Equation (16.4)], reproduced here, predicts the tag of the $i$ th word according to:

$$
t_{i} = \underset{j}{\operatorname{argmax}} \text{softmax}(\text{MLP}(\text{biRNN}(x_{1: n}, i)))_{[j]}\tag{20.1}
$$

$$
\boldsymbol{x}_{i} = \phi(s, i) =[\mathbb{E}_{[w_{i}]}; \mathrm{RNN}^{f}(\boldsymbol{c_{1: \ell}}); \mathrm{RNN}^{b}(\boldsymbol{c_{\ell : 1}})]
$$

while the parsing network [Equation (16.6)] assigns arc-scores according to:

$$
\begin{array}{c} \text{ArcScore}(h, m, w_{1: n}, t_{1: n}) = MLP(\phi(h, m, s)) = MLP([v_{h}; v_{m}]) \\ v_{1: n} = \text{biRNN}^{\star}(x_{1: n}) \\ x_{i} =[w_{i}; t_{i}].\end{array}\tag{20.2}
$$

The important thing to note here is that the parser takes as input words $w_{1:n}$ and tags $t_{1:n}$ , and then converts the words and tags into embedding vectors, and concatenates them to form its corresponding input representations $x_{1:n}$ .

In the cascading approach, we'll feed the tagger's pre-prediction state directly into the parser, in one joint network. Concretely, denote by $z_i$ the tagger's pre-prediction for word $i$ : $z_i = \text{MLP}(\text{biRNN}(x_{1:n}, i))$ . We can now use $z_i$ as the input representation of the $i$ th word in the parser, resulting in:

$$
\begin{array}{c} \text{ArcScore}(h, m, w_{1: n}) = MLP_{\text{parser}}(\phi(h, m, s)) = MLP_{\text{parser}}([v_{h}; v_{m}]) \\ v_{1: n} = \text{biRNN}_{\text{parser}}^{\star}(z_{1: n}) \\ z_{i} = \text{MLP}_{\text{tagger}}(\text{biRNN}_{\text{tagger}}(x_{1: n}, i)) \\ x_{i} = \phi_{\text{tagger}}(s, i) = \left[E_{[w_{i}]}; \text{RNN}_{\text{tagger}}^{f}(c_{1: t}); \text{RNN}_{\text{tagger}}^{b}(c_{t: 1}) \right].\end{array}\tag{20.3}
$$

The computation graph abstraction allows us to easily propagate the error gradients from the syntactic task loss all the way back to the characters. $^{1}$

Figure 20.1 presents a sketch of the entire network.

![Figure 20.1](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/7cce38b0085da74a3ddf0184b28b425829448d0a216f0dde89d49e332d4613a1.jpg)  
Figure 20.1: Tagging-parsing cascade network [Equation (20.3)].

While the parser has access to the word identities, they may be diluted by the time they pass through all the tagger RNN layers. To remedy this, we may use a skip-connection, and pass the word embeddings $E_{[w_{i}]}$ directly to the parser, in addition to the tagger's output:

$$
\begin{array}{c} \text{ArcScore}(h, m, w_{1: n}) = MLP_{\text{parser}}(\phi(h, m, s)) = MLP_{\text{parser}}([v_{h}; v_{m}]) \\ v_{1: n} = \text{biRNN}_{\text{parser}}^{\star}(z_{1: n}) \\ z_{i} =[E_{[w_{i}]}; z_{i}^{\prime}] \\ z_{i}^{\prime} = \text{MLP}_{\text{tagger}}(\text{biRNN}_{\text{tagger}}(x_{1: n}, i)) \\ x_{i} = \phi_{\text{tagger}}(s, i) = \left[E_{[w_{i}]}; \text{RNN}_{\text{tagger}}^{f}(c_{1: \ell}); \text{RNN}_{\text{tagger}}^{b}(c_{\ell : 1}) \right].\end{array}\tag{20.4}
$$

This architecture is depicted in Figure 20.2.

To combat the vanishing gradient problem of deep networks, as well as to make better use of available training material, the individual component network's parameters can be bootstrapped by training them separately on a relevant task, before plugging them in to the larger network for further tuning. For example, the part-of-speech predicting network can be trained to accurately predict parts-of-speech on a relatively large annotated corpus, before plugging its hidden layer into the syntactic parsing network for which less training data is available. In case the training data provide direct supervision for both tasks, we can make use of it during training by creating a network with two outputs, one for each task, computing a separate loss for each output, and then summing the losses into a single node from which we backpropagate the error gradients.

Model cascading is very common when using convolutional, recursive, and recurrent neural networks, where, for example, a recurrent network is used to encode a sentence into a fixed sized vector, which is then used as the input of another network. The supervision signal of the recurrent network comes primarily from the upper network that consumes the recurrent network's output as it inputs.

In our example, both the tagger and the parser were based on a biRNN backbone. This is not necessary—either or both of the networks could just as well be a feed-forward network that gets a word-window as input, a convolutional network, or any other architecture that produces vectors and that can pass gradients.

## 20.2 MULTI-TASK LEARNING

Multi-task learning (MTL) is a related technique, in which we have several related tasks that we assume are correlated, in the sense that learning to solve one is likely to provide “intuitions” about solving the other. For example, consider the syntactic chunking task (see Linguistic Annotation frame in Section 6.2.2), in which we annotate a sentence with chunk boundaries, producing output such as:

$[NP$ the boy] $[PP$ with] $[NP$ the black shirt] $[VP$ opened] $[NP$ the door] $[PP$ with] $[NP$ a key]

![Figure 20.2](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/ed5736a75961104dbb3a5476f52f72b808f9c98bf3a3055a0ddd1182a93bf37a.jpg)  
Figure 20.2: Tagging-parsing cascade with skip-connections for the word embeddings [Equation (20.4)].

Like named-entity recognition, chunking is a sequence-segmentation task, and can be reduced to a tagging task using the BIO encoding scheme (see Section 7.5). A network for chunking then may be modeled as a deep biRNN, followed by an MLP for individual tag predictions:

$$
\begin{array}{rl} p(\text{chunkTag}_{i} = j) & = \text{softmax}(\text{MLP}_{\text{chunk}}(\text{biRNN}_{\text{chunk}}(x_{1: n}, i)))_{[j]} \\ x_{i} & = \phi(s, i) = E^{\text{cnk}}_{[w_{i}]} \end{array}\tag{20.5}
$$

(for brevity, we removed the character-level RNNs from the input, but they can be trivially added.) Note that this is very similar to a POS-tagging network:

$$
\begin{array}{c} p(\text{posTag}_{i} = j) = \text{softmax}(\text{MLP}_{\text{tag}}(\text{biRNN}_{\text{tag}}(x_{1: n}, i)))_{[j]} \\ x_{i} = \phi(s, i) = E^{\text{tag}}[w_{i}].\end{array}\tag{20.6}
$$

![Figure 20.3](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/770d42388bd81e1fa68c8f9b6967de094af6214c17def1fc0b5f75f62cfc4cb8.jpg)  
Figure 20.3: Left: POS tagging network. Right: Chunk tagging network.

Both networks are depicted in Figure 20.3. Different colors indicate different sets of parameters.

The syntactic chunking task is synergistic with part-of-speech tagging. Information for predicting chunk boundaries, or the part-of-speech of a word, rely on some shared underlying syntactic representation. Instead of training a separate network for each task, we can create a single network with several outputs. The common approach would be to share the biRNN parameters, but have a dedicated MLP predictor for each task (or have also a shared MLP, in which only the final matrix and bias terms are specialized for a task). This will result in the following, shared network:

$$
p(\text{chunkTag}_{i} = j) = \text{softmax}(\text{MLP}_{\text{chunk}}(\text{biRNN}_{\text{shared}}(x_{1: n}, i)))_{[j]}
$$

$$
p(\text{posTag}_{i} = j) = \text{softmax}(\text{MLP}_{\text{tag}}(\text{biRNN}_{\text{shared}}(x_{1: n}, i)))_{[j]}\tag{20.7}
$$

$$
\boldsymbol{x}_{i} = \phi(s, i) = \mathbb{E}^{\text{shared}}[w_{i}].
$$

The two networks use the same deep biRNN and embedding layers, but separate final output predictors. This is depicted in Figure 20.4.

![Figure 20.4](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/6ef4cb1587444b055bc05273b1baef86e537e9f4cb6dc5b4519fe2aef2aabb00.jpg)  
Figure 20.4: A joint POS-tagging and Chunking network. The biRNN parameters are shared, and the biRNN component is specialized for both tasks. The final predictors are separate.

Most of the parameters of the network are shared between the different tasks. Useful information learned from one task can then help to disambiguate other tasks.

## 20.2.1 TRAINING IN A MULTI-TASK SETUP

The computation graph abstraction makes it very easy to construct such networks and compute the gradients for them, by computing a separate loss for each available supervision signals, and then summing the losses into a single loss that is used for computing the gradients. In case we have several corpora, each with different kind of supervision signal (e.g., we have one corpus for POS and another for chunking), the preferred training protocol would be to choose a corpus at random, pass the example through the relevant part of the computation graph, compute the loss, backpropagate the error, and update the parameters. Then, on the next step, again choose a corpus at random and so on. In practice, this is often achieved by shuffling all the available training examples and going through them in order. The important part is that we potentially compute the gradients with respect to a different loss (and using a different sub-network) for each training example.

In some cases, we may have several tasks, but care more about one of them. That is, we have one or more main tasks, and a few other supporting task which we believe can help the main task, but whose predictions we do not care about. In such cases, we may want to scale the loss of the supporting task to be smaller than the loss of the main tasks. Another option is to first pre-train

## 242 20. CASCADED, MULTI-TASK AND SEMI-SUPERVISED LEARNING

a network on the supporting tasks, and then take the shared components of this network and continue training it only on the main task.

## 20.2.2 SELECTIVE SHARING

Going back to the POS-tagging and Chunking example, we could argue that while the tasks share information, the POS-tagging task is in fact somewhat more low level than the chunking task: the information needed for performing chunking is more refined than that needed for POS-tagging. In such cases, we may prefer to not share the entire deep biRNN between the two tasks, but rather have the lower layer of the biRNN be shared, and the upper layers be dedicated to the chunking task (Figure 20.5).

![Figure 20.5](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/beedac62c6008715068de5d4d59ec02ea49bf88fc8f92f698a154d9e302ae431.jpg)  
Figure 20.5: A selectively shared POS-tagging and Chunking network. The lower layer of the biRNN is shared between the two tasks, but the upper layers are dedicated to chunking.

The lower layer in the biRNN is shared between the two tasks. It is primarily supervised by the POS task, but also receives gradients from the chunking supervision. The upper layers of the network are dedicated to the chunking task—but are trained to work well with the representation of the lower layers.

This selective sharing suggestion follows the work of Søgaard and Goldberg [2016]. A similar approach, using feed-forward rather than recurrent networks, is taken by Zhang and Weiss [2016] under the name stack propagation.

The selectively shared MTL network in Figure 20.5 is very similar in spirit to the cascaded setup in discussed in the previous section (Figure 20.1). Indeed, it is often hard to properly draw the boundary between the two frameworks.

Input-output Inversion Another view of multi-task and cascaded learning is one of input-output inversion. Instead of thinking of some signal (say POS-tags) as inputs to a higher level task (say parsing), we can think of them as outputs of intermediate layers in the network for the higher level tasks. That is, instead of using the parts-of-speech tags as inputs, they are used instead as a supervision signal to intermediate layers of the network.

## 20.2.3 WORD-EMBEDDINGS PRE-TRAINING AS MULTI-TASK LEARNING

The chunking and POS-tagging tasks (and indeed, many others) are also synergistic with the language modeling task. Information for predicting the chunk boundary are the part-of-speech tag of a word is intimately connected with the ability to predict the identity of the next word, or the previous one: the tasks share a common syntactic-semantic backbone.

Viewed this way, the use of pre-trained word vectors for initializing the embedding layer of a task-specific network is an instance of MTL, with language modeling as a supporting task. The word embedding algorithms are trained with an distributional objective that is a generalization of language modeling, and the word embedding layer of the embedding algorithms is then shared with the other task.

The kind of supervision for the pre-training algorithm (i.e., the choice of contexts) should be matched to the task the specialized network is trying to solve. Closer tasks results in larger benefits from MTL.

## 20.2.4 MULTI-TASK LEARNING IN CONDITIONED GENERATION

MTL can be seamlessly integrated into the conditioned generation framework discussed in Chapter 17. This is done by having a shared encoder feeding into different decoders, each attempting to perform a different task. This will force the encoder to encode information that is relevant to each of the tasks. Not only can this information then be shared by the different decoders, it also will potentially allow for training different decoders on different training data, enlarging the overall number of examples available for training. We discuss a concrete example in Section 20.4.4.

## 20.2.5 MULTI-TASK LEARNING AS REGULARIZATION

Another view of multi-task learning is one of a regularizer. The supervision from the supporting tasks prevent the network from overfitting on the main task, by forcing the shared representation to be more general, and useful for prediction beyond the training instances of the main task. Viewed this way, and when the supporting tasks are meant to be used as regularizers, one should not perform the MTL in a sequence where the supporting tasks are tuned first followed by adapting the representation to the main task (as suggested in Section 20.2.1). Rather, all tasks should be learned in parallel.

## 20.2.6 CAVEATS

While the prospect of MTL is very appealing, some caveats are in order. MTL often does not work well. For example, if the tasks are not closely related, you may not see gains from MTL, and most tasks are indeed not related. Choosing the related tasks for performing MTL can be more of an art than a science.

Even if the tasks are related, but the shared network doesn't have the capacity to support all the tasks, the performance of all of them can degrade. When taking the regularization view, this means that the regularization is too strong, and prevents the model from fitting the individual tasks. In such cases, it is better to increase the model capacity (i.e., increase the number of dimensions in the shared components of the network). If an MTL network with $k$ tasks needs a $k$ -fold increase in capacity (or close to it) in order to support all tasks, it means that there is likely no sharing of predictive structure at all between the tasks, and one should forgo the MTL idea.

When the tasks are very closely related, such as the POS tagging and chunking tasks, the benefits from MTL could be very small. This is especially true when the networks are trained on a single dataset in which each sentence is annotated for both POS-tag and Chunk label. The chunking network can learn the representation it needs without the help of the intermediate POS supervision. We do start to see the benefits of MTL when the POS-training data and the chunking data are disjoint (but share sizable portions of the vocabulary), or when the POS-tag data is a superset of the Chunk data. In this situation, the MTL allows to effectively enlarge the amount of supervision for the chunking task by training on data with related labels for the POS-tagging task. This lets the Chunk part of the network leverage on and influence the shared representation that was learned based on the POS annotations on the additional data.

## 20.3 SEMI-SUPERVISED LEARNING

A related framework to both multi-task and cascaded learning is semi-supervised learning, in which we have a small amount of training data for a task we care about, and additional training data for other tasks. The other tasks can be either supervised, or unsupervised (i.e., where the supervision can be generated from unannotated corpora, such as in language modeling, word embeddings, or sentence encodings, as discussed in Section 9.6, Chapters 10 and 17.3).

We would like to use the supervision for the additional tasks (or to invent suitable additional tasks) in order to improve the prediction accuracy on the main task. This is a very common scenario, which is an active and important research area: we never have enough supervision for the tasks we care about.

For an overview of non-neural networks semi-supervised learning methods in NLP, see the book of Søgaard [2013] in this series.

Within the deep-learning framework, semi-supervised learning can be performed, much like MTL, by learning a representation based on the additional tasks, that can then be used as supplement input or as initialization to the main task. Concretely, one can pre-train word embeddings or sentence representations on unannotated data, and use these to initialize or feed into a POS-tagger, parser or a document summarization system.

In a sense, we have been doing semi-supervised learning ever since we introduced distributional representations pre-trained word embeddings in Chapter 10. Sometimes, problems lend themselves to more specialized solutions, as we explore in Section 20.4.3. The similarities and connections to multi-task learning are also clear: we are using supervision data from one task to improve performance on another. The main difference seem to be in how the different tasks are integrated into the final model, and in the source of the annotated data for the different tasks, but the border between the approaches is rather blurry. In general, it is probably best not to debate about the boundaries of cascaded learning, multi-task learning and semi-supervised learning, but rather see them as a set of complimentary and overlapping techniques.

Other approaches to semi-supervised learning include various regimes in which one or more models are trained on the small labeled data, and are then used to assign labels to large amounts of unlabeled data. The automatically annotated data (possibly following some quality filtering stage based on agreement between the models are other confidence measures) is then used to train a new model, or provide additional features to an existing on. These approaches can be grouped under the collective term self-training. Other methods specify constraints on the solution, that should help guide the model (i.e., specifying that some words can only be tagged with certain tags, or that each sentence must contain at least one word tagged as X). Such methods are not (yet) specialized for neural networks, and are beyond the scope of this book. For an overview, see the book by Søgaard [2013].

## 20.4 EXAMPLES

We now describe a few examples in which we MTL was shown to be effective.

## 20.4.1 GAZE-PREDICTION AND SENTENCE COMPRESSION

In the sentence compression by deletion task, we are given a sentence such as “Alan Turing, known as the father of computer science, the codebreaker that helped win World War II, and the man tortured by the state for being gay, is to receive a pardon nearly 60 years after his death” and are required to produce a shorter (“compressed”) version containing the main information in the sentence by deleting words from the original sentence. An example compression would be “Alan Turing is to receive a pardon.” This can be modeled as a deep biRNN followed by an MLP in which the inputs to the biRNN are the words of the sentence, and the outputs of the MLPs are KEEP or DELETE decisions for each word.

In work with Klerke et al. [2016], we showed that the performance on the sentence deletion by compression task can be improved by using two additional sequence prediction tasks: CCG supertagging and Gaze prediction. The two tasks are added in a selective-sharing architecture, as individual MLPs that feed from the lower layer of the biRNN.

The CCG supertagging task assigns each work with a CCG supertag, which is a complex syntactic tag such as $(S[dcl]\NP)/PP$ , indicating its syntactic role with respect to the rest of the sentence. $^{2}$

The Gaze prediction task is a cognitive task that relates to the way people read written language. When reading, our eyes move across the page, fixating on some words, skipping others, and often jumping back to previous words. It is widely believed that eye movement when reading reflects on the sentence processing mechanisms in the brain, which in turn reflects on the sentence structure. Eye-trackers are machines that can accurately track eye-movement while reading, and some eye-tracked corpora are available in which sentences are paired with exact eye-movement measurements of several human subjects. In the gaze-prediction task, the network was trained to predict aspects of the eye-movement behavior on the text (how long of a fixation each word would receive, or which words will trigger back movements). The intuition being that parts of the sentence which are less important are more likely to be skipped or glossed over, and parts that are more important are likely to be fixated more upon when processing the sentence.

The compression data, the syntactic CCG tagging data, and the eye-movement data were completely disjoint from each other, but we observed clear improvements to the compression accuracy when including the additional tasks as supervision.

## 20.4.2 ARC LABELING AND SYNTACTIC PARSING

Throughout the book, we described an architecture for arc-standard dependency parsing. In particular, in Section 16.2.3 we described biRNN based features, and in Section 19.4.1 a structured prediction learning framework. The parser we described was an unlabeld parser—the model assigned a score to each possible head-modifier pair, and the final prediction by the parser was a collection of arcs, representing the best tree over the sentence. However, the scoring function, and the resulting arcs, only took into consideration which words are syntactically connected to each other, and not the nature of the relation between the words.

Recall from Section 6.2.2 that a dependency parse-tree usually contains also the relation information, in term of a dependency label on each arc, i.e., the det, prep, pobj, nsubj, etc. label annotations in Figure 20.6.

Given an unlabeled parsing, the arc-labels can be assigned using an architecture in which a biRNN is used to read the words of the sentence, and then, for arc $(h, m)$ in the tree, concatenate the corresponding biRNN encodings and feed them into an MLP for predicting the arc's label.

Rather than training a separate network for the label prediction, we can treat Unlabeled Parsing and Arc-Labeling as related tasks in a multi-task setting. We then have a single biRNN for the arc-labeler and the parser, and use the encoded biRNN states as inputs both to the arc-scorer and to the arc-labeler. In training, the arc-labeler will only see gold arcs (because we do not have label information for the other, hypothetical arcs), while the arc-scorer will see all possible arcs.

![Figure 20.6](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/6454aad45c1ee75702a2e7c1cbab4a21c5629d9604abe4b66bfab99c3da7dd54.jpg)  
Figure 20.6: Labeled dependency tree.

Indeed, in the work of Kiperwasser and Goldberg [2016b] we observe that the tasks are indeed closely related. Training the joint network for performing both unlabeled arc-scoring and arc-labeling, using the same shared biRNN encoder, not only results in accurate arc labeling, but also substantially improves the accuracy of the unlabeled parse trees.

## 20.4.3 PREPOSITION SENSE DISAMBIGUATION AND PREPOSITION TRANSLATION PREDICTION

Consider the preposition-sense disambiguation task discussed in Section 7.6. To recall, this is a word-in-context problem, in which we need to assign each preposition with one of K possible sense labels (MANNER, PURPOSE, LOCATION, DURATION, etc.). Annotated corpora for the task exist [Litkowski and Hargraves, 2007, Schneider et al., 2016], but are small.

In Section 7.6, we discussed a rich set of core features that can be used for training a preposition-sense disambiguator. Let's denote the feature extractor taking a preposition instance and returning an encoding of these features as a vector as $\phi_{\mathrm{sup}}(s,i)$ , where $s$ is the input sentence (including words, part-of-speech tags, lemmas, and syntactic parse-tree information), and $i$ is the index of the preposition within the sentence. The feature extractor $\phi_{\mathrm{sup}}$ based on features similar to those in features in Section 7.6, without the WordNet-based features but with pre-trained word-embeddings, is a strong one. Feeding it into an MLP for prediction performs reasonably well (albeit still disappointingly low, below $80\%$ accuracy), and attempts to replace or to supplement it with a biRNN-based feature extractor does not improve the accuracies.

Here, we show how the accuracy of the sense prediction can be improved further using a semi-supervised approach, which is based on learning a useful representation from large amounts of unannotated data, that we transform into related and useful prediction tasks.

Specifically, we will be using tasks derived from sentence-aligned multilingual data. These are pairs of English sentences and their translation into other languages. When translating from

English to a different language, a preposition can be translated into one of several possible alternatives. The choice of the foreign preposition will be based on the English preposition sense, as reflected by the sentential context in which it appears. While prepositions are ambiguous in all languages, the ambiguity patterns differ across languages. Thus, predicting the foreign preposition into which a given English preposition will be translated based on the English sentential context is a good auxiliary task for preposition sense disambiguation. This is the approach taken by Gonen and Goldberg [2016]. We provide here a high-level overview. For details, refer to the original paper.

Training data is created based on a multilingual sentence-aligned parallel corpus. The corpus is word-aligned using a word-alignment algorithm [Dyer et al., 2013], and tuples of (sentence, preposition-position, foreign-language, foreign-prepositions) are extracted as training examples. Given such a tuple $\langle s = w_{1:n}, i, L, f \rangle$ , the prediction task is to predict the translation of the preposition $w_i$ in the context of the sentence $s$ . The possible outputs are taken from a set of language specific options $p_L$ , and the correct output is $f$ .

The hope is that a representation of the context of $w_{i}$ that is good at predicting the foreign preposition f will also be helpful for predicting the preposition sense. We model the task as an encoder $\text{Enc}(s, i)$ that encodes the sentential context of $w_{i}$ into a vector, and a predictor, which attempts to predict the right preposition. The encoder is very similar to a biRNN, but does not include the preposition itself in order to force the network to pay more attention to the context, while the predictor is a language specific MLP.

$$
\begin{array}{c} p(\text{foreign} = f | s, i, L) = \text{softmax}(\text{MLP}_{\text{foreign}}^{L}(\text{Enc}(s, i)))_{[f]} \\ \text{Enc}(s, i) =[\text{RNN}^{f}(w_{1: i - 1}); \text{RNN}^{b}(w_{n: i + 1})].\end{array}\tag{20.8}
$$

The encoder is shared across the different languages. After training the network on several million (English sentence, foreign-preposition) pairs, we are left with a pre-trained context-encoder that can then be used in the preposition-sense disambiguation network by concatenating it to the supervised feature representation. Our semi-supervised disambiguator is then:

$$
p(\text{sense} = j | s, i) = \operatorname{softmax}(\mathrm{MLP}_{\sup}([\phi_{\sup}(s, i); \mathrm{ENC}(s, i)])_{[j]},\tag{20.9}
$$

where Enc is the pre-trained encoder that is further trained by the sense prediction network, and $\phi_{sup}$ is the supervised feature extractor. The approach substantially and consistently improve the accuracy of the sense prediction by about 1–2 accuracy points, depending on details of the setup. $^{4}$

## 20.4.4 CONDITIONED GENERATION: MULTILINGUAL MACHINE TRANSLATION, PARSING, AND IMAGE CAPTIONING

MTL can also be easily performed in an encoder-decoder framework. The work of Luong et al. [2016] demonstrated this in the context of machine translation. Their translation system follows the sequence-to-sequence architecture (Section 17.2.1), without attention. While better translation systems exist (notably systems that make use of attention), the focus of the work was to show that improvements from the multi-task setup are possible.

Luong et al explore different setups of multi-task learning under this system. In the first setup (one-to-many), the Encoder component (encoding English sentences into vectors) is shared, and is used with two different decoders: one decoder is generating German translations, and the other decoder is generating linearized parse-trees for the English sentences (i.e., the predicted sequence for the boy opened the door should be (S (NP DT NN) (VP VBD (NP DT NN)))). The system is trained on a parallel corpus of (English, German) translation pairs, and on gold parse trees from the Penn Treebank [Marcus et al., 1993]. The translation data and the parsing data are disjoint. Through the multi-task setting, the shared encoder learns to produce vectors that are informative for both tasks. The multi-task encoder-decoder network is effective: the network that is trained for both tasks (one encoder, two decoders) works better than the individual networks consisting of a single encode-decoder pair. This setup likely works because encoding basic elements of the syntactic structure of a sentence are informative for selecting the word order and syntactic structures in the resulting translation, and vice versa. The translation and parsing tasks are indeed synergistic.

In the second setup (many-to-one), there is a single decoder, but several different encoders. The tasks here are machine translation (German to English translation) and image captioning (Image to English description). The decoder is tasked at producing English sentences. One encoder is encoding German sentences, while the other is encoding images. Like before, the datasets for the translation and for the image captioning are disjoint. Again, with some tuning of parameters, training the joint system improves over the individual ones, though the gains are somewhat smaller. Here, there is no real connection between the task of encoding German sentences (which express elaborate predications and complicated syntactic structures) and encoding image contents (which encodes the main components of simple scenes). The benefit seem to be from the fact that both tasks provide supervision for the language-modeling part of the decoder network, allowing it to produce better sounding English sentences. Additionally, the improvement may stem from a regularization effect, in which one (encoder,decoder) pair prevents the other pair from overfitting to its training data.

Despite the rather low baseline, the results of Luong et al. [2016] are encouraging, suggesting there are gains to be had from multi-task learning in the conditional generation framework, when suitable synergistic tasks are chosen.

## 20. CASCADED, MULTI-TASK AND SEMI-SUPERVISED LEARNING

## 20.5 OUTLOOK

Cascaded, multi-task, and semi-supervised learning are exciting techniques. The neural networks framework, driven by gradients-based training over a computation graph, provide many seamless opportunities for using these techniques. In many cases, such approaches bring real and consistent gains in accuracy. Unfortunately, as of the time of this writing, the gains are often relatively modest compared to the baseline performance, especially when the baselines are high. This should not discourage you from using the techniques, as the gains often times are real. It should also encourage you to actively work on improving and refining the techniques, so that we see could expect to see greater gains in the future.

# CHAPTER 21


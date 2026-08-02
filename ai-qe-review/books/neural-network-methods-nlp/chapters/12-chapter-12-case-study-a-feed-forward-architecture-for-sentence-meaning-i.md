---
title: "Chapter 12 \u2014 Case Study: A Feed-forward Architecture for Sentence Meaning Inference"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 12
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 2976
source_line_end: 3101
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

# Chapter 12 — Case Study: A Feed-forward Architecture for Sentence Meaning Inference

> [[../README|本书目录]] · [[11-chapter-11-using-word-embeddings|上一章]] · [[13-chapter-13-ngram-detectors-convolutional-neural-networks|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 2976–3101。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Case Study: A Feed-forward Architecture for Sentence Meaning Inference

In Section 11.6 we introduced the sum of pairwise word similarities as a strong baseline for the short document similarity task. Given two sentences, the first one with words $w_1^1, \ldots, w_{\ell_1}^1$ and the second one with words $w_1^2, \ldots, w_{\ell_2}^2$ , each word is associated with a corresponding pre-trained word vector $w_{1:\ell_1}^1, w_{1:\ell_2}^2$ , and the similarity between the documents is given by:

$$
\sum_{i = 1}^{\ell_{1}} \sum_{j = 1}^{\ell_{2}} \mathrm{sim} \left(\boldsymbol{w}_{i}^{1}, \boldsymbol{w}_{j}^{2}\right).
$$

While this is a strong baseline, it is also completely unsupervised. Here, we show how a document similarity score can be greatly improved if we have a source of training data. We will follow the network presented by Parikh et al. [2016] for the Stanford Natural Language Inference (SNLI) semantic inference task. Other than providing a strong model for the SNLI task, this model also demonstrates how the basic network components described so far can be combined in various layers, resulting in a complex and powerful network that is trained jointly for a task.

## 12.1 NATURAL LANGUAGE INFERENCE AND THE SNLI DATASET

In the natural language inference task, also called recognizing textual entailment (RTE), you are given two texts, $s_{1}$ and $s_{2}$ , and need to decide if $s_{1}$ entails $s_{2}$ (that is, can you infer $s_{2}$ from $s_{1}$ ), contradicts it (they cannot both be true), or if the texts are neutral (the second one neither entails nor contradicts the first). Example sentences for the different conditions are given in Table 12.1.

The entailment task was introduced by Dagan and Glickman [2004], and subsequently established through a series of benchmarks known as the PASCAL RTE Challenges [Dagan et al., 2005]. The task is very challenging, $^{1}$ and solving it perfectly entails human level understanding of language. For in-depth discussion on the task and approaches to its solution that do not involve neural networks, see the book by Dagan, Roth, Sammons, and Zanzotto in this series [Dagan et al., 2013].

Table 12.1: The Natural Language Inference (Textual Entailment) Task. The examples are taken from the development set of the SNLI dataset.

<table><tr><td></td><td>Two men on bicycles competing in a race.</td></tr><tr><td>Entail</td><td>People are riding bikes.</td></tr><tr><td>Neutral</td><td>Men are riding bicycles on the street.</td></tr><tr><td>Contradict</td><td>A few people are catching fish.</td></tr><tr><td></td><td>Two doctors perform surgery on patient.</td></tr><tr><td>Entail</td><td>Doctors are performing surgery.</td></tr><tr><td>Neutral</td><td>Two doctors are performing surgery on a man.</td></tr><tr><td>Contradict</td><td>Two surgeons are having lunch.</td></tr></table>

SNLI is a large dataset created by Bowman et al. [2015], containing 570k human-written sentence pairs, each pair manually categorized as entailing, contradicting, or neutral. The sentences were created by presenting image captions to annotators, and asking them, without seeing the image, to write a caption that is definitely a true description of the image (entail), a caption that is might be a true description of the image (neutral), and a caption that is a definitely false description of the image (contradict). After collecting 570k sentence pairs this way, $10\%$ of them were further validated by presenting sentence pairs to different annotators and asking them to categorize the pair into entailing, neutral, or contradicting. The validated sentences are then used for the test and validation sets. The examples in Table 12.1 are from the SNLI dataset.

While simpler than the previous RTE challenge datasets, it is also much larger, and still not trivial to solve (in particular for distinguishing the entailing from the neutral events). The SNLI dataset is a popular dataset for assessing meaning inference models. Notice that the task goes beyond mere pairwise word similarity: for example, consider the second sentence in Table 12.1: the neutral sentence is much more similar (in terms of average word similarity) to the original one than the entailed sentence. We need the ability to highlight some similarities, degrade the strength of others, and also to understand which kind of similarities are meaning preserving (i.e., going from man to patient in the context of a surgery), and which add new information (i.e., going from patient to man). The network architecture is designed to facilitate this kind of reasoning.

## 12.2 A TEXTUAL SIMILARITY NETWORK

The network will work in several stages. In the first stage, our goal is to compute pairwise word similarities that are more suitable for the task. The similarity function for two word vectors is

defined to be:

$$
\operatorname{sim} \left(\boldsymbol{w}_{1}, \boldsymbol{w}_{2}\right) = \operatorname{MLP}^{\text{transform}} \left(\boldsymbol{w}_{1}\right) \cdot \operatorname{MLP}^{\text{transform}} \left(\boldsymbol{w}_{2}\right)\tag{12.1}
$$

$$
\operatorname{MLP}^{\text{transform}}(\boldsymbol{x}) \in \mathbb{R}^{d_{s}} \quad \boldsymbol{w}_{1}, \boldsymbol{w}_{2} \in \mathbb{R}^{d_{\text{emb}}}.
$$

That is, we first transform each word vector by use of a trained nonlinear transformation, and then take the dot-product of the transformed vectors.

Each word in sentence a can be similar to several words in sentence b, and vice versa. For each word $w_{i}^{a}$ in sentence a we compute a $\ell_{b}$ -dimensional vector of its similarities to words in sentence b, normalized via softmax so that all similarities are positive and sum to one. This is called the alignment vector for the word:

$$
\alpha_{i}^{a} = \operatorname{softmax}(\operatorname{sim}(w_{i}^{a}, w_{1}^{b}), \dots, \operatorname{sim}(w_{i}^{a}, w_{\ell_{b}}^{b})).\tag{12.2}
$$

We similarly compute an alignment vector for each word in b

$$
\alpha_{i}^{b} = \operatorname{softmax}(\operatorname{sim}(w_{1}^{a}, w_{i}^{b}), \dots, \operatorname{sim}(w_{\ell_{a}}^{a}, w_{i}^{b}))
$$

$$
\boldsymbol{\alpha}_{i}^{\boldsymbol{a}} \in \mathbb{N}_{+}^{\ell_{b}} \quad \boldsymbol{\alpha}_{i}^{\boldsymbol{b}} \in \mathbb{N}_{+}^{\ell_{a}}.
$$

For every word $w_{i}^{a}$ we compute a vector $\bar{w}_{i}^{b}$ composed of a weighted-sum of the words in b that are aligned to $w_{i}^{a}$ , and similarly for every word $w_{j}^{b}$ :

$$
\bar{w}_{i}^{b} = \sum_{j = 1}^{\ell_{b}} \alpha_{i[j]}^{a} w_{j}^{b}
$$

$$
\bar{w}_{j}^{a} = \sum_{i = 1}^{\ell_{a}} \alpha_{i[j]}^{b} w_{i}^{a}.\tag{12.3}
$$

A vector $\bar{w}_{i}^{b}$ captures the weighted mixture of words in sentence b that are triggered by the ith word in sentence a.

Such weighted sum representations of a sequence of vectors, where the weights are computed by a softmax over scores such as the one in Equation (12.2), are often referred to as an attention mechanism. The name comes from the fact that the weights reflect how important is each item in the target sequence to the given source item—how much attention should be given to each of the items in the target sequence with respect to the source item. We will discuss attention in more details in Chapter 17, when discussing conditioned-generation models.

The similarity between $w_{i}^{a}$ and the corresponding triggered mixture $\bar{w}_{i}^{b}$ in sentence b is not necessarily relevant for the NLI task. We attempt to transform each such pair into a representation

## 144 12. CASE STUDY: A FEED-FORWARD ARCHITECTURE FOR SENTENCE

vector $v_{i}^{a}$ that focuses on the important information for the task. This is done using another feedforward network:

$$
\boldsymbol{v}_{i}^{a} = \mathrm{MLP}^{\mathrm{pair}}([\boldsymbol{w}_{i}^{a}; \bar{\boldsymbol{w}}_{i}^{b}])\tag{12.4}
$$

$$
\pmb{v}_{j}^{\pmb{b}} = \mathrm{MLP}^{\mathrm{pair}}([\pmb{w}_{j}^{\pmb{b}}; \bar{\pmb{w}}_{j}^{\pmb{a}}]).
$$

Note that unlike the similarity function in Equation (12.1) that considered each term individually, here the function can handle both terms differently.

Finally, we sum the resulting vectors and pass them into a final MLP classifier for predicting the relation between the two sentences (entail, contradict, or neutral):

$$
\boldsymbol{v}^{a} = \sum_{i} \boldsymbol{v}_{i}^{a}
$$

$$
\boldsymbol{v}^{\boldsymbol{b}} = \sum_{j} \boldsymbol{v}_{j}^{\boldsymbol{b}}\tag{12.5}
$$

$$
\hat{y} = \mathrm{MLP}^{\mathrm{decide}}([v^{a}; v^{b}]).
$$

In the work of Parikh et al. [2016], all the MLPs have two hidden layers of size 200, and a ReLU activation function. The entire process is captured in the same computation graph, and the network is trained end-to-end using the cross-entropy loss. The pre-trained word embeddings themselves were not changed with the rest of the network, relying on $\mathbf{MLP}^{\text{transform}}$ to do the needed adaptation. As of the time of this writing, this architecture is the best performing network on the SNLI dataset.

To summarize the architecture, the transform network learns a similarity function for word-level alignment. It transforms each word into a space that preserves important word-level similarities. After the transform network, each word vector is similar to other words that are likely to refer to the same entity or the same event. The goal of this network is to find words that may contribute to the entailment. We get alignments in both directions: from each word in a to multiple words in b, and from each word in b to multiple words in a. The alignments are soft, and are manifested by weighted group membership instead of by hard decisions, so a word can participate in many pairs of similarities. This network is likely to put men and people next to each other, men and two next to each other and man and patient next to each other, and likewise for inflected forms perform and performing.

The pair network then looks at each aligned pair (word + group) using a weighted-CBOW representation, and extracts information relevant to the pair. Is this pair useful for the entailment prediction task? It also looks at sentence each component of the pair came from, and will likely learn that patient and man are entailing in one direction and not the other.

Finally, the decide network looks at the aggregated data from the word pairs, and comes up with a decision based on all the evidence. We have three stages of reasoning: first one recovers weak local evidence in terms of similarity alignment; the second one looks at weighted multi-word units and also adds directionality; and the third integrates all the local evidence into a global decision.

The details of the network are tuned for this particular task and dataset, and it is not clear if they will generalize to other settings. The idea of this chapter was not to introduce a specific network architecture, but rather to demonstrate that complex architectures can be designed, and that it is sometimes worth the effort to do so. A new component introduced in this chapter that is worth noting is the use of the soft alignment weights $\alpha_{i}^{a}$ (also sometimes called attention), in order to compute a weighted sum of elements $\bar{w}_{i}^{b}$ [Equation (12.3)]. We will encounter this idea again when discussing attention-based conditioned generation with RNNs in Chapter 17.

PART III

Specialized Architectures

In the previous chapters, we've discussed supervised learning and feed-forward neural networks, and how they can be applied to language tasks. The feed-forward neural networks are for the most part general-purpose classification architectures—nothing in them is tailored specifically for language data or sequences. Indeed, we mostly structured the language tasks to fit into the MLP framework.

In the following chapters, we will explore some neural architectures that are more specialized for dealing with language data. In particular, we will discuss 1D convolutional-and-pooling architectures (CNNs), and recurrent neural networks (RNNs). CNNs are neural architectures that are specialized at identifying informative ngrams and gappy-ngrams in a sequence of text, regardless of their position, but while taking local ordering patterns into account. RNNs are neural architectures that are designed to capture subtle patterns and regularities in sequences, and that allow modeling non-markovian dependencies looking at “infinite windows” around a focus word, while zooming-in on informative sequential patterns in that window. Finally, we will discuss sequence-generation models and conditioned generation.

Feature Extraction The CNN and RNN architectures explored in this part of the book are primarily used as feature extractors. A CNN or an RNN network are not a standalone component, but rather each such network produces a vector (or a sequence of vectors) that are then fed into further parts of the network that will eventually lead to predictions. The network is trained end-to-end (the predicting part and the convolutional/recurrent architectures are trained jointly) such that the vectors resulting from the convolutional or recurrent part of the network will capture the aspects of the input that are useful for the given prediction task. In the following chapters, we introduce feature extractors that are based on the CNN and the RNN architectures. As the time of this writing, RNN-based feature extractors are more established than CNNs as feature extractors for text-based applications. However, the different architectures have different strengths and weaknesses, and the balance between them may shift in the future. Both are worth knowing, and hybrid approaches are also likely to become popular. Chapters 16 and 17 discuss the integration of RNN-based feature extractors in different NLP prediction and generation architectures. Large parts of the discussion in these chapters are applicable also to convolutional networks.

CNNs and RNNs as Lego Bricks. When learning about the CNN and RNN architectures, it is useful to think about them as "Lego Bricks," that can be mixed and matched to create a desired structure and to achieve a desired behavior.

This Lego-bricks-like mixing-and-matching is facilitated by the computation-graph mechanism and gradient-based optimization. It allows treating network architectures such as MLPs, CNNs and RNNs as components, or blocks, that can be mixed and matched to create larger and larger structures—one just needs to make sure that that input and output dimensions of the different components match—and the computation graph and gradient-based training will take care of the rest.

This allows us to create large and elaborate network structures, with multiple layers of MLPs, CNNs and RNNs feeding into each other, and training the entire network in an end-to-end fashion. Several examples are explored in later chapters, but many others are possible, and different tasks may benefit from different architectures. When learning about a new architecture, don't think "which existing component does it replace?" or "how do I use it to solve a task?" but rather "how can I integrate it into my arsenal of building blocks, and combine it with the other components in order to achieve a desired result?".


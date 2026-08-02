---
title: "Chapter 8 \u2014 From Textual Features to Inputs"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 8
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 2018
source_line_end: 2294
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 1
source_empty_image_alt: 1
non_semantic_image_alt: 0
caption_derived_image_alt: 1
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

# Chapter 8 — From Textual Features to Inputs

> [[../README|本书目录]] · [[07-chapter-7-case-studies-of-nlp-features|上一章]] · [[09-chapter-9-language-modeling|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 2018–2294。
> - 本章保留 1 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# From Textual Features to Inputs

In Chapters 2 and 4 we discussed classifiers that accept feature vectors as input, without getting into much details about the contents of these vectors. In Chapters 6 and 7 we discussed the sources of information which can serve as the core features for various natural language tasks. In this chapter, we discuss the details of going from a list of core-features to a feature-vector that can serve as an input to a classifier.

To recall, in Chapters 2 and 4 we presented machine-trainable models (either linear, log-linear, or multi-layer perceptron). The models are parameterized functions $f(x)$ that take as input a $d_{in}$ dimensional vector $x$ and produce a $d_{out}$ dimensional output vector. The function is often used as a classifier, assigning the input $x$ a degree of membership in one or more of $d_{out}$ classes. The function can be either simple (for a linear model) or more complex (for arbitrary neural networks). In this chapter we focus on the input, $x$ .

## 8.1 ENCODING CATEGORICAL FEATURES

When dealing with natural language, most of the features represent discrete, categorical features such as words, letters, and part-of-speech tags. How do we encode such categorical data in a way which is amenable for use by a statistical classifier? We discuss two options, one-hot encodings and dense embedding vectors, as well as the trade-offs and the relations between them.

## 8.1.1 ONE-HOT ENCODINGS

In linear and log-linear models of the form $f(x) = xW + b$ , it is common to think in term of indicator functions, and assign a unique dimension for each possible feature. For example, when considering a bag-of-words representation over a vocabulary of 40,000 items, x will be a 40,000-dimensional vector, where dimension number 23,227 (say) corresponds to the word dog, and dimension number 12,425 corresponds to the word cat. A document of 20 words will be represented by a very sparse 40,000-dimensional vector in which at most 20 dimensions have non-zero values. Correspondingly, the matrix W will have 40,000 rows, each corresponding to a particular vocabulary word. When the core features are the words in a 5 words window surrounding and including a target word (2 words to each side) with positional information, and a vocabulary of 40,000 words (that is, features of the form word-2=dog or word0=sofa), x will be a 200,000-dimensional vector with 5 non-zero entries, with dimension number 19,234 corresponding to (say) word-2=dog and dimension number 143,167 corresponding to word0=sofa. This is called a one-hot encoding, as each dimension corresponds to a unique feature, and the resulting feature

## 8. FROM TEXTUAL FEATURES TO INPUTS

vector can be thought of as a combination of high-dimensional indicator vectors in which a single dimension has a value of 1 and all others have a value of 0.

## 8.1.2 DENSE ENCODINGS (FEATURE EMBEDDINGS)

Perhaps the biggest conceptual jump when moving from sparse-input linear models to deeper nonlinear models is to stop representing each feature as a unique dimension in a one-hot representation, and representing them instead as dense vectors. That is, each core feature is embedded into a d dimensional space, and represented as a vector in that space. $^{1}$ The dimension d is usually much smaller than the number of features, i.e., each item in a vocabulary of 40,000 items (encoded as 40,000-dimensional one-hot vectors) can be represented as 100 or 200 dimensional vector. The embeddings (the vector representation of each core feature) are treated as parameters of the network, and are trained like the other parameters of the function f. Figure 8.1 shows the two approaches to feature representation.

The general structure for an NLP classification system based on a feed-forward neural network is thus.

1. Extract a set of core linguistic features $f_{1}, \ldots, f_{k}$ that are relevant for predicting the output class.

2. For each feature $f_{i}$ of interest, retrieve the corresponding vector $v(f_{i})$ .

3. Combine the vectors (either by concatenation, summation, or a combination of both) into an input vector x.

4. Feed x into a nonlinear classifier (feed-forward neural network).

The biggest change in the input when moving from linear to deeper classifier is, then, the move from sparse representations in which each feature is its own dimension, to a dense representation in which each feature is mapped to a vector. Another difference is that we mostly need to extract only core features and not feature combinations. We will elaborate on both these changes briefly.

## 8.1.3 DENSE VECTORS VS. ONE-HOT REPRESENTATIONS

What are the benefits of representing our features as vectors instead of as unique IDs? Should we always represent features as dense vectors? Let's consider the two kinds of representations.

![Figure 8.1](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/ec6708f52ce8d6fbd34cfc7dd38788ee720dae201ec8402b858aab08db5d8eac.jpg)  
Figure 8.1: Sparse vs. dense feature representations. Two encodings of the information: current word is "dog;" previous word is "the;" previous pos-tag is "DET." (a) Sparse feature vector. Each dimension represents a feature. Feature combinations receive their own dimensions. Feature values are binary. Dimensionality is very high. (b) Dense, embeddings-based feature vector. Each core feature is represented as a vector. Each feature corresponds to several input vector entries. No explicit encoding of feature combinations. Dimensionality is low. The feature-to-vector mappings come from an embedding table.

One Hot Each feature is its own dimension.

\- Dimensionality of one-hot vector is same as number of distinct features.

\- Features are completely independent from one another. The feature “word is ‘dog’” is as dissimilar to “word is ‘thinking’” than it is to “word is ‘cat’”.

## 92 8. FROM TEXTUAL FEATURES TO INPUTS

Dense Each feature is a d-dimensional vector.

- Dimensionality of vector is d.

\- Model training will cause similar features to have similar vectors—information is shared between similar features.

One benefit of using dense and low-dimensional vectors is computational: the majority of neural network toolkits do not play well with very high-dimensional, sparse vectors. However, this is just a technical obstacle, which can be resolved with some engineering effort.

The main benefit of the dense representations is in generalization power: if we believe some features may provide similar clues, it is worthwhile to provide a representation that is able to capture these similarities. For example, assume we have observed the word dog many times during training, but only observed the word cat a handful of times, or not at all. If each of the words is associated with its own dimension, occurrences of dog will not tell us anything about the occurrences of cat. However, in the dense vectors representation the learned vector for dog may be similar to the learned vector for cat, allowing the model to share statistical strength between the two events. This argument assumes that we saw enough occurrences of the word cat such that its vector will be similar to that of dog, or otherwise that “good” vectors are somehow given to us. Such “good” word-vectors (also called pre-trained embeddings) can be obtained from a large corpus of text through algorithms that make use of the distributional hypothesis. Such algorithms are discussed in more depth in Chapter 10.

In cases where we have relatively few distinct features in the category, and we believe there are no correlations between the different features, we may use the one-hot representation. However, if we believe there are going to be correlations between the different features in the group (for example, for part-of-speech tags, we may believe that the different verb inflections VB and VBZ may behave similarly as far as our task is concerned) it may be worthwhile to let the network figure out the correlations and gain some statistical strength by sharing the parameters. It may be the case that under some circumstances, when the feature space is relatively small and the training data is plentiful, or when we do not wish to share statistical information between distinct words, there are gains to be made from using the one-hot representations. However, this is still an open research question, and there is no strong evidence to either side. The majority of work (pioneered by Chen and Manning [2014], Collobert and Weston [2008], Collobert et al. [2011]) advocate the use of dense, trainable embedding vectors for all features. For work using neural network architecture with sparse vector encodings, see Johnson and Zhang [2015].

## 8.2 COMBINING DENSE VECTORS

Each feature corresponds to a dense vector, and the different vectors need to be combined somehow. The prominent options are concatenation, summation (or averaging), and combinations of the two.

## 8.2.1 WINDOW-BASED FEATURES

Consider the case of encoding a window of size k words to each side of a focus word at position i. Assume k = 2; we need to encode the words at positions i - 2, i - 1, $i + 1$ and $i + 2$ . Assume the window items are the words a, b, c, and d, and let a, b, c and d be the corresponding word vectors. If we do not care about the relative positions of the words within the window, we will encode the window as a sum: $a + b + c + d$ . If we do care about the relative positions, we rather use concatenation: [a; b; c; d]. Here, even though a word will have the same vector regardless of its position within the window, the word's position is reflected by its position within the concatenation. $^{2}$

We may not care much about the order, but would want to consider words further away from the context word less than words that are closer to it. This can be encoded as a weighted sum, i.e., $\frac{1}{2}a + b + c + \frac{1}{2}d$ .

These encodings can be mixed and matched. Assume we care if the feature occurs before or after the focus word, but do not care about the distance as long as it is within the window. This can be encoded using a combination of summation and concatenation: $[(a + b);(c + d)]$ .

A note on notation When describing network layers that get concatenated vectors x, y, and z as input, some authors use explicit concatenation ( $[x; y; z]W + b$ ) while others use an affine transformation $(xU + yV + zW + b)$ . If the weight matrices U, V, W in the affine transformation are different $^{3}$ than one another, the two notations are equivalent.

## 8.2.2 VARIABLE NUMBER OF FEATURES: CONTINUOUS BAG OF WORDS

Feed-forward networks assume a fixed dimensional input. This can easily accommodate the case of a feature-extraction function that extracts a fixed number of features: each feature is represented as a vector, and the vectors are concatenated. This way, each region of the resulting input vector corresponds to a different feature. However, in some cases the number of features is not known in advance (for example, in document classification it is common that each word in the sentence is a feature). We thus need to represent an unbounded number of features using a fixed size vector. One way of achieving this is through a so-called continuous bag of words (CBOW) representation [Mikolov et al., 2013b]. The CBOW is very similar to the traditional bag-of-words representation in which we discard order information, and works by either summing or averaging the embedding

## 94 8. FROM TEXTUAL FEATURES TO INPUTS

vectors of the corresponding features: $^{4}$

$$
\operatorname{CBOW} \left(f_{1}, \dots, f_{k}\right) = \frac{1}{k} \sum_{i = 1}^{k} v \left(f_{i}\right).\tag{8.1}
$$

A simple variation on the CBOW representation is weighted CBOW, in which different vectors receive different weights:

$$
\operatorname{WCBOW} \left(f_{1}, \dots, f_{k}\right) = \frac{1}{\sum_{i = 1}^{k} a_{i}} \sum_{i = 1}^{k} a_{i} v \left(f_{i}\right).\tag{8.2}
$$

Here, each feature $f_{i}$ has an associated weight $a_{i}$ , indicating the relative importance of the feature. For example, in a document classification task, a feature $f_{i}$ may correspond to a word in the document, and the associated weight $a_{i}$ could be the word's TF-IDF score.

## 8.3 RELATION BETWEEN ONE-HOT AND DENSE VECTORS

Representing features as dense vectors is an integral part of the neural network framework, and, consequently, the differences between using sparse and dense feature representations are subtler than they may appear at first. In fact, using sparse, one-hot vectors as input when training a neural network amounts to dedicating the first layer of the network to learning a dense embedding vector for each feature based on the training data.

When using dense vectors, each categorical feature value $f_{i}$ is mapped to a dense, d-dimensional vector $v(f_{i})$ . This mapping is performed through the use of an embedding layer or a lookup layer. Consider a vocabulary of $|V|$ words, each embedded as a d dimensional vector. The collection of vectors can then be thought of as a $|V| \times d$ embedding matrix E in which each row corresponds to an embedded feature. Let $f_{i}$ be the one-hot representation of feature $f_{i}$ , that is, a $|V|$ -dimensional vector, which is all zeros except for one index, corresponding to the value of the ith feature, in which the value is 1. The multiplication $f_{i}E$ will then “select” the corresponding row of E. Thus, $v(f_{i})$ can be defined in terms of E and $f_{i}$ :

$$
v(f_{i}) = f_{i} E.\tag{8.3}
$$

And, similarly,

$$
\operatorname{CBOW} \left(f_{1}, \dots, f_{k}\right) = \sum_{i = 1}^{k} \left(\boldsymbol{f}_{i} \mathbb{E}\right) = \left(\sum_{i = 1}^{k} \boldsymbol{f}_{i}\right) \mathbb{E}.\tag{8.4}
$$

The input to the network is then considered to be a collection of one-hot vectors. While this is elegant and well-defined mathematically, an efficient implementation typically involves a hash-based data structure mapping features to their corresponding embedding vectors, without going through the one-hot representation.

Consider a network which uses a “traditional” sparse representation for its input vectors, and no embedding layer. Assuming the set of all available features is V and we have k “on” features $f_{1}, \ldots, f_{k}, f_{i} \in V$ , the network’s input is:

$$
\boldsymbol{x} = \sum_{i = 1}^{k} f_{i} \quad \boldsymbol{x} \in \mathbb{N}_{+}^{| V |}\tag{8.5}
$$

and so the first layer (ignoring the nonlinear activation) is:

$$
xW + b = \left(\sum_{i = 1}^{k} f_{i}\right) W + b\tag{8.6}
$$

$$
\boldsymbol{W} \in \mathbb{R}^{| V | \times d}, \quad \boldsymbol{b} \in \mathbb{R}^{d}.
$$

This layer selects rows of W corresponding to the input features in x and sums them, then adding a bias term. This is very similar to an embedding layer that produces a CBOW representation over the features, where the matrix W acts as the embedding matrix. The main difference is the introduction of the bias vector b, and the fact that the embedding layer typically does not undergo a nonlinear activation but rather is passed on directly to the first layer. Another difference is that this scenario forces each feature to receive a separate vector (row in W) while the embedding layer provides more flexibility, allowing for example for the features “next word is dog” and “previous word is dog” to share the same vector. However, these differences are small and subtle. When it comes to multi-layer feed-forward networks, the difference between dense and sparse inputs is smaller than it may seem at first sight.

## 8.4 ODDS AND ENDS

## 8.4.1 DISTANCE AND POSITION FEATURES

The linear distance in between two words in a sentence may serve as an informative feature. For example, in an event extraction task $^{5}$ we may be given a trigger word and a candidate argument word, and asked to predict if the argument word is indeed an argument of the trigger. Similarly, in a coreference-resolution task (deciding if which of the previously mentioned entities, if at all, a pronoun such as he or she refers to), we may be given a pair of (pronoun, candidate word) and asked to predict if they co-refer or not. The distance (or relative position) between the trigger

## 8. FROM TEXTUAL FEATURES TO INPUTS

and the argument is a strong signal for these prediction tasks. In the “traditional” NLP setup, distances are usually encoded by binning the distances into several groups (i.e., 1, 2, 3, 4, 5–10, 10+) and associating each bin with a one-hot vector. In a neural architecture, where the input vector is not composed of binary indicator features, it may seem natural to allocate a single input entry to the distance feature, where the numeric value of that entry is the distance. However, this approach is not taken in practice. Instead, distance features are encoded similarly to the other feature types: each bin is associated with a d-dimensional vector, and these distance-embedding vectors are then trained as regular parameters in the network [dos Santos et al., 2015, Nguyen and Grishman, 2015, Zeng et al., 2014, Zhu et al., 2015a].

## 8.4.2 PADDING, UNKNOWN WORDS, AND WORD DROPOUT

Padding In some cases your feature extractor will look for things that do not exist. For example, when working with parse trees, you may have a feature looking for the left-most dependant of a given word, but the word may not have any dependents to its left. Perhaps you are looking at the word to positions to the right of the current one, but you are at the end of the sequence and two positions to the right is past the end. What should be done in such situations? When using a bag-of-features approach (i.e., summing) you could just leave the feature out of the sum. When using a concatenation, you may provide a zero-vector in the place. These two approaches work fine technically, but could be sub-optimal for your problem domain. Maybe knowing that there is no left-modifier is informative? The suggested solution would be to add a special symbol (padding symbol) to your embedding vocabulary, and use the associated padding vector in these cases. Depending on the problem at hand, you may want to use different padding vectors for different situations (i.e., no-left-modifier may be a different vector than no-right-modifier). Such paddings are important for good prediction performance, and are commonly used. Unfortunately, their use is not often reported, or quickly glossed over, in many research papers.

Unknown Words Another case where a requested feature vector will not be available is for out-of-vocabulary (OOV) items. You are looking for the word on the left, observe the value variational, but this word was not a part of your training vocabulary, so you don't have an embedding vector for it. This case is different from the padding case, because the item is there, but you just don't know it. The solution is similar, however, reserve a special symbol, UNK, representing an unknown token, for use in such cases. Again, you may or may not want to use different unknown symbols for different vocabularies. In any case, it is advised to not share the padding and the unknown vectors, as they reflect two very different conditions.

Word Signatures Another technique for dealing with unknown words is backing-off from the word forms to word signatures. Using the UNK symbol for unknown words is essentially backing-off from all unknown words to the same signature. But, depending on the task one is trying to solve, one may come up with more fine-grained strategies. For example, we may replace unknown words that end with ing with an \* \_ing\* symbol, words that end with ed with an \* \_ed\* symbol, words that start with $un$ with an $*un\_$ \* symbol, numbers with a $*NUM*$ symbol, and so on. The list of mappings is hand-crafted to reflect informative backing-off patterns. This approach is often used in practice, but rarely reported in deep-learning papers. While there are approaches that allow to automatically learn such backing-off behavior as part of the model training without needing to manually define the backing-off patterns (see discussion on sub-word units in Section 10.5.5), they are in many cases an overkill and hard-coding the patterns is as effective and more computationally efficient.

Word Dropout Reserving a special embedding vector for unknown words is not enough—if all the features in the training set have their own embedding vectors, the unknown-word condition will not be observed in training: the associated vector will not receive any updates, and the model will not be tuned to handle the unknown condition. This is equivalent to just using a random vector when an unknown word is encountered at test time. The model needs to be exposed to the unknown-word condition during training. A possible solution would be to replace all (or some) of the features with a low frequency in the training with the unknown symbol (i.e., pre-process the data, replacing words with a frequency below a threshold with \*unknown\*). This solution works, but has the disadvantage of losing some training data—these rare words will not receive any signal. A better solution is the use of word-dropout: when extracting features in training, randomly replace words with the unknown symbol. The replacement should be based on the word's frequency: less frequent words will be more likely to be replaced by the unknown symbol than frequent ones. The random replacement should be decided on runtime—a word that was dropped once may or may not be dropped when it is encountered again (say, in different iterations over the training data). There is no established formula for deciding on the word dropout rate. Works in my group use $\frac{\alpha}{\#(w)+\alpha}$ , where $\alpha$ is a parameter for controlling the aggressiveness of the dropout [Kiperwasser and Goldberg, 2016b].

Word Dropout as Regularization Besides better adaptation to unknown words, word dropout may also be beneficial for preventing overfitting and improving robustness by not letting the model rely too much on any single word being present [Iyyer et al., 2015]. When used this way, word dropout should be applied frequently also to frequent words. Indeed, the suggestion of Iyyer et al. [2015] is to drop word instances according to a Bernoulli trial with probability p, regardless of their frequency. When word dropout is a applied as a regularizer, you may not want to replace the dropped words with the unknown symbol in some circumstances. For example, when the feature representation is a bag-of-words over the document and more than a quarter of the words are dropped, replacing the dropped words with the unknown word symbol will create a feature representation that is not likely to occur at test time, where such a large concentration of unknown words is unlikely.

## 8. FROM TEXTUAL FEATURES TO INPUTS

## 8.4.3 FEATURE COMBINATIONS

Note that the feature extraction stage in the neural network settings deals only with extraction of core features. This is in contrast to the traditional linear-model-based NLP systems in which the feature designer had to manually specify not only the core features of interest but also interactions between them (e.g., introducing not only a feature stating “word is X” and a feature stating “tag is Y” but also combined feature stating “word is X and tag is Y” or sometimes even “word is X, tag is Y and previous word is Z”). The combination features are crucial in linear models because they introduce more dimensions to the input, transforming it into a space where the data-points are closer to being linearly separable. On the other hand, the space of possible combinations is very large, and the feature designer has to spend a lot of time coming up with an effective set of feature combinations. One of the promises of the nonlinear neural network models is that one needs to define only the core features. The nonlinearity of the classifier, as defined by the network structure, is expected to take care of finding the indicative feature combinations, alleviating the need for feature combination engineering.

As discussed in Section 3.3, kernel methods [Shawe-Taylor and Cristianini, 2004], and in particular polynomial kernels [Kudo and Matsumoto, 2003], also allow the feature designer to specify only core features, leaving the feature combination aspect to the learning algorithm. In contrast to neural network models, kernels methods are convex, admitting exact solutions to the optimization problem. However, the computational complexity of classification in kernel methods scales linearly with the size of the training data, making them too slow for most practical purposes, and not suitable for training with large datasets. On the other hand, the computational complexity of classification using neural networks scales linearly with the size of the network, regardless of the training data size. $^{6}$

## 8.4.4 VECTOR SHARING

Consider a case where you have a few features that share the same vocabulary. For example, when assigning a part-of-speech to a given word, we may have a set of features considering the previous word, and a set of features considering the next word. When building the input to the classifier, we will concatenate the vector representation of the previous word to the vector representation of the next word. The classifier will then be able to distinguish the two different indicators, and treat them differently. But should the two features share the same vectors? Should the vector for "dog:previous-word" be the same as the vector of "dog:next-word"? Or should we assign them two distinct vectors? This, again, is mostly an empirical question. If you believe words behave differently when they appear in different positions (e.g., word X behaves like word Y when in the previous position, but X behaves like Z when in the next position) then it may be a good idea to use two different vocabularies and assign a different set of vectors for each feature type. However, if you believe the words behave similarly in both locations, then something may be gained by using a shared vocabulary for both feature types.

## 8.4.5 DIMENSIONALITY

How many dimensions should we allocate for each feature? Unfortunately, there are no theoretical bounds or even established best-practices in this space. Clearly, the dimensionality should grow with the number of the members in the class (you probably want to assign more dimensions to word embeddings than to part-of-speech embeddings) but how much is enough? In current research, the dimensionality of word-embedding vectors range between about 50 to a few hundreds, and, in some extreme cases, thousands. Since the dimensionality of the vectors has a direct effect on memory requirements and processing time, a good rule of thumb would be to experiment with a few different sizes, and choose a good trade-off between speed and task accuracy.

## 8.4.6 EMBEDDINGS VOCABULARY

What does it mean to associate an embedding vector for every word? Clearly, we cannot associate one with all possible values, and need to restrict ourselves to every value from a finite vocabulary. This vocabulary is usually based on the training set, or, if we use pre-trained embeddings, on the training on which the pre-trained embeddings were trained. It is recommended that the vocabulary will also include a designated UNK symbol, associating a special vector to all words that are not in the vocabulary.

## 8.4.7 NETWORK'S OUTPUT

For multi-class classification problems with k classes, the network's output is a k-dimensional vector in which every dimension represents the strength of a particular output class. That is, the output remains as in the traditional linear models—scalar scores to items in a discrete set. However, as we saw in Chapter 4, there is a $d \times k$ matrix associated with the output layer. The columns of this matrix can be thought of as d dimensional embeddings of the output classes. The vector similarities between the vector representations of the k classes indicate the model's learned similarities between the output classes.

Historical Note Representing words as dense vectors for input to a neural network was popularized by Bengio et al. [2003] in the context of neural language modeling. It was introduced to NLP tasks in the pioneering work of Collobert, Weston, and colleagues [Collobert and Weston, 2008, Collobert et al., 2011]. $^{7}$ Using embeddings for representing not only words but arbitrary features was popularized following Chen and Manning [2014].

## 100 8. FROM TEXTUAL FEATURES TO INPUTS 8.5 EXAMPLE: PART-OF-SPEECH TAGGING

The POS-tagging task (Section 7.4) we are given a sentence of n words $w_{1}, w_{2}, \ldots, w_{n}$ , and a word position i, and need to predict the tag of $w_{i}$ . Assuming we tag the words from left to right, we can also look at the previous tag predictions, $\hat{p}_{1}, \ldots, \hat{p}_{i-1}$ . A list of concrete core features is given in Section 7.4, here we discuss encoding them as an input vector. We need a feature function $x = \phi(s, i)$ , getting a sentence s comprised of words and previous tagging decisions and an input position i, and returning a feature vector x. We assume a function $suf(w, k)$ that returns the k-letter suffix of word w, and similarly $pref(w, k)$ that returns the prefix.

We begin with the three boolean questions: word-is-capitalized, word-contains-hyphen and word-contains-digit. The most natural way to encode these is to associate each of them with its own dimension, with a value of 1 if the condition holds for word $w_i$ and 0 otherwise. We will put these in a 3-dimensional vector associated with word $i$ , $c_i$ .

Next, we need to encode words, prefixes, suffixes, and part-of-speech tags in various positions in the window. We associate each word $w_{i}$ with an embedding vector $v_{w}(w_{i}) \in \mathbb{R}^{d_{w}}$ . Similarly, we associate each two-letter suffix $suf(w_{i}, 2)$ with an embedding vector $v_{s}(suf(w_{i}, 2))$ and similarly for three-letter suffixes $v_{s}(suf(w_{i}, 3))$ , $v_{s}(\cdot) \in \mathbb{R}^{d_{s}}$ . Prefixes get the same treatment, with embeddings $v_{p}(\cdot) \in \mathbb{R}^{d_{p}}$ . Finally, each POS-tag receives an embedding $v_{t}(p_{i}) \in \mathbb{R}^{d_{t}}$ . Each position i can be associated with a vector $v_{i}$ of the relevant word information (word form, prefixes, suffixes, Boolean features):

$$
\boldsymbol{v}_{i} = \left[c_{i}; v_{w} \left(w_{i}\right); v_{s} \left(suf \left(w_{i}, 2\right)\right); v_{s} \left(suf \left(w_{i}, 3\right)\right); v_{p} \left(pref \left(w_{i}, 2\right)\right); v_{p} \left(pref \left(w_{i}, 3\right)\right) \right]
$$

$$
\boldsymbol{v}_{i} \in \mathbb{R}^{3 + d_{w} + 2d_{s} + 2d_{p}}.
$$

Our input vector x is then a concatenation of the following vectors:

$$
\boldsymbol{x} = \phi(s, i) =[\boldsymbol{v}_{i - 2}; \boldsymbol{v}_{i - 1}; \boldsymbol{v}_{i}; \boldsymbol{v}_{i + 1}; \boldsymbol{v}_{i + 2}; v_{t}(p_{i - 1}); v_{t}(p_{i - 2})]
$$

$$
\boldsymbol{x} \in \mathbb{R}^{5(3 + d_{w} + 2d_{s} + 2d_{p}) + 2d_{t}}.
$$

Discussion Note that the words in each position share the same embedding vectors—when creating $v_{i}$ and $v_{i-1}$ we read from the same embedding tables—and that a vector $v_{i}$ does not “know” its relative position. However, because of the vector concatenation, the vector x “knows” that which relative position each v is associated with because of its relative position within x. This allows us to share some information between the words in the different positions (the vector of the word dog will receive updates when the word is at relative position -2 as well as when it is in relative position +1), but will also be treated differently by the model when it appears in different relative positions, because it will be multiplied by a different part of the matrix in the first layer of the network.

An alternative approach would be to associate each word-and-position pair with its own embedding, i.e., instead of a single table $v_{w}$ we will have five embedding tables $v_{w-2}, v_{w-1}, v_{w0}, v_{w+1}, v_{w+2}$ , and use appropriate one for each relative word position. This approach will substantially increase the number of parameters in the model (we will need to learn five-times as many embedding vectors), and will not allow sharing between the different words. It will also be somewhat more wasteful in terms of computation, as in the previous approach we could compute the vector $v_{i}$ for each word in the sentence once, and then re-use them when looking at different positions i, while in the alternative approach the vectors $v_{i}$ will need to be re-computed for each position i we are looking at. Finally, it will be harder to use pre-trained word vectors, because the pre-trained vectors do not have location information attached to them. However, this alternative approach would allow us to treat each word position completely independently from the others, if we wanted to. $^{9}$

Another point to consider is capitalization. Should the words Dog and dog receive different embeddings? While capitalization is an important clue for tagging, in our case the capitalization status of word $w_{i}$ is already encoded in the boolean features $c_{i}$ . It is thus advisable to lower-case all words in the vocabulary before creating or querying the embedding table.

Finally, the prefix-2 and prefix-3 features are redundant with each other (one contains the other) and similarly for the suffixes. Do we really need both? Can we make them share information? Indeed, we could use letter embeddings instead of suffix embeddings, and replace the two suffix embeddings with a vector composed of the concatenation of the three last letters in the word. In Section 16.2.1, we will see an alternative approach, that uses character-level recurrent neural networks (RNNs) to capture prefix, suffix and various other properties of the word form.

## 8.6 EXAMPLE: ARC-FACTORED PARSING

In the Arc-Factored parsing task (Section 7.7) we are given a sentence of n words $w_{1:n}$ and their parts-of-speech $p_{1:n}$ , and need to predict a parse tree. Here, we are concerned with the features for scoring a single attachment decision between words $w_{h}$ and $w_{m}$ , where $w_{h}$ is the candidate head-word and $w_{m}$ is the candidate modifier word.

A list of concrete core features was given in Section 7.7, and here we discuss encoding them as an input vector. We define a feature function $x = \phi(h, m, sent)$ receiving a sentence comprised of word and POS-tags, and the positions of a head-word (h) and a modifier-word (m).

First, we need to consider the head word, its POS-tag, and the words and POS-tags in a five-word window around the head word (two words to each side). We associate each word w in our vocabulary with an embedding vector $v_{w}(w) \in \mathbb{R}^{d_{w}}$ and similarly each part-of-speech tag p with an embedding vector $v_{t}(p) \in \mathbb{R}^{d_{t}}$ . We then define the vector representation of a word at position i to be $\boldsymbol{v}_{i} =[v_{w}(w_{i}); v_{t}(p_{i}] \in \mathbb{R}^{d_{w} + d_{t}}$ , the concatenation of the word and POS vector.

## 102 8. FROM TEXTUAL FEATURES TO INPUTS

Then, we associate the head word with a vector h representing the word within its context, and associate the modifier word with a similar vector m:

$$
\boldsymbol{h} =[\boldsymbol{v}_{h - 2}; \boldsymbol{v}_{h - 1}; \boldsymbol{v}_{h}; \boldsymbol{v}_{h + 1}; \boldsymbol{v}_{h + 2}]
$$

$$
\pmb{m} =[\pmb{v}_{m - 2}; \pmb{v}_{m - 1}; \pmb{v}_{m}; \pmb{v}_{m + 1}; \pmb{v}_{m + 2}].
$$

This takes care of the elements in the first block of features. Note that, like with the part-of-speech tagging features, this encoding cares about the relative position of each of the context words. If we didn't care about the positions, we could have instead represented the head word as $h' =[v_h;(v_{h-2} + v_{h-1} + v_{h+1} + v_{h+2})]$ . This sums the context words into a bag-of-words, losing their positional information, yet, concatenates the context and the focus words, retaining the distinction between them.

We now turn to the distance and direction features. While we could assign the distance a single dimension with the numeric distance value, it is common to bin the distance into k discrete bins (say 1, 2, 3, 4–7, 8–10, 11+), and associate each bin with a $d_{d}$ -dimensional embedding. The direction is a Boolean feature, and we represent it as its own dimension. $^{1(1)}$ We denote the vector containing the binned distance embedding concatenated with the Boolean direction feature as d.

Finally, we need to represent the words and POS-tags between the head and the modifier. Their number is unbounded and varies between different instances, so we cannot use concatenation. Fortunately, we do not care about the relative positions of the intervening items, so we can use a bag-of-words encoding. Concretely, we represent the between-context words as a vector c defined as the average of the words and POS between vectors:

$$
\boldsymbol{c} = \sum_{i = h}^{m} \boldsymbol{v}_{i}.
$$

Note that this sum potentially captures also the number of elements between the head and modifier words, making the distance feature potentially redundant.

Our final representation of an attachment decision to be scored, x is then encoded as the concatenation of the various elements:

$$
\boldsymbol{x} = \phi(h, m, sent) =[\boldsymbol{h}; \boldsymbol{m}; \boldsymbol{c}; \boldsymbol{d}],
$$

where:

$$
\boldsymbol{v}_{i} =[v_{w}(w_{i}); v_{t}(p_{i}]
$$

$$
\pmb{h} =[\pmb{v}_{h - 2}; \pmb{v}_{h - 1}; \pmb{v}_{h}; \pmb{v}_{h + 1}; \pmb{v}_{h + 2}]
$$

$$
\pmb{m} =[\pmb{v}_{m - 2}; \pmb{v}_{m - 1}; \pmb{v}_{m}; \pmb{v}_{m + 1}; \pmb{v}_{m + 2}]
$$

$$
\boldsymbol{c} = \sum_{i = h}^{m} \boldsymbol{v}_{i}
$$

d = binned distance embeddings; direction indicator.

Note how we combine positional window-based features with bag-of-word features by simple concatenation. The neural network layers on top of x can then infer transformation and feature combinations between the elements in the different windows, as well as between the different elements in the bag-of-words representation. The process of creating the representation x—the embedding tables for the words, POS-tags and binned distances, as well as the different concatenations and summations, is also part of the neural network. It is reflected in the computation-graph construction, and its parameters are trained jointly with the network.

The features creation part of the network could be even more complex. For example, if we had reasons to believe that the interactions between a word and its POS-tag, and the interactions within a context window, are more important than the interactions across elements of different entities, we could have reflected that in the input encoding by creating further nonlinear transformations in the feature-encoding process, i.e., replacing $v_{i}$ with $v_{i}^{\prime}=g(\boldsymbol{v}_{i}\boldsymbol{W}^{\boldsymbol{v}}+\boldsymbol{b}^{\boldsymbol{v}})$ and h with $h^{\prime}=g([\boldsymbol{v}_{h-2}^{\prime};\boldsymbol{v}_{h-1}^{\prime};\boldsymbol{v}_{h}^{\prime};\boldsymbol{v}_{h+1}^{\prime};\boldsymbol{v}_{h+2}^{\prime}]W^{h}+\boldsymbol{b}^{h})$ , and setting: $x=[h^{\prime};m^{\prime};c;d]$ .

# Language Modeling


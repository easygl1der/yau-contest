---
title: "Chapter 11 \u2014 Using Word Embeddings"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 11
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 2850
source_line_end: 2975
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

# Chapter 11 — Using Word Embeddings

> [[../README|本书目录]] · [[10-chapter-10-pre-trained-word-representations|上一章]] · [[12-chapter-12-case-study-a-feed-forward-architecture-for-sentence-meaning-i|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 2850–2975。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 11.1 OBTAINING WORD VECTORS

Word-embedding vectors are easy to train from a corpus, and efficient implementations of training algorithms are available. Moreover, one can also download pre-trained word vectors that were trained on very large quantities of text (bearing in mind that differences in training regimes and underlying corpora have a strong influence on the resulting representations, and that the available pre-trained representations may not be the best choice for the particular use case).

As the time of this writing, efficient implementations of the WORD2Vec algorithms are available as a stand-alone binary $^{1}$ as well as in the GENSim python package. $^{2}$ A modification of the WORD2Vec binary that allows using arbitrary contexts is also available. $^{3}$ An efficient implementation of the GloVe model is available as well. $^{4}$ Pre-trained word vectors for English can be obtained from Google $^{5}$ and Stanford $^{6}$ as well as other sources. Pre-trained vectors in languages other than English can be obtained from the Polyglot project. $^{7}$

## 11.2 WORD SIMILARITY

Given pre-trained word embedding vectors, the major use aside from feeding them into a neural network is to compute the similarity between two words using a similarity function over vectors $sim(\boldsymbol{u}, \boldsymbol{v})$ . A common and effective choice for similarity between vectors is the cosine similarity,

## 136 11. USING WORD EMBEDDINGS

corresponding to the cosine of the angle between the vectors:

$$
\operatorname{sim}_{\cos}(\boldsymbol{u}, \boldsymbol{v}) = \frac{\boldsymbol{u} \cdot \boldsymbol{v}}{\| \boldsymbol{u} \|_{2} \| \boldsymbol{v} \|_{2}}.\tag{11.1}
$$

When the vectors u and v are of unit-length ( $\|u\|_{2}=\|v\|_{2}=1$ ) the cosine similarity reduces to a dot-product $\text{sim}_{\cos}(u,v)=u\cdot v=\sum_{i}u_{[i]}v_{[i]}$ . Working with dot-products is very convenient computationally, and it is common to normalize the embeddings matrix such that each row has unit length. From now on, we assume the embeddings matrix E is normalized in this way.

## 11.3 WORD CLUSTERING

The word vectors can be easily clustered using clustering algorithms such as KMeans that are defined over Euclidean spaces. The clusters can then be used as features in learning algorithms that work with discrete features, or in other systems that require discrete symbols such as IR indexing systems.

## 11.4 FINDING SIMILAR WORDS

With row-normalized embeddings matrix as described above, the cosine similarity between two words $w_{1}$ and $w_{2}$ is given by:

$$
\operatorname{sim}_{\cos}(w_{1}, w_{2}) = E_{[w_{1}]} \cdot E_{[w_{2}]}.\tag{11.2}
$$

We are often interested in the k most similar words to a given word. Let $w = E_{[w]}$ be the vector corresponding to word w. The similarity to all other words can be computed by the matrix-vector multiplication s = E w. The result s is a vector of similarities, where $s_{[i]}$ is the similarity of w to the i th word in the vocabulary (the i th row in E). The k most similar words can be extracted by finding the indices corresponding to the k highest values in s.

In a optimized modern scientific computing library such as numpy, such matrix-vector multiplication is executed in milliseconds for embedding matrices with hundreds of thousands of vectors, allowing rather rapid calculation of similarities.

Word similarities that result from distributional measures can be combined with other forms of similarity. For example, we can define a similarity measure that is based on orthographic similarity (words that share the same letters). By filtering the list of top-k distributional-similar words to contain words that are also orthographically similar to the target word, we can find spelling variants and common typos of the target word.

## 11.4.1 SIMILARITY TO A GROUP OF WORDS

We may be interested in finding the most similar word to a group of words. This need arises when we have a list of related words, and want to expand it (for example, we have a list of four countries and want to extend it with names of more countries, or we have a list of gene names, and want find names of additional genes). Another use case is when we want to direct the similarity to be to a given sense of a word. By creating a list of words that are related to that sense, we can direct the similarity query toward that sense.

There are many ways of defining similarity of an item to a group, here we take the definition to be the average similarity to the items in the group, i.e., given a group of words $w_{1:k}$ we define its similarity to word w as: $\text{sim}(w, w_{1:k}) = \frac{1}{k} \sum_{i=1}^{k} \text{sim}_{\cos}(w, w_i)$ .

Thanks to linearity, computing the average cosine similarity from a group of words to all other words can be again done using a single matrix-vector multiplication, this time between the embedding matrix and the average word vector of the words in the group. The vector s in which $s_{[w]} = \text{sim}(w, w_{1:k})$ is computed by:

$$
s = E \left(w_{1} + w_{2} + \dots + w_{k}\right) / k.\tag{11.3}
$$

## 11.5 ODD-ONE OUT

Consider an odd-one-out question in which we are given a list of words and need to find the one that does not belong. This can be done by computing the similarity between each word to the average word vector of the group, and returning the least similar word.

## 11.6 SHORT DOCUMENT SIMILARITY

Sometimes we are interested in computing a similarity between two documents. While the best results are likely to be achieved using dedicated models solutions based on pre-trained word embeddings are often very competitive, especially when dealing with short documents as such web queries, newspaper headlines, or tweets. The idea is to represent each document as a bag-of-words, and define the similarity between the documents to be the sum of the pairwise similarities between the words in the documents. Formally, consider two documents $D_{1}=w_{1}^{1}, w_{2}^{1}, \ldots, w_{m}^{1}$ and $D_{2}=w_{1}^{2}, w_{2}^{2}, \ldots, w_{n}^{2}$ , and define the document similarity as:

$$
\operatorname{sim}_{\mathrm{doc}} \left(D_{1}, D_{2}\right) = \sum_{i = 1}^{m} \sum_{j = 1}^{n} \cos \left(\boldsymbol{w}_{i}^{1}, \boldsymbol{w}_{j}^{2}\right).
$$

Using basic linear algebra, it is straightforward to show that for normalized word vectors this similarity function can be computed as the dot product between the continuous-bag-of-words

representations of the documents:

$$
\operatorname{sim}_{\mathrm{doc}} \left(D_{1}, D_{2}\right) = \left(\sum_{i = 1}^{m} w_{i}^{1}\right) \cdot \left(\sum_{j = 1}^{n} w_{j}^{2}\right).
$$

Consider a document collection $D_{1:k}$ , and let D be a matrix in which each row i is the continuous bag-of-words representation of document $D_{i}$ . Then the similarity between a new document $D' = w_{1:n}'$ and each of the documents in the collection can be computed using a single matrix-vector product: $s = D \cdot(\sum_{i=1}^{n} w_{i}')$ .

## 11.7 WORD ANALOGIES

An interesting observation by Mikolov and colleagues [Mikolov et al., 2013a, Mikolov et al., 2013] that greatly contributed to the popularity of word embeddings is that one can perform "algebra" on the word vectors and get meaningful results. For example, for word embeddings trained using WORD2Vec, one could take the vector of the word king, subtract the word man, add the word woman and get that the closest vector to the result (when excluding the words king, man, and woman) belongs to the word queen. That is, in vector space $\boldsymbol{w}_{\text{king}} - \boldsymbol{w}_{\text{man}} + \boldsymbol{w}_{\text{woman}} \approx \boldsymbol{w}_{\text{queen}}$ . Similar results are obtained for various other semantic relations, for example $\boldsymbol{w}_{\text{France}} - \boldsymbol{w}_{\text{Paris}} + \boldsymbol{w}_{\text{London}} \approx \boldsymbol{w}_{\text{England}}$ , and the same holds for many other cities and countries.

This has given rise to the analogy solving task in which different word embeddings are evaluated on their ability to answer analogy questions of the form man:woman → king:? by solving:

$$
\text{analogy}(m: w \to k:?) = \underset{v \in V \setminus \{m, w, k\}}{\operatorname{argmax}} \cos(\boldsymbol{v}, \boldsymbol{k} - \boldsymbol{m} + \boldsymbol{w}).\tag{11.4}
$$

Levy and Goldberg [2014] observe that for normalized vectors, solving the maximization in Equation (11.4) is equivalent to solving Equation (11.5), that is, searching for a word that is similar to king, similar to man, and dissimilar to woman:

$$
\text{analogy}(m: w \to k:?) = \underset{v \in V \setminus \{m, w, k\}}{\operatorname{argmax}} \cos(\boldsymbol{v}, \boldsymbol{k}) - \cos(\boldsymbol{v}, \boldsymbol{m}) + \cos(\boldsymbol{v}, \boldsymbol{w}).\tag{11.5}
$$

Levy and Goldberg refer to this method as 3CosAdd. The move from arithmetics between words in vector space to arithmetics between word similarities helps to explain to some extent the ability of the word embeddings to “solve” analogies, as well as suggest which kinds of analogies can be recovered by this method. It also highlights a possible deficiency of the 3CosAdd analogy recovery method: because of the additive nature of the objective, one term in the summation may dominate the expression, effectively ignoring the others. As suggested by Levy and Goldberg, this can be alleviated by changing to a multiplicative objective (3CosMul):

$$
\text{analogy}(m: w \to k:?) = \underset{v \in V \setminus \{m, w, k\}}{\operatorname{argmax}} \frac{\cos(\boldsymbol{v}, \boldsymbol{k}) \cos(\boldsymbol{v}, \boldsymbol{w})}{\cos(\boldsymbol{v}, \boldsymbol{m}) + \epsilon}.\tag{11.6}
$$

While the analogy-recovery task is somewhat popular for evaluating word embeddings, it is not clear what success on a benchmark of analogy tasks says about the quality of the word embeddings beyond their suitability for solving this specific task.

## 11.8 RETROFITTING AND PROJECTIONS

More often than not, the resulting similarities do not fully reflect the similarities one has in mind for their application. Often, one can come up with or have access to a representative and relatively large list of word pairs that reflects the desired similarity better than the word embeddings, but has worse coverage. The retrofitting method of Faruqui et al. [2015] allows to use such data in order to improve the quality of the word embeddings matrix. Faruqui et al. [2015] show the effectiveness of the approach by using information derived from WordNet and PPDB (Section 6.2.1) to improve pre-trained embedding vectors.

The method assumes pre-trained word embedding matrix E as well as a graph G that encodes binary word to word similarities—nodes in the graph are words, and words are similar if they are connected by an edge. Note that the graph representation is very general, and a list of word pairs that are considered similar easily fits within the framework. The method works by solving an optimization problems that searches for a new word embeddings matrix $\hat{E}$ whose rows are close both to the corresponding rows in E but also to the rows corresponding to their neighbors in the graph G. Concretely, the optimization objective is:

$$
\underset{\hat{\mathbb{E}}}{\operatorname{argmin}} \sum_{i = 1}^{n} \left(\alpha_{i} \| \hat{\mathbb{E}}_{[w_{i}]} - \mathbb{E}_{[w_{i}]} \|^{2} + \sum_{(w_{i}, w_{j}) \in \mathcal{G}} \beta_{ij} \| \hat{\mathbb{E}}_{[w_{i}]} - \hat{\mathbb{E}}_{[w_{j}]} \|^{2}\right),\tag{11.7}
$$

where $\alpha_{i}$ and $\beta_{ij}$ reflect the importance of a word being similar to itself or to another word. In practice, $\alpha_{i}$ are typically set uniformly to 1, while $\beta_{ij}$ is set to the inverse of the degree of $w_{i}$ in the graph (if a word has many neighbors, it has smaller influence on each of them). The approach works quite well in practice.

A related problem is when one has two embedding matrices: one with a small vocabulary $E^{S} \in R^{|V_{S}| \times d_{emb}}$ and another one with a large vocabulary $E^{L} \in R^{|V_{L}| \times d_{emb}}$ that were trained separately, and are hence incompatible. Perhaps the smaller vocabulary matrix was trained using a more expensive algorithm (possibly as part of a larger and more complex network), and the larger one was downloaded from the web. There is some overlap in the vocabularies, and one is interested in using word vectors from the larger matrix $E^{L}$ for representing words that are not available in the smaller one $E^{S}$ . One can then bridge the gap between the two embedding spaces using a linear projection $^{9}$ [Kiros et al., 2015, Mikolov et al., 2013]. The training objective is searching for a good projection matrix $M \in R^{d_{emb} \times d_{emb}}$ that will map rows in $E^{L}$ such that they are close to corresponding rows in $E^{S}$ by solving the following optimization problem:

$$
\underset{\boldsymbol{M}}{\operatorname{argmin}} \sum_{w \in V_{S} \cap V_{L}} \| \mathbb{E}_{[w]}^{\mathrm{L}} \cdot \boldsymbol{M} - \mathbb{E}_{[w]}^{\mathrm{S}} \|.\tag{11.8}
$$

The learned matrix can then be used to project also the rows of $E^{L}$ that do not have corresponding rows in $E^{S}$ . This approach was successfully used by Kiros et al. [2015] to increase the vocabulary size of an LSTM-based sentence encoder (the sentence encoding model of Kiros et al. [2015] is discussed in Section 17.3).

Another cute (if somewhat less robust) application of the projection approach was taken by Mikolov et al. [2013] who learned matrices to project between embedding vectors trained on language A (say English) to embedding vectors trained on language B (say Spanish) based on a seed list of known word-word translation between the languages.

## 11.9 PRACTICALITIES AND PITFALLS

While off-the-shelf, pre-trained word embeddings can be downloaded and used, it is advised to not just blindly download word embeddings and treat them as a black box. Choices such as the source of the training corpus (but not necessarily its size: larger is not always better, and a smaller but cleaner, or smaller but more domain-focused corpora, are often more effective for a given use case), the contexts that were used for defining the distributional similarities, and many hyperparameters of the learning can greatly influence the results. In presence of an annotated test set for the similarity task one cares about, it is best to experiment with several setting and choose the setup that works best on a development set. For discussion on the possible hyper-parameters and how they may affect the resulting similarities, see the work of Levy et al. [2015].

When using off-the-shelf embedding vectors, it is better to use the same tokenization and text normalization schemes that were used when deriving the corpus.

Finally, the similarities induced by word vectors are based on distributional signals, and therefore susceptible to all the limitations of distributional similarity methods described in Section 10.7. One should be aware of these limitations when using word vectors.


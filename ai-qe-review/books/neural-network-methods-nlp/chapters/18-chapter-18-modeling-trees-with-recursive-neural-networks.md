---
title: "Chapter 18 \u2014 Modeling Trees with Recursive Neural Networks"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 18
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 4093
source_line_end: 4178
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 2
source_empty_image_alt: 2
non_semantic_image_alt: 1
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

# Chapter 18 — Modeling Trees with Recursive Neural Networks

> [[../README|本书目录]] · [[17-chapter-17-conditioned-generation|上一章]] · [[19-chapter-19-structured-output-prediction|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 4093–4178。
> - 本章保留 2 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Modeling Trees with Recursive Neural Networks

The RNN is very useful for modeling sequences. In language processing, it is often natural and desirable to work with tree structures. The trees can be syntactic trees, discourse trees, or even trees representing the sentiment expressed by various parts of a sentence [Socher et al., 2013b]. We may want to predict values based on specific tree nodes, predict values based on the root nodes, or assign a quality score to a complete tree or part of a tree. In other cases, we may not care about the tree structure directly but rather reason about spans in the sentence. In such cases, the tree is merely used as a backbone structure which helps guide the encoding process of the sequence into a fixed size vector.

The recursive neural network abstraction (RecNN) [Pollack, 1990], popularized in NLP by Richard Socher and colleagues [Socher, 2014, Socher et al., 2010, 2011, 2013a] is a generalization of the RNN from sequences to (binary) trees. $^{1}$

Much like the RNN encodes each sentence prefix as a state vector, the RecNN encodes each tree-node as a state vector in $\mathbb{R}^{d}$ . We can then use these state vectors either to predict values of the corresponding nodes, assign quality values to each node, or as a semantic representation of the spans rooted at the nodes.

The main intuition behind the recursive neural networks is that each subtree is represented as a $d$ -dimensional vector, and the representation of a node $p$ with children $c_{1}$ and $c_{2}$ is a function of the representation of the nodes: $\text{vec}(p) = f(\text{vec}(c_1), \text{vec}(c_2))$ , where $f$ is a composition function taking two $d$ -dimensional vectors and returning a single $d$ -dimensional vector. Much like the RNN state $s_i$ is used to encode the entire sequence $x_{1:i}$ , the RecNN state associated with a tree node $p$ encodes the entire subtree rooted at $p$ . See Figure 18.1 for an illustration.

## 18.1 FORMAL DEFINITION

Consider a binary parse tree T over an n-word sentence. As a reminder, an ordered, unlabeled tree over a string $x_{1},\ldots,x_{n}$ can be represented as a unique set of triplets $(i,k,j)$ , s.t. $i\leq k\leq j$ . Each such triplet indicates that a node spanning words $x_{i:j}$ is parent of the nodes spanning $x_{i:k}$ and $x_{k+1:j}$ . Triplets of the form $(i,i,i)$ correspond to terminal symbols at the tree leaves (the words $x_{i}$ ). Moving from the unlabeled case to the labeled one, we can represent a tree as a set of

![Figure 18.1](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/fe7ea29465d1664721eaa9a4e02f53ea2fdb22be1129ad235b784201d0fef340.jpg)  
Figure 18.1: Illustration of a recursive neural network. The representations of V and NP $_{1}$ are combined to form the representation of VP. The representations of VP and NP $_{2}$ are then combined to form the representation of S.

6-tuples $(A \rightarrow B, C, i, k, j)$ , whereas i, k, and j indicate the spans as before, and A, B, and C are the node labels of the nodes spanning $x_{i:j}$ , $x_{i:k}$ , and $x_{k+1:j}$ , respectively. Here, leaf nodes have the form $(A \rightarrow A, A, i, i, i)$ , where A is a pre-terminal symbol. We refer to such tuples as production rules. For an example, consider the syntactic tree for the sentence “the boy saw her duck.”

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/357c177f62407d8eb18054db01bdee4c1b0c3286c50df336b4364aa1b7470e74.jpg)  
Its corresponding unlabeled and labeled representations are as shown in Table 18.1.

Table 18.1: Unlabeled and labeled representations

<table><tr><td>Unlabeled</td><td>Labeled</td><td>Corresponding Span</td></tr><tr><td>(1,1,1)</td><td>(Det, Det, Det, 1, 1, 1)</td><td>x1:1 the</td></tr><tr><td>(2.2.2)</td><td>(Nound, Noun, Noun, 2, 2, 2)</td><td>x2:2 boy</td></tr><tr><td>(3,3,3)</td><td>(Verb, Verb, Verb, 3, 3, 3)</td><td>x3:3 saw</td></tr><tr><td>(4, 4, 4)</td><td>(Det, Det, Det, 4, 4, 4)</td><td>x4:4 her</td></tr><tr><td>(5, 5, 5)</td><td>(Noun, Noun, Noun, 5, 5, 5)</td><td>x5:5 duck</td></tr><tr><td>(4, 4, 5)</td><td>(NP, Det, Noun, 4, 4, 5)</td><td>x4:5 her duck</td></tr><tr><td>(3, 3, 5)</td><td>(VP, Verb, NP, 3, 3, 5)</td><td>x3:5 saw her duck</td></tr><tr><td>(1, 1, 2)</td><td>(NP, Det, Nound, 1, 1, 2)</td><td>x1:2 the boy</td></tr><tr><td>(1, 2, 5)</td><td>(S, NP, VP, 1 2, 5)</td><td>x1:5 the boy saw her duck</td></tr></table>

The set of production rules above can be uniquely converted to a set of tree nodes $q_{i:j}^{A}$ (indicating a node with symbol A over the span $x_{i:j}$ ) by simply ignoring the elements $(B, C, k)$ in each production rule. We are now in position to define the recursive neural network.

A recursive neural network (RecNN) is a function that takes as input a parse tree over an n-word sentence $x_{1}, \ldots, x_{n}$ . Each of the sentence's words is represented as a d-dimensional vector $x_{i}$ , and the tree is represented as a set T of production rules $(A \to B, C, i, j, k)$ . Denote the nodes of T by $q_{i:j}^{A}$ . The RecNN returns as output a corresponding set of inside state vectors $s_{i:j}^{A}$ , where each inside state vector $s_{i:j}^{A} \in \mathbb{R}^{d}$ represents the corresponding tree node $q_{i:j}^{A}$ , and encodes the entire structure rooted at that node. Like the sequence RNN, the tree-shaped RecNN is defined recursively using a function R, where the inside vector of a given node is defined as a function of the inside vectors of its direct children. $^{2}$ Formally:

$$
\begin{array}{rl} \mathrm{RecNN}(x_{1}, \ldots, x_{n}, \mathcal{T}) = & \{s_{i: j}^{A} \in \mathbb{R}^{d} \mid q_{i: j}^{A} \in \mathcal{T}\} \\ s_{i: i}^{A} = & v(x_{i}) \\ s_{i: j}^{A} = & R(A, B, C, s_{i: k}^{B}, s_{k + 1: j}^{C}) \quad q_{i: k}^{B} \in \mathcal{T}, q_{k + 1: j}^{C} \in \mathcal{T}.\end{array}\tag{18.1}
$$

The function R usually takes the form of a simple linear transformation, which may or may not be followed by a nonlinear activation function g:

$$
R(A, B, C, s_{i: k}^{B}, s_{k + 1: j}^{C}) = g([s_{i: k}^{B}; s_{k + 1: j}^{C}] W).\tag{18.2}
$$

## 218 18. MODELING TREES WITH RECURSIVE NEURAL NETWORKS

This formulation of R ignores the tree labels, using the same matrix $W \in R^{2d \times d}$ for all combinations. This may be a useful formulation in case the node labels do not exist (e.g., when the tree does not represent a syntactic structure with clearly defined labels) or when they are unreliable. However, if the labels are available, it is generally useful to include them in the composition function. One approach would be to introduce label embeddings $v(A)$ mapping each non-terminal symbol to a $d_{nt}$ dimensional vector, and change R to include the embedded symbols in the combination function:

$$
R(A, B, C, s_{i: k}^{\boldsymbol{B}}, s_{k + 1: j}^{\boldsymbol{C}}) = g([s_{i: k}^{\boldsymbol{B}}; s_{k + 1: j}^{\boldsymbol{C}}; v(A); v(B)] \boldsymbol{W})\tag{18.3}
$$

(here, $W \in R^{2d+2d_{nt} \times d}$ ). Such approach is taken by Qian et al. [2015]. An alternative approach, due to Socher et al. [2013a] is to untie the weights according to the non-terminals, using a different composition matrix for each B, C pair of symbols: $^{3}$

$$
R(A, B, C, s_{i: k}^{B}, s_{k + 1: j}^{C}) = g([s_{i: k}^{B}; s_{k + 1: j}^{C}] W^{BC}).\tag{18.4}
$$

This formulation is useful when the number of non-terminal symbols (or the number of possible symbol combinations) is relatively small, as is usually the case with phrase-structure parse trees. A similar model was also used by Hashimoto et al. [2013] to encode subtrees in semantic-relation classification task.

## 18.2 EXTENSIONS AND VARIATIONS

As all of the definitions of R above suffer from the vanishing gradients problem of the Simple RNN, several authors sought to replace it with functions inspired by the LSTM gated architecture, resulting in Tree-shaped LSTMs [Tai et al., 2015, Zhu et al., 2015b]. The question of optimal tree representation is still very much an open research question, and the vast space of possible combination functions R is yet to be explored. Other proposed variants on tree-structured RNNs includes a recursive matrix-vector model [Socher et al., 2012] and recursive neural tensor network [Socher et al., 2013b]. In the first variant, each word is represented as a combination of a vector and a matrix, where the vector defines the word's static semantic content as before, while the matrix acts as a learned "operator" for the word, allowing more subtle semantic compositions than the addition and weighted averaging implied by the concatenation followed by linear transformation function. In the second variant, words are associated with vectors as usual, but the composition function becomes more expressive by basing it on tensor instead of matrix operations.

In our own work [Kiperwasser and Goldberg, 2016a], we propose a tree encoder that is not restricted to binary trees but instead can work with arbitrary branching trees. The encoding is based on RNNs (specifically LSTMs), where each subtree encoding is recursively defined as the merging of two RNN states, one running over the encodings of the left subtrees (from left to (right) and ending in the root node, and the other running over the encodings of the right subtrees (from right to left), and ending in the root node.

## 18.3 TRAINING RECURSIVE NEURAL NETWORKS

The training procedure for a recursive neural network follows the same recipe as training other forms of networks: define a loss, spell out the computation graph, compute gradients using backpropagation, $^{4}$ and train the parameters using SGD.

With regard to the loss function, similar to the sequence RNN one can associate a loss either with the root of the tree, with any given node, or with a set of nodes, in which case the individual node's losses are combined, usually by summation. The loss function is based on the labeled training data which associates a label or other quantity with different tree nodes.

Additionally, one can treat the RecNN as an Encoder, whereas the inside-vector associated with a node is taken to be an encoding of the tree rooted at that node. The encoding can potentially be sensitive to arbitrary properties of the structure. The vector is then passed as input to another network.

For further discussion on recursive neural networks and their use in natural language tasks, refer to the Ph.D. thesis of Socher [2014].

## 18.4 A SIMPLE ALTERNATIVE-LINEARIZED TREES

The RecNN abstraction provides a flexible mechanism for encoding trees as vectors, using a recursive, compositional approach. The RecNN encodes not only the given tree, but also all of its subtrees. If this recursiveness of the encoding is not needed, and all we need is a vector representation of an entire tree, that is sensitive to the tree structure, simpler alternatives may work well. In particular, linearizing trees into linear sequence that is then fed into a gated RNN acceptor (or a biRNN encoder) has proven to be very effective in several works [Choe and Charniak, 2016, Luong et al., 2016, Vinyals et al., 2014]. Concretely, the tree for the sentence the boy saw her duck, presented above, will be translated into the linear string:

(S (NP (Det the Det) (Noun boy Noun) NP) (VP (Verb saw Verb) (NP (Det her Det) (Noun duck Noun) NP) VP) S)

which will then be fed into a gated RNN such as an LSTM. The final state of the RNN can then be used as the vector representation of the tree. Alternatively, the tree structure can be scored by training an RNN language model over such linearized parse-trees, and taking the language-model probability of the linearized parse tree to stand for its quality.

## 18. MODELING TREES WITH RECURSIVE NEURAL NETWORKS

## 18.5 OUTLOOK

The concept of recursive, tree-structured networks is powerful, intriguing, and seems very suited for dealing with the recursive nature of language. However, as of the end of 2016, it is safe to say that they don't yet show any real and consistent benefits over simpler architectures. Indeed, in many cases sequence-level models such as RNNs capture the desired regularities just as well. Either we have not yet found the killer-application for tree-structured networks, or we have not yet found the correct architecture or training regimes. Some comparison and analysis of the use of tree-structured vs. sequence-structured networks for language tasks can be found in the work of Li et al. [2015]. As it stands, the use of tree-structured networks for processing language data is still an open research area. Finding the killer-app for such networks, providing better training regimes, or showing that tree-like architectures are not needed are all exciting research directions.


---
title: "Chapter 19 \u2014 Structured Output Prediction"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 19
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 4179
source_line_end: 4532
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

# Chapter 19 — Structured Output Prediction

> [[../README|本书目录]] · [[18-chapter-18-modeling-trees-with-recursive-neural-networks|上一章]] · [[20-chapter-20-cascaded-multi-task-and-semi-supervised-learning|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 4179–4532。
> - 本章保留 0 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## Structured Output Prediction

Many problems in NLP involve structured outputs: cases where the desired output is not a class label or distribution over class labels, but a structured object such as a sequence, a tree, or a graph. Canonical examples are sequence tagging (e.g., part-of-speech tagging) sequence segmentation (chunking, NER), syntactic parsing, and machine translation. In this chapter, we discuss the application of neural network models for structured tasks.

## 19.1 SEARCH-BASED STRUCTURED PREDICTION

The common approach to structured data prediction is search based. For in-depth discussion of search-based structure prediction in pre-deep-learning NLP, see the book by Smith [2011]. The techniques can easily be adapted to use a neural network. In the neural networks literature, such models were discussed under the framework of energy-based learning [LeCun et al., 2006, Section 7]. They are presented here using setup and terminology familiar to the NLP community.

Search-based structured prediction is formulated as a search problem over possible structures:

$$
\operatorname{predict}(x) = \underset{y \in \mathcal{Y}(x)}{\operatorname{argmax}} \operatorname{score}_{\text{global}}(x, y),\tag{19.1}
$$

where x is an input structure, y is an output over x (in a typical example x is a sentence and y is a tag-assignment or a parse-tree over the sentence), $\mathcal{Y}(x)$ is the set of all valid structures over x, and we are looking for an output y that will maximize the score of the x, y pair.

## 19.1.1 STRUCTURED PREDICTION WITH LINEAR MODELS

In the rich literature on structure prediction with linear and log-linear models, the scoring function is modeled as a linear function:

$$
\operatorname{score}_{\text{global}}(x, y) = \boldsymbol{w} \cdot \Phi(x, y),\tag{19.2}
$$

where $\Phi$ is a feature extraction function and w is a weight vector.

In order to make the search for the optimal y tractable, the structure y is decomposed into parts, and the feature function is defined in terms of the parts, where $\phi(p)$ is a part-local feature extraction function:

$$
\Phi(x, y) = \sum_{p \in \text{parts}(x, y)} \phi(p).\tag{19.3}
$$

## 222 19. STRUCTURED OUTPUT PREDICTION

Each part is scored separately, and the structure score is the sum of the component parts scores:

$$
\operatorname{score}_{\text{global}}(x, y) = \boldsymbol{w} \cdot \Phi(x, y) = \boldsymbol{w} \cdot \sum_{p \in y} \phi(p) = \sum_{p \in y} \boldsymbol{w} \cdot \phi(p) = \sum_{p \in y} \operatorname{score}_{\text{local}}(p),\tag{19.4}
$$

where $p \in y$ is a shorthand for $p \in \text{parts}(x, y)$ . The decomposition of y into parts is such that there exists an inference algorithm that allows for efficient search for the best scoring structure given the scores of the individual parts.

## 19.1.2 NONLINEAR STRUCTURED PREDICTION

One can now trivially replace the linear scoring function over parts with a neural network:

$$
\operatorname{score}_{\text{global}}(x, y) = \sum_{p \in y} \operatorname{score}_{\text{local}}(p) = \sum_{p \in y} \operatorname{NN}(\phi(p)),\tag{19.5}
$$

where $\phi(p)$ maps the part p into a $d_{in}$ dimensional vector.

In case of a one hidden-layer feed-forward network:

$$
\operatorname{score}_{\text{global}}(x, y) = \sum_{p \in y} \mathrm{MLP}_{1}(\phi(p)) = \sum_{p \in y}(g(\phi(p) W^{1} + b^{1})) w\tag{19.6}
$$

$\phi(p) \in \mathbb{R}^{d_{\mathrm{in}}}$ , $W^{\mathbf{1}} \in \mathbb{R}^{d_{\mathrm{in}} \times d_1}$ , $b^{\mathbf{1}} \in \mathbb{R}^{d_1}$ , $w \in \mathbb{R}^{d_1}$ . A common objective in structured prediction is making the gold structure $y$ score higher than any other structure $y'$ , leading to the following (generalized perceptron [Collins, 2002]) loss:

$$
\max_{y^{\prime}} \operatorname{score}_{\text{global}}(x, y^{\prime}) - \operatorname{score}_{\text{global}}(x, y).\tag{19.7}
$$

The maximization is performed using a dedicated search algorithm, which is often based on dynamic programming or a similar search technique.

In terms of implementation, this means: create a computation graph $CG_{p}$ for each of the possible parts, and calculate its score. Then, run inference (i.e., search) to find the best scoring structure $y'$ according to the scores of its parts. Connect the output nodes of the computation graphs corresponding to parts in the gold (predicted) structure $y(y')$ into a summing node $CG_{y}(CG_{y}')$ . Connect $CG_{y}$ and $CG_{y}'$ using a “minus” node, $CG_{l}$ , and compute the gradients.

As argued in LeCun et al. [2006, Section 5], the generalized perceptron loss may not be a good loss function when training structured prediction neural networks as it does not have a margin, and a margin-based hinge loss is preferred:

$$
\max(0, m + \max_{y^{\prime} \neq y} \operatorname{score}_{\text{global}}(x, y^{\prime}) - \operatorname{score}_{\text{global}}(x, y)).\tag{19.8}
$$

It is trivial to modify the implementation above to work with the hinge loss.

Note that in both cases we lose the nice properties of the linear model. In particular, the model is no longer convex. This is to be expected, as even the simplest nonlinear neural network is already non-convex. Nonetheless, we could still use standard neural network optimization techniques to train the structured model.

Training and inference is slower, as we have to evaluate the neural network (and take gradients) once for each part, a total of $|\text{parts}(x,y)|$ times.

Cost Augmented Training Structured prediction is a vast field, and this book does not attempt to cover it fully. For the most part, the loss functions, regularizers and methods described in, e.g., Smith [2011], are easily transferable to the neural network framework, although losing convexity and many of the associated theoretical guarantees. One technique that is worth mentioning specifically is cost augmented training, also called loss augmented inference. While it brings modest gains when used in linear structured prediction, my research group found it essential to successfully training neural network-based structured-prediction models using the generalized perceptron or the margin based losses, especially when using strong feature extractors such as RNNs.

The maximization term in Equations (19.7) and (19.8) is looking for a structure $y'$ that receives a high score according to the current model, and is also wrong. Then the loss reflects the difference in scores between $y'$ and the gold structure y. Once the model is sufficiently well trained, the incorrect structure $y'$ and the correct one y are likely to be similar to each other (because the model learned to assign high scores to structures that are reasonably good). Recall that the global score function is in fact composed of a sum of local part scores. Parts that appear in both scoring terms (of $y'$ and of y) will cancel each other out, and will result in gradients of 0 for the associated network parameters. If y and $y'$ are similar to each other, then most parts will overlap and cancel out this way, leading to an overall very small update for the example.

The idea behind cost-augmented training is to change the maximization to find structures $y'$ that score well under the model and are also relatively wrong in the sense that they have many incorrect parts. Formally, the hinge objective changes to:

$$
\max \left(0, m + \max_{y^{\prime} \neq y} \left(\operatorname{score}_{\text{global}}(x, y^{\prime}) + \rho \Delta(y, y^{\prime})\right) - \operatorname{score}_{\text{global}}(x, y)\right),\tag{19.9}
$$

where $\rho$ is a scalar hyperparameter indicating the relative importance of $\Delta$ vs. the model score, and $\Delta(y, y')$ is a function counting the number of incorrect parts in $y'$ with respect to y:

$$
\Delta(y, y^{\prime}) = | \{p: p \in y^{\prime}, p \not \in y\} |.\tag{19.10}
$$

Practically, the new maximization can be implemented by increasing the local score of each incorrect part by $\rho$ before calling the maximization procedure.

The use of cost augmented inference surfaces highly incorrect examples and result in more loss terms that do not cancel out, causing more effective gradient updates.

## 224 19. STRUCTURED OUTPUT PREDICTION

## 19.1.3 PROBABILISTIC OBJECTIVE (CRF)

The error-based and margin-based losses above attempt to score the correct structure above incorrect ones, but does not tell anything about the ordering of the structures below the highest scoring one, or the score distances between them.

In contrast, a discriminative probabilistic loss attempts to assign a probability to each possible structure given the input, such that the probability of the correct structure is maximized. The probabilistic losses are concerned with the scores of all possible structures, not just the highest scoring one.

In a probabilistic framework (also known as conditional random fields, or CRF), each of the parts scores is treated as a clique potential (see Lafferty et al. [2001], Smith [2011]) and the score of each structure y is defined to be:

$$
\begin{array}{l} \text{score}_{\text{CRF}}(x, y) = P(y | x) = \frac{e^{\text{score}_{\text{global}}(x, y)}}{\sum_{y^{\prime} \in \mathcal{Y}(x)} e^{\text{score}_{\text{global}}(x, y^{\prime})}} \\ = \frac{\exp(\sum_{p \in y} \text{score}_{\text{local}}(p))}{\sum_{y^{\prime} \in \mathcal{Y}(x)} \exp(\sum_{p \in y^{\prime}} \text{score}_{\text{local}}(p))} \\ = \frac{\exp(\sum_{p \in y} \text{NN}(\phi(p)))}{\sum_{y^{\prime} \in \mathcal{Y}(x)} \exp(\sum_{p \in y^{\prime}} \text{NN}(\phi(p)))}.\end{array}\tag{19.11}
$$

The scoring function defines a conditional distribution $P(y|x)$ , and we wish to set the parameters of the network such that corpus conditional log likelihood $\sum_{(x_{i},y_{i})\in\text{training}}\log P(y_{i}|x_{i})$ is maximized.

The loss for a given training example $(x, y)$ is then:

$$
L_{\mathrm{CRF}}(y^{\prime}, y) = - \log \operatorname{score}_{\mathrm{CRF}}(x, y).\tag{19.12}
$$

That is, the loss is related to the distance of the probability of the correct structure from 1. The CRF loss can be seen as an extension of the hard-classification cross-entropy loss to the structured case.

Taking the gradient with respect to the loss in Equation (19.12) is as involved as building the associated computation graph. The tricky part is the denominator (the partition function) which requires summing over the potentially exponentially many structures in Y. However, for some problems, a dynamic programming algorithm exists for efficiently solving the summation in polynomial time (i.e., the forward-backward viterbi recurrences for sequences and the CKY inside-outside recurrences for tree structures). When such an algorithm exists, it can be adapted to also create a polynomial-size computation graph.

## 19.1.4 APPROXIMATE SEARCH

Sometimes, efficient search algorithms for the prediction problem are not available. We may not have an efficient way of finding the best scoring structure (solving the maximization) in Equations (19.7), (19.8), or (19.9), or not have an efficient algorithm for computing the partition function (denominator) in Equation (19.11). In such cases, one can resort to approximate inference algorithms, such as beam search. When using beam search, the maximization and summation are with respect to the items in the beam. For example, one may use beam search for looking for a structure with an approximately high score, and for the partition function sum over the structures remaining in the beam instead of over the exponentially large $\mathcal{Y}(x)$ . A related technique when working with inexact search is early-update: instead of computing the loss over complete structures, compute it over partial structures as soon as the gold items falls off the beam. For an analysis of the early update techniques and alternative loss-computation and update strategies when learning under approximate search, see Huang et al. [2012].

## 19.1.5 RERANKING

When searching over all possible structures is intractable, inefficient, or hard to integrate into a model, another alternative to beam search is the use of reranking. In the reranking framework [Charniak and Johnson, 2005, Collins and Koo, 2005] a base model is used to produce a list of the $k$ -best scoring structures. A more complex model is then trained to score the candidates in the $k$ -best list such that the best structure with respect to the gold one is scored highest. As the search is now performed over $k$ items rather than over an exponential space, the complex model can condition on (extract features from) arbitrary aspects of the scored structure. The base model that is used for predicting the $k$ -best structures can be based on a simpler model, with stronger independence assumptions, which can produce reasonable, but not great, results. Reranking methods are natural candidates for structured prediction using neural network models, as they allow the modeler to focus on the feature extraction and network structure, while removing the need to integrate the neural network scoring into a decoder. Indeed, reranking methods are often used for experimenting with neural models that are not straightforward to integrate into a decoder, such as convolutional, recurrent, and recursive networks. Works using the reranking approach include Auli et al. [2013], Le and Zuidema [2014], Schwenk et al. [2006], Socher et al. [2013a], Zhu et al. [2015a], and Choe and Charniak [2016].

## 19.1.6 SEE ALSO

Beyond the examples in Section 19.4, sequence-level CRFs with neural network clique potentials are discussed in Peng et al. [2009] and Do et al. [2010], where they are applied to sequence labeling of biological data, OCR data, and speech signals, and by Wang and Manning [2013] who apply them on traditional natural language tagging tasks (chunking and NER). Similar sequence tagging architecture is also described in Collobert and Weston [2008], Collobert et al. [2011]. A hinge-based approach was used by Pei et al. [2015] for arc-factored dependency parsing with a manually defined feature extractor, and by Kiperwasser and Goldberg [2016b] using a biLSTM feature extractor. The probabilistic approach was used by Durrett and Klein [2015] for a CRF constituency parser. The approximate beam-based partition function (approximate CRF) was ef-

## 226 19. STRUCTURED OUTPUT PREDICTION

fectively used by Zhou et al. [2015] in a transition-based parser, and later by Andor et al. [2016] for various tasks.

## 19.2 GREEDY STRUCTURED PREDICTION

In contrast to the search-based structured prediction approaches, there are greedy approaches that decompose the structured problem into a sequence of local prediction problems and training a classifier to perform each local decision well. At test time, the trained classifier is used in a greedy manner. Examples of this approach are left-to-right tagging models [Giménez and Márquez, 2004] and greedy transition-based parsing [Nivre, 2008]. $^{1}$ Because they do not assume search, greedy approaches are not restricted in the kind of features that are available to them, and can use rich conditioning structures. This make greedy approaches quite competitive in terms of prediction accuracies for many problems.

However, the greedy approaches are heuristic by definition, and have the potential of suffering from error-propagation: prediction errors that are made early in the sequence cannot be fixed, and can propagate into larger errors later on. The problem is especially severe when using a method with a limited horizon into the sentence, such as common with window-based feature extractors. Such methods process the sentence tokens in a fixed order, and only see a local window around the prediction point. They have no way of knowing what the future of the sequence hold, and are likely to be misled by the local context into incorrect decisions.

Fortunately, the use of RNNs (and especially biRNNs) mitigate the effect considerably. A feature extractor which is based on a biRNN can essentially see through the end of the input, and be trained to extract useful information from arbitrarily far sequence positions. This ability turn greedy local models that are trained with biRNN extractor into greedy global models: each decision can condition on the entire sentence, making the process less susceptible to being “surprised” later on by an unexpected output. As each prediction can become more accurate, the overall accuracy grows considerably.

Indeed, works in syntactic parsing show that greedy prediction models that are trained with global biRNN feature extractors rival the accuracy of search-based methods that combine global search with local feature extractors [Cross and Huang, 2016a, Dyer et al., 2015, Kiperwasser and Goldberg, 2016b, Lewis et al., 2016, Vaswani et al., 2016].

In addition to global feature extractors, the greedy methods can benefit from training techniques that aim to mitigate the error propagation problem by either attempting to take easier predictions before harder ones (the easy-first approach [Goldberg and Elhadad, 2010]) or making training conditions more similar to testing conditions by exposing the training procedure to inputs that result from likely mistakes [Hal Daumé II et al., 2009, Goldberg and Nivre, 2013]. These are effective also for training greedy neural network models, as demonstrated by Ma et al.

[2014] (easy-first tagger) and Ballesteiros et al. [2016], Kiperwasser and Goldberg [2016b] (dynamic oracle training for greedy dependency parsing).

## 19.3 CONDITIONAL GENERATION AS STRUCTURED OUTPUT PREDICTION

Finally, RNN generators, especially in the conditioned generator setup (Chapter 17), can also be seen as an instance of structured-prediction. The series of predictions made by the generator produces a structured output $\hat{t}_{1:n}$ . Each individual prediction has an associated score (or probability) $score(\hat{t}_i \mid \hat{t}_{1:i-1})$ and we are interested in output sequence with maximal score (or maximal probability), i.e., such that $\sum_{i=1}^{n} score(\hat{t}_i \mid \hat{t}_{1:i-1})$ is maximized. Unfortunately, the non-markovian nature of the RNN means that the scoring function cannot be decomposed into factors that allow for exact search using standard dynamic programming techniques, and approximate search must be used.

One popular approximate technique is using greedy prediction, taking the highest scoring item at each stage. While this approach is often effective, it is obviously non-optimal. Indeed, using beam search as an approximate search often works far better than the greedy approach.

At this stage, it is important to consider how conditioned generators are trained. As described in Section 17.1.1, generators are trained using a teacher-forcing technique: they are trained using a probabilistic objective that attempts to assign high probability mass to gold observed sequences. Given a gold sequence $t_{1:n}$ , at each stage $i$ the model is trained to assign a high probability mass to the gold event $\hat{t}_i = t_i$ conditioned on the gold history $t_{1:i-1}$ .

There are two shortcomings with this approach: first, it is based on the gold history $t_{1:i-1}$ while in practice the generator will be tasked with assigning scores based on its predicted history $\hat{t}_{1:i-1}$ . Second, it is a locally normalized model: the model assigns a probability distribution over each event, and thus susceptible to the label bias problem, $^{2}$ which can hurt the quality of solutions returned by beam search. Both of these problems were tackled in the NLP and machine-learning communities, but are not yet fully explored in the RNN generation setting.

The first problem can be mitigated using training protocols such SEARN [Hal Daumé III et al., 2009], DAGGER [Ross and Bagnell, 2010, Ross et al., 2011], and exploration-training with dynamic oracles [Goldberg and Nivre, 2013]. Application of these techniques in the context of RNN generators is proposed by Bengio et al. [2015] under the term scheduled sampling.

The second problem can be treated by discarding of the locally normalized objective and moving to global, sequence-level objectives that are more suitable for beam decoding. Such objectives include the beam approximations of the structured hinge loss [Equation (19.8)] and the CRF loss [Equation (19.11)] discussed in Section 19.1.4 above. Wiseman and Rush [2016] discuss global sequence-level scoring objectives for RNN generators.

## 228 19. STRUCTURED OUTPUT PREDICTION

## 19.4 EXAMPLES

## 19.4.1 SEARCH-BASED STRUCTURED PREDICTION: FIRST-ORDER DEPENDENCY PARSING

Consider the dependency-parsing task, described in Section 7.7. The input is an n-words sentence $s = w_{1}, \ldots, w_{n}$ , and we are interested in finding a dependency parse tree y over the sentence (Figure 7.1). A dependency parse tree is a rooted directed tree over the words in the sentence. Every word in the tree is assigned a single parent (its head), that can be either another word in the sentence or special ROOT element. The parent word is called a head and its daughter words are called modifiers.

Dependency parsing fits nicely in the search-based structured prediction framework described in Section 19.1. Specifically, Equation (19.5) states that we should assign scores to trees by decomposing them into parts and scoring each part individually. The parsing literature describes many possible factorizations [Koo and Collins, 2010, Zhang and McDonald, 2012], here we focus on the simplest one, due to McDonald et al. [2005]: the arc-factored decomposition. Each part will be an arc in the tree (i.e., pair of head word $w_h$ and modifier word $w_m$ ). Each arc ( $w_h$ , $w_m$ ) will be scored individually based on a local scoring function that will assess the quality of the attachment. After assigning a score to each of the possible $n^2$ arcs, we can run an inference algorithm such as the Eisner algorithm [Eisner and Satta, 1999, Kübler et al., 2008, McDonald et al., 2005] to find the valid projective tree whose sum of arc scores is maximal.

Equation (19.5) then becomes:

$$
\operatorname{score}_{\text{global}}(x, y) = \sum_{(w_{h}, w_{m}) \in y} \operatorname{score}_{\text{local}}(w_{h}, w_{m}) = \sum_{(w_{h}, w_{m}) \in y} \operatorname{NN}(\phi(h, m, s)),\tag{19.13}
$$

where $\phi(h,m,s)$ is a feature function translating the sentence indices h and m into real-valued vectors. We discussed feature extractors for the parsing task in Sections 7.7 and 8.6 (using manually designed features) and in Section 16.2.3 (using a biRNN feature extractor). Here, assume the feature extractor is given and focus on the training procedure.

Once we decide on a particular form for the NN component (say an MLP, $\mathrm{NN}(\boldsymbol{x}) =(\tanh(\boldsymbol{x}\boldsymbol{U} + \boldsymbol{b})) \cdot \boldsymbol{v}$ ), we can easily compute the score $a_{[h,m]}$ of each possible arch (assuming the index of ROOT is 0):

$$
\begin{array}{ll} a_{[h, m]} =(\tanh(\phi(h, m, s)) \boldsymbol{U} + \boldsymbol{b}) \cdot \boldsymbol{v} & \forall h \in 0, \ldots, n \\ & \forall m \in 1, \ldots, n.\end{array}\tag{19.14}
$$

We then run the Eisner algorithm, resulting in a predicted tree $y'$ with maximal score:

$$
y^{\prime} = \max_{y \in \mathcal{Y}} \sum_{(h, m) \in y} a_{[h, m]} = \operatorname{Eisner}(n, \boldsymbol{a}).
$$

If we were to use cost-augmented inference, we would have used instead the scores $\bar{a}$ :

$$
\bar{a}_{[h, m]} = a_{[h, m]} + \left\{\begin{array}{ll} 0 & \text{if}(h, m) \in y \\ \rho & \text{otherwise.} \end{array} \right.
$$

Once we have the predicted tree $y'$ and gold tree y, we can create a computation graph for the structured hinge loss of the trees, according to:

$$
\max(0, 1 + \underbrace{\sum_{(h^{\prime}, m^{\prime}) \in y^{\prime}} \tanh(\phi(h^{\prime}, m^{\prime}, s)) \boldsymbol{U} + \boldsymbol{b}) \cdot \boldsymbol{v}}_{\max_{y^{\prime} \neq y} \operatorname{score}_{\text{global}}(s, y^{\prime})} - \underbrace{\sum_{(h, m) \in y} \tanh(\phi(h, m, s)) \boldsymbol{U} + \boldsymbol{b}) \cdot \boldsymbol{v}}_{\operatorname{score}_{\text{global}}(s, y)}.\tag{19.15}
$$

We then compute the gradients with respect to the loss using backprop, update the parameters accordingly, and move to the next tree in the training set.

This parsing approach is described in Pei et al. [2015] (using the manually designed feature function from Section 8.6) and Kiperwasser and Goldberg [2016b] (using the biRNN feature extractor from Section 16.2.3).

## 19.4.2 NEURAL-CRF FOR NAMED ENTITY RECOGNITION

Independent Classification Consider the named entity recognition task described in Section 7.5. It is a sequence segmentation task which is often modeled as sequence tagging: each word in the sentence is assigned one of K BIO-tags described in Table 7.1, and the tagging decisions are then deterministically translated into spans. In Section 7.5 we treated NER as a word-in-context classification problem, assuming each tagging decision for each word is performed independently of the others.

Under the independent classification framework, we are given a sentence $s = w_{1}, \ldots, w_{n}$ , and use a feature function $\phi(i, s)$ to create a feature vector representing the word $w_{i}$ in the context of the sentence. Then, a classifier such as an MLP is used to predict a score (or a probability) to each tag:

$$
\hat{t}_{i} = \operatorname{softmax}(\mathrm{MLP}(\phi(i, s))) \quad \forall i \in 1, \dots, n;\tag{19.16}
$$

here, $\hat{t}_{i}$ is a vector of predicted tag scores, and $\hat{t}_{i[k]}$ is the score of tagging word i with tag k. The predicted tagging $\hat{y}_{1},\ldots,\hat{y}_{n}$ for the sentence is then obtained by independently choosing the highest scoring tag for each sentence position:

$$
\hat{y}_{i} = \underset{k}{\operatorname{argmax}} \hat{\boldsymbol{t}}_{\boldsymbol{i}[k]} \quad \forall i \in 1, \dots, n,\tag{19.17}
$$

## 230 19. STRUCTURED OUTPUT PREDICTION

and the score of the assignment $\hat{y} = \hat{y}_{1}, \ldots, \hat{y}_{n}$ is:

$$
\operatorname{score}(s, \hat{y}) = \sum_{i = 1}^{n} t_{i[\hat{y}_{i}]}.\tag{19.18}
$$

Structured Tagging by Coupling Tag-Pair Decisions The independent classification approach may work reasonably well in many cases, but is sub-optimal because neighboring decisions influence each other. Consider a sequence such as Paris Hilton: the first word can be either a location or a person, and the second word can be either an organization or a person, but if we chose one of them to be a person, the second one should be tagged person with certainty. We would like to have the different tagging decisions influence each other, and have this reflected in the score. A common way to do this is by introducing tag-tag factors: compatibility scores for pairs of neighboring tags. Intuitively, a pair such as B-PER I-PER should receive a high score, while a pair B-PER I-ORG should receive a very low, or even negative score. For a tagset of K possible tags, we introduce a scoring matrix $A \in R^{K \times K}$ in which $A_{[g,h]}$ is the compatibility score of the tag sequence g h.

The scoring function for a tagging assignment is updated to take the tagging factors into account:

$$
\operatorname{score}(s, \hat{y}) = \sum_{i = 1}^{n} t_{i[\hat{y}_{i}]} + \sum_{i = 1}^{n + 1} A_{[\hat{y}_{i - 1}, \hat{y}_{i}]},\tag{19.19}
$$

where the tags at locations 0 and $n + 1$ are special \*START\* and \*END\* symbols. Given tagging scores for individual words $t_{1:n}$ and the values in A, one can find the sequence $\hat{y}$ maximizing Equation (19.19) using the Viterbi dynamic-programming algorithm.

As we do not need the tag scores in each position to be positive and sum to one, we remove the softmax when computing the scores $t_{i}$ :

$$
\hat{\boldsymbol{t}}_{i} = \operatorname{MLP}(\phi(i, s)) \quad \forall i \in 1, \dots, n.\tag{19.20}
$$

The tagging scores $t_{i}$ are determined by a neural network according to Equation (19.20), and the matrix A can be considered as additional model parameters. We can now proceed to train a structured model using the structured hinge-loss [Equation (19.8)] or the cost-augmented structured hinge loss [Equation (19.9)].

Instead, we will follow Lample et al. [2016] and use the probabilistic CRF objective.

Structured CRF Training Under the CRF objective, our goal is to assign a probability to each possible tag sequence $y = y_{1}, \ldots, y_{n}$ over a sentence s. This is modeled by taking a softmax over

all the possible taggings:

$$
\begin{array}{l} \text{score}_{\mathrm{CRF}}(s, y) = P(y \mid s) = \frac{e^{\text{score}(s, y)}}{\sum_{y^{\prime} \in \mathcal{Y}(s)} e^{\text{score}(s, y^{\prime})}} \\ = \frac{\exp(\sum_{i = 1}^{n} t_{i[y_{i}]} + \sum_{i = 1}^{n} A_{[y_{i}, y_{i + 1}]})}{\sum_{y^{\prime} \in \mathcal{Y}(s)} \exp(\sum_{i = 1}^{n} t_{i[y_{i}^{\prime}]} + \sum_{i = 1}^{n} A_{[y_{i}^{\prime}, y_{i + 1}^{\prime}]})}.\end{array}\tag{19.21}
$$

The denominator is the same for all possible taggings y, so finding the best sequence (without its probability) amounts to finding the sequence that maximizes score(s, y), and can be done using Viterbi as above.

The loss is then defined as the negative log likelihood of the correct structure y:

$$
\begin{array}{l} - \log P(y | s) = - \left(\sum_{i = 1}^{n + 1} t_{i[y_{i}]} + \sum_{i = 1}^{n + 1} A_{[y_{i - 1}, y_{i}]}\right) + \log \sum_{\mathcal{Y}^{\prime} \in \mathcal{Y}(s)} \exp \left(\sum_{i = 1}^{n + 1} t_{i[y_{i}^{\prime}]} + \sum_{i = 1}^{n + 1} A_{[y_{i - 1}^{\prime}, y_{i}^{\prime}]}\right) \\ = - \underbrace{\left(\sum_{i = 1}^{n + 1} t_{i[y_{i}]} + \sum_{i = 1}^{n + 1} A_{[y_{i - 1}, y_{i}]}\right)}_{\text{score of gold}} + \underbrace{\bigoplus_{\mathcal{Y}^{\prime} \in \mathcal{Y}(s)} \left(\sum_{i = 1}^{n + 1} t_{i[y_{i}^{\prime}]} + \sum_{i = 1}^{n + 1} A_{[y_{i - 1}^{\prime}, y_{i}^{\prime}]}\right)}_{\text{using dynamic program}}, \end{array}\tag{19.22}
$$

where $\bigoplus$ denotes addition in log-space (logadd) and $\bigoplus(a,b,c,d)=\log(e^{a}+e^{b}+e^{c}+e^{d})$ . The first term can be easily constructed as a computation graph, but the second is a bit less trivial to construct, as it requires summing over the $n^{k}$ different sequences in $\mathcal{Y}(s)$ . Fortunately, it can be solved using a variant of the Viterbi algorithm $^{4}$ which we describe below.

Properties of Log addition The log-add operation performs addition in log-space. It has the following properties that we use in constructing the dynamic program. They are trivial to prove with basic mathematic manipulation, and the reader is encouraged to do so.

$$
\bigoplus(a, b) = \bigoplus(b, a)
$$

Commutativity

$$
\bigoplus(a, \bigoplus(b, c)) = \bigoplus(a, b, c)\tag{19.23}
$$

Associativity

$$
\bigoplus(a + c, b + c) = \bigoplus(a + b) + c\tag{19.24}
$$

Distributivity

(19.25)

## 232 19. STRUCTURED OUTPUT PREDICTION

Denote by $\mathcal{Y}(s,r,k)$ the set of sequences of length $r$ that end with symbol $k$ . The set of all possible sequences over $|s|$ is then $\mathcal{Y}(s) = \mathcal{Y}(s,n + 1,^*\mathrm{END}^*)$ . Further denote by $\mathcal{Y}(s,r,\ell,k)$ the sequences of length $r$ where the last symbol is $k$ and the second to last symbol is $\ell$ . Let $\Gamma[r,k] = \bigoplus_{y' \in \mathcal{Y}(s,r,k)} \sum_{i=1}^{r}(t_i_{[y'_i]} + A_{[y'_{i-1},y'_i]})$ . Our goal is computing $\Gamma[n+1,^*\mathrm{END}^*]$ . As a shorthand, define $f(i,y_{i-1}', y_i') = t_i_{[y'_i]} + A_{[y'_{i-1},y'_i]}$ . We now get:

$$
\Gamma[r, k] = \bigoplus_{y^{\prime} \in \mathcal{Y}(s, r, k)} \sum_{i = 1}^{r} f(i, y_{i - 1}^{\prime}, y_{i}^{\prime})
$$

$$
\begin{array}{l} \Gamma[r + 1, k] = \bigoplus_{\ell} \bigoplus_{y^{\prime} \in \mathcal{Y}(s, r + 1, \ell, k)} \left(\sum_{i = 1}^{r + 1} f(i, y_{i - 1}^{\prime}, y_{i}^{\prime})\right) \\ \qquad = \bigoplus_{\ell} \bigoplus_{y^{\prime} \in \mathcal{Y}(s, r + 1, \ell, k)} \left(\sum_{i = 1}^{r} \left(f(i, y_{i - 1}^{\prime}, y_{i}^{\prime})\right) + f(r + 1, y_{r - 1}^{\prime} = \ell, y_{r}^{\prime} = k)\right) \\ \qquad = \bigoplus_{\ell} \left(\bigoplus_{y^{\prime} \in \mathcal{Y}(s, r + 1, \ell, k)} \left(\sum_{i = 1}^{r} f(i, y_{i - 1}^{\prime}, y_{i}^{\prime})\right) + f(r + 1, y_{r - 1}^{\prime} = \ell, y_{r}^{\prime} = k)\right) \\ \qquad = \bigoplus_{\ell} \left(\Gamma[r, \ell] + f(r + 1, y_{r - 1}^{\prime} = \ell, y_{r}^{\prime} = k)\right) \\ \qquad = \bigoplus_{\ell} \left(\Gamma[r, \ell] + t_{r + 1[k]} + A_{[\ell, k]}\right).\end{array}
$$

We obtained the recurrence:

$$
\Gamma[r + 1, k] = \bigoplus_{\ell} \left(\Gamma[r, l] + t_{r + 1[k]} + A_{[\ell, k]}\right)\tag{19.26}
$$

which we can use to construct the computation graph for computing the denominator, $\Gamma[n+1,*END*]$ .⁵ After building the computation graph, we can compute the gradients using back-propagation.

## 19.4.3 APPROXIMATE NER-CRF WITH BEAM-SEARCH

In the previous section, we transformed the NER prediction into a structured task by coupling the output tags at positions i and i - 1 using a score matrix A assigning a score to each consecutive tag pair. This is akin to using a first-order markov assumption in which the tag in position i is independent of the tags at positions < i - 1 given the tag at i - 1. This independence assumption allowed us to decompose the sequence scoring and derive efficient algorithms for finding the highest scoring sequence as well as the sum over all possible tag sequences.

We may want to relax this markov independence assumption and instead condition the tag $y_{i}$ at all previous tags $y_{1:i-1}$ . This can be incorporated into the tagging model by adding an additional RNN over the tag history. We now score a tag sequence $y = y_{1}, \ldots, y_{n}$ as:

$$
\operatorname{score}(s, \hat{\mathbf{y}}) = \sum_{i = 1}^{n + 1} f([\phi(s, i); \mathrm{RNN}(\hat{\mathbf{y}}_{\mathbf{1}: i})]),\tag{19.27}
$$

where f is a parametric function such as a linear transformation or an MLP, and $\phi$ is a feature function mapping the word as position i in the sentence s to a vector. $^{6}$ In words, we compute the local score of tagging position i with tag k by considering features of sentence position i, as well as an RNN encoding of the tag sequence $y_{1}, y_{2}, y_{i-1}, k$ . We then compute the global score as a sum of local scores.

Unfortunately, the RNN component ties the different local scores over all previous tagging decisions, preventing us from using efficient dynamic programming algorithms for finding the exact best tagging sequence or the sum of all possible tag sequences under the model. Instead, we must resort to approximation such as beam search. Using a beam of size r, we can develop r different tag sequences $\hat{y}^{1},\ldots,\hat{y}^{r}$ . The approximate best tag sequence is then the highest scoring of the r beam sequences:

$$
\underset{i \in 1, \ldots, r}{\text{argmax score}}(s, \hat{y}^{i}).
$$

For training, we can use the approximate CRF objective:

$$
\operatorname{score}_{\text{A p p r o x C r f}}(s, y) = \tilde{P}(\mathbf{y} | s) = \frac{e^{\operatorname{score}(s, \mathbf{y})}}{\sum_{\mathbf{y}^{\prime} \in \tilde{\mathcal{Y}}(s, r)} e^{\operatorname{score}(s, \mathbf{y}^{\prime})}}\tag{19.28}
$$

$$
\begin{array}{rl} L_{\mathrm{CRF}}(y^{\prime}, y) & = - \log \tilde{P}(y | s) \\ & = - \operatorname{score}(s, y) + \log \sum_{y^{\prime} \in \tilde{\mathcal{Y}}(s, r)} e^{\operatorname{score}(s, y^{\prime})} \end{array}\tag{19.29}
$$

$$
\tilde{\mathcal{Y}}(s, r) = \{y^{1}, \dots, y^{r}\} \cup \{y\}.
$$

Instead of normalizing by summing over the entire set of sequences $\mathcal{Y}(s)$ , we sum over $\tilde{\mathcal{Y}}(s, r)$ : the union of the gold sequence and the r beam sequences. r is a small number, making the summation is trivial. As r approaches $n^{K}$ we approach the true CRF objective.


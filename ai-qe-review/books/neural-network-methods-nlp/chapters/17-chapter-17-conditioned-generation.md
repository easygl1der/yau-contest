---
title: "Chapter 17 \u2014 Conditioned Generation"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 17
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 3814
source_line_end: 4092
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 5
source_empty_image_alt: 5
non_semantic_image_alt: 0
caption_derived_image_alt: 5
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

# Chapter 17 — Conditioned Generation

> [[../README|本书目录]] · [[16-chapter-16-modeling-with-recurrent-networks|上一章]] · [[18-chapter-18-modeling-trees-with-recursive-neural-networks|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 3814–4092。
> - 本章保留 5 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Conditioned Generation

As discussed in Chapter 14, RNNs can act as non-markovian language models, conditioning on the entire history. This ability makes them suitable for use as generators (generating natural language sequences) and conditioned generators, in which the generated output is conditioned on a complex input. This chapter discusses these architectures.

## 17.1 RNN GENERATORS

A special case of using the RNN-transducer architecture for language modeling (Section 14.3.3) is sequence generation. Any language model can be used for generation, as described in Section 9.5. For the RNN-transducer, generation works by tying the output of the transducer at time i with its input at time $i + 1$ : after predicting a distribution over the next output symbols $p(t_{i} = k|t_{1:i-1})$ , a token $t_{i}$ is chosen and its corresponding embedding vector is fed as the input to the next step. The process stops when generating a special end-of-sequence symbol, often denoted as </s>. The process is depicted in Figure 17.1.

![Figure 17.1](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/ca952a3af053775bb301bab856579f42e1b6106cfae61850d505c9a07142897a.jpg)  
Figure 17.1: Transducer RNN used as a generator.

Similar to the case of generation from an ngram language model (Section 9.5), when generating from a trained RNN transducer one can either choose the highest probability item at

## 17. CONDITIONED GENERATION

each step, sample an item according to the model's predicted distribution, or use beam-search for finding a globally high-probability output.

An impressive demonstration of the ability of gated RNN to condition on arbitrarily long histories is through a RNN-based language model that is trained on characters rather than on words. When used as a generator, the trained RNN language model is tasked with generating random sentences character by character, each character conditioning on the previous ones [Sutskever et al., 2011]. Working on the character level forces the model to look further back into the sequence in order to connect letters to words and words to sentences, and to form meaningful patterns. The generated texts not only resemble fluent English, but also show sensitivity to properties that are not captured by ngram language models, including line lengths and nested parenthesis balancing. When trained on C source code, the generated sequences adhere to indentation patterns, and the general syntactic constraints the C language. For an interesting demonstration and analysis of the properties of RNN-based character level language models, see Karpathy et al. [2015].

## 17.1.1 TRAINING GENERATORS

When training the generator, the common approach is to simply train it as a transducer that aims to put a large probability mass on the next token in the observed sequence based on the previously observed tokens (i.e., training as a language model).

More concretely, for every n words sentence $w_{1}, \ldots, w_{n}$ in the training corpus, we produce an RNN transducer with $n + 1$ inputs and $n + 1$ corresponding outputs, where the first input is the start-of-sentence symbol, followed by the n words of the sentence. The first expected output is then $w_{1}$ , the second expected output is $w_{2}$ , and so on, and the $n + 1$ th expected output is the end-of-sentence symbol.

This training approach is often called teacher-forcing, as the generator is fed the observed word even if its own prediction put a small probability mass on it, and in test time it would have generated a different word at this state.

While this works, it does not handle well deviations from the gold sequences. Indeed, when applied as a generator, feeding on its own predictions rather than on gold sequences, the generator will be required to assign probabilities given states not observed in training. Searching for a high-probability output sequence using beam-search may also benefit from a dedicated training procedure. As of this writing, coping with these situations is still an open research question, which is beyond the scope of this book. We briefly touch upon this when discussing structured prediction in Chapter 19.3.

## 17.2 CONDITIONED GENERATION (ENCODER-DECODER)

While using the RNN as a generator is a cute exercise for demonstrating its strength, the power of the RNN transducer is really revealed when moving to a conditioned generation framework.

The generation framework generates the next token $t_{j+1}$ based on the previously generated tokens $\hat{t}_{1:j}$ :

$$
\hat{t}_{j + 1} \sim p(t_{j + 1} = k \mid \hat{t}_{1: j}).\tag{17.1}
$$

This is modeled in the RNN framework as:

$$
\begin{array}{c} p(t_{j + 1} = k \mid \hat{t}_{1: j}) = f(\mathrm{RNN}(\hat{t}_{1: j})) \\ \hat{t}_{j} \sim p(t_{j} \mid \hat{t}_{1: j - 1}), \end{array}\tag{17.2}
$$

or, if using the more detailed recursive definition:

$$
\begin{array}{c} p(t_{j + 1} = k \mid \hat{t}_{1: j}) = f(O(s_{j + 1})) \\ s_{j + 1} = R(\hat{t}_{j}, s_{j}) \\ \hat{t}_{j} \sim p(t_{j} \mid \hat{t}_{1: j - 1}), \end{array}\tag{17.3}
$$

where f is a parameterized function that maps the RNN state to a distribution over words, for example $f(\boldsymbol{x}) = \text{softmax}(\boldsymbol{x}\boldsymbol{W} + \boldsymbol{b})$ or $f(\boldsymbol{x}) = \text{softmax}(\text{MLP}(\boldsymbol{x}))$ .

In the conditioned generation framework, the next token is generated based on the previously generated tokens, and an additional conditioning context c.

$$
\hat{t}_{j + 1} \sim p(t_{j + 1} = k \mid \hat{t}_{1: j}, c).\tag{17.4}
$$

When using the RNN framework, the context c is represented as a vector c:

$$
\begin{array}{c} p(t_{j + 1} = k \mid \hat{t}_{1: j}, c) = f(\text{RNN}(v_{1: j})) \\ v_{i} =[\hat{t}_{i}; c] \\ \hat{t}_{j} \sim p(t_{j} \mid \hat{t}_{1: j - 1}, c), \end{array}\tag{17.5}
$$

or, using the recursive definition:

$$
\begin{array}{c} p(t_{j + 1} = k \mid \hat{t}_{1: j}, c) = f(O(s_{j + 1})) \\ s_{j + 1} = R(s_{j},[\hat{t}_{j}; c]) \\ \hat{t}_{j} \sim p(t_{i} \mid \hat{t}_{1: j - 1}, c).\end{array}\tag{17.6}
$$

At each stage of the generation process the context vector c is concatenated to the input $\hat{t}_{j}$ , and the concatenation is fed into the RNN, resulting in the next prediction. Figure 17.2 illustrates the architecture.

![Figure 17.2](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/cdce531676f2b0b4ed0449fb532bf326c4a2f4ee4bd77544b86045c70075ef29.jpg)  
Figure 17.2: Conditioned RNN generator.

What kind of information can be encoded in the context c? Pretty much any data we can put our hands on during training, and that we find useful. For example, if we have a large corpus of news items categorized into different topics, we can treat the topic as a conditioning context. Our language model will then be able to generate texts conditioned on the topic. If we are interested in movie reviews, we can condition the generation on the genre of the movie, the rating of the review, and perhaps the geographic region of the author. We can then control these aspects when generating text. We can also condition on inferred properties, that we automatically extract from the text. For example, we can derive heuristics to tell us if a given sentence is written in first person, if it contains a passive-voice construction, and the level of vocabulary used in it. We can then use these aspects as conditioning context for training, and, later, for text generation.

## 17.2.1 SEQUENCE TO SEQUENCE MODELS

The context c can have many forms. In the previous subsection, we described some fixed-length, set-like examples of conditioning contexts. Another popular approach takes c to be itself a sequence, most commonly a piece of text. This gives rise to the sequence to sequence conditioned generation framework, also called the encoder-decoder framework [Cho et al., 2014a, Sutskever et al., 2014].

In sequence to sequence conditioned generation, we have a source sequence $x_{1:n}$ (for example reflecting a sentence in French) and we are interested in generating a target output sequence $t_{1:m}$ (for example the translation of the sentence into English). This works by encoding the source sentence $x_{1:n}$ into a vector using an encoder function $c = \text{ENC}(x_{1:n})$ , commonly an RNN: $c = \text{RNN}^{\text{enc}}(x_{1:n})$ . A conditioned generator RNN (decoder) is then used to generate the desired output $t_{1:m}$ according to Equation (17.5). The architecture is illustrated in Figure 17.3.

![Figure 17.3](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/d6018ab2771453bce52b26f38898e8c77d04db8006eade6cf4d5cd541f7d4f1e.jpg)  
Figure 17.3: Sequence-to-sequence RNN generator.

This setup is useful for mapping sequences of length n to sequences of length m. The encoder summarizes the source sentence as a vector c, and the decoder RNN is then used to predict (using a language modeling objective) the target sequence words conditioned on the previously predicted words as well as the encoded sentence c. The encoder and decoder RNNs are trained jointly. The

## 17. CONDITIONED GENERATION

supervision happens only for the decoder RNN, but the gradients are propagated all the way back to the encoder RNN (see Figure 17.4).

![Figure 17.4](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/021381c6b30f29860498c6982593e2cb2969553ad374b7036be11521b6202ea8.jpg)  
Figure 17.4: Sequence-to-sequence RNN training graph.

## 17.2.2 APPLICATIONS

The sequence-to-sequence approach is very general, and can potentially fit any case where a mapping from an input sequence to an output sequence is needed. We list some example use cases from the literature.

Machine Translation The sequence-to-sequence approach was shown to be surprisingly effective for Machine Translation [Sutskever et al., 2014] using deep LSTM RNNs. In order for the technique to work, Sutskever et al. found it effective to input the source sentence in reverse, such that $x_{n}$ corresponds to the first word of the sentence. In this way, it is easier for the second RNN to establish the relation between the first word of the source sentence to the first word of the target sentence.

While the success of the sequence-to-sequence approach in French-to-English translation is impressive, it is worth noting that the approach of Sutskever et al. [2014] required eight layers of high-dimensional LSTMs, is very computationally expensive, and is non-trivial to train well. Later in this chapter (Section 17.4) we describe attention-based architectures, an elaboration on the sequence-to-sequence architecture that is much more useful for machine translation.

Email Auto-response Here, the task is to map an email, that can be potentially long, into a short answer such as Yes, I'll do it, Great, see you on Wednesday or It won't work out. Kannan et al. [2016] describe an implementation of the auto-response feature for the Google Inbox product. The core of the solution is a straightforward sequence to sequence conditioned generation model based on an LSTM encoder that reads in the email, and an LSTM decoder that generates an appropriate response. This component is trained on many email-response pairs. Of course, in order to successfully integrate the response generation component into a product, it needs to be supplemented by additional modules, to schedule the triggering of the response component, to ensure diversity of responses and balance negative and positive responses, maintain user privacy, and so on. For details, see Kannan et al. [2016].

Morphological Inflection In the morphological inflection task, the input is a base word and a desired inflection request, and the output is an inflected form of the word. For example, for the Finnish word bruttoarvo and the desired inflection pos=N, case=IN+ABL, num=PL the desired output is bruttoarvoista. While the task has traditionally been approached using hand-crafted lexicons and finite-state transducers, it is also a very good fit for character level sequence-to-sequence conditioned generation models [Faruqui et al., 2016]. Results of the SIGMORPHON 2016 shared task on inflection generation indicate that recurrent neural network approaches outperform all other participating approaches [Cotterell et al., 2016]. The second-place system [Aharoni et al., 2016] used a sequence-to-sequence model with a few enhancements for the task, while the winning system [Kann and Schütze, 2016] used an ensemble of attentive sequence-to-sequence models, such as the ones described in Section 17.4.

Other Uses Mapping a sequence of n items to a sequence of m items is very general, and almost any task can be formulated in an encode-and-generate solution. However, the fact that a task can be formulated this way, does not mean that it should be—perhaps better architectures are more suitable for it, or are easier to learn. We now describe several applications that seem to be needlessly hard to learn under the encoder-decoder framework, and for which other, better-

## 17. CONDITIONED GENERATION

suited architectures exist. The fact that the authors managed to get decent accuracies with the encoder-decoder framework attests to the power of the framework.

Filippova et al. [2015] use the architecture for performing sentence compression by deletion. In this task, we are given a sentence such as “Alan Turing, known as the father of computer science, the codebreaker that helped win World War 2, and the man tortured by the state for being gay, is to receive a pardon nearly 60 years after his death” and are required to produce a shorter (“compressed”) version containing the main information in the sentence by deleting words from the original sentence. An example compression would be “Alan Turing is to receive a pardon.” Filippova et al. [2015] model the problem as a sequence-to-sequence mapping in which the input sequence is the input sentence (possibly coupled with syntactic information derived from an automatically produced parse-tree), and the output is a sequence of KEEP, DELETE, and STOP decisions. The model was trained on a corpus of about 2 million sentence-and-compression pairs extracted automatically from news articles [Filippova and Altun, 2013], producing state-of-the-art results. $^{1}$

Gillick et al. [2016] perform part-of-speech tagging and named-entity recognition by treating it as a sequence-to-sequence problem mapping a sequence of unicode bytes to a sequence of spans predictions of the form S12,L13,PER,S40,L11,LOC indicating a 13-bytes long PERSON entity starting at offset 12, and an 11-bytes long LOCATION entity starting at offset 40. $^{2}$

Vinyals et al. [2014] perform syntactic parsing as a sequence-to-sequence task mapping a sentence to a set of constituency bracketing decisions.

## 17.2.3 OTHER CONDITIONING CONTEXTS

The conditioned-generation approach is very flexible—the encoder needn't be an RNN. Indeed, the conditioning context vector can be based on a single word, a CBOW encoding, be generated by a convolutional network, or based on some other complex computation.

Furthermore, the conditioning context need not even be text-based. In a dialog setting (in which the RNN is trained to produce responses to messages in a dialog) Li et al. [2016] use as context a trainable embedding vector which is associated with the user who wrote the response. The intuition is that different users have different communication styles, based on their age, gender, social role, background knowledge, personality traits and many other latent factors. By conditioning on the user when generating the response, the network can learn to adapt its predictions while still using an underlying language model as a backbone. Moreover, as a side effect of training the generator, the network also learns user embeddings, producing similar vectors to users who have similar communication styles. At test time, one can influence the style of the generated response by feeding in a particular user (or average user vector) as a conditioning context.

Departing further away from language, a popular use-case is in image captioning: an input image is encoded as a vector (usually using a multi-layer convolutional network $^{3}$ ) and this vector is used as a conditioning context for an RNN generator that is trained to predict image descriptions [Karpathy and Li, 2015, Mao et al., 2014, Vinyals et al., 2015].

Work by Huang et al. [2016] extend the captioning task to the more elaborate one of visual story telling, in which the input is a series of images, and the output is a story describing the progression in the images. Here, the encoder is an RNN that reads in a sequence of image vectors.

## 17.3 UNSUPERVISED SENTENCE SIMILARITY

It is often desired to have vector representations of sentences such that similar sentences have similar vectors. This problem is somewhat ill defined (what does it mean for sentences to be similar?), and is still an open research question, but some approaches produce reasonable results. Here, we focus on unsupervised approaches, in the sense that they can be trained from un-annotated data. The result of the training is an encoder function $\operatorname{Enc}(w_{1:n})$ such that similar sentences are encoded to similar vectors.

Most approaches are based on the sequence-to-sequence framework: an encoder RNN is trained to produce context vectors c that will then be used by an RNN decoder to perform a task. As a consequence, the important information from the sentence with respect to the task must be captured in c. Then, the decoder RNN is thrown away, and the encoder is used to generate sentence representations c, under the premise that similar sentences will have similar vectors. The resulting similarity function across sentences, then, crucially relies on the task of the decoder was trained to perform.

Auto Encoding The auto-encoding approach is a conditioned generation model in which a sentence is encoded using an RNN, and then the decoder attempts to reconstruct the input sentence. This way, the model is trained to encode the information that is needed to reconstruct the sentence, again, hopefully resulting in similar sentences having similar vectors. The sentence reconstruction objective may not be ideal for general sentence similarity, however, as it is likely to push apart representations of sentences that convey similar meanings but use different words.

Machine Translation Here, a sequence-to-sequence network is trained to translate sentences from English to another language. Intuitively, the vectors produced by the encoder are useful for translation, and so they encode the essence of the sentence that is needed to translate it properly, resulting in sentences that will be translated similarly to have similar vectors. This method requires a large corpus for the conditioned generation task, such as a parallel corpus used in machine translation.

## 204 17. CONDITIONED GENERATION

Skip-thoughts The model of Kiros et al. [2015], assigned the name skip-thought vectors by its authors, presents an interesting objective to the sentence similarity problem. The model extend the distributional hypothesis from words to sentences, arguing that sentences are similar if they appear in similar contexts, where a context of a sentence are the sentences surrounding it. The skip-thoughts model is thus a conditioned generation model where an RNN encoder maps a sentence to a vector, and then one decoder is trained to reconstruct the previous sentence based on the encoded representation, and a second decoder is trained to reconstruct the following sentence. The trained skip-thought encoder produces impressive results in practice, mapping sentences such as:

(a) he ran his hand inside his coat, double-checking that the unopened letter was still there; and (b) he slipped his hand between his coat and his shirt, where the folded copies lay in a brown envelope. to similar vectors.

Syntactic Similarity The work of Vinyals et al. [2014] demonstrate that an encoder-decoder can produce decent results for phrase-based syntactic parsing, by encoding the sentence and requiring the decoder to reconstruct a linearized parse tree as a stream of bracketing decisions, i.e., mapping from:

the boy opened the door

to:

(S (NP DT NN) (VP VBD (NP DT NN)))

The encoded sentence representations under such training are likely to capture the syntactic structure of the sentence.

## 17.4 CONDITIONED GENERATION WITH ATTENTION

In the encoder-decoder networks described in Section 17.2 the input sentence is encoded into a single vector, which is then used as a conditioning context for an RNN-generator. This architectures forces the encoded vector $c = \text{RNN}^{\text{enc}}(x_{1:n})$ to contain all the information required for generation, and requires the generator to be able to extract this information from the fixed-length vector. Given these rather strong requirements, the architecture works surprisingly well. However, in many cases it can be substantially improved by the addition of an attention mechanism. The conditioned generation with attention architecture [Bahdanau et al., 2014] relaxes the condition that the entire source sentence be encoded as a single vector. Instead, the input sentence is encoded as a sequence of vectors, and the decoder uses a soft attention mechanism in order to decide on which parts of the encoding input it should focus. The encoder, decoder, and attention mechanism are all trained jointly in order to play well with each other.

More concretely, the encoder-decoder with attention architecture encodes a length n input sequence $x_{1:n}$ using a biRNN, producing n vectors $c_{1:n}$ :

$$
c_{1: n} = \operatorname{Enc}(x_{1: n}) = \operatorname{biRNN}^{\star}(x_{1: n}).
$$

The generator (decoder) can then use these vectors as a read-only memory representing the conditioning sentence: at any stage j of the generation process, it chooses which of the vectors $c_{1:n}$ it should attend to, resulting in a focused context vector $c^{j} = \text{attend}(c_{1:n}, \hat{t}_{1:j})$ .

The focused context vector $c^{j}$ is then used for conditioning the generation at step j:

$$
\begin{array}{c} p(t_{j + 1} = k \mid \hat{t}_{1: j}, x_{\mathbf{1}: n}) = f(O(s_{j + \mathbf{1}})) \\ s_{j + \mathbf{1}} = R(s_{j},[\hat{t}_{j}; c^{j}]) \\ c^{j} = \text{attend}(c_{\mathbf{1}: n}, \hat{t}_{1: j}) \\ \hat{t}_{j} \sim p(t_{j} \mid \hat{t}_{1: j - 1}, x_{\mathbf{1}: n}).\end{array}\tag{17.7}
$$

In terms of representation power, this architectures subsumes the previous encoder-decoder architecture: by setting $\text{attend}(c_{1:n}, \hat{t}_{1:j}) = c_n$ , we get Equation (17.6).

How does the function attend(·,·) look like? As you may have guessed by this point, it is a trainable, parameterized function. This text follows the attention mechanism described by Bahdunau et al. [2014], who were the first to introduce attention in the context of sequence to sequence generation. $^{4}$ While this particular attention mechanism is popular and works well, many variants are possible. The work of Luong et al. [2015] explores some of them in the context of machine translation.

The implemented attention mechanism is soft, meaning that at each stage the decoder sees a weighted average of the vectors $c_{1:n}$ , where the weights are chosen by the attention mechanism.

More formally, at stage j the soft attention produces a mixture vector $c^{j}$ :

$$
c^{j} = \sum_{i = 1}^{n} \alpha_{[i]}^{j} \cdot c_{i}.
$$

$\alpha^{j} \in R_{+}^{n}$ is the vector of attention weights for stage j, whose elements $\alpha_{[i]}^{j}$ are all positive and sum to one.

The values $\alpha_{[i]}^{j}$ are produced in a two-stage process: first, unnormalized attention weights $\bar{\alpha}_{[i]}^{j}$ are produced using a feed-forward network MLP $^{att}$ taking into account the decoder state at time j and each of the vectors $c_{i}$ :

$$
\begin{array}{l} \bar{\alpha}^{j} = \bar{\alpha}_{[1]}^{j}, \ldots, \bar{\alpha}_{[n]}^{j} = \\ \qquad = \mathrm{MLP}^{\mathrm{att}}([s_{j}; c_{1}]), \ldots, \mathrm{MLP}^{\mathrm{att}}([s_{j}; c_{n}]).\end{array}\tag{17.8}
$$

The unnormalized weights $\bar{\alpha}^{j}$ are then normalized into a probability distribution using the softmax function:

$$
\alpha^{j} = \mathrm{softmax}(\bar{\alpha}_{[1]}^{j}, \dots, \bar{\alpha}_{[n]}^{j}).
$$

In the context of machine translation, one can think of MLP $^{att}$ as computing a soft alignment between the current decoder state $s_{j}$ (capturing the recently produced foreign words) and each of the source sentence components $c_{i}$ .

The complete attend function is then:

$$
\begin{array}{rl} &{\mathrm{attend}(c_{1: n}, \hat{t}_{1: j}) = c^{j}} \\ &{\qquad c^{j} = \sum_{i = 1}^{n} \alpha_{[i]}^{j} \cdot c_{i}} \\ &{\qquad \alpha^{j} = \mathrm{softmax}(\bar{\alpha}_{[1]}^{j}, \ldots, \bar{\alpha}_{[n]}^{j})} \\ &{\qquad \bar{\alpha}_{[i]}^{j} = \mathrm{MLP}^{\mathrm{att}}([s_{j}; c_{i}]),} \end{array}\tag{17.9}
$$

and the entire sequence-to-sequence generation with attention is given by:

$$
\begin{array}{rl} & p(t_{j + 1} = k \mid \hat{t}_{1: j}, x_{1: n}) = f(O_{\mathrm{dec}}(s_{j + 1})) \\ & s_{j + 1} = R_{\mathrm{dec}}(s_{j},[\hat{t}_{j}; c^{j}]) \\ & c^{j} = \sum_{i = 1}^{n} \alpha_{[i]}^{j} \cdot c_{i} \\ & c_{1: n} = \mathrm{biRNN}_{\mathrm{enc}}^{\star}(x_{1: n}) \\ & \alpha^{j} = \mathrm{softmax}(\bar{\alpha}_{[1]}^{j}, \ldots, \bar{\alpha}_{[n]}^{j}) \\ & \bar{\alpha}_{[i]}^{j} = \mathrm{MLP}^{\mathrm{att}}([s_{j}; c_{i}]) \\ & \hat{t}_{j} \sim p(t_{j} \mid \hat{t}_{1: j - 1}, x_{1: n}) \\ & f(z) = \mathrm{softmax}(\mathrm{MLP}^{\mathrm{out}}(z)) \end{array}\tag{17.10}
$$

$$
\mathrm{MLP}^{\text{att}}([s_{j}; c_{i}]) = v \tanh([s_{j}; c_{i}] U + b).
$$

A sketch of the architecture is given in Figure 17.5.

Why use the biRNN encoder to translate the conditioning sequence $x_{1:n}$ into the context vectors $c_{1:n}$ instead of letting the attention mechanism look directly at $x_{1:n}$ ? Couldn't we just use $c^j = \sum_{i=1}^{n} \alpha_{[i]}^j \cdot x_i$ and $\bar{\alpha}_{[i]}^j = \text{MLP}^{\text{att}}([s_j; x_i])$ ? We could, but we get important benefits from the encoding process. First, the biRNN vectors $c_i$ represent the items $x_i$ in their sentential context, that is, they represent a window focused around the input item $x_{i}$ and not the item itself. Second, by having a trainable encoding component that is trained jointly with the decoder, the encoder and decoder evolve together and the network can learn to encode relevant properties of the input that are useful for decoding, and that may not be present at the source sequence $x_{1:n}$ directly. For example, the biRNN encoder may learn to encode the position of $x_{i}$ within the sequence, and the decoder could use this information to access the elements in order, or learn to pay more attention to elements in the beginning of the sequence then to elements at its end.

![Figure 17.5](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/4a484380883979c4075d6cc614d88241203448bd99f8c1d85e170fab0c04cac4.jpg)  
Figure 17.5: Sequence-to-sequence RNN generator with attention.

## 17. CONDITIONED GENERATION

Attentive conditioned generation models are very powerful, and work very well on many sequence to sequence generation tasks.

## 17.4.1 COMPUTATIONAL COMPLEXITY

The conditioned generation without attention is relatively cheap: the encoding is performed in linear time in the input length $(O(n))$ , and the decoding is performed in linear time in the output length $(O(m))$ . While generating a distribution over words from a large vocabulary is in itself expensive, this is an orthogonal issue to this analysis, in which we consider the vocabulary scoring as a constant time operation. The overall complexity of the sequence to sequence generation process is then $O(m+n)^{5}$ .

What is the cost of adding the attention mechanism? The encoding of the input sequence remains an $O(n)$ linear time operation. However, each step of the decoding process now needs to compute $c^{j}$ . This entails n evaluations of MLP $^{att}$ followed by a normalization step and a summation of n vectors. The complexity of a decoding step grew from a constant time operation to linear in the length of the conditioning sentence $O(n)$ , resulting in a total runtime of $O(m \times n)$ .

## 17.4.2 INTERPRETABILITY

Non-attentive encoder-decoder networks (much like most other neural architectures) are extremely opaque: we do not have a clear understanding on what exactly is encoded in the encoded vector, how this information is exploited in the decoder, and what prompted a particular decoder behavior. An important benefit of the attentive architecture is that it provides a simple way of peeking inside some of the reasoning in the decoder and what it learned. At each stage of the decoding process, one can look at the produced attention weights $\alpha^{j}$ and see which areas of the source sequence the decoder found relevant when producing the given output. While this is still a weak form of interpretability, it is leaps and bounds beyond the opaqueness of the non-attentive models.

## 17.5 ATTENTION-BASED MODELS IN NLP

Conditioned-generation with attention is a very powerful architecture. It is the main algorithm driving state-of-the-art machine translation, and provides strong results on many other NLP tasks. This section provides a few examples of its usage.

## 17.5.1 MACHINE TRANSLATION

While we initially described machine translation in the context of plain sequence to sequence generation, current state-of-the-art machine translation systems are powered by models that employ attention.

The first results with attentive sequence-to-sequence models for machine translation are due to Bahdanau et al. [2014], who essentially used the architecture described in the previous section as is (using a GRU-flavored RNN), employing beam-search when generating from the decoder at test time. While Luong et al. [2015] explored variations on the attention mechanism leading to some gains, most progress in neural machine translation use the attentive sequence-to-sequence architecture as is (either with LSTMs or GRUs), while changing its inputs.

While we cannot expect to cover neural machine translation in this rather short section, we list some improvements due to Sennrich and colleagues that push the boundaries of the state-of-the-art.

Sub-word Units In order to deal with vocabularies of highly inflected languages (as well as to restrict the vocabulary size in general), Senurich et al. [2016a] propose moving to working with sub-word units that are smaller than a token. Their algorithm processes the source and target side texts using an algorithm called BPE in search for prominent subword units (the algorithm itself is described at the end of Section 10.5.5). When run on English, this stage is likely to find units such as er, est, un, low and wid. The source and target sentences are then processed to split words according to the induced segmentation (i.e., converting the widest network into the wid\_\_est net\_\_work). This processed corpus is then fed into an attentive sequence-to-sequence training. After decoding test sentences, the output is processed once more to un-split the sub-word units back into words. This process reduces the number of unknown tokens, makes it easier to generalize to new vocabulary items, and improves translation quality. Related research effort attempt to work directly on the character level (encoding and decoding characters instead of words), with notable success [Chung et al., 2016].

Incorporating monolingual data The sequence-to-sequence models are trained on parallel corpora of aligned sentences in the source and target languages. Such corpora exist, but are naturally much smaller than available monolingual data, which is essentially infinite. Indeed, the previous generation of statistical machine translation systems $^{6}$ train a translation model on the parallel data, and a separate language model on much larger monolingual data. The sequence-to-sequence architecture does not currently allow such a separation, training the language model (decoder) and translation model (encoder-decoder interaction) jointly.

How can we make use of target-side monolingual data in a sequence-to-sequence framework? Senurich et al. [2016b] propose the following training protocol: when attempting to translate from source to target, first train a translation model from target to source, and use it to

## 210 17. CONDITIONED GENERATION

translate a large monolingual corpus of target sentences. Then, add the resulting (target, source) pairs to the parallel corpus as (source, target) examples. Train a source to target MT system on the combined corpus. Note that while the system now trains on automatically produced examples, all of the target side sentences it sees are original, so the language modeling component is never trained on automatically produced text. While somewhat of a hack, this training protocol brings substantial improvements in translation quality. Further research will likely yield cleaner solutions for integrating monolingual data.

Linguistic Annotations Finally, Semnich and Haddow [2016] show that the attentive sequence-to-sequence architecture can learn better translation model if its input is supplemented with linguistic annotations. That is, given a source sentence $w_{1}, \ldots, w_{n}$ , rather than creating the input vectors $x_{1:n}$ by simply assigning an embedding vector to each word ( $x_{i} = E_{[w_{i}]}$ ), the sentence is run through a linguistic annotation pipeline that includes part-of-speech tagging, syntactic dependency parsing and lemmatization. Each word is then supplemented with an encoding vector of its part of speech tag ( $p_{i}$ ), it's dependency label with respect to its head ( $r_{i}$ ), its lemma ( $l_{i}$ ), and morphological features ( $m_{i}$ ). The input vectors $x_{1:n}$ is then defined as concatenation of these features: $x_{i} =[w_{i}; p_{i}; r_{i}; l_{i}; m_{i}]$ . These additional features consistently improve translation quality, indicating that linguistic information is helpful even in the presence of powerful models than can in theory learn the linguistic concepts on their own. Similarly, Abaroni and Goldberg [2017] show that by training the decoder in a German to English translation system to produce linearized syntactic trees instead of a sequence of words, the resulting translations exhibit more consistent reordering behavior, and better translation quality. These works barely scratch the surface with respect to integrating linguistic information. Further research may come up with additional linguistic cues that could be integrated, or improved ways of integrating the linguistic information.

Open issues As of the time of this writing, major open issues in neural machine translation include scaling up the size of the output vocabulary (or removing the dependence on it by moving to character-based outputs), training while taking the beam-search decoding into account, and speeding up training and decoding. Another topic that becomes popular is the move to models that make use of syntactic information. That said, the field is moving extremely fast, and this paragraph may not be relevant by the time the book gets to press.

## 17.5.2 MORPHOLOGICAL INFLECTION

The morphological inflection task discussed above in the context of sequence to sequence models also work better when used with an attentive sequence-to-sequence architecture, as evident by the architecture of the winning system in the SIGMORPHON shared task on morphological reinflection [Cotterell et al., 2016]. The winning system [Kann and Schütze, 2016] essentially use an off-the-shelf attentive sequence to sequence model. The input to the shared task is a word form and a desired inflection, given as a list of target part-of-speech tags and morphological features, e.g., NOUN Gender=Male Number=Plural, and the desired output as an inflected form. This is translated to a sequence to sequence model by creating an input sequence that is the list of inflection information, followed by the list of characters of the input word. The desired output is then the list of characters in the target word.

## 17.5.3 SYNTACTIC PARSING

While more suitable architectures exist, the work of Vinyals et al. [2014] show that attentive sequence to sequence models can produce competitive syntactic parsing results, by reading in a sentence (a word at a time) and outputting a sequence of bracketing decisions. This may not seem like an ideal architecture for parsing—indeed, one can get superior results with better tailored architectures, as evident by the work of Cross and Huang [2016a]. However, considering the generality of the architecture, the system works surprisingly well, and produces impressive parsing results. In order to get fully competitive results, some extra steps must be taken: the architecture needs a lot of training data. It is trained on parse-trees produced by running two treebank-trained parsers on a large text corpus, and selecting trees on which the two parsers agree (high-confidence parses). In addition, for the final parser, an ensemble (Section 5.2.3) of several attention networks is used.

PART IV

Additional Topics

The image provided is completely blank and contains no text or visible content. Therefore, there is no OCR result to output.


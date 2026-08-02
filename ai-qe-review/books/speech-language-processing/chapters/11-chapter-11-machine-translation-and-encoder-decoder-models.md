---
title: "Chapter 11 \u2014 Machine Translation and Encoder-Decoder Models"
book: "Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models"
book_slug: speech-language-processing
course: natural-language-processing
chapter_number: 11
citekey: jurafsky2026slp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf"
source_transcript: "transcripts/mineru/speech-language-processing/reading.md"
source_line_start: 5503
source_line_end: 6135
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 15
source_empty_image_alt: 15
non_semantic_image_alt: 1
caption_derived_image_alt: 14
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: true
  source_control_characters: 0
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - natural-language-processing
  - official-syllabus
---

# Chapter 11 — Machine Translation and Encoder-Decoder Models

> [[../README|本书目录]] · [[10-contextual-embeddings|上一章]] · [[12-chapter-12-constituency-grammars|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models（jurafsky2026slp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/speech-language-processing/reading.md)，源行 5503–6135。
> - 本章保留 15 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.234) × 2。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Machine Translation and Encoder-Decoder Models

“I want to talk the dialect of your people. It’s no use of talking unless people understand what you say.”

Zora Neale Hurston, Moses, Man of the Mountain 1939, p. 121

This chapter introduces machine translation (MT), the use of computers to translate from one language to another.

Of course translation, in its full generality, such as the translation of literature, or poetry, is a difficult, fascinating, and intensely human endeavor, as rich as any other area of human creativity.

Machine translation in its present form therefore focuses on a number of very practical tasks. Perhaps the most common current use of machine translation is for information access. We might want to translate some instructions on the web, perhaps the recipe for a favorite dish, or the steps for putting together some furniture. Or we might want to read an article in a newspaper, or get information from an online resource like Wikipedia or a government webpage in a foreign language.

MT for information access is probably one of the most common uses of NLP technology, and Google

En un recipiente hondo, mezclar el jugo de X naranja con el azúcar, jengibre, y nuez moscada.

In a deep bowl, mix the orange juice with the sugar, ginger, and nutmeg.

Translate alone (shown above) translates hundreds of billions of words a day between over 100 languages.

Another common use of machine translation is to aid human translators. MT systems are routinely used to produce a draft translation that is fixed up in a post-editing phase by a human translator. This task is often called computer-aided translation or CAT. CAT is commonly used as part of localization: the task of adapting content or a product to a particular language community.

Finally, a more recent application of MT is to in-the-moment human communication needs. This includes incremental translation, translating speech on-the-fly before the entire sentence is complete, as is commonly used in simultaneous interpretation. Image-centric translation can be used for example to use OCR of the text on a phone camera image as input to an MT system to translate menus or street signs.

The standard algorithm for MT is the encoder-decoder network, also called the sequence to sequence network, an architecture that can be implemented with RNNs or with Transformers. We’ve seen in prior chapters that RNN or Transformer architecture can be used to do classification (for example to map a sentence to a positive or negative sentiment tag for sentiment analysis), or can be used to do sequence labeling (for example to assign each word in an input sentence with a part-of-speech, or with a named entity tag). For part-of-speech tagging, recall that the output tag is associated directly with each input word, and so we can just model the tag as output $y_{t}$ for each input word $x_{t}$ .

Encoder-decoder or sequence-to-sequence models are used for a different kind of sequence modeling in which the output sequence is a complex function of the entire input sequencer; we must map from a sequence of input words or tokens to a sequence of tags that are not merely direct mappings from individual words.

Machine translation is exactly such a task: the words of the target language don’t necessarily agree with the words of the source language in number or order. Consider translating the following made-up English sentence into Japanese.

(11.1) English: He wrote a letter to a friend

Japanese: tomodachi ni tegami-o kaita friend to letter wrote

Note that the elements of the sentences are in very different places in the different languages. In English, the verb is in the middle of the sentence, while in Japanese, the verb kaita comes at the end. The Japanese sentence doesn’t require the pronoun he, while English does.

Such differences between languages can be quite complex. In the following actual sentence from the United Nations, notice the many changes between the Chinese sentence (we’ve given in in red a word-by-word gloss of the Chinese characters) and its English equivalent.

(11.2) 会/General Assembly <sup>在</sup>/on 1982年/1982 12<sup>月</sup>/December 10日/10 <sup>通</sup>过<sup>大</sup>了/adopted 37号/37th <sup>决</sup>议/resolution ，<sup>核准</sup>了/approved 二 /second<sup>第 第 次</sup>探索/exploration 及/and <sup>和</sup>平peaceful 利 /using <sup>间</sup>/outer space 会<sup>用 外</sup>议/conference 的/of <sup>各</sup> /various 建议/suggestions <sup>。</sup>

On 10 December 1982 , the General Assembly adopted resolution 37 in which it endorsed the recommendations of the Second United Nations Conference on the Exploration and Peaceful Uses of Outer Space .

Note the many ways the English and Chinese differ. For example the ordering differs in major ways; the Chinese order of the noun phrase is “peaceful using outer space conference of suggestions” while the English has “suggestions of the ... conference on peaceful use of outer space”). And the order differs in minor ways (the date is ordered differently). English requires the in many places that Chinese doesn’t, and adds some details (like “in which” and “it”) that aren’t necessary in Chinese. Chinese doesn’t grammatically mark plurality on nouns (unlike English, which has the “-s” in “recommendations”), and so the Chinese must use the modifier <sup>各</sup> /various to make it clear that there is not just one recommendation. English capitalizes some words but not others.

Encoder-decoder networks are very successful at handling these sorts of complicated cases of sequence mappings. Indeed, the encoder-decoder algorithm is not just for MT; it’s the state of the art for many other tasks where complex mappings between two sequences are involved. These include summarization (where we map from a long text to its summary, like a title or an abstract), dialogue (where we map from what the user said to what our dialogue system should respond), semantic parsing (where we map from a string of words to a semantic representation like logic or SQL), and many others.

We’ll introduce the algorithm in sections Section 11.2, and in following sections give important components of the model like beam search decoding, and we’ll discuss how MT is evaluated, introducing the popular BLEU metric.

But first, in the next section, we begin by summarizing the linguistic background to MT: key differences among languages that are important to consider when considering the task of translation.

## 11.1 Language Divergences and Typology

Some aspects of human language seem to be universal, holding true for every language, or are statistical universals, holding true for most languages. Many universals arise from the functional role of language as a communicative system by humans. Every language, for example, seems to have words for referring to people, for talking about eating and drinking, for being polite or not. There are also structural linguistic universals; for example, every language seems to have nouns and verbs (Chapter 8), has ways to ask questions, or issue commands, linguistic mechanisms for indicating agreement or disagreement.

Yet languages also differ in many ways, and an understanding of what causes such translation divergences will help us build better MT models. We often distinguish the idiosyncratic and lexical differences that must be dealt with one by one (the word for ”dog” differs wildly from language to language), from systematic differences that we can model in a general way (many languages put the verb before the direct object; others put the verb after the direct object). The study of these systematic cross-linguistic similarities and differences is called linguistic typology. This section sketches some typological facts that impact machine translation; the interested reader should also look into WALS, the World Atlas of Language Structures, which gives many typological facts about languages (Dryer and Haspelmath, 2013).

## 11.1.1 Word Order Typology

As we hinted it in our example above comparing English and Japanese, languages differ in the basic word order of verbs, subjects, and objects in simple declarative clauses. German, French, English, and Mandarin, for example, are all SVO (Subject-Verb-Object) languages, meaning that the verb tends to come between the subject and object. Hindi and Japanese, by contrast, are SOV languages, meaning that the verb tends to come at the end of basic clauses, and Irish and Arabic are VSO languages. Two languages that share their basic word order type often have other similarities. For example, VO languages generally have prepositions, whereas OV languages generally have postpositions.

Let’s look in more detail at the example we saw above. In this SVO English sentence, the verb wrote is followed by its object a letter and the prepositional phrase to a friend, in which the preposition to is followed by its argument a friend. Arabic, with a VSO order, also has the verb before the object and prepositions. By contrast, in the Japanese example that follows, each of these orderings is reversed; the verb is preceded by its arguments, and the postposition follows its argument.

(11.3) English: He wrote a letter to a friend

Japanese: tomodachi ni tegami-o kaita

friend to letter wrote

Arabic: katabt risala ¯ li sadq˙

wrote letter to friend

Other kinds of ordering preferences vary idiosyncratically from language to language. In some SVO languages (like English and Mandarin) adjectives tend to appear before verbs, while in others languages like Spanish and Modern Hebrew, adjectives appear after the noun:

(11.4) Spanish bruja verde English green witch

![Figure 11.1](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/17c0ab489a56f0f1e3970076c7a94a1b983ab1dd55f2fe958d3c17bf588b1c68.jpg)  
Figure 11.1 Examples of other word order differences: (a) In German, adverbs occur in initial position that in English are more natural later, and tensed verbs occur in second position. (b) In Mandarin, preposition phrases expressing goals often occur pre-verbally, unlike in English.

Fig. 11.1 shows examples of other word order differences. All of these word order differences between languages can cause problems for translation, requiring the system to do huge structural reorderings as it generates the output.

## 11.1.2 Lexical Divergences

Of course we also need to translate the individual words from one language to another. For any translation, the appropriate word can vary depending on the context. The English source-language word bass, for example, can appear in Spanish as the fish lubina or the musical instrument bajo. German uses two distinct words for what in English would be called a wall: Wand for walls inside a building, and Mauer for walls outside a building. Where English uses the word brother for any male sibling, Chinese and many other languages have distinct words for older brother and younger brother (Mandarin gege and didi, respectively). In all these cases, translating bass, wall, or brother from English would require a kind of specialization, disambiguating the different uses of a word. For this reason the fields of MT and Word Sense Disambiguation (Chapter 18) are closely linked.

Sometimes one language places more grammatical constraints on word choice than another. We saw above that English marks nouns for whether they are singular or plural. Mandarin doesn’t. Or French and Spanish, for example, mark grammatical gender on adjectives, so an English translation into French requires specifying adjective gender.

The way that languages differ in lexically dividing up conceptual space may be more complex than this one-to-many translation problem, leading to many-to-many mappings. For example, Fig. 11.2 summarizes some of the complexities discussed by Hutchins and Somers (1992) in translating English leg, foot, and paw, to French. For example, when leg is used about an animal it’s translated as French jambe; but about the leg of a journey, as French etape; if the leg is of a chair, we use French pied.

Further, one language may have a lexical gap, where no word or phrase, short of an explanatory footnote, can express the exact meaning of a word in the other language. For example, English does not have a word that corresponds neatly to Mandarin xiao\` or Japanese oyakok¯ oo¯ (in English one has to make do with awkward phrases like filial piety or loving child, or good son/daughter for both).

Finally, languages differ systematically in how the conceptual properties of an event are mapped onto specific words. Talmy (1985, 1991) noted that languages can be characterized by whether direction of motion and manner of motion are marked on the verb or on the “satellites”: particles, prepositional phrases, or adverbial phrases. For example, a bottle floating out of a cave would be described in English with the direction marked on the particle out, while in Spanish the direction

![Figure 11.2](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/c1cae89008edc639f29b659019f7d1e4b1e9a6ad2db7dac9ec8987fcb6122a69.jpg)  
Figure 11.2 The complex overlap between English leg, foot, etc., and various French translations as discussed by Hutchins and Somers (1992).

would be marked on the verb:

(11.5) English: The bottle floated out.

Spanish: La botella salio´ flotando. The bottle exited floating.

Verb-framed languages mark the direction of motion on the verb (leaving the satellites to mark the manner of motion), like Spanish acercarse ‘approach’, alcanzar ‘reach’, entrar ‘enter’, salir ‘exit’. Satellite-framed languages mark the direction of motion on the satellite (leaving the verb to mark the manner of motion), like English crawl out, float off, jump down, run after. Languages like Japanese, Tamil, and the many languages in the Romance, Semitic, and Mayan languages families, are verb-framed; Chinese as well as non-Romance Indo-European languages like English, Swedish, Russian, Hindi, and Farsi are satellite framed (Talmy 1991, Slobin 1996).

## 11.1.3 Morphological Typology

Morphologically, languages are often characterized along two dimensions of variation. The first is the number of morphemes per word, ranging from isolating languages like Vietnamese and Cantonese, in which each word generally has one morpheme, to polysynthetic languages like Siberian Yupik (“Eskimo”), in which a single word may have very many morphemes, corresponding to a whole sentence in English. The second dimension is the degree to which morphemes are segmentable, ranging from agglutinative languages like Turkish, in which morphemes have relatively clean boundaries, to fusion languages like Russian, in which a single affix may conflate multiple morphemes, like -om in the word stolom (table-SG-INSTR-DECL1), which fuses the distinct morphological categories instrumental, singular, and first declension.

Translating between languages with rich morphology requires dealing with structure below the word level, and for this reason modern systems generally use subword models like the wordpiece or BPE models of Section 11.7.1.

## 11.1.4 Referential density

Finally, languages vary along a typological dimension related to the things they tend to omit. Some languages, like English, require that we use an explicit pronoun when talking about a referent that is given in the discourse. In other languages, however, we can sometimes omit pronouns altogether, as the following example from Spanish shows<sup>1</sup>:

(11.6) [El jefe]<sub>i</sub> dio con un libro. $\varnothing_{i}$ Mostro a un descifrador ambulante.´

[The boss] came upon a book. [He] showed it to a wandering decoder.

Languages that can omit pronouns are called pro-drop languages. Even among the pro-drop languages, there are marked differences in frequencies of omission. Japanese and Chinese, for example, tend to omit far more than does Spanish. This dimension of variation across languages is called the dimension of referential density. We say that languages that tend to use more pronouns are more referentially dense than those that use more zeros. Referentially sparse languages, like Chinese or Japanese, that require the hearer to do more inferential work to recover antecedents are also called cold languages. Languages that are more explicit and make it easier for the hearer are called hot languages. The terms hot and cold are borrowed from Marshall McLuhan’s (1964) distinction between hot media like movies, which fill in many details for the viewer, versus cold media like comics, which require the reader to do more inferential work to fill out the representation (Bickel, 2003).

Translating from languages with extensive pro-drop, like Chinese or Japanese, to non-pro-drop languages like English can be difficult since the model must somehow identify each zero and recover who or what is being talked about in order to insert the proper pronoun.

## 11.2 The Encoder-Decoder Model

Encoder-decoder networks, or sequence-to-sequence networks, are models capable of generating contextually appropriate, arbitrary length, output sequences. Encoder-decoder networks have been applied to a very wide range of applications including machine translation, summarization, question answering, and dialogue.

The key idea underlying these networks is the use of an encoder network that takes an input sequence and creates a contextualized representation of it, often called the context. This representation is then passed to a decoder which generates a taskspecific output sequence. Fig. 11.3 illustrates the architecture

![Figure 11.3](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/8ad694781f08c1df787eb0ba07189af97ebc6ad8e668d3aaa0757235046a3ea9.jpg)  
Figure 11.3 The encoder-decoder architecture. The context is a function of the hidden representations of the input, and may be used by the decoder in a variety of ways.

Encoder-decoder networks consist of three components:

1. An encoder that accepts an input sequence, $x_{1}^{n}.$ , and generates a corresponding sequence of contextualized representations, $h_{1}^{\bar{n}}$ . LSTMs, GRUs, convolutional networks, and Transformers can all be employed as encoders.

2. A context vector, $^{c,}$ which is a function of $h_{1}^{n}$ , and conveys the essence of the input to the decoder.

3. A decoder, which accepts c as input and generates an arbitrary length sequence of hidden states $h_{1}^{m}$ , from which a corresponding sequence of output states $y_{1}^{m}$ , can be obtained. Just as with encoders, decoders can be realized by any kind of sequence architecture.

## 11.3 Encoder-Decoder with RNNs

Let’s begin by describing an encoder-decoder network based on a pair of RNNs.<sup>2</sup> Recall the conditional RNN language model from Chapter 9 for computing $p(y)$ , the probability of a sequence y. Like any language model, we can break down the probability as follows:

$$
p(y) = p \left(y_{1}\right) p \left(y_{2} \mid y_{1}\right) p \left(y_{3} \mid y_{1}, y_{2}\right)...P \left(y_{m} \mid y_{1},..., y_{m - 1}\right)\tag{11.7}
$$

At a particular time t, we pass the prefix of t 1 tokens through the language model, using forward inference to produce a sequence of hidden states, ending with the hidden state corresponding to the last word of the prefix. We then use the final hidden state of the prefix as our starting point to generate the next token.

More formally, if $g$ is an activation function like tanh or ReLU, a function of the input at time t and the hidden state at time $t - 1$ , and $f$ is a softmax over the set of possible vocabulary items, then at time t the output $y_{t}$ and hidden state $h_{t}$ are computed as:

$$
h_{t} = g(h_{t - 1}, x_{t})\tag{11.8}
$$

$$
y_{t} = f(h_{t})\tag{11.9}
$$

We only have to make one slight change to turn this language model with autoregressive generation into a translation model that can translate from a source text in one language to a target text in a second: add an sentence separation marker at the end of the source text, and then simply concatenate the target text. We briefly introduced this idea of a sentence separator token in Chapter 9 when we considered using a Transformer language model to do summarization, by training a conditional language model.

If we call the source text x and the target text y, we are computing the probability p(y x) as follows:

$$
p(y | x) = p \left(y_{1} | x\right) p \left(y_{2} \mid y_{1}, x\right) p \left(y_{3} \mid y_{1}, y_{2}, x\right)...P \left(y_{m} \mid y_{1}, \dots, y_{m - 1}, x\right)\tag{11.10}
$$

Fig. 11.4 shows the setup for a simplified version of the encoder-decoder model (we’ll see the full model, which requires attention, in the next section).

Fig. 11.4 shows an English source text (“the green witch arrived”), a sentence separator token (<s>, and a Spanish target text (“llego la bruja verde´ ”). To translate a source text, we run it through the network performing forward inference to generate hidden states until we get to the end of the source. Then we begin autoregressive generation, asking for a word in the context of the hidden layer from the end of the source input as well as the end-of-sentence marker. Subsequent words are conditioned on the previous hidden state and the embedding for the last word generated.

![Figure 11.4](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/52d1223abe2726a09e8b9688ac77ecb258c065d95200a0ac67d02cfc90892c0f.jpg)  
Figure 11.4 Translating a single sentence (inference time) in the basic RNN version of encoder-decoder approach to machine translation. Source and target sentences are concatenated with a separator token in between, and the decoder uses context information from the encoder’s last hidden state.

Let’s formalize and generalize this model a bit in Fig. 11.5. (To help keep things straight, we’ll use the superscripts e and d where needed to distinguish the hidden states of the encoder and the decoder.) The elements of the network on the left process the input sequence x and comprise the encoder. While our simplified figure shows only a single network layer for the encoder, stacked architectures are the norm, where the output states from the top layer of the stack are taken as the final representation. A widely used encoder design makes use of stacked biLSTMs where the hidden states from top layers from the forward and backward passes are concatenated as described in Chapter 9 to provide the contextualized representations for each time step.

![Figure 11.5](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/dc81acb4ecd974b7306a0d58a25e696c9218ff022e8e5845fba737a12a3c33af.jpg)  
Figure 11.5 A more formal version of translating a sentence at inference time in the basic RNN-based encoder-decoder architecture. The final hidden state of the encoder RNN, ${h_{n}^{e}},$ serves as the context for the decoder in its role as $h_{0}^{d}$ in the decoder RNN.

The entire purpose of the encoder is to generate a contextualized representation of the input. This representation is embodied in the final hidden state of the encoder, $h_{n}^{e}.$ . This representation, also called c for context, is then passed to the decoder.

The decoder network on the right takes this state and uses it to initialize the first hidden state of the decoder. That is, the first decoder RNN cell uses c as its prior hidden state $h_{0}^{d}$ . The decoder autoregressively generates a sequence of outputs, an element at a time, until an end-of-sequence marker is generated. Each hidden state is conditioned on the previous hidden state and the output generated in the previous state.

![Figure 11.6](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/5e844829b667e47ccfa1a1ca5e352ad0d71d189c0dd0189176d140cb25d90d45.jpg)  
Figure 11.6 Allowing every hidden state of the decoder (not just the first decoder state) to be influenced by the context c produced by the encoder.

One weakness of this approach as described so far is that the influence of the context vector, c, will wane as the output sequence is generated. A solution is to make the context vector c available at each step in the decoding process by adding it as a parameter to the computation of the current hidden state, using the following equation (illustrated in Fig. 11.6):

$$
h_{t}^{d} = g(\hat{y}_{t - 1}, h_{t - 1}^{d}, c)\tag{11.11}
$$

Now we’re ready to see the full equations for this version of the decoder in the basic encoder-decoder model, with context available at each decoding timestep. Recall that $g$ is a stand-in for some flavor of RNN and $\hat{y}_{t - 1}$ is the embedding for the output sampled from the softmax at the previous step:

$$
\begin{array}{rcl} c & = & h_{n}^{e} \\ h_{0}^{d} & = & c \\ h_{t}^{d} & = & g(\hat{y}_{t - 1}, h_{t - 1}^{d}, c) \\ z_{t} & = & f(h_{t}^{d}) \\ y_{t} & = & \text{softmax}(z_{t}) \end{array}\tag{11.12}
$$

Finally, as shown earlier, the output y at each time step consists of a softmax computation over the set of possible outputs (the vocabulary, in the case of language modeling or MT). We compute the most likely output at each time step by taking the argmax over the softmax output:

$$
\hat{y}_{t} = \operatorname{argmax}_{w \in \mathrm{V}} P(w | x, y_{1}...y_{t - 1})\tag{11.13}
$$

There are also various ways to make the model a bit more powerful. For example, we can help the model keep track of what has already been generated and what hasn’t by conditioning the output layer y not just solely on the hidden state $h_{t}^{d}$ and the context c but also on the output $y_{t - 1}$ generated at the previous timestep:

$$
y_{t} = \operatorname{softmax}(\hat{y}_{t - 1}, z_{t}, c)\tag{11.14}
$$

## 11.3.1 Training the Encoder-Decoder Model

Encoder-decoder architectures are trained end-to-end, just as with the RNN language models of Chapter 9. Each training example is a tuple of paired strings, a source and a target. Concatenated with a separator token, these source-target pairs can now serve as training data.

For MT, the training data typically consists of sets of sentences and their translations. These can be drawn from standard datasets of aligned sentence pairs, as we’ll discuss in Section 11.7.2. Once we have a training set, the training itself proceeds as with any RNN-based language model. The network is given the source text and then starting with the separator token is trained autoregressively to predict the next word, as shown in Fig. 11.7.

![Figure 11.7](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/ab0f2f250407015626e04588ae5c6ccf840cae203dec2662813b64c8dc288bbd.jpg)  
Figure 11.7 Training the basic RNN encoder-decoder approach to machine translation. Note that in the decoder we usually don’t propagate the model’s softmax outputs $\hat{y}_{t},$ , but use teacher forcing to force each input to the correct gold value for training. We compute the softmax output distribution over $\hat{y}$ in the decoder in order to compute the loss at each token, which can then be averaged to compute a loss for the sentence.

Note the differences between training (Fig. 11.7) and inference (Fig. 11.4) with respect to the outputs at each time step. The decoder during inference uses its own estimated output $\hat{y_{t}}$ as the input for the next time step $x_{t + 1}$ . Thus the decoder will tend to deviate more and more from the gold target sentence as it keeps generating more tokens. In training, therefore, it is more common to use teacher forcing in the decoder. Teacher forcing means that we force the system to use the gold target token from training as the next input $x_{t + 1}$ , rather than allowing it to rely on the (possibly erroneous) decoder output $\hat{y_{t}}$ . This speeds up training.

## 11.4 Attention

The simplicity of the encoder-decoder model is its clean separation of the encoder — which builds a representation of the source text — from the decoder, which uses this context to generate a target text. In the model as we’ve described it so far, this context vector is $h_{n},$ the hidden state of the last (nth) time step of the source text. This final hidden state is thus acting as a bottleneck: it must represent absolutely everything about the meaning of the source text, since the only thing the decoder knows about the source text is what’s in this context vector. Information at the beginning of the sentence, especially for long sentences, may not be equally well represented in the context vector.

![Figure 11.8](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/c12b9b8b2a713f4b6f11519823933a350feb5aa89b6e0c17f2983349e5e24107.jpg)  
Figure 11.8 Requiring the context c to be only the encoder’s final hidden state forces all the information from the entire source sentence to pass through this representational bottleneck.

The attention mechanism is a solution to the bottleneck problem, a way of allowing the decoder to get information from all the hidden states of the encoder, not just the last hidden state.

In the attention mechanism, as in the vanilla encoder-decoder model, the context vector c is a single vector that is a function of the hidden states of the encoder, that is, $c = f(h_{1}^{n})$ . Because the number of hidden states varies with the size of the input, we can’t use the entire tensor of encoder hidden state vectors directly as the context for the decoder. The idea of attention is instead to create the single fixed-length vector c by taking a weighted sum of all the encoder hidden states $h_{1}^{n}$

The weights are used to focus on a particular part of the source text that is relevant for the token currently being produced by the decoder. The context vector produced by the attention mechanism is thus dynamic, different for each token in decoding.

Attention thus replaces the static context vector with one that is dynamically derived from the encoder hidden states at each point during decoding. This context vector, $c_{i},$ , is generated anew with each decoding step i and takes all of the encoder hidden states into account in its derivation. We then make this context available during decoding by conditioning the computation of the current decoder hidden state on it (along with the prior hidden state and the previous output generated by the decoder): and the equation (and Fig. 11.9):

$$
h_{i}^{d} = g(\hat{y}_{i - 1}, h_{i - 1}^{d}, c_{i})
$$

![Figure 11.9](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/5fbb5180c8667907f6058c86e3317d2a92f150b26811a985c80f9858ad476d2d.jpg)  
Figure 11.9 The attention mechanism allows each hidden state of the decoder to see a different, dynamic, context, which is a function of all the encoder hidden states.

The first step in computing c<sub>i</sub> is to compute how much to focus on each encoder state, how relevant each encoder state is to the decoder state captured in $h_{i - 1}^{d}$ . We capture relevance by computing— at each state i during decoding—a score $(h_{i - 1}^{d}, h_{j}^{e})$ for each encoder state j.

The simplest such score, called dot-product attention, implements relevance as similarity: measuring how similar the decoder hidden state is to an encoder hidden state, by computing the dot product between them:

$$
\operatorname{score} \left(h_{i - 1}^{d}, h_{j}^{e}\right) = h_{i - 1}^{d} \cdot h_{j}^{e}\tag{11.15}
$$

The score that results from this dot product is a scalar that reflects the degree of similarity between the two vectors. The vector of these scores across all the encoder hidden states gives us the relevance of each encoder state to the current step of the decoder.

To make use of these scores, we’ll normalize them with a softmax to create a vector of weights, $\alpha_{ij}$ , that tells us the proportional relevance of each encoder hidden state $j$ to the prior hidden decoder state, $h_{i - 1}^{d}$

$$
\alpha_{ij} = \operatorname{softmax}(score(h_{i - 1}^{d}, h_{j}^{e}) \forall j \in e)\tag{11.16}
$$

$$
= \frac{\exp(score(h_{i - 1}^{d}, h_{j}^{e})}{\sum_{k} \exp(score(h_{i - 1}^{d}, h_{k}^{e}))}\tag{11.17}
$$

Finally, given the distribution in α, we can compute a fixed-length context vector for the current decoder state by taking a weighted average over all the encoder hidden states.

$$
c_{i} = \sum_{j} \alpha_{ij} h_{j}^{e}\tag{11.18}
$$

With this, we finally have a fixed-length context vector that takes into account information from the entire encoder state that is dynamically updated to reflect the needs of the decoder at each step of decoding. Fig. 11.10 illustrates an encoderdecoder network with attention, focusing on the computation of one context vector c<sub>i</sub>.

![Figure 11.10](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/559775fbdf53736eac32904b9e5f3e4c76cea3966926a5cfdaf02a7469599029.jpg)  
Figure 11.10 A sketch of the encoder-decoder network with attention, focusing on the computation of $\left(c_{i}.\right.$ The context value $c_{i}$ is one of the inputs to the computation of $h_{i}^{d}$ . It is computed by taking the weighted sum of all the encoder hidden states, each weighted by their dot product with the prior decoder hidden state $h_{i -}^{d}$ <sub>1</sub>.

It’s also possible to create more sophisticated scoring functions for attention models. Instead of simple dot product attention, we can get a more powerful function that computes the relevance of each encoder hidden state to the decoder hidden state by parameterizing the score with its own set of weights, $W_{s}$

$$
\operatorname{score} \left(h_{i - 1}^{d}, h_{j}^{e}\right) = h_{t - 1}^{d} W_{s} h_{j}^{e}
$$

The weights $W_{s},$ which are then trained during normal end-to-end training, give the network the ability to learn which aspects of similarity between the decoder and encoder states are important to the current application. This bilinear model also allows the encoder and decoder to use different dimensional vectors, whereas the simple dot-product attention requires the encoder and decoder hidden states have the same dimensionality.

## 11.5 Beam Search

The decoding algorithm we gave above for generating translations has a problem (as does the autoregressive generation we introduced in Chapter 9 for generating from a conditional language model). Recall that algorithm: at each time step in decoding, the output $y_{t}$ is chosen by computing a softmax over the set of possible outputs (the vocabulary, in the case of language modeling or MT), and then choosing the highest probability token (the argmax):

$$
\hat{y}_{t} = \operatorname{argmax}_{w \in \mathrm{V}} P(w | x, y_{1}...y_{t - 1})\tag{11.19}
$$

Choosing the single most probable token to generate at each step is called greedy decoding; a greedy algorithm is one that make a choice that is locally optimal, whether or not it will turn out to have been the best choice with hindsight.

Indeed, greedy search is not optimal, and may not find the highest probability translation. The problem is that the token that looks good to the decoder now might turn out later to have been the wrong choice!

Let’s see this by looking at the search tree, a graphical representation of the choices the decoder makes in searching for the best translation, in which we view the decoding problem as a heuristic state-space search and systematically explore the space of possible outputs. In such a search tree, the branches are the actions, in this case the action of generating a token, and the nodes are the states, in this case the state of having generated a particular prefix. We are searching for the best action sequence, i.e. the target string with the highest probability. Fig. 11.11 demonstrates the problem, using a made-up example. Notice that the most probable sequence is ok ok $j / s_{\dot{\zeta}}$ (with a probability of $.4^{*}.7^{*} 1.0)$ , but a greedy search algorithm will fail to find it, because it incorrectly chooses yes as the first word since it has the highest local probability.

Recall from Chapter 8 that for part-of-speech tagging we used dynamic programming search (the Viterbi algorithm) to address this problem. Unfortunately, dynamic programming is not applicable to generation problems with long-distance dependencies between the output decisions. The only method guaranteed to find the best solution is exhaustive search: computing the probability of every one of the $V^{T}$ possible sentences (for some length value T ) which is obviously too slow.

Instead, decoding in MT and other sequence generation problems generally uses a method called beam search. In beam search, instead of choosing the best token to generate at each timestep, we keep k possible tokens at each step. This fixed-size memory footprint k is called the beam width, on the metaphor of a flashlight beam that can be parameterized to be wider or narrower.

Thus at the first step of decoding, we compute a softmax over the entire vocabulary, assigning a probability to each word. We then select the k-best options from this softmax output. These initial k outputs are the search frontier and these k initial words are called hypotheses. A hypothesis is an output sequence, a translation-sofar, together with its probability.

![Figure 11.11](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/e1bdd86642b190a5518e7f0f19149067ae7c397c5edd8d71046bdfddf1404d1c.jpg)  
Figure 11.11 A search tree for generating the target string $T = t_{1}, t_{2}, \dots$ . from the vocabulary $V = \{\mathrm{yes}, \mathrm{ok}, < s >\}$ , given the source string, showing the probability of generating each token from that state. Greedy search would choose yes at the first time step followed by yes, instead of the globally most probable sequence ok ok.

At subsequent steps, each of the k best hypotheses is extended incrementally by being passed to distinct decoders, which each generate a softmax over the entire vocabulary to extend the hypothesis to every possible next token. Each of these k V hypotheses is scored by $P(y_{i} | \boldsymbol x, \boldsymbol y_{< i})$ : the product of the probability of current word choice multiplied by the probability of the path that led to it. We then prune the k V hypotheses down to the k best hypotheses, so there are never more than k hypotheses at the frontier of the search, and never more than k decoders.

Fig. 11.12 illustrates this process with a beam width of 2.

This process continues until a </s> is generated indicating that a complete candidate output has been found. At this point, the completed hypothesis is removed from the frontier and the size of the beam is reduced by one. The search continues until the beam has been reduced to 0. The result will be k hypotheses.

Let’s see how the scoring works in detail, scoring each node by its log probability. Recall from Eq. 11.10 that we can use the chain rule of probability to break down p(y x) into the product of the probability of each word given its prior context, which we can turn into a sum of logs (for an output string of length t):

$$
\begin{array}{l} \text{score}(y) = \log P(y | x) \\ = \log \left(P(y_{1} | x) P(y_{2} | y_{1}, x) P(y_{3} | y_{1}, y_{2}, x)...P(y_{t} | y_{1},..., y_{t - 1}, x)\right) \\ = \sum_{i = 1}^{t} \log P(y_{i} | y_{1},..., y_{i - 1}, x) \end{array}\tag{11.20}
$$

Thus at each step, to compute the probability of a partial translation, we simply add the log probability of the prefix translation so far to the log probability of generating the next token. Fig. 11.13 shows the scoring for the example sentence shown in Fig. 11.12, using some simple made-up probabilities. Log probabilities are negative or 0, and the max of two log probabilities is the one that is greater (closer to 0).

Fig. 11.14 gives the algorithm.

One problem arises from the fact that the completed hypotheses may have different lengths. Because models generally assign lower probabilities to longer strings, a naive algorithm would also choose shorter strings for y. This was not an issue during the earlier steps of decoding; due to the breadth-first nature of beam search all the hypotheses being compared had the same length. The usual solution to this is to apply some form of length normalization to each of the hypotheses, for example simply dividing the negative log probability by the number of words:

![Figure 11.12](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/5e33ec8ded63fee223680a0d52b7faf4b74099448895e28481350c9eb68aa974.jpg)  
Figure 11.12 Beam search decoding with a beam width of $k = 2.$ At each time step, we choose the k best hypotheses, compute the V possible extensions of each hypothesis, score the resulting $k * V$ possible hypotheses and choose the best k to continue. At time 1, the frontier is filled with the best 2 options from the initial state of the decoder: arrived and the. We then extend each of those, compute the probability of all the hypotheses so far (arrived the, arrived aardvark, the green, the witch) and compute the best 2 (in this case the green and the witch) to be the search frontier to extend on the next step. On the arcs we show the decoders that we run to score the extension words (although for simplicity we haven’t shown the context value $c_{i}$ that is input at each step).

$$
\operatorname{score}(y) = - \log P(y | x) = \frac{1}{T} \sum_{i = 1}^{t} - \log P \left(y_{i} \mid y_{1}, \dots, y_{i - 1}, x\right)\tag{11.21}
$$

Beam search is common in large production MT systems, generally with beam widths k between 5 and 10. What do we do with the resulting k hypotheses? In some cases, all we need from our MT algorithm is the single best hypothesis, so we can return that. In other cases our downstream application might want to look at all k hypotheses, so we can pass them all (or a subset) to the downstream application with their respective scores.

## 11.6 Encoder-Decoder with Transformers

TBD

![Figure 11.13](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/3b3ab61d9b1ee0f377d3d9ce5754e965d79dcf20596d9af24fc9205f78358321.jpg)  
Figure 11.13 Scoring for beam search decoding with a beam width of k = 2. We maintain the log probability of each hypothesis in the beam by incrementally adding the logprob of generating each next token. Only the top k paths are extended to the next step.

## 11.7 Some practical details on building MT systems

## 11.7.1 Tokenization

Machine translation systems generally use a fixed vocabulary, A common way to generate this vocabulary is with the BPE or wordpiece algorithms sketched in Chapter 2. Generally a shared vocabulary is used for the source and target languages, which makes it easy to copy tokens (like names) from source to target, so we build the wordpiece/BPE lexicon on a corpus that contains both source and target language data. Wordpieces use a special symbol at the beginning of each token; here’s a resulting tokenization from the Google MT system (Wu et al., 2016):

words: Jet makers feud over seat width with big orders at stake

wordpieces: J et makers fe ud over seat width with big orders at stake

We gave the BPE algorithm in detail in Chapter 2; here’s more details on the wordpiece algorithm, which is given a training corpus and a desired vocabulary size V, and proceeds as follows:

1. Initialize the wordpiece lexicon with characters (for example a subset of Unicode characters, collapsing all the remaining characters to a special unknown character token).

2. Repeat until there are V wordpieces:

(a) Train an n-gram language model on the training corpus, using the current set of wordpieces.

(b) Consider the set of possible new wordpieces made by concatenating two wordpieces from the current lexicon. Choose the one new wordpiece that most increases the language model probability of the training corpus.

A vocabulary of 8K to 32K word pieces is commonly used.

```julia
function BEAMDECODE(c, beam_width) returns best paths
    y0, h0←0
    path←()
    complete_paths←()
    state←(c, y0, h0, path) ;initial state
    frontier←<state> ;initial frontier

while frontier contains incomplete paths and beamwidth > 0
    extended_frontier←<>
    for each state ∈ frontier do
    y←DECODE(state)
    for each word i ∈ Vocabulary do
    successor←NEWSTATE(state, i, yi)
    new_agenda←ADDTOBEAM(successor, extended_frontier, beam_width)

for each state in extended_frontier do
    if state is complete do
    complete_paths←APPEND(complete_paths, state)
    extended_frontier←REMOVE(extended_frontier, state)
    beam_width←beam_width - 1
    frontier←extended_frontier

return completed_paths

function NEWSTATE(state, word, word_prob) returns new state

function ADDTOBEAM(state, frontier, width) returns updated frontier

if LENGTH(frontier) < width then
    frontier←INSERT(state, frontier)
else if SCORE(state) > SCORE(WORSTOF(frontier))
    frontier←REMOVE(WORSTOF(frontier))
    frontier←INSERT(state, frontier)
return frontier
```

## 11.7.2 MT corpora

Machine translation models are trained on a parallel corpus, sometimes called a bitext, a text that appears in two (or more) languages. Large numbers of parallel corpora are available. Some are governmental; the Europarl corpus (Koehn, 2005), extracted from the proceedings of the European Parliament, contains between 400,000 and 2 million sentences each from 21 European languages. The United Nations Parallel Corpus contains on the order of 10 million sentences in the six official languages of the United Nations (Arabic, Chinese, English, French, Russian, Spanish) Ziemski et al. (2016). Other parallel corpora have been made from movie and TV subtitles, like the OpenSubtitles corpus (Lison and Tiedemann, 2016), or from general web text, like the ParaCrawl corpus of with 223 million sentence pairs between 23 EU languages and English extracted from the CommonCrawl Ban˜on et al.´ (2020).

## Sentence alignment

Standard training corpora for MT come as aligned pairs of sentences. When creating new corpora, for example for underresourced languages or new domains, these sentence alignments must be created. Fig. 11.15 gives a sample hypothetical sentence alignment.

<table><tr><td>E1: “Good morning,” said the little prince.</td><td>F1: -Bonjour, dit le petit prince.</td></tr><tr><td>E2: “Good morning,” said the merchant.</td><td>F2: -Bonjour, dit le marchand de pilules perfectionnées qui apaisent la soif.</td></tr><tr><td>E3: This was a merchant who sold pills that had been perfected to quench thirst.</td><td>F3: On en avale une par semaine et l&#x27;on n&#x27;éprouve plus le besoin de boire.</td></tr><tr><td>E4: You just swallow one pill a week and you won&#x27;t feel the need for anything to drink.</td><td>F4: -C&#x27;est une grosse économie de temps, dit le marchand.</td></tr><tr><td>E5: “They save a huge amount of time,” said the merchant.</td><td>F5: Les experts ont fait des calculs.</td></tr><tr><td>E6: “Fifty-three minutes a week.”</td><td>F6: On épargne cinquante-trois minutes par semaine.</td></tr><tr><td>E7: “If I had fifty-three minutes to spend?” said the little prince to himself.</td><td>F7: “Moi, se dit le petit prince, si j&#x27;avais cinquante-trois minutes à dépenser, je marcherais tout doucement vers une fontaine...”</td></tr><tr><td>E8: “I would take a stroll to a spring of fresh water”</td><td></td></tr></table>

Figure 11.15 A sample alignment between sentences in English and French, with sentences extracted from Antoine de Saint-Exupery’s Le Petit Prince and a hypothetical translation. Sentence alignment takes sentences $e_{1},..., e_{n},$ and $f_{1},..., f_{n}$ and finds minimal sets of sentences that are translations of each other, including single sentence mappings like $(\mathbf{e}_{1}, \mathbf{f}_{1}),(\mathbf{e}_{4}{-} \mathbf{f}_{3}),(\mathbf{e}_{5}{-} \mathbf{f}_{4}),(\mathbf{e}_{6}{-} \mathbf{f}_{6})$ as well as 2-1 alignments $(e_{2} / e_{3}, f_{2}),(e_{7} / e_{8}{\cdot} f_{7})$ , and null alignments (f<sub>5</sub>).

Given two documents that are translations of each other, we generally need two steps to produce sentence alignments:

- a cost function that takes a span of source sentences and a span of target sentences and returns a score measuring how likely these spans are to be translations.

- an alignment algorithm that takes these scores to find a good alignment between the documents.

Since it is possible to induce multilingual sentence embeddings (Artetxe and Schwenk, 2019), cosine similarity of such embeddings provides a natural scoring function (Schwenk, 2018). Thompson and Koehn (2019) give the following cost function between two sentences or spans x,y from the source and target documents respectively:

$$
c(x, y) = \frac{1 - \cos(x, y)) \mathrm{nSents}(x) \mathrm{nSents}(y)}{\sum_{s = 1}^{S} 1 - \cos(x, y_{s}) + \sum_{s = 1}^{S} 1 - \cos(x_{s}, y)}\tag{11.22}
$$

where nSents() gives the number of sentences (this biases the metric toward many alignments of single sentences instead of aligning very large spans). The denominator helps to normalize the similarities, and so $x_{1},..., x_{S}, y_{1},..., y_{S}$ , are randomly selected sentences sampled from the respective documents.

Usually dynamic programming is used as the alignment algorithm (Gale and Church, 1993), in a simple extension of the the minimum edit distance algorithm we introduced in Chapter 2.

Finally, it’s helpful to do some corpus cleanup by removing noisy sentence pairs. This can involve handwritten rules to remove low-precision pairs (for example removing sentences that are too long, too short, have different URLs, or even pairs that are too similar, suggesting that they were copies rather than translations). Or pairs can be ranked by their multilingual embedding cosine score and low-scoring pairs discarded.

## 11.7.3 Backtranslation

We’re often short of data for training MT models, since parallel corpora may be limited for particular languages or domains. However, often we can find a large monolingual corpus, to add to the smaller parallel corpora that are available.

Backtranslation is a way of making use of monolingual corpora in the target language by creating synthetic bitexts. In backtranslation, we train an intermediate target-to-source MT system on the small bitext to translate the monolingual target data to the source language. Now we can add this synthetic bitext (natural target sentences, aligned with MT-produced source sentences) to our training data, and retrain our source-to-target MT model. For example suppose we want to translate from Navajo to English but only have a small Navajo-English bitext, although of course we can find lots of monolingual English data. We use the small bitext to build an MT engine going the other way (from English to Navajo). Once we translate the monolingual English text to Navajo, we can add this synthetic Navajo/English bitext to our training data.

Backtranslation has various parameters. One is how we generate the backtranslated data; we can run the decoder in greedy inference, or use beam search. Or we can do sampling, or Monte Carlo search. In Monte Carlo decoding, at each timestep, instead of always generating the word with the highest softmax probability, we roll a weighted die, and use it to choose the next word according to its softmax probability. This works just like the sampling algorithm we saw in Chapter 3 for generating random sentences from n-gram language models. Imagine there are only 4 words and the softmax probability distribution at time t is (the: 0.6, green: 0.2, a: 0.1, witch: 0.1). We roll a weighted die, with the 4 sides weighted 0.6, 0.2, 0.1, and 0.1, and chose the word based on which side comes up. Another parameter is the ratio of backtranslated data to natural bitext data; we can choose to upsample the bitext data (include multiple copies of each sentence).

In general backtranslation works surprisingly well; one estimate suggests that a system trained on backtranslated text gets about 2/3 of the gain as would training on the same amount of natural bitext (Edunov et al., 2018).

## 11.8 MT Evaluation

Translations can be evaluated along two dimensions, adequacy and fluency.

adequacy: how well the translation captures the exact meaning of the source sentence. Sometimes called faithfulness or fidelity.

fluency: how fluent the translation is in the target language (is it grammatical, clear, readable, natural).

Both human and automatic evaluation metrics are used.

## 11.8.1 Using Human Raters to Evaluate MT

The most accurate evaluations use human raters to evaluate each translation along the two dimensions (often these raters are online crowdworkers hired specifically to

evaluate).

For example, along the dimension of fluency, we can ask how intelligible, how clear, how readable, or how natural the MT output (the target text) is. We can give the raters a scale, for example, from 1 (totally unintelligible) to 5 (totally intelligible, or 1 to 100, and ask them to rate each sentence or paragraph of the MT output.

We can do the same thing to judge the second dimension, adequacy, using raters to assign scores on a scale. If we have bilingual raters, we can give them the source sentence and a proposed target sentence, and rate, on a 5-point or 100-point scale, how much of the information in the source was preserved in the target. If we only have monolingual raters but we have a good human translation of the source text, we can give the monolingual raters the human reference translation and a target machine translation and again rate how much information is preserved. If we use a fine-grained enough scale, we can normalize raters by subtracting the mean from their scores and dividing by the variance.

An alternative is to do ranking: give the raters a pair of candidate translations, and ask them which one they prefer.

While humans produce the best evaluations of machine translation output, running a human evaluation can be time consuming and expensive. In the next section we introduce an automatic metric that, while less accurate than human evaluation, is widely used because it can quickly evaluate potential system improvements, or even be used as an automatic loss function for training.

## 11.8.2 Automatic Evaluation: BLEU

The most popular automatic metric for machine translation is called BLEU (for BiLingual Evaluation Understudy). BLEU (along with the many alternative metrics (e.g., NIST, TER, Precision and Recall, and METEOR) is based on a simple intuition derived from the pioneering work of Miller and Beebe-Center (1958): a good machine translation will tend to contain words and phrases that occur in a human translation of the same sentence.

Consider a test set from a parallel corpus, in which each source sentence has both a gold human target translation and a candidate MT translation we’d like to evaluate. The BLEU metric ranks each MT target sentence by function of the number of ngram overlaps with the human translation.

Figure 11.16 shows an intuition from two candidate translations of a Spanish source sentence, shown with a human reference translation. Note that Candidate 1 shares many more n-grams (in boxes) and especially longer n-grams (in darker boxes) with the reference translations than does Candidate 2.

The intuition in Fig. 11.16 shows a single sentence, but BLEU is actually not a score for a single sentence; it’s a score for an entire corpus of candidate translation sentences. More formally, the BLEU score for a corpus of candidate translation sentences is a function of the n-gram precision over all the sentences combined with a brevity penalty computed over the corpus as a whole.

What do we mean by n-gram precision? Consider a corpus composed of a single sentence. The unigram precision for this corpus is the percentage of unigram tokens in the candidate translation that also occur in the reference translation, and ditto for bigrams and so on, up to 4-grams. Candidate 1 in Fig. 11.16 has 19 unique unigrams, some of which occur multiple times, for a total of 26 tokens. Of these, 16 unique unigrams, totaling 23 tokens, also occur in the reference translation (3 don’t: voice, deposit, and actions). Thus the unigram precision for the Candidate 1 corpus is 23/26 = .88.

```txt
Source
la verdad, cuya madre es la historia, émula del tiempo, depósito de las acciones,
testigo de lo pasado, ejemplo y aviso de lo presente, advertencia de lo por venir.

Reference
truth, whose mother is history, rival of time, storehouse of deeds,
witness for the past, example and counsel for the present, and warning for the future.

Candidate 1
truth, whose mother is history, voice of time, deposit of actions,
witness for the past, example and warning for the present, and warning for the future

Candidate 2
the truth, which mother is the history, émula of the time, deposition of the shares,
witness of the past, example and notice of the present, warning of it for coming
```  
Figure 11.16 Intuition for BLEU: One of two candidate translations of a Spanish sentence shares more n-grams, and especially longer n-grams, with the reference human translation.

We extend this unigram metric to a whole corpus of many sentences as follows. For the numerator, we sum for each sentence the counts of all the unigram types that also occur in the reference translation, and then sum those counts over all sentences. The denominator is the total of the counts of all unigrams in all candidate sentences. We compute this n-gram precision for unigrams, bigrams, trigrams, and 4-grams. The n-gram precisions $\mathrm{prec}_{n}$ of a whole corpus of candidate sentences are thus:

$$
\operatorname{prec}_{n} = \frac{\sum_{c \in \{\text{Candidates}\}} \sum_{n - \text{gram} \in c} \operatorname{Count}_{\text{match}}(n - \text{gram})}{\sum_{c^{\prime} \in \{\text{Candidates}\}} \sum_{n - \text{gram}^{\prime} \in c^{\prime}} \operatorname{Count}(n - \text{gram}^{\prime})}\tag{11.23}
$$

BLEU combines these four n-gram precisions by taking their geometric mean.

In addition, BLEU penalizes candidate translations that are too short. Imagine our machine translation engine returned the following terrible candidate translation 3 for the example in Fig. 11.16:

## (11.24) for the

Because the words for and the and the bigram for the all appear in the human reference, n-gram precision alone will assign candidate 3 a great score, since it has perfect unigram and bigram precisions of 1.0!

One option for dealing with this problem is to combine recall with precision, but BLEU chooses another option: adding a brevity penalty over the whole corpus, penalizing a system that produces translations that are on average shorter than the reference translations. Let sys len be the sum of the length of all the candidate translation sentences, and ref len be the sum of the length of all the reference translation sentences. If the candidate translations are shorter than the reference, we assign a brevity penalty BP that is a function of their ratio:

$$
\begin{array}{rl} \mathrm{BP} & = \min \left(1, \exp \left(1 - \frac{\text{ref\_len}}{\text{sys\_len}}\right)\right) \\ \mathrm{BLEU} & = \mathrm{BP} \times \left(\prod_{n = 1}^{4} \operatorname{prec}_{n}\right)^{\frac{1}{4}} \end{array}\tag{11.25}
$$

## Advanced details of BLEU

The above description was simplified in a number of ways. BLEU actually uses a slightly different version of n-gram precision than the one in Eq. 11.23. Eq. 11.23 has a flaw that rewards candidates that have extra repeated words. Figure 11.17 shows an example of a pathological candidate sentence composed of 7 instances of the single word the, leading to a unigram precision of 7/7!

<table><tr><td>Candidate:</td><td>the</td><td>the</td><td>the</td><td>the</td><td>the</td><td>the</td><td>the</td></tr><tr><td>Reference 1:</td><td>the</td><td>cat</td><td>is</td><td>on</td><td>the</td><td>mat</td><td></td></tr><tr><td>Reference 2:</td><td>there</td><td>is</td><td>a</td><td>cat</td><td>on</td><td>the</td><td>mat</td></tr></table>

Figure 11.17 A pathological example showing why BLEU uses a modified precision metric. Unigram precision would be unreasonably high (7/7). Modified unigram precision is appropriately low (2/7).

To avoid this problem, BLEU uses a modified n-gram precision metric. We first count the maximum number of times a word is used in any single reference translation. The count of each candidate word is then clipped by this maximum reference count. Thus, the modified unigram precision in the example in Fig. 11.17 would be 2/7, since Reference 1 has a maximum of 2 thes.

To compute a score over the whole test set, BLEU first computes the N-gram matches for each sentence and sums the clipped counts over all the candidate sentences, then divides by the total number of candidate N-grams in the test set. If we define the function Count<sub>match</sub> <sub>clipped</sub> to mean “the clipped count of all n-grams that match the reference,” the real $\mathrm{prec}_{n}$ of a whole corpus of candidate sentences that BLEU uses are:

$$
\operatorname{prec}_{n} = \frac{\sum_{c \in \{\text{Candidates}\}} \sum_{n - \text{gram} \in c} \text{Count}_{\text{match\_clipped}}(n - \text{gram})}{\sum_{c^{\prime} \in \{\text{Candidates}\}} \sum_{n - \text{gram}^{\prime} \in c^{\prime}} \text{Count}(n - \text{gram}^{\prime})}\tag{11.26}
$$

BLEU also work fine if we have multiple human reference translations for a source sentence. In fact BLEU works better in this situation, since a source sentence can be legitimately translated in many ways and n-gram precision will hence be more robust. We just match an n-gram if it occurs in any of the references. And for the brevity penalty, we choose for each candidate sentence the reference sentence that is the closest in length to compute the ref len. But in practice most translation corpora only have a single human translation to compare against.

Finally, implementing BLEU requires standardizing on many details of smoothing and tokenization; for this reason it is recommended to use standard implementations like SACREBLEU (Post, 2018) rather than trying to implement BLEU from scratch.

## Statistical Significance Testing for BLEU

BLEU scores are mainly used to compare two systems, with the goal of answering questions like: did the special new algorithm we invented improve our MT system? To know if the difference between the BLEU scores of two MT systems is a significant difference, we use the paired bootstrap test, or the similar randomization test.

To get a confidence interval on a single BLEU score using the bootstrap test, recall from Section 4.9 that we take our test set (or devset) and create thousands of pseudo-testsets by repeatedly sampling with replacement from the original test set. We now compute the BLEU score of each of the pseudo-testsets. If we drop the top 2.5% and bottom 2.5% of the scores, the remaining scores will give us the 95% confidence interval for the BLEU score of our system.

To compare two MT systems A and B, we draw the same set of pseudo-testsets, and compute the BLEU scores for each of them. We then compute the percentage of pseudo-test-sets in which A has a higher BLEU score than B.

## BLEU: Limitations

While automatic metrics like BLEU are useful, they have important limitations. BLEU is very local: a large phrase that is moved around might not change the BLEU score at all, and BLEU can’t evaluate cross-sentence properties of a document like its discourse coherence (Chapter 22). BLEU and similar automatic metrics also do poorly at comparing very different kinds of systems, such as comparing human-aided translation against machine translation, or different machine translation architectures against each other (Callison-Burch et al., 2006). Such automatic metrics are probably most appropriate when evaluating changes to a single system.

## 11.8.3 Automatic Evaluation: Embedding-Based Methods

The BLEU metric is based on measuring the exact word or n-grams a human reference and candidate machine translation have in common. However, this criterion is overly strict, since a good translation may use alternate words or paraphrases. A solution pioneered in early metrics like METEOR (Banerjee and Lavie, 2005) was to allow synonyms to match between the reference x and candidate ˜x. More recent metrics use BERT or other embeddings to implement this intuition.

For example, in some situations we might have datasets that have human assessments of translation quality. Such datasets consists of tuples $(x, \tilde{x}, r)$ , where $x =(x_{1}, \ldots, x_{n})$ is a reference translation, $\tilde{x} =(\tilde{x}_{1}, \dots, \tilde{x}_{m})$ is a candidate machine translation, and $r \in \mathbb{R}$ is a human rating that expresses the quality of ˜x with respect to x. Given such data, algorithms like BLEURT (Sellam et al., 2020) train a predictor on the human-labeled datasets, by passing x and ˜x through a version of BERT (trained with extra pretraining, and then fine-tuned on the human-labeled sentences), followed by a linear layer that is trained to predict $r_{\ast}$ The output of such models correlates highly with human labels.

In other cases, however, we don’t have such human-labeled datasets. In that case we can measure the similarity of x and ˜x by the similarity of their embeddings. The BERTSCORE algorithm (Zhang et al., 2020) shown in Fig. 11.18, for example, passes the reference x and the candidate ˜x through BERT, computing a BERT embedding for each token $x_{i}$ and $\tilde{x}_{j}.$ . Each pair of tokens $(x_{i}, \tilde{x}_{j})$ is scored by its cosine $\frac{x_{i}{\cdot} \tilde{x}_{j}}{| x_{i} | | \tilde{x}_{j} |}$ . Each token in x is matched to a token in ˜x to compute recall, and each token in x˜ is matched to a token in x to compute precision (with each token greedily matched to the most similar token in the corresponding sentence). BERTSCORE provides precision and recall (and hence $\mathrm{F}_{1})$ ):

$$
R_{\text{BERT}} = \frac{1}{| x |} \sum_{x_{i} \in x} \max_{\tilde{x}_{j} \in \tilde{x}} x_{i} \cdot \tilde{x}_{j} \quad P_{\text{BERT}} = \frac{1}{| \tilde{x} |} \sum_{\tilde{x}_{j} \in \tilde{x}} \max_{x_{i} \in x} x_{i} \cdot \tilde{x}_{j}\tag{11.27}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/6842337997fe71191cf66c3485508baa1f1a6e9f1eacef8e7f50749836d1629b.jpg)  
<sup>BERT</sup>     Figure 11.18 The computation of BERTSCORE recall from reference x and candidate ˆx, <sub>matching in red, and include the optional idf importance weighting.</sub>from Figure 1 in Zhang et al. (2020). This version shows an extended version of the metric in which tokens are also weighted by their idf values.

## 11.9 Bias and Ethical Issues

Machine translation raises many of the same ethical issues that we’ve discussed in earlier chapters. For example, consider MT systems translating from Hungarian (which has the gender neutral pronoun ő) or Spanish (which often drops pronouns) into English (in which pronouns are obligatory, and they have grammatical gender). When translating a reference to a person described without specified gender, MT systems often default to male gender (Schiebinger 2014, Prates et al. 2019). And MT systems often assign gender according to culture stereotypes of the sort we saw in Section 6.11. Fig. 11.19 shows examples from (Prates et al., 2019), in which Hungarian gender-neutral ő is a nurse is translated with she, but gender-neutral ő is a CEO is translated with he. Prates et al. (2019) find that these stereotypes can’t completely be accounted for by gender bias in US labor statistics, because the biases are amplified by MT systems, with pronouns being mapped to male or female gender with a probability higher than if the mapping was based on actual labor employment statistics.

<table><tr><td>Hungarian (gender neutral) source</td><td>English MT output</td></tr><tr><td>ő egy ápoló</td><td>she is a nurse</td></tr><tr><td>ő egy tudós</td><td>he is a scientist</td></tr><tr><td>ő egy mérnök</td><td>he is an engineer</td></tr><tr><td>ő egy pék</td><td>he is a baker</td></tr><tr><td>ő egy tanár</td><td>she is a teacher</td></tr><tr><td>ő egy vesküvőszervező</td><td>she is a wedding organizer</td></tr><tr><td>ő egy vezérigazgató</td><td>he is a CEO</td></tr></table>

<sup>·</sup>                Figure 11.19 When translating from gender-neutral languages like Hungarian into English, current MT systems interpret people from traditionally male-dominated occupations as male, <sub>x x</sub> idf(xi) maxxˆ<sub>j2</sub>xˆ x<sup>></sup><sub>i</sub> ˆxjand traditionally female-dominated occupations as female (Prates et al., 2019).

Similarly, a recent challenge set, the WinoMT dataset (Stanovsky et al., 2019) evaluated on a specific test set. We apply plus-one smoothing to handle unknown word pieces.shows that MT systems perform worse when they are asked to translate sentences that describe people with non-stereotypical gender roles, like “The doctor asked the nurse to help her in the operation”.

Many open ethical issues in MT require further research. One is the need for better metrics for knowing what our systems don’t know. MT systems can be used in urgent situations where human translators may be unavailable or delayed: in medical domains, to help translate when patients and doctors don’t speak the same language, or in legal domains, to help judges or lawyers communicate with witnesses or defendants. In order to ‘do no harm’, systems need ways to assign confidence values to candidate translations, so they can abstain from giving incorrect translations that may cause harm.

Another is the need for low-resource algorithms that can do translation to and from the vast majority of the world’s languages, which do not have large parallel texts available for training. This problem is exacerbated by the fact that cross-lingual transfer and multilingual approaches to MT tend to focus on the case where one of the languages is English (Anastasopoulos and Neubig, 2020). et al. (2020) propose a participatory design process to encourage content creators, curators, and language technologists who speak these low-resourced languages to participate in development of MT algorithms. Their method uses online groups, mentoring, and online infrastructure, and they report on a case study on developing MT algorithms for low-resource African languages.

## 11.10 Summary

Machine translation is one of the most widely used applications of NLP, and the encoder-decoder model, first developed for MT is a key tool that has applications throughout NLP.

- Languages have divergences, both structural and lexical, that make translation difficult.

- The linguistic field of typology investigates some of these differences; languages can be classified by their position along typological dimensions like whether verbs precede their objects.

- Encoder-decoder networks are composed of an encoder network that takes an input sequence and creates a contextualized representation of it, the context. This context representation is then passed to a decoder which generates a task-specific output sequence.

- The attention mechanism enriches the context vector to allowing the decoder to view information from all the hidden states of the encoder, not just the last hidden state.

- The encoder-decoder architecture can be implemented by RNNs or by Transformers.

- For the decoder, choosing the single most probable token to generate at each step is called greedy decoding.

- In beam search, instead of choosing the best token to generate at each timestep, we keep k possible tokens at each step. This fixed-size memory footprint k is called the beam width.

- Machine translation models are trained on a parallel corpus, sometimes called a bitext, a text that appears in two (or more) languages.

- Backtranslation is a way of making use of monolingual corpora in the target language by running a pilot MT engine backwards to create synthetic bitexts.

- MT is evaluated by measuring a translation’s adequacy (how well it captures the meaning of the source sentence) and fluency (how fluent or natural it is in the target language). Human evaluation is the gold standard, but automatic evaluation metrics like BLEU, which measure word or n-gram overlap with human translations, or more recent metrics based on embedding similarity, are also commonly used.

## Bibliographical and Historical Notes

MT was proposed seriously by the late 1940s, soon after the birth of the computer (Weaver, 1955). In 1954, the first public demonstration of an MT system prototype (Dostert, 1955) led to great excitement in the press (Hutchins, 1997). The next decade saw a great flowering of ideas, prefiguring most subsequent developments. But this work was ahead of its time—implementations were limited by, for example, the fact that pending the development of disks there was no good way to store dictionary information.

As high-quality MT proved elusive (Bar-Hillel, 1960), there grew a consensus on the need for better evaluation and more basic research in the new fields of formal and computational linguistics. This consensus culminated in the famous ALPAC (Automatic Language Processing Advisory Committee) report of 1966 (Pierce et al., 1966) that led in the mid 1960s to a dramatic cut in funding for MT in the US. As MT research lost academic respectability, the Association for Machine Translation and Computational Linguistics dropped MT from its name. Some MT developers, however, persevered, and there were early industrial engines like Systran, as well as early MT systems like Met´ eo, which translated weather forecasts from English to´ French (Chandioux, 1976).

In early years, the space of MT architectures spanned three general models. In perhaps the earliest developed method, direct translation, the system proceeds word-by-word through the source-language text, translating each word incrementally. Direct translation uses a large bilingual dictionary, each of whose entries is a small program with the job of translating one word. In transfer approaches, we first parse the input text and then apply rules to transform the source-language parse into a target language parse. We then generate the target language sentence from the parse tree. In interlingua approaches, we analyze the source language text into some abstract meaning representation, called an interlingua. We then generate into the target language from this interlingual representation. A common way to visualize these three early approaches was the Vauquois triangle shown in Fig. 11.20. The triangle shows the increasing depth of analysis required (on both the analysis and generation end) as we move from the direct approach through transfer approaches to interlingual approaches. In addition, it shows the decreasing amount of transfer knowledge needed as we move up the triangle, from huge amounts of transfer at the direct level (almost all knowledge is transfer knowledge for each word) through transfer (transfer rules only for parse trees or thematic roles) through interlingua (no specific transfer knowledge). We can view the encoder-decoder network as an interlingual approach, with attention acting as an integration of direct and transfer, allowing words or their representations to be directly accessed by the decoder.

Statistical methods began to be applied around 1990, enabled first by the development of large bilingual corpora like the Hansard corpus of the proceedings of the Canadian Parliament, which are kept in both French and English, and then by the growth of the Web. Early on, a number of researchers showed that it was possible to extract pairs of aligned sentences from bilingual corpora, using words or simple cues like sentence length (Kay and Roscheisen 1988¨ , Gale and Church 1991, Gale and Church 1993, Kay and Roscheisen 1993¨ ).

At the same time, the IBM group, drawing directly on the noisy channel model for speech recognition, proposed algorithms for statistical MT, algorithms that became known as IBM Models 1 through 5, implemented in the Candide system.

![Figure 11.20](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/52475950d55e70c6e782b0d8c11178bb0c912ac7513557254434c0cfebcc3864.jpg)  
Figure 11.20 The Vauquois (1968) triangle.

The algorithms (except for the decoder) were published in full detail— encouraged by the US government which had partially funded the work— which gave them a huge impact on the research community (Brown et al. 1990, Brown et al. 1993). By the turn of the century, most academic research on machine translation used the statistical noisy channel model. Progress was made hugely easier by the development of publicly available toolkits, like the GIZA toolkit (Och and Ney, 2003) which implements IBM models 1–5 as well as the HMM alignment model.

Around the turn of the century, an extended approach, called phrase-based translation was developed, which was based on inducing translations for phrasepairs (Och 1998, Marcu and Wong 2002, Koehn et al. (2003), Och and Ney 2004, Deng and Byrne 2005, inter alia). A log linear formulation (Och and Ney, 2004) was trained to directly optimize evaluation metrics like BLEU in a method known as Minimum Error Rate Training, or MERT (Och, 2003), also drawing from speech recognition models (Chou et al., 1993). Popular toolkits were developed like Moses (Koehn et al. 2006, Zens and Ney 2007).

There were also approaches around the turn of the century that were based on syntactic structure (Chapter 12). Models based on transduction grammars (also called synchronous grammars assign a parallel syntactic tree structure to a pair of sentences in different languages, with the goal of translating the sentences by applying reordering operations on the trees. From a generative perspective, we can view a transduction grammar as generating pairs of aligned sentences in two languages. Some of the most widely used models included the inversion transduction grammar (Wu, 1996) and synchronous context-free grammars (Chiang, 2005),

## MODERN HISTORY OF encoder-decoder approach HERE; (Kalchbrenner and Blunsom, 2013), (Cho et al., 2014), (Sutskever et al., 2014), etc

Beam-search has an interesting relationship with human language processing; (Meister et al., 2020) show that beam search enforces the cognitive property of uniform information density in text. Uniform information density is the hypothesis that human language processors tend to prefer to distribute information equally across the sentence (Jaeger and Levy, 2007).

Research on evaluation of machine translation began quite early. Miller and Beebe-Center (1958) proposed a number of methods drawing on work in psycholinguistics. These included the use of cloze and Shannon tasks to measure intelligibility as well as a metric of edit distance from a human translation, the intuition that underlies all modern automatic evaluation metrics like BLEU. The ALPAC report included an early evaluation study conducted by John Carroll that was extremely influential (Pierce et al., 1966, Appendix 10). Carroll proposed distinct measures for fidelity and intelligibility, and had raters score them subjectively on 9-point scales.

More recent work on evaluation has focused on coming up with automatic metrics, include the work on BLEU discussed in Section 11.8.2 (Papineni et al., 2002), as well as related measures like NIST (Doddington, 2002), TER (Translation Error Rate) (Snover et al., 2006), Precision and Recall (Turian et al., 2003), and ME-TEOR (Banerjee and Lavie, 2005).

Good surveys of the early history of MT are Hutchins (1986) and (1997). Nirenburg et al. (2002) is a collection of early readings in MT.

See Croft (1990) or Comrie (1989) for introductions to typology.

## Exercises


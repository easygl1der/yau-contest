---
title: "Chapter 6 \u2014 Features for Textual Data"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 6
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 1610
source_line_end: 1786
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 3
source_empty_image_alt: 3
non_semantic_image_alt: 3
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

# Chapter 6 — Features for Textual Data

> [[../README|本书目录]] · [[05-chapter-5-neural-network-training|上一章]] · [[07-chapter-7-case-studies-of-nlp-features|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 1610–1786。
> - 本章保留 3 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## Features for Textual Data

In the previous chapters we discussed the general learning problem, and saw some machine learning models and algorithms for training them. All of these models take as input vectors x and produce predictions. Up until now we assumed the vectors x are given. In language processing, the vectors x are derived from textual data, in order to reflect various linguistic properties of the text. The mapping from textual data to real valued vectors is called feature extraction or feature representation, and is done by a feature function. Deciding on the right features is an integral part of a successful machine learning project. While deep neural networks alleviate a lot of the need in feature engineering, a good set of core features still needs to be defined. This is especially true for language data, which comes in the form of a sequence of discrete symbols. This sequence needs to be converted somehow to a numerical vector, in a non-obvious way.

We now diverge from the training machinery in order to discuss the feature functions that are used for language data, which will be the topic of the next few chapters.

This chapter provides an overview of the common kinds of information sources that are available for use as features when dealing with textual language data. Chapter 7 discusses feature choices for some concrete NLP problems. Chapter 8 deals with encoding the features as input vectors that can be fed to a neural network.

## 6.1 TYPOLOGY OF NLP CLASSIFICATION PROBLEMS

Generally speaking, classification problems in natural language can be categorized into several broad categories, depending on the item being classified (some problems in natural language processing do not fall neatly into the classification framework. For example, problems in which we are required to produce sentences or longer texts—i.e., in document summarization and machine translation. These will be discussed in Chapter 17).

Word In these problems, we are faced with a word, such as “dog,” “magnificent,” “magnificent,” or “parlez” and need to say something about it: Does it denote a living thing? What language is it in? How common is it? What other words are similar to it? Is it a mis-spelling of another word? And so on. These kind of problems are actually quite rare, as words seldom appear in isolation, and for many words their interpretation depends on the context in which they are used.

Texts In these problems we are faced with a piece of text, be it a phrase, a sentence, a paragraph or a document, and need to say something about it. Is it spam or not? Is it about politics or

## 66 6. FEATURES FOR TEXTUAL DATA

sports? Is it sarcastic? Is it positive, negative or neutral (toward some issue)? Who wrote it? Is it reliable? Which of a fixed set of intents does this text reflect (or none)? Will this text be liked by 16–18 years old males? And so on. These types of problems are very common, and we'll refer to them collectively as document classification problems.

Paired Texts In these problems we are given a pair of words or longer texts, and need to say something about the pair. Are words A and B synonyms? Is word A a valid translation for word B? Are documents A and B written by the same author? Can the meaning of sentence A be inferred from sentence B?

Word in Context Here, we are given a piece of text, and a particular word (or phrase, or letter, etc.) within it, and we need to classify the word in the context of the text. For example, is the word book in I want to book a flight a noun, a verb or an adjective? Is the word apple in a given context referring to a company or a fruit? Is on the right preposition to use in I read a book on London? Does a given period denote a sentence boundary or an abbreviation? Is the given word part of a name of a person, location, or organization? And so on. These types of questions often arise in the context of larger goals, such as annotating a sentence for parts-of-speech, splitting a document into sentences, finding all the named entities in a text, finding all documents mentioning a given entity, and so on.

Relation between two words Here we are given two words or phrases within the context of a larger document, and need to say something about the relations between them. Is word A the subject of verb B in a given sentence? Does the “purchase” relation hold between words A and B in a given text? And so on.

Many of these classification cases can be extended to structured problems in which we are interested in performing several related classification decisions, such that the answer to one decision can influence others. These are discussed in Chapter 19.

What is a word? We are using the term word rather loosely. The question "what is a word?" is a matter of debate among linguists, and the answer is not always clear.

One definition (which is the one being loosely followed in this book) is that words are sequences of letters that are separated by whitespace. This definition is very simplistic. First, punctuation in English is not separated by whitespace, so according to our definition dog, dog?, dog. and dog) are all different words. Our corrected definition is then words separated by whitespace or punctuation. A process called tokenization is in charge of splitting text into tokens (what we call here words) based on whitespace and punctuation. In English, the job of the tokenizer is quite simple, although it does need to consider cases such as abbreviations (I.B.M) and titles (Mr.) that needn't be split. In other languages, things can become much tricker: in Hebrew and Arabic some words attach to the next one without whitespace, and in Chinese there are no whitespaces at all. These are just a few examples.

When working in English or a similar language (as this book assumes), tokenizing on whitespace and punctuation (while handling a few corner cases) can provide a good approximation of words. However, our definition of word is still quite technical: it is derived from the way things are written. Another common (and better) definition take a word to be "the smallest unit of meaning." By following this definition, we see that our whitespace-based definition is problematic. After splitting by whitespace and punctuation, we still remain with sequences such as don't, that are actually two words, do not, that got merged into one symbol. It is common for English tokenizers to handle these cases as well. The symbols cat and Cat have the same meaning, but are they the same word? More interestingly, take something like New York, is it two words, or one? What about ice cream? Is it the same as ice-cream or icecream? And what about idioms such as kick the bucket?

In general, we distinguish between words and tokens. We refer to the output of a tokenizer as a token, and to the meaning-bearing units as words. A token may be composed of multiple words, multiple tokens can be a single word, and sometimes different tokens denote the same underlying word.

Having said that, in this book, we use the term word very loosely, and take it to be interchangeable with token. It is important to keep in mind, however, that the story is more complex than that.

## 6.2 FEATURES FOR NLP PROBLEMS

In what follows, we describe the common features that are used for the above problems. As words and letters are discrete items, our features often take the form of indicators or counts. An indicator feature takes a value of 0 or 1, depending on the existence of a condition (e.g., a feature taking the value of 1 if the word dog appeared at least once in the document, and 0 otherwise). A count takes a value depending on the number of times some event occurred, e.g., a feature indicating the number of times the word dog appears in the text.

## 6.2.1 DIRECTLY OBSERVABLE PROPERTIES

Features for Single Words When our focus entity is a word outside of a context, our main source of information is the letters comprising the word and their order, as well as properties derived from these such as the length of the word, the orthographic shape of the word (Is the first letter capitalized? Are all letters capitalized? Does the word include a hyphen? Does it include a digit? And so on), and prefixes and suffixes of the word (Does it start with un? Does it end with ing?).

We may also look at the word with relation to external sources of information: How many times does the word appear in a large collection of text? Does the word appear in a list of common person names in the U.S.? And so on.

Lemmas and Stems We often look at the lemma (the dictionary entry) of the word, mapping forms such as booking, booked, books to their common lemma book. This mapping is usually per-

## 68 6. FEATURES FOR TEXTUAL DATA

formed using lemma lexicons or morphological analyzers, that are available for many languages. The lemma of a word can be ambiguous, and lemmatizing is more accurate when the word is given in context. Lemmatization is a linguistically defined process, and may not work well for forms that are not in the lemmatization lexicon, or for mis-spelling. A coarser process than lemmatization, that can work on any sequence of letters, is called stemming. A stemmer maps sequences of words to shorter sequences, based on some language-specific heuristics, such that different inflections will map to the same sequence. Note that the result of stemming need not be a valid word: picture and pictures and pictured will all be stemmed to pictur. Various stemmers exist, with different levels of aggressiveness.

Lexical Resources An additional source of information about word forms are lexical resources. These are essentially dictionaries that are meant to be accessed programmatically by machines rather than read by humans. A lexical resource will typically contain information about words, linking them to other words and/or providing additional information.

For example, for many languages there are lexicons that map inflected word forms to their possible morphological analyses (i.e., telling you that a certain word may be either a plural feminine noun or a past-perfect verb). Such lexicons will typically also include lemma information.

A very well-known lexical resource in English is WordNet [Fellbaum, 1998]. WordNet is a very large manually curated dataset attempting to capture conceptual semantic knowledge about words. Each word belongs to one or several synsets, where each synsets describes a cognitive concept. For example, the word star as a noun belongs to the synsets astronomical celestial body, someone who is dazzlingly skilled, any celestial body visible from earth and an actor who plays a principle role, among others. The second synset of star contains also the words ace, adept, champion, sensation, maven, virtuoso, among others. Synsets are linked to each other by means of semantic relations such as hypernymy and hyponymy (more specific or less specific words). For example, for the first synset of star these would include sun and nova (hyponyms) and celestial body (hypernym). Other semantic relations in WordNet contain antonyms (opposite words) and holonyms and meronyms (part-whole and whole-part relations). WordNet contains information about nouns, verbs, adjectives, and adverbs.

FrameNet [Fillmore et al., 2004] and VerbNet [Kipper et al., 2000] are manually curated lexical resources that focus around verbs, listing for many verbs the kinds of argument they take (i.e., that giving involves the core arguments DONOR, RECIPIENT, and THEME (the thing that is being given), and may have non-core arguments such as TIME, PURPOSE, PLACE, and MANNER, among others.

The Paraphrase Database (PPDB) [Ganitkevitch et al., 2013, Pavlick et al., 2015] is a large, automatically created dataset of paraphrases. It lists words and phrases, and for each one provides a list of words and phrases that can be used to mean roughly the same thing.

Lexical resources such as these contain a lot of information, and can serve a good source of features. However, the means of using such symbolic information effectively is task dependent, and often requires non-trivial engineering efforts and/or ingenuity. They are currently not often used in neural network models, but this may change.

Distributional Information Another important source of information about words is distributional—which other words behave similar to it in the text? These deserve their own separate treatment, and are discussed in Section 6.2.5 below. In Section 11.8, we discuss how lexical resources can be used to inject knowledge into distributional word vectors that are derived from neural network algorithms.

Features for Text When we consider a sentence, a paragraph, or a document, the observable features are the counts and the order of the letters and the words within the text.

Bag of words A very common feature extraction procedures for sentences and documents is the bag-of-words approach (BOW). In this approach, we look at the histogram of the words within the text, i.e., considering each word count as a feature. By generalizing from words to “basic elements,” the bag-of-letter-bigrams we used in the language identification example in Section 2.3.1 is an example of the bag-of-words approach.

We can also compute quantities that are directly derived from the words and the letters, such as the length of the sentence in terms of number of letters or number of words. When considering individual words, we may of course use the word-based features from above, counting for example the number of words in the document that have a specific prefix or suffix, or compute the ratio of short words (with length below a given length) to long words in a document.

Weighting As before, we can also integrate statistics based on external information, focusing for example on words that appear many times in the given document, yet appear relatively few times in an external set of documents (this will distinguish words that have high counts in the documents because they are generally common, like $a$ and for from words that have a high count because they relate to the document's topic). When using the bag-of-words approach, it is common to use TF-IDF weighting [Manning et al., 2008, Chapter 6]. Consider a document $d$ which is part of a larger corpus $D$ . Rather than representing each word $w$ in $d$ by its normalized count in the document $\frac{\#_d(w)}{\sum_{w' \in d} \#_d(w')}$ (the Term Frequency), TF-IDF weighting represent it instead by $\frac{\#_d(w)}{\sum_{w' \in d} \#_d(w')} \times \log \frac{|D|}{|\{d \in D : w \in d\}|}$ . The second term is the Inverse Document Frequency: the inverse of the number of distinct documents in the corpus in which this word occurred. This highlights words that are distinctive of the current text.

Besides words, one may also look at consecutive pairs or triplets of words. These are called ngrams. Ngram features are discussed in depth in Section 6.2.4.

Features of Words in Context When considering a word within a sentence or a document, the directly observable features of the word are its position within the sentence, as well as the words or letters surrounding it. Words that are closer to the target word are often more informative about it than words that are further apart. $^{1}$

## 6. FEATURES FOR TEXTUAL DATA

Windows For this reason, it is often common to focus on the immediate context of a word by considering a window surrounding it (i.e., k words to each side, with typical values of k being 2, 5, and 10), and take the features to be the identities of the words within the window (e.g., a feature will be “word X appeared within a window of five words surrounding the target word”). For example, consider the sentence the brown fox jumped over the lazy dog, with the target word jumped. A window of 2 words to each side will produce the set of features { word=brown, word=fox, word=over, word=the }. The window approach is a version of the bag-of-words approach, but restricted to items within the small window.

The fixed size of the window gives the opportunity to relax the bag-of-word assumption that order does not matter, and take the relative positions of the words in the window into account. This results in relative-positional features such as “word X appeared two words to the left of the target word.” For example, in the example above the positional window approach will result in the set of features {word-2=brown, word-1=fox, word+1=over, word+2=the}.

Encoding of window-based features as vectors is discussed in Section 8.2.1. In Chapters 14 and 16 we will introduce the biRNN architecture, that generalizes window features by providing a flexible, adjustable, and trainable window.

Position Besides the context of the word, we may be interested in its absolute position within a sentence. We could have features such as “the target word is the 5th word in the sentence,” or a binned version indicating more coarse grained categories: does it appear within the first 10 words, between word 10 and 20, and so on.

Features for Word Relations When considering two words in context, besides the position of each one and the words surrounding them, we can also look at the distance between the words and the identities of the words that appear between them.

## 6.2.2 INFERRED LINGUISTIC PROPERTIES

Sentences in natural language have structures beyond the linear order of their words. The structure follows an intricate set of rules that are not directly observable to us. These rules are collectively referred to as syntax, and the study of the nature of these rules and regularities in natural language is the study-object of linguistics. $^{2}$ While the exact structure of language is still a mystery, and rules governing many of the more intricate patterns are either unexplored or still open for debate among linguists, a subset of phenomena governing language are well documented and well understood. These include concepts such as word classes (part-of-speech tags), morphology, syntax, and even parts of semantics.

While the linguistic properties of a text are not observable directly from the surface forms of words in sentences and their order, they can be inferred from the sentence string with varying degrees of accuracy. Specialized systems exist for the prediction of parts of speech, syntactic trees, semantic roles, discourse relations, and other linguistic properties with various degrees of accuracy, $^{3}$ and these predictions often serve as good features for further classification problems.

Linguistic Annotation Let's explore some forms of linguistic annotations. Consider the sentence the boy with the black shirt opened the door with a key. One level of annotation assigns to each word its part of speech:

the boy with the black shirt opened the door with a key
DET NOUN PREP DET ADJ NOUN VERB DET NOUN PREP DET NOUN

Going further up the chain, we mark syntactic chunk boundaries, indicating the the boy is a noun phrase.

$[_{NP}$ the boy $[_{PP}$ with $[_{NP}$ the black shirt $[_{VP}$ opened $[_{NP}$ the door $[_{PP}$ with $[_{NP}$ a key]

Note that the word opened is marked as a verbal-chunk (VP). This may not seem very useful because we already know its a verb. However, VP chunks may contain more elements, covering also cases such as will opened and did not open.

The chunking information is local. A more global syntactic structure is a constituency tree, also called a phrase-structure tree:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/2dc3783e03a1d542b8adadb901e69f646c98ed93008ae934d38cefc42171c04e.jpg)

Constituency trees are nested, labeled bracketing over the sentence, indicating the hierarchy of syntactic units: the noun phrase the boy with the black shirt is made of the noun

## 72 6. FEATURES FOR TEXTUAL DATA

phrase the boy and the preposition phrase (PP) with the black shirt. The latter itself contains the noun phrase the black shirt. Having with a key nested under the VP and not under the NP the door signals that with a key modifies the verb opened (opened with a key) rather than the NP (a door with a key).

A different kind of syntactic annotation is a dependency tree. Under dependency syntax, each word in the sentence is a modifier of another word, which is called its head. Each word in the sentence is headed by another sentence word, except for the main word, usually a verb, which is the root of the sentence and is headed by a special "root" node.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/6d5a500a7cd8d98e67f93ad579cd235fbbf621e800377efdb92fbc9a0d6133ee.jpg)

While constituency trees make explicit the grouping of words into phrases, dependency trees make explicit the modification relations and connections between words. Words that are far apart in the surface form of the sentence may be close in its dependency tree. For example, boy and opened have four words between them in the surface form, but have a direct nsubj edge connecting them in the dependency tree.

The dependency relations are syntactic: they are concerned with the structure of the sentence. Other kinds of relations are more semantic. For example, consider the modifiers of the verb open, also called the arguments of the verb. The syntactic tree clearly marks the boy (with the black shirt), the door, and with a key as arguments, and also tells us that with a key is an argument of open rather than a modifier of door. It does not tell us, however, what are the semantic-roles of the arguments with respect to the verb, i.e., that the boy is the AGENT performing the action, and that a key is an INSTRUMENT (compare that to the boy opened the door with a smile. Here, the sentence will have the same syntactic structure, but, unless we are in a magical-world, a smile is a MANNER rather than an INSTRUMENT. The semantic role labeling annotations reveal these structures:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/63b22f451b3cee56fcb84a19ae62683cf5cc1f305fe8c4a5e0a64144c4b42dfd.jpg)

Besides the observable properties (letters, words, counts, lengths, linear distances, frequencies, etc.), we can also look such inferred linguistic properties of words, sentences, and documents. For example, we could look at the part-of-speech tag (POS) of a word within a document (Is it a noun, a verb, adjective, or a determiner?), the syntactic role of a word (Does it serve as a subject or an object of a verb? Is it the main verb of the sentence? Is it used as an adverbial modifier?), or the semantic role of it (e.g., in “the key opened the door,” key acts as an INSTRUMENT, while in “the boy opened the door” boy is an AGENT). When given two words in a sentence, we can consider the syntactic dependency tree of the sentence, and the subtree or paths that connect the two words within the this tree, as well as properties of that path. Words that are far apart in the sentence in terms of the number of words separating them can be close to each other in the syntactic structure.

When moving beyond the sentence, we may want to look at the discourse relations that connect sentences together, such as ELABORATION, CONTRADICTION, CAUSE EFFECT, and so on. These relations are often expressed by discourse-connective words such as moreover, however, and and, but are also expressed with less direct cues.

Another important phenomena is that of anaphora—consider the sentence sequence the boy opened the door with a key. It $_{1}$ wasn't locked and he $_{1}$ entered the room. He $_{2}$ saw a man. He $_{3}$ was smiling. Anaphora resolution (also called coreference resolution) will tell us that It $_{1}$ refers to the door (and not the key or the boy), he $_{2}$ refers to the boy and he $_{3}$ is likely to refer to the man.

Part of speech tags, syntactic roles, discourse relations, anaphora, and so on are concepts that are based on linguistic theories that were developed by linguists over a long period of time, with the aim of capturing the rules and regularities in the very messy system of the human language. While many aspects of the rules governing language are still open for debate, and others may seem overly rigid or simplistic, the concepts explored here (and others) do indeed capture a wide and important array of generalizations and regularities in language.

Are linguistic concepts needed? Some proponents of deep-learning argue that such inferred, manually designed, linguistic properties are not needed, and that the neural network will learn these intermediate representations (or equivalent, or better ones) on its own. The jury is still out on this. My current personal belief is that many of these linguistic concepts can indeed be inferred by

## 74 6. FEATURES FOR TEXTUAL DATA

the network on its own if given enough data and perhaps a push in the right direction. $^{4}$ However, for many other cases we do not have enough training data available for the task we care about, and in these cases providing the network with the more explicit general concepts can be very valuable. Even if we do have enough data, we may want to focus the network on certain aspects of the text and hint to it that it should ignore others, by providing the generalized concepts in addition to, or even instead of, the surface forms of the words. Finally, even if we do not use these linguistic properties as input features, we may want to help guide the network by using them as additional supervision in a multi-task learning setup (see Chapter 20) or by designing network architecture or training paradigms that are more suitable for learning certain linguistic phenomena. Overall, we see enough evidence that the use of linguistic concepts help improve language understanding and production systems.

Further Reading When dealing with natural language text, it is well advised to be aware of the linguistic concepts beyond letters and words, as well as of the current computational tools and resources that are available. This book barely scratches the surface on this topic. The book of Bender [2013] provides a good and concise overview of linguistic concepts directed at computational-minded people. For a discussion on current NLP methods, tools, and resources see the book by Jurafsky and Martin [2008] as well as the various specialized titles in this series. $^{5}$

## 6.2.3 CORE FEATURES VS. COMBINATION FEATURES

In many cases, we are interested in a conjunction of features occurring together. For example, knowing that the two indicators “the word book appeared in a window” and “the part-of-speech VERB appeared in a window” is strictly less informative than knowing “the word book with the assigned part of speech VERB appeared in a window.” Similarly, if we assign a distinct parameter weight for each indicator feature (as is the case in linear models), then knowing that the two distinct features “word in position -1 is like,” “word in position -2 is not” occur is almost useless compared to the very indicative combined indicator “word in position -1 is like and word in position -2 is not.” Similarly, knowing that a document contains the word Paris is an indication toward the document being in the TRAVEL category, and the same holds for the word Hilton. However, if the document contains both words, it is an indication away from the TRAVEL category and toward the CELEBRITY or GOSPIP categories.

Linear models cannot assign a score to a conjunction of events (X occurred and Y occurred and ...) that is not a sum of their individual scores, unless the conjunction itself is modeled as its own feature. Thus, when designing features for a linear model, we must define not only the core features but also many combination features. $^{6}$ The set of possible combination is very large, and human expertise, coupled with trial and error, is needed in order to construct a set of combinations that is both informative and relatively compact. Indeed, a lot of effort has gone into design decisions such as “include features of the form word at position -1 is X and at position +1 is Y but do not include features of the form word at position -3 is X and at position -1 is Y.”

Neural networks provide nonlinear models, and do not suffer from this problem. When using a neural network such as a multi-layer perceptron (Chapter 4), the model designer can specify only the set of core features, and rely on the network training procedure to pick up on the important combinations on its own. This greatly simplifies the work of the model designer. In practice, neural networks indeed manage to learn good classifiers based on core features only, sometimes surpassing the best linear classifier with human-designed feature combinations. However, in many other cases a linear classifier with a good hand-crafted feature-set is hard to beat, with the neural network models with core features getting close to but not surpassing the linear models.

## 6.2.4 NGRAM FEATURES

A special case of feature combinations is that of ngrams—consecutive word sequences of a given length. We already saw letter-bigram features in the language classification case (Chapter 2). Word-bigrams, as well as trigrams (sequences of three items) of letters or words are also common. Beyond that, 4-grams and 5-grams are sometimes used for letters, but rarely for words due to sparsity issues. It should be intuitively clear why word-bigrams are more informative than individual words: it captures structures such as New York, not good, and Paris Hilton. Indeed, a bag-of-bigrams representation is much more powerful than bag-of-words, and in many cases proves very hard to beat. Of course, not all bigrams are equally informative, bigrams such as of the, on a, the boy, etc. are very common and, for most tasks, not more informative than their individual components. However, it is very hard to know a-priori which ngrams will be useful for a given task. The common solution is to include all ngrams up to a given length, and let the model regularization discard of the less interesting ones by assigning them very low weights.

Note that vanilla neural network architectures such as the MLP cannot infer ngram features from a document on their own in the general case: a multi-layer perceptron fed with a bag-of-words feature vector of a document could learn combinations such as “word X appear in the document and word Y appears in the document” but not “the bigram X Y appears in the document.” Thus, ngram features are useful also in the context of nonlinear classification.

Multi-layer perceptrons can infer ngrams when applied to a fixed size windows with positional information—the combination of “word at position -1 is X” and “word at position -2 is Y” is in effect the bigram XY. More specialized neural network architectures such as convolutional networks (Chapter 13) are designed to find informative ngram features for a given task based on a sequence of words of varying lengths. Bidirectional RNNs (Chapters 14 and 16) generalize the ngram concept even further, and can be sensitive to informative ngrams of varying lengths, as well as ngrams with gaps in them.

## 76 6. FEATURES FOR TEXTUAL DATA

## 6.2.5 DISTRIBUTIONAL FEATURES

Up until now our treatment of words was as discrete and unrelated symbols: the words pizza, burger, and chair are all equally similar (and equally dis-similar) to each other as far as the algorithm is concerned.

We did achieve some form of generalization across word types by mapping them to coarser-grained categories such as parts-of-speech or syntactic roles (“the, a, an, some are all determiners”); generalizing from inflected words forms to their lemmas (“book, booking, booked all share the lemma book”); looking at membership in lists or dictionaries (“John, Jack, and Ralph appear in a list of common U.S. first names”); or looking at their relation to other words using lexical resources such as WordNet. However, these solutions are quite limited: they either provide very coarse grained distinctions, or otherwise rely on specific, manually compiled dictionaries. Unless we have a specialized list of foods we will not learn that pizza is more similar to burger than it is to chair, and it will be even harder to learn that pizza is more similar to burger than it is to icecream.

The distributional hypothesis of language, set forth by Firth [1957] and Harris [1954], states that the meaning of a word can be inferred from the contexts in which it is used. By observing co-occurrence patterns of words across a large body of text, we can discover that the contexts in which burger occur are quite similar to those in which pizza occurs, less similar to those in which icecream occurs, and very different from those in which chair occurs. Many algorithms were derived over the years to make use of this property, and learn generalizations of words based on the contexts in which they occur. These can be broadly categorized into clustering-based methods, which assign similar words to the same cluster and represent each word by its cluster membership [Brown et al., 1992, Miller et al., 2004], and to embedding-based methods which represent each word as a vector such that similar words (words having a similar distribution) have similar vectors [Collobert and Weston, 2008, Mikolov et al., 2013b]. Turian et al. [2010] discuss and compare these approaches.

These algorithms uncover many facets of similarity between words, and can be used to derive good word features: for example, one could replace words by their cluster ID (e.g., replacing both the words June and aug by cluster732), replace rare or unseen words with the common word most similar to them, or just use the word vector itself as the representation of the word.

However, care must be taken when using such word similarity information, as it can have unintended consequences. For example, in some applications it is very useful to treat London and Berlin as similar, while for others (for example when booking a flight or translating a document) the distinction is crucial.

We will discuss word embeddings methods and the use of word vectors in more detail in Chapters 10 and 11.


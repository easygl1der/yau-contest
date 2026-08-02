---
title: "Chapter 7 \u2014 Case Studies of NLP Features"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 7
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 1787
source_line_end: 2017
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

# Chapter 7 — Case Studies of NLP Features

> [[../README|本书目录]] · [[06-chapter-6-features-for-textual-data|上一章]] · [[08-chapter-8-from-textual-features-to-inputs|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 1787–2017。
> - 本章保留 2 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## Case Studies of NLP Features

After discussing the different sources of information available for us for deriving features from natural language text, we will now explore examples of concrete NLP classification tasks, and suitable features for them. While the promise of neural networks is to alleviate the need for manual feature engineering, we still need to take these sources of information into consideration when designing our models: we want to make sure that the network we design can make effective use of the available signals, either by giving it direct access to them by use of feature-engineering; by designing the network architecture to expose the needed signals; or by adding them as an additional loss signals when training the models. $^{1}$

## 7.1 DOCUMENT CLASSIFICATION: LANGUAGE IDENTIFICATION

In the language identification task, we are given a document or a sentence, and want to classify it into one of a fixed set of languages. As we saw in Chapter 2, a bag of letter-bigrams is a very strong feature representation for this task. Concretely, each possible letter-bigram (or each letter bigram appearing at least k times in at least one language) is a core feature, and the value of a core feature for a given document is the count of that feature in the document.

A similar task is the one of encoding detection. Here, a good feature representation is a bag-of byte-bigrams.

## 7.2 DOCUMENT CLASSIFICATION: TOPIC CLASSIFICATION

In the Topic Classification task, we are given a document and need to classify it into one of a predefined set of topics (e.g., Economy, Politics, Sports, Leisure, Gossip, Lifestyle, Other).

Here, the letter level is not very informative, and our basic units will be words. Word order is not very informative for this task (except maybe for consecutive word pairs such as bigrams). Thus, a good set of features will be the bag-of-words in the document, perhaps accompanied by a bag-of-word-bigrams (each word and each word-bigram is a core feature).

## 7. CASE STUDIES OF NLP FEATURES

If we do not have many training examples, we may benefit from pre-processing the document by replacing each word with its lemma. We may also replace or supplement words by distributional features such as word clusters or word-embedding vectors.

When using a linear classifier, we may want to also consider word pairs, i.e., consider each pair of words (not necessarily consecutive) that appear in the same document as a core feature. This will result in a huge number of potential core features, and the number will need to be trimmed down by designing some heuristic, such as considering only word pairs which appear in a specified number of documents. Nonlinear classifiers alleviate this need.

When using a bag-of-words, it is sometimes useful to weight each word with proportion to its informativeness, for example using TF-IDF weighting (Section 6.2.1). However, the learning algorithm is often capable of coming up with the weighting on its own. Another option is to use word indicators rather than word counts: each word in the document (or each word above a given count) will be represented once, regardless of its number of occurrences in the document.

## 7.3 DOCUMENT CLASSIFICATION: AUTHORSHIP ATTRIBUTION

In the authorship attribution task [Koppel et al., 2009] we are given a text and need to infer the identity of its author (from a fixed set of possible authors), or other characteristics of the author of the text, such as their gender, their age or their native language.

The kind of information used to solve this task is very different than that of topic classification—the clues are subtle, and involve stylistic properties of the text rather than content words.

Thus, our choice of features should shy away from content words and focus on more stylistic properties. $^{2}$ A good set for such tasks focus on parts of speech (POS) tags and function words. These are words like on, of, the, and, before and so on that do not carry much content on their own but rather serve to connect to content-bearing words and assign meanings to their compositions, as well as pronouns (he, she, I, they, etc.) A good approximation of function words is the list of top-300 or so most frequent words in a large corpus. By focusing on such features, we can learn to capture subtle stylistic variations in writing, that are unique to an author and very hard to fake.

A good feature set for authorship attribution task include a bag-of-function-words-and-pronouns, bag-of-POS-tags, and bags of POS bigrams, trigrams, and 4grams. Additionally, we may want to consider the density of function words (i.e., the ratio between the number of function words and content words in a window of text), a bag of bigrams of function words after removing the content words, and the distributions of the distances between consecutive function words.

## 7.4 WORD-IN-CONTEXT: PART OF SPEECH TAGGING

In the parts-of-speech tagging task, we are given a sentence, and need to assign the correct part-of-speech to each word in the sentence. The parts-of-speech come from a pre-defined set, for this example assume we will be using the tagset of the Universal Treebank Project [McDonald et al., 2013, Nivre et al., 2015], containing 17 tags. $^{3}$

Part-of-speech tagging is usually modeled as a structured task—the tag of the first word may depend on the tag of the third one—but it can be approximated quite well by classifying each word in isolation into a POS-tag based on a window of two words to each side of the word. If we tag the words in a fixed order, for example from left to right, we can also condition each tagging prediction on tag predictions made on previous tags. Our feature function when classifying a word $w_{i}$ has access to all the words in the sentence (and their letters) as well as all the previous tagging decisions (i.e., the assigned tags for words $w_{1},\ldots,w_{i-1}$ ). Here, we discuss features as if they are used in an isolated classification task. In Chapter 19 we discuss the structured learning case—using the same set of features.

The sources of information for the POS-tagging task can be divided into intrinsic cues (based on the word itself) and extrinsic cues (based on its context). Intrinsic cues include the identity of the word (some words are more likely than others to be nouns, for example), prefixes, suffixes, and orthographic shape of the word (in English, words ending in -ed are likely past-tense verbs, words starting with un- are likely to be adjectives, and words starting with a capital letter are likely to be proper names), and the frequency of the word in a large corpus (for example, rare words are more likely to be nouns). Extrinsic cues include the word identities, prefixes, and suffixes of words surrounding the current word, as well as the part-of-speech prediction for the previous words.

Overlapping features If we have the word form as a feature, why do we need the prefixes and suffixes? After all they are deterministic functions of the word. The reason is that if we encounter a word that we have not seen in training (out of vocabulary or OOV word) or a word we've seen only a handful of times in training (a rare word), we may not have robust enough information to base a decision on. In such cases, it is good to back-off to the prefixes and suffixes, which can provide useful hints. By including the prefix and suffix features also for words that are observed many times in training, we allow the learning algorithms to better adjust their weights, and hopefully use them properly when encountering OOV words.

## 7. CASE STUDIES OF NLP FEATURES

An example of a good set of core features for POS tagging is:

\- word=X

\- 2-letter-suffix=X

\- 3-letter-suffix=X

\- 2-letter-prefix=X

\- 3-letter-prefix=X

\- word-is-capitalized

\- word-contains-hyphen

\- word-contains-digit

- for P in $[-2, -1, +1, +2]$ :

\- Word at position $\mathbb{P} = \mathrm{X}$

\- 2-letter-suffix of word at position P=X

\- 3-letter-suffix of word at position $\mathbb{P} = \mathrm{X}$

\- 2-letter-prefix of word at position P=X

\- 3-letter-prefix of word at position P=X

\- word at position $\mathbb{P} = \mathrm{X}$ is capitalized

\- word at position $\mathbb{P} = \mathrm{X}$ contains hyphen

\- word at position P=X contains digit

- Predicted POS of word at position -1=X

- Predicted POS of word at position -2=X

In addition to these, distributional information such as word clusters or word-embedding vectors of the word and of surrounding words can also be useful, especially for words not seen in the training corpus, as words with similar POS-tags tend to occur in more similar contexts to each other than words of different POS-tags.

## 7.5 WORD-IN-CONTEXT: NAMED ENTITY RECOGNITION

In the named-entity recognition (NER) task we are given a document and need to find named entities such as Milan, John Smith, McCormik Industries, and Paris, as well as to categorize them into a pre-defined set of categories such as LOCATION, ORGANIZATION, PERSON, or OTHER. Note that this task is context dependent, as Milan can be a location (the city) or an organization (a sports team, “Milan played against Barsa Wednesday evening”), and Paris can be the name of a city or a person.

A typical input to the problem would be a sentence such as:

John Smith, president of McCormik Industries visited his niece Paris in Milan, reporters say.

and the expected output would be:

PER John Smith', president of [ORG McCormik Industries] visited his niece [PER Paris] in [LOC Milan], reporters say.

While NER is a sequence segmentation task—it assigns labeled brackets over non-overlapping sentence spans—it is often modeled as a sequence tagging task, like POS-tagging. The use of tagging to solve segmentation tasks is performed using BIO encoded tags. $^{4}$ Each word is assigned one of the following tags, as seen in Table 7.1:

Table 7.1: BIO tags for named entity recognition

<table><tr><td>Tag</td><td>Meaning</td></tr><tr><td>O</td><td>Not part of a named entity</td></tr><tr><td>B-PER</td><td>First word of a person name</td></tr><tr><td>I-PER</td><td>Continuation of a person name</td></tr><tr><td>B-LOC</td><td>First word of a location name</td></tr><tr><td>I-LOC</td><td>Continuation of a location name</td></tr><tr><td>B-ORG</td><td>First word of an organization name</td></tr><tr><td>I-ORG</td><td>Continuation of an organization name</td></tr><tr><td>B-MISC</td><td>First word of another kind of named entity</td></tr><tr><td>I-MISC</td><td>Continuation of another kind of named entity</td></tr></table>

## 82 7. CASE STUDIES OF NLP FEATURES

The sentence above would be tagged as:

John/B-PER Smith/I-PER, /O president/O of/O McCormik/B-ORG Industries/I-ORG visited/O his/O niece/O Paris/B-PER in/O Milan/B-LOC, /O reporters/O say/O.

The translation from non-overlapping segments to BIO tags and back is straightforward.

Like POS-tagging, the NER task is a structured one, as tagging decisions for different words interact with each other (it is more likely to remain within the same entity type than to switch, it is more likely to tag "John Smith Inc." as B-ORG I-ORG I-ORG than as B-PER I-PER B-ORG). However, we again assume it can be approximated reasonably well using independent classification decisions.

The core feature set for the NER task is similar to that of the POS-tagging task, and relies on words within a 2-words window to each side of the focus word. In addition to the features of the POS-tagging task which are useful for NER as well (e.g., -ville is a suffix indicating a location, Mc- is a prefix indicating a person), we may want to consider also the identities of the words that surround other occurrences of the same word in the text, as well as indicator functions that check if the word occurs in pre-compiled lists of persons, locations and organizations. Distributional features such word clusters or word vectors are also extremely useful for the NER task. For a comprehensive discussion on features for NER, see Ratinov and Roth [2009].

## 7.6 WORD IN CONTEXT, LINGUISTIC FEATURES: PREPOSITION SENSE DISAMBIGUATION

Prepositions, words like on, in, with, and for, serve for connecting predicates with their arguments and nouns with their prepositional modifiers. Preposions are very common, and also very ambiguous. Consider, for example, the word for in the following sentences.

(1) a. We went there for lunch.

b. He paid for me.

c. We ate for two hours.

d. He would have left for home, but it started raining.

The word for plays a different role in each of them: in (a) it indicates a PURPOSE in (b) a BENEFICIARY, in (c) a DURATION and in (d) a LOCATION.

In order to fully understand the meaning of a sentence, one should arguably know the correct senses of the prepositions within it. The preposition-sense disambiguation task deals with assigning the correct sense to a preposition in context, from a finite inventory of senses. Schneider et al. [2015, 2016] discuss the task, present a unified sense inventory that covers many prepositions, and provide a small annotated corpus of sentences from online reviews, covering 4,250 preposition mentions, each annotated with its sense. $^{5}$

Which are a good set of features for the preposition sense disambiguation task? We follow here the feature set inspired by the work of Hovy et al. [2010].

Obviously, the preposition itself is a useful feature (the distribution of possible senses for in is very different from the distribution of senses for with or about, for example). Besides that, we will look in the context in which the word occurs. A fixed window around the preposition may not be ideal in terms of information content, thought. Consider, for example, the following sentences.

(2) a. He liked the round object from the very first time he saw it.

b. He saved the round object from him the very first time they saw it.

The two instances of from have different senses, but most of the words in a window around the word are either not informative or even misleading. We need a better mechanism for selecting informative contexts. One option would be to use a heuristic, such as “the first verb on the left” and “the first noun on the right.” These will capture the triplets (liked,from,time) and (saved,from,him), which indeed contain the essence of the preposition sense. In linguistic terms, we say that this heuristic helps us capture the governor and the and object of the preposition. By knowing the identify of the preposition, as well as its governor and objects, humans can in many cases infer the sense of the preposition, using reasoning processes about the fine-grained semantics of the words. The heuristic for extracting the object and governor requires the use of a POS-tagger in order to identify the nouns and verbs. It is also somewhat brittle—it is not hard to imagine cases in which it fails. We could refine the heuristic with more rules, but a more robust approach would be to use a dependency parser: the governor and object information is easily readable from the syntactic tree, reducing the need for complex heuristics:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/ca121ac2616890ff7db4a093722c147422982483d016a74dacce7fbb390f596e.jpg)

Of course, the parser used for producing the tree may be wrong too. For robustness, we may look at both the governor and object extracted from the parser and the governor and object extracted using the heuristic, and use all four as sources for features (i.e., parse\_gov=X, parse\_obj=Y,

## 84 7. CASE STUDIES OF NLP FEATURES

heur\_gov=Z, heur\_obj=W), letting the learning process decide which of the sources is more reliable and how to balance between them.

After extracting the governor and the object (and perhaps also words adjacent to the governor and the object), we can use them as the basis for further feature extraction. For each of the items, we could extract the following pieces of information:

- the actual surface form of the word;

- the lemma of the word;

- the part-of-speech of the word;

\- prefixes and suffixes of the word (indicating adjectives of degree, number, order, etc such as ultra-, poly-, post-, as well as some distinctions between agentive and non-agentive verbs); and

- word cluster or distributional vector of the word.

If we allow the use of external lexical resources and don't mind greatly enlarging the feature space, Hovy et al. [2010] found the use of WordNet-based features to be helpful as well. For each of the governor and the object, we could extract many WordNet indicators, such as:

- does the word have a WordNet entry?;

- hypernyms of the first synset of the word;

- hypernyms of all synsets of the word;

- synonyms for first synset of the word;

- synonyms for all synsets of the word;

- all terms in the definition of the word;

\- the super-sense of the word (super-senses, also called lexicographer-files in the WordNet jargon, are relatively high levels in the WordNet hierarchy, indicating concepts such as being an animal, being a body part, being an emotion, being food, etc.); and

- various other indicators.

This process may result in tens or over a hundred of core features for each preposition instance, i.e., hyper\_1st\_syn\_gov=a, hyper\_all\_syn\_gov=a, hyper\_all\_syn\_gov=b, hyper\_all\_syn\_gov=c, ..., hyper\_1st\_syn\_obj=x, hyper\_all\_syn\_obj=y, ..., term\_in\_def\_gov=q, term\_in\_def\_gov=w, etc.

See the work of Hovy et al. [2010] for the finer details.

## 7.7. RELATION BETWEEN WORDS IN CONTEXT: ARC-FACTORED PARSING

The preposition-sense disambiguation task is an example of a high-level semantic classification problem, for which we need a set of features that cannot be readily inferred from the surface forms, and can benefit from linguistic pre-processing (i.e., POS-tagging and syntactic parsing) as well as from selected pieces of information from manually curated semantic lexicons.

## 7.7 RELATION BETWEEN WORDS IN CONTEXT: ARC-FACTORED PARSING

In the dependency parsing task, we are given a sentence and need to return a syntactic dependency tree over it, such as the tree in Figure 7.1. Each word is assigned a parent word, except for the main word of the sentence whose parent is a special \*ROOT\* symbol.

![Figure 7.1](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-001-pages-001-200/images/1cf8a9fa65afd0c0bc585e7ce14095e35529daac832eaf730aa442309facd284.jpg)  
Figure 7.1: Dependency tree.

For more information on the dependency parsing task, its linguistic foundations and approaches to its solution, see the book by Kübler et al. [2008].

One approach to modeling the task is the arc-factored approach [McDonald et al., 2005], where each of the possible $n^2$ word-word relations (arcs) is assigned a score independent of the others, and then we search for the valid tree with the maximal overall score. The score assignment is made by a trained scoring function $\text{ArcSCORE}(h, m, sent)$ , receiving a sentence as well as the indices $h$ and $m$ of two words within it that are considered as candidates for attachment ( $h$ is the index of the candidate head-word and $m$ is the index of the candidate modifier). Training the scoring function such that it works well with the search procedure will be discussed in Chapter 19. Here, we focus on the features used in the scoring function.

Assume a sentence of n words $w_{1:n}$ and their corresponding parts-of-speech $p_{1:n}$ , $sent =(w_{1}, w_{2}, \ldots, w_{n}, p_{1}, p_{2}, \ldots, p_{n})$ . When looking at an arc between words $w_{h}$ and $w_{m}$ , we can make use of the following pieces of information.

We begin with the usual suspects:

## 7. CASE STUDIES OF NLP FEATURES

- The word form (and POS-tag) of the head word.

\- The word form (and POS-tag) of the modifier word. (Some words are less likely to be heads or modifiers, regardless to who they are connected to. For example, determiners ("the," "a") are often modifiers, and are never heads.)

\- Words (POS-tags) in a window of two words to each side of the head word, including the relative positions.

\- Words (POS-tags) in a window of two words to each side of the modifier word, including the relative positions. (The window information is needed to give some context to the word. Words behave differently in different contexts.)

We use the parts-of-speech as well as the word forms themselves. Word-forms give us very specific information (for example, that cake is a good candidate object for ate), while the parts-of-speech provide lower level syntactic information that is more generalizable (for example, that determiners and adjectives are good modifiers for nouns, and that nouns are good modifiers for verbs). As the training corpora for dependency-trees are usually rather limited in size, it could be a good idea to supplement or replace the words using distributional information, in the form of word clusters or pre-trained word embeddings, that will capture generalizations across similar words, also for words that may not have a good coverage in the training data.

We do not look at prefixes and suffixes of words, because these are not directly relevant to the parsing task. While the affixes of words indeed carry important syntactic information (is the word likely to be a noun? a past verb?), this information is already available to us in through the POS-tags. If we were parsing without access to POS-tag features (for example, if the parser was in charge for both parsing and POS-tag assignments), it would be wise to include the suffix information as well.

Of course, if we use a linear classifier, we need to take care also of feature combinations, with features such as “head candidate word is X and modifier word candidate is Y and head part-of-speech is Z and the word before the modifier word is W.” Indeed, it is common for dependency parsers based on linear models to have hundreds of such feature combinations.

In addition to these usual suspects, it is also informative to consider the following.

\- The distance between words $w_h$ and $w_m$ in the sentence, $dist = |h - m|$ . Some distances are more likely to stand in a dependency relation than others.

\- The direction between the words. In English, assume $w_{m}$ is a determiner ("the") and $w_{h}$ is a noun ("boy"), it is quite likely that there will be an arc between them if $m < h$ and very unlikely if $m > h$ .

\- All the words (POS-tags) of words that appear between the head and the modifier words in the sentence. This information is useful as it hints at possible competing attachments.

For example, a determiner at $w_{m}$ is likely to modify a noun at $w_{h>m}$ , but not if a word $w_{k}$ (m < k < h) between them is also a determiner. Note that the number of words between the head and the modifier is potentially unbounded (and also changes from instance to instance) and so we need a way to encode a variable number of features, hinting at a bag-of-words approach.


---
title: "Chapter 8 \u2014 Sequence Labeling for Parts of Speech and Named Entities"
book: "Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models"
book_slug: speech-language-processing
course: natural-language-processing
chapter_number: 8
citekey: jurafsky2026slp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf"
source_transcript: "transcripts/mineru/speech-language-processing/reading.md"
source_line_start: 4294
source_line_end: 4949
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 6
source_empty_image_alt: 6
non_semantic_image_alt: 1
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

# Chapter 8 — Sequence Labeling for Parts of Speech and Named Entities

> [[../README|本书目录]] · [[07-chapter-7-neural-networks-and-neural-language-models|上一章]] · [[09-chapter-9-deep-learning-architectures-for-sequence-processing|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models（jurafsky2026slp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/speech-language-processing/reading.md)，源行 4294–4949。
> - 本章保留 6 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Sequence Labeling for Parts of Speech and Named Entities

To each word a warbling note

A Midsummer Night’s Dream, V.I

Dionysius Thrax of Alexandria (c. 100 B.C.), or perhaps someone else (it was a long time ago), wrote a grammatical sketch of Greek (a “techne¯”) that summarized the linguistic knowledge of his day. This work is the source of an astonishing proportion of modern linguistic vocabulary, including the words syntax, diphthong, clitic, and analogy. Also included are a description of eight parts of speech: noun, verb, pronoun, preposition, adverb, conjunction, participle, and article. Although earlier scholars (including Aristotle as well as the Stoics) had their own lists of parts of speech, it was Thrax’s set of eight that became the basis for descriptions of European languages for the next 2000 years. (All the way to the Schoolhouse Rock educational television shows of our childhood, which had songs about 8 parts of speech, like the late great Bob Dorough’s Conjunction Junction.) The durability of parts of speech through two millennia speaks to their centrality in models of human language.

Proper names are another important and anciently studied linguistic category. While parts of speech are generally assigned to individual words or morphemes, a proper name is often an entire multiword phrase, like the name “Marie Curie”, the location “New York City”, or the organization “Stanford University”. We’ll use the term named entity for, roughly speaking, anything that can be referred to with a proper name: a person, a location, an organization, although as we’ll see the term is commonly extended to include things that aren’t entities per se.

Parts of speech (also known as POS) and named entities are useful clues to sentence structure and meaning. Knowing whether a word is a noun or a verb tells us about likely neighboring words (nouns in English are preceded by determiners and adjectives, verbs by nouns) and syntactic structure (verbs have dependency links to nouns), making part-of-speech tagging a key aspect of parsing. Knowing if a named entity like Washington is a name of a person, a place, or a university is important to many natural language understanding tasks like question answering, stance detection, or information extraction.

In this chapter we’ll introduce the task of part-of-speech tagging, taking a sequence of words and assigning each word a part of speech like NOUN or VERB, and the task of named entity recognition (NER), assigning words or phrases tags like PERSON, LOCATION, or ORGANIZATION.

Such tasks in which we assign, to each word $x_{i}$ in an input word sequence, a label $y_{i},$ so that the output sequence Y has the same length as the input sequence X are called sequence labeling tasks. We’ll introduce classic sequence labeling algorithms, one generative— the Hidden Markov Model (HMM)—and one discriminative— the Conditional Random Field (CRF). In following chapters we’ll introduce modern sequence labelers based on RNNs and Transformers.

## 8.1 (Mostly) English Word Classes

Until now we have been using part-of-speech terms like noun and verb rather freely. In this section we give more complete definitions. While word classes do have semantic tendencies—adjectives, for example, often describe properties and nouns people— parts of speech are defined instead based on their grammatical relationship with neighboring words or the morphological properties about their affixes.

<table><tr><td></td><td>Tag</td><td>Description</td><td>Example</td></tr><tr><td rowspan="6">Open Class</td><td>ADJ</td><td>Adjective: noun modifiers describing properties</td><td>red, young, awesome</td></tr><tr><td>ADV</td><td>Adverb: verb modifiers of time, place, manner</td><td>very, slowly, home, yesterday</td></tr><tr><td>NOUN</td><td>words for persons, places, things, etc.</td><td>algorithm, cat, mango, beauty</td></tr><tr><td>VERB</td><td>words for actions and processes</td><td>draw, provide, go</td></tr><tr><td>PROPN</td><td>Proper noun: name of a person, organization, place, etc..</td><td>Regina, IBM, Colorado</td></tr><tr><td>INTJ</td><td>Interjection: exclamation, greeting, yes/no response, etc.</td><td>oh, um, yes, hello</td></tr><tr><td rowspan="8">Closed Class Words</td><td>ADP</td><td>Adposition (Preposition/Postposition): marks a noun&#x27;s spacial, temporal, or other relation</td><td>in, on, by under</td></tr><tr><td>AUX</td><td>Auxiliary: helping verb marking tense, aspect, mood, etc.,</td><td>can, may, should, are</td></tr><tr><td>CCONJ</td><td>Coordinating Conjunction: joins two phrases/clauses</td><td>and, or, but</td></tr><tr><td>DET</td><td>Determiner: marks noun phrase properties</td><td>a, an, the, this</td></tr><tr><td>NUM</td><td>Numeral</td><td>one, two, first, second</td></tr><tr><td>PART</td><td>Particle: a preposition-like form used together with a verb</td><td>up, down, on, off, in, out, at, by</td></tr><tr><td>PRON</td><td>Pronoun: a shorthand for referring to an entity or event</td><td>she, who, I, others</td></tr><tr><td>SCONJ</td><td>Subordinating Conjunction: joins a main clause with a subordinate clause such as a sentential complement</td><td>that, which</td></tr><tr><td rowspan="3">Other</td><td>PUNCT</td><td>Punctuation</td><td>; , ()</td></tr><tr><td>SYM</td><td>Symbols like $ or emoji</td><td>$, %</td></tr><tr><td>X</td><td>Other</td><td>asdf, qwfg</td></tr></table>

Figure 8.1 The 17 parts of speech in the Universal Dependencies tagset (Nivre et al., 2016a). Features can be added to make finer-grained distinctions (with properties like number, case, definiteness, and so on).

closed class Parts of speech fall into two broad categories: closed class and open class. open class Closed classes are those with relatively fixed membership, such as prepositions— new prepositions are rarely coined. By contrast, nouns and verbs are open classes— new nouns and verbs like iPhone or to fax are continually being created or borrowed. function word Closed class words are generally function words like of, it, and, or you, which tend to be very short, occur frequently, and often have structuring uses in grammar.

Four major open classes occur in the languages of the world: nouns (including proper nouns), verbs, adjectives, and adverbs, as well as the smaller open class of interjections. English has all five, although not every language does.

noun Nouns are words for people, places, or things, but include others as well. Comcommon noun mon nouns include concrete terms like cat and mango, abstractions like algorithm and beauty, and verb-like terms like pacing as in His pacing to and fro became quite annoying. Nouns in English can occur with determiners (a goat, its bandwidth) take possessives (IBM’s annual revenue), and may occur in the plural (goats, abaci). count noun Many languages, including English, divide common nouns into count nouns and mass noun mass nouns. Count nouns can occur in the singular and plural (goat/goats, relationship/relationships) and can be counted (one goat, two goats). Mass nouns are used when something is conceptualized as a homogeneous group. So snow, salt, and proper noun communism are not counted (i.e., \*two snows or \*two communisms). Proper nouns, like Regina, Colorado, and IBM, are names of specific persons or entities.

Verbs refer to actions and processes, including main verbs like draw, provide, and go. English verbs have inflections (non-third-person-singular (eat), third-personsingular (eats), progressive (eating), past participle (eaten)). While many scholars believe that all human languages have the categories of noun and verb, others have argued that some languages, such as Riau Indonesian and Tongan, don’t even make this distinction (Broschart 1997; Evans 2000; Gil 2000) .

Adjectives often describe properties or qualities of nouns, like color (white, black), age (old, young), and value (good, bad), but there are languages without adjectives. In Korean, for example, the words corresponding to English adjectives act as a subclass of verbs, so what is in English an adjective “beautiful” acts in Korean like a verb meaning “to be beautiful”.

Adverbs are a hodge-podge. All the italicized words in this example are adverbs:

## Actually, I ran home extremely quickly yesterday

Adverbs generally modify something (often verbs, hence the name “adverb”, but also other adverbs and entire verb phrases). Directional adverbs or locative adverbs (home, here, downhill) specify the direction or location of some action; degree adverbs (extremely, very, somewhat) specify the extent of some action, process, or property; manner adverbs (slowly, slinkily, delicately) describe the manner of some action or process; and temporal adverbs describe the time that some action or event took place (yesterday, Monday).

Interjections (oh, hey, alas, uh, um), are a smaller open class, that also includes greetings (hello, goodbye), and question responses (yes, no, uh-huh).

English adpositions occur before nouns, hence are called prepositions. They can indicate spatial or temporal relations, whether literal (on it, before then, by the house) or metaphorical (on time, with gusto, beside herself), and relations like marking the agent in Hamlet was written by Shakespeare.

A particle resembles a preposition or an adverb and is used in combination with a verb. Particles often have extended meanings that aren’t quite the same as the prepositions they resemble, as in the particle over in she turned the paper over. A verb and a particle acting as a single unit is called a phrasal verb. The meaning of phrasal verbs is often non-compositional—not predictable from the individual meanings of the verb and the particle. Thus, turn down means ‘reject’, rule out ‘eliminate’, and go on ‘continue’.

Determiners like this and that (this chapter, that page) can mark the start of an English noun phrase. Articles like a, an, and the, are a type of determiner that mark discourse properties of the noun and are quite frequent; the is the most common word in written English, with a and an right behind.

Conjunctions join two phrases, clauses, or sentences. Coordinating conjunctions like and, or, and but join two elements of equal status. Subordinating conjunctions are used when one of the elements has some embedded status. For example, the subordinating conjunction that in “I thought that you might like some milk” links the main clause I thought with the subordinate clause you might like some milk. This clause is called subordinate because this entire clause is the “content” of the main verb thought. Subordinating conjunctions like that which link a verb to its argument in this way are also called complementizers.

Pronouns act as a shorthand for referring to an entity or event. Personal pronouns refer to persons or entities (you, she, I, it, me, etc.). Possessive pronouns are forms of personal pronouns that indicate either actual possession or more often just an abstract relation between the person and some object (my, your, his, her, its, one’s, our, their). Wh-pronouns (what, who, whom, whoever) are used in certain question forms, or act as complementizers (Frida, who married Diego. . . ).

Auxiliary verbs mark semantic features of a main verb such as its tense, whether it is completed (aspect), whether it is negated (polarity), and whether an action is necessary, possible, suggested, or desired (mood). English auxiliaries include the copula verb be, the two verbs do and have, forms, as well as modal verbs used to mark the mood associated with the event depicted by the main verb: can indicates ability or possibility, may permission or possibility, must necessity.

An English-specific tagset, the 45-tag Penn Treebank tagset (Marcus et al., 1993), shown in Fig. 8.2, has been used to label many syntactically annotated corpora like the Penn Treebank corpora, so is worth knowing about.

<table><tr><td>Tag</td><td>Description</td><td>Example</td><td>Tag</td><td>Description</td><td>Example</td><td>Tag</td><td>Description</td><td>Example</td></tr><tr><td>CC</td><td>coord. conj.</td><td>and, but, or</td><td>NNP</td><td>proper noun, sing.</td><td>IBM</td><td>TO</td><td>“to”</td><td>to</td></tr><tr><td>CD</td><td>cardinal number</td><td>one, two</td><td>NNPS</td><td>proper noun, plu.</td><td>Carolinas</td><td>UH</td><td>interjection</td><td>ah, oops</td></tr><tr><td>DT</td><td>determiner</td><td>a, the</td><td>NNS</td><td>noun, plural</td><td>llamas</td><td>VB</td><td>verb base</td><td>eat</td></tr><tr><td>EX</td><td>existential ‘there’</td><td>there</td><td>PDT</td><td>predeterminer</td><td>all, both</td><td>VBD</td><td>verb past tense</td><td>ate</td></tr><tr><td>FW</td><td>foreign word</td><td>mea culpa</td><td>POS</td><td>possessive ending</td><td>’s</td><td>VBG</td><td>verb gerund</td><td>eating</td></tr><tr><td>IN</td><td>preposition/subordin-conj</td><td>of, in, by</td><td>PRP</td><td>personal pronoun</td><td>I, you, he</td><td>VBN</td><td>verb past partici-ple</td><td>eaten</td></tr><tr><td>JJ</td><td>adjective</td><td>yellow</td><td>PRP$</td><td>possess.pronoun</td><td>your, one’s</td><td>VBP</td><td>verbnon-3sg-pr</td><td>eat</td></tr><tr><td>JJR</td><td>comparativeadj</td><td>bigger</td><td>RB</td><td>adverb</td><td>quickly</td><td>VBZ</td><td>verb3sgpres</td><td>eats</td></tr><tr><td>JJS</td><td>superlativeadj</td><td>wildest</td><td>RBR</td><td>comparativeadv</td><td>faster</td><td>WDT</td><td>wh-determ.</td><td>which, that</td></tr><tr><td>LS</td><td>listitemmarker</td><td>1, 2, One</td><td>RBS</td><td>superlatv.adv</td><td>fastest</td><td>WP</td><td>wh-pronoun</td><td>what, who</td></tr><tr><td>MD</td><td>modal</td><td>can, should</td><td>RP</td><td>particle</td><td>up, off</td><td>WP$</td><td>wh-possess.</td><td>whose</td></tr><tr><td>NN</td><td>sing or mass noun</td><td>llama</td><td>SYM</td><td>symbol</td><td>+,%, &amp;</td><td>WRB</td><td>wh-adverb</td><td>how, where</td></tr></table>

Figure 8.2 Penn Treebank part-of-speech tags.

Below we show some examples with each word tagged according to both the UD and Penn tagsets. Notice that the Penn tagset distinguishes tense and participles on verbs, and has a special tag for the existential there construction in English. Note that since New England Journal of Medicine is a proper noun, both tagsets mark its component nouns as NNP, including journal and medicine, which might otherwise be labeled as common nouns (NOUN/NN).

(8.1) There/PRO/EX are/VERB/VBP 70/NUM/CD children/NOUN/NNS there/ADV/RB ./PUNC/.

(8.2) Preliminary/ADJ/JJ findings/NOUN/NNS were/AUX/VBD reported/VERB/VBN in/ADP/IN today/NOUN/NN ’s/PART/POS New/PROPN/NNP England/PROPN/NNP Journal/PROPN/NNP of/ADP/IN Medicine/PROPN/NNP

## 8.2 Part-of-Speech Tagging

Part-of-speech tagging is the process of assigning a part-of-speech to each word in a text. The input is a sequence $x_{1}, x_{2},..., x_{n}$ of (tokenized) words and a tagset, and the output is a sequence $y_{1}, y_{2},..., y_{n}$ of tags, each output y<sub>i</sub> corresponding exactly to one input x<sub>i</sub>, as shown in the intuition in Fig. 8.3.

Tagging is a disambiguation task; words are ambiguous —have more than one possible part-of-speech—and the goal is to find the correct tag for the situation. For example, book can be a verb (book that flight) or a noun (hand me that book). That can be a determiner (Does that flight serve dinner) or a complementizer (I thought that your flight was earlier). The goal of POS-tagging is to resolve these ambiguities, choosing the proper tag for the context.

![Figure 8.3](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/16e4f5abff68f4faa6fbaddaba17b40a06cb44c5266d7683d723da61ced17825.jpg)  
Figure 8.3 The task of part-of-speech tagging: mapping from input words $x_{1}, x_{2},..., x_{n}$ to output POS tags $y_{1}, y_{2},..., y_{n}$

The accuracy of part-of-speech tagging algorithms (the percentage of test set tags that match human gold labels) is extremely high. One study found accuracies over 97% across 15 languages from the Universal Dependency (UD) treebank (Wu and Dredze, 2019). Accuracies on various English treebanks are also 97% (no matter the algorithm; HMMs, CRFs, BERT perform similarly). This 97% number is also about the human performance on this task, at least for English (Manning, 2011).

<table><tr><td colspan="2">Types:</td><td colspan="2">WSJ</td><td colspan="2">Brown</td></tr><tr><td>Unambiguous</td><td>(1 tag)</td><td>44,432</td><td>(86%)</td><td>45,799</td><td>(85%)</td></tr><tr><td>Ambiguous</td><td>(2+ tags)</td><td>7,025</td><td>(14%)</td><td>8,050</td><td>(15%)</td></tr><tr><td colspan="2">Tokens:</td><td></td><td></td><td></td><td></td></tr><tr><td>Unambiguous</td><td>(1 tag)</td><td>577,421</td><td>(45%)</td><td>384,349</td><td>(33%)</td></tr><tr><td>Ambiguous</td><td>(2+ tags)</td><td>711,780</td><td>(55%)</td><td>786,646</td><td>(67%)</td></tr></table>

Figure 8.4 Tag ambiguity in the Brown and WSJ corpora (Treebank-3 45-tag tagset).

We’ll introduce algorithms for the task in the next few sections, but first let’s explore the task. Exactly how hard is it? Fig. 8.4 shows that most word types (85-86%) are unambiguous (Janet is always NNP, hesitantly is always RB). But the ambiguous words, though accounting for only 14-15% of the vocabulary, are very common, and 55-67% of word tokens in running text are ambiguous. Particularly ambiguous common words include that, back, down, put and set; here are some examples of the 6 different parts of speech for the word back:

earnings growth took a back/JJ seat

a small building in the back/NN

a clear majority of senators back/VBP the bill

Dave began to back/VB toward the door

enable the country to buy back/RP debt

I was twenty-one back/RB then

Nonetheless, many words are easy to disambiguate, because their different tags aren’t equally likely. For example, a can be a determiner or the letter a, but the determiner sense is much more likely.

This idea suggests a useful baseline: given an ambiguous word, choose the tag which is most frequent in the training corpus. This is a key concept:

Most Frequent Class Baseline: Always compare a classifier against a baseline at least as good as the most frequent class baseline (assigning each token to the class it occurred in most often in the training set).

The most-frequent-tag baseline has an accuracy of about $92 \%^{1}$ . The baseline thus differs from the state-of-the-art and human ceiling (97%) by only 5%.

## 8.3 Named Entities and Named Entity Tagging

Part of speech tagging can tell us that words like Janet, Stanford University, and Colorado are all proper nouns; being a proper noun is a grammatical property of these words. But viewed from a semantic perspective, these proper nouns refer to different kinds of entities: Janet is a person, Stanford University is an organization,.. and Colorado is a location.

A named entity is, roughly speaking, anything that can be referred to with a proper name: a person, a location, an organization. The task of named entity recognition (NER) is to find spans of text that constitute proper names and tag the type of the entity. Four entity tags are most common: PER (person), LOC (location), ORG (organization), or GPE (geo-political entity). However, the term named entity is commonly extended to include things that aren’t entities per se, including dates, times, and other kinds of temporal expressions, and even numerical expressions like prices. Here’s an example of the output of an NER tagger:

Citing high fuel prices, $[\mathrm{ORG}$ United Airlines] said $\mathrm{[\mathrm{TIME}}$ Friday] it has increased fares by [<sub>MONEY</sub> \$6] per round trip on flights to some cities also served by lower-cost carriers. [<sub>ORG</sub> American Airlines], a unit of $[\mathrm{ORG}$ AMR Corp.], immediately matched the move, spokesman $[\mathrm{PER}$ Tim Wagner] said. $[\mathrm{ORG}$ United], a unit of $[o \mathbb{R} \mathrm{G}$ UAL Corp.], said the increase took effect [<sub>TIME</sub> Thursday] and applies to most routes where it competes against discount carriers, such as $\operatorname{I}_{\mathrm{LOC}}$ Chicago] to $\operatorname{I}_{\mathrm{LOC}}$ Dallas] and $\operatorname{I}_{\mathrm{LOC}}$ Denver] to $\operatorname{I}_{\mathrm{LOC}}$ San Francisco].

The text contains 13 mentions of named entities including 5 organizations, 4 locations, 2 times, 1 person, and 1 mention of money. Figure 8.5 shows typical generic named entity types. Many applications will also need to use specific entity types like proteins, genes, commercial products, or works of art.

<table><tr><td>Type</td><td>Tag</td><td>Sample Categories</td><td>Example sentences</td></tr><tr><td>People</td><td>PER</td><td>people, characters</td><td>Turing is a giant of computer science.</td></tr><tr><td>Organization</td><td>ORG</td><td>companies, sports teams</td><td>The IPCC warned about the cyclone.</td></tr><tr><td>Location</td><td>LOC</td><td>regions, mountains, seas</td><td>Mt. Sanitas is in Sunshine Canyon.</td></tr><tr><td>Geo-Political Entity</td><td>GPE</td><td>countries, states</td><td>Palo Alto is raising the fees for parking.</td></tr></table>

Figure 8.5 A list of generic named entity types with the kinds of entities they refer to.

Named entity tagging is a useful first step in lots of natural language understanding tasks. In sentiment analysis we might want to know a consumer’s sentiment toward a particular entity. Entities are a useful first stage in question answering, or for linking text to information in structured knowledge sources like Wikipedia. And named entity tagging is also central to natural language understanding tasks of building semantic representations, like extracting events and the relationship between participants.

Unlike part-of-speech tagging, where there is no segmentation problem since each word gets one tag, the task of named entity recognition is to find and label spans of text, and is difficult partly because of the ambiguity of segmentation; we need to decide what’s an entity and what isn’t, and where the boundaries are. Indeed, most words in a text will not be named entities. Another difficulty is caused by type ambiguity. The mention JFK can refer to a person, the airport in New York, or any number of schools, bridges, and streets around the United States. Some examples of this kind of cross-type confusion are given in Figure 8.6.

```txt
[PER Washington] was born into slavery on the farm of James Burroughs.  
[ORG Washington] went up 2 games to 1 in the four-game series.  
Blair arrived in [LOC Washington] for what may well be his last state visit.  
In June, [GPE Washington] passed a primary seatbelt law.
```  
Figure 8.6 Examples of type ambiguities in the use of the name Washington.

The standard approach to sequence labeling for a span-recognition problem like NER is BIO tagging (Ramshaw and Marcus, 1995). This is a method that allows us to treat NER like a word-by-word sequence labeling task, via tags that capture both the boundary and the named entity type. Consider the following sentence:

[<sub>PER</sub> Jane Villanueva ] of [<sub>ORG</sub> United] , a unit of [<sub>ORG</sub> United Airlines Holding] , said the fare applies to the [<sub>LOC</sub> Chicago ] route.

Figure 8.7 shows the same excerpt represented with BIO tagging, as well as variants called IO tagging and BIOES tagging. In BIO tagging we label any token that begins a span of interest with the label B, tokens that occur inside a span are tagged with an I, and any tokens outside of any span of interest are labeled O. While there is only one O tag, we’ll have distinct B and I tags for each named entity class. The number of tags is thus 2n + 1 tags, where n is the number of entity types. BIO tagging can represent exactly the same information as the bracketed notation, but has the advantage that we can represent the task in the same simple sequence modeling way as part-of-speech tagging: assigning a single label $y_{i}$ to each input word $x_{i} \mathrm{:}$

<table><tr><td>Words</td><td>IO Label</td><td>BIO Label</td><td>BIOES Label</td></tr><tr><td>Jane</td><td>I-PER</td><td>B-PER</td><td>B-PER</td></tr><tr><td>Villanueva</td><td>I-PER</td><td>I-PER</td><td>E-PER</td></tr><tr><td>of</td><td>O</td><td>O</td><td>O</td></tr><tr><td>United</td><td>I-ORG</td><td>B-ORG</td><td>B-ORG</td></tr><tr><td>Airlines</td><td>I-ORG</td><td>I-ORG</td><td>I-ORG</td></tr><tr><td>Holding</td><td>I-ORG</td><td>I-ORG</td><td>E-ORG</td></tr><tr><td>discussed</td><td>O</td><td>O</td><td>O</td></tr><tr><td>the</td><td>O</td><td>O</td><td>O</td></tr><tr><td>Chicago</td><td>I-LOC</td><td>B-LOC</td><td>S-LOC</td></tr><tr><td>route</td><td>O</td><td>O</td><td>O</td></tr><tr><td>.</td><td>O</td><td>O</td><td>O</td></tr></table>

Figure 8.7 NER as a sequence model, showing IO, BIO, and BIOES taggings.

We’ve also shown two variant tagging schemes: IO tagging, which loses some information by eliminating the B tag, and BIOES tagging, which adds an end tag E for the end of a span, and a span tag S for a span consisting of only one word. A sequence labeler (HMM, CRF, RNN, Transformer, etc.) is trained to label each token in a text with tags that indicate the presence (or absence) of particular kinds of named entities.

## 8.4 HMM Part-of-Speech Tagging

In this section we introduce our first sequence labeling algorithm, the Hidden Markov Model, and show how to apply it to part-of-speech tagging. Recall that a sequence labeler is a model whose job is to assign a label to each unit in a sequence, thus mapping a sequence of observations to a sequence of labels of the same length. HMMs are a classic model that introduces many of the key concepts of sequence modeling that we will see again in more modern models.

An HMM is a probabilistic sequence model: given a sequence of units (words, letters, morphemes, sentences, whatever), it computes a probability distribution over possible sequences of labels and chooses the best label sequence.

## 8.4.1 Markov Chains

The HMM is based on augmenting the Markov chain. A Markov chain is a model that tells us something about the probabilities of sequences of random variables, states, each of which can take on values from some set. These sets can be words, or tags, or symbols representing anything, for example the weather. A Markov chain makes a very strong assumption that if we want to predict the future in the sequence, all that matters is the current state. All the states before the current state have no impact on the future except via the current state. It’s as if to predict tomorrow’s weather you could examine today’s weather but you weren’t allowed to look at yesterday’s weather.

![Figure 8.8](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/1d0e202a93fe8a1f6a37efc3f65bcd621657e5717e957027fc30edd468fb5508.jpg)  
Figure 8.8 A Markov chain for weather (a) and one for words (b), showing states and transitions. A start distribution π is required; setting $\pi =[0.1, 0.7, 0.2]$ for (a) would mean a probability 0.7 of starting in state 2 (cold), probability 0.1 of starting in state 1 (hot), etc.

More formally, consider a sequence of state variables $q_{1}, q_{2},..., q_{i}$ . A Markov model embodies the Markov assumption on the probabilities of this sequence: that when predicting the future, the past doesn’t matter, only the present.

Markov Assumption:

$$
P(q_{i} = a | q_{1}...q_{i - 1}) = P(q_{i} = a | q_{i - 1})\tag{8.3}
$$

Figure 8.8a shows a Markov chain for assigning a probability to a sequence of weather events, for which the vocabulary consists of HOT, COLD, and WARM. The states are represented as nodes in the graph, and the transitions, with their probabilities, as edges. The transitions are probabilities: the values of arcs leaving a given state must sum to 1. Figure 8.8b shows a Markov chain for assigning a probability to a sequence of words w<sub>1</sub>...w<sub>t</sub> . This Markov chain should be familiar; in fact, it represents a bigram language model, with each edge expressing the probability $p(w_{i} | w_{j}) !$ Given the two models in Fig. 8.8, we can assign a probability to any sequence from our vocabulary.

Formally, a Markov chain is specified by the following components:

<table><tr><td> $Q = q_{1}q_{2}\ldots q_{N}$ </td><td>a set of  $N$  states</td></tr><tr><td> $A = a_{11}a_{12}\ldots a_{N1}\ldots a_{NN}$ </td><td>a transition probability matrix  $A$ , each  $a_{ij}$  representing the probability of moving from state  $i$  to state  $j$ , s.t.  $\sum_{j=1}^{n} a_{ij} = 1 \forall i$ </td></tr><tr><td> $\pi = \pi_{1}, \pi_{2},..., \pi_{N}$ </td><td>an initial probability distribution over states.  $\pi_{i}$  is the probability that the Markov chain will start in state  $i$ . Some states  $j$  may have  $\pi_{j} = 0$ , meaning that they cannot be initial states. Also,  $\sum_{i=1}^{n} \pi_{i} = 1$ </td></tr></table>

Before you go on, use the sample probabilities in Fig. 8.8a (with $\pi =[0.1, 0.7, 0.2])$ 0 to compute the probability of each of the following sequences:

(8.4) hot hot hot hot

(8.5) cold hot cold hot

What does the difference in these probabilities tell you about a real-world weather fact encoded in Fig. 8.8a?

## 8.4.2 The Hidden Markov Model

A Markov chain is useful when we need to compute a probability for a sequence of observable events. In many cases, however, the events we are interested in are hidden: we don’t observe them directly. For example we don’t normally observe part-of-speech tags in a text. Rather, we see words, and must infer the tags from the word sequence. We call the tags hidden because they are not observed.

A hidden Markov model (HMM) allows us to talk about both observed events (like words that we see in the input) and hidden events (like part-of-speech tags) that we think of as causal factors in our probabilistic model. An HMM is specified by the following components:

<table><tr><td> $Q = q_{1}q_{2}\ldots q_{N}$ </td><td>a set of  $N$  states</td></tr><tr><td> $A = a_{11}\ldots a_{ij}\ldots a_{NN}$ </td><td>a transition probability matrix  $A$ , each  $a_{ij}$  representing the probability of moving from state  $i$  to state  $j$ , s.t.  $\sum_{j=1}^{N} a_{ij} = 1 \quad \forall i$ </td></tr><tr><td> $O = o_{1}o_{2}\ldots o_{T}$ </td><td>a sequence of  $T$  observations, each one drawn from a vocabulary  $V = v_{1}, v_{2},..., v_{V}$ </td></tr><tr><td> $B = b_{i}(o_{t})$ </td><td>a sequence of observation likelihoods, also called emission probabilities, each expressing the probability of an observation  $o_{t}$  being generated from a state  $q_{i}$ </td></tr><tr><td> $\pi = \pi_{1}, \pi_{2},..., \pi_{N}$ </td><td>an initial probability distribution over states.  $\pi_{i}$  is the probability that the Markov chain will start in state  $i$ . Some states  $j$  may have  $\pi_{j} = 0$ , meaning that they cannot be initial states. Also,  $\sum_{i=1}^{n} \pi_{i} = 1$ </td></tr></table>

A first-order hidden Markov model instantiates two simplifying assumptions. First, as with a first-order Markov chain, the probability of a particular state depends only on the previous state:

$$
\text{Markov Assumption:} \quad P(q_{i} | q_{1},..., q_{i - 1}) = P(q_{i} | q_{i - 1})\tag{8.6}
$$

Second, the probability of an output observation $o_{i}$ depends only on the state that produced the observation $q_{i}$ and not on any other states or any other observations:

Output Independence: $P(o_{i} | q_{1}, \dots q_{i}, \dots, q_{T}, o_{1}, \dots, o_{i}, \dots, o_{T}) = P(o_{i} | q_{i})$

(8.7)

## 8.4.3 The components of an HMM tagger

Let’s start by looking at the pieces of an HMM tagger, and then we’ll see how to use it to tag. An HMM has two components, the A and B probabilities.

The A matrix contains the tag transition probabilities $P(t_{i} | t_{i - 1})$ which represent the probability of a tag occurring given the previous tag. For example, modal verbs like will are very likely to be followed by a verb in the base form, a VB, like race, so we expect this probability to be high. We compute the maximum likelihood estimate of this transition probability by counting, out of the times we see the first tag in a labeled corpus, how often the first tag is followed by the second:

$$
P(t_{i} | t_{i - 1}) = \frac{C(t_{i - 1}, t_{i})}{C(t_{i - 1})}\tag{8.8}
$$

In the WSJ corpus, for example, MD occurs 13124 times of which it is followed by VB 10471, for an MLE estimate of

$$
P(VB | MD) = \frac{C(MD, VB)}{C(MD)} = \frac{10471}{13124} =.80\tag{8.9}
$$

Let’s walk through an example, seeing how these probabilities are estimated and used in a sample tagging task, before we return to the algorithm for decoding.

In HMM tagging, the probabilities are estimated by counting on a tagged training corpus. For this example we’ll use the tagged WSJ corpus.

The B emission probabilities, $P(w_{i} | t_{i})$ , represent the probability, given a tag (say MD), that it will be associated with a given word (say will). The MLE of the emission probability is

$$
P(w_{i} | t_{i}) = \frac{C(t_{i}, w_{i})}{C(t_{i})}\tag{8.10}
$$

Of the 13124 occurrences of MD in the WSJ corpus, it is associated with will 4046 times:

$$
P(will \mid MD) = \frac{C(MD, will)}{C(MD)} = \frac{4046}{13124} =.31\tag{8.11}
$$

We saw this kind of Bayesian modeling in Chapter 4; recall that this likelihood term is not asking “which is the most likely tag for the word $will ?^{\prime}$ That would be the posterior P(MD will). Instead, P(will MD) answers the slightly counterintuitive question “If we were going to generate a MD, how likely is it that this modal would be will?”

The A transition probabilities, and B observation likelihoods of the HMM are illustrated in Fig. 8.9 for three states in an HMM part-of-speech tagger; the full tagger would have one state for each tag.

## 8.4.4 HMM tagging as decoding

For any model, such as an HMM, that contains hidden variables, the task of determining the hidden variables sequence corresponding to the sequence of observations is called decoding. More formally,

Decoding: Given as input an HMM $\lambda =(A, B)$ and a sequence of observations $O = o_{1}, o_{2},..., o_{T}$ , find the most probable sequence of states $Q = q_{1} q_{2} q_{3} \ldots q_{T}$

![Figure 8.9](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/d7c738ca8d946659953f8caa2991d3117321f4cd165c6ee8389c119a9045d55d.jpg)  
Figure 8.9 An illustration of the two parts of an HMM representation: the A transition probabilities used to compute the prior probability, and the B observation likelihoods that are associated with each state, one likelihood for each possible observation word.

For part-of-speech tagging, the goal of HMM decoding is to choose the tag sequence $t_{1} \ldots t_{n}$ that is most probable given the observation sequence of n words $w_{1} \ldots w_{n} \colon$

$$
\hat{t}_{1: n} = \underset{t_{1} \ldots t_{n}}{\operatorname{argmax}} P(t_{1} \ldots t_{n} | w_{1} \ldots w_{n})\tag{8.12}
$$

The way we’ll do this in the HMM is to use Bayes’ rule to instead compute:

$$
\hat{t}_{1: n} = \underset{t_{1} \dots t_{n}}{\operatorname{argmax}} \frac{P(w_{1} \dots w_{n} | t_{1} \dots t_{n}) P(t_{1} \dots t_{n})}{P(w_{1} \dots w_{n})}\tag{8.13}
$$

Furthermore, we simplify Eq. 8.13 by dropping the denominator $P(w_{1}^{n})$

$$
\hat{t}_{1: n} = \underset{t_{1} \dots t_{n}}{\operatorname{argmax}} P(w_{1} \dots w_{n} | t_{1} \dots t_{n}) P(t_{1} \dots t_{n})\tag{8.14}
$$

HMM taggers make two further simplifying assumptions. The first is that the probability of a word appearing depends only on its own tag and is independent of neighboring words and tags:

$$
P \left(w_{1} \dots w_{n} \mid t_{1} \dots t_{n}\right) \approx \prod_{i = 1}^{n} P \left(w_{i} \mid t_{i}\right)\tag{8.15}
$$

The second assumption, the bigram assumption, is that the probability of a tag is dependent only on the previous tag, rather than the entire tag sequence;

$$
P(t_{1} \dots t_{n}) \approx \prod_{i = 1}^{n} P(t_{i} | t_{i - 1})\tag{8.16}
$$

Plugging the simplifying assumptions from Eq. 8.15 and Eq. 8.16 into Eq. 8.14 results in the following equation for the most probable tag sequence from a bigram tagger:

$$
\hat{t}_{1: n} = \underset{t_{1} \dots t_{n}}{\operatorname{argmax}} P(t_{1} \dots t_{n} | w_{1} \dots w_{n}) \approx \underset{t_{1} \dots t_{n}}{\operatorname{argmax}} \prod_{i = 1}^{n} \overbrace{P(w_{i} | t_{i})}^{\text{emission transition}} \overbrace{P(t_{i} | t_{i - 1})}\tag{8.17}
$$

The two parts of Eq. 8.17 correspond neatly to the $B$ emission probability and A transition probability that we just defined above!

## 8.4.5 The Viterbi Algorithm

<sup>Viterbi</sup>algorithm The decoding algorithm for HMMs is the Viterbi algorithm shown in Fig. 8.10. As an instance of dynamic programming, Viterbi resembles the dynamic programming minimum edit distance algorithm of Chapter 2.

```matlab
function VITERBI(observations of len T,state-graph of len N) returns best-path, path-prob
create a path probability matrix viterbi[N,T]
for each state s from 1 to N do ; initialization step
    viterbi[s,1]←πs * bs(o1)
    backpointer[s,1]←0
for each time step t from 2 to T do ; recursion step
    for each state s from 1 to N do
    viterbi[s,t]←maxN
    s'=1 viterbi[s',t-1] * as',s * bs(o_t)
    backpointer[s,t]←argmaxN
    s'=1 viterbi[s',t-1] * as',s * bs(o_t)
bestpathprob←maxN
    s=1 viterbi[s,T] ; termination step
bestpathpointer←argmaxN
    s=1 viterbi[s,T] ; termination step
bestpath←the path starting at state bestpathpointer, that follows backpointer[] to states back in time
return bestpath, bestpathprob
```  
Figure 8.10 Viterbi algorithm for finding the optimal sequence of tags. Given an observation sequence and an HMM $\overline{{\lambda}} = \left(A, B \right)$ , the algorithm returns the state path through the HMM that assigns maximum likelihood to the observation sequence.

The Viterbi algorithm first sets up a probability matrix or lattice, with one column for each observation $o_{t}$ and one row for each state in the state graph. Each column thus has a cell for each state $q_{i}$ in the single combined automaton. Figure 8.11 shows an intuition of this lattice for the sentence Janet will back the bill.

Each cell of the lattice, $\nu_{t}(j)$ , represents the probability that the HMM is in state $j$ after seeing the first t observations and passing through the most probable state sequence $q_{1},..., q_{t - 1}$ , given the HMM λ . The value of each cell $\nu_{t}(j)$ is computed by recursively taking the most probable path that could lead us to this cell. Formally, each cell expresses the probability

$$
v_{t}(j) = \max_{q_{1}, \dots, q_{t - 1}} P \left(q_{1} \dots q_{t - 1}, o_{1}, o_{2} \dots o_{t}, q_{t} = j \mid \lambda\right)\tag{8.18}
$$

We represent the most probable path by taking the maximum over all possible previous state sequences max . Like other dynamic programming algorithms, $q_{1},..., q_{t -}$ Viterbi fills each cell recursively. Given that we had already computed the probability of being in every state at time $t - 1$ , we compute the Viterbi probability by taking the most probable of the extensions of the paths that lead to the current cell. For a given state $q_{j}$ at time $t,$ the value $\nu_{t}(j)$ is computed as

$$
v_{t}(j) = \max_{i = 1}^{N} v_{t - 1}(i) a_{ij} b_{j} \left(o_{t}\right)\tag{8.19}
$$

The three factors that are multiplied in Eq. 8.19 for extending the previous paths to compute the Viterbi probability at time t are

![Figure 8.11](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/9607125ddec1144c1e61644d2f5221de4f651965ea1e733a688a63e11ef67846.jpg)  
Figure 8.11 A sketch of the lattice for Janet will back the bill, showing the possible tags (q ) for each word and highlighting the path corresponding to the correct tag sequence through the hidden states. States (parts of speech) which have a zero probability of generating a particular word according to the B matrix (such as the probability that a determiner DT will be realized as Janet) are greyed out.

$\nu_{t - 1}(i)$ the previous Viterbi path probability from the previous time step $a_{ij}$ the transition probability from previous state $q_{i}$ to current state $q_{j}$ $b_{j}(o_{t})$ the state observation likelihood of the observation symbol $o_{t}$ given the current state j

## 8.4.6 Working through an example

Let’s tag the sentence Janet will back the bill; the goal is the correct series of tags (see also Fig. 8.11):

(8.20) Janet/NNP will/MD back/VB the/DT bill/NN

<table><tr><td></td><td>NNP</td><td>MD</td><td>VB</td><td>JJ</td><td>NN</td><td>RB</td><td>DT</td></tr><tr><td></td><td>0.2767</td><td>0.0006</td><td>0.0031</td><td>0.0453</td><td>0.0449</td><td>0.0510</td><td>0.2026</td></tr><tr><td>NNP</td><td>0.3777</td><td>0.0110</td><td>0.0009</td><td>0.0084</td><td>0.0584</td><td>0.0090</td><td>0.0025</td></tr><tr><td>MD</td><td>0.0008</td><td>0.0002</td><td>0.7968</td><td>0.0005</td><td>0.0008</td><td>0.1698</td><td>0.0041</td></tr><tr><td>VB</td><td>0.0322</td><td>0.0005</td><td>0.0050</td><td>0.0837</td><td>0.0615</td><td>0.0514</td><td>0.2231</td></tr><tr><td>JJ</td><td>0.0366</td><td>0.0004</td><td>0.0001</td><td>0.0733</td><td>0.4509</td><td>0.0036</td><td>0.0036</td></tr><tr><td>NN</td><td>0.0096</td><td>0.0176</td><td>0.0014</td><td>0.0086</td><td>0.1216</td><td>0.0177</td><td>0.0068</td></tr><tr><td>RB</td><td>0.0068</td><td>0.0102</td><td>0.1011</td><td>0.1012</td><td>0.0120</td><td>0.0728</td><td>0.0479</td></tr><tr><td>DT</td><td>0.1147</td><td>0.0021</td><td>0.0002</td><td>0.2157</td><td>0.4744</td><td>0.0102</td><td>0.0017</td></tr></table>

Figure 8.12 The A transition probabilities P(t<sub>i|</sub>t<sub>i 1</sub>) computed from the WSJ corpus without smoothing. Rows are labeled with the conditioning event; thus P(V B MD) is 0.7968.

Let the HMM be defined by the two tables in Fig. 8.12 and Fig. 8.13. Figure 8.12 lists the $a_{ij}$ probabilities for transitioning between the hidden states (part-of-speech tags). Figure 8.13 expresses the $b_{i}(o_{t})$ probabilities, the observation likelihoods of words given tags. This table is (slightly simplified) from counts in the WSJ corpus. So the word Janet only appears as an NNP, back has 4 possible parts of speech, and the word the can appear as a determiner or as an NNP (in titles like “Somewhere Over the Rainbow” all words are tagged as NNP).

<table><tr><td></td><td>Janet</td><td>will</td><td>back</td><td>the</td><td>bill</td></tr><tr><td>NNP</td><td>0.000032</td><td>0</td><td>0</td><td>0.000048</td><td>0</td></tr><tr><td>MD</td><td>0</td><td>0.308431</td><td>0</td><td>0</td><td>0</td></tr><tr><td>VB</td><td>0</td><td>0.000028</td><td>0.000672</td><td>0</td><td>0.000028</td></tr><tr><td>JJ</td><td>0</td><td>0</td><td>0.000340</td><td>0</td><td>0</td></tr><tr><td>NN</td><td>0</td><td>0.000200</td><td>0.000223</td><td>0</td><td>0.002337</td></tr><tr><td>RB</td><td>0</td><td>0</td><td>0.010446</td><td>0</td><td>0</td></tr><tr><td>DT</td><td>0</td><td>0</td><td>0</td><td>0.506099</td><td>0</td></tr></table>

Figure 8.13 Observation likelihoods B computed from the WSJ corpus without smoothing, simplified slightly.

![Figure 8.14](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/57d706b79b4b2c81565311e2eae4d47db59b80643745cdb0b5114a588dcb2e8d.jpg)  
Figure 8.14 The first few entries in the individual state columns for the Viterbi algorithm. Each cell keeps the probability of the best path so far and a pointer to the previous cell along that path. We have only filled out columns 1 and 2; to avoid clutter most cells with value 0 are left empty. The rest is left as an exercise for the reader. After the cells are filled in, backtracing from the end state, we should be able to reconstruct the correct state sequence NNP MD VB DT NN.

Figure 8.14 shows a fleshed-out version of the sketch we saw in Fig. 8.11, the Viterbi lattice for computing the best hidden state sequence for the observation sequence Janet will back the bill.

There are N = 5 state columns. We begin in column 1 (for the word Janet) by setting the Viterbi value in each cell to the product of the π transition probability (the start probability for that state i, which we get from the <s > entry of Fig. 8.12), and the observation likelihood of the word Janet given the tag for that cell. Most of the cells in the column are zero since the word Janet cannot be any of those tags. The reader should find this in Fig. 8.14.

Next, each cell in the will column gets updated. For each state, we compute the value viterbi[s,t] by taking the maximum over the extensions of all the paths from the previous column that lead to the current cell according to Eq. 8.19. We have shown the values for the MD, VB, and NN cells. Each cell gets the max of the 7 values from the previous column, multiplied by the appropriate transition probability; as it happens in this case, most of them are zero from the previous column. The remaining value is multiplied by the relevant observation probability, and the (trivial) max is taken. In this case the final value, 2.772e-8, comes from the NNP state at the previous column. The reader should fill in the rest of the lattice in Fig. 8.14 and backtrace to see whether or not the Viterbi algorithm returns the gold state sequence NNP MD VB DT NN.

## 8.5 Conditional Random Fields (CRFs)

While the HMM is a useful and powerful model, it turns out that HMMs need a number of augmentations to achieve high accuracy. For example, in POS tagging as in other tasks, we often run into unknown words: proper names and acronyms are created very often, and even new common nouns and verbs enter the language at a surprising rate. It would be great to have ways to add arbitrary features to help with this, perhaps based on capitalization or morphology (words starting with capital letters are likely to be proper nouns, words ending with -ed tend to be past tense (VBD or VBN), etc.) Or knowing the previous or following words might be a useful feature (if the previous word is the, the current tag is unlikely to be a verb).

Although we could try to hack the HMM to find ways to incorporate some of these, in general it’s hard for generative models like HMMs to add arbitrary features directly into the model in a clean way. We’ve already seen a model for combining arbitrary features in a principled way: log-linear models like the logistic regression model of Chapter 5! But logistic regression isn’t a sequence model; it assigns a class to a single observation.

Luckily, there is a discriminative sequence model based on log-linear models: the conditional random field (CRF). We’ll describe here the linear chain CRF, the version of the CRF most commonly used for language processing, and the one whose conditioning closely matches the HMM.

Assuming we have a sequence of input words $X = x_{1}^{n} = x_{1}...x_{n}$ and want to compute a sequence of output tags $Y = y_{1}^{n} = y_{1}...yn$ . In an HMM to compute the best tag sequence that maximizes $P(\boldsymbol{Y} | \boldsymbol{X})$ we rely on Bayes’ rule and the likelihood $P(X | Y)$ :

$$
\begin{array}{ll} \hat{Y} & = \underset{Y}{\operatorname{argmax}} p(Y | X) \\ & = \underset{Y}{\operatorname{argmax}} p(X | Y) p(Y) \\ & = \underset{Y}{\operatorname{argmax}} \prod_{i} p(x_{i} | y_{i}) \prod_{i} p(y_{i} | y_{i - 1}) \end{array}\tag{8.21}
$$

In a CRF, by contrast, we compute the posterior $p(Y | X)$ directly, training the

CRF to discriminate among the possible tag sequences:

$$
\hat{Y} = \underset{Y \in \mathcal{Y}}{\operatorname{argmax}} P(Y | X)\tag{8.22}
$$

However, the CRF does not compute a probability for each tag at each time step. Instead, at each time step the CRF computes log-linear functions over a set of relevant features, and these local features are aggregated and normalized to produce a global probability for the whole sequence.

Let’s introduce the CRF more formally, again using X and Y as the input and output sequences. A CRF is a log-linear model that assigns a probability to an entire output (tag) sequence Y , out of all possible sequences Y, given the entire input (word) sequence X. We can think of a CRF as like a giant version of what multinomial logistic regression does for a single token. Recall that the feature function f in regular multinomial logistic regression maps a tuple of a token x and a label y into a feature vector. In a CRF, the function $F$ maps an entire input sequence X and an entire output sequence Y to a feature vector. Let’s assume we have K features, with a weight $w_{k}$ for each feature $F_{k} \mathrm{.}$ :

$$
p(Y | X) = \frac{\exp \left(\sum_{k = 1}^{K} w_{k} F_{k}(X, Y)\right)}{\sum_{Y^{\prime} \in \mathcal{Y}} \exp \left(\sum_{k = 1}^{K} w_{k} F_{k}(X, Y^{\prime})\right)}\tag{8.23}
$$

It’s common to also describe the same equation by pulling out the denominator into a function $\mathbf{{Z}(X)}$ :

$$
p(Y | X) = \frac{1}{Z(X)} \exp \left(\sum_{k = 1}^{K} w_{k} F_{k}(X, Y)\right)\tag{8.24}
$$

$$
Z(X) = \sum_{Y^{\prime} \in \mathcal{Y}} \exp \left(\sum_{k = 1}^{K} w_{k} F_{k}(X, Y^{\prime})\right)\tag{8.25}
$$

We’ll call these K functions $F_{k}(X, Y)$ global features, since each one is a property of the entire input sequence X and output sequence Y . We compute them by decomposing into a sum of local features for each position i in $Y \colon$ :

$$
F_{k}(X, Y) = \sum_{i = 1}^{n} f_{k}(y_{i - 1}, y_{i}, X, i)\tag{8.26}
$$

Each of these local features $f_{k}$ in a linear-chain CRF is allowed to make use of the current output token $y_{i},$ , the previous output token $y_{i - 1}$ , the entire input string X (or any subpart of it), and the current position i. This constraint to only depend on the current and previous output tokens $y_{i}$ and $y_{i - 1}$ are what characterizes a linear chain CRF. As we will see, this limitation makes it possible to use versions of the efficient Viterbi and Forward-Backwards algorithms from the HMM. A general CRF, by contrast, allows a feature to make use of any output token, and are thus necessary for tasks in which the decision depend on distant output tokens, like $y_{i - 4}.$ . General CRFs require more complex inference, and are less commonly used for language processing.

## 8.5.1 Features in a CRF POS Tagger

Let’s look at some of these features in detail, since the reason to use a discriminative sequence model is that it’s easier to incorporate a lot of features.<sup>2</sup>

Again, in a linear-chain CRF, each local feature $f_{k}$ at position i can depend on any information from: $(y_{i - 1}, y_{i}, X, i)$ . So some legal features representing common situations might be the following:

$$
\begin{array}{l} \mathbb{1} \left\{x_{i} = the, y_{i} = \text{DET} \right\} \\ \mathbb{1} \left\{y_{i} = \text{PROPN}, x_{i + 1} = Street, y_{i - 1} = \text{NUM} \right\} \\ \mathbb{1} \left\{y_{i} = \text{VERB}, y_{i - 1} = \text{AUX} \right\} \end{array}
$$

For simplicity, we’ll assume all CRF features take on the value 1 or 0. Above, we explicitly use the notation $\mathbb{1} \{x\}$ to mean $^{* *} 1$ if x is true, and 0 otherwise”. From now on, we’ll leave off the <sup>1</sup> when we define features, but you can assume each feature has it there implicitly.

Although the idea of what features to use is done by the system designer by hand, the specific features are automatically populated by using feature templates as we briefly mentioned in Chapter 5. Here are some templates that only use information from $y_{i - 1}, y_{i}, X, i)$ :

$$
\left< y_{i}, x_{i} \right >, \left< y_{i}, y_{i - 1} \right >, \left< y_{i}, x_{i - 1}, x_{i + 2} \right>
$$

These templates automatically populate the set of features from every instance in the training and test set. Thus for our example Janet/NNP will/MD back/VB the/DT bill/NN, when $x_{i}$ is the word back, the following features would be generated and have the value 1 (we’ve assigned them arbitrary feature numbers):

$$
\begin{array}{l} f_{3743}: y_{i} = \text{VB and} x_{i} = \text{back} \\ f_{156}: y_{i} = \text{VB and} y_{i - 1} = \text{MD} \\ f_{99732}: y_{i} = \text{VB and} x_{i - 1} = \text{will and} x_{i + 2} = \text{bill} \end{array}
$$

It’s also important to have features that help with unknown words. One of the most important is word shape features, which represent the abstract letter pattern of the word by mapping lower-case letters to $\mathbf{\epsilon} \cdot \mathbf{\epsilon}_{\mathbf{X}} \mathbf{\epsilon}^{\prime}$ , upper-case to $\mathbf{\delta}^{\bullet} \mathbf{X}^{\bullet}$ , numbers to $\because d^{\bullet}$ , and retaining punctuation. Thus for example I.M.F would map to X.X.X. and DC10-30 would map to XXdd-dd. A second class of shorter word shape features is also used. In these features consecutive character types are removed, so words in all caps map to $\mathrm{X,}$ words with initial-caps map to Xx, DC10-30 would be mapped to Xd-d but I.M.F would still map to X.X.X. Prefix and suffix features are also useful. In summary, here are some sample feature templates that help with unknown words:

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
$x_{i}$ contains a particular prefix (perhaps from all prefixes of length $\leq 2$)  
$x_{i}$ contains a particular suffix (perhaps from all suffixes of length $\leq 2$)  
$x_{i}$'s word shape  
$x_{i}$'s short word shape
</div>

For example the word well-dressed might generate the following non-zero valued feature values:

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
prefix $(x_{i}) = \mathbf{w}$   
prefix $(x_{i}) = \mathbf{we}$   
suffix $(x_{i}) = \mathbf{ed}$   
suffix $(x_{i}) = \mathbf{d}$   
word-shape $(x_{i}) = \mathbf{xxxx - xxxxxxxx}$   
short-word-shape $(x_{i}) = \mathbf{x} - \mathbf{x}$
</div>

The known-word templates are computed for every word seen in the training set; the unknown word features can also be computed for all words in training, or only on training words whose frequency is below some threshold. The result of the known-word templates and word-signature features is a very large set of features. Generally a feature cutoff is used in which features are thrown out if they have count < 5 in the training set.

Remember that in a CRF we don’t learn weights for each of these local features $f_{k}.$ Instead, we first sum the values of each local feature (for example feature $f_{3743})$ over the entire sentence, to create each global feature (for example $F_{3743})$ . It is those global features that will then be multiplied by weight w<sub>3743</sub>. Thus for training and inference there is always a fixed set of K features with K weights, even though the length of each sentence is different.

## 8.5.2 Features for CRF Named Entity Recognizers

A CRF for NER makes use of very similar features to a POS tagger, as shown in Figure 8.15.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
identity of $w_{i}$, identity of neighboring words
embeddings for $w_{i}$, embeddings for neighboring words
part of speech of $w_{i}$, part of speech of neighboring words
presence of $w_{i}$ in a gazetteer
$w_{i}$ contains a particular prefix (from all prefixes of length $\leq 4$)
$w_{i}$ contains a particular suffix (from all suffixes of length $\leq 4$)
word shape of $w_{i}$, word shape of neighboring words
short word shape of $w_{i}$, short word shape of neighboring words
gazetteer features
</div>

Figure 8.15 Typical features for a feature-based NER system.

One feature that is especially useful for locations is a gazetteer, a list of place names, often providing millions of entries for locations with detailed geographical and political information.<sup>3</sup> This can be implemented as a binary feature indicating a phrase appears in the list. Other related resources like name-lists, for example from the United States Census Bureau<sup>4</sup>, can be used, as can other entity dictionaries like lists of corporations or products, although they may not be as helpful as a gazetteer (Mikheev et al., 1999).

The sample named entity token L’Occitane would generate the following nonzero valued feature values (assuming that L’Occitane is neither in the gazetteer nor the census).

$$
\begin{array}{ll} \text{prefix}(x_{i}) = \text{L} & \text{suffix}(x_{i}) = \text{tane} \\ \text{prefix}(x_{i}) = \text{L}^{\prime} & \text{suffix}(x_{i}) = \text{ane} \\ \text{prefix}(x_{i}) = \text{L}^{\prime} 0 & \text{suffix}(x_{i}) = \text{ne} \\ \text{prefix}(x_{i}) = \text{L}^{\prime} 0 \text{c} & \text{suffix}(x_{i}) = \text{e} \\ \text{word - shape}(x_{i}) = \text{X}^{\prime} \text{Xxxxxxxxxx} & \text{short - word - shape}(x_{i}) = \text{X}^{\prime} \text{Xx} \end{array}
$$

Figure 8.16 illustrates the result of adding part-of-speech tags and some shape information to our earlier example.

<table><tr><td>Words</td><td>POS</td><td>Short shape</td><td>Gazetteer</td><td>BIO Label</td></tr><tr><td>Jane</td><td>NNP</td><td>Xx</td><td>0</td><td>B-PER</td></tr><tr><td>Villanueva</td><td>NNP</td><td>Xx</td><td>1</td><td>I-PER</td></tr><tr><td>of</td><td>IN</td><td>x</td><td>0</td><td>O</td></tr><tr><td>United</td><td>NNP</td><td>Xx</td><td>0</td><td>B-ORG</td></tr><tr><td>Airlines</td><td>NNP</td><td>Xx</td><td>0</td><td>I-ORG</td></tr><tr><td>Holding</td><td>NNP</td><td>Xx</td><td>0</td><td>I-ORG</td></tr><tr><td>discussed</td><td>VBD</td><td>x</td><td>0</td><td>O</td></tr><tr><td>the</td><td>DT</td><td>x</td><td>0</td><td>O</td></tr><tr><td>Chicago</td><td>NNP</td><td>Xx</td><td>1</td><td>B-LOC</td></tr><tr><td>route</td><td>NN</td><td>x</td><td>0</td><td>O</td></tr><tr><td>.</td><td>.</td><td>.</td><td>0</td><td>O</td></tr></table>

Figure 8.16 Some NER features for a sample sentence, assuming that Chicago and Villanueva are listed as locations in a gazetteer. We assume features only take on the values 0 or 1, so the first POS feature, for example, would be represented as <sup>1</sup> POS = NNP .

## 8.5.3 Inference and Training for CRFs

How do we find the best tag sequence $\hat{Y}$ for a given input X? We start with Eq. 8.22:

$$
\begin{array}{l} \hat{Y} = \underset{Y \in \mathcal{Y}}{\operatorname{argmax}} P(Y | X) \\ = \underset{Y \in \mathcal{Y}}{\operatorname{argmax}} \frac{1}{Z(X)} \exp \left(\sum_{k = 1}^{K} w_{k} F_{k}(X, Y)\right) \\ = \underset{Y \in \mathcal{Y}}{\operatorname{argmax}} \exp \left(\sum_{k = 1}^{K} w_{k} \sum_{i = 1}^{n} f_{k}(y_{i - 1}, y_{i}, X, i)\right) \\ = \underset{Y \in \mathcal{Y}}{\operatorname{argmax}} \sum_{k = 1}^{K} w_{k} \sum_{i = 1}^{n} f_{k}(y_{i - 1}, y_{i}, X, i) \\ = \underset{Y \in \mathcal{Y}}{\operatorname{argmax}} \sum_{i = 1}^{n} \sum_{k = 1}^{K} w_{k} f_{k}(y_{i - 1}, y_{i}, X, i) \end{array}\tag{8.27}
$$

(8.28)

(8.29)

(8.30)

We can ignore the exp function and the denominator $Z(X)$ , as we do above, because exp doesn’t change the argmax, and the denominator $Z(X)$ is constant for a given observation sequence $X$ .

How should we decode to find this optimal tag sequence $\hat{y} ?$ Just as with HMMs, we’ll turn to the Viterbi algorithm, which works because, like the HMM, the linearchain CRF depends at each timestep on only one previous output token $y_{i - 1}$

Concretely, this involves filling an $N \times T$ array with the appropriate values, maintaining backpointers as we proceed. As with HMM Viterbi, when the table is filled, we simply follow pointers back from the maximum value in the final column to retrieve the desired set of labels.

The requisite changes from HMM Viterbi have to do only with how we fill each cell. Recall from Eq. 8.19 that the recursive step of the Viterbi equation computes the Viterbi value of time t for state j as

$$
v_{t}(j) = \max_{i = 1}^{N} v_{t - 1}(i) a_{ij} b_{j} \left(o_{t}\right); 1 \leq j \leq N, 1 < t \leq T\tag{8.31}
$$

which is the HMM implementation of

$$
v_{t}(j) = \max_{i = 1}^{N} v_{t - 1}(i) P \left(s_{j} \mid s_{i}\right) P \left(o_{t} \mid s_{j}\right) 1 \leq j \leq N, 1 < t \leq T\tag{8.32}
$$

The CRF requires only a slight change to this latter formula, replacing the a and b prior and likelihood probabilities with the CRF features:

$$
v_{t}(j) = \max_{i = 1}^{N} v_{t - 1}(i) \sum_{k = 1}^{K} w_{k} f_{k} \left(y_{t - 1}, y_{t}, X, t\right) 1 \leq j \leq N, 1 < t \leq T\tag{8.33}
$$

Learning in CRFs relies on the same supervised learning algorithms we presented for logistic regression. Given a sequence of observations, feature functions, and corresponding outputs, we use stochastic gradient descent to train the weights to maximize the log-likelihood of the training corpus. The local nature of linear-chain CRFs means that a CRF version of the forward-backward algorithm (see Appendix A) can be used to efficiently compute the necessary derivatives. As with logistic regression, L1 or L2 regularization is important,

## 8.6 Evaluation of Named Entity Recognition

Part-of-speech taggers are evaluated by the standard metric of accuracy. Named entity recognizers are evaluated by recall, precision, and $\mathbf{F}_{1}$ measure. Recall that recall is the ratio of the number of correctly labeled responses to the total that should have been labeled; precision is the ratio of the number of correctly labeled responses to the total labeled; and F-measure is the harmonic mean of the two.

To know if the difference between the $\mathrm{F}_{1}$ scores of two MT systems is a significant difference, we use the paired bootstrap test, or the similar randomization test (Section 4.9).

For named entities, the entity rather than the word is the unit of response. Thus in the example in Fig. 8.16, the two entities Jane Villanueva and United Airlines Holding and the non-entity discussed would each count as a single response.

The fact that named entity tagging has a segmentation component which is not present in tasks like text categorization or part-of-speech tagging causes some problems with evaluation. For example, a system that labeled Jane but not Jane Villanueva as a person would cause two errors, a false positive for O and a false negative for I-PER. In addition, using entities as the unit of response but words as the unit of training means that there is a mismatch between the training and test conditions.

## 8.7 Further Details

In this section we summarize a few remaining details of the data and models, beginning with data. Since the algorithms we have presented are supervised, having labeled data is essential for training and test. A wide variety of datasets exist for part-of-speech tagging and/or NER. The Universal Dependencies (UD) dataset (Nivre et al., 2016b) has POS tagged corpora in 92 languages at the time of this writing, as do the Penn Treebanks in English, Chinese, and Arabic. OntoNotes has corpora labeled for named entities in English, Chinese, and Arabic (Hovy et al., 2006). Named entity tagged corpora also available in particular domains, such as for biomedical (Bada et al., 2012) and literary text (Bamman et al., 2019).

## 8.7.1 Bidirectionality

One problem with the CRF and HMM architectures as presented is that the models are exclusively run left-to-right. While the Viterbi algorithm still allows present decisions to be influenced indirectly by future decisions, it would help even more if a decision about word $w_{i}$ could directly use information about future tags $t_{i + 1}$ and $t_{i + 2}$

Alternatively, any sequence model can be turned into a bidirectional model by using multiple passes. For example, the first pass would use only part-of-speech features from already-disambiguated words on the left. In the second pass, tags for all words, including those on the right, can be used. Alternately, the tagger can be run twice, once left-to-right and once right-to-left. In Viterbi decoding, the labeler would chooses the higher scoring of the two sequences (left-to-right or right-to-left). Bidirectional models are quite standard for neural models, as we will see with the biLSTM models to be introduced in Chapter 9.

## 8.7.2 Rule-based Methods

While machine learned (neural or CRF) sequence models are the norm in academic research, commercial approaches to NER are often based on pragmatic combinations of lists and rules, with some smaller amount of supervised machine learning (Chiticariu et al., 2013). For example in the IBM System T architecture, a user specifies declarative constraints for tagging tasks in a formal query language that includes regular expressions, dictionaries, semantic constraints, and other operators, which the system compiles into an efficient extractor (Chiticariu et al., 2018).

One common approach is to make repeated rule-based passes over a text, starting with rules with very high precision but low recall, and, in subsequent stages, using machine learning methods that take the output of the first pass into account.

1. First, use high-precision rules to tag unambiguous entity mentions.

2. Then, search for substring matches of the previously detected names.

3. Use application-specific name lists to find likely domain-specific mentions.

4. Finally, apply supervised sequence labeling techniques that use tags from previous stages as additional features.

Rule-based methods were also the earliest methods for part-of-speech tagging. Rule-based taggers like the English Constraint Grammar system (Karlsson et al. 1995, Voutilainen 1999). use the two-stage formalism that was invented in the 1950s and 1960s: a morphological analyzer with tens of thousands of word stem entries returns all parts of speech for a word. Then a large set of thousands of constraints are applied to the input sentence to rule out parts of speech inconsistent with the context.

## 8.7.3 POS Tagging for Morphologically Rich Languages

Augmentations to tagging algorithms become necessary when dealing with languages with rich morphology like Czech, Hungarian and Turkish.

These productive word-formation processes result in a large vocabulary for these languages: a 250,000 word token corpus of Hungarian has more than twice as many word types as a similarly sized corpus of English (Oravecz and Dienes, 2002), while a 10 million word token corpus of Turkish contains four times as many word types as a similarly sized English corpus (Hakkani-Tur et al., 2002) ¨ . Large vocabularies mean many unknown words, and these unknown words cause significant performance degradations in a wide variety of languages (including Czech, Slovene, Estonian, and Romanian) (Hajic, 2000)ˇ .

Highly inflectional languages also have much more information than English coded in word morphology, like case (nominative, accusative, genitive) or gender (masculine, feminine). Because this information is important for tasks like parsing and coreference resolution, part-of-speech taggers for morphologically rich languages need to label words with case and gender information. Tagsets for morphologically rich languages are therefore sequences of morphological tags rather than a single primitive tag. Here’s a Turkish example, in which the word izin has three possible morphological/part-of-speech tags and meanings (Hakkani-Tur et al., 2002)¨ :

1. Yerdeki izin temizlenmesi gerek. iz + Noun+A3sg+Pnon+Gen The trace on the floor should be cleaned.

2. Uzerinde parmak <sup>¨</sup> izin kalmis¸ iz + Noun+A3sg+P2sg+Nom Your finger print is left on (it).

3. Ic¸eri girmek ic¸in izin alman gerekiyor. izin + Noun+A3sg+Pnon+Nom You need permission to enter.

Using a morphological parse sequence like Noun+A3sg+Pnon+Gen as the partof-speech tag greatly increases the number of parts of speech, and so tagsets can be 4 to 10 times larger than the 50–100 tags we have seen for English. With such large tagsets, each word needs to be morphologically analyzed to generate the list of possible morphological tag sequences (part-of-speech tags) for the word. The role of the tagger is then to disambiguate among these tags. This method also helps with unknown words since morphological parsers can accept unknown stems and still segment the affixes properly.

## 8.8 Summary

This chapter introduced parts of speech and named entities, and the tasks of partof-speech tagging and named entity recognition:

- Languages generally have a small set of closed class words that are highly frequent, ambiguous, and act as function words, and open-class words like nouns, verbs, adjectives. Various part-of-speech tagsets exist, of between 40 and 200 tags.

- Part-of-speech tagging is the process of assigning a part-of-speech label to each of a sequence of words.

- Named entities are words for proper nouns referring mainly to people, places, and organizations, but extended to many other types that aren’t strictly entities or even proper nouns.

- Two common approaches to sequence modeling are a generative approach, HMM tagging, and a discriminative approach, CRF tagging. We will see a neural approach in following chapters.

- The probabilities in HMM taggers are estimated by maximum likelihood estimation on tag-labeled training corpora. The Viterbi algorithm is used for decoding, finding the most likely tag sequence

- Conditional Random Fields or CRF taggers train a log-linear model that can choose the best tag sequence given an observation sequence, based on features that condition on the output tag, the prior output tag, the entire input sequence, and the current timestep. They use the Viterbi algorithm for inference, to choose the best sequence of tags, and a version of the Forward-Backward algorithm (see Appendix A) for training,

## Bibliographical and Historical Notes

What is probably the earliest part-of-speech tagger was part of the parser in Zellig Harris’s Transformations and Discourse Analysis Project (TDAP), implemented between June 1958 and July 1959 at the University of Pennsylvania (Harris, 1962), although earlier systems had used part-of-speech dictionaries. TDAP used 14 handwritten rules for part-of-speech disambiguation; the use of part-of-speech tag sequences and the relative frequency of tags for a word prefigures modern algorithms. The parser was implemented essentially as a cascade of finite-state transducers; see Joshi and Hopely (1999) and Karttunen (1999) for a reimplementation.

The Computational Grammar Coder (CGC) of Klein and Simmons (1963) had three components: a lexicon, a morphological analyzer, and a context disambiguator. The small 1500-word lexicon listed only function words and other irregular words. The morphological analyzer used inflectional and derivational suffixes to assign part-of-speech classes. These were run over words to produce candidate parts of speech which were then disambiguated by a set of 500 context rules by relying on surrounding islands of unambiguous words. For example, one rule said that between an ARTICLE and a VERB, the only allowable sequences were ADJ-NOUN, NOUN-ADVERB, or NOUN-NOUN. The TAGGIT tagger (Greene and Rubin, 1971) used the same architecture as Klein and Simmons (1963), with a bigger dictionary and more tags (87). TAGGIT was applied to the Brown corpus and, according to Francis and Kucera (1982, p. 9)ˇ , accurately tagged 77% of the corpus; the remainder of the Brown corpus was then tagged by hand. All these early algorithms were based on a two-stage architecture in which a dictionary was first used to assign each word a set of potential parts of speech, and then lists of handwritten disambiguation rules winnowed the set down to a single part of speech per word.

Probabilities were used in tagging by Stolz et al. (1965) and a complete probabilistic tagger with Viterbi decoding was sketched by Bahl and Mercer (1976). The Lancaster-Oslo/Bergen (LOB) corpus, a British English equivalent of the Brown corpus, was tagged in the early 1980’s with the CLAWS tagger (Marshall 1983; Marshall 1987; Garside 1987), a probabilistic algorithm that approximated a simplified HMM tagger. The algorithm used tag bigram probabilities, but instead of storing the word likelihood of each tag, the algorithm marked tags either as rare (P(tag word) < .01) infrequent $(P(\mathrm{tag} | \mathrm{word}) <.10)$ or normally frequent $(P(\mathrm{tag} | \mathrm{word}) >.10)$

DeRose (1988) developed a quasi-HMM algorithm, including the use of dynamic programming, although computing $P(t | w) P(w)$ instead of $P(w | t) P(w)$ . The same year, the probabilistic PARTS tagger of Church (1988), (1989) was probably the first implemented HMM tagger, described correctly in Church (1989), although Church (1988) also described the computation incorrectly as $P(t | w) P(w)$ instead of $P(w | t) P(w)$ . Church (p.c.) explained that he had simplified for pedagogical purposes because using the probability $P(t | w)$ made the idea seem more understandable as “storing a lexicon in an almost standard form”.

Later taggers explicitly introduced the use of the hidden Markov model (Kupiec 1992; Weischedel et al. 1993; Schutze and Singer 1994¨ ). Merialdo (1994) showed that fully unsupervised EM didn’t work well for the tagging task and that reliance on hand-labeled data was important. Charniak et al. (1993) showed the importance of the most frequent tag baseline; the 92.3% number we give above was from Abney et al. (1999). See Brants (2000) for HMM tagger implementation details, including the extension to trigram contexts, and the use of sophisticated unknown word features; its performance is still close to state of the art taggers.

Log-linear models for POS tagging were introduced by Ratnaparkhi (1996), who introduced a system called MXPOST which implemented a maximum entropy Markov model (MEMM), a slightly simpler version of a CRF. Around the same time, sequence labelers were applied to the task of named entity tagging, first with HMMs (Bikel et al., 1997) and MEMMs (McCallum et al., 2000), and then once CRFs were developed (Lafferty et al. 2001), they were also applied to NER (McCallum and Li, 2003). A wide exploration of features followed (Zhou et al., 2005). Neural approaches to NER mainly follow from the pioneering results of Collobert et al. (2011), who applied a CRF on top of a convolutional net. BiLSTMs with word and character-based embeddings as input followed shortly and became a standard neural algorithm for NER (Huang et al. 2015, Ma and Hovy 2016, Lample et al. 2016) followed by the more recent use of Transformers and BERT.

The idea of using letter suffixes for unknown words is quite old; the early Klein and Simmons (1963) system checked all final letter suffixes of lengths 1-5. The unknown word features described on page 164 come mainly from Ratnaparkhi (1996), with augmentations from Toutanova et al. (2003) and Manning (2011).

State of the art POS taggers use neural algorithms, either bidirectional RNNs or Transformers like BERT; see Chapter 9 and Chapter 10. HMM (Brants 2000; Thede and Harper 1999) and CRF tagger accuracies are likely just a tad lower.

Manning (2011) investigates the remaining 2.7% of errors in a high-performing tagger (Toutanova et al., 2003). He suggests that a third or half of these remaining errors are due to errors or inconsistencies in the training data, a third might be solvable with richer linguistic models, and for the remainder the task is underspecified or unclear.

Supervised tagging relies heavily on in-domain training data hand-labeled by experts. Ways to relax this assumption include unsupervised algorithms for clustering words into part-of-speech-like classes, summarized in Christodoulopoulos et al. (2010), and ways to combine labeled and unlabeled data, for example by co-training (Clark et al. 2003; Søgaard 2010).

See Householder (1995) for historical notes on parts of speech, and Sampson (1987) and Garside et al. (1997) on the provenance of the Brown and other tagsets.

## Exercises

8.1 Find one tagging error in each of the following sentences that are tagged with the Penn Treebank tagset:

1. I/PRP need/VBP a/DT flight/NN from/IN Atlanta/NN

2. Does/VBZ this/DT flight/NN serve/VB dinner/NNS

3. I/PRP have/VB a/DT friend/NN living/VBG in/IN Denver/NNP

4. Can/VBP you/PRP list/VB the/DT nonstop/JJ afternoon/NN flights/NNS

8.2 Use the Penn Treebank tagset to tag each word in the following sentences from Damon Runyon’s short stories. You may ignore punctuation. Some of these are quite difficult; do your best.

1. It is a nice night.

2. This crap game is over a garage in Fifty-second Street. . .

3. . . . Nobody ever takes the newspapers she sells . . .

4. He is a tall, skinny guy with a long, sad, mean-looking kisser, and a mournful voice.

5. . . . I am sitting in Mindy’s restaurant putting on the gefillte fish, which is a dish I am very fond of, . . .

6. When a guy and a doll get to taking peeks back and forth at each other, why there you are indeed.

8.3 Now compare your tags from the previous exercise with one or two friend’s answers. On which words did you disagree the most? Why?

8.4 Implement the “most likely tag” baseline. Find a POS-tagged training set, and use it to compute for each word the tag that maximizes p(t w). You will need to implement a simple tokenizer to deal with sentence boundaries. Start by assuming that all unknown words are NN and compute your error rate on known and unknown words. Now write at least five rules to do a better job of tagging unknown words, and show the difference in error rates.

8.5 Build a bigram HMM tagger. You will need a part-of-speech-tagged corpus. First split the corpus into a training set and test set. From the labeled training set, train the transition and observation probabilities of the HMM tagger directly on the hand-tagged data. Then implement the Viterbi algorithm so you can decode a test sentence. Now run your algorithm on the test set. Report its error rate and compare its performance to the most frequent tag baseline.

8.6 Do an error analysis of your tagger. Build a confusion matrix and investigate the most frequent errors. Propose some features for improving the performance of your tagger on these errors.

8.7 Develop a set of regular expressions to recognize the character shape features described on page 164.

8.8 The BIO and other labeling schemes given in this chapter aren’t the only possible one. For example, the B tag can be reserved only for those situations where an ambiguity exists between adjacent entities. Propose a new set of BIO tags for use with your NER system. Experiment with it and compare its performance with the schemes presented in this chapter.

8.9 Names of works of art (books, movies, video games, etc.) are quite different from the kinds of named entities we’ve discussed in this chapter. Collect a list of names of works of art from a particular category from a Web-based source (e.g., gutenberg.org, amazon.com, imdb.com, etc.). Analyze your list and give examples of ways that the names in it are likely to be problematic for the techniques described in this chapter.

8.10 Develop an NER system specific to the category of names that you collected in the last exercise. Evaluate your system on a collection of text likely to contain instances of these named entities.

CHAPTER

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/7b0955cef1818cb639faa56473b72dabe5adf0f3c56087bb53fe1ba38c8ada0a.jpg)


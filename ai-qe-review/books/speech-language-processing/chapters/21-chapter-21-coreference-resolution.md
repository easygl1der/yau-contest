---
title: "Chapter 21 \u2014 Coreference Resolution"
book: "Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models"
book_slug: speech-language-processing
course: natural-language-processing
chapter_number: 21
citekey: jurafsky2026slp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf"
source_transcript: "transcripts/mineru/speech-language-processing/reading.md"
source_line_start: 11174
source_line_end: 11880
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 5
source_empty_image_alt: 5
non_semantic_image_alt: 1
caption_derived_image_alt: 4
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: true
  source_control_characters: 6
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - natural-language-processing
  - official-syllabus
---

# Chapter 21 — Coreference Resolution

> [[../README|本书目录]] · [[20-chapter-20-lexicons-for-sentiment-affect-and-connotation|上一章]] · [[22-chapter-22-discourse-coherence|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models（jurafsky2026slp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/speech-language-processing/reading.md)，源行 11174–11880。
> - 本章保留 5 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.442) × 1；PDF-confirmed book-specific control-codepoint pattern × 6。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Coreference Resolution

and even Stigand, the patriotic archbishop of Canterbury, found it advisable–”’

‘Found WHAT?’ said the Duck.

‘Found IT,’ the Mouse replied rather crossly: ‘of course you know what “it”means.’

‘I know what “it”means well enough, when I find a thing,’ said the Duck: ‘it’s generally a frog or a worm. The question is, what did the archbishop find?’

Lewis Carroll, Alice in Wonderland

An important component of language understanding is knowing who is being talked about in a text. Consider the following passage:

(21.1) Victoria Chen, CFO of Megabucks Banking, saw her pay jump to \$2.3 million, as the 38-year-old became the company’s president. It is widely known that she came to Megabucks from rival Lotsabucks.

Each of the underlined phrases in this passage is used by the writer to refer to a person named Victoria Chen. We call linguistic expressions like her or Victoria Chen mentions or referring expressions, and the discourse entity that is referred to (Victoria Chen) the referent. (To distinguish between referring expressions and their referents, we italicize the former.)<sup>1</sup> Two or more referring expressions that are used to refer to the same discourse entity are said to corefer; thus, Victoria Chen and she corefer in (21.1).

Coreference is an important component of natural language understanding. A dialogue system that has just told the user “There is a 2pm flight on United and a 4pm one on Cathay Pacific” must know which flight the user means by “I’ll take the second one”. A question answering system that uses Wikipedia to answer a question about Marie Curie must know who she was in the sentence “She was born in Warsaw”. And a machine translation system translating from a language like Spanish, in which pronouns can be dropped, must use coreference from the previous sentence to decide whether the Spanish sentence ‘“Me encanta el conocimiento”, dice.’ should be translated as ‘“I love knowledge”, he says’, or ‘“I love knowledge”, she says’. Indeed, this example comes from an actual news article in El Pa´ıs about a female professor and was mistranslated as “he” in machine translation because of inaccurate coreference resolution (Schiebinger, 2013).

Natural language understanding systems (and humans) interpret linguistic expressions with respect to a discourse model (Karttunen, 1969). A discourse model (Fig. 21.1) is a mental model that the understander builds incrementally when interpreting a text, containing representations of the entities referred to in the text, as well as properties of the entities and relations among them. When a referent is first mentioned in a discourse, we say that a representation for it is evoked into the model. Upon subsequent mention, this representation is accessed from the model.

![Figure 21.1](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/02a1c18a8fb31a0448c0b68babecb9e48e40cf7fd463dce77220a18dbc35a68b.jpg)  
Figure 21.1 How mentions evoke and access discourse entities in a discourse model.

Reference in a text to an entity that has been previously introduced into the discourse is called anaphora, and the referring expression used is said to be an anaphor, or anaphoric.<sup>2</sup> In passage (21.1), the pronouns she and her and the definite NP the 38-year-old are therefore anaphoric. The anaphor corefers with a prior mention (in this case Victoria Chen) that is called the antecedent. Not every referring expression is an antecedent. An entity that has only a single mention in a text (like Lotsabucks in (21.1)) is called a singleton.

In this chapter we focus on the task of coreference resolution. Coreference resolution is the task of determining whether two mentions corefer, by which we mean they refer to the same entity in the discourse model (the same discourse entity). The set of coreferring expressions is often called a coreference chain or a cluster. For example, in processing (21.1), a coreference resolution algorithm would need to find at least four coreference chains, corresponding to the four entities in the discourse model in Fig. 21.1.

1. Victoria Chen, her, the 38-year-old, She

2. Megabucks Banking, the company, Megabucks

3. <sub>{</sub>her pay<sub>}</sub>

4. Lotsabucks

Note that mentions can be nested; for example the mention her is syntactically part of another mention, her pay, referring to a completely different discourse entity.

Coreference resolution thus comprises two tasks (although they are often performed jointly): (1) identifying the mentions, and (2) clustering them into coreference chains/discourse entities.

We said that two mentions corefered if they are associated with the same discourse entity. But often we’d like to go further, deciding which real world entity is associated with this discourse entity. For example, the mention Washington might refer to the US state, or the capital city, or the person George Washington; the interpretation of the sentence will of course be very different for each of these. The task of entity linking (Ji and Grishman, 2011) or entity resolution is the task of mapping a discourse entity to some real-world individual.<sup>3</sup> We usually operationalize entity linking or resolution by mapping to an ontology: a list of entities in the world, like a gazeteer (Chapter 15). Perhaps the most common ontology used for this task is Wikipedia; each Wikipedia page acts as the unique id for a particular entity. Thus the entity linking task of wikification (Mihalcea and Csomai, 2007) is the task of deciding which Wikipedia page corresponding to an individual is being referred to by a mention. But entity linking can be done with any ontology; for example if we have an ontology of genes, we can link mentions of genes in text to the disambiguated gene name in the ontology.

In the next sections we introduce the task of coreference resolution in more detail, and offer a variety of architectures for resolution, from simple deterministic baseline algorithms to state-of-the-art neural models.

Before turning to algorithms, however, we mention some important tasks we will only touch on briefly at the end of this chapter. First are the famous Winograd Schema problems (so-called because they were first pointed out by Terry Winograd in his dissertation). These entity coreference resolution problems are designed to be too difficult to be solved by the resolution methods we describe in this chapter, and the kind of real-world knowledge they require has made them a kind of challenge task for natural language understanding. For example, consider the task of determining the correct antecedent of the pronoun they in the following example:

(21.2) The city council denied the demonstrators a permit because

a. they feared violence.

b. they advocated violence.

Determining the correct antecedent for the pronoun they requires understanding that the second clause is intended as an explanation of the first clause, and also that city councils are perhaps more likely than demonstrators to fear violence and that demonstrators might be more likely to advocate violence. Solving Winograd Schema problems requires finding way to represent or discover the necessary real world knowledge.

A problem we won’t discuss in this chapter is the related task of event coreference, deciding whether two event mentions (such as the buy and the acquisition in these two sentences from the ECB+ corpus) refer to the same event:

(21.3) AMD agreed to [buy] Markham, Ontario-based ATI for around \$5.4 billion in cash and stock, the companies announced Monday.

(21.4) The [acquisition] would turn AMD into one of the world’s largest providers of graphics chips.

Event mentions are much harder to detect than entity mentions, since they can be verbal as well as nominal. Once detected, the same mention-pair and mention-ranking models used for entities are often applied to events.

An even more complex kind of coreference is discourse deixis (Webber, 1988), in which an anaphor refers back to a discourse segment, which can be quite hard to delimit or categorize, like the examples in (21.5) adapted from Webber (1991):

(21.5) According to Soleil, Beau just opened a restaurant

a. But that turned out to be a lie.

b. But that was false.

c. That struck me as a funny way to describe the situation.

The referent of that is a speech act (see Chapter 24) in (21.5a), a proposition in (21.5b), and a manner of description in (21.5c). We don’t give algorithms in this chapter for these difficult types of non-nominal antecedents, but see Kolhatkar et al. (2018) for a survey.

## 21.1 Coreference Phenomena: Linguistic Background

We now offer some linguistic background on reference phenomena. We introduce the four types of referring expressions (definite and indefinite NPs, pronouns, and names), describe how these are used to evoke and access entities in the discourse model, and talk about linguistic features of the anaphor/antecedent relation (like number/gender agreement, or properties of verb semantics).

## 21.1.1 Types of Referring Expressions

Indefinite Noun Phrases: The most common form of indefinite reference in English is marked with the determiner a (or an), but it can also be marked by a quantifier such as some or even the determiner this. Indefinite reference generally introduces into the discourse context entities that are new to the hearer.

(21.6) a. Mrs. Martin was so very kind as to send Mrs. Goddard a beautiful goose.

b. He had gone round one day to bring her some walnuts.

c. I saw this beautiful cauliflower today.

Definite Noun Phrases: Definite reference, such as via NPs that use the English article the, refers to an entity that is identifiable to the hearer. An entity can be identifiable to the hearer because it has been mentioned previously in the text and thus is already represented in the discourse model:

(21.7) It concerns a white stallion which I have sold to an officer. But the pedigree of the white stallion was not fully established.

Alternatively, an entity can be identifiable because it is contained in the hearer’s set of beliefs about the world, or the uniqueness of the object is implied by the description itself, in which case it evokes a representation of the referent into the discourse model, as in (21.9):

(21.8) I read about it in the New York Times.

(21.9) Have you seen the car keys?

These last uses are quite common; more than half of definite NPs in newswire texts are non-anaphoric, often because they are the first time an entity is mentioned (Poesio and Vieira 1998, Bean and Riloff 1999).

Pronouns: Another form of definite reference is pronominalization, used for entities that are extremely salient in the discourse, (as we discuss below):

(21.10) Emma smiled and chatted as cheerfully as she could,

Pronouns can also participate in cataphora, in which they are mentioned before their referents are, as in (21.11).

(21.11) Even before she saw it, Dorothy had been thinking about the Emerald City every day.

Here, the pronouns she and it both occur before their referents are introduced.

Pronouns also appear in quantified contexts in which they are considered to be bound, as in (21.12).

(21.12) Every dancer brought her left arm forward.

Under the relevant reading, her does not refer to some woman in context, but instead behaves like a variable bound to the quantified expression every dancer. We are not concerned with the bound interpretation of pronouns in this chapter.

In some languages, pronouns can appear as clitics attached to a word, like lo (‘it’) in this Spanish example from AnCora (Recasens and Mart´ı, 2010):

(21.13) La intencion es reconocer el gran prestigio que tiene la marat ´ on y unir ´ lo con esta gran carrera.

‘The aim is to recognize the great prestige that the Marathon has and join it with this great race.”

Demonstrative Pronouns: Demonstrative pronouns this and that can appear either alone or as determiners, for instance, this ingredient, that spice:

(21.14) I just bought a copy of Thoreau’s Walden. I had bought one five years ago. That one had been very tattered; this one was in much better condition.

Note that this NP is ambiguous; in colloquial spoken English, it can be indefinite, as in (21.6), or definite, as in (21.14).

Zero Anaphora: Instead of using a pronoun, in some languages (including Chinese, Japanese, and Italian) it is possible to have an anaphor that has no lexical realization at all, called a zero anaphor or zero pronoun, as in the following Italian and Japanese examples from Poesio et al. (2016):

(21.15) EN [John]<sub>i</sub> went to visit some friends. On the way [he]<sub>i</sub> bought some wine.

IT [Giovanni]<sub>i</sub> ando a far visita a degli amici. Per via\` φ<sub>i</sub> compro del vino.\`

JA [John]<sub>i</sub>-wa yujin-o houmon-sita. Tochu-de φ<sub>i</sub> wain-o ka-tta.

or this Chinese example:

(21.16) [ ]前一会精神上 紧 。[0]现在 较平静了

[I] was too nervous a while ago. ... [0] am now calmer.

Zero anaphors complicate the task of mention detection in these languages.

Names: Names (such as of people, locations, or organizations) can be used to refer to both new and old entities in the discourse:

(21.17) a. Miss Woodhouse certainly had not done him justice.

b. International Business Machines sought patent compensation from Amazon; IBM had previously sued other companies.

## 21.1.2 Information Status

The way referring expressions are used to evoke new referents into the discourse (introducing new information), or access old entities from the model (old information), is called their information status or information structure. Entities can be discourse-new or discourse-old, and indeed it is common to distinguish at least three kinds of entities informationally (Prince, 1981a):

## new NPs:

brand new NPs: these introduce entities that are discourse-new and hearernew like a fruit or some walnuts.

unused NPs: these introduce entities that are discourse-new but hearer-old (like Hong Kong, Marie Curie, or the New York Times.

old NPs: also called evoked NPs, these introduce entities that already in the discourse model, hence are both discourse-old and hearer-old, like it in “I went to a new restaurant. It was...”.

inferrables: these introduce entities that are neither hearer-old nor discourse-old, but the hearer can infer their existence by reasoning based on other entities that are in the discourse. Consider the following examples:

(21.18) I went to a superb restaurant yesterday. The chef had just opened it.

(21.19) Mix flour, butter and water. Knead the dough until shiny.

Neither the chef nor the dough were in the discourse model based on the first sentence of either example, but the reader can make a bridging inference that these entities should be added to the discourse model and associated with the restaurant and the ingredients, based on world knowledge that restaurants have chefs and dough is the result of mixing flour and liquid (Haviland and Clark 1974, Webber and Baldwin 1992, Nissim et al. 2004, Hou et al. 2018).

The form of an NP gives strong clues to its information status. We often talk about an entity’s position on the given-new dimension, the extent to which the referent is given (salient in the discourse, easier for the hearer to call to mind, predictable by the hearer), versus new (non-salient in the discourse, unpredictable) (Chafe 1976, Prince 1981b, Gundel et al. 1993). A referent that is very accessible (Ariel, 2001) i.e., very salient in the hearer’s mind or easy to call to mind, can be referred to with less linguistic material. For example pronouns are used only when the referent has a high degree of activation or salience in the discourse model.<sup>4</sup> By contrast, less salient entities, like a new referent being introduced to the discourse, will need to be introduced with a longer and more explicit referring expression to help the hearer recover the referent.

Thus when an entity is first introduced into a discourse its mentions are likely to have full names, titles or roles, or appositive or restrictive relative clauses, as in the introduction of our protagonist in (21.1): Victoria Chen, CFO of Megabucks Banking. As an entity is discussed over a discourse, it becomes more salient to the hearer and its mentions on average typically becomes shorter and less informative, for example with a shortened name (for example Ms. Chen), a definite description (the 38-year-old), or a pronoun (she or her) (Hawkins 1978). However, this change in length is not monotonic, and is sensitive to discourse structure (Grosz 1977b, Reichman 1985, Fox 1993).

## 21.1.3 Complications: Non-Referring Expressions

Many noun phrases or other nominals are not referring expressions, although they may bear a confusing superficial resemblance. For example in some of the earliest computational work on reference resolution, Karttunen (1969) pointed out that the NP a car in the following example does not create a discourse referent:

(21.20) Janet doesn’t have a car.

and cannot be referred back to by anaphoric it or the car:

(21.21) \*It is a Toyota.

(21.22) \*The car is red.

We summarize here four common types of structures that are not counted as mentions in coreference tasks and hence complicate the task of mention-detection:

Appositives: An appositional structure is a noun phrase that appears next to a head noun phrase, describing the head. In English they often appear in commas, like “a unit of UAL” appearing in apposition to the NP United, or CFO of Megabucks Banking in apposition to Victoria Chen.

(21.23) Victoria Chen, CFO of Megabucks Banking, saw ...

(21.24) United, a unit of UAL, matched the fares.

Appositional NPs are not referring expressions, instead functioning as a kind of supplementary parenthetical description of the head NP. Nonetheless, sometimes it is useful to link these phrases to an entity they describe, and so some datasets like ntoNotes mark appositional relationships.

Predicative and Prenominal NPs: Predicative or attributive NPs describe properties of the head noun. In United is a unit of UAL, the NP a unit of UAL describes a property of United, rather than referring to a distinct entity. Thus they are not marked as mentions in coreference tasks; in our example the NPs \$2.3 million and the company’s president, are attributive, describing properties of her pay and the 38-year-old; Example (21.27) shows a Chinese example in which the predicate NP (中<sup>国最</sup> 的<sup>城</sup>市; China’s biggest city) is not a mention.

(21.25) her pay jumped to \$2.3 million

(21.26) the 38-year-old became the company’s president

(21.27) 上海<sup>是</sup>[中<sup>国最</sup> 的<sup>城</sup>市] [Shanghai is China’s biggest city]

Expletives: Many uses of pronouns like it in English and corresponding pronouns in other languages are not referential. Such expletive or pleonastic cases include it is raining, in idioms like hit it off, or in particular syntactic situations like clefts (21.28a) or extraposition (21.28b):

(21.28) a. It was Emma Goldman who founded Mother Earth

b. It surprised me that there was a herring hanging on her wall.

Generics: Another kind of expression that does not refer back to an entity explicitly evoked in the text is generic reference. Consider (21.29).

(21.29) I love mangos. They are very tasty.

Here, they refers, not to a particular mango or set of mangos, but instead to the class of mangos in general. The pronoun you can also be used generically:

(21.30) In July in San Francisco you have to wear a jacket.

## 21.1.4 Linguistic Properties of the Coreference Relation

Now that we have seen the linguistic properties of individual referring expressions we turn to properties of the antecedent/anaphor pair. Understanding these properties is helpful both in designing novel features and performing error analyses.

Number Agreement: Referring expressions and their referents must generally agree in number; English she/her/he/him/his/it are singular, we/us/they/them are plural, and you is unspecified for number. So a plural antecedent like the chefs cannot generally corefer with a singular anaphor like she. However, algorithms cannot enforce number agreement too strictly. First, semantically plural entities can be referred to by either it or they:

(21.31) IBM announced a new machine translation product yesterday. They have been working on it for 20 years.

Second, singular they has become much more common, in which they is used to describe singular individuals, often useful because they is gender neutral. Although recently increasing, singular they is quite old, part of English for many centuries.<sup>5</sup>

Person Agreement: English distinguishes between first, second, and third person, and a pronoun’s antecedent must agree with the pronoun in person. Thus a third person pronoun (he, she, they, him, her, them, his, her, their) must have a third person antecedent (one of the above or any other noun phrase). However, phenomena like quotation can cause exceptions; in this example I, my, and she are coreferent:

(21.32) “I voted for Nader because he was most aligned with my values,” she said.

Gender or Noun Class Agreement: In many languages, all nouns have grammatical gender or noun class<sup>6</sup> and pronouns generally agree with the grammatical gender of their antecedent. In English this occurs only with third-person singular pronouns, which distinguish between male (he, him, his), female (she, her), and nonpersonal (it) grammatical genders. Non-binary pronouns like ze or hir may also occur in more recent texts. Knowing which gender to associate with a name in text can be complex, and may require world knowledge about the individual. Some examples:

(21.33) Maryam has a theorem. She is exciting. (she=Maryam, not the theorem)

(21.34) Maryam has a theorem. It is exciting. (it=the theorem, not Maryam)

Binding Theory Constraints: The binding theory is a name for syntactic constraints on the relations between a mention and an antecedent in the same sentence (Chomsky, 1981). Oversimplifying a bit, reflexive pronouns like himself and herself corefer with the subject of the most immediate clause that contains them (21.35), whereas nonreflexives cannot corefer with this subject (21.36).

(21.35) Janet bought herself a bottle of fish sauce. [herself=Janet]

(21.36) Janet bought her a bottle of fish sauce. [her=Janet]

Recency: Entities introduced in recent utterances tend to be more salient than those introduced from utterances further back. Thus, in (21.37), the pronoun it is more likely to refer to Jim’s map than the doctor’s map.

(21.37) The doctor found an old map in the captain’s chest. Jim found an even older map hidden on the shelf. It described an island.

Grammatical Role: Entities mentioned in subject position are more salient than those in object position, which are in turn more salient than those mentioned in oblique positions. Thus although the first sentence in (21.38) and (21.39) expresses roughly the same propositional content, the preferred referent for the pronoun he varies with the subject—John in (21.38) and Bill in (21.39).

(21.38) Billy Bones went to the bar with Jim Hawkins. He called for a glass of rum. [ he = Billy ]

(21.39) Jim Hawkins went to the bar with Billy Bones. He called for a glass of rum. [ he = Jim ]

Verb Semantics: Some verbs semantically emphasize one of their arguments, biasing the interpretation of subsequent pronouns. Compare (21.40) and (21.41).

(21.40) John telephoned Bill. He lost the laptop.

(21.41) John criticized Bill. He lost the laptop.

These examples differ only in the verb used in the first sentence, yet “he” in (21.40) is typically resolved to John, whereas “he” in (21.41) is resolved to Bill. This may be due to the link between implicit causality and saliency: the implicit cause of a “criticizing” event is its object, whereas the implicit cause of a “telephoning” event is its subject. In such verbs, the entity which is the implicit cause is more salient.

Selectional Restrictions: Many other kinds of semantic knowledge can play a role in referent preference. For example, the selectional restrictions that a verb places on its arguments (Chapter 10) can help eliminate referents, as in (21.42).

(21.42) I ate the soup in my new bowl after cooking it for hours

There are two possible referents for it, the soup and the bowl. The verb eat, however, requires that its direct object denote something edible, and this constraint can rule out bowl as a possible referent.

## 21.2 Coreference Tasks and Datasets

We can formulate the task of coreference resolution as follows: Given a text T , find all entities and the coreference links between them. We evaluate our task by comparing the links our system creates with those in human-created gold coreference annotations on T .

Let’s return to our coreference example, now using superscript numbers for each coreference chain (cluster), and subscript letters for individual mentions in the cluster:

(21.43) [Victoria Chen]<sup>1</sup>, CFO of [Megabucks Banking]<sup>2</sup>, saw [[her]<sup>1</sup> pay]<sup>3</sup> jump to \$2.3 million, as [the 38-year-old]<sup>1</sup><sub>c</sub> also became [[the company $|_{b}^{2} \mathrm{\bar{s}}$ president. It is widely known that [she]<sup>1</sup> came to [Megabucks]<sup>2</sup><sub>c</sub> from rival [Lotsabucks]<sup>4</sup><sub>a</sub>.

Assuming example (21.43) was the entirety of the article, the chains for her pay and Lotsabucks are singleton mentions:

1. Victoria Chen, her, the 38-year-old, She

2. Megabucks Banking, the company, Megabucks

3. <sub>{</sub> her pay<sub>}</sub>

4.  Lotsabucks

For most coreference evaluation campaigns, the input to the system is the raw text of articles, and systems must detect mentions and then link them into clusters. Solving this task requires dealing with pronominal anaphora (figuring out that her refers to Victoria Chen), filtering out non-referential pronouns like the pleonastic It in It has been ten years), dealing with definite noun phrases to figure out that the 38-year-old is coreferent with Victoria Chen, and that the company is the same as Megabucks. And we need to deal with names, to realize that Megabucks is the same as Megabucks Banking.

Exactly what counts as a mention and what links are annotated differs from task to task and dataset to dataset. For example some coreference datasets do not label singletons, making the task much simpler. Resolvers can achieve much higher scores on corpora without singletons, since singletons constitute the majority of mentions in running text, and they are often hard to distinguish from non-referential NPs. Some tasks use gold mention-detection (i.e. the system is given human-labeled mention boundaries and the task is just to cluster these gold mentions), which eliminates the need to detect and segment mentions from running text.

Coreference is usually evaluated by the CoNLL F1 score, which combines three metrics: MUC, $B^{3}$ , and $CEAF_{e} \mathrm{;}$ ; Section 21.7 gives the details.

Let’s mention a few characteristics of one popular coreference dataset, OntoNotes (Pradhan et al. 2007, Pradhan et al. 2007a), and the CoNLL 2012 Shared Task based on it (Pradhan et al., 2012a). OntoNotes contains hand-annotated Chinese and English coreference datasets of roughly one million words each, consisting of newswire, magazine articles, broadcast news, broadcast conversations, web data and conversational speech data, as well as about 300,000 words of annotated Arabic newswire. The most important distinguishing characteristic of OntoNotes is that it does not label singletons, simplifying the coreference task, since singletons represent 60%-70% of all entities. In other ways, it is similar to other coreference datasets. Referring expression NPs that are coreferent are marked as mentions, but generics and pleonastic pronouns are not marked. Appositive clauses are not marked as separate mentions, but they are included in the mention. Thus in the NP, “Richard Godown, president of the Industrial Biotechnology Association” the mention is the entire phrase. Prenominal modifiers are annotated as separate entities only if they are proper nouns. Thus wheat is not an entity in wheat fields, but UN is an entity in UN policy (but not adjectives like American in American policy).

A number of corpora mark richer discourse phenomena. The ISNotes corpus annotates a portion of OntoNotes for information status, include bridging examples (Hou et al., 2018). The LitBank coreference corpus (Bamman et al., 2020) contains coreference annotations for 210,532 tokens from 100 different literary novels, including singletons and quantified and negated noun phrases. The AnCora-CO coreference corpus (Recasens and Mart´ı, 2010) contains 400,000 words each of Spanish (AnCora-CO-Es) and Catalan (AnCora-CO-Ca) news data, and includes labels for complex phenomena like discourse deixis in both languages. The ARRAU corpus (Uryupina et al., 2020) contains 350,000 words of English marking all NPs, which means singleton clusters are available. ARRAU includes diverse genres like dialog (the TRAINS data) and fiction (the Pear Stories), and has labels for bridging references, discourse deixis, generics, and ambiguous anaphoric relations.

## 21.3 Mention Detection

mention detection n

The first stage of coreference is mention detection: finding the spans of text that constitute each mention. Mention detection algorithms are usually very liberal in proposing candidate mentions (i.e., emphasizing recall), and only filtering later. For example many systems run parsers and named entity taggers on the text and extract every span that is either an NP, a possessive pronoun, or a named entity.

Doing so from our sample text repeated in (21.44):

(21.44) Victoria Chen, CFO of Megabucks Banking, saw her pay jump to \$2.3 million, as the 38-year-old also became the company’s president. It is widely known that she came to Megabucks from rival Lotsabucks.

might result in the following list of 13 potential mentions:

<table><tr><td>Victoria Chen</td><td>$2.3 million</td><td>she</td></tr><tr><td>CFO of Megabucks Banking</td><td>the 38-year-old</td><td>Megabucks</td></tr><tr><td>Megabucks Banking</td><td>the company</td><td>Lotsabucks</td></tr><tr><td>her</td><td>the company’s president</td><td></td></tr><tr><td>her pay</td><td>It</td><td></td></tr></table>

More recent mention detection systems are even more generous; the span-based algorithm we will describe in Section 21.6 first extracts literally all N-gram spans of words up to N=10. Of course recall from Section 21.1.3 that many NPs—and the overwhelming majority of random N-gram spans—are not referring expressions. Therefore all such mention detection systems need to eventually filter out pleonastic/expletive pronouns like It above, appositives like CFO of Megabucks Banking Inc, or predicate nominals like the company’s president or \$2.3 million.

Some of this filtering can be done by rules. Early rule-based systems designed regular expressions to deal with pleonastic it, like the following rules from Lappin and Leass (1994) that use dictionaries of cognitive verbs (e.g., believe, know, anticipate) to capture pleonastic it in “It is thought that ketchup...”, or modal adjectives (e.g., necessary, possible, certain, important), for, e.g., “It is likely that I...”. Such rules are sometimes used as part of modern systems:

It is Modaladjective that S

It is Modaladjective (for NP) to VP

It is Cogv-ed that S

It seems/appears/means/follows (that) S

Mention-detection rules are sometimes designed specifically for particular evaluation campaigns. For OntoNotes, for example, mentions are not embedded within larger mentions, and while numeric quantities are annotated, they are rarely coreferential. Thus for OntoNotes tasks like CoNLL 2012 (Pradhan et al., 2012a), a common first pass rule-based mention detection algorithm (Lee et al., 2013) is:

1. Take all NPs, possessive pronouns, and named entities.

2. Remove numeric quantities (100 dollars, 8%), mentions embedded in larger mentions, adjectival forms of nations, and stop words (like there).

3. Remove pleonastic it based on regular expression patterns.

Rule-based systems, however, are generally insufficient to deal with mentiondetection, and so modern systems incorporate some sort of learned mention detection component, such as a referentiality classifier, an anaphoricity classifier— detecting whether an NP is an anaphor—or a discourse-new classifier— detecting whether a mention is discourse-new and a potential antecedent for a future anaphor.

An anaphoricity detector, for example, can draw its positive training examples from any span that is labeled as an anaphoric referring expression in hand-labeled datasets like OntoNotes, ARRAU, or AnCora. Any other NP or named entity can be marked as a negative training example. Anaphoricity classifiers use features of the candidate mention such as its head word, surrounding words, definiteness, animacy, length, position in the sentence/discourse, many of which were first proposed in early work by Ng and Cardie (2002a); see Section 21.5 for more on features.

Referentiality or anaphoricity detectors can be run as filters, in which only mentions that are classified as anaphoric or referential are passed on to the coreference system. The end result of such a filtering mention detection system on our example above might be the following filtered set of 9 potential mentions:

<table><tr><td>Victoria Chen</td><td>her pay</td><td>she</td></tr><tr><td>Megabucks Bank</td><td>the 38-year-old</td><td>Megabucks</td></tr><tr><td>her</td><td>the company</td><td>Lotsabucks</td></tr></table>

It turns out, however, that hard filtering of mentions based on an anaphoricity or referentiality classifier leads to poor performance. If the anaphoricity classifier threshold is set too high, too many mentions are filtered out and recall suffers. If the classifier threshold is set too low, too many pleonastic or non-referential mentions are included and precision suffers.

The modern approach is instead to perform mention detection, anaphoricity, and coreference jointly in a single end-to-end model (Ng 2005b, Denis and Baldridge 2007, Rahman and Ng 2009). For example mention detection in the Lee et al. (2017),(2018) system is based on a single end-to-end neural network that computes a score for each mention being referential, a score for two mentions being coreference, and combines them to make a decision, training all these scores with a single end-to-end loss. We’ll describe this method in detail in Section 21.6. <sup>7</sup>

Despite these advances, correctly detecting referential mentions seems to still be an unsolved problem, since systems incorrectly marking pleonastic pronouns like it and other non-referential NPs as coreferent is a large source of errors of modern coreference resolution systems (Kummerfeld and Klein 2013, Martschat and Strube 2014, Martschat and Strube 2015, Wiseman et al. 2015, Lee et al. 2017).

Mention, referentiality, or anaphoricity detection is thus an important open area of investigation. Other sources of knowledge may turn out to be helpful, especially in combination with unsupervised and semisupervised algorithms, which also mitigate the expense of labeled datasets. In early work, for example Bean and Riloff (1999) learned patterns for characterizing anaphoric or non-anaphoric NPs; (by extracting and generalizing over the first NPs in a text, which are guaranteed to be non-anaphoric). Chang et al. (2012) look for head nouns that appear frequently in the training data but never appear as gold mentions to help find non-referential NPs. Bergsma et al. (2008b) use web counts as a semisupervised way to augment standard features for anaphoricity detection for English it, an important task because it is both common and ambiguous; between a quarter and half it examples are non-anaphoric. Consider the following two examples:

(21.45) You can make [it] in advance. [anaphoric]

(21.46) You can make [it] in Hollywood. [non-anaphoric]

The it in make it is non-anaphoric, part of the idiom make it. Bergsma et al. (2008b) turn the context around each example into patterns, like “make \* in advance” from (21.45), and “make \* in Hollywood” from (21.46). They then use Google N-grams to enumerate all the words that can replace it in the patterns. Non-anaphoric contexts tend to only have it in the wildcard positions, while anaphoric contexts occur with many other NPs (for example make them in advance is just as frequent in their data as make it in advance, but make them in Hollywood did not occur at all). These N-gram contexts can be used as features in a supervised anaphoricity classifier.

## 21.4 Architectures for Coreference Algorithms

Modern systems for coreference are based on supervised neural machine learning, supervised from hand-labeled datasets like OntoNotes. In this section we overview the various architecture of modern systems, using the categorization of Ng (2010), which distinguishes algorithms based on whether they make each coreference decision in a way that is entity-based—representing each entity in the discourse model— or only mention-based—considering each mention independently, and whether they use ranking models to directly compare potential antecedents. Afterwards, we go into more detail on one state-of-the-art algorithm in Section 21.6.

## 21.4.1 The Mention-Pair Architecture

We begin with the mention-pair architecture, the simplest and most influential coreference architecture, which introduces many of the features of more complex algorithms, even though other architectures perform better. The mention-pair architecture is based around a classifier that— as its name suggests—is given a pair of mentions, a candidate anaphor and a candidate antecedent, and makes a binary classification decision: coreferring or not.

Let’s consider the task of this classifier for the pronoun she in our example, and assume the slightly simplified set of potential antecedents in Fig. 21.2.

![Figure 21.2](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/15cbe98133f4deac1f7305c13fd3f9bed504bbe05933bab414b94088d83c4b08.jpg)  
Figure 21.2 For each pair of a mention (like she), and a potential antecedent mention (like Victoria Chen or her), the mention-pair classifier assigns a probability of a coreference link.

For each prior mention (Victoria Chen, Megabucks Banking, her, etc.), the binary classifier computes a probability: whether or not the mention is the antecedent of she. We want this probability to be high for actual antecedents (Victoria Chen, her, the 38-year-old) and low for non-antecedents (Megabucks Banking, her pay).

Early classifiers used hand-built features (Section 21.5); more recent classifiers use neural representation learning (Section 21.6)

For training, we need a heuristic for selecting training samples; since most pairs of mentions in a document are not coreferent, selecting every pair would lead to a massive overabundance of negative samples. The most common heuristic, from (Soon et al., 2001), is to choose the closest antecedent as a positive example, and all pairs in between as the negative examples. More formally, for each anaphor mention m we create

- one positive instance $(m_{i}, m_{j})$ where $m_{j}$ is the closest antecedent to $m_{i}$ , and

- a negative instance $(m_{i}, m_{k})$ for each $m_{k}$ between $m_{j}$ and m<sub>i</sub>

Thus for the anaphor she, we would choose (she, her) as the positive example and no negative examples. Similarly, for the anaphor the company we would choose (the company, Megabucks) as the positive example and (the company, she) (the company, the 38-year-old) (the company, her pay) and (the company, her) as negative examples.

Once the classifier is trained, it is applied to each test sentence in a clustering step. For each mention i in a document, the classifier considers each of the prior i 1 mentions. In closest-first clustering (Soon et al., 2001), the classifier is run right to left (from mention i 1 down to mention 1) and the first antecedent with probability $>.5$ is linked to i. If no antecedent has probably $> 0.5$ , no antecedent is selected for i. In best-first clustering, the classifier is run on all i 1 antecedents and the most probable preceding mention is chosen as the antecedent for i. The transitive closure of the pairwise relation is taken as the cluster.

While the mention-pair model has the advantage of simplicity, it has two main problems. First, the classifier doesn’t directly compare candidate antecedents to each other, so it’s not trained to decide, between two likely antecedents, which one is in fact better. Second, it ignores the discourse model, looking only at mentions, not entities. Each classifier decision is made completely locally to the pair, without being able to take into account other mentions of the same entity. The next two models each address one of these two flaws.

## 21.4.2 The Mention-Rank Architecture

The mention ranking model directly compares candidate antecedents to each other, choosing the highest-scoring antecedent for each anaphor.

In early formulations, for mention i, the classifier decides which of the $\{1,..., i -$ 1 prior mentions is the antecedent (Denis and Baldridge, 2008). But suppose i is in fact not anaphoric, and none of the antecedents should be chosen? Such a model would need to run a separate anaphoricity classifier on i. Instead, it turns out to be better to jointly learn anaphoricity detection and coreference together with a single loss (Rahman and Ng, 2009).

So in modern mention-ranking systems, for the ith mention (anaphor), we have an associated random variable $y_{i}$ ranging over the values $Y(i) = \{1,..., i - 1, \epsilon\}$ . The value $\epsilon$ is a special dummy mention meaning that i does not have an antecedent (i.e., is either discourse-new and starts a new coref chain, or is non-anaphoric).

![Figure 21.3](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/0aa6eef138e3a1765e672b162d64b65f75a9e37ff8b66d51760a1d9389e8a3c0.jpg)  
Figure 21.3 For each candidate anaphoric mention (like she), the mention-ranking system assigns a probability distribution over all previous mentions plus the special dummy mention $\epsilon$.

At test time, for a given mention i the model computes one softmax over all the antecedents (plus $\epsilon$) giving a probability for each candidate antecedent (or none).

Fig. 21.3 shows an example of the computation for the single candidate anaphor she.

Once the antecedent is classified for each anaphor, transitive closure can be run over the pairwise decisions to get a complete clustering.

Training is trickier in the mention-ranking model than the mention-pair model, because for each anaphor we don’t know which of all the possible gold antecedents to use for training. Instead, the best antecedent for each mention is latent; that is, for each mention we have a whole cluster of legal gold antecedents to choose from. Early work used heuristics to choose an antecedent, for example choosing the closest antecedent as the gold antecedent and all non-antecedents in a window of two sentences as the negative examples (Denis and Baldridge, 2008). Various kinds of ways to model latent antecedents exist (Fernandes et al. 2012, Chang et al. 2013, Durrett and Klein 2013). The simplest way is to give credit to any legal antecedent by summing over all of them, with a loss function that optimizes the likelihood of all correct antecedents from the gold clustering (Lee et al., 2017). We’ll see the details in Section 21.6.

Mention-ranking models can be implemented with hand-build features or with neural representation learning (which might also incorporate some hand-built features). we’ll explore both directions in Section 21.5 and Section 21.6.

## 21.4.3 Entity-based Models

Both the mention-pair and mention-ranking models make their decisions about mentions. By contrast, entity-based models link each mention not to a previous mention but to a previous discourse entity (cluster of mentions).

A mention-ranking model can be turned into an entity-ranking model simply by having the classifier make its decisions over clusters of mentions rather than individual mentions (Rahman and Ng, 2009).

For traditional feature-based models, this can be done by extracting features over clusters. The size of a cluster is a useful feature, as is its ‘shape’, which is the list of types of the mentions in the cluster i.e., sequences of the tokens (P)roper, (D)efinite, (I)ndefinite, (Pr)onoun, so that a cluster composed of Victoria, her, the 38-year-old would have the shape $P – Pr – D$ (Bjorkelund and Kuhn, 2014)¨ . An entitybased model that includes a mention-pair classifier can use as features aggregates of mention-pair probabilities, for example computing the average probability of coreference over all mention-pairs in the two clusters (Clark and Manning 2015).

Neural models can learn representations of clusters automatically, for example by using an RNN over the sequence of cluster mentions to encode a state corresponding to a cluster representation (Wiseman et al., 2016), or by learning distributed representations for pairs of clusters by pooling over learned representations of mention pairs (Clark and Manning, 2016b).

However, although entity-based models are more expressive, the use of clusterlevel information in practice has not led to large gains in performance, so mentionranking models are still more commonly used.

## 21.5 Classifiers using hand-built features

Hand-designed features play an important role in coreference, whether as the sole input to classification in pre-neural classifiers, or as augmentations to the automatic representation learning used in state-of-the-art neural systems like the one we’ll describe in Section 21.6.

In this section we describe features commonly used in logistic regression, SVM, or random forest classifiers for coreference resolution.

Given an anaphor mention and a potential antecedent mention, most feature based classifiers make use of three types of features: (i) features of the anaphor, (ii) features of the candidate antecedent, and (iii) features of the relationship between the pair. Entity-based models can make additional use of two additional classes: (iv) feature of all mentions from the antecedent’s entity cluster, and (v) features of the relation between the anaphor and the mentions in the antecedent entity cluster.

Figure 21.4 shows a selection of commonly used features, and shows the value that would be computed for the potential anaphor “she” and potential antecedent “Victoria Chen” in our example sentence, repeated below:

(21.47) Victoria Chen, CFO of Megabucks Banking, saw her pay jump to \$2.3 million, as the 38-year-old also became the company’s president. It is widely known that she came to Megabucks from rival Lotsabucks.

Features that prior work has found to be particularly useful are exact string match, entity headword agreement, mention distance, as well as (for pronouns) exact attribute match and i-within-i, and (for nominals and proper names) word inclusion and cosine. For lexical features (like head words) it is common to only use words that appear enough times (perhaps more than 20 times), backing off to parts of speech for rare words.

It is crucial in feature-based systems to use conjunctions of features; one experiment suggested that moving from individual features in a classifier to conjunctions of multiple features increased F1 by 4 points (Lee et al., 2017). Specific conjunctions can be designed by hand (Durrett and Klein, 2013), all pairs of features can be conjoined (Bengtson and Roth, 2008), or feature conjunctions can be learned using decision tree or random forest classifiers (Ng and Cardie 2002a, Lee et al. 2017).

Finally, some of these features can also be used in neural models as well. Modern neural systems (Section 21.6) use contextual word embeddings, so they don’t benefit from adding shallow features like string or head match, grammatical role, or mention types. However other features like mention length, distance between mentions, or genre can complement neural contextual embedding models nicely.

## 21.6 A neural mention-ranking algorithm

In this section we describe the neural mention-ranking system of Lee et al. (2017). This end-to-end system doesn’t exactly have a separate mention-detection step. Instead, it considers every possible span of text up to a set length (i.e. all n-grams of length 1,2,3...N) as a possible mention.

Given a document D with T words, the model considers all of the $\begin{array}{r}{N = \frac{T(T - 1)}{2}} \end{array}$ text spans up to some length (in the version of Lee et al. (2018), that length is 10). Each span i starts at word START(i) and ends at word END(i).

The task is to assign to each span i an antecedent $y_{i},$ a random variable ranging over the values $Y(i) = \{1,..., i - 1, \epsilon\}$ ; each previous span and a special dummy token $\epsilon$. Choosing the dummy token means that i does not have an antecedent, either because i is discourse-new and starts a new coreference chain, or because i is nonanaphoric.

<table><tr><td colspan="3">Features of the Anaphor or Antecedent Mention</td></tr><tr><td>First (last) word</td><td>Victoria/she</td><td>First or last word (or embedding) of antecedent/anaphor</td></tr><tr><td>Head word</td><td>Victoria/she</td><td>Head word (or head embedding) of antecedent/anaphor</td></tr><tr><td>Attributes</td><td>Sg-F-A-3-PER/Sg-F-A-3-PER</td><td>The number, gender, animacy, person, named entity type attributes of (antecedent/anaphor)</td></tr><tr><td>Length</td><td>2/1</td><td>length in words of (antecedent/anaphor)</td></tr><tr><td>Grammatical role</td><td>Sub/Sub</td><td>The grammatical role—subject, direct object, indirect object/PP—of (antecedent/anaphor)</td></tr><tr><td>Mention type</td><td>P/Pr</td><td>Type: (P)roper, (D)efinite, (I)ndefinite, (Pr)onoun) of antecedent/anaphor</td></tr><tr><td colspan="3">Features of the Antecedent Entity</td></tr><tr><td>Entity shape</td><td>P-Pr-D</td><td>The ‘shape’ or list of types of the mentions in the antecedent entity (cluster), i.e., sequences of (P)roper, (D)efinite, (I)ndefinite, (Pr)onoun.</td></tr><tr><td>Entity attributes</td><td>Sg-F-A-3-PER</td><td>The number, gender, animacy, person, named entity type attributes of the antecedent entity</td></tr><tr><td>Antecedent cluster size</td><td>3</td><td>Number of mentions in the antecedent cluster</td></tr><tr><td colspan="3">Features of the Pair of Mentions</td></tr><tr><td>Longer anaphor</td><td>F</td><td>True of anaphor is longer than antecedent</td></tr><tr><td>Pairs of any features</td><td>Victoria/she, 2/1, Sub/Sub, type of anaphor P/Pr, etc .</td><td>For each individual feature, pair of type of antecedent+</td></tr><tr><td>Sentence distance</td><td>1</td><td>The number of sentences between antecedent and anaphor</td></tr><tr><td>Mention distance</td><td>4</td><td>The number of mentions between antecedent and anaphor</td></tr><tr><td>i-within-i</td><td>F</td><td>Anaphor has i-within-i relation with antecedent</td></tr><tr><td>Cosine</td><td></td><td>Cosine between antecedent and anaphor embeddings</td></tr><tr><td>Appositive</td><td>F</td><td>True if the anaphor is in the syntactic apposition relation to the antecedent. Useful even if appositives aren’t mentions (to know to attach the appositive to a preceding head)</td></tr><tr><td colspan="3">Features of the Pair of Entities</td></tr><tr><td>Exact String Match</td><td>F</td><td>True if the strings of any two mentions from the antecedent and anaphor clusters are identical.</td></tr><tr><td>Head Word Match</td><td>F</td><td>True if any mentions from antecedent cluster has same headword as any mention in anaphor cluster</td></tr><tr><td>Word Inclusion</td><td>F</td><td>All words in anaphor cluster included in antecedent cluster</td></tr><tr><td colspan="3">Features of the Document</td></tr><tr><td>Genre/source</td><td>N</td><td>The document genre—(D)ialog, (N)ews, etc,</td></tr></table>

Figure 21.4 Some common features for feature-based coreference algorithms, with values for the anaphor “she” and potential antecedent “Victoria Chen”.

For each pair of spans i and $j,$ the system assigns a score $s(i, j)$ for the coreference link between span i and span $j.$ The system then learns a distribution $P(y_{i})$ over the antecedents for span i:

$$
P(y_{i}) = \frac{\exp(s(i, y_{i}))}{\sum_{y^{\prime} \in Y(i)} \exp(s(i, y_{i}))}\tag{21.48}
$$

This score $s(i, j)$ includes three factors: $m(i);$ whether span i is a mention; $m(j)$ ; whether span j is a mention; and $c(i, j)$ ; whether j is the antecedent of i:

$$
s(i, j) = m(i) + m(j) + c(i, j)\tag{21.49}
$$

For the dummy antecedent $\epsilon$, the score $s(i, \epsilon)$ is fixed to 0. This way if any nondummy scores are positive, the model predicts the highest-scoring antecedent, but if all the scores are negative it abstains.

The scoring functions $m(i)$ and $c(i, j)$ are based on a vector ${\bf g}_{i}$ that represents span i:

$$
m(i) = w_{m} \cdot \mathrm{FFNN}_{m}(\mathbf{g}_{i})\tag{21.50}
$$

$$
c(i, j) = w_{c} \cdot \operatorname{FFNN}_{c}([\mathbf{g}_{i}, \mathbf{g}_{j}, \mathbf{g}_{i} \circ \mathbf{g}_{j}, \phi(i, j)])\tag{21.51}
$$

The antecedent score $c(i, j)$ takes as input a representation of the spans i and $j,$ but also the element-wise similarity of the two spans to each other $\mathbf{g}_{i} \circ \mathbf{g}_{j}$ (here is element-wise multiplication). The antecedent score c also considers a feature vector $\phi(i, j)$ that encodes useful features like mention distances, and also information about the speaker and genre.

The representation for each span, $\mathbf{g}_{i},$ , can be computed with a biLSTM or with BERT. In the biLSTM version, the representation $g_{i}$ for span i is a concatenation of the biLSTM hidden representations of the start and end tokens of the span, an attention-based representation of the head, and a feature vector containing only one feature: the length of span i:

$$
\mathbf{g}_{i} = \left[\mathbf{h}_{\text{START}(i)}, \mathbf{h}_{\text{END}(i)}, \mathbf{h}_{\text{ATT}(i)}, \boldsymbol{\phi}(i) \right]\tag{21.52}
$$

These are computed as follows. The output of the biLSTM for each word $w_{t}$ of the input is h<sub>t</sub> :

$$
\begin{array}{rcl} \overrightarrow{\mathbf{h}}_{t} & = & \text{LSTM}^{\text{forward}}(\overrightarrow{\mathbf{h}}_{t - 1}, \mathbf{w}_{t}) \\ \overleftarrow{\mathbf{h}}_{t} & = & \text{LSTM}^{\text{forward}}(\overleftarrow{\mathbf{h}}_{t + 1}, \mathbf{w}_{t}) \\ \mathbf{h}_{t} & = &[\overrightarrow{\mathbf{h}}_{t}, \overleftarrow{\mathbf{h}}_{t}] \end{array}\tag{21.53}
$$

The attention representation is computed as usual; the system learns a weight vector ${\pmb w}_{{\pmb \alpha}}.$ , and computes its dot product with the hidden state $\mathbf{h}_{t}$ transformed by a FFNN:

$$
\boldsymbol{\alpha}_{t} = \mathbf{w}_{\boldsymbol{\alpha}} \cdot \mathrm{FFNN}_{\boldsymbol{\alpha}}(\mathbf{h}_{t})\tag{21.54}
$$

The attention score is normalized into a distribution via a softmax:

$$
a_{i, t} = \frac{\exp(\alpha_{t})}{\sum_{k = \text{START}(i)}^{\text{END}(i)} \exp(\alpha_{k})}\tag{21.55}
$$

And then the attention distribution is used to create a vector $\mathbf{h}_{\mathrm{ATT}(i)}$ which is an attention-weighted sum of words in span i:

$$
\mathbf{h}_{\mathrm{ATT}(i)} = \sum_{t = \mathrm{START}(i)}^{\mathrm{END}(i)} a_{i, t} \cdot \mathbf{w}_{t}\tag{21.56}
$$

Fig. 21.5 from Lee et al. (2017) shows the biLSTM computation of the span representation and the mention score.

![Figure 21.5](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/0ea5432dac41ed2be60d397eef122813ebeeb658bd58900fd6ff1f24f776fb23.jpg)  
Figure 21.5 Computation of the span representation (using the biLSTM encoder) and the Figure 1: First step of the end-to-end coreference resolution model, which computes embeddin<sub>mention</sub> <sub>score</sub> <sub>in</sub> <sub>the</sub> <sub>end-to-end</sub> <sub>coreference</sub> <sub>model</sub> <sub>of Lee</sub> <sub>et</sub> <sub>al.</sub> <sub>(2017).</sub> <sub>The</sub> <sub>model</sub> <sub>considers</sub> entations of spans for scoring potential entity mentions. Low-scoring spans are pruned, so thaall spans up to a maximum width; the figure shows a small subset of these. Figure after Lee manageable net al. (2017).

In the BERT version, this entire biLSTM encoder is replaced with BERT. The Softmax (P (yi | D))span representations $g_{i}$ above are computed via standard feed-fare instead computed by concatenating the first and last s(the company, ϵ) = 0 neural networks:word-pieces of the span, plus the attended version of all word pieces in the span <sub>s(the</sub> <sub>company,</sub> <sub>(Joshi</sub> <sub>et</sub> <sub>al.,</sub> <sub>2019).</sub>senta

e (s)Fig. 21.6 shows the computation of the score s for the three possible antecedentsmanageable number of spans is considered for coreference dec of the company in the example sentence from Fig. 21.5.possible spans up to a maximum wid

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/d2720a7e97b4c618b6d0bd202b2f06e669f56568e30304ca2d47c3e48cfc8aab.jpg)  
o 0, the model predicts the best scoring antecedentFigure 21.6 The computation of the score s for the three possible antecedents of the comif any non-dummy scores are positive, and it ab-Figure 2: Second step of our model. Antecedepany in the example sentence from Fig. 21.5. Figure after Lee et al. (2017).

<sup>challenging</sup> <sup>aspect</sup> <sup>of</sup> <sup>this</sup> <sup>model</sup> <sup>is</sup> <sup>that</sup> <sup>its</sup> <sub>within the span. We use a bidir</sub>tations. The final coreference score of a pair of cludes At inference time, some method is generally used to prune the mentions (for O<sup>(T )</sup>       LSTM (Hochreiter and Schmidhuber, 1997spans is computed by summing the mention scores span gi example using the mention score m as a filter to keep only the best few mentions <sup>ee</sup> <sup>in</sup> <sup>Section</sup> <sup>5,</sup> <sup>the</sup> <sup>above</sup> <sup>factoring</sup> <sup>enables</sup> <sup>ag-</sup> speakeras a function like 0.4T of the sentence length T ). Then the joint distribution of <sup>gressive</sup> <sup>pruning</sup> <sup>of</sup> <sup>spans</sup> <sup>that</sup> <sup>are</sup> <sup>unlikely</sup> <sup>to</sup> <sup>be-</sup>antecedents for each document is computed in a forward pass. Finally, we can then <sup>long</sup> <sup>to</sup> <sup>a</sup> <sup>coreference</sup> <sup>cluster</sup> <sup>according</sup> <sup>the</sup> <sup>men-</sup>do transitive closure on the antecedents to create a final clustering for the document.

<sup>score</sup> <sup>s</sup>m<sup>(i).</sup>For training, we don’t have a single gold antecedent for each mention; instead Span R<sub>the</sub> <sub>coreference</sub> <sub>labeling</sub> <sub>only</sub> <sub>gives</sub> <sub>us</sub> <sub>each</sub> <sub>entire</sub> <sub>cluster</sub> <sub>of</sub> <sub>coreferent</sub> <sub>mentions,</sub> <sub>and</sub> mationa mention has a latent antecedent. We therefor use a loss function that maximizes coreferethe sum of the coreference probability of any of the legal antecedents. For a given stains if they are all<sub>mention i with</sub> <sub>possible</sub> <sub>antecedents</sub> $Y(i)$ tive.<sub>,</sub> <sub>let GOLD(i)</sub> <sub>be</sub> <sub>the</sub> <sub>set</sub> <sub>of</sub> <sub>mentions</sub> <sub>in</sub> <sub>the</sub> A challenging aspect of this model is that itsgold cluster containing i. Since the set of mentions occurring before i is $Y(i)$ , the <sup>i</sup>        size is (T <sup>4</sup>) in the document length. As wset of mentions in that gold cluster that also occur before i is $Y(i)$ illGOLD(i). We

therefore want to maximize:

$$
\sum_{\hat{y} \in Y(i) \cap \operatorname{GOLD}(i)} P(\hat{y})\tag{21.57}
$$

If a mention i is not in a gold cluster GOLD(i) = $\epsilon$.

To turn this probability into a loss function, we’ll use the cross-entropy loss function we defined in Eq. 5.11 in Chapter 5, by taking the log of the probability. If we then sum over all mentions, we get the final loss function for training:

$$
L = \sum_{i = 2}^{N} - \log \sum_{\hat{y} \in Y(i) \cap \operatorname{GOLD}(i)} P(\hat{y})\tag{21.58}
$$

Fig. 21.7 shows example predictions from the model, showing the attention weights, which Lee et al. (2017) find correlate with traditional semantic heads. Note that the model gets the second example wrong, presumably because attendants and pilot<sub>of the deceased were killed in the crush as workers tried to flee (the blaze) in the four-story building.</sub> likely have nearby word embeddings.<sup>1</sup>

We are looking for (a region of central Italy bordering the Adriatic Sea). (The area) is mostly mountainous and includes Mt. Corno, the highest peak of the Apennines. (It) also includes a lot of sheep, good clean-living, healthy sheep, and an Italian entrepreneur has an idea about how to make a little money of them.

(The flight attendants) have until 6:00 today to ratify labor concessions. (The pilots’) union and ground crew did so yesterday.

<sup>(Prince</sup> <sup>Charles</sup> <sup>and</sup> <sup>his</sup> <sup>new</sup> <sup>wife</sup> <sup>Camilla)</sup> <sup>have</sup> <sup>jumped</sup> <sup>across</sup> <sup>the</sup> <sup>pond</sup> <sup>and</sup> <sup>are</sup> <sup>touring</sup> <sup>the</sup> <sup>United</sup>Figure 21.7 Sample predictions from the Lee et al. (2017) model, with one cluster per example, showing one correct example and one mistake. Bold, parenthesized spans are mentions in the predicted cluster. The amount of red color on a word indicates the head-finding <sub>here’s the prince</sub>attention weight $a_{i, t}$ <sub>h his new wife.</sub>in (21.55). Figure adapted from Lee et al. (2017).

## 21.7 Evaluation of Coreference Resolution

We evaluate coreference algorithms model-theoretically, comparing a set of hypoth-<sub>Head word precision</sub>esis chains or clusters H produced by the system against a set of gold or reference <sup>90</sup> Frequency      chains or clusters R from a human labeling, and reporting precision and recall.

However, there are a wide variety of methods for doing this comparison. In fact, <sup>60</sup> predicted by the model. Bolded spans in paren-there are 5 common metrics used to evaluate coreference algorithms: the link based <sub>40</sub> <sup>theses</sup> <sup>belong</sup> <sup>to</sup> <sup>the</sup> <sup>predicted</sup> <sup>cluster,</sup> <sup>and</sup> <sup>the</sup> <sup>red-</sup>MUC (Vilain et al., 1995) and BLANC (Recasens and Hovy 2011, Luo et al. 2014) <sup>30</sup>metrics, the mention based $B^{3}$ <sup>ness</sup> <sup>of</sup> <sup>a</sup> <sup>word</sup> <sup>indicates</sup> <sup>its</sup> <sup>weight</sup> <sup>from</sup> <sup>the</sup> <sup>head-</sup>metric (Bagga and Baldwin, 1998), the entity based CEAF metric (Luo, 2005), and the link based entity aware LEA metric (Moosavi and Strube, 2016).

mechanism for making coreference decisions canLet’s just explore two of the metrics. The MUC F-measure (Vilain et al., 1995) <sup>be</sup> <sup>seen</sup> <sup>in</sup> <sup>Example</sup> <sup>1.</sup> <sup>The</sup> <sup>model</sup> <sup>pays</sup> <sup>attention</sup>is based on the number of coreference links (pairs of mentions) common to H and Figure 4: Indirect measure of mention precision          R. Precision is the number of common links divided by the number of links in H. using agreement with gold syntax. ConstituencyRecall is the number of common links divided by the number of links in $R;$ This <sup>precision:</sup> <sup>%</sup> <sup>of</sup> <sup>unpruned</sup> <sup>spans</sup> <sup>matching</sup> <sup>syn-</sup> span of that mention, a Bangladeshi garment fac-makes MUC biased toward systems that produce large chains (and fewer entities), <sup>tory,</sup> <sup>the</sup> <sup>model</sup> and it ignores singletons, since they don’t involve links.

$$
\mathbf{B}^{3}
$$

$\mathbf{B}^{3}$ <sup>tory,</sup> <sup>allowing</sup> <sup>it</sup> <sup>successfully</sup> <sup>predict</sup> <sup>the</sup> <sup>corefer-</sup>is mention-based rather than link-based. For each mention in the reference gold spans with each width.     chain, we compute a precision and recall, and then we take a weighted sum over all N mentions in the document to compute a precision and recall for the entire task. For a given mention $i,$ let R be the reference chain that includes $i,$ and H the hypothesis chain that has i. The set of correct mentions in H is H R. Precision for mention i is thus $\frac{| H \cap R |}{| H |}$ , and recall for mention i thus $\frac{| H \cap R |}{| R |}$ . The total precision is the weighted sum of the precision for mention i, weighted by a weight $w_{i}$ . The total recall is the weighted sum of the recall for mention i, weighted by a weight $w_{i}$ . Equivalently:

$$
\begin{array}{l} \text{Precision} = \sum_{i = 1}^{N} w_{i} \frac{\# ofcorrectmentionsinhypothesischaincontainingentity_{i}}{\# ofmentionsinhypothesischaincontainingentity_{i}} \\ \text{Recall} = \sum_{i = 1}^{N} w_{i} \frac{\# ofcorrectmentionsinhypothesischaincontainingentity_{i}}{\# ofmentionsinreferencechaincontainingentity_{i}} \end{array}
$$

The weight $w_{i}$ for each entity can be set to different values to produce different versions of the algorithm.

Following a proposal from Denis and Baldridge (2009), the CoNLL coreference competitions were scored based on the average of MUC, CEAF-e, and ${\mathbf B}^{3}$ (Pradhan et al. 2011, Pradhan et al. 2012b), and so it is common in many evaluation campaigns to report an average of these 3 metrics. See Luo and Pradhan (2016) for a detailed description of the entire set of metrics; reference implementations of these should be used rather than attempting to reimplement from scratch (Pradhan et al., 2014).

Alternative metrics have been proposed that deal with particular coreference domains or tasks. For example, consider the task of resolving mentions to named entities (persons, organizations, geopolitical entities), which might be useful for information extraction or knowledge base completion. A hypothesis chain that correctly contains all the pronouns referring to an entity, but has no version of the name itself, or is linked with a wrong name, is not useful for this task. We might instead want a metric that weights each mention by how informative it is (with names being most informative) (Chen and Ng, 2013) or a metric that considers a hypothesis to match a gold chain only if it contains at least one variant of a name (the NEC F1 metric of Agarwal et al. (2019)).

## 21.8 Winograd Schema problems

From early on in the field, researchers have noted that some cases of coreference are quite difficult, seeming to require world knowledge or sophisticated reasoning to solve. The problem was most famously pointed out by Winograd (1972) with the following example:

(21.59) The city council denied the demonstrators a permit because

a. they feared violence.

b. they advocated violence.

Winograd noticed that the antecedent that most readers preferred for the pronoun they in continuation (a) was the city council, but in (b) was the demonstrators. He suggested that this requires understanding that the second clause is intended as an explanation of the first clause, and also that our cultural frames suggest that city councils are perhaps more likely than demonstrators to fear violence and that demonstrators might be more likely to advocate violence.

In an attempt to get the field of NLP to focus more on methods involving world knowledge and common-sense reasoning, Levesque (2011) proposed a challenge task called the Winograd Schema Challenge.<sup>9</sup> The problems in the challenge task are coreference problems designed to be easily disambiguated by the human reader, but hopefully not solvable by simple techniques such as selectional restrictions, or other basic word association methods.

The problems are framed as a pair of statements that differ in a single word or phrase, and a coreference question:

(21.60) The trophy didn’t fit into the suitcase because it was too large.

Question: What was too large? Answer: The trophy

(21.61) The trophy didn’t fit into the suitcase because it was too small.

Question: What was too small? Answer: The suitcase

The problems have the following characteristics:

1. The problems each have two parties

2. A pronoun preferentially refers to one of the parties, but could grammatically also refer to the other

3. A question asks which party the pronoun refers to

4. If one word in the question is changed, the human-preferred answer changes to the other party

The kind of world knowledge that might be needed to solve the problems can vary. In the trophy/suitcase example, it is knowledge about the physical world; that a bigger object cannot fit into a smaller object. In the original Winograd sentence, it is stereotypes about social actors like politicians and protesters. In examples like the following, it is knowledge about human actions like turn-taking or thanking.

(21.62) Bill passed the gameboy to John because his turn was [over/next]. Whose turn was [over/next]? Answers: Bill/John

(21.63) Joan made sure to thank Susan for all the help she had [given/received].

Who had [given/received] help? Answers: Susan/Joan.

Although the Winograd Schema was designed to require common-sense reasoning, a large percentage of the original set of problem can be solved by pretrained language models, fine-tuned on Winograd Schema sentences (Kocijan et al., 2019). Large pretrained language models encode an enormous amount of world or common-sense knowledge! The current trend is therefore to propose new datasets with increasingly difficult Winograd-like coreference resolution problems like KNOWREF (Emami et al., 2019), with examples like:

(21.64) Marcus is undoubtedly faster than Jarrett right now but in [his] prime the gap wasn’t all that big.

In the end, it seems likely that some combination of language modeling and knowledge will prove fruitful; indeed, it seems that knowledge-based models overfit less to lexical idiosyncracies in Winograd Schema training sets (Trichelair et al., 2018),

## 21.9 Gender Bias in Coreference

As with other aspects of language processing, coreference models exhibit gender and other biases (Zhao et al. 2018a, Rudinger et al. 2018, Webster et al. 2018).

For example the WinoBias dataset (Zhao et al., 2018a) uses a variant of the Winograd Schema paradigm to test the extent to which coreference algorithms are biased toward linking gendered pronouns with antecedents consistent with cultural stereotypes. As we summarized in Chapter 6, embeddings replicate societal biases in their training test, such as associating men with historically sterotypical male occupations like doctors, and women with stereotypical female occupations like secretaries (Caliskan et al. 2017, Garg et al. 2018).

A WinoBias sentence contain two mentions corresponding to stereotypicallymale and stereotypically-female occupations and a gendered pronoun that must be linked to one of them. The sentence cannot be disambiguated by the gender of the pronoun, but a biased model might be distracted by this cue. Here is an example sentence:

(21.65) The secretary called the physician<sub>i</sub> and told him<sub>i</sub> about a new patient [pro-stereotypical]

(21.66) The secretary called the physician<sub>i</sub> and told her<sub>i</sub> about a new patient [anti-stereotypical]

Zhao et al. (2018a) consider a coreference system to be biased if it is more accurate at linking pronouns consistent with gender stereotypical occupations (e.g., him with physician in (21.65)) than linking pronouns inconsistent with gender-stereotypical occupations (e.g., her with physician in (21.66)). They show that coreference systems of all architectures (rule-based, feature-based machine learned, and end-toend-neural) all show significant bias, performing on average 21 F points worse in the anti-stereotypical cases.

One possible source of this bias is that female entities are significantly underrepresented in the OntoNotes dataset, used to train most coreference systems. Zhao et al. (2018a) propose a way to overcome this bias: they generate a second gender-swapped dataset in which all male entities in OntoNotes are replaced with female ones and vice versa, and retrain coreference systems on the combined original and swapped OntoNotes data, also using debiased GloVE embeddings (Bolukbasi et al., 2016). The resulting coreference systems no longer exhibit bias on the WinoBias dataset, without significantly impacting OntoNotes coreference accuracy. In a follow-up paper, Zhao et al. (2019) show that the same biases exist in ELMo contextualized word vector representations and coref systems that use them. They showed that retraining ELMo with data augmentation again reduces or removes bias in coreference systems on WinoBias.

Webster et al. (2018) introduces another dataset, GAP, and the task of Gendered Pronoun Resolution as a tool for developing improved coreference algorithms for gendered pronouns. GAP is a gender-balanced labeled corpus of 4,454 sentences with gendered ambiguous pronouns (by contrast, only 20% of the gendered pronouns in the English OntoNotes training data are feminine). The examples were created by drawing on naturally occurring sentences from Wikipedia pages to create hard to resolve cases with two named entities of the same gender and an ambiguous pronoun that may refer to either person (or neither), like the following:

(21.67) In May, Fujisawa joined Mari Motohashi’s rink as the team’s skip, moving back from Karuizawa to Kitami where she had spent her junior days.

Webster et al. (2018) show that modern coreference algorithms perform significantly worse on resolving feminine pronouns than masculine pronouns in GAP. Kurita et al. (2019) shows that a system based on BERT contextualized word representations shows similar bias.

## 21.10 Summary

This chapter introduced the task of coreference resolution.

- This is the task of linking together mentions in text which corefer, i.e. refer to the same discourse entity in the discourse model, resulting in a set of coreference chains (also called clusters or entities).

- Mentions can be definite NPs or indefinite NPs, pronouns (including zero pronouns) or names.

- The surface form of an entity mention is linked to its information status (new, old, or inferrable), and how accessible or salient the entity is.

- Some NPs are not referring expressions, such as pleonastic it in It is raining.

- Many corpora have human-labeled coreference annotations that can be used for supervised learning, including OntoNotes for English, Chinese, and Arabic, ARRAU for English, and AnCora for Spanish and Catalan.

- Mention detection can start with all nouns and named entities and then use anaphoricity classifiers or referentiality classifiers to filter out non-mentions.

- Three common architectures for coreference are mention-pair, mention-rank, and entity-based, each of which can make use of feature-based or neural classifiers.

- Modern coreference systems tend to be end-to-end, performing mention detection and coreference in a single end-to-end architecture.

- Algorithms learn representations for text spans and heads, and learn to compare anaphor spans with candidate antecedent spans.

- Coreference systems are evaluated by comparing with gold entity labels using precision/recall metrics like MUC, B<sup>3</sup>, CEAF, BLANC, or LEA.

- The Winograd Schema Challenge problems are difficult coreference problems that seem to require world knowledge or sophisticated reasoning to solve.

- Coreference systems exhibit gender bias which can be evaluated using datasets like Winobias and GAP.

## Bibliographical and Historical Notes

Coreference has been part of natural language understanding since the 1970s (Woods et al. 1972, Winograd 1972). The discourse model and the entity-centric foundation of coreference was formulated by Karttunen (1969) (at the 3rd COLING conference), playing a role also in linguistic semantics (Heim 1982, Kamp 1981). But it was Bonnie Webber’s (1978) dissertation and following work (Webber 1983) that explored the model’s computational aspects, providing fundamental insights into how entities are represented in the discourse model and the ways in which they can license subsequent reference. Many of the examples she provided continue to challenge theories of reference to this day.

The Hobbs algorithm<sup>10</sup> is a tree-search algorithm that was the first in a long series of syntax-based methods for identifying reference robustly in naturally occurring text. The input to the Hobbs algorithm is a pronoun to be resolved, together with a syntactic (constituency) parse of the sentences up to and including the current sentence. The details of the algorithm depend on the grammar used, but can be understand from a a simplified version due to Kehler et al. (2004) that just searches through the list of NPs in the current and prior sentences. This simplified Hobbs algorithm searches NPs in the following order: “(i) in the current sentence from right-to-left, starting with the first NP to the left of the pronoun, (ii) in the previous sentence from left-to-right, (iii) in two sentences prior from left-to-right, and (iv) in the current sentence from left-to-right, starting with the first noun group to the right of the pronoun (for cataphora). The first noun group that agrees with the pronoun with respect to number, gender, and person is chosen as the antecedent” (Kehler et al., 2004).

Lappin and Leass (1994) was an influential entity-based system that used weights to combine syntactic and other features, extended soon after by Kennedy and Boguraev (1996) whose system avoids the need for full syntactic parses.

Approximately contemporaneously centering (Grosz et al., 1995) was applied to pronominal anaphora resolution by Brennan et al. (1987), and a wide variety of work followed focused on centering’s use in coreference (Kameyama 1986, Di Eugenio 1990, Walker et al. 1994, Di Eugenio 1996, Strube and Hahn 1996, Kehler 1997a, Tetreault 2001, Iida et al. 2003). Kehler and Rohde (2013) show how centering can be integrated with coherence-driven theories of pronoun interpretation. See Chapter 22 for the use of centering in measuring discourse coherence.

Coreference competitions as part of the US DARPA-sponsored MUC conferences provided early labeled coreference datasets (the 1995 MUC-6 and 1998 MUC-7 corpora), and set the tone for much later work, choosing to focus exclusively on the simplest cases of identity coreference (ignoring difficult cases like bridging, metonymy, and part-whole) and drawing the community toward supervised machine learning and metrics like the MUC metric (Vilain et al., 1995). The later ACE evaluations produced labeled coreference corpora in English, Chinese, and Arabic that were widely used for model training and evaluation.

This DARPA work influenced the community toward supervised learning beginning in the mid-90s (Connolly et al. 1994, Aone and Bennett 1995, McCarthy and Lehnert 1995). Soon et al. (2001) laid out a set of basic features, extended by Ng and Cardie (2002b), and a series of machine learning models followed over the next 15 years. These often focused separately on pronominal anaphora resolution (Kehler et al. 2004, Bergsma and Lin 2006), full NP coreference (Cardie and Wagstaff 1999, Ng and Cardie 2002b, Ng 2005a) and definite NP reference (Poesio and Vieira 1998, Vieira and Poesio 2000), as well as separate anaphoricity detection (Bean and Riloff 1999, Bean and Riloff 2004, Ng and Cardie 2002a, Ng 2004), or singleton detection (de Marneffe et al., 2015).

The move from mention-pair to mention-ranking approaches was pioneered by Yang et al. (2003) and Iida et al. (2003) who proposed pairwise ranking methods, then extended by Denis and Baldridge (2008) who proposed to do ranking via a softmax over all prior mentions. The idea of doing mention detection, anaphoricity, and coreference jointly in a single end-to-end model grew out of the early proposal of Ng (2005b) to use a dummy antecedent for mention-ranking, allowing ‘non-referential’ to be a choice for coreference classifiers, Denis and Baldridge’s (2007) joint system combining anaphoricity classifier probabilities with coreference probabilities, the Denis and Baldridge (2008) ranking model, and the Rahman and Ng (2009) proposal to train the two models jointly with a single objective.

Simple rule-based systems for coreference returned to prominence in the 2010s, partly because of their ability to encode entity-based features in a high-precision way (Zhou et al. 2004, Haghighi and Klein 2009, Raghunathan et al. 2010, Lee et al. 2011, Lee et al. 2013, Hajishirzi et al. 2013) but in the end they suffered from an inability to deal with the semantics necessary to correctly handle cases of common noun coreference.

A return to supervised learning led to a number of advances in mention-ranking models which were also extended into neural architectures, for example using reinforcement learning to directly optimize coreference evaluation models Clark and Manning (2016a), doing end-to-end coreference all the way from span extraction (Lee et al. 2017, Zhang et al. 2018). Neural models also were designed to take advantage of global entity-level information (Clark and Manning 2016b, Wiseman et al. 2016, Lee et al. 2018).

Coreference is also related to the task of entity linking discussed in Chapter 23. Coreference can help entity linking by giving more possible surface forms to help link to the right Wikipedia page, and conversely entity linking can help improve coreference resolution. Consider this example from Hajishirzi et al. (2013):

(21.68) [Michael Eisner]<sub>1</sub> and [Donald Tsang]<sub>2</sub> announced the grand opening of [[Hong Kong] Disneyland] yesterday. [Eisner] thanked [the President] and welcomed [fans]<sub>5</sub> to [the park]<sub>4</sub>.

Integrating entity linking into coreference can help draw encyclopedic knowledge (like the fact that Donald Tsang is a president) to help disambiguate the mention the President. Ponzetto and Strube (2006) (2007) and Ratinov and Roth (2012) showed that such attributes extracted from Wikipedia pages could be used to build richer models of entity mentions in coreference. More recent research shows how to do linking and coreference jointly (Hajishirzi et al. 2013, Zheng et al. 2013) or even jointly with named entity tagging as well (Durrett and Klein 2014).

The coreference task as we introduced it involves a simplifying assumption that the relationship between an anaphor and its antecedent is one of identity: the two coreferring mentions refer to the identical discourse referent. In real texts, the relationship can be more complex, where different aspects of a discourse referent can be neutralized or refocused. For example (21.69) (Recasens et al., 2011) shows an example of metonymy, in which the capital city Washington is used metonymically to refer to the US. (21.70-21.71) show other examples (Recasens et al., 2011):

(21.69) a strict interpretation of a policy requires The U.S. to notify foreign dictators of certain coup plots ... Washington rejected the bid ...

(21.70) I once crossed that border into Ashgh-Abad on Nowruz, the Persian New Year. In the South, everyone was celebrating New Year; to the North, it was a regular day.

(21.71) In France, the president is elected for a term of seven years, while in the United States he is elected for a term of four years.

For further linguistic discussions of these complications of coreference see Pustejovsky (1991), van Deemter and Kibble (2000), Poesio et al. (2006), Fauconnier and Turner (2008), Versley (2008), and Barker (2010).

Ng (2017) offers a useful compact history of machine learning models in coreference resolution. There are three excellent book-length surveys of anaphora/coreference resolution, covering different time periods: Hirst (1981) (early work until about 1981), Mitkov (2002) (1986-2001), and Poesio et al. (2016) (2001-2015).

Andy Kehler wrote the Discourse chapter for the 2000 first edition of this textbook, which we used as the starting point for the second-edition chapter, and there

Exercises

are some remnants of Andy’s lovely prose still in this third-edition coreference chapter.

CHAPTER


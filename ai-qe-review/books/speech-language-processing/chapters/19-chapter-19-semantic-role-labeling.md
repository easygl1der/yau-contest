---
title: "Chapter 19 \u2014 Semantic Role Labeling"
book: "Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models"
book_slug: speech-language-processing
course: natural-language-processing
chapter_number: 19
citekey: jurafsky2026slp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf"
source_transcript: "transcripts/mineru/speech-language-processing/reading.md"
source_line_start: 10113
source_line_end: 10698
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 3
source_empty_image_alt: 3
non_semantic_image_alt: 1
caption_derived_image_alt: 2
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

# Chapter 19 — Semantic Role Labeling

> [[../README|本书目录]] · [[18-chapter-18-word-senses-and-wordnet|上一章]] · [[20-chapter-20-lexicons-for-sentiment-affect-and-connotation|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models（jurafsky2026slp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/speech-language-processing/reading.md)，源行 10113–10698。
> - 本章保留 3 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Semantic Role Labeling

Sometime between the 7th and 4th centuries BCE, the Indian grammarian Pan¯ <sub>.</sub> ini<sup>1</sup> wrote a famous treatise on Sanskrit grammar, the As<sub>.</sub>t<sub>.</sub>adhy¯ ay¯ ¯ı (‘8 books’), a treatise

that has been called “one of the greatest monuments of human intelligence” (Bloomfield, 1933, 11). The work describes the linguistics of the Sanskrit language in the form of 3959 sutras, each very efficiently (since it had to be memorized!) expressing part of a formal rule system that brilliantly prefigured modern mechanisms of formal language theory (Penn and Kiparsky, 2012). One set of rules, relevant to our discussion in this chapter, describes the karakas ¯ , semantic relationships between a verb and noun arguments, roles like agent, instrument, or destination. Pan¯ <sub>.</sub> ini’s work was the earliest we know of that tried

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/bcb08e8d703c43266f5c3bb6c5cd7db572e193ec75f65af33828f10927e6a557.jpg)

to understand the linguistic realization of events and their participants. This task of understanding how participants relate to events—being able to answer the question “Who did what to whom” (and perhaps also “when and where”)—is a central question of natural language understanding.

Let’s move forward 2.5 millennia to the present and consider the very mundane goal of understanding text about a purchase of stock by XYZ Corporation. This purchasing event and its participants can be described by a wide variety of surface forms. The event can be described by a verb (sold, bought) or a noun (purchase), and XYZ Corp can be the syntactic subject (of bought), the indirect object (of sold), or in a genitive or noun compound relation (with the noun purchase) despite having notionally the same role in all of them:

- XYZ corporation bought the stock.

- They sold the stock to XYZ corporation.

- The stock was bought by XYZ corporation.

- The purchase of the stock by XYZ corporation...

- The stock purchase by XYZ corporation...

In this chapter we introduce a level of representation that captures the commonality between these sentences: there was a purchase event, the participants were XYZ Corp and some stock, and XYZ Corp was the buyer. These shallow semantic representations , semantic roles, express the role that arguments of a predicate take in the event, codified in databases like PropBank and FrameNet. We’ll introduce semantic role labeling, the task of assigning roles to spans in sentences, and selectional restrictions, the preferences that predicates express about their arguments, such as the fact that the theme of eat is generally something edible.

## 19.1 Semantic Roles

Consider how in Chapter 15 we represented the meaning of arguments for sentences like these:

(19.1) Sasha broke the window.

(19.2) Pat opened the door.

A neo-Davidsonian event representation of these two sentences would be

e, x, y Breaking(e) Breaker(e, Sasha)

<sub>∧</sub>BrokenT hing(e, y) <sub>∧</sub>Window(y)

<sub>∃</sub>e, x, y Opening(e) <sub>∧</sub> Opener(e, Pat)

<sub>∧</sub>OpenedT hing(e, y) <sub>∧</sub> Door(y)

In this representation, the roles of the subjects of the verbs break and open are Breaker and Opener respectively. These deep roles are specific to each event; Breaking events have Breakers, Opening events have Openers, and so on.

If we are going to be able to answer questions, perform inferences, or do any further kinds of natural language understanding of these events, we’ll need to know a little more about the semantics of these arguments. Breakers and Openers have something in common. They are both volitional actors, often animate, and they have direct causal responsibility for their events.

Thematic roles are a way to capture this semantic commonality between Breakers and Openers. We say that the subjects of both these verbs are agents. Thus, AGENT is the thematic role that represents an abstract idea such as volitional causation. Similarly, the direct objects of both these verbs, the BrokenThing and OpenedThing, are both prototypically inanimate objects that are affected in some way by the action. The semantic role for these participants is theme.

<table><tr><td>Thematic Role</td><td>Definition</td></tr><tr><td>AGENT</td><td>The volitional causer of an event</td></tr><tr><td>EXPERIENCER</td><td>The experiencer of an event</td></tr><tr><td>FORCE</td><td>The non-volitional causer of the event</td></tr><tr><td>THEME</td><td>The participant most directly affected by an event</td></tr><tr><td>RESULT</td><td>The end product of an event</td></tr><tr><td>CONTENT</td><td>The proposition or content of a propositional event</td></tr><tr><td>INSTRUMENT</td><td>An instrument used in an event</td></tr><tr><td>BENEFICIARY</td><td>The beneficiary of an event</td></tr><tr><td>SOURCE</td><td>The origin of the object of a transfer event</td></tr><tr><td>GOAL</td><td>The destination of an object of a transfer event</td></tr><tr><td colspan="2">Figure 19.1 Some commonly used thematic roles with their definitions.</td></tr></table>

Although thematic roles are one of the oldest linguistic models, as we saw above, their modern formulation is due to Fillmore (1968) and Gruber (1965). Although there is no universally agreed-upon set of roles, Figs. 19.1 and 19.2 list some thematic roles that have been used in various computational papers, together with rough definitions and examples. Most thematic role sets have about a dozen roles, but we’ll see sets with smaller numbers of roles with even more abstract meanings, and sets with very large numbers of roles that are specific to situations. We’ll use the general term semantic roles for all sets of roles, whether small or large.

<table><tr><td>Thematic Role</td><td>Example</td></tr><tr><td>AGENT</td><td>The waiter spilled the soup.</td></tr><tr><td>EXPERIENCER</td><td>John has a headache.</td></tr><tr><td>FORCE</td><td>The wind blows debris from the mall into our yards.</td></tr><tr><td>THEME</td><td>Only after Benjamin Franklin broke the ice...</td></tr><tr><td>RESULT</td><td>The city built a regulation-size baseball diamond...</td></tr><tr><td>CONTENT</td><td>Mona asked “You met Mary Ann at a supermarket?”</td></tr><tr><td>INSTRUMENT</td><td>He poached catfish, stunning them with a shocking device...</td></tr><tr><td>BENEFICIARY</td><td>Whenever Ann Callahan makes hotel reservations for her boss...</td></tr><tr><td>SOURCE</td><td>I flew in from Boston.</td></tr><tr><td>GOAL</td><td>I drove to Portland.</td></tr><tr><td colspan="2">Figure 19.2 Some prototypical examples of various thematic roles.</td></tr></table>

## 19.2 Diathesis Alternations

The main reason computational systems use semantic roles is to act as a shallow meaning representation that can let us make simple inferences that aren’t possible from the pure surface string of words, or even from the parse tree. To extend the earlier examples, if a document says that Company A acquired Company B, we’d like to know that this answers the query Was Company B acquired? despite the fact that the two sentences have very different surface syntax. Similarly, this shallow semantics might act as a useful intermediate language in machine translation.

Semantic roles thus help generalize over different surface realizations of predicate arguments. For example, while the AGENT is often realized as the subject of the sentence, in other cases the THEME can be the subject. Consider these possible realizations of the thematic arguments of the verb break:

(19.3) John broke the window. AGENT THEME

(19.4) John broke the window with a rock. AGENT THEME INSTRUMENT

(19.6) The window broke. THEME

(19.7) The window was broken by John. THEME AGENT

These examples suggest that break has (at least) the possible arguments AGENT, THEME, and INSTRUMENT. The set of thematic role arguments taken by a verb is often called the thematic grid, θ -grid, or case frame. We can see that there are (among others) the following possibilities for the realization of these arguments of break:

AGENT/Subject, THEME/Object

AGENT/Subject, THEME/Object, INSTRUMENT/PP

INSTRUMENT/Subject, THEME/Object

THEME/Subject

It turns out that many verbs allow their thematic roles to be realized in various syntactic positions. For example, verbs like give can realize the THEME and GOAL arguments in two different ways:

(19.8)

a. Doris gave the book to Cary. AGENT THEME GOAL

b. Doris gave Cary the book. AGENT GOAL THEME

These multiple argument structure realizations (the fact that break can take AGENT, INSTRUMENT, or THEME as subject, and give can realize its THEME and GOAL in either order) are called verb alternations or diathesis alternations. The alternation we showed above for give, the dative alternation, seems to occur with particular semantic classes of verbs, including “verbs of future having” (advance, allocate, offer, owe), “send verbs” (forward, hand, mail), “verbs of throwing” (kick, pass, throw), and so on. Levin (1993) lists for 3100 English verbs the semantic classes to which they belong (47 high-level classes, divided into 193 more specific classes) and the various alternations in which they participate. These lists of verb classes have been incorporated into the online resource VerbNet (Kipper et al., 2000), which links each verb to both WordNet and FrameNet entries.

## 19.3 Semantic Roles: Problems with Thematic Roles

Representing meaning at the thematic role level seems like it should be useful in dealing with complications like diathesis alternations. Yet it has proved quite difficult to come up with a standard set of roles, and equally difficult to produce a formal definition of roles like AGENT, THEME, or INSTRUMENT.

For example, researchers attempting to define role sets often find they need to fragment a role like AGENT or THEME into many specific roles. Levin and Rappaport Hovav (2005) summarize a number of such cases, such as the fact there seem to be at least two kinds of INSTRUMENTS, intermediary instruments that can appear as subjects and enabling instruments that cannot:

a. The cook opened the jar with the new gadget.

b. The new gadget opened the jar.

(19.10) a. Shelly ate the sliced banana with a fork.

b. \*The fork ate the sliced banana.

In addition to the fragmentation problem, there are cases in which we’d like to reason about and generalize across semantic roles, but the finite discrete lists of roles don’t let us do this.

Finally, it has proved difficult to formally define the thematic roles. Consider the AGENT role; most cases of AGENTS are animate, volitional, sentient, causal, but any individual noun phrase might not exhibit all of these properties.

These problems have led to alternative semantic role models that use either many fewer or many more roles.

The first of these options is to define generalized semantic roles that abstract over the specific thematic roles. For example, PROTO-AGENT and PROTO-PATIENT are generalized roles that express roughly agent-like and roughly patient-like meanings. These roles are defined, not by necessary and sufficient conditions, but rather by a set of heuristic features that accompany more agent-like or more patient-like meanings. Thus, the more an argument displays agent-like properties (being volitionally involved in the event, causing an event or a change of state in another participant, being sentient or intentionally involved, moving) the greater the likelihood that the argument can be labeled a PROTO-AGENT. The more patient-like the properties (undergoing change of state, causally affected by another participant, stationary relative to other participants, etc.), the greater the likelihood that the argument can be labeled a PROTO-PATIENT.

The second direction is instead to define semantic roles that are specific to a particular verb or a particular group of semantically related verbs or nouns.

In the next two sections we describe two commonly used lexical resources that make use of these alternative versions of semantic roles. PropBank uses both protoroles and verb-specific semantic roles. FrameNet uses semantic roles that are specific to a general semantic idea called a frame.

## 19.4 The Proposition Bank

PropBank The Proposition Bank, generally referred to as PropBank, is a resource of sentences annotated with semantic roles. The English PropBank labels all the sentences in the Penn TreeBank; the Chinese PropBank labels sentences in the Penn Chinese TreeBank. Because of the difficulty of defining a universal set of thematic roles, the semantic roles in PropBank are defined with respect to an individual verb sense. Each sense of each verb thus has a specific set of roles, which are given only numbers rather than names: Arg0, Arg1, Arg2, and so on. In general, Arg0 represents the PROTO-AGENT, and Arg1, the PROTO-PATIENT. The semantics of the other roles are less consistent, often being defined specifically for each verb. Nonetheless there are some generalization; the Arg2 is often the benefactive, instrument, attribute, or end state, the Arg3 the start point, benefactive, instrument, or attribute, and the Arg4 the end point.

Here are some slightly simplified PropBank entries for one sense each of the verbs agree and fall. Such PropBank entries are called frame files; note that the definitions in the frame file for each role (“Other entity agreeing”, “Extent, amount fallen”) are informal glosses intended to be read by humans, rather than being formal definitions.

(19.11) agree.01

Arg0: Agreer

Arg1: Proposition

Arg2: Other entity agreeing

Ex1: $\mathrm{[_{Arg0}}$ The group] agreed $\mathrm{[_{Arg1}}$ it wouldn’t make an offer].

Ex2: $\mathrm{\Delta[_{ArgM - TMP} \Usually] \Delta[_{Arg0}}$ John] agrees $\operatorname{I}_{\mathbf{Arg} 2}$ with Mary] $\mathrm{[_{Arg1}}$ on everything].

(19.12) fall.01

Arg1: Logical subject, patient, thing falling

Arg2: Extent, amount fallen

Arg3: start point

Arg4: end point, end state of arg1

Ex1: $\mathrm{[_{Arg1}}$ Sales] $fell_{\mathrm{\Delta Arg4}}$ to \$25 million] $\mathrm{[_{Arg3}}$ from \$27 million].

Ex2: $\mathrm{[_{Arg1}}$ The average junk bond] $fell[_{\mathrm{Arg2}} b \bar{y} 4.2 \%]$

Note that there is no Arg0 role for fall, because the normal subject of fall is a PROTO-PATIENT.

The PropBank semantic roles can be useful in recovering shallow semantic information about verbal arguments. Consider the verb increase:

(19.13) increase.01 “go up incrementally”

Arg0: causer of increase

Arg1: thing increasing

Arg2: amount increased by, EXT, or MNR

Arg3: start point

Arg4: end point

A PropBank semantic role labeling would allow us to infer the commonality in the event structures of the following three examples, that ${\mathrm{is}},$ that in each case Big Fruit Co. is the AGENT and the price of bananas is the THEME, despite the differing surface forms.

(19.14) $\mathrm{[_{Arg0}}$ Big Fruit Co. ] increased $\mathrm{[_{Arg1}}$ the price of bananas].

(19.15) $\mathrm{[_{Arg1}}$ The price of bananas] was increased again $\mathrm{[_{Arg0}}$ by Big Fruit Co. ]

(19.16) $\mathrm{[_{Arg1}}$ The price of bananas] increased $\left[\operatorname{Arg} 2 \5 \% \right]$

PropBank also has a number of non-numbered arguments called ArgMs, (ArgM-TMP, ArgM-LOC, etc.) which represent modification or adjunct meanings. These are relatively stable across predicates, so aren’t listed with each frame file. Data labeled with these modifiers can be helpful in training systems to detect temporal, location, or directional modification across predicates. Some of the ArgM’s include:

<table><tr><td>TMP</td><td>when?</td><td>yesterday evening, now</td></tr><tr><td>LOC</td><td>where?</td><td>at the museum, in San Francisco</td></tr><tr><td>DIR</td><td>where to/from?</td><td>down, to Bangkok</td></tr><tr><td>MNR</td><td>how?</td><td>clearly, with much enthusiasm</td></tr><tr><td>PRP/CAU</td><td>why?</td><td rowspan="2">because ..., in response to the ruling themselves, each other</td></tr><tr><td>REC</td><td></td></tr><tr><td>ADV</td><td>miscellaneous</td><td></td></tr><tr><td>PRD</td><td>secondary predication</td><td>...ate the meat raw</td></tr></table>

## NomBank

While PropBank focuses on verbs, a related project, NomBank (Meyers et al., 2004) adds annotations to noun predicates. For example the noun agreement in Apple’s agreement with IBM would be labeled with Apple as the Arg0 and IBM as the Arg2. This allows semantic role labelers to assign labels to arguments of both verbal and nominal predicates.

## 19.5 FrameNet

While making inferences about the semantic commonalities across different sentences with increase is useful, it would be even more useful if we could make such inferences in many more situations, across different verbs, and also between verbs and nouns. For example, we’d like to extract the similarity among these three sentences:

(19.17) $\mathrm{[_{Arg1}}$ The price of bananas] increased $\left[_{\mathrm{Arg2}} 5 \% \right]$

(19.18) $\mathrm{[_{Arg1}}$ The price of bananas] rose $\mathrm{[_{Arg2}}$ 5%].

(19.19) There has been a $\left[_{\mathrm{Arg2}} 5 \% \right]$ rise $\mathrm{[_{Arg1}}$ in the price of bananas].

Note that the second example uses the different verb rise, and the third example uses the noun rather than the verb rise. We’d like a system to recognize that the price of bananas is what went up, and that 5% is the amount it went up, no matter whether the 5% appears as the object of the verb increased or as a nominal modifier of the noun rise.

The FrameNet project is another semantic-role-labeling project that attempts to address just these kinds of problems (Baker et al. 1998, Fillmore et al. 2003, Fillmore and Baker 2009, Ruppenhofer et al. 2016). Whereas roles in the PropBank project are specific to an individual verb, roles in the FrameNet project are specific to a frame.

What is a frame? Consider the following set of words:

## reservation, flight, travel, buy, price, cost, fare, rates, meal, plane

There are many individual lexical relations of hyponymy, synonymy, and so on between many of the words in this list. The resulting set of relations does not, however, add up to a complete account of how these words are related. They are clearly all defined with respect to a coherent chunk of common-sense background information concerning air travel.

We call the holistic background knowledge that unites these words a frame (Fillmore, 1985). The idea that groups of words are defined with respect to some background information is widespread in artificial intelligence and cognitive science, where besides frame we see related works like a model (Johnson-Laird, 1983), or even script (Schank and Abelson, 1977).

A frame in FrameNet is a background knowledge structure that defines a set of frame-specific semantic roles, called frame elements, and includes a set of predicates that use these roles. Each word evokes a frame and profiles some aspect of the frame and its elements. The FrameNet dataset includes a set of frames and frame elements, the lexical units associated with each frame, and a set of labeled example sentences. For example, the change position on a scale frame is defined as follows:

This frame consists of words that indicate the change of an Item’s position on a scale (the Attribute) from a starting point (Initial value) to an end point (Final value).

Some of the semantic roles (frame elements) in the frame are defined as in Fig. 19.3. Note that these are separated into core roles, which are frame specific, and non-core roles, which are more like the Arg-M arguments in PropBank, expressing more general properties of time, location, and so on.

Here are some example sentences:

(19.20) [<sub>ITEM</sub> Oil] rose [<sub>ATTRIBUTE</sub> in price] [<sub>DIFFERENCE</sub> by 2%].

(19.21) [<sub>ITEM</sub> It] has increased [<sub>FINAL STATE</sub> to having them 1 day a month].

(19.22) [<sub>ITEM</sub> Microsoft shares] fell [<sub>FINAL</sub> <sub>VALUE</sub> to 7 5/8].

(19.23) [<sub>ITEM</sub> Colon cancer incidence] fell [<sub>DIFFERENCE</sub> by 50%] [<sub>GROUP</sub> among men].

(19.24) a steady increase [<sub>INITIAL VALUE</sub> from 9.5] [<sub>FINAL VALUE</sub> to 14.3] [<sub>ITEM</sub> in dividends]

(19.25) a [<sub>DIFFERENCE</sub> 5%] [<sub>ITEM</sub> dividend] increase...

Note from these example sentences that the frame includes target words like rise, fall, and increase. In fact, the complete frame consists of the following words:

<table><tr><td colspan="2">Core Roles</td></tr><tr><td>ATTRIBUTE</td><td>The ATTRIBUTE is a scalar property that the ITEM possesses.</td></tr><tr><td>DIFFERENCE</td><td>The distance by which an ITEM changes its position on the scale.</td></tr><tr><td>FINAL_STATE</td><td>A description that presents the ITEM&#x27;s state after the change in the ATTRIBUTE&#x27;s value as an independent predication.</td></tr><tr><td>FINAL_VALUE</td><td>The position on the scale where the ITEM ends up.</td></tr><tr><td>INITIAL_STATE</td><td>A description that presents the ITEM&#x27;s state before the change in the ATTRIBUTE&#x27;s value as an independent predication.</td></tr><tr><td>INITIAL_VALUE</td><td>The initial position on the scale from which the ITEM moves away.</td></tr><tr><td>ITEM</td><td>The entity that has a position on the scale.</td></tr><tr><td>VALUE_RANGE</td><td>A portion of the scale, typically identified by its end points, along which the values of the ATTRIBUTE fluctuate.</td></tr><tr><td colspan="2">Some Non-Core Roles</td></tr><tr><td>DURATION</td><td>The length of time over which the change takes place.</td></tr><tr><td>SPEED</td><td>The rate of change of the VALUE.</td></tr><tr><td>GROUP</td><td>The GROUP in which an ITEM changes the value of an ATTRIBUTE in a specified way.</td></tr></table>

Figure 19.3 The frame elements in the change position on a scale frame from the FrameNet Labelers Guide (Ruppenhofer et al., 2016).

<table><tr><td>VERBS:</td><td>dwindle</td><td>move</td><td>soar</td><td>escalation</td><td>shift</td></tr><tr><td>advance</td><td>edge</td><td>mushroom</td><td>swell</td><td>explosion</td><td>tumble</td></tr><tr><td>climb</td><td>explode</td><td>plummet</td><td>swing</td><td>fall</td><td></td></tr><tr><td>decline</td><td>fall</td><td>reach</td><td>triple</td><td>fluctuation</td><td rowspan="2">ADVERBS: increasingly</td></tr><tr><td>decrease</td><td>fluctuate</td><td>rise</td><td>tumble</td><td>gain</td></tr><tr><td>diminish</td><td>gain</td><td>rocket</td><td></td><td>growth</td><td></td></tr><tr><td>dip</td><td>grow</td><td>shift</td><td>NOUNS:</td><td>hike</td><td></td></tr><tr><td>double</td><td>increase</td><td>skyrocket</td><td>decline</td><td>increase</td><td></td></tr><tr><td>drop</td><td>jump</td><td>slide</td><td>decrease</td><td>rise</td><td></td></tr></table>

FrameNet also codes relationships between frames, allowing frames to inherit from each other, or representing relations between frames like causation (and generalizations among frame elements in different frames can be representing by inheritance as well). Thus, there is a Cause change of position on a scale frame that is linked to the Change of position on a scale frame by the cause relation, but that adds an AGENT role and is used for causative examples such as the following:

(19.26) $\lceil_{\mathrm{AGENT}}$ They] raised $\operatorname{\I{\mathrm{ITEM}}}$ the price of their soda] $\mathrm{\Delta[DIFFERENCE}$ by 2%].

Together, these two frames would allow an understanding system to extract the common event semantics of all the verbal and nominal causative and non-causative usages.

FrameNets have also been developed for many other languages including Spanish, German, Japanese, Portuguese, Italian, and Chinese.

## 19.6 Semantic Role Labeling

semantic role<sub>labeling</sub> Semantic role labeling (sometimes shortened as SRL) is the task of automatically finding the semantic roles of each argument of each predicate in a sentence. Current approaches to semantic role labeling are based on supervised machine learning, often using the FrameNet and PropBank resources to specify what counts as a predicate, define the set of roles used in the task, and provide training and test sets.

Recall that the difference between these two models of semantic roles is that FrameNet (19.27) employs many frame-specific frame elements as roles, while Prop-Bank (19.28) uses a smaller number of numbered argument labels that can be interpreted as verb-specific labels, along with the more general ARGM labels. Some examples:

[You] can’t [blame] [the program] [for being unable to identify it] (19.27) COGNIZER TARGET EVALUEE REASON

[The San Francisco Examiner] issued [a special edition] [yesterday] (19.28) ARG0 TARGET ARG1 ARGM-TMP

## 19.6.1 A Feature-based Algorithm for Semantic Role Labeling

A simplified feature-based semantic role labeling algorithm is sketched in Fig. 19.4. Feature-based algorithms—from the very earliest systems like (Simmons, 1973)— begin by parsing, using broad-coverage parsers to assign a parse to the input string. Figure 19.5 shows a parse of (19.28) above. The parse is then traversed to find all words that are predicates.

For each of these predicates, the algorithm examines each node in the parse tree and uses supervised classification to decide the semantic role (if any) it plays for this predicate. Given a labeled training set such as PropBank or FrameNet, a feature vector is extracted for each node, using feature templates described in the next subsection. A 1-of-N classifier is then trained to predict a semantic role for each constituent given these features, where N is the number of potential semantic roles plus an extra NONE role for non-role constituents. Any standard classification algorithms can be used. Finally, for each test sentence to be labeled, the classifier is run on each relevant constituent.

```txt
function SEMANTICROLELABEL(words) returns labeled tree
parse ← PARSE(words)
for each predicate in parse do
    for each node in parse do
    featurevector ← EXTRACTFEATURES(node, predicate, parse)
    CLASSIFYNODE(node, featurevector, parse)
```

Figure 19.4 A generic semantic-role-labeling algorithm. CLASSIFYNODE is a 1-of-N classifier that assigns a semantic role (or NONE for non-role constituents), trained on labeled data such as FrameNet or PropBank.

Instead of training a single-stage classifier as in Fig. 19.5, the node-level classification task can be broken down into multiple steps:

1. Pruning: Since only a small number of the constituents in a sentence are arguments of any given predicate, many systems use simple heuristics to prune unlikely constituents.

2. Identification: a binary classification of each node as an argument to be labeled or a NONE.

3. Classification: a 1-of-N classification of all the constituents that were labeled as arguments by the previous stage

The separation of identification and classification may lead to better use of features (different features may be useful for the two tasks) or to computational efficiency.

![Figure 19.5](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/05d357f454599e4ec413d155cd86e05886de63ecd796437592e8440d91191af3.jpg)  
Figure 19.5 Parse tree for a PropBank sentence, showing the PropBank argument labels. The dotted line shows the path feature NP S VP VBD for ARG0, the NP-SBJ constituent The San Francisco Examiner.

## Global Optimization

The classification algorithm of Fig. 19.5 classifies each argument separately (‘locally’), making the simplifying assumption that each argument of a predicate can be labeled independently. This assumption is false; there are interactions between arguments that require a more ‘global’ assignment of labels to constituents. For example, constituents in FrameNet and PropBank are required to be non-overlapping. More significantly, the semantic roles of constituents are not independent. For example PropBank does not allow multiple identical arguments; two constituents of the same verb cannot both be labeled ARG0 .

Role labeling systems thus often add a fourth step to deal with global consistency across the labels in a sentence. For example, the local classifiers can return a list of possible labels associated with probabilities for each constituent, and a second-pass Viterbi decoding or re-ranking approach can be used to choose the best consensus label. Integer linear programming (ILP) is another common way to choose a solution that conforms best to multiple constraints.

## Features for Semantic Role Labeling

Most systems use some generalization of the core set of features introduced by Gildea and Jurafsky (2000). Common basic features templates (demonstrated on the NP-SBJ constituent The San Francisco Examiner in Fig. 19.5) include:

- The governing predicate, in this case the verb issued. The predicate is a crucial feature since labels are defined only with respect to a particular predicate.

- The phrase type of the constituent, in this case, NP (or NP-SBJ). Some semantic roles tend to appear as NPs, others as S or PP, and so on.

- The headword of the constituent, Examiner. The headword of a constituent can be computed with standard head rules, such as those given in Chapter 12 in Fig. 12.12. Certain headwords (e.g., pronouns) place strong constraints on the possible semantic roles they are likely to fill.

- The headword part of speech of the constituent, NNP.

- The path in the parse tree from the constituent to the predicate. This path is marked by the dotted line in Fig. 19.5. Following Gildea and Jurafsky (2000), we can use a simple linear representation of the path, NP S VP VBD. and represent upward and downward movement in the tree, respectively. The path is very useful as a compact representation of many kinds of grammatical function relationships between the constituent and the predicate.

- The voice of the clause in which the constituent appears, in this case, active (as contrasted with passive). Passive sentences tend to have strongly different linkings of semantic roles to surface form than do active ones.

- The binary linear position of the constituent with respect to the predicate, either before or after.

- The subcategorization of the predicate, the set of expected arguments that appear in the verb phrase. We can extract this information by using the phrasestructure rule that expands the immediate parent of the predicate; VP VBD NP PP for the predicate in Fig. 19.5.

- The named entity type of the constituent.

- The first words and the last word of the constituent.

The following feature vector thus represents the first NP in our example (recall that most observations will have the value NONE rather than, for example, ARG0, since most constituents in the parse tree will not bear a semantic role):

ARG0: [issued, NP, Examiner, NNP, NP S VP VBD, active, before, VP  NP PP, ORG, The, Examiner]

Other features are often used in addition, such as sets of n-grams inside the constituent, or more complex versions of the path features (the upward or downward halves, or whether particular nodes occur in the path).

It’s also possible to use dependency parses instead of constituency parses as the basis of features, for example using dependency parse paths instead of constituency paths.

## 19.6.2 A Neural Algorithm for Semantic Role Labeling

A simple neural approach to SRL is to treat it as a sequence labeling task like namedentity recognition, using the BIO approach. Let’s assume that we are given the predicate and the task is just detecting and labeling spans. Recall that with BIO tagging, we have a begin and end tag for each possible role (B-ARG0, I-ARG0; B-ARG1, I-ARG1, and so on), plus an outside tag O.

As with all the taggers, the goal is to compute the highest probability tag sequence ˆy, given the input sequence of words w:

$$
\hat{y} = \underset{y \in T}{\operatorname{argmax}} P(\mathbf{y} | \mathbf{w})
$$

Fig. 19.6 shows a sketch of a standard algorithm from Shi and Lin (2019) and He et al. (2017). Here each input word is mapped to pretrained embeddings, and also associated with an embedding for a flag (0/1) variable indicating whether that input word is the predicate. These concatenated embeddings are passed through a biL-STM. The output embedding for each token are concatenated with the output embedding for the predicate, and then passed to an MLP with a softmax which outputs a distribution over each SRL label.

For decoding, a CRF layer can be used instead of the MLP layer on top of the biLSTM output (or we can even leave off the biLSTM and pass the concatenated BERT output directly to the CRF). The Viterbi decoding algorithm (Chapter 8) can be used to decode from the CRF, which may help exploit global constraints between tags, such as the fact that a tag I-ARG0 must follow another I-ARG0 or B-ARG0.

![Figure 19.6](../../../transcripts/mineru/speech-language-processing/parts/part-002-pages-201-400/images/21dd2a51c03204980a47bdf29d0d71368d7fb09fe7ba98f8396c09bc38ba340f.jpg)  
Figure 19.6 A BERT + biLSTM approach to semantic role labeling. The input sentence is followed by [SEP] and an extra input for the predicate, in this case love. The BERT outputs are concatenated to an indicator variable which is 1 for the predicate and 0 for all other words , passed through a biLSTM, and then the output embedding at each token position is concatenated with the embedding for the predicate, and passed through a single-layer MLP. After Shi and Lin (2019) and He et al. (2017).

## 19.6.3 Evaluation of Semantic Role Labeling

The standard evaluation for semantic role labeling is to require that each argument label must be assigned to the exactly correct word sequence or parse constituent, and then compute precision, recall, and F-measure. Identification and classification can also be evaluated separately. Two common datasets used for evaluation are CoNLL-2005 (Carreras and Marquez, 2005)\` and CoNLL-2012 (Pradhan et al., 2013).

## 19.7 Selectional Restrictions

We turn in this section to another way to represent facts about the relationship between predicates and arguments. A selectional restriction is a semantic type constraint that a verb imposes on the kind of concepts that are allowed to fill its argument roles. Consider the two meanings associated with the following example:

## (19.29) I want to eat someplace nearby.

There are two possible parses and semantic interpretations for this sentence. In the sensible interpretation, eat is intransitive and the phrase someplace nearby is an adjunct that gives the location of the eating event. In the nonsensical speaker-as-Godzilla interpretation, eat is transitive and the phrase someplace nearby is the direct object and the THEME of the eating, like the NP Malaysian food in the following sentences:

## (19.30) I want to eat Malaysian food.

How do we know that someplace nearby isn’t the direct object in this sentence? One useful cue is the semantic fact that the THEME of EATING events tends to be something that is edible. This restriction placed by the verb eat on the filler of its THEME argument is a selectional restriction.

Selectional restrictions are associated with senses, not entire lexemes. We can see this in the following examples of the lexeme serve:

(19.31) The restaurant serves green-lipped mussels.

## (19.32) Which airlines serve Denver?

Example (19.31) illustrates the offering-food sense of serve, which ordinarily restricts its THEME to be some kind of food Example (19.32) illustrates the provides a commercial service to sense of serve, which constrains its THEME to be some type of appropriate location.

Selectional restrictions vary widely in their specificity. The verb imagine, for example, imposes strict requirements on its AGENT role (restricting it to humans and other animate entities) but places very few semantic requirements on its THEME role. A verb like diagonalize, on the other hand, places a very specific constraint on the filler of its THEME role: it has to be a matrix, while the arguments of the adjectives odorless are restricted to concepts that could possess an odor:

(19.33) In rehearsal, I often ask the musicians to imagine a tennis game.

(19.34) Radon is an odorless gas that can’t be detected by human senses.

(19.35) To diagonalize a matrix is to find its eigenvalues.

These examples illustrate that the set of concepts we need to represent selectional restrictions (being a matrix, being able to possess an odor, etc) is quite open ended. This distinguishes selectional restrictions from other features for representing lexical knowledge, like parts-of-speech, which are quite limited in number.

## 19.7.1 Representing Selectional Restrictions

One way to capture the semantics of selectional restrictions is to use and extend the event representation of Chapter 15. Recall that the neo-Davidsonian representation of an event consists of a single variable that stands for the event, a predicate denoting the kind of event, and variables and relations for the event roles. Ignoring the issue of the λ -structures and using thematic roles rather than deep event roles, the semantic contribution of a verb like eat might look like the following:

$$
\exists e, x, y \text{Eating}(e) \land \text{Agent}(e, x) \land \text{Theme}(e, y)
$$

With this representation, all we know about y, the filler of the THEME role, is that it is associated with an Eating event through the Theme relation. To stipulate the selectional restriction that y must be something edible, we simply add a new term to that effect:

$$
\exists e, x, y \text{Eating}(e) \land \text{Agent}(e, x) \land \text{Theme}(e, y) \land \text{EdibleThing}(y)
$$

When a phrase like ate a hamburger is encountered, a semantic analyzer can form the following kind of representation:

$$
\exists e, x, y \text{Eating}(e) \land Eater(e, x) \land Theme(e, y) \land EdibleThing(y) \land Hamburger(y)
$$

This representation is perfectly reasonable since the membership of y in the category Hamburger is consistent with its membership in the category EdibleThing, assuming a reasonable set of facts in the knowledge base. Correspondingly, the representation for a phrase such as ate a takeoff would be ill-formed because membership in an event-like category such as Takeoff would be inconsistent with membership in the category EdibleThing.

While this approach adequately captures the semantics of selectional restrictions, there are two problems with its direct use. First, using FOL to perform the simple task of enforcing selectional restrictions is overkill. Other, far simpler, formalisms can do the job with far less computational cost. The second problem is that this approach presupposes a large, logical knowledge base of facts about the concepts that make up selectional restrictions. Unfortunately, although such common-sense knowledge bases are being developed, none currently have the kind of coverage necessary to the task.

```perl
Sense 1
hamburger, beefburger --
(a fried cake of minced beef served on a bun)
=> sandwich
=> snack food
=> dish
=> nutriment, nourishment, nutrition...
=> food, nutrient
=> substance
=> matter
=> physical entity
=> entity
```  
Figure 19.7 Evidence from WordNet that hamburgers are edible.

A more practical approach is to state selectional restrictions in terms of WordNet synsets rather than as logical concepts. Each predicate simply specifies a WordNet synset as the selectional restriction on each of its arguments. A meaning representation is well-formed if the role filler word is a hyponym (subordinate) of this synset.

For our ate a hamburger example, for instance, we could set the selectional restriction on the THEME role of the verb eat to the synset food, nutrient , glossed as any substance that can be metabolized by an animal to give energy and build tissue. Luckily, the chain of hypernyms for hamburger shown in Fig. 19.7 reveals that hamburgers are indeed food. Again, the filler of a role need not match the restriction synset exactly; it just needs to have the synset as one of its superordinates.

We can apply this approach to the THEME roles of the verbs imagine, lift, and diagonalize, discussed earlier. Let us restrict imagine’s THEME to the synset entity , lift’s THEME to physical entity , and diagonalize to matrix . This arrangement correctly permits imagine a hamburger and lift a hamburger, while also correctly ruling out diagonalize a hamburger.

## 19.7.2 Selectional Preferences

In the earliest implementations, selectional restrictions were considered strict constraints on the kind of arguments a predicate could take (Katz and Fodor 1963, Hirst 1987). For example, the verb eat might require that its THEME argument be [+FOOD]. Early word sense disambiguation systems used this idea to rule out senses that violated the selectional restrictions of their governing predicates.

Very quickly, however, it became clear that these selectional restrictions were better represented as preferences rather than strict constraints (Wilks 1975c, Wilks 1975b). For example, selectional restriction violations (like inedible arguments of eat) often occur in well-formed sentences, for example because they are negated (19.36), or because selectional restrictions are overstated (19.37):

(19.36) But it fell apart in 1931, perhaps because people realized you can’t eat gold for lunch if you’re hungry.

(19.37) In his two championship trials, Mr. Kulkarni ate glass on an empty stomach, accompanied only by water and tea.

Modern systems for selectional preferences therefore specify the relation between a predicate and its possible arguments with soft constraints of some kind.

## Selectional Association

One of the most influential has been the selectional association model of Resnik (1993). Resnik defines the idea of selectional preference strength as the general amount of information that a predicate tells us about the semantic class of its arguments. For example, the verb eat tells us a lot about the semantic class of its direct objects, since they tend to be edible. The verb be, by contrast, tells us less about its direct objects. The selectional preference strength can be defined by the difference in information between two distributions: the distribution of expected semantic classes $P(c)$ (how likely is it that a direct object will fall into class c) and the distribution of expected semantic classes for the particular verb $P(c | \nu)$ (how likely is it that the direct object of the specific verb v will fall into semantic class c). The greater the difference between these distributions, the more information the verb is giving us about possible objects. The difference between these two distributions can be quantified by relative entropy, or the Kullback-Leibler divergence (Kullback and Leibler, 1951). The Kullback-Leibler or KL divergence $D(P | | Q)$ expresses the difference between two probability distributions P and Q

$$
D(P | | Q) = \sum_{x} P(x) \log \frac{P(x)}{Q(x)}\tag{19.38}
$$

The selectional preference $S_{R}(\nu)$ uses the KL divergence to express how much information, in bits, the verb v expresses about the possible semantic class of its argument.

$$
\begin{array}{l} S_{R}(v) = D(P(c | v) | | P(c)) \\ = \sum_{c} P(c | v) \log \frac{P(c | v)}{P(c)} \end{array}\tag{19.39}
$$

Resnik then defines the selectional association of a particular class and verb as the relative contribution of that class to the general selectional preference of the verb:

$$
A_{R}(v, c) = \frac{1}{S_{R}(v)} P(c | v) \log \frac{P(c | v)}{P(c)}\tag{19.40}
$$

The selectional association is thus a probabilistic measure of the strength of association between a predicate and a class dominating the argument to the predicate. Resnik estimates the probabilities for these associations by parsing a corpus, counting all the times each predicate occurs with each argument word, and assuming that each word is a partial observation of all the WordNet concepts containing the word. The following table from Resnik (1996) shows some sample high and low selectional associations for verbs and some WordNet semantic classes of their direct objects.

<table><tr><td rowspan="2">Verb</td><td colspan="2">Direct Object</td><td colspan="2">Direct Object</td></tr><tr><td>Semantic Class</td><td>Assoc</td><td>Semantic Class</td><td>Assoc</td></tr><tr><td>read</td><td>WRITING</td><td>6.80</td><td>ACTIVITY</td><td>-.20</td></tr><tr><td>write</td><td>WRITING</td><td>7.26</td><td>COMMERCE</td><td>0</td></tr><tr><td>see</td><td>ENTITY</td><td>5.79</td><td>METHOD</td><td>-0.01</td></tr></table>

## Selectional Preference via Conditional Probability

An alternative to using selectional association between a verb and the WordNet class of its arguments is to use the conditional probability of an argument word given a predicate verb, directly modeling the strength of association of one verb (predicate) with one noun (argument).

The conditional probability model can be computed by parsing a very large corpus (billions of words), and computing co-occurrence counts: how often a given verb occurs with a given noun in a given relation. The conditional probability of an argument noun given a verb for a particular relation $P(n | \nu, r)$ can then be used as a selectional preference metric for that pair of words (Brockmann and Lapata 2003, Keller and Lapata 2003):

$$
P(n | v, r) = \left\{\begin{array}{cl} \frac{C(n, v, r)}{C(v, r)} & \text{if} C(n, v, r) > 0 \\ 0 & \text{otherwise} \end{array} \right.
$$

The inverse probability $P(\nu | n, r)$ was found to have better performance in some cases (Brockmann and Lapata, 2003):

$$
P(v | n, r) = \left\{\begin{array}{cl} \frac{C(n, v, r)}{C(n, r)} & \text{if} C(n, v, r) > 0 \\ 0 & \text{otherwise} \end{array} \right.
$$

An even simpler approach is to use the simple log co-occurrence frequency of the predicate with the argument log count $(\nu, n, r)$ instead of conditional probability; this seems to do better for extracting preferences for syntactic subjects rather than objects (Brockmann and Lapata, 2003).

## Evaluating Selectional Preferences

One way to evaluate models of selectional preferences is to use pseudowords (Gale et al. 1992c, Schutze 1992a¨ ). A pseudoword is an artificial word created by concatenating a test word in some context (say banana) with a confounder word (say door) to create banana-door). The task of the system is to identify which of the two words is the original word. To evaluate a selectional preference model (for example on the relationship between a verb and a direct object) we take a test corpus and select all verb tokens. For each verb token (say drive) we select the direct object (e.g., car), concatenated with a confounder word that is its nearest neighbor, the noun with the frequency closest to the original (say house), to make car/house). We then use the selectional preference model to choose which of car and house are more preferred objects of drive, and compute how often the model chooses the correct original object (e.g., car) (Chambers and Jurafsky, 2010).

Another evaluation metric is to get human preferences for a test set of verbargument pairs, and have them rate their degree of plausibility. This is usually done by using magnitude estimation, a technique from psychophysics, in which subjects rate the plausibility of an argument proportional to a modulus item. A selectional preference model can then be evaluated by its correlation with the human preferences (Keller and Lapata, 2003).

## 19.8 Primitive Decomposition of Predicates

One way of thinking about the semantic roles we have discussed through the chapter is that they help us define the roles that arguments play in a decompositional way, based on finite lists of thematic roles (agent, patient, instrument, proto-agent, protopatient, etc.). This idea of decomposing meaning into sets of primitive semantics elements or features, called primitive decomposition or componential analysis, has been taken even further, and focused particularly on predicates.

Consider these examples of the verb kill:

(19.41) Jim killed his philodendron.

(19.42) Jim did something to cause his philodendron to become not alive.

There is a truth-conditional (‘propositional semantics’) perspective from which these two sentences have the same meaning. Assuming this equivalence, we could represent the meaning of kill as:

(19.43) KILL(x,y) <sub>⇔</sub> CAUSE(x, BECOME(NOT(ALIVE(y))))

thus using semantic primitives like do, cause, become not, and alive.

Indeed, one such set of potential semantic primitives has been used to account for some of the verbal alternations discussed in Section 19.2 (Lakoff 1965, Dowty 1979). Consider the following examples.

(19.44) John opened the door. CAUSE(John, BECOME(OPEN(door)))

(19.45) The door opened.  BECOME(OPEN(door))

(19.46) The door is open. OPEN(door)

The decompositional approach asserts that a single state-like predicate associated with open underlies all of these examples. The differences among the meanings of these examples arises from the combination of this single predicate with the primitives CAUSE and BECOME.

While this approach to primitive decomposition can explain the similarity between states and actions or causative and non-causative predicates, it still relies on having a large number of predicates like open. More radical approaches choose to break down these predicates as well. One such approach to verbal predicate decomposition that played a role in early natural language understanding systems is conceptual dependency (CD), a set of ten primitive predicates, shown in Fig. 19.8.

Below is an example sentence along with its CD representation. The verb brought is translated into the two primitives ATRANS and PTRANS to indicate that the waiter both physically conveyed the check to Mary and passed control of it to her. Note that CD also associates a fixed set of thematic roles with each primitive to represent the various participants in the action.

(19.47) The waiter brought Mary the check.

<table><tr><td>Primitive</td><td>Definition</td></tr><tr><td>ATRANS</td><td>The abstract transfer of possession or control from one entity to another</td></tr><tr><td>PTRANS</td><td>The physical transfer of an object from one location to another</td></tr><tr><td>MTRANS</td><td>The transfer of mental concepts between entities or within an entity</td></tr><tr><td>MBUILD</td><td>The creation of new information within an entity</td></tr><tr><td>PROPEL</td><td>The application of physical force to move an object</td></tr><tr><td>MOVE</td><td>The integral movement of a body part by an animal</td></tr><tr><td>INGEST</td><td>The taking in of a substance by an animal</td></tr><tr><td>EXPEL</td><td>The expulsion of something from an animal</td></tr><tr><td>SPEAK</td><td>The action of producing a sound</td></tr><tr><td>ATTEND</td><td>The action of focusing a sense organ</td></tr></table>

Figure 19.8 A set of conceptual dependency primitives.

## 19.9 Summary

- Semantic roles are abstract models of the role an argument plays in the event described by the predicate.

- Thematic roles are a model of semantic roles based on a single finite list of roles. Other semantic role models include per-verb semantic role lists and proto-agent/proto-patient, both of which are implemented in PropBank, and per-frame role lists, implemented in FrameNet.

- Semantic role labeling is the task of assigning semantic role labels to the constituents of a sentence. The task is generally treated as a supervised machine learning task, with models trained on PropBank or FrameNet. Algorithms generally start by parsing a sentence and then automatically tag each parse tree node with a semantic role. Neural models map straight from words end-to-end.

- Semantic selectional restrictions allow words (particularly predicates) to post constraints on the semantic properties of their argument words. Selectional preference models (like selectional association or simple conditional probability) allow a weight or probability to be assigned to the association between a predicate and an argument word or class.

## Bibliographical and Historical Notes

Although the idea of semantic roles dates back to Pan¯ ini, they were re-introduced into modern linguistics by Gruber (1965), Fillmore (1966) and Fillmore (1968). Fillmore had become interested in argument structure by studying Lucien Tesniere’s\` groundbreaking El<sup>´</sup> ements de Syntaxe Structurale´ (Tesniere, 1959)\` in which the term ‘dependency’ was introduced and the foundations were laid for dependency grammar. Following Tesniere’s terminology, Fillmore first referred to argument roles as\` actants (Fillmore, 1966) but quickly switched to the term case, (see Fillmore (2003)) and proposed a universal list of semantic roles or cases (Agent, Patient, Instrument, etc.), that could be taken on by the arguments of predicates. Verbs would be listed in the lexicon with their case frame, the list of obligatory (or optional) case arguments.

The idea that semantic roles could provide an intermediate level of semantic representation that could help map from syntactic parse structures to deeper, more fully-specified representations of meaning was quickly adopted in natural language processing, and systems for extracting case frames were created for machine translation (Wilks, 1973), question-answering (Hendrix et al., 1973), spoken-language understanding (Nash-Webber, 1975), and dialogue systems (Bobrow et al., 1977). General-purpose semantic role labelers were developed. The earliest ones (Simmons, 1973) first parsed a sentence by means of an ATN (Augmented Transition Network) parser. Each verb then had a set of rules specifying how the parse should be mapped to semantic roles. These rules mainly made reference to grammatical functions (subject, object, complement of specific prepositions) but also checked constituent internal features such as the animacy of head nouns. Later systems assigned roles from pre-built parse trees, again by using dictionaries with verb-specific case frames (Levin 1977, Marcus 1980).

By 1977 case representation was widely used and taught in AI and NLP courses, and was described as a standard of natural language understanding in the first edition of Winston’s (1977) textbook Artificial Intelligence.

In the 1980s Fillmore proposed his model of frame semantics, later describing the intuition as follows:

“The idea behind frame semantics is that speakers are aware of possibly quite complex situation types, packages of connected expectations, that go by various names—frames, schemas, scenarios, scripts, cultural narratives, memes—and the words in our language are understood with such frames as their presupposed background.” (Fillmore, 2012, p. 712)

The word frame seemed to be in the air for a suite of related notions proposed at about the same time by Minsky (1974), Hymes (1974), and Goffman (1974), as well as related notions with other names like scripts (Schank and Abelson, 1975) and schemata (Bobrow and Norman, 1975) (see Tannen (1979) for a comparison). Fillmore was also influenced by the semantic field theorists and by a visit to the Yale AI lab where he took notice of the lists of slots and fillers used by early information extraction systems like DeJong (1982) and Schank and Abelson (1977). In the 1990s Fillmore drew on these insights to begin the FrameNet corpus annotation project.

At the same time, Beth Levin drew on her early case frame dictionaries (Levin, 1977) to develop her book which summarized sets of verb classes defined by shared argument realizations (Levin, 1993). The VerbNet project built on this work (Kipper et al., 2000), leading soon afterwards to the PropBank semantic-role-labeled corpus created by Martha Palmer and colleagues (Palmer et al., 2005).

The combination of rich linguistic annotation and corpus-based approach instantiated in FrameNet and PropBank led to a revival of automatic approaches to semantic role labeling, first on FrameNet (Gildea and Jurafsky, 2000) and then on PropBank data (Gildea and Palmer, 2002, inter alia). The problem first addressed in the 1970s by handwritten rules was thus now generally recast as one of supervised machine learning enabled by large and consistent databases. Many popular features used for role labeling are defined in Gildea and Jurafsky (2002), Surdeanu et al. (2003), Xue and Palmer (2004), Pradhan et al. (2005), Che et al. (2009), and Zhao et al. (2009). The use of dependency rather than constituency parses was introduced in the CoNLL-2008 shared task (Surdeanu et al., 2008). For surveys see Palmer et al. (2010) and Marquez et al. (2008)\` .

The use of neural approaches to semantic role labeling was pioneered by Collobert et al. (2011), who applied a CRF on top of a convolutional net. Early work like Foland, Jr. and Martin (2015) focused on using dependency features. Later work eschewed syntactic features altogether; Zhou and Xu (2015b) introduced the use of a stacked (6-8 layer) biLSTM architecture, and (He et al., 2017) showed how to augment the biLSTM architecture with highway networks and also replace the CRF with A\* decoding that make it possible to apply a wide variety of global constraints in SRL decoding.

Most semantic role labeling schemes only work within a single sentence, focusing on the object of the verbal (or nominal, in the case of NomBank) predicate. However, in many cases, a verbal or nominal predicate may have an implicit argument: one that appears only in a contextual sentence, or perhaps not at all and must be inferred. In the two sentences This house has a new owner. The sale was finalized 10 days ago. the sale in the second sentence has no ARG1, but a reasonable reader would infer that the Arg1 should be the house mentioned in the prior sentence. Finding these arguments, implicit argument detection (sometimes shortened as iSRL) was introduced by Gerber and Chai (2010) and Ruppenhofer et al. (2010). See Do et al. (2017) for more recent neural models.

To avoid the need for huge labeled training sets, unsupervised approaches for semantic role labeling attempt to induce the set of semantic roles by clustering over arguments. The task was pioneered by Riloff and Schmelzenbach (1998) and Swier and Stevenson (2004); see Grenager and Manning (2006), Titov and Klementiev (2012), Lang and Lapata (2014), Woodsend and Lapata (2015), and Titov and Khoddam (2014).

Recent innovations in frame labeling include connotation frames, which mark richer information about the argument of predicates. Connotation frames mark the sentiment of the writer or reader toward the arguments (for example using the verb survive in he survived a bombing expresses the writer’s sympathy toward the subject he and negative sentiment toward the bombing. See Chapter 20 for more details.

Selectional preference has been widely studied beyond the selectional association models of Resnik (1993) and Resnik (1996). Methods have included clustering (Rooth et al., 1999), discriminative learning (Bergsma et al., 2008a), and topic models (Seaghdha 2010´ , Ritter et al. 2010), and constraints can be expressed at the level of words or classes (Agirre and Martinez, 2001). Selectional preferences have also been successfully integrated into semantic role labeling (Erk 2007, Zapirain et al. 2013, Do et al. 2017).

## Exercises


<!-- MinerU pages 401-600 -->

CHAPTER

# exicons for Sentiment, Affect, nd Connotation

Some day we’ll be able to measure the power of words

Maya Angelou

In this chapter we turn to tools for interpreting affective meaning, extending our study of sentiment analysis in Chapter 4. We use the word ‘affective’, following the tradition in affective computing (Picard, 1995) to mean emotion, sentiment, personality, mood, and attitudes. Affective meaning is closely related to subjectivity, the study of a speaker or writer’s evaluations, opinions, emotions, and speculations (Wiebe et al., 1999).

How should affective meaning be defined? One influential typology of affective states comes from Scherer (2000), who defines each class of affective states by factors like its cognitive realization and time course (Fig. 20.1).

Emotion: Relatively brief episode of response to the evaluation of an external or internal event as being of major significance. (angry, sad, joyful, fearful, ashamed, proud, elated, desperate)

Mood: Diffuse affect state, most pronounced as change in subjective feeling, of low intensity but relatively long duration, often without apparent cause. (cheerful, gloomy, irritable, listless, depressed, buoyant)

Interpersonal stance: Affective stance taken toward another person in a specific interaction, coloring the interpersonal exchange in that situation. (distant, cold, warm, supportive, contemptuous, friendly)

Attitude: Relatively enduring, affectively colored beliefs, preferences, and predispositions towards objects or persons. (liking, loving, hating, valuing, desiring)

Personality traits: Emotionally laden, stable personality dispositions and behavior tendencies, typical for a person. (nervous, anxious, reckless, morose, hostile, jealous)

Figure 20.1 The Scherer typology of affective states (Scherer, 2000).

We can design extractors for each of these kinds of affective states. Chapter 4 already introduced sentiment analysis, the task of extracting the positive or negative orientation that a writer expresses in a text. This corresponds in Scherer’s typology to the extraction of attitudes: figuring out what people like or dislike, from affectrich texts like consumer reviews of books or movies, newspaper editorials, or public sentiment in blogs or tweets.

Detecting emotion and moods is useful for detecting whether a student is confused, engaged, or certain when interacting with a tutorial system, whether a caller to a help line is frustrated, whether someone’s blog posts or tweets indicated depression. Detecting emotions like fear in novels, for example, could help us trace what groups or situations are feared and how that changes over time.

Detecting different interpersonal stances can be useful when extracting information from human-human conversations. The goal here is to detect stances like friendliness or awkwardness in interviews or friendly conversations, for example for summarizing meetings or finding parts of a conversation where people are especially excited or engaged, conversational hot spots that can help in meeting summarization. Detecting the personality of a user—such as whether the user is an extrovert or the extent to which they are open to experience— can help improve conversational agents, which seem to work better if they match users’ personality expectations (Mairesse and Walker, 2008). And affect is important for generation as well as recognition; synthesizing affect is important for conversational agents in various domains, including literacy tutors such as children’s storybooks, or computer games.

In Chapter 4 we introduced the use of naive Bayes classification to classify a document’s sentiment. Various classifiers have been successfully applied to many of these tasks, using all the words in the training set as input to a classifier which then determines the affect status of the text.

In this chapter we focus on an alternative model, in which instead of using every word as a feature, we focus only on certain words, ones that carry particularly strong cues to affect or sentiment. We call these lists of words affective lexicons or sentiment lexicons. These lexicons presuppose a fact about semantics: that words have affective meanings or connotations. The word connotation has different meanings in different fields, but here we use it to mean the aspects of a word’s meaning that are related to a writer or reader’s emotions, sentiment, opinions, or evaluations. In addition to their ability to help determine the affective status of a text, connotation lexicons can be useful features for other kinds of affective tasks, and for computational social science analysis.

In the next sections we introduce basic theories of emotion, show how sentiment lexicons are a special case of emotion lexicons, and mention some useful lexicons. We then survey three ways for building lexicons: human labeling, semi-supervised, and supervised. Finally, we turn to other kinds of affective meaning like personality, stance, and entity-centric affect, and introduce connotation frames.


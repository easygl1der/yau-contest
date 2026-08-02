---
title: "Chapter 20 \u2014 Lexicons for Sentiment, Affect, and Connotation"
book: "Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models"
book_slug: speech-language-processing
course: natural-language-processing
chapter_number: 20
citekey: jurafsky2026slp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf"
source_transcript: "transcripts/mineru/speech-language-processing/reading.md"
source_line_start: 10699
source_line_end: 11173
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 18
source_empty_image_alt: 18
non_semantic_image_alt: 12
caption_derived_image_alt: 6
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

# Chapter 20 — Lexicons for Sentiment, Affect, and Connotation

> [[../README|本书目录]] · [[19-chapter-19-semantic-role-labeling|上一章]] · [[21-chapter-21-coreference-resolution|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models（jurafsky2026slp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/speech-language-processing/reading.md)，源行 10699–11173。
> - 本章保留 18 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.412) × 1；PDF-confirmed control-symbol repair (PDF p.418) × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 20.1 Defining Emotion

One of the most important affective classes is emotion, which Scherer (2000) defines as a “relatively brief episode of response to the evaluation of an external or internal event as being of major significance”.

Detecting emotion has the potential to improve a number of language processing tasks. Automatically detecting emotions in reviews or customer responses (anger, dissatisfaction, trust) could help businesses recognize specific problem areas or ones that are going well. Emotion recognition could help dialog systems like tutoring systems detect that a student was unhappy, bored, hesitant, confident, and so on. Emotion can play a role in medical informatics tasks like detecting depression or suicidal intent. Detecting emotions expressed toward characters in novels might play a role in understanding how different social groups were viewed by society at different times.

There are two widely-held families of theories of emotion; we’ll introduce lexicons for both kinds of theories. In one family, emotions are viewed as fixed atomic units, limited in number, and from which others are generated, often called basic emotions (Tomkins 1962, Plutchik 1962). Perhaps most well-known of this family of theories are the 6 emotions proposed by Ekman (see for example Ekman 1999) as a set of emotions that is likely to be universally present in all cultures: surprise, happiness, anger, fear, disgust, sadness. Another atomic theory is the Plutchik (1980) wheel of emotion, consisting of 8 basic emotions in four opposing pairs: joy–sadness, anger–fear, trust–disgust, and anticipation–surprise, together with the emotions derived from them, shown in Fig. 20.2.

![Figure 20.2](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/e247f8ec372c2e9347e9fd04807a5786a825f5d0a42f54c589adc19751866712.jpg)  
Figure 20.2 Plutchik wheel of emotion.

The second class of emotion theories views emotion as a space in 2 or 3 dimensions (Russell, 1980). Most models include the two dimensions valence and arousal, and many add a third, dominance. These can be defined as:

valence: the pleasantness of the stimulus

arousal: the intensity of emotion provoked by the stimulus

dominance: the degree of control exerted by the stimulus

Sentiment can be viewed as a special case of this second view of emotions as points in space. In particular, the valence dimension, measuring how pleasant or unpleasant a word is, is often used directly as a measure of sentiment.

## 20.2 Available Sentiment and Affect Lexicons

A wide variety of affect lexicons have been created and released. The most basic lexicons label words along one dimension of semantic variability, generally called “sentiment” or “valence”.

In the simplest lexicons this dimension is represented in a binary fashion, with a wordlist for positive words and a wordlist for negative words. The oldest is the General Inquirer (Stone et al., 1966), which drew on content analysis and on early work in the cognitive psychology of word meaning (Osgood et al., 1957). The General Inquirer has a lexicon of 1915 positive words and a lexicon of 2291 negative words (as well as other lexicons discussed below). The MPQA Subjectivity lexicon (Wilson et al., 2005) has 2718 positive and 4912 negative words drawn from prior lexicons plus a bootstrapped list of subjective words and phrases (Riloff and Wiebe, 2003). Each entry in the lexicon is hand-labeled for sentiment and also labeled for reliability (strongly subjective or weakly subjective). The polarity lexicon of Hu and Liu (2004b) gives 2006 positive and 4783 negative words, drawn from product reviews, labeled using a bootstrapping method from WordNet.

<table><tr><td>Positive</td><td>admire, amazing, assure, celebration, charm, eager, enthusiastic, excellent, fancy, fantastic, frolic, graceful, happy, joy, luck, majesty, mercy, nice, patience, perfect, proud, rejoice, relief, respect, satisfactorily, sensational, super, terrific, thank, vivid, wise, wonderful, zest</td></tr><tr><td>Negative</td><td>abominable, anger, anxious, bad, catastrophe, cheap, complaint, condescending, deceit, defective, disappointment, embarrass, fake, fear, filthy, fool, guilt, hate, idiot, inflict, lazy, miserable, mourn, nervous, objection, pest, plot, reject, scream, silly, terrible, unfriendly, vile, wicked</td></tr></table>

Figure 20.3 Some words with consistent sentiment across the General Inquirer (Stone et al., 1966), the MPQA Subjectivity lexicon (Wilson et al., 2005), and the polarity lexicon of Hu and Liu (2004b).

Slightly more general than these sentiment lexicons are lexicons that assign each word a value on all three affective dimensions. The NRC Valence, Arousal, and Dominance (VAD) lexicon (Mohammad, 2018a) assigns valence, arousal, and dominance scores to 20,000 words. Some examples are shown in Fig. 20.4.

<table><tr><td colspan="2">Valence</td><td colspan="2">Arousal</td><td colspan="2">Dominance</td></tr><tr><td>vacation</td><td>.840</td><td>enraged</td><td>.962</td><td>powerful</td><td>.991</td></tr><tr><td>delightful</td><td>.918</td><td>party</td><td>.840</td><td>authority</td><td>.935</td></tr><tr><td>whistle</td><td>.653</td><td>organized</td><td>.337</td><td>saxophone</td><td>.482</td></tr><tr><td>consolation</td><td>.408</td><td>effortless</td><td>.120</td><td>discouraged</td><td>.0090</td></tr><tr><td>torture</td><td>.115</td><td>napping</td><td>.046</td><td>weak</td><td>.045</td></tr></table>

Figure 20.4 Values of sample words on the emotional dimensions of Mohammad (2018a).

The NRC Word-Emotion Association Lexicon, also called EmoLex (Mohammad and Turney, 2013), uses the Plutchik (1980) 8 basic emotions defined above. The lexicon includes around 14,000 words including words from prior lexicons as well as frequent nouns, verbs, adverbs and adjectives. Values from the lexicon for some sample words:

<table><tr><td>Word</td><td>anger</td><td>anticipation</td><td>disgust</td><td>fear</td><td>joy</td><td>sadness</td><td>surprise</td><td>trust</td><td>positive</td><td>negative</td></tr><tr><td>reward</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td><td>0</td></tr><tr><td>worry</td><td>0</td><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr><tr><td>tenderness</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td></tr><tr><td>sweetheart</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td></tr><tr><td>suddenly</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td></tr><tr><td>thirst</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td></tr><tr><td>garbage</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td></tr></table>

For a smaller set of 5,814 words, the NRC Emotion/Affect Intensity Lexicon (Mohammad, 2018b) contains real-valued scores of association for anger, fear, joy, and sadness; Fig. 20.5 shows examples.

<table><tr><td colspan="2">Anger</td><td colspan="2">Fear</td><td colspan="2">Joy</td><td colspan="2">Sadness</td></tr><tr><td>outraged violence coup oust suspicious nurture</td><td>0.964 0.742 0.578 0.484 0.484 0.059</td><td>horror anguish pestilence stressed failing confident</td><td>0.923 0.703 0.625 0.531 0.531 0.094</td><td>superb cheered rainbow gesture warms hardship</td><td>0.864 0.773 0.531 0.387 0.391 .031</td><td>sad guilt unkind difficulties beggar sing</td><td>0.844 0.750 0.547 0.421 0.422 0.017</td></tr></table>

Figure 20.5 Sample emotional intensities for words for anger, fear, joy, and sadness from Mohammad (2018b).

LIWC, Linguistic Inquiry and Word Count, is a widely used set of 73 lexicons containing over 2300 words (Pennebaker et al., 2007), designed to capture aspects of lexical meaning relevant for social psychological tasks. In addition to sentiment-related lexicons like ones for negative emotion (bad, weird, hate, problem, tough) and positive emotion (love, nice, sweet), LIWC includes lexicons for categories like anger, sadness, cognitive mechanisms, perception, tentative, and inhibition, shown in Fig. 20.6.

<table><tr><td>Positive Emotion</td><td>Negative Emotion</td><td>Insight</td><td>Inhibition</td><td>Family</td><td>Negate</td></tr><tr><td>appreciat*</td><td>anger*</td><td>aware*</td><td>avoid*</td><td>brother*</td><td>aren’t</td></tr><tr><td>comfort*</td><td>bore*</td><td>believe</td><td>careful*</td><td>cousin*</td><td>cannot</td></tr><tr><td>great</td><td>cry</td><td>decid*</td><td>hesitat*</td><td>daughter*</td><td>didn’t</td></tr><tr><td>happy</td><td>despair*</td><td>feel</td><td>limit*</td><td>family</td><td>neither</td></tr><tr><td>interest</td><td>fail*</td><td>figur*</td><td>oppos*</td><td>father*</td><td>never</td></tr><tr><td>joy*</td><td>fear</td><td>know</td><td>prevent*</td><td>grandf*</td><td>no</td></tr><tr><td>perfect*</td><td>griev*</td><td>knew</td><td>reluctan*</td><td>grandm*</td><td>nobod*</td></tr><tr><td>please*</td><td>hate*</td><td>means</td><td>safe*</td><td>husband</td><td>none</td></tr><tr><td>safe*</td><td>panic*</td><td>notice*</td><td>stop</td><td>mom</td><td>nor</td></tr><tr><td>terrific</td><td>suffers</td><td>recogni*</td><td>stubborn*</td><td>mother</td><td>nothing</td></tr><tr><td>value</td><td>terrify</td><td>sense</td><td>wait</td><td>niece*</td><td>nowhere</td></tr><tr><td>wow*</td><td>violent*</td><td>think</td><td>wary</td><td>wife</td><td>without</td></tr></table>

Figure 20.6 Samples from 5 of the 73 lexical categories in LIWC (Pennebaker et al., 2007). The \* means the previous letters are a word prefix and all words with that prefix are included in the category.

There are various other hand-built affective lexicons. The General Inquirer includes additional lexicons for dimensions like strong vs. weak, active vs. passive, overstated vs. understated, as well as lexicons for categories like pleasure, pain, virtue, vice, motivation, and cognitive orientation.

Another useful feature for various tasks is the distinction between concrete words like banana or bathrobe and abstract words like belief and although. The lexicon in Brysbaert et al. (2014) used crowdsourcing to assign a rating from 1 to 5 of the concreteness of 40,000 words, thus assigning banana, bathrobe, and bagel 5, belief 1.19, although 1.07, and in between words like brisk a 2.5.

## 20.3 Creating Affect Lexicons by Human Labeling

The earliest method used to build affect lexicons, and still in common use, is to have humans label each word. This is now most commonly done via crowdsourcing: breaking the task into small pieces and distributing them to a large number of annotators. Let’s take a look at some of the methodological choices for two crowdsourced emotion lexicons.

The NRC Emotion Lexicon (EmoLex) (Mohammad and Turney, 2013), labeled emotions in two steps. To ensure that the annotators were judging the correct sense of the word, they first answered a multiple-choice synonym question that primed the correct sense of the word (without requiring the annotator to read a potentially confusing sense definition). These were created automatically using the headwords associated with the thesaurus category of the sense in question in the Macquarie dictionary and the headwords of 3 random distractor categories. An example:

Which word is closest in meaning (most related) to startle?

- automobile

- shake

- honesty

- entertain

For each word (e.g. startle), the annotator was then asked to rate how associated that word is with each of the 8 emotions (joy, fear, anger, etc.). The associations were rated on a scale of not, weakly, moderately, and strongly associated. Outlier ratings were removed, and then each term was assigned the class chosen by the majority of the annotators, with ties broken by choosing the stronger intensity, and then the 4 levels were mapped into a binary label for each word (no and weak mapped to 0, moderate and strong mapped to 1).

The NRC VAD Lexicon (Mohammad, 2018a) was built by selecting words and emoticons from prior lexicons and annotating them with crowd-sourcing using bestworst scaling (Louviere et al. 2015, Kiritchenko and Mohammad 2017). In bestworst scaling, annotators are given N items (usually 4) and are asked which item is the best (highest) and which is the worst (lowest) in terms of some property. The set of words used to describe the ends of the scales are taken from prior literature. For valence, for example, the raters were asked:

Q1. Which of the four words below is associated with the MOST happiness / pleasure / positiveness / satisfaction / contentedness / hopefulness OR LEAST unhappiness / annoyance / negativeness / dissatisfaction / melancholy / despair? (Four words listed as options.)

Q2. Which of the four words below is associated with the LEAST happiness / pleasure / positiveness / satisfaction / contentedness / hopefulness OR MOST unhappiness / annoyance / negativeness / dissatisfaction / melancholy / despair? (Four words listed as options.)

The score for each word in the lexicon is the proportion of times the item was chosen as the best (highest V/A/D) minus the proportion of times the item was chosen as the worst (lowest V/A/D). The agreement between annotations are evaluated by splithalf reliability: split the corpus in half and compute the correlations between the annotations in the two halves.

## 20.4 Semi-supervised Induction of Affect Lexicons

Another common way to learn sentiment lexicons is to start from a set of seed words that define two poles of a semantic axis (words like good or bad), and then find ways to label each word w by its similarity to the two seed sets. Here we summarize two families of seed-based semi-supervised lexicon induction algorithms, axis-based and graph-based.

## 20.4.1 Semantic Axis Methods

One of the most well-known lexicon induction methods, the Turney and Littman (2003) algorithm, is given seed words like good or bad, and then for each word w to be labeled, measures both how similar it is to good and how different it is from bad. Here we describe a slight extension of the algorithm due to An et al. (2018), which is based on computing a semantic axis.

In the first step, we choose seed words by hand. There are two methods for dealing with the fact that the affect of a word is different in different contexts: (1) start with a single large seed lexicon and rely on the induction algorithm to fine-tune it to the domain, or (2) choose different seed words for different genres. Hellrich et al. (2019) suggests that for modeling affect across different historical time periods, starting with a large modern affect dictionary is better than small seedsets tuned to be stable across time. As an example of the second approach, Hamilton et al. (2016a) define one set of seed words for general sentiment analysis, a different set for Twitter, and yet another set for sentiment in financial text:

<table><tr><td>Domain</td><td>Positive seeds</td><td>Negative seeds</td></tr><tr><td>General</td><td>good, lovely, excellent, fortunate, pleasant, delightful, perfect, loved, love, happy</td><td>bad, horrible, poor, unfortunate, unpleasant, disgusting, evil, hated, hate, unhappy</td></tr><tr><td>Twitter</td><td>love, loved, loves, awesome, nice, amazing, best, fantastic, correct, happy</td><td>hate, hated, hates, terrible, nasty, awful, worst, horrible, wrong, sad</td></tr><tr><td>Finance</td><td>successful, excellent, profit, beneficial, improving, improved, success, gains, positive</td><td>negligent, loss, volatile, wrong, losses, damages, bad, litigation, failure, down, negative</td></tr></table>

In the second step, we compute embeddings for each of the pole words. These embeddings can be off-the-shelf word2vec embeddings, or can be computed directly on a specific corpus (for example using a financial corpus if a finance lexicon is the goal), or we can fine-tune off-the-shelf embeddings to a corpus. Fine-tuning is especially important if we have a very specific genre of text but don’t have enough data to train good embeddings. In fine-tuning, we begin with off-the-shelf embeddings like word2vec, and continue training them on the small target corpus.

Once we have embeddings for each pole word, we create an embedding that represents each pole by taking the centroid of the embeddings of each of the seed words; recall that the centroid is the multidimensional version of the mean. Given a set of embeddings for the positive seed words ${\cal S}^{+} = \{{\cal E}(w_{1}^{+}),{\cal E}(w_{2}^{+}),...,{\cal E}(w_{n}^{+})\}$ and embeddings for the negative seed words $S^{-} = \{E(w_{1}^{-}), E(w_{2}^{-}),..., E(w_{m}^{-})\}$ , the

pole centroids are:

$$
\mathbf{V}^{+} = \frac{1}{n} \sum_{1}^{n} E(w_{i}^{+})
$$

$$
\mathbf{V}^{-} = \frac{1}{m} \sum_{1}^{m} E(w_{i}^{-})\tag{20.1}
$$

The semantic axis defined by the poles is computed just by subtracting the two vectors:

$$
\mathbf{V}_{\text{axis}} = \mathbf{V}^{+} - \mathbf{V}^{-}\tag{20.2}
$$

$\mathbf{v}_{axis},$ the semantic axis, is a vector in the direction of positive sentiment. Finally, we compute (via cosine similarity) the angle between the vector in the direction of positive sentiment and the direction of w’s embedding. A higher cosine means that w is more aligned with $S^{+}$ than $S^{-}$

$$
\begin{array}{rcl} \text{score}(w) & = & \bigl(\cos(E(w), \mathbf{V}_{\text{axis}}) \\ & = & \frac{E(w) \cdot \mathbf{V}_{\text{axis}}}{\| E(w) \| \| \mathbf{V}_{\text{axis}} \|} \end{array}\tag{20.3}
$$

If a dictionary of words with sentiment scores is sufficient, we’re done! Or if we need to group words into a positive and a negative lexicon, we can use a threshold or other method to give us discrete lexicons.

## 20.4.2 Label Propagation

An alternative family of methods defines lexicons by propagating sentiment labels on graphs, an idea suggested in early work by Hatzivassiloglou and McKeown (1997). We’ll describe the simple SentProp (Sentiment Propagation) algorithm of Hamilton et al. (2016a), which has four steps:

1. Define a graph: Given word embeddings, build a weighted lexical graph by connecting each word with its k nearest neighbors (according to cosine similarity). The weights of the edge between words $w_{i}$ and $w_{j}$ are set as:

$$
\mathbb{E}_{i, j} = \arccos \left(- \frac{\mathbf{w_{i}}^{\top} \mathbf{w_{j}}}{\| \mathbf{w_{i}} \| \| \mathbf{w_{j}} \|}\right).\tag{20.4}
$$

2. Define a seed set: Choose positive and negative seed words.

3. Propagate polarities from the seed set: Now we perform a random walk on this graph, starting at the seed set. In a random walk, we start at a node and then choose a node to move to with probability proportional to the edge probability. A word’s polarity score for a seed set is proportional to the probability of a random walk from the seed set landing on that word (Fig. 20.7).

4. Create word scores: We walk from both positive and negative seed sets, resulting in positive (rawscore $^+(w_{i}))$ and negative (rawscore $^-(w_{i}))$ raw label scores. We then combine these values into a positive-polarity score as:

$$
\operatorname{score}^{+} \left(w_{i}\right) = \frac{\operatorname{rawscore}^{+} \left(w_{i}\right)}{\operatorname{rawscore}^{+} \left(w_{i}\right) + \operatorname{rawscore}^{-} \left(w_{i}\right)}\tag{20.5}
$$

It’s often helpful to standardize the scores to have zero mean and unit variance within a corpus.

5. Assign confidence to each score: Because sentiment scores are influenced by the seed set, we’d like to know how much the score of a word would change if a different seed set is used. We can use bootstrap sampling to get confidence regions, by computing the propagation B times over random subsets of the positive and negative seed sets (for example using B = 50 and choosing 7 of the 10 seed words each time). The standard deviation of the bootstrap sampled polarity scores gives a confidence measure.

![Figure 20.7](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/45043aa9d40c6045a91b9466cebd4431115ad4687178d5300100775b8ef22814.jpg)  
Figure 20.7 Intuition of the SENTPROP algorithm. (a) Run random walks from the seed words. (b) Assign polarity scores (shown here as colors green or red) based on the frequency of random walk visits.

## 20.4.3 Other Methods

The core of semisupervised algorithms is the metric for measuring similarity with the seed words. The Turney and Littman (2003) and Hamilton et al. (2016a) approaches above used embedding cosine as the distance metric: words were labeled as positive basically if their embeddings had high cosines with positive seeds and low cosines with negative seeds. Other methods have chosen other kinds of distance metrics besides embedding cosine.

For example the Hatzivassiloglou and McKeown (1997) algorithm uses syntactic cues; two adjectives are considered similar if they were frequently conjoined by and and rarely conjoined by but. This is based on the intuition that adjectives conjoined by the words and tend to have the same polarity; positive adjectives are generally coordinated with positive, negative with negative:

fair and legitimate, corrupt and brutal

but less often positive adjectives coordinated with negative:

\*fair and brutal, \*corrupt and legitimate

By contrast, adjectives conjoined by but are likely to be of opposite polarity:

fair but brutal

Another cue to opposite polarity comes from morphological negation (un-, im-, -less). Adjectives with the same root but differing in a morphological negative (adequate/inadequate, thoughtful/thoughtless) tend to be of opposite polarity.

Yet another method for finding words that have a similar polarity to seed words is to make use of a thesaurus like WordNet (Kim and Hovy 2004, Hu and Liu 2004b). A word’s synonyms presumably share its polarity while a word’s antonyms probably have the opposite polarity. After a seed lexicon is built, each lexicon is updated as follows, possibly iterated.

Lex<sup>+</sup>: Add synonyms of positive words (well) and antonyms (like fine) of negative words

Lex−: Add synonyms of negative words (awful) and antonyms (like evil) of positive words

An extension of this algorithm assigns polarity to WordNet senses, called Senti-SentiWordNet WordNet (Baccianella et al., 2010). Fig. 20.8 shows some examples.

<table><tr><td colspan="2">Synset</td><td>Pos</td><td>Neg</td><td>Obj</td></tr><tr><td>good#6</td><td>‘agreeable or pleasing’</td><td>1</td><td>0</td><td>0</td></tr><tr><td>respectable#2</td><td>honorable#4 good#4 estimable#2 ‘deserving of esteem’</td><td>0.75</td><td>0</td><td>0.25</td></tr><tr><td>estimable#3</td><td>computable#1 ‘may be computed or estimated’</td><td>0</td><td>0</td><td>1</td></tr><tr><td>sting#1</td><td>burn#4 bite#2 ‘cause a sharp or stinging pain’</td><td>0</td><td>0.875</td><td>.125</td></tr><tr><td>acute#6</td><td>‘of critical importance and consequence’</td><td>0.625</td><td>0.125</td><td>.250</td></tr><tr><td>acute#4</td><td>‘of an angle; less than 90 degrees’</td><td>0</td><td>0</td><td>1</td></tr><tr><td>acute#1</td><td>‘having or experiencing a rapid onset and short but severe course’</td><td>0</td><td>0.5</td><td>0.5</td></tr></table>

Figure 20.8 Examples from SentiWordNet 3.0 (Baccianella et al., 2010). Note the differences between senses of homonymous words: estimable#3 is purely objective, while estimable#2 is positive; acute can be positive (acute#6), negative (acute#1), or neutral (acute #4).

In this algorithm, polarity is assigned to entire synsets rather than words. A positive lexicon is built from all the synsets associated with 7 positive words, and a negative lexicon from synsets associated with 7 negative words. A classifier is then trained from this data to take a WordNet gloss and decide if the sense being defined is positive, negative or neutral. A further step (involving a random-walk algorithm) assigns a score to each WordNet synset for its degree of positivity, negativity, and neutrality.

In summary, semisupervised algorithms use a human-defined set of seed words for the two poles of a dimension, and use similarity metrics like embedding cosine, coordination, morphology, or thesaurus structure to score words by how similar they are to the positive seeds and how dissimilar to the negative seeds.

## 20.5 Supervised Learning of Word Sentiment

Semi-supervised methods require only minimal human supervision (in the form of seed sets). But sometimes a supervision signal exists in the world and can be made use of. One such signal is the scores associated with online reviews.

The web contains an enormous number of online reviews for restaurants, movies, books, or other products, each of which have the text of the review along with an associated review score: a value that may range from 1 star to 5 stars, or scoring 1 to 10. Fig. 20.9 shows samples extracted from restaurant, book, and movie reviews.

We can use this review score as supervision: positive words are more likely to appear in 5-star reviews; negative words in 1-star reviews. And instead of just a binary polarity, this kind of supervision allows us to assign a word a more complex representation of its polarity: its distribution over stars (or other scores).

Thus in a ten-star system we could represent the sentiment of each word as a 10-tuple, each number a score representing the word’s association with that polarity level. This association can be a raw count, or a likelihood P(w c), or some other function of the count, for each class c from 1 to 10.

For example, we could compute the IMDb likelihood of a word like disappoint(ed/ing) occurring in a 1 star review by dividing the number of times disappoint(ed/ing) occurs in 1-star reviews in the IMDb dataset (8,557) by the total number of words occurring in 1-star reviews (25,395,214), so the IMDb estimate of P(disappointing 1) is .0003.

<table><tr><td colspan="2">Movie review excerpts (IMDb)</td></tr><tr><td>10</td><td>A great movie. This film is just a wonderful experience. It’s surreal, zany, witty and slapstick all at the same time. And terrific performances too.</td></tr><tr><td>1</td><td>This was probably the worst movie I have ever seen. The story went nowhere even though they could have done some interesting stuff with it.</td></tr><tr><td colspan="2">Restaurant review excerpts (Yelp)</td></tr><tr><td>5</td><td>The service was impeccable. The food was cooked and seasoned perfectly... The watermelon was perfectly square ... The grilled octopus was ... mouthwatering...</td></tr><tr><td>2</td><td>...it took a while to get our waters, we got our entree before our starter, and we never received silverware or napkins until we requested them...</td></tr><tr><td colspan="2">Book review excerpts (GoodReads)</td></tr><tr><td>1</td><td>I am going to try and stop being deceived by eye-catching titles. I so wanted to like this book and was so disappointed by it.</td></tr><tr><td>5</td><td>This book is hilarious. I would recommend it to anyone looking for a satirical read with a romantic twist and a narrator that keeps butting in</td></tr><tr><td colspan="2">Product review excerpts (Amazon)</td></tr><tr><td>5</td><td>The lid on this blender though is probably what I like the best about it... enables you to pour into something without even taking the lid off! ... the perfect pitcher! ... works fantastic.</td></tr><tr><td>1</td><td>I hate this blender... It is nearly impossible to get frozen fruit and ice to turn into a smoothie... You have to add a TON of liquid. I also wish it had a spout ...</td></tr><tr><td colspan="2">Figure 20.9 Excerpts from some reviews from various review websites, all on a scale of 1 to 5 stars except IMDb, which is on a scale of 1 to 10 stars.</td></tr></table>

A slight modification of this weighting, the normalized likelihood, can be used as an illuminating visualization (Potts, 2011)<sup>1</sup>:

$$
\begin{array}{c} P(w | c) = \frac{\text{count}(w, c)}{\sum_{w \in C} \text{count}(w, c)} \\ PottsScore(w) = \frac{P(w | c)}{\sum_{c} P(w | c)} \end{array}\tag{20.6}
$$

Dividing the IMDb estimate P(disappointing 1) of .0003 by the sum of the likelihood $P(w | c)$ over all categories gives a Potts score of 0.10. The word disappointing thus is associated with the vector [.10, .12, .14, .14, .13, .11, .08, .06, .06, .05]. The Potts diagram (Potts, 2011) is a visualization of these word scores, representing the prior sentiment of a word as a distribution over the rating categories.

Fig. 20.10 shows the Potts diagrams for 3 positive and 3 negative scalar adjectives. Note that the curve for strongly positive scalars have the shape of the letter J, while strongly negative scalars look like a reverse J. By contrast, weakly positive and negative scalars have a hump-shape, with the maximum either below the mean (weakly negative words like disappointing) or above the mean (weakly positive words like good). These shapes offer an illuminating typology of affective meaning.

Fig. 20.11 shows the Potts diagrams for emphasizing and attenuating adverbs. Note that emphatics tend to have a J-shape (most likely to occur in the most positive reviews) or a U-shape (most likely to occur in the strongly positive and negative). Attenuators all have the hump-shape, emphasizing the middle of the scale and

Negative scalars M

Figure 20.11  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/fb919b8d364fb4fd8e2b6bc54b861e91b21bc51414439572eb8af5a4d4073fd1.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/f8e60366d41fdd625956e67064389433b22aba2757373f11e0316877e3586595.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/010d1325466acf7e00539f2bb3bb1da6a79d989fc375485684236fa53ce5039a.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/d30e716fdce79415b89ceee74dd23e0ef65b0fc178b2be9c22254bc0740458c0.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/12b9b933ca331002cbac9d8e8a27a0a5123ebfc15723355cd7fa2882dd336d48.jpg)

![Figure 20.10](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/6b74490389301ffecc2ed205a3d200c3e26023b68f272c3af9dae61d3f244429.jpg)  
Figure 20.10 Potts diagrams (Potts, 2011) for positive and negative scalar adjectives, showing the J-shape and reverse J-shape for strongly positive and negative adjectives, and the hump-shape for more weakly polarized adjectives.

downplaying both extremes. The diagrams can be used both as a typology of lexical sentiment, and also play a role in modeling sentiment compositionality.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/c6c6851b1762737b0dee05a7527e2b66928db66b63759512ffcf11223f47692c.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/e0b687886dd30eb8794a8ab0be69c8e9ab2b304f6cb8dcdd7aa1b35b7fa62dad.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/7c62ea1f6f7761452ff2a9e7b9d4381f48aa9a4fcf5bd9b2bf1a7192ab513d26.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/5433e393762e99bcc614e9481139fdf1736ba8901365810f4b697fcdbad0d3a0.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/f52d32a05ab1dd0970ca9a598065fe2aeb8749b90adefb4d084e21149d5598c0.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/78f08ad8b625d3bd59fdb4c343f9014fa17d216ee1b7e11ba38f0802456a75f2.jpg)  
Potts diagrams (Potts, 2011) for emphatic and attenuating adverbs.

In addition to functions like posterior $P(c | w)$ , likelihood $P(w | c)$ , or normalized likelihood (Eq. 20.6) many other functions of the count of a word occurring with a sentiment label have been used. We’ll introduce some of these on page 409, including ideas like normalizing the counts per writer in Eq. 20.14.

## 20.5.1 Log Odds Ratio Informative Dirichlet Prior

One thing we often want to do with word polarity is to distinguish between words that are more likely to be used in one category of texts than in another. We may, for example, want to know the words most associated with 1 star reviews versus those associated with 5 star reviews. These differences may not be just related to sentiment. We might want to find words used more often by Democratic than Republican members of Congress, or words used more often in menus of expensive restaurants than cheap restaurants.

Given two classes of documents, to find words more associated with one category than another, we could measure the difference in frequencies (is a word w more frequent in class A or class B?). Or instead of the difference in frequencies we could compute the ratio of frequencies, or compute the log odds ratio (the log of the ratio between the odds of the two words). We could then sort words by whichever association measure we pick, ranging from words overrepresented in category A to words overrepresented in category B.

The problem with simple log-likelihood or log odds methods is that they don’t work well for very rare words or very frequent words; for words that are very frequent, all differences seem large, and for words that are very rare, no differences seem large.

In this section we walk through the details of one solution to this problem: the “log odds ratio informative Dirichlet prior” method of Monroe et al. (2008) that is a particularly useful method for finding words that are statistically overrepresented in one particular category of texts compared to another. It’s based on the idea of using another large corpus to get a prior estimate of what we expect the frequency of each word to be.

Let’s start with the goal: assume we want to know whether the word horrible occurs more in corpus i or corpus $j.$ We could compute the log likelihood ratio, using $f^{i}(w)$ to mean the frequency of word w in corpus $i,$ and $n^{i}$ to mean the total number of words in corpus i:

$$
\begin{array}{rcl} \operatorname{llr}(horrible) & = & \log \frac{P^{i}(horrible)}{P^{j}(horrible)} \\ & = & \log P^{i}(horrible) - \log P^{j}(horrible) \\ & = & \log \frac{f^{i}(horrible)}{n^{i}} - \log \frac{f^{j}(horrible)}{n^{j}} \end{array}\tag{20.7}
$$

Instead, let’s compute the log odds ratio: does horrible have higher odds in i or in $j \colon$

$$
\begin{array}{l} \text{lor(horrible)} = \log \left(\frac{P^{i}(horrible)}{1 - P^{i}(horrible)}\right) - \log \left(\frac{P^{j}(horrible)}{1 - P^{j}(horrible)}\right) \\ = \log \left(\frac{\frac{\text{f}^{i}(horrible)}{n^{i}}}{1 - \frac{\text{f}^{i}(horrible)}{n^{i}}}\right) - \log \left(\frac{\frac{\text{f}^{j}(horrible)}{n^{j}}}{1 - \frac{\text{f}^{j}(horrible)}{n^{j}}}\right) \\ = \log \left(\frac{\text{f}^{i}(horrible)}{n^{i} - \text{f}^{i}(horrible)}\right) - \log \left(\frac{\text{f}^{j}(horrible)}{n^{j} - \text{f}^{j}(horrible)}\right) \end{array}\tag{20.8}
$$

The Dirichlet intuition is to use a large background corpus to get a prior estimate of what we expect the frequency of each word w to be. We’ll do this very simply by adding the counts from that corpus to the numerator and denominator, so that we’re essentially shrinking the counts toward that prior. It’s like asking how large are the differences between i and $j$ given what we would expect given their frequencies in a well-estimated large background corpus.

The method estimates the difference between the frequency of word w in two corpora i and $j$ via the prior-modified log odds ratio for w, $\delta_{w}^{(i - j)}$ , which is estimated as:

$$
\delta_{w}^{(i - j)} = \log \left(\frac{f_{w}^{i} + \alpha_{w}}{n^{i} + \alpha_{0} -(f_{w}^{i} + \alpha_{w})}\right) - \log \left(\frac{f_{w}^{j} + \alpha_{w}}{n^{j} + \alpha_{0} -(f_{w}^{j} + \alpha_{w})}\right)\tag{20.9}
$$

(where $n^{i}$ is the size of corpus $i, n^{j}$ is the size of corpus $j, f_{w}^{i}$ is the count of word w in corpus $i, f_{w}^{j}$ is the count of word w in corpus $j,$ $\alpha_{0}$ is the size of the background corpus, and $\alpha_{w}$ is the count of word w in the background corpus.)

In addition, Monroe et al. (2008) make use of an estimate for the variance of the log–odds–ratio:

$$
\sigma^{2} \left(\hat{\delta}_{w}^{(i - j)}\right) \approx \frac{1}{f_{w}^{i} + \alpha_{w}} + \frac{1}{f_{w}^{j} + \alpha_{w}}\tag{20.10}
$$

The final statistic for a word is then the z–score of its log–odds–ratio:

$$
\frac{\hat{\boldsymbol{\delta}}_{w}^{(i - j)}}{\sqrt{\sigma^{2} \left(\hat{\boldsymbol{\delta}}_{w}^{(i - j)}\right)}}\tag{20.11}
$$

The Monroe et al. (2008) method thus modifies the commonly used log odds ratio in two ways: it uses the z-scores of the log odds ratio, which controls for the amount of variance in a word’s frequency, and it uses counts from a background corpus to provide a prior count for words.

Fig. 20.12 shows the method applied to a dataset of restaurant reviews from Yelp, comparing the words used in 1-star reviews to the words used in 5-star reviews (Jurafsky et al., 2014). The largest difference is in obvious sentiment words, with the 1-star reviews using negative sentiment words like worse, bad, awful and the 5-star reviews using positive sentiment words like great, best, amazing. But there are other illuminating differences. 1-star reviews use logical negation (no, not), while 5-star reviews use emphatics and emphasize universality (very, highly, every, always). 1- star reviews use first person plurals (we, us, our) while 5 star reviews use the second person. 1-star reviews talk about people (manager, waiter, customer) while 5-star reviews talk about dessert and properties of expensive restaurants like courses and atmosphere. See Jurafsky et al. (2014) for more details.

## 20.6 Using Lexicons for Sentiment Recognition

In Chapter 4 we introduced the naive Bayes algorithm for sentiment analysis. The lexicons we have focused on throughout the chapter so far can be used in a number of ways to improve sentiment detection.

In the simplest case, lexicons can be used when we don’t have sufficient training data to build a supervised sentiment analyzer; it can often be expensive to have a human assign sentiment to each document to train the supervised classifier.

<table><tr><td>Class</td><td>Words in 1-star reviews</td><td>Class</td><td>Words in 5-star reviews</td></tr><tr><td>Negative</td><td>worst, rude, terrible, horrible, bad, awful, disgusting, bland, tasteless, gross, mediocre, overpriced, worse, poor</td><td>Positive</td><td>great, best, love(d), delicious, amazing, favorite, perfect, excellent, awesome, friendly, fantastic, fresh, wonderful, incredible, sweet, yum(my)</td></tr><tr><td>Negation</td><td>no, not</td><td>Emphatics/ universals</td><td>very, highly, perfectly, definitely, absolutely, everything, every, always</td></tr><tr><td>1Pl pro</td><td>we, us, our</td><td>2 pro</td><td>you</td></tr><tr><td>3 pro</td><td>she, he, her, him</td><td>Articles</td><td>a, the</td></tr><tr><td>Past verb</td><td>was, were, asked, told, said, did, charged, waited, left, took</td><td>Advice</td><td>try, recommend</td></tr><tr><td>Sequencers</td><td>after, then</td><td>Conjunct</td><td>also, as, well, with, and</td></tr><tr><td>Nouns</td><td>manager, waitress, waiter, customer, customers, attitude, waste, poisoning, money, bill, minutes</td><td>Nouns</td><td>atmosphere, dessert, chocolate, wine, course, menu</td></tr><tr><td>Irrealis modals</td><td>would, should</td><td>Auxiliaries</td><td>is/’s, can, ’ve, are</td></tr><tr><td>Comp</td><td>to, that</td><td>Prep, other</td><td>in, of, die, city, mouth</td></tr></table>

Figure 20.12 The top 50 words associated with one–star and five-star restaurant reviews in a Yelp dataset of 900,000 reviews, using the Monroe et al. (2008) method (Jurafsky et al., 2014).

In such situations, lexicons can be used in a rule-based algorithm for classification. The simplest version is just to use the ratio of positive to negative words: if a document has more positive than negative words (using the lexicon to decide the polarity of each word in the document), it is classified as positive. Often a threshold λ is used, in which a document is classified as positive only if the ratio is greater than λ . If the sentiment lexicon includes positive and negative weights for each word, $\theta_{w}^{+}$ and $\theta_{w}^{-}$ , these can be used as well. Here’s a simple such sentiment algorithm:

$$
\begin{array}{l} f^{+} = \sum_{w \text{s.t.} w \in \text{positivelexicon}} \theta_{w}^{+} \text{count}(w) \\ f^{-} = \sum_{w \text{s.t.} w \in \text{negativelexicon}} \theta_{w}^{-} \text{count}(w) \end{array}
$$

$$
sentiment = \left\{\begin{array}{ll} + & \text{if} \frac{f^{+}}{f^{-}} > \lambda \\ - & \text{if} \frac{f^{-}}{f^{+}} > \lambda \\ 0 & \text{otherwise.} \end{array} \right.\tag{20.12}
$$

If supervised training data is available, these counts computed from sentiment lexicons, sometimes weighted or normalized in various ways, can also be used as features in a classifier along with other lexical or non-lexical features. We return to such algorithms in Section 20.8.

## 20.7 Other tasks: Personality

Many other kinds of affective meaning can be extracted from text and speech. For personality example detecting a person’s personality from their language can be useful for dialog systems (users tend to prefer agents that match their personality), and can play a useful role in computational social science questions like understanding how personality is related to other kinds of behavior.

Many theories of human personality are based around a small number of dimensions, such as various versions of the “Big Five” dimensions (Digman, 1990):

Extroversion vs. Introversion: sociable, assertive, playful vs. aloof, reserved, shy

Emotional stability vs. Neuroticism: calm, unemotional vs. insecure, anxious

Agreeableness vs. Disagreeableness: friendly, cooperative vs. antagonistic, faultfinding

Conscientiousness vs. Unconscientiousness: self-disciplined, organized vs. inefficient, careless

Openness to experience: intellectual, insightful vs. shallow, unimaginative

A few corpora of text and speech have been labeled for the personality of their author by having the authors take a standard personality test. The essay corpus of Pennebaker and King (1999) consists of 2,479 essays (1.9 million words) from psychology students who were asked to “write whatever comes into your mind” for 20 minutes. The EAR (Electronically Activated Recorder) corpus of Mehl et al. (2006) was created by having volunteers wear a recorder throughout the day, which randomly recorded short snippets of conversation throughout the day, which were then transcribed. The Facebook corpus of (Schwartz et al., 2013) includes 309 million words of Facebook posts from 75,000 volunteers.

For example, here are samples from Pennebaker and King (1999) from an essay written by someone on the neurotic end of the neurotic/emotionally stable scale,

One of my friends just barged in, and I jumped in my seat. This is crazy.

I should tell him not to do that again. I’m not that fastidious actually.

and someone on the emotionally stable end of the scale:

I should excel in this sport because I know how to push my body harder than anyone I know, no matter what the test I always push my body harder than everyone else. I want to be the best no matter what the sport or event. I should also be good at this because I love to ride my bike.

Another kind of affective meaning is what Scherer (2000) calls interpersonal stance, the ‘affective stance taken toward another person in a specific interaction coloring the interpersonal exchange’. Extracting this kind of meaning means automatically labeling participants for whether they are friendly, supportive, distant. For example Ranganath et al. (2013) studied a corpus of speed-dates, in which participants went on a series of 4-minute romantic dates, wearing microphones. Each participant labeled each other for how flirtatious, friendly, awkward, or assertive they were. Ranganath et al. (2013) then used a combination of lexicons and other features to detect these interpersonal stances from text.

## 20.8 Affect Recognition

Detection of emotion, personality, interactional stance, and the other kinds of affective meaning described by Scherer (2000) can be done by generalizing the algorithms described above for detecting sentiment.

The most common algorithms involve supervised classification: a training set is labeled for the affective meaning to be detected, and a classifier is built using features extracted from the training set. As with sentiment analysis, if the training set is large enough, and the test set is sufficiently similar to the training set, simply using all the words or all the bigrams as features in a powerful classifier like SVM or logistic regression, as described in Fig. 4.2 in Chapter 4, is an excellent algorithm whose performance is hard to beat. Thus we can treat affective meaning classification of a text sample as simple document classification.

Some modifications are nonetheless often necessary for very large datasets. For example, the Schwartz et al. (2013) study of personality, gender, and age using 700 million words of Facebook posts used only a subset of the n-grams of lengths 1- 3. Only words and phrases used by at least 1% of the subjects were included as features, and 2-grams and 3-grams were only kept if they had sufficiently high PMI (PMI greater than 2 length, where length is the number of words):

$$
\operatorname{pmi}(phrase) = \log \frac{p(phrase)}{\prod_{w \in phrase} p(w)}\tag{20.13}
$$

Various weights can be used for the features, including the raw count in the training set, or some normalized probability or log probability. Schwartz et al. (2013), for example, turn feature counts into phrase likelihoods by normalizing them by each subject’s total word use.

$$
p(\text{phrase} | \text{subject}) = \frac{\operatorname{freq}(\text{phrase}, \text{subject})}{\sum_{\text{phrase}^{\prime} \in \text{vocab}(\text{subject})} \operatorname{freq}(\text{phrase}^{\prime}, \text{subject})}\tag{20.14}
$$

If the training data is sparser, or not as similar to the test set, any of the lexicons we’ve discussed can play a helpful role, either alone or in combination with all the words and n-grams.

Many possible values can be used for lexicon features. The simplest is just an indicator function, in which the value of a feature $f_{L}$ takes the value 1 if a particular text has any word from the relevant lexicon L. Using the notation of Chapter 4, in which a feature value is defined for a particular output class c and document x.

$$
f_{L}(c, x) = \left\{\begin{array}{ll} 1 & \text{if} \exists w: w \in L \& w \in x \& class = c \\ 0 & \text{otherwise} \end{array} \right.
$$

Alternatively the value of a feature $f_{L}$ for a particular lexicon L can be the total number of word tokens in the document that occur in L:

$$
f_{L} = \sum_{w \in L} count(w)
$$

For lexica in which each word is associated with a score or weight, the count can be multiplied by a weight $\theta_{w}^{L}$ :

$$
f_{L} = \sum_{w \in L} \theta_{w}^{L} count(w)
$$

Counts can alternatively be logged or normalized per writer as in Eq. 20.14.

However they are defined, these lexicon features are then used in a supervised classifier to predict the desired affective category for the text or document. Once a classifier is trained, we can examine which lexicon features are associated with which classes. For a classifier like logistic regression the feature weight gives an indication of how associated the feature is with the class.

Thus, for example, Mairesse and Walker (2008) found that for classifying personality, for the dimension Agreeable, the LIWC lexicons Family and Home were positively associated while the LIWC lexicons anger and swear were negatively associated. By contrast, Extroversion was positively associated with the Friend, Religion and Self lexicons, and Emotional Stability was positively associated with Sports and negatively associated with Negative Emotion.

![Figure 20.13](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/ea4d2733b5ca6e86e7e4ff5db169203186290ede816f15cc5516b111ea507559.jpg)  
Figure 20.13 Word clouds from Schwartz et al. (2013), showing words highly associated with introversion (left) or extroversion (right). The size of the word represents the association strength (the regression coefficient), while the color (ranging from cold to hot) represents the relative frequency of the word/phrase (from low to high).

In the situation in which we use all the words and phrases in the document as potential features, we can use the resulting weights from the learned regression classifier as the basis of an affective lexicon. In the Extroversion/Introversion classifier of Schwartz et al. (2013), ordinary least-squares regression is used to predict the value of a personality dimension from all the words and phrases. The resulting regression coefficient for each word or phrase can be used as an association value with the predicted dimension. The word clouds in Fig. 20.13 show an example of words associated with introversion (a) and extroversion (b). Note that regression weights are not guaranteed to represent the correct association when word counts are correlated, and so it is often necessary to first prune the list of words if exact values are needed.

## 20.9 Lexicon-based methods for Entity-Centric Affect

What if we want to get an affect score not for an entire document, but for a particular entity in the text? The entity-centric method of Field and Tsvetkov (2019) combines <sub>from and from . A.</sub>affect lexicons with contextual embeddings to assign an affect score to an entity in <sup>mputer’);</sup> <sup>N\~72,709.</sup> <sup>B.</sup> <sup>Language</sup> <sup>distinguishing</sup> <sup>neuroticism</sup> <sup>(left,</sup> <sup>e.g.</sup>text. In the context of affect about people, they relabel the Valence/Arousal/Dominance dimension as Sentiment/Agency/Power. The algorithm first trains classifiers to map embeddings to scores:

## 1. For each word w in the training corpus:

(a) Use off-the-shelf pretrained encoders (like BERT) to extract a contextual embedding $e$ for each instance of the word. No additional fine-tuning is done.

(b) Average over the e embeddings of each instance of w to obtain a single embedding vector for one training point w.

(c) Use the NRC VAD Lexicon to get S, A, and P scores for w.

2. Train (three) regression models on all words w to predict V, A, D scores from a word’s average embedding.

Now given an entity mention m in a text, we assign affect scores as follows:

1. Use the same pretrained LM to get contextual embeddings for m in context.

2. Feed this embedding through the 3 regression models to get S, A, P scores for the entity.

This results in a (S,A,P) tuple for a given entity mention; To get scores for the representation of an entity in a complete document, we can run coreference resolution and average the (S,A,P) scores for all the mentions. Fig. 20.14 shows the scores from their algorithm for characters from the movie The Dark Knight when run on Wikpedia plot summary texts with gold coreference.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/f8e94bc9017f2a5f1c58925d4ed460fc4e1e25a717debbd645713fa3f3258593.jpg)  
Figure 2:Figure 20.14 Power (dominance), sentiment (valence) and agency (arousal) for characters in the movie The Dark Knight computed from embeddings trained on the NRC VAD Lexicon. acters in The Dark Night as learned through the regres-<sub>Note</sub> <sub>the</sub> <sub>protagonist</sub> <sub>(Batman)</sub> <sub>and</sub> <sub>the</sub> <sub>antagonist</sub> <sub>(the</sub> <sub>Joker)</sub> <sub>have</sub> <sub>high</sub> <sub>power</sub> <sub>and</sub> <sub>agency</sub> sion model with ELMo embeddings. Scores generally<sub>scores</sub> <sub>but</sub> <sub>differ</sub> <sub>in</sub> <sub>sentiment,</sub> <sub>while</sub> <sub>the</sub> <sub>love</sub> <sub>interest</sub> <sub>Rachel</sub> <sub>has</sub> <sub>low</sub> <sub>power</sub> <sub>and</sub> <sub>agency</sub> <sub>but</sub> high sentiment.

## ment have result20.10 Connotation Frames

The lexicons we’ve described so far define a word as a point in affective space. A connotation frame, by contrast, is a lexicon that incorporates a richer kind of gramtrain ELMo and BERT portray them as powerful. <sub>matical</sub> <sub>structure,</sub> <sub>by</sub> <sub>combining</sub> <sub>affective</sub> <sub>lexicons</sub> <sub>with</sub> <sub>the</sub> <sub>frame</sub> <sub>semantic</sub> <sub>lexicons</sub> Thus, in a corpus where traditional power roles <sup>score</sup> <sup>fo</sup>of Chapter 10. The basic insight of connotation frame lexicons is that a predicate have been inverted, the embeddings extracted <sup>by</sup> <sup>capt</sup>like a verb expresses connotations about the verb’s arguments (Rashkin et al. 2016, Rashkin et al. 2017).

Consider sentences like:

(20.15) Country A violated the sovereignty of Country B

(20.16) the teenager ... survived the Boston Marathon bombing”

dings fo<sub>By</sub> <sub>using</sub> <sub>the</sub> <sub>verb violate in</sub> <sub>(20.15),</sub> <sub>the</sub> <sub>author</sub> <sub>is</sub> <sub>expressing</sub> <sub>their</sub> <sub>sympathies</sub> <sub>with</sub> FigurCountry B, portraying Country B as a victim, and expressing antagonism toward the agent Country A. By contrast, in using the verb survive, the author of (20.16) is expressing that the bombing is a negative experience, and the subject of the sentence, the teenager, is a sympathetic character. These aspects of connotation are inherent in the meaning of the verbs violate and survive, as shown in Fig. 20.15.

![Figure 20.15](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/e7f111f3d1c7ce6767e2c5dfa84fbcf9e102121a4bee1f2bd95528a65520dfc6.jpg)  
Figure 20.15 Connotation frames for survive and violate. (a) For survive, the writer and reader have positive sentiment toward Role1, the subject, and negative sentiment toward Role2, the direct object. (b) For violate, the writer and reader have positive sentiment instead toward Role2, the direct object.

The connotation frame lexicons of Rashkin et al. (2016) and Rashkin et al. (2017) also express other connotative aspects of the predicate toward each argument, including the effect (something bad happened to x) value: (x is valuable), and mental state: (x is distressed by the event). Connotation frames can also mark the power differential between the arguments (using the verb implore means that the theme argument has greater power than the agent), and the agency of each argument (waited is low agency). Fig. 20.16 shows a visualization from Sap et al. (2017).

![Figure 20.16](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/0ba95ff7aab3bc2fc5146e89d54592395cdf9a7cd7d8772f714723ef167206f6.jpg)  
Figure 20.16 The connotation frames of Sap et al. (2017), showing that the verb implore Figure 2: The formal notation of the connotationimplies the agent has lower power than the theme (in contrast, say, with a verb like demanded), frames of power and agency. The first exampleand showing the low level of agency of the subject of waited. Figure from Sap et al. (2017).

<sub>Figure 3: Samp</sub>Connotation frames can be built by hand (Sap et al., 2017), or they can be learned <sub>with high annot</sub>by supervised learning (Rashkin et al., 2016), for example using hand-labeled trainof verb frequening data to supervise classifiers for each of the individual relations, e.g., whether <sub>over the theme. The second example shows the</sub> frequent), colorS(writer  Role1) is + or -, and then improving accuracy via global constraints across all relations.

## 20.11 Summary

- Many kinds of affective states can be distinguished, including emotions, moods, attitudes (which include sentiment), interpersonal stance, and personality.

- Emotion can be represented by fixed atomic units often called basic emotions, or as points in space defined by dimensions like valence and arousal.

- Words have connotational aspects related to these affective states, and this connotational aspect of word meaning can be represented in lexicons.

- Affective lexicons can be built by hand, using crowd sourcing to label the affective content of each word.

- Lexicons can be built with semi-supervised, bootstrapping from seed words using similarity metrics like embedding cosine.

- Lexicons can be learned in a fully supervised manner, when a convenient training signal can be found in the world, such as ratings assigned by users on a review site.

- Words can be assigned weights in a lexicon by using various functions of word counts in training texts, and ratio metrics like log odds ratio informative Dirichlet prior.

- Personality is often represented as a point in 5-dimensional space.

- Affect can be detected, just like sentiment, by using standard supervised text classification techniques, using all the words or bigrams in a text as features. Additional features can be drawn from counts of words in lexicons.

- Lexicons can also be used to detect affect in a rule-based classifier by picking the simple majority sentiment based on counts of words in each lexicon.

- Connotation frames express richer relations of affective meaning that a predicate encodes about its arguments.

## Bibliographical and Historical Notes

The idea of formally representing the subjective meaning of words began with Osgood et al. (1957), the same pioneering study that first proposed the vector space model of meaning described in Chapter 6. Osgood et al. (1957) had participants rate words on various scales, and ran factor analysis on the ratings. The most significant factor they uncovered was the evaluative dimension, which distinguished between pairs like good/bad, valuable/worthless, pleasant/unpleasant. This work influenced the development of early dictionaries of sentiment and affective meaning in the field of content analysis (Stone et al., 1966).

Wiebe (1994) began an influential line of work on detecting subjectivity in text, beginning with the task of identifying subjective sentences and the subjective characters who are described in the text as holding private states, beliefs or attitudes. Learned sentiment lexicons such as the polarity lexicons of Hatzivassiloglou and McKeown (1997) were shown to be a useful feature in subjectivity detection (Hatzivassiloglou and Wiebe 2000, Wiebe 2000).

The term sentiment seems to have been introduced in 2001 by Das and Chen (2001), to describe the task of measuring market sentiment by looking at the words in stock trading message boards. In the same paper Das and Chen (2001) also proposed the use of a sentiment lexicon. The list of words in the lexicon was created by hand, but each word was assigned weights according to how much it discriminated a particular class (say buy versus sell) by maximizing across-class variation and minimizing within-class variation. The term sentiment, and the use of lexicons, caught on quite quickly (e.g., inter alia, Turney 2002). Pang et al. (2002) first showed the power of using all the words without a sentiment lexicon; see also Wang and Manning (2012).

Most of the semi-supervised methods we describe for extending sentiment dictionaries drew on the early idea that synonyms and antonyms tend to co-occur in the same sentence (Miller and Charles 1991, Justeson and Katz 1991, Riloff and Shepherd 1997). Other semi-supervised methods for learning cues to affective meaning rely on information extraction techniques, like the AutoSlog pattern extractors (Riloff and Wiebe, 2003). Graph based algorithms for sentiment were first suggested by Hatzivassiloglou and McKeown (1997), and graph propagation became a standard method (Zhu and Ghahramani 2002, Zhu et al. 2003, Zhou et al. 2004, Velikovich et al. 2010). Crowdsourcing can also be used to improve precision by filtering the result of semi-supervised lexicon learning (Riloff and Shepherd 1997, Fast et al. 2016).

Much recent work focuses on ways to learn embeddings that directly encode sentiment or other properties, such as the DENSIFIER algorithm of Rothe et al. (2016) that learns to transform the embedding space to focus on sentiment (or other) information.


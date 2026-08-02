---
title: "Chapter 4 \u2014 Naive Bayes and Sentiment Classification"
book: "Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models"
book_slug: speech-language-processing
course: natural-language-processing
chapter_number: 4
citekey: jurafsky2026slp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf"
source_transcript: "transcripts/mineru/speech-language-processing/reading.md"
source_line_start: 1853
source_line_end: 2409
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 3
source_empty_image_alt: 3
non_semantic_image_alt: 0
caption_derived_image_alt: 3
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

# Chapter 4 — Naive Bayes and Sentiment Classification

> [[../README|本书目录]] · [[03-chapter-3-n-gram-language-models|上一章]] · [[05-chapter-5-logistic-regression|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models（jurafsky2026slp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/speech-language-processing/reading.md)，源行 1853–2409。
> - 本章保留 3 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Naive Bayes and Sentiment Classification

Classification lies at the heart of both human and machine intelligence. Deciding what letter, word, or image has been presented to our senses, recognizing faces or voices, sorting mail, assigning grades to homeworks; these are all examples of assigning a category to an input. The potential challenges of this task are highlighted by the fabulist Jorge Luis Borges (1964), who imagined classifying animals into:

(a) those that belong to the Emperor, (b) embalmed ones, (c) those that are trained, (d) suckling pigs, (e) mermaids, (f) fabulous ones, (g) stray dogs, (h) those that are included in this classification, (i) those that tremble as if they were mad, (j) innumerable ones, (k) those drawn with a very fine camel’s hair brush, (l) others, (m) those that have just broken a flower vase, (n) those that resemble flies from a distance.

Many language processing tasks involve classification, although luckily our classes are much easier to define than those of Borges. In this chapter we introduce the naive Bayes algorithm and apply it to text categorization, the task of assigning a label or category to an entire text or document.

We focus on one common text categorization task, sentiment analysis, the extraction of sentiment, the positive or negative orientation that a writer expresses toward some object. A review of a movie, book, or product on the web expresses the author’s sentiment toward the product, while an editorial or political text expresses sentiment toward a candidate or political action. Extracting consumer or public sentiment is thus relevant for fields from marketing to politics.

The simplest version of sentiment analysis is a binary classification task, and the words of the review provide excellent cues. Consider, for example, the following phrases extracted from positive and negative reviews of movies and restaurants. Words like great, richly, awesome, and pathetic, and awful and ridiculously are very informative cues:

\+ ...zany characters and richly applied satire, and some great plot twists

It was pathetic. The worst part about it was the boxing scenes...

\+ ...awesome caramel sauce and sweet toasty almonds. I love this place!

...awful pizza and ridiculously overpriced...

Spam detection is another important commercial application, the binary classification task of assigning an email to one of the two classes spam or not-spam. Many lexical and other features can be used to perform this classification. For example you might quite reasonably be suspicious of an email containing phrases like “online pharmaceutical” or “WITHOUT ANY COST” or “Dear Winner”.

Another thing we might want to know about a text is the language it’s written in. Texts on social media, for example, can be in any number of languages and we’ll need to apply different processing. The task of language id is thus the first step in most language processing pipelines. Related text classification tasks like authorship attribution— determining a text’s author— are also relevant to the digital humanities, social sciences, and forensic linguistics.

naive Bayes classifier

Finally, one of the oldest tasks in text classification is assigning a library subject category or topic label to a text. Deciding whether a research paper concerns epidemiology or instead, perhaps, embryology, is an important component of information retrieval. Various sets of subject categories exist, such as the MeSH (Medical Subject Headings) thesaurus. In fact, as we will see, subject category classification is the task for which the naive Bayes algorithm was invented in 1961.

Classification is essential for tasks below the level of the document as well. We’ve already seen period disambiguation (deciding if a period is the end of a sentence or part of a word), and word tokenization (deciding if a character should be a word boundary). Even language modeling can be viewed as classification: each word can be thought of as a class, and so predicting the next word is classifying the context-so-far into a class for each next word. A part-of-speech tagger (Chapter 8) classifies each occurrence of a word in a sentence as, e.g., a noun or a verb.

The goal of classification is to take a single observation, extract some useful features, and thereby classify the observation into one of a set of discrete classes. One method for classifying text is to use handwritten rules. There are many areas of language processing where handwritten rule-based classifiers constitute a state-ofthe-art system, or at least part of it.

Rules can be fragile, however, as situations or data change over time, and for some tasks humans aren’t necessarily good at coming up with the rules. Most cases of classification in language processing are instead done via supervised machine learning, and this will be the subject of the remainder of this chapter. In supervised learning, we have a data set of input observations, each associated with some correct output (a ‘supervision signal’). The goal of the algorithm is to learn how to map from a new observation to a correct output.

Formally, the task of supervised classification is to take an input x and a fixed set of output classes $Y = y_{1}, y_{2},..., y_{M}$ and return a predicted class $y \in Y$ . For text classification, we’ll sometimes talk about c (for “class”) instead of y as our output variable, and d (for “document”) instead of x as our input variable. In the supervised situation we have a training set of N documents that have each been hand-labeled with a class: $(d_{1}, c_{1}),....,(d_{N}, c_{N})$ . Our goal is to learn a classifier that is capable of mapping from a new document d to its correct class $c \in C$ . A probabilistic classifier additionally will tell us the probability of the observation being in the class. This full distribution over the classes can be useful information for downstream decisions; avoiding making discrete decisions early on can be useful when combining systems.

Many kinds of machine learning algorithms are used to build classifiers. This chapter introduces naive Bayes; the following one introduces logistic regression. These exemplify two ways of doing classification. Generative classifiers like naive Bayes build a model of how a class could generate some input data. Given an observation, they return the class most likely to have generated the observation. Discriminative classifiers like logistic regression instead learn what features from the input are most useful to discriminate between the different possible classes. While discriminative systems are often more accurate and hence more commonly used, generative classifiers still have a role.

## 4.1 Naive Bayes Classifiers

In this section we introduce the multinomial naive Bayes classifier, so called because it is a Bayesian classifier that makes a simplifying (naive) assumption about

how the features interact.

The intuition of the classifier is shown in Fig. 4.1. We represent a text document as if it were a bag-of-words, that is, an unordered set of words with their position ignored, keeping only their frequency in the document. In the example in the figure, instead of representing the word order in all the phrases like “I love this movie” and “I would recommend $\mathrm{it}^{\dag}$ , we simply note that the word I occurred 5 times in the entire excerpt, the word it 6 times, the words love, recommend, and movie once, and so on.

![Figure 4.1](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/a0aa057c622c20680e093e4912f74faf6b57e61b222109a7084d62dabac461c0.jpg)  
Figure 4.1 Intuition of the multinomial naive Bayes classifier applied to a movie review. The position of the words is ignored (the bag of words assumption) and we make use of the frequency of each word.

Naive Bayes is a probabilistic classifier, meaning that for a document $d,$ out of all classes $c \in C$ the classifier returns the class ˆc which has the maximum posterior probability given the document. In Eq. 4.1 we use the hat notation ˆ to mean “our estimate of the correct class”.

$$
\hat{c} = \underset{c \in C}{\operatorname{argmax}} P(c | d)\tag{4.1}
$$

This idea of Bayesian inference has been known since the work of Bayes (1763), and was first applied to text classification by Mosteller and Wallace (1964). The intuition of Bayesian classification is to use Bayes’ rule to transform Eq. 4.1 into other probabilities that have some useful properties. Bayes’ rule is presented in Eq. 4.2; it gives us a way to break down any conditional probability $P(x | y)$ into three other probabilities:

$$
P(x \mid y) = \frac{P(y \mid x) P(x)}{P(y)}\tag{4.2}
$$

We can then substitute Eq. 4.2 into Eq. 4.1 to get Eq. 4.3:

$$
\hat{c} = \underset{c \in C}{\operatorname{argmax}} P(c | d) = \underset{c \in C}{\operatorname{argmax}} \frac{P(d | c) P(c)}{P(d)}\tag{4.3}
$$

We can conveniently simplify Eq. 4.3 by dropping the denominator $P(d)$ . This is possible because we will be computing $\frac{P(\bar{d} | c) P(\bar{c})}{P(d)}$ for each possible class. But $P(d)$ doesn’t change for each class; we are always asking about the most likely class for the same document d, which must have the same probability $P(d)$ . Thus, we can choose the class that maximizes this simpler formula:

$$
\hat{c} = \underset{c \in C}{\operatorname{argmax}} P(c | d) = \underset{c \in C}{\operatorname{argmax}} P(d | c) P(c)\tag{4.4}
$$

We call Naive Bayes a generative model because we can read $\operatorname{Eq.}$ . 4.4 as stating a kind of implicit assumption about how a document is generated: first a class is sampled from $P(c)$ , and then the words are generated by sampling from $P(d | c)$ . (In fact we could imagine generating artificial documents, or at least their word counts, by following this process). We’ll say more about this intuition of generative models in Chapter 5.

To return to classification: we compute the most probable class ˆc given some document d by choosing the class which has the highest product of two probabilities: the prior probability of the class $P(c)$ and the likelihood of the document $P(d | c)$

$$
\hat{c} = \underset{c \in C}{\operatorname{argmax}} \overbrace{P(d | c)}^{\text{likelihood}} \overbrace{P(c)}^{\text{prior}}\tag{4.5}
$$

Without loss of generalization, we can represent a document d as a set of features $f_{1}, f_{2},..., f_{n}{\mathrm{:}}$

$$
\hat{c} = \underset{c \in C}{\operatorname{argmax}} \overbrace{P(f_{1}, f_{2}, \dots., f_{n} | c)}^{\text{likelihood}} \overbrace{P(c)}^{\text{prior}}\tag{4.6}
$$

Unfortunately, Eq. 4.6 is still too hard to compute directly: without some simplifying assumptions, estimating the probability of every possible combination of features (for example, every possible set of words and positions) would require huge numbers of parameters and impossibly large training sets. Naive Bayes classifiers therefore make two simplifying assumptions.

The first is the bag of words assumption discussed intuitively above: we assume position doesn’t matter, and that the word “love” has the same effect on classification whether it occurs as the 1st, 20th, or last word in the document. Thus we assume that the features $f_{1}, f_{2},..., f_{n}$ only encode word identity and not position.

The second is commonly called the naive Bayes assumption: this is the conditional independence assumption that the probabilities $P(f_{i} | c)$ are independent given the class c and hence can be ‘naively’ multiplied as follows:

$$
P(f_{1}, f_{2}, \dots., f_{n} | c) = P(f_{1} | c) \cdot P(f_{2} | c) \cdot \dots \cdot P(f_{n} | c)\tag{4.7}
$$

The final equation for the class chosen by a naive Bayes classifier is thus:

$$
c_{NB} = \underset{c \in C}{\operatorname{argmax}} P(c) \prod_{f \in F} P(f | c)\tag{4.8}
$$

To apply the naive Bayes classifier to text, we need to consider word positions, by simply walking an index through every word position in the document:

positions  all word positions in test document

$$
c_{NB} = \underset{c \in C}{\operatorname{argmax}} P(c) \prod_{i \in positions} P(w_{i} | c)\tag{4.9}
$$

Naive Bayes calculations, like calculations for language modeling, are done in log space, to avoid underflow and increase speed. Thus Eq. 4.9 is generally instead expressed as

$$
c_{NB} = \underset{c \in C}{\operatorname{argmax}} \log P(c) + \sum_{i \in positions} \log P(w_{i} | c)\tag{4.10}
$$

linear classifiers

By considering features in log space, Eq. 4.10 computes the predicted class as a linear function of input features. Classifiers that use a linear combination of the inputs to make a classification decision —like naive Bayes and also logistic regression— are called linear classifiers.

## 4.2 Training the Naive Bayes Classifier

How can we learn the probabilities $P(c)$ and $P(\b{f}_{i} | \boldsymbol{c}) ?$ Let’s first consider the maximum likelihood estimate. We’ll simply use the frequencies in the data. For the class prior $P(c)$ we ask what percentage of the documents in our training set are in each class c. Let $N_{c}$ be the number of documents in our training data with class c and $N_{doc}$ be the total number of documents. Then:

$$
\hat{P}(c) = \frac{N_{c}}{N_{doc}}\tag{4.11}
$$

To learn the probability $P(f_{i} | c)$ , we’ll assume a feature is just the existence of a word in the document’s bag of words, and so we’ll want $P(w_{i} | c)$ , which we compute as the fraction of times the word $w_{i}$ appears among all words in all documents of topic $c.$ We first concatenate all documents with category c into one big “category $c^{\prime \prime}$ text. Then we use the frequency of $w_{i}$ in this concatenated document to give a maximum likelihood estimate of the probability:

$$
\hat{P}(w_{i} | c) = \frac{\operatorname{count}(w_{i}, c)}{\sum_{w \in V} \operatorname{count}(w, c)}\tag{4.12}
$$

Here the vocabulary V consists of the union of all the word types in all classes, not just the words in one class c.

There is a problem, however, with maximum likelihood training. Imagine we are trying to estimate the likelihood of the word “fantastic” given class positive, but suppose there are no training documents that both contain the word “fantastic” and are classified as positive. Perhaps the word “fantastic” happens to occur (sarcastically?) in the class negative. In such a case the probability for this feature will be zero:

$$
\hat{P} \left(" \text{fantastic}" | \text{positive}\right) = \frac{\operatorname{count} \left(" \text{fantastic}", \text{positive}\right)}{\sum_{w \in V} \operatorname{count}(w, \text{positive})} = 0\tag{4.13}
$$

But since naive Bayes naively multiplies all the feature likelihoods together, zero probabilities in the likelihood term for any class will cause the probability of the class to be zero, no matter the other evidence!

The simplest solution is the add-one (Laplace) smoothing introduced in Chapter 3. While Laplace smoothing is usually replaced by more sophisticated smoothing algorithms in language modeling, it is commonly used in naive Bayes text categorization:

$$
\hat{P}(w_{i} | c) = \frac{\operatorname{count}(w_{i}, c) + 1}{\sum_{w \in V}(\operatorname{count}(w, c) + 1)} = \frac{\operatorname{count}(w_{i}, c) + 1}{(\sum_{w \in V} \operatorname{count}(w, c)) + | V |}\tag{4.14}
$$

Note once again that it is crucial that the vocabulary V consists of the union of all the word types in all classes, not just the words in one class c (try to convince yourself why this must be true; see the exercise at the end of the chapter).

What do we do about words that occur in our test data but are not in our vocabulary at all because they did not occur in any training document in any class? The solution for such unknown words is to ignore them—remove them from the test document and not include any probability for them at all.

Finally, some systems choose to completely ignore another class of words: stop words, very frequent words like the and a. This can be done by sorting the vocabulary by frequency in the training set, and defining the top 10–100 vocabulary entries as stop words, or alternatively by using one of the many predefined stop word list available online. Then every instance of these stop words are simply removed from both training and test documents as if they had never occurred. In most text classification applications, however, using a stop word list doesn’t improve performance, and so it is more common to make use of the entire vocabulary and not use a stop word list.

Fig. 4.2 shows the final algorithm.

```python
function TRAIN NAIVE BAYES(D, C) returns log P(c) and log P(w|c)

for each class c ∈ C    # Calculate P(c) terms
    Ndoc = number of documents in D
    Nc = number of documents from D in class c
    logprior[c] ← log(Nc/Ndoc)
    V ← vocabulary of D
    bigdoc[c] ← append(d) for d ∈ D with class c
    for each word w in V    # Calculate P(w|c) terms
    count(w,c) ← # of occurrences of w in bigdoc[c]
    loglikelihood[w,c] ← log count(w,c) + 1 / ∑w' in V (count(w',c) + 1)
return logprior, loglikelihood, V

function TEST NAIVE BAYES(testdoc, logprior, loglikelihood, C, V) returns best c

for each class c ∈ C
    sum[c] ← logprior[c]
    for each position i in testdoc
    word ← testdoc[i]
    if word ∈ V
    sum[c] ← sum[c] + loglikelihood[word,c]
return argmax_c sum[c]
```

Figure 4.2 The naive Bayes algorithm, using add-1 smoothing. To use add-α smoothing instead, change the +1 to +α for loglikelihood counts in training.

## 4.3 Worked example

Let’s walk through an example of training and testing naive Bayes with add-one smoothing. We’ll use a sentiment analysis domain with the two classes positive (+) and negative (-), and take the following miniature training and test documents simplified from actual movie reviews.

<table><tr><td></td><td>Cat</td><td>Documents</td></tr><tr><td rowspan="5">Training</td><td>-</td><td>just plain boring</td></tr><tr><td>-</td><td>entirely predictable and lacks energy</td></tr><tr><td>-</td><td>no surprises and very few laughs</td></tr><tr><td>+</td><td>very powerful</td></tr><tr><td>+</td><td>the most fun film of the summer</td></tr><tr><td>Test</td><td>?</td><td>predictable with no fun</td></tr></table>

The prior $P(c)$ for the two classes is computed via Eq. 4.11 as $\frac{N_{c}}{N_{doc}}$ :

$$
P(-) = \frac{3}{5} \quad P(+) = \frac{2}{5}
$$

The word with doesn’t occur in the training set, so we drop it completely (as mentioned above, we don’t use unknown word models for naive Bayes). The likelihoods from the training set for the remaining three words “predictable”, “no”, and “fun”, are as follows, from Eq. 4.14 (computing the probabilities for the remainder of the words in the training set is left as an exercise for the reader):

$$
\begin{array}{rl} P \text{(``predictable''| -)} = \frac{1 + 1}{14 + 20} & P \text{(``predictable''| +)} = \frac{0 + 1}{9 + 20} \\ P \text{(``no''| -)} = \frac{1 + 1}{14 + 20} & P \text{(``no''| +)} = \frac{0 + 1}{9 + 20} \\ P \text{(``fun''| -)} = \frac{0 + 1}{14 + 20} & P \text{(``fun''| +)} = \frac{1 + 1}{9 + 20} \end{array}
$$

For the test sentence $S ={}^{66}$ “predictable with no fun”, after removing the word ‘with’, the chosen class, via Eq. 4.9, is therefore computed as follows:

$$
P(-) P(S | -) = \frac{3}{5} \times \frac{2 \times 2 \times 1}{34^{3}} = 6.1 \times 10^{- 5}
$$

$$
P(+) P(S | +) = \frac{2}{5} \times \frac{1 \times 1 \times 2}{29^{3}} = 3.2 \times 10^{- 5}
$$

The model thus predicts the class negative for the test sentence.

## 4.4 Optimizing for Sentiment Analysis

While standard naive Bayes text classification can work well for sentiment analysis, some small changes are generally employed that improve performance.

First, for sentiment classification and a number of other text classification tasks, whether a word occurs or not seems to matter more than its frequency. Thus it often improves performance to clip the word counts in each document at 1 (see the end of the chapter for pointers to these results). This variant is called binary multinomial naive Bayes or binary NB. The variant uses the same Eq. 4.10 except that for each document we remove all duplicate words before concatenating them into the single big document. Fig. 4.3 shows an example in which a set of four documents (shortened and text-normalized for this example) are remapped to binary, with the modified counts shown in the table on the right. The example is worked without add-1 smoothing to make the differences clearer. Note that the results counts need not be 1; the word great has a count of 2 even for Binary NB, because it appears in multiple documents.

<table><tr><td rowspan="2">Four original documents:</td><td rowspan="2"></td><td colspan="2">NB Counts</td><td colspan="2">Binary Counts</td></tr><tr><td>+</td><td>-</td><td>+</td><td>-</td></tr><tr><td rowspan="2">- it was pathetic the worst part was the boxing scenes</td><td>and</td><td>2</td><td>0</td><td>1</td><td>0</td></tr><tr><td>boxing</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><td>- no plot twists or great scenes</td><td>film</td><td>1</td><td>0</td><td>1</td><td>0</td></tr><tr><td>+ and satire and great plot twists</td><td>great</td><td>3</td><td>1</td><td>2</td><td>1</td></tr><tr><td rowspan="2">+ great scenes great film</td><td>it</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><td>no</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><td rowspan="2">After per-document binarization:</td><td>or</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><td>part</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><td rowspan="2">- it was pathetic the worst part boxing scenes</td><td>pathetic</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><td>plot</td><td>1</td><td>1</td><td>1</td><td>1</td></tr><tr><td rowspan="2">- no plot twists or great scenes</td><td>satire</td><td>1</td><td>0</td><td>1</td><td>0</td></tr><tr><td>scenes</td><td>1</td><td>2</td><td>1</td><td>2</td></tr><tr><td>+ and satire great plot twists</td><td>the</td><td>0</td><td>2</td><td>0</td><td>1</td></tr><tr><td rowspan="3">+ great scenes film</td><td>twists</td><td>1</td><td>1</td><td>1</td><td>1</td></tr><tr><td>was</td><td>0</td><td>2</td><td>0</td><td>1</td></tr><tr><td>worst</td><td>0</td><td>1</td><td>0</td><td>1</td></tr></table>

Figure 4.3 An example of binarization for the binary naive Bayes algorithm.

A second important addition commonly made when doing text classification for sentiment is to deal with negation. Consider the difference between I really like this movie (positive) and I didn’t like this movie (negative). The negation expressed by didn’t completely alters the inferences we draw from the predicate like. Similarly, negation can modify a negative word to produce a positive review (don’t dismiss this film, doesn’t let us get bored).

A very simple baseline that is commonly used in sentiment analysis to deal with negation is the following: during text normalization, prepend the prefix NOT to every word after a token of logical negation (n’t, not, no, never) until the next punctuation mark. Thus the phrase

didn’t like this movie , but I

## becomes

didn’t NOT\_like NOT\_this NOT\_movie , but I

Newly formed ‘words’ like NOT like, NOT recommend will thus occur more often in negative document and act as cues for negative sentiment, while words like NOT bored, NOT dismiss will acquire positive associations. We will return in Chapter 16 to the use of parsing to deal more accurately with the scope relationship between these negation words and the predicates they modify, but this simple baseline works quite well in practice.

Finally, in some situations we might have insufficient labeled training data to train accurate naive Bayes classifiers using all words in the training set to estimate positive and negative sentiment. In such cases we can instead derive the positive and negative word features from sentiment lexicons, lists of words that are preannotated with positive or negative sentiment. Four popular lexicons are the General Inquirer (Stone et al., 1966), LIWC (Pennebaker et al., 2007), the opinion lexicon of Hu and Liu (2004a) and the MPQA Subjectivity Lexicon (Wilson et al., 2005).

For example the MPQA subjectivity lexicon has 6885 words, 2718 positive and 4912 negative, each marked for whether it is strongly or weakly biased. Some samples of positive and negative words from the MPQA lexicon include:

\+ : admirable, beautiful, confident, dazzling, ecstatic, favor, glee, great

: awful, bad, bias, catastrophe, cheat, deny, envious, foul, harsh, hate

A common way to use lexicons in a naive Bayes classifier is to add a feature that is counted whenever a word from that lexicon occurs. Thus we might add a feature called ‘this word occurs in the positive lexicon’, and treat all instances of words in the lexicon as counts for that one feature, instead of counting each word separately. Similarly, we might add as a second feature ‘this word occurs in the negative lexicon’ of words in the negative lexicon. If we have lots of training data, and if the test data matches the training data, using just two features won’t work as well as using all the words. But when training data is sparse or not representative of the test set, using dense lexicon features instead of sparse individual-word features may generalize better.

We’ll return to this use of lexicons in Chapter 20, showing how these lexicons can be learned automatically, and how they can be applied to many other tasks beyond sentiment classification.

## 4.5 Naive Bayes for other text classification tasks

In the previous section we pointed out that naive Bayes doesn’t require that our classifier use all the words in the training data as features. In fact features in naive Bayes can express any property of the input text we want.

Consider the task of spam detection, deciding if a particular piece of email is an example of spam (unsolicited bulk email) — and one of the first applications of naive Bayes to text classification (Sahami et al., 1998).

A common solution here, rather than using all the words as individual features, is to predefine likely sets of words or phrases as features, combined with features that are not purely linguistic. For example the open-source SpamAssassin tool<sup>1</sup> predefines features like the phrase “one hundred percent guaranteed”, or the feature mentions millions of dollars, which is a regular expression that matches suspiciously large sums of money. But it also includes features like HTML has a low ratio of text to image area, that aren’t purely linguistic and might require some sophisticated computation, or totally non-linguistic features about, say, the path that the email took to arrive. More sample SpamAssassin features:

- Email subject line is all capital letters

- Contains phrases of urgency like “urgent reply”

- Email subject line contains “online pharmaceutical”

- HTML has unbalanced “head” tags

- Claims you can be removed from the list

For other tasks, like language ID—determining what language a given piece of text is written in—the most effective naive Bayes features are not words at all, but character n-grams, 2-grams (‘zw’) 3-grams (‘nya’, ‘ Vo’), or 4-grams (‘ie z’, ‘thei’), or, even simpler byte n-grams, where instead of using the multibyte Unicode character representations called codepoints, we just pretend everything is a string of raw bytes. Because spaces count as a byte, byte n-grams can model statistics about the beginning or ending of words. A widely used naive Bayes system, langid.py (Lui and Baldwin, 2012) begins with all possible n-grams of lengths 1-4, using feature selection to winnow down to the most informative 7000 final features.

Language ID systems are trained on multilingual text, such as Wikipedia (Wikipedia text in 68 different languages were used in (Lui and Baldwin, 2011)), or newswire. To make sure that this multilingual text correctly reflects different regions, dialects, and socioeconomic classes, systems also add Twitter text in many languages geotagged to many regions (important for getting world English dialects from countries with large Anglophone populations like Nigeria or India), Bible and Quran translations, slang websites like Urban Dictionary, corpora of African American Vernacular English (Blodgett et al., 2016), and so on (Jurgens et al., 2017).

## 4.6 Naive Bayes as a Language Model

As we saw in the previous section, naive Bayes classifiers can use any sort of feature: dictionaries, URLs, email addresses, network features, phrases, and so on. But if, as in the previous section, we use only individual word features, and we use all of the words in the text (not a subset), then naive Bayes has an important similarity to language modeling. Specifically, a naive Bayes model can be viewed as a set of class-specific unigram language models, in which the model for each class instantiates a unigram language model.

Since the likelihood features from the naive Bayes model assign a probability to each word $P(word | c)$ , the model also assigns a probability to each sentence:

$$
P(s | c) = \prod_{i \in positions} P(w_{i} | c)\tag{4.15}
$$

Thus consider a naive Bayes model with the classes positive (+) and negative (-) and the following model parameters:

<table><tr><td>w</td><td>P(w|+)</td><td>P(w|-)</td></tr><tr><td>I</td><td>0.1</td><td>0.2</td></tr><tr><td>love</td><td>0.1</td><td>0.001</td></tr><tr><td>this</td><td>0.01</td><td>0.01</td></tr><tr><td>fun</td><td>0.05</td><td>0.005</td></tr><tr><td>film</td><td>0.1</td><td>0.1</td></tr><tr><td>...</td><td>...</td><td>...</td></tr></table>

Each of the two columns above instantiates a language model that can assign a probability to the sentence “I love this fun film”:

P(“I love this fun film $\mathrm{\bf ~ \ "} | +) ~ = ~ 0.1 \times 0.1 \times 0.01 \times 0.05 \times 0.1 = 0.0000005$

$$
P \left(" I \text{love this fun film}" | -\right) = 0.2 \times 0.001 \times 0.01 \times 0.005 \times 0.1 =.0000000010
$$

As it happens, the positive model assigns a higher probability to the sentence: $P(s | pos) > P(s | neg)$ . Note that this is just the likelihood part of the naive Bayes model; once we multiply in the prior a full naive Bayes model might well make a different classification decision.

## 4.7 Evaluation: Precision, Recall, F-measure

To introduce the methods for evaluating text classification, let’s first consider some simple binary detection tasks. For example, in spam detection, our goal is to label every text as being in the spam category (“positive”) or not in the spam category (“negative”). For each item (email document) we therefore need to know whether our system called it spam or not. We also need to know whether the email is actually spam or not, i.e. the human-defined labels for each document that we are trying to match. We will refer to these human labels as the gold labels.

Or imagine you’re the CEO of the Delicious Pie Company and you need to know what people are saying about your pies on social media, so you build a system that detects tweets concerning Delicious Pie. Here the positive class is tweets about Delicious Pie and the negative class is all other tweets.

In both cases, we need a metric for knowing how well our spam detector (or pie-tweet-detector) is doing. To evaluate any system for detecting things, we start by building a confusion matrix like the one shown in Fig. 4.4. A confusion matrix is a table for visualizing how an algorithm performs with respect to the human gold labels, using two dimensions (system output and gold labels), and each cell labeling a set of possible outcomes. In the spam detection case, for example, true positives are documents that are indeed spam (indicated by human-created gold labels) that our system correctly said were spam. False negatives are documents that are indeed spam but our system incorrectly labeled as non-spam.

To the bottom right of the table is the equation for accuracy, which asks what percentage of all the observations (for the spam or pie examples that means all emails or tweets) our system labeled correctly. Although accuracy might seem a natural metric, we generally don’t use it for text classification tasks. That’s because accuracy doesn’t work well when the classes are unbalanced (as indeed they are with spam, which is a large majority of email, or with tweets, which are mainly not about pie).

<table><tr><td colspan="5">gold standard labels</td></tr><tr><td colspan="2"></td><td>gold positive</td><td>gold negative</td><td></td></tr><tr><td rowspan="3">system output labels</td><td>system positive</td><td>true positive</td><td>false positive</td><td>precision = tp/tp+fp</td></tr><tr><td>system negative</td><td>false negative</td><td>true negative</td><td></td></tr><tr><td></td><td>recall = tp/tp+fn</td><td></td><td>accuracy = tp+tn/tp+fp+tn+fn</td></tr></table>

Figure 4.4 A confusion matrix for visualizing how well a binary classification system performs against gold standard labels.

To make this more explicit, imagine that we looked at a million tweets, and let’s say that only 100 of them are discussing their love (or hatred) for our pie, while the other 999,900 are tweets about something completely unrelated. Imagine a simple classifier that stupidly classified every tweet as “not about pie”. This classifier would have 999,900 true negatives and only 100 false negatives for an accuracy of 999,900/1,000,000 or 99.99%! What an amazing accuracy level! Surely we should be happy with this classifier? But of course this fabulous ‘no pie’ classifier would be completely useless, since it wouldn’t find a single one of the customer comments we are looking for. In other words, accuracy is not a good metric when the goal is to discover something that is rare, or at least not completely balanced in frequency, which is a very common situation in the world.

That’s why instead of accuracy we generally turn to two other metrics shown in Fig. 4.4: precision and recall. Precision measures the percentage of the items that the system detected (i.e., the system labeled as positive) that are in fact positive (i.e., are positive according to the human gold labels). Precision is defined as

$$
\text{Precision} = \frac{\text{true positives}}{\text{true positives} + \text{false positives}}
$$

Recall measures the percentage of items actually present in the input that were correctly identified by the system. Recall is defined as

$$
\text{Recall} = \frac{\text{true positives}}{\text{true positives} + \text{false negatives}}
$$

Precision and recall will help solve the problem with the useless “nothing is $\mathrm{pie}^{\prime \prime}$ classifier. This classifier, despite having a fabulous accuracy of 99.99%, has a terrible recall of 0 (since there are no true positives, and 100 false negatives, the recall is 0/100). You should convince yourself that the precision at finding relevant tweets is equally problematic. Thus precision and recall, unlike accuracy, emphasize true positives: finding the things that we are supposed to be looking for.

There are many ways to define a single metric that incorporates aspects of both precision and recall. The simplest of these combinations is the F-measure (van Rijsbergen, 1975) , defined as:

$$
F_{\beta} = \frac{(\beta^{2} + 1) PR}{\beta^{2} P + R}
$$

The $\beta$ parameter differentially weights the importance of recall and precision, based perhaps on the needs of an application. Values of $\beta > 1$ favor recall, while values of $\beta < 1$ favor precision. When $\beta = 1$ , precision and recall are equally balanced; this is the most frequently used metric, and is called $\mathrm{F}_{\beta = 1}$ or just $\mathrm{F}_{1}$ :

$$
\mathrm{F}_{1} = \frac{2PR}{P + R}\tag{4.16}
$$

F-measure comes from a weighted harmonic mean of precision and recall. The harmonic mean of a set of numbers is the reciprocal of the arithmetic mean of reciprocals:

$$
\text{HarmonicMean} \left(a_{1}, a_{2}, a_{3}, a_{4}, \dots, a_{n}\right) = \frac{n}{\frac{1}{a_{1}} + \frac{1}{a_{2}} + \frac{1}{a_{3}} + \dots + \frac{1}{a_{n}}}\tag{4.17}
$$

and hence F-measure is

$$
F = \frac{1}{\alpha \frac{1}{P} +(1 - \alpha) \frac{1}{R}} \quad \text{or} \left(\text{with} \beta^{2} = \frac{1 - \alpha}{\alpha}\right) \quad F = \frac{(\beta^{2} + 1) PR}{\beta^{2} P + R}\tag{4.18}
$$

Harmonic mean is used because it is a conservative metric; the harmonic mean of two values is closer to the minimum of the two values than the arithmetic mean is. Thus it weighs the lower of the two numbers more heavily.

## 4.7.1 Evaluating with more than two classes

Up to now we have been describing text classification tasks with only two classes. But lots of classification tasks in language processing have more than two classes. For sentiment analysis we generally have 3 classes (positive, negative, neutral) and even more classes are common for tasks like part-of-speech tagging, word sense disambiguation, semantic role labeling, emotion detection, and so on. Luckily the naive Bayes algorithm is already a multi-class classification algorithm.

<table><tr><td rowspan="6">system output</td><td colspan="4">gold labels</td></tr><tr><td>urgent</td><td>normal</td><td>spam</td><td></td></tr><tr><td>urgent</td><td>8</td><td>10</td><td>1</td></tr><tr><td>normal</td><td>5</td><td>60</td><td>50</td></tr><tr><td>spam</td><td>3</td><td>30</td><td>200</td></tr><tr><td></td><td>recallu=8/8+5+3</td><td>recalln=60/10+60+30</td><td>recalls=200/1+50+200</td></tr></table>

Figure 4.5 Confusion matrix for a three-class categorization task, showing for each pair of classes $\left(c_{1}, c_{2} \right)$ , how many documents from $c_{1}$ were (in)correctly assigned to $c_{2}$

But we’ll need to slightly modify our definitions of precision and recall. Consider the sample confusion matrix for a hypothetical 3-way one-of email categorization decision (urgent, normal, spam) shown in Fig. 4.5. The matrix shows, for example, that the system mistakenly labeled one spam document as urgent, and we have shown how to compute a distinct precision and recall value for each class. In order to derive a single metric that tells us how well the system is doing, we can combine these values in two ways. In macroaveraging, we compute the performance for each class, and then average over classes. In microaveraging, we collect the decisions for all classes into a single confusion matrix, and then compute precision and recall from that table. Fig. 4.6 shows the confusion matrix for each class separately, and shows the computation of microaveraged and macroaveraged precision.

As the figure shows, a microaverage is dominated by the more frequent class (in this case spam), since the counts are pooled. The macroaverage better reflects the statistics of the smaller classes, and so is more appropriate when performance on all the classes is equally important.

## 4.8 Test sets and Cross-validation

The training and testing procedure for text classification follows what we saw with language modeling (Section 3.2): we use the training set to train the model, then use the development test set (also called a devset) to perhaps tune some parameters, and in general decide what the best model is. Once we come up with what we think is the best model, we run it on the (hitherto unseen) test set to report its performance.

![Figure 4.6](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/d1f0476ac4650a17b3d482e64e8fa55f0de97355ade25fc310f09c7c4f169858.jpg)  
Figure 4.6 Separate confusion matrices for the 3 classes from the previous figure, showing the pooled confusion matrix and the microaveraged and macroaveraged precision.

While the use of a devset avoids overfitting the test set, having a fixed training set, devset, and test set creates another problem: in order to save lots of data for training, the test set (or devset) might not be large enough to be representative. Wouldn’t it be better if we could somehow use all our data for training and still use all our data for test? We can do this by cross-validation: we randomly choose a training and test set division of our data, train our classifier, and then compute the error rate on the test set. Then we repeat with a different randomly selected training set and test set. We do this sampling process 10 times and average these 10 runs to get an average error rate. This is called 10-fold cross-validation.

The only problem with cross-validation is that because all the data is used for testing, we need the whole corpus to be blind; we can’t examine any of the data to suggest possible features and in general see what’s going on, because we’d be peeking at the test set, and such cheating would cause us to overestimate the performance of our system. However, looking at the corpus to understand what’s going on is important in designing NLP systems! What to do? For this reason, it is common to create a fixed training set and test set, then do 10-fold cross-validation inside the training set, but compute error rate the normal way in the test set, as shown in Fig. 4.7.

![Figure 4.7](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/69596a4227853a0d87be11be81f305e9b6f526db59df248a9ae71a230ee1da4b.jpg)  
Figure 4.7 10-fold cross-validation

## 4.9 Statistical Significance Testing

In building systems we often need to compare the performance of two systems. How can we know if the new system we just built is better than our old one? Or better than the some other system described in the literature? This is the domain of statistical hypothesis testing, and in this section we introduce tests for statistical significance for NLP classifiers, drawing especially on the work of Dror et al. (2020) and Berg-Kirkpatrick et al. (2012).

Suppose we’re comparing the performance of classifiers A and B on a metric M such as $\mathrm{F}_{1}$ , or accuracy. Perhaps we want to know if our logistic regression sentiment classifier A (Chapter 5) gets a higher $\mathrm{F}_{1}$ score than our naive Bayes sentiment classifier B on a particular test set x. Let’s call $M(A, x)$ the score that system A gets on test set x, and $\delta(x)$ the performance difference between A and B on x:

$$
\delta(x) = M(A, x) - M(B, x)\tag{4.19}
$$

We would like to know if $\delta(x) > 0$ , meaning that our logistic regression classifier has a higher $\mathrm{F}_{1}$ than our naive Bayes classifier on X. $\delta(x)$ is called the effect size; a bigger δ means that A seems to be way better than $B;$ a small δ means A seems to be only a little better.

Why don’t we just check if $\delta(x)$ is positive? Suppose we do, and we find that the $\mathrm{F}_{1}$ score of A is higher than Bs by .04. Can we be certain that A is better? We cannot! That’s because A might just be accidentally better than B on this particular x. We need something more: we want to know if $A \ ' s$ superiority over B is likely to hold again if we checked another test set $x^{\prime}.$ , or under some other set of circumstances.

In the paradigm of statistical hypothesis testing, we test this by formalizing two hypotheses.

$$
\begin{array}{l} H_{0}: \delta(x) \leq 0 \\ H_{1}: \delta(x) > 0 \end{array}\tag{4.20}
$$

The hypothesis $H_{0}$ , called the null hypothesis, supposes that $\delta(x)$ is actually negative or zero, meaning that A is not better than B. We would like to know if we can confidently rule out this hypothesis, and instead support $H_{1}$ , that A is better.

We do this by creating a random variable X ranging over all test sets. Now we ask how likely is it, if the null hypothesis $H_{0}$ was correct, that among these test sets we would encounter the value of $\delta(x)$ that we found. We formalize this likelihood as the p-value: the probability, assuming the null hypothesis $H_{0}$ is true, of seeing the $\delta(x)$ that we saw or one even greater

$$
P(\delta(X) \geq \delta(x) | H_{0} \text{is true})\tag{4.21}
$$

So in our example, this p-value is the probability that we would see $\delta(x)$ assuming A is not better than B. If $\delta(x)$ is huge (let’s say A has a very respectable $\mathrm{F}_{1}$ of .9 and B has a terrible $\mathrm{F}_{1}$ of only .2 on x), we might be surprised, since that would be extremely unlikely to occur if $H_{0}$ were in fact true, and so the p-value would be low (unlikely to have such a large δ if A is in fact not better than B). But if $\delta(x)$ is very small, it might be less surprising to us even if $H_{0}$ were true and A is not really better than B, and so the p-value would be higher.

A very small p-value means that the difference we observed is very unlikely under the null hypothesis, and we can reject the null hypothesis. What counts as very small? It is common to use values like .05 or .01 as the thresholds. A value of .01 means that if the p-value (the probability of observing the $\delta$ we saw assuming $H_{0}$ is true) is less than .01, we reject the null hypothesis and assume that A is indeed better than B. We say that a result (e.g., “A is better than $B^{\prime \prime})$ is statistically significant if the $\delta$ we saw has a probability that is below the threshold and we therefore reject this null hypothesis.

How do we compute this probability we need for the p-value? In NLP we generally don’t use simple parametric tests like t-tests or ANOVAs that you might be familiar with. Parametric tests make assumptions about the distributions of the test statistic (such as normality) that don’t generally hold in our cases. So in NLP we usually use non-parametric tests based on sampling: we artificially create many versions of the experimental setup. For example, if we had lots of different test sets $x^{\prime}$ we could just measure all the $\delta(x^{\prime})$ for all the $x^{\prime}.$ That gives us a distribution. Now we set a threshold (like .01) and if we see in this distribution that 99% or more of those deltas are smaller than the delta we observed, i.e. that p-value(x)—the probability of seeing a $\delta(x)$ as big as the one we saw, is less than .01, then we can reject the null hypothesis and agree that $\delta(x)$ was a sufficiently surprising difference and A is really a better algorithm than B.

There are two common non-parametric tests used in NLP: approximate randomization (Noreen, 1989). and the bootstrap test. We will describe bootstrap below, showing the paired version of the test, which again is most common in NLP. Paired tests are those in which we compare two sets of observations that are aligned: each observation in one set can be paired with an observation in another. This happens naturally when we are comparing the performance of two systems on the same test set; we can pair the performance of system A on an individual observation $x_{i}$ with the performance of system B on the same $x_{i}$

## 4.9.1 The Paired Bootstrap Test

The bootstrap test (Efron and Tibshirani, 1993) can apply to any metric; from precision, recall, or F1 to the BLEU metric used in machine translation. The word bootstrapping refers to repeatedly drawing large numbers of smaller samples with replacement (called bootstrap samples) from an original larger sample. The intuition of the bootstrap test is that we can create many virtual test sets from an observed test set by repeatedly sampling from it. The method only makes the assumption that the sample is representative of the population.

Consider a tiny text classification example with a test set x of 10 documents. The first row of Fig. 4.8 shows the results of two classifiers (A and B) on this test set, with each document labeled by one of the four possibilities: (A and B both right, both wrong, A right and B wrong, A wrong and B right); a slash through a letter $\textcircled{B}$ means that that classifier got the answer wrong. On the first document both A and B get the correct class (AB), while on the second document A got it right but B got it wrong (A✓B). If we assume for simplicity that our metric is accuracy, A has an accuracy of .70 and B of .50, so $\delta(x)$ is .20.

Now we create a large number b (perhaps $10^{5})$ of virtual test sets $x^{(i)}$ , each of size $n = 10$ . Fig. 4.8 shows a couple examples. To create each virtual test set $x^{(i)}$ , we repeatedly (n = 10 times) select a cell from row x with replacement. For example, to create the first cell of the first virtual test set $x^{(1)}$ , if we happened to randomly select the second cell of the x row; we would copy the value $A \mathbb{B}$ into our new cell, and move on to create the second cell of $x^{(1)}$ , each time sampling (randomly choosing) from the original x with replacement.

<table><tr><td></td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td>A%</td><td>B%</td><td> $\delta()$ </td></tr><tr><td>x</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>.70</td><td>.50</td><td>.20</td></tr><tr><td> $x^{(1)}$ </td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>.60</td><td>.60</td><td>.00</td></tr><tr><td> $x^{(2)}$ </td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>AB</td><td>.60</td><td>.70</td><td>-.10</td></tr><tr><td>...</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td> $x^{(b)}$ </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></table>

Figure 4.8 The paired bootstrap test: Examples of b pseudo test sets $\overline{{x^{(i)}}}$ being created from an initial true test set x. Each pseudo test set is created by sampling $n = 10$ times with replacement; thus an individual sample is a single cell, a document with its gold label and the correct or incorrect performance of classifiers A and B. Of course real test sets don’t have only 10 examples, and b needs to be large as well.

Now that we have the b test sets, providing a sampling distribution, we can do statistics on how often A has an accidental advantage. There are various ways to compute this advantage; here we follow the version laid out in Berg-Kirkpatrick et al. (2012). Assuming $H_{0} \left(A \right.$ isn’t better than $B),$ we would expect that $\delta(X)$ , estimated over many test sets, would be zero; a much higher value would be surprising, since $H_{0}$ specifically assumes A isn’t better than B. To measure exactly how surprising is our observed $\delta(x)$ we would in other circumstances compute the p-value by counting over many test sets how often $\delta(x^{(i)})$ exceeds the expected zero value by $\delta(x)$ or more:

$$
\mathrm{p-value}(x) = \sum_{i = 1}^{b} \mathbb{1} \left(\delta \left(x^{(i)}\right) - \delta(x) \geq 0\right)
$$

However, although it’s generally true that the expected value of $\delta(X)$ over many test sets, (again assuming A isn’t better than $B)$ is 0, this isn’t true for the bootstrapped test sets we created. That’s because we didn’t draw these samples from a distribution with 0 mean; we happened to create them from the original test set x, which happens to be biased (by .20) in favor of A. So to measure how surprising is our observed $\delta(x)$ , we actually compute the p-value by counting over many test sets how often $\delta(x^{(i)})$ exceeds the expected value of $\delta(x)$ by $\delta(x)$ or more:

$$
\begin{array}{rl} \text{p - value}(x) & = \sum_{i = 1}^{b} \mathbb{1} \left(\delta(x^{(i)}) - \delta(x) \geq \delta(x)\right) \\ & = \sum_{i = 1}^{b} \mathbb{1} \left(\delta(x^{(i)}) \geq 2 \delta(x)\right) \end{array}\tag{4.22}
$$

So if for example we have 10,000 test sets $x^{(i)}$ and a threshold of .01, and in only 47 of the test sets do we find that $\delta(x^{(i)}) \geq 2 \delta(x)$ , the resulting p-value of .0047 is smaller than .01, indicating $\delta(x)$ is indeed sufficiently surprising, and we can reject the null hypothesis and conclude A is better than B.

The full algorithm for the bootstrap is shown in Fig. 4.9. It is given a test set x, a number of samples $^{b,}$ and counts the percentage of the b bootstrap test sets in which $\delta(x^{*(i)}) > 2 \delta(x)$ . This percentage then acts as a one-sided empirical p-value

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
function BOOTSTRAP(test set x, num of samples b) returns p-value(x)

Calculate  $\delta(x)$  # how much better does algorithm A do than B on x
s = 0

for i = 1 to b do
    for j = 1 to n do    # Draw a bootstrap sample  $x^{(i)}$  of size n
    Select a member of x at random and add it to  $x^{(i)}$ 
    Calculate  $\delta(x^{(i)})$  # how much better does algorithm A do than B on  $x^{(i)}$ $s \leftarrow s + 1$  if  $\delta(x^{(i)}) &gt; 2\delta(x)$ 

p-value(x)  $\approx \frac{s}{b}$  # on what % of the b samples did algorithm A beat expectations?
return p-value(x)    # if very few did, our observed  $\delta$  is probably not accidental
</div>

Figure 4.9 A version of the paired bootstrap algorithm after Berg-Kirkpatrick et al. (2012).

## 4.10 Avoiding Harms in Classification

It is important to avoid harms that may result from classifiers, harms that exist both for naive Bayes classifiers and for the other classification algorithms we introduce in later chapters.

One class of harms is representational harms (Crawford 2017, Blodgett et al. 2020 harms caused by a system that demeans a social group, for example by perpetuating negative stereotypes about them. For example Kiritchenko and Mohammad (2018) examined the performance of 200 sentiment analysis systems on pairs of sentences that were identical except for containing either a common African American first name (like Shaniqua) or a common European American first name (like Stephanie), chosen from the Caliskan et al. (2017) study discussed in Chapter 6. They found that most systems assigned lower sentiment and more negative emotion to sentences with African American names, reflecting and perpetuating stereotypes that associate African Americans with negative emotions (Popp et al., 2003).

In other tasks classifiers may lead to both representational harms and other harms, such as censorship. For example the important text classification task of toxicity detection is the task of detecting hate speech, abuse, harassment, or other kinds of toxic language. While the goal of such classifiers is to help reduce societal harm, toxicity classifiers can themselves cause harms. For example, researchers have shown that some widely used toxicity classifiers incorrectly flag as being toxic sentences that are non-toxic but simply mention minority identities like women (Park et al., 2018), blind people (Hutchinson et al., 2020) or gay people (Dixon et al., 2018), or simply use linguistic features characteristic of varieties like African-American Vernacular English (Sap et al. 2019, Davidson et al. 2019). Such false positive errors, if employed by toxicity detection systems without human oversight, could lead to the censoring of discourse by or about these groups.

These model problems can be caused by biases or other problems in the training data; in general, machine learning systems replicate and even amplify the biases in their training data. But these problems can also be caused by the labels (for example caused by biases in the human labelers) by the resources used (like lexicons, or model components like pretrained embeddings), or even by model architecture (like what the model is trained to optimized). While the mitigation of these biases (for example by carefully considering the training data sources) is an important area of research, we currently don’t have general solutions. For this reason it’s important, when introducing any NLP model, to study these these kinds of factors and make them clear. One way to do this is by releasing a model card (Mitchell et al., 2019) for each version of a model, that documents a machine learning model with information like:

- training algorithms and parameters

- training data sources, motivation, and preprocessing

- evaluation data sources, motivation, and preprocessing

- intended use and users

- model performance across different demographic or other groups and environmental situations

## 4.11 Summary

This chapter introduced the naive Bayes model for classification and applied it to the text categorization task of sentiment analysis.

- Many language processing tasks can be viewed as tasks of classification.

- Text categorization, in which an entire text is assigned a class from a finite set, includes such tasks as sentiment analysis, spam detection, language identification, and authorship attribution.

- Sentiment analysis classifies a text as reflecting the positive or negative orientation (sentiment) that a writer expresses toward some object.

- Naive Bayes is a generative model that makes the bag of words assumption (position doesn’t matter) and the conditional independence assumption (words are conditionally independent of each other given the class)

- Naive Bayes with binarized features seems to work better for many text classification tasks.

- Classifiers are evaluated based on precision and recall.

- Classifiers are trained using distinct training, dev, and test sets, including the use of cross-validation in the training set.

- Statistical significance tests should be used to determine whether we can be confident that one version of a classifier is better than another.

- Designers of classifiers should carefully consider harms that may be caused by the model, including its training data and other components, and report model characteristics in a model card.

## Bibliographical and Historical Notes

Multinomial naive Bayes text classification was proposed by Maron (1961) at the RAND Corporation for the task of assigning subject categories to journal abstracts. His model introduced most of the features of the modern form presented here, approximating the classification task with one-of categorization, and implementing add-δ smoothing and information-based feature selection.

The conditional independence assumptions of naive Bayes and the idea of Bayesian analysis of text seems to have arisen multiple times. The same year as Maron’s paper, Minsky (1961) proposed a naive Bayes classifier for vision and other artificial intelligence problems, and Bayesian techniques were also applied to the text classification task of authorship attribution by Mosteller and Wallace (1963). It had long been known that Alexander Hamilton, John Jay, and James Madison wrote the anonymously-published Federalist papers in 1787–1788 to persuade New York to ratify the United States Constitution. Yet although some of the 85 essays were clearly attributable to one author or another, the authorship of 12 were in dispute between Hamilton and Madison. Mosteller and Wallace (1963) trained a Bayesian probabilistic model of the writing of Hamilton and another model on the writings of Madison, then computed the maximum-likelihood author for each of the disputed essays. Naive Bayes was first applied to spam detection in Heckerman et al. (1998).

Metsis et al. (2006), Pang et al. (2002), and Wang and Manning (2012) show that using boolean attributes with multinomial naive Bayes works better than full counts. Binary multinomial naive Bayes is sometimes confused with another variant of naive Bayes that also use a binary representation of whether a term occurs in a document: Multivariate Bernoulli naive Bayes. The Bernoulli variant instead estimates $P(w | c)$ as the fraction of documents that contain a term, and includes a probability for whether a term is not in a document. McCallum and Nigam (1998) and Wang and Manning (2012) show that the multivariate Bernoulli variant of naive Bayes doesn’t work as well as the multinomial algorithm for sentiment or other text tasks.

There are a variety of sources covering the many kinds of text classification tasks. For sentiment analysis see Pang and Lee (2008), and Liu and Zhang (2012). Stamatatos (2009) surveys authorship attribute algorithms. On language identification see Jauhiainen et al. (2018); Jaech et al. (2016) is an important early neural system. The task of newswire indexing was often used as a test case for text classification algorithms, based on the Reuters-21578 collection of newswire articles.

See Manning et al. (2008) and Aggarwal and Zhai (2012) on text classification; classification in general is covered in machine learning textbooks (Hastie et al. 2001, Witten and Frank 2005, Bishop 2006, Murphy 2012).

Non-parametric methods for computing statistical significance were used first in NLP in the MUC competition (Chinchor et al., 1993), and even earlier in speech recognition (Gillick and Cox 1989, Bisani and Ney 2004). Our description of the bootstrap draws on the description in Berg-Kirkpatrick et al. (2012). Recent work has focused on issues including multiple test sets and multiple metrics (Søgaard et al. 2014, Dror et al. 2017).

Feature selection is a method of removing features that are unlikely to generalize well. Features are generally ranked by how informative they are about the classification decision. A very common metric, information gain, tells us how many bits of information the presence of the word gives us for guessing the class. Other feature selection metrics include $\chi^{2}$ , pointwise mutual information, and GINI index; see Yang and Pedersen (1997) for a comparison and Guyon and Elisseeff (2003) for an introduction to feature selection.

## Exercises

4.1 Assume the following likelihoods for each word being part of a positive or negative movie review, and equal prior probabilities for each class.

<table><tr><td></td><td>pos</td><td>neg</td></tr><tr><td>I</td><td>0.09</td><td>0.16</td></tr><tr><td>always</td><td>0.07</td><td>0.06</td></tr><tr><td>like</td><td>0.29</td><td>0.06</td></tr><tr><td>foreign</td><td>0.04</td><td>0.15</td></tr><tr><td>films</td><td>0.08</td><td>0.11</td></tr></table>

What class will Naive bayes assign to the sentence “I always like foreign films.”?

4.2 Given the following short movie reviews, each labeled with a genre, either comedy or action:

1. fun, couple, love, love comedy

2. fast, furious, shoot action

3. couple, fly, fast, fun, fun comedy

4. furious, shoot, shoot, fun action

5. fly, fast, shoot, love action

and a new document D:

fast, couple, shoot, fly

compute the most likely class for D. Assume a naive Bayes classifier and use add-1 smoothing for the likelihoods.

4.3 Train two models, multinomial naive Bayes and binarized naive Bayes, both with add-1 smoothing, on the following document counts for key sentiment words, with positive or negative class assigned as noted.

<table><tr><td>doc</td><td>“good”</td><td>“poor”</td><td>“great”</td><td>(class)</td></tr><tr><td>d1.</td><td>3</td><td>0</td><td>3</td><td>pos</td></tr><tr><td>d2.</td><td>0</td><td>1</td><td>2</td><td>pos</td></tr><tr><td>d3.</td><td>1</td><td>3</td><td>0</td><td>neg</td></tr><tr><td>d4.</td><td>1</td><td>5</td><td>2</td><td>neg</td></tr><tr><td>d5.</td><td>0</td><td>2</td><td>0</td><td>neg</td></tr></table>

Use both naive Bayes models to assign a class (pos or neg) to this sentence:

A good, good plot and great characters, but poor acting.

Recall from page 60 that with naive Bayes text classification, we simply ignore (throw out) any word that never occurred in the training document. (We don’t throw out words that appear in some classes but not others; that’s what add-one smoothing is for.) Do the two models agree or disagree?

CHAPTER

5


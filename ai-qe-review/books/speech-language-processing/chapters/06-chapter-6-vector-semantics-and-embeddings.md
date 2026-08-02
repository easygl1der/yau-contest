---
title: "Chapter 6 \u2014 Vector Semantics and Embeddings"
book: "Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models"
book_slug: speech-language-processing
course: natural-language-processing
chapter_number: 6
citekey: jurafsky2026slp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf"
source_transcript: "transcripts/mineru/speech-language-processing/reading.md"
source_line_start: 3010
source_line_end: 3716
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 13
source_empty_image_alt: 13
non_semantic_image_alt: 4
caption_derived_image_alt: 9
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

# Chapter 6 — Vector Semantics and Embeddings

> [[../README|本书目录]] · [[05-chapter-5-logistic-regression|上一章]] · [[07-chapter-7-neural-networks-and-neural-language-models|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models（jurafsky2026slp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/speech-language-processing/reading.md)，源行 3010–3716。
> - 本章保留 13 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.126) × 3；PDF-confirmed control-symbol repair (PDF p.129) × 4。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Vector Semantics and Embeddings

<sup>荃</sup>者 以<sup>在</sup>鱼， 鱼而 <sup>荃</sup> Nets are for fish;

Once you get the fish, you can forget the net.

者 以在意， 意而

Words are for meaning;

Once you get the meaning, you can forget the words 庄子(Zhuangzi), Chapter 26

The asphalt that Los Angeles is famous for occurs mainly on its freeways. But in the middle of the city is another patch of asphalt, the La Brea tar pits, and this asphalt preserves millions of fossil bones from the last of the Ice Ages of the Pleistocene Epoch. One of these fossils is the Smilodon, or saber-toothed tiger, instantly recognizable by its long canines. Five million years ago or so, a completely different

sabre-tooth tiger called Thylacosmilus lived in Argentina and other parts of South America. Thylacosmilus was a marsupial whereas Smilodon was a placental mammal, but Thylacosmilus had the same long upper canines and, like Smilodon, had a protective bone flange on the lower jaw. The similarity of these two mammals is one of many examples

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/ab08793a502e5bd560b92c33aac1899c52dcd33e138919c5d625d5ade7740e15.jpg)

of parallel or convergent evolution, in which particular contexts or environments lead to the evolution of very similar structures in different species (Gould, 1980).

The role of context is also important in the similarity of a less biological kind of organism: the word. Words that occur in similar contexts tend to have similar meanings. This link between similarity in how words are distributed and similarity in what they mean is called the distributional hypothesis. The hypothesis was first formulated in the 1950s by linguists like Joos (1950), Harris (1954), and Firth (1957), who noticed that words which are synonyms (like oculist and eye-doctor) tended to occur in the same environment (e.g., near words like eye or examined) with the amount of meaning difference between two words “corresponding roughly to the amount of difference in their environments” (Harris, 1954, 157).

In this chapter we introduce vector semantics, which instantiates this linguistic hypothesis by learning representations of the meaning of words, called embeddings, directly from their distributions in texts. These representations are used in every natural language processing application that makes use of meaning, and the static embeddings we introduce here underlie the more powerful dynamic or contextualized embeddings like BERT that we will see in Chapter 10.

These word representations are also the first example in this book of representation learning, automatically learning useful representations of the input text. Finding such self-supervised ways to learn representations of the input, instead of creating representations by hand via feature engineering, is an important focus of NLP research (Bengio et al., 2013).

## 6.1 Lexical Semantics

Let’s begin by introducing some basic principles of word meaning. How should we represent the meaning of a word? In the n-gram models of Chapter 3, and in classical NLP applications, our only representation of a word is as a string of letters, or an index in a vocabulary list. This representation is not that different from a tradition in philosophy, perhaps you’ve seen it in introductory logic classes, in which the meaning of words is represented by just spelling the word with small capital letters; representing the meaning of “dog” as DOG, and “cat” as CAT.

Representing the meaning of a word by capitalizing it is a pretty unsatisfactory model. You might have seen a joke due originally to semanticist Barbara Partee (Carlson, 1977):

Q: What’s the meaning of life?

A: LIFE’

Surely we can do better than this! After all, we’ll want a model of word meaning to do all sorts of things for us. It should tell us that some words have similar meanings (cat is similar to dog), others are antonyms (cold is the opposite of hot), some have positive connotations (happy) while others have negative connotations (sad). It should represent the fact that the meanings of buy, sell, and pay offer differing perspectives on the same underlying purchasing event (If I buy something from you, you’ve probably sold it to me, and I likely paid you). More generally, a model of word meaning should allow us to draw inferences to address meaning-related tasks like question-answering or dialogue.

In this section we summarize some of these desiderata, drawing on results in the linguistic study of word meaning, which is called lexical semantics; we’ll return to and expand on this list in Chapter 18 and Chapter 10.

Lemmas and Senses Let’s start by looking at how one word (we’ll choose mouse) might be defined in a dictionary (simplified from the online dictionary WordNet):

mouse (N)

1. any of numerous small rodents...

2. a hand-operated device that controls a cursor...

Here the form mouse is the lemma, also called the citation form. The form mouse would also be the lemma for the word mice; dictionaries don’t have separate definitions for inflected forms like mice. Similarly sing is the lemma for sing, sang, sung. In many languages the infinitive form is used as the lemma for the verb, so Spanish dormir “to sleep” is the lemma for duermes “you sleep”. The specific forms sung or carpets or sing or duermes are called wordforms.

As the example above shows, each lemma can have multiple meanings; the lemma mouse can refer to the rodent or the cursor control device. We call each of these aspects of the meaning of mouse a word sense. The fact that lemmas can be polysemous (have multiple senses) can make interpretation difficult (is someone who types “mouse info” into a search engine looking for a pet or a tool?). Chapter 18 will discuss the problem of polysemy, and introduce word sense disambiguation, the task of determining which sense of a word is being used in a particular context.

Synonymy One important component of word meaning is the relationship between word senses. For example when one word has a sense whose meaning is identical to a sense of another word, or nearly identical, we say the two senses of those two words are synonyms. Synonyms include such pairs as

couch/sofa vomit/throw up filbert/hazelnut car/automobile

A more formal definition of synonymy (between words rather than senses) is that two words are synonymous if they are substitutable for one another in any sentence without changing the truth conditions of the sentence, the situations in which the sentence would be true. We often say in this case that the two words have the same propositional meaning.

While substitutions between some pairs of words like car / automobile or water $/ H_{2} O$ are truth preserving, the words are still not identical in meaning. Indeed, probably no two words are absolutely identical in meaning. One of the fundamental tenets of semantics, called the principle of contrast (Girard 1718, Breal 1897´ , Clark 1987), states that a difference in linguistic form is always associated with some difference in meaning. For example, the word $H_{2} O$ is used in scientific contexts and would be inappropriate in a hiking guide—water would be more appropriate— and this genre difference is part of the meaning of the word. In practice, the word synonym is therefore used to describe a relationship of approximate or rough synonymy.

Word Similarity While words don’t have many synonyms, most words do have lots of similar words. Cat is not a synonym of dog, but cats and dogs are certainly similar words. In moving from synonymy to similarity, it will be useful to shift from talking about relations between word senses (like synonymy) to relations between words (like similarity). Dealing with words avoids having to commit to a particular representation of word senses, which will turn out to simplify our task.

The notion of word similarity is very useful in larger semantic tasks. Knowing how similar two words are can help in computing how similar the meaning of two phrases or sentences are, a very important component of natural language understanding tasks like question answering, paraphrasing, and summarization. One way of getting values for word similarity is to ask humans to judge how similar one word is to another. A number of datasets have resulted from such experiments. For example the SimLex-999 dataset (Hill et al., 2015) gives values on a scale from 0 to 10, like the examples below, which range from near-synonyms (vanish, disappear) to pairs that scarcely seem to have anything in common (hole, agreement):

<table><tr><td>vanish</td><td>disappear</td><td>9.8</td></tr><tr><td>belief</td><td>impression</td><td>5.95</td></tr><tr><td>muscle</td><td>bone</td><td>3.65</td></tr><tr><td>modest</td><td>flexible</td><td>0.98</td></tr><tr><td>hole</td><td>agreement</td><td>0.3</td></tr></table>

Word Relatedness The meaning of two words can be related in ways other than similarity. One such class of connections is called word relatedness (Budanitsky and Hirst, 2006), also traditionally called word association in psychology.

Consider the meanings of the words coffee and cup. Coffee is not similar to cup; they share practically no features (coffee is a plant or a beverage, while a cup is a manufactured object with a particular shape). But coffee and cup are clearly related; they are associated by co-participating in an everyday event (the event of drinking coffee out of a cup). Similarly scalpel and surgeon are not similar but are related eventively (a surgeon tends to make use of a scalpel).

One common kind of relatedness between words is if they belong to the same semantic field. A semantic field is a set of words which cover a particular semantic domain and bear structured relations with each other. For example, words might be related by being in the semantic field of hospitals (surgeon, scalpel, nurse, anesthetic, hospital), restaurants (waiter, menu, plate, food, chef), or houses (door, roof, kitchen, family, bed). Semantic fields are also related to topic models, like Latent Dirichlet Allocation, LDA, which apply unsupervised learning on large sets of texts to induce sets of associated words from text. Semantic fields and topic models are very useful tools for discovering topical structure in documents.

In Chapter 18 we’ll introduce more relations between senses like hypernymy or IS-A, antonymy (opposites) and meronymy (part-whole relations).

Semantic Frames and Roles Closely related to semantic fields is the idea of a semantic frame. A semantic frame is a set of words that denote perspectives or participants in a particular type of event. A commercial transaction, for example, is a kind of event in which one entity trades money to another entity in return for some good or service, after which the good changes hands or perhaps the service is performed. This event can be encoded lexically by using verbs like buy (the event from the perspective of the buyer), sell (from the perspective of the seller), pay (focusing on the monetary aspect), or nouns like buyer. Frames have semantic roles (like buyer, seller, goods, money), and words in a sentence can take on these roles.

Knowing that buy and sell have this relation makes it possible for a system to know that a sentence like Sam bought the book from Ling could be paraphrased as Ling sold the book to Sam, and that Sam has the role of the buyer in the frame and Ling the seller. Being able to recognize such paraphrases is important for question answering, and can help in shifting perspective for machine translation.

Connotation Finally, words have affective meanings or connotations. The word connotation has different meanings in different fields, but here we use it to mean the aspects of a word’s meaning that are related to a writer or reader’s emotions, sentiment, opinions, or evaluations. For example some words have positive connotations (happy) while others have negative connotations (sad). Even words whose meanings are similar in other ways can vary in connotation; consider the difference in connotations between fake, knockoff, forgery, on the one hand, and copy, replica, reproduction on the other, or innocent (positive connotation) and naive (negative connotation). Some words describe positive evaluation (great, love) and others negative evaluation (terrible, hate). Positive or negative evaluation language is called sentiment, as we saw in Chapter 4, and word sentiment plays a role in important tasks like sentiment analysis, stance detection, and applications of NLP to the language of politics and consumer reviews.

Early work on affective meaning (Osgood et al., 1957) found that words varied along three important dimensions of affective meaning:

valence: the pleasantness of the stimulus

arousal: the intensity of emotion provoked by the stimulus

dominance: the degree of control exerted by the stimulus

Thus words like happy or satisfied are high on valence, while unhappy or annoyed are low on valence. Excited is high on arousal, while calm is low on arousal. Controlling is high on dominance, while awed or influenced are low on dominance. Each word is thus represented by three numbers, corresponding to its value on each of the three dimensions:

<table><tr><td></td><td>Valence</td><td>Arousal</td><td>Dominance</td></tr><tr><td>courageous</td><td>8.05</td><td>5.5</td><td>7.38</td></tr><tr><td>music</td><td>7.67</td><td>5.57</td><td>6.5</td></tr><tr><td>heartbreak</td><td>2.45</td><td>5.65</td><td>3.58</td></tr><tr><td>cub</td><td>6.71</td><td>3.95</td><td>4.24</td></tr></table>

Osgood et al. (1957) noticed that in using these 3 numbers to represent the meaning of a word, the model was representing each word as a point in a threedimensional space, a vector whose three dimensions corresponded to the word’s rating on the three scales. This revolutionary idea that word meaning could be represented as a point in space (e.g., that part of the meaning of heartbreak can be represented as the point [2.45, 5.65, 3.58]) was the first expression of the vector semantics models that we introduce next.

## 6.2 Vector Semantics

Vectors semantics is the standard way to represent word meaning in NLP, helping us model many of the aspects of word meaning we saw in the previous section. The roots of the model lie in the 1950s when two big ideas converged: Osgood’s (1957) idea mentioned above to use a point in three-dimensional space to represent the connotation of a word, and the proposal by linguists like Joos (1950), Harris (1954), and Firth (1957) to define the meaning of a word by its distribution in language use, meaning its neighboring words or grammatical environments. Their idea was that two words that occur in very similar distributions (whose neighboring words are similar) have similar meanings.

For example, suppose you didn’t know the meaning of the word ongchoi (a recent borrowing from Cantonese) but you see it in the following contexts:

(6.1) Ongchoi is delicious sauteed with garlic.

(6.2) Ongchoi is superb over rice.

(6.3) ...ongchoi leaves with salty sauces...

And suppose that you had seen many of these context words in other contexts:

(6.4) ...spinach sauteed with garlic over rice...

(6.5) ...chard stems and leaves are delicious...

(6.6) ...collard greens and other salty leafy greens

The fact that ongchoi occurs with words like rice and garlic and delicious and salty, as do words like spinach, chard, and collard greens might suggest that ongchoi is a leafy green similar to these other leafy greens.<sup>1</sup> We can do the same thing computationally by just counting words in the context of ongchoi.

The idea of vector semantics is to represent a word as a point in a multidimensional semantic space that is derived (in ways we’ll see) from the distributions of word neighbors. Vectors for representing words are called embeddings (although the term is sometimes more strictly applied only to dense vectors like word2vec (Section 6.8), rather than sparse tf-idf or PPMI vectors (Section 6.3-Section 6.6)). The word “embedding” derives from its mathematical sense as a mapping from one space or structure to another, although the meaning has shifted; see the end of the chapter.

Fig. 6.1 shows a visualization of embeddings learned for sentiment analysis, showing the location of selected words projected down from 60-dimensional space into a two dimensional space. Notice the distinct regions containing positive words, negative words, and neutral function words.

![Figure 6.1](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/52a645118d8a89fd067d475d1e8336f16a70400391d89a2dd59b36e4ce1bee66.jpg)  
Figure 6.1 A two-dimensional (t-SNE) projection of embeddings for some words and phrases, showing that words with similar meanings are nearby in space. The original 60- dimensional embeddings were trained for sentiment analysis. Simplified from Li et al. (2015) with colors added for explanation.

The fine-grained model of word similarity of vector semantics offers enormous power to NLP applications. NLP applications like the sentiment classifiers of Chapter 4 or Chapter 5 depend on the same words appearing in the training and test sets. But by representing words as embeddings, classifiers can assign sentiment as long as it sees some words with similar meanings. And as we’ll see, vector semantic models can be learned automatically from text without supervision.

In this chapter we’ll introduce the two most commonly used models. In the tf-idf model, an important baseline, the meaning of a word is defined by a simple function of the counts of nearby words. We will see that this method results in very long vectors that are sparse, i.e. mostly zeros (since most words simply never occur in the context of others). We’ll introduce the word2vec model family for constructing short, dense vectors that have useful semantic properties. We’ll also introduce the cosine, the standard way to use embeddings to compute semantic similarity, between two words, two sentences, or two documents, an important tool in practical applications like question answering, summarization, or automatic essay grading.

## 6.3 Words and Vectors

“The most important attributes of a vector in 3-space are Location, Location, Location ” Randall Munroe, https://xkcd.com/2358/

Vector or distributional models of meaning are generally based on a co-occurrence matrix, a way of representing how often words co-occur. We’ll look at two popular matrices: the term-document matrix and the term-term matrix.

## 6.3.1 Vectors and documents

In a term-document matrix, each row represents a word in the vocabulary and each column represents a document from some collection of documents. Fig. 6.2 shows a small selection from a term-document matrix showing the occurrence of four words in four plays by Shakespeare. Each cell in this matrix represents the number of times a particular word (defined by the row) occurs in a particular document (defined by the column). Thus fool appeared 58 times in Twelfth Night.

The term-document matrix of Fig. 6.2 was first defined as part of the vector space model of information retrieval (Salton, 1971). In this model, a document is

<table><tr><td></td><td>As You Like It</td><td>Twelfth Night</td><td>Julius Caesar</td><td>Henry V</td></tr><tr><td>battle</td><td>1</td><td>0</td><td>7</td><td>13</td></tr><tr><td>good</td><td>114</td><td>80</td><td>62</td><td>89</td></tr><tr><td>fool</td><td>36</td><td>58</td><td>1</td><td>4</td></tr><tr><td>wit</td><td>20</td><td>15</td><td>2</td><td>3</td></tr></table>

Figure 6.2 The term-document matrix for four words in four Shakespeare plays. Each cell contains the number of times the (row) word occurs in the (column) document.  
represented as a count vector, a column in Fig. 6.3.

To review some basic linear algebra, a vector is, at heart, just a list or array of numbers. So As You Like It is represented as the list [1,114,36,20] (the first column vector in Fig. 6.3) and Julius Caesar is represented as the list [7,62,1,2] (the third column vector). A vector space is a collection of vectors, characterized by their dimension. In the example in Fig. 6.3, the document vectors are of dimension 4, just so they fit on the page; in real term-document matrices, the vectors representing each document would have dimensionality V , the vocabulary size.

The ordering of the numbers in a vector space indicates different meaningful dimensions on which documents vary. Thus the first dimension for both these vectors corresponds to the number of times the word battle occurs, and we can compare each dimension, noting for example that the vectors for As You Like It and Twelfth Night have similar values (1 and 0, respectively) for the first dimension.

<table><tr><td></td><td>As You Like It</td><td>Twelfth Night</td><td>Julius Caesar</td><td>Henry V</td></tr><tr><td>battle</td><td>1</td><td>0</td><td>7</td><td>13</td></tr><tr><td>good</td><td>114</td><td>80</td><td>62</td><td>89</td></tr><tr><td>fool</td><td>36</td><td>58</td><td>1</td><td>4</td></tr><tr><td>wit</td><td>20</td><td>15</td><td>2</td><td>3</td></tr></table>

Figure 6.3 The term-document matrix for four words in four Shakespeare plays. The red boxes show that each document is represented as a column vector of length four.

We can think of the vector for a document as a point in V -dimensional space; thus the documents in Fig. 6.3 are points in 4-dimensional space. Since 4-dimensional spaces are hard to visualize, Fig. 6.4 shows a visualization in two dimensions; we’ve arbitrarily chosen the dimensions corresponding to the words battle and fool.

![Figure 6.4](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/03f4cf9d59e2649684725c002d1b760fe91d64d1546e70e29e9f255ced7bbe84.jpg)  
Figure 6.4 A spatial visualization of the document vectors for the four Shakespeare play documents, showing just two of the dimensions, corresponding to the words battle and fool. The comedies have high values for the fool dimension and low values for the battle dimension.

Term-document matrices were originally defined as a means of finding similar documents for the task of document information retrieval. Two documents that are similar will tend to have similar words, and if two documents have similar words their column vectors will tend to be similar. The vectors for the comedies As You Like It [1,114,36,20] and Twelfth Night [0,80,58,15] look a lot more like each other (more fools and wit than battles) than they look like Julius Caesar [7,62,1,2] or Henry V [13,89,4,3]. This is clear with the raw numbers; in the first dimension (battle) the comedies have low numbers and the others have high numbers, and we can see it visually in Fig. 6.4; we’ll see very shortly how to quantify this intuition more formally.

A real term-document matrix, of course, wouldn’t just have 4 rows and columns, let alone 2. More generally, the term-document matrix has $| V |$ rows (one for each word type in the vocabulary) and D columns (one for each document in the collection); as we’ll see, vocabulary sizes are generally in the tens of thousands, and the number of documents can be enormous (think about all the pages on the web).

Information retrieval (IR) is the task of finding the document d from the D documents in some collection that best matches a query q. For IR we’ll therefore also represent a query by a vector, also of length V , and we’ll need a way to compare two vectors to find how similar they are. (Doing IR will also require efficient ways to store and manipulate these vectors by making use of the convenient fact that these vectors are sparse, i.e., mostly zeros).

Later in the chapter we’ll introduce some of the components of this vector comparison process: the tf-idf term weighting, and the cosine similarity metric.

## 6.3.2 Words as vectors: document dimensions

We’ve seen that documents can be represented as vectors in a vector space. But vector semantics can also be used to represent the meaning of words. We do this by associating each word with a word vector— a row vector rather than a column vector, hence with different dimensions, as shown in Fig. 6.5. The four dimensions of the vector for fool, [36,58,1,4], correspond to the four Shakespeare plays. Word counts in the same four dimensions are used to form the vectors for the other 3 words: wit, [20,15,2,3]; battle, [1,0,7,13]; and good [114,80,62,89].

<table><tr><td></td><td>As You Like It</td><td>Twelfth Night</td><td>Julius Caesar</td><td>Henry V</td></tr><tr><td>battle</td><td>1</td><td>0</td><td>7</td><td>13</td></tr><tr><td>good</td><td>114</td><td>80</td><td>62</td><td>89</td></tr><tr><td>fool</td><td>36</td><td>58</td><td>1</td><td>4</td></tr><tr><td>wit</td><td>20</td><td>15</td><td>2</td><td>3</td></tr></table>

Figure 6.5 The term-document matrix for four words in four Shakespeare plays. The red boxes show that each word is represented as a row vector of length four.

For documents, we saw that similar documents had similar vectors, because similar documents tend to have similar words. This same principle applies to words: similar words have similar vectors because they tend to occur in similar documents. The term-document matrix thus lets us represent the meaning of a word by the documents it tends to occur in.

## 6.3.3 Words as vectors: word dimensions

An alternative to using the term-document matrix to represent words as vectors of document counts, is to use the term-term matrix, also called the word-word matrix or the term-context matrix, in which the columns are labeled by words rather than documents. This matrix is thus of dimensionality $| V | \times | V |$ and each cell records the number of times the row (target) word and the column (context) word co-occur in some context in some training corpus. The context could be the document, in which case the cell represents the number of times the two words appear in the same document. It is most common, however, to use smaller contexts, generally a window around the word, for example of 4 words to the left and 4 words to the right, in which case the cell represents the number of times (in some training corpus) the column word occurs in such a 4 word window around the row word. For example here is one example each of some words in their windows:

is traditionally followed by cherry pie, a traditional dessert often mixed, such as strawberry rhubarb pie. Apple pie computer peripherals and personal digital assistants. These devices usually a computer. This includes information available on the internet

If we then take every occurrence of each word (say strawberry) and count the context words around it, we get a word-word co-occurrence matrix. Fig. 6.6 shows a simplified subset of the word-word co-occurrence matrix for these four words computed from the Wikipedia corpus (Davies, 2015).

<table><tr><td></td><td>aardvark</td><td>...</td><td>computer</td><td>data</td><td>result</td><td>pie</td><td>sugar</td><td>...</td></tr><tr><td>cherry</td><td>0</td><td>...</td><td>2</td><td>8</td><td>9</td><td>442</td><td>25</td><td>...</td></tr><tr><td>strawberry</td><td>0</td><td>...</td><td>0</td><td>0</td><td>1</td><td>60</td><td>19</td><td>...</td></tr><tr><td>digital</td><td>0</td><td>...</td><td>1670</td><td>1683</td><td>85</td><td>5</td><td>4</td><td>...</td></tr><tr><td>information</td><td>0</td><td>...</td><td>3325</td><td>3982</td><td>378</td><td>5</td><td>13</td><td>...</td></tr></table>

Figure 6.6 Co-occurrence vectors for four words in the Wikipedia corpus, showing six of the dimensions (hand-picked for pedagogical purposes). The vector for digital is outlined in red. Note that a real vector would have vastly more dimensions and thus be much sparser.

Note in Fig. 6.6 that the two words cherry and strawberry are more similar to each other (both pie and sugar tend to occur in their window) than they are to other words like digital; conversely, digital and information are more similar to each other than, say, to strawberry. Fig. 6.7 shows a spatial visualization.

![Figure 6.7](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/ba1699cdf89c52667679eef38c7e89e47052b53d6a6f5a8ab2671c43d5d65097.jpg)  
Figure 6.7 A spatial visualization of word vectors for digital and information, showing just two of the dimensions, corresponding to the words data and computer.

Note that V , the length of the vector, is generally the size of the vocabulary, often between 10,000 and 50,000 words (using the most frequent words in the training corpus; keeping words after about the most frequent 50,000 or so is generally not helpful). Since most of these numbers are zero these are sparse vector representations; there are efficient algorithms for storing and computing with sparse matrices.

Now that we have some intuitions, let’s move on to examine the details of computing word similarity. Afterwards we’ll discuss methods for weighting cells.

## 6.4 Cosine for measuring similarity

To measure similarity between two target words v and w, we need a metric that takes two vectors (of the same dimensionality, either both with words as dimensions, hence of length $| V |$ , or both with documents as dimensions as documents, of length D ) and gives a measure of their similarity. By far the most common similarity metric is the cosine of the angle between the vectors.

The cosine—like most measures for vector similarity used in NLP—is based on the dot product operator from linear algebra, also called the inner product:

$$
\text{dot product}(\mathbf{v}, \mathbf{w}) = \mathbf{v} \cdot \mathbf{w} = \sum_{i = 1}^{N} v_{i} w_{i} = v_{1} w_{1} + v_{2} w_{2} + \dots + v_{N} w_{N}\tag{6.7}
$$

As we will see, most metrics for similarity between vectors are based on the dot product. The dot product acts as a similarity metric because it will tend to be high just when the two vectors have large values in the same dimensions. Alternatively, vectors that have zeros in different dimensions—orthogonal vectors—will have a dot product of 0, representing their strong dissimilarity.

This raw dot product, however, has a problem as a similarity metric: it favors long vectors. The vector length is defined as

$$
| \mathbf{v} | = \sqrt{\sum_{i = 1}^{N} v_{i}^{2}}\tag{6.8}
$$

The dot product is higher if a vector is longer, with higher values in each dimension. More frequent words have longer vectors, since they tend to co-occur with more words and have higher co-occurrence values with each of them. The raw dot product thus will be higher for frequent words. But this is a problem; we’d like a similarity metric that tells us how similar two words are regardless of their frequency.

We modify the dot product to normalize for the vector length by dividing the dot product by the lengths of each of the two vectors. This normalized dot product turns out to be the same as the cosine of the angle between the two vectors, following from the definition of the dot product between two vectors a and b:

$$
\begin{array}{rcl} \mathbf{a} \cdot \mathbf{b} & = & | \mathbf{a} | | \mathbf{b} | \cos \theta \\ \frac{\mathbf{a} \cdot \mathbf{b}}{| \mathbf{a} | | \mathbf{b} |} & = & \cos \theta \end{array}\tag{6.9}
$$

The cosine similarity metric between two vectors v and w thus can be computed as:

$$
\cos \left(\mathbf{v}, \mathbf{w}\right) = \frac{\mathbf{v} \cdot \mathbf{w}}{| \mathbf{v} | | \mathbf{w} |} = \frac{\sum_{i = 1}^{N} v_{i} w_{i}}{\sqrt{\sum_{i = 1}^{N} v_{i}^{2}} \sqrt{\sum_{i = 1}^{N} w_{i}^{2}}}\tag{6.10}
$$

For some applications we pre-normalize each vector, by dividing it by its length, creating a unit vector of length 1. Thus we could compute a unit vector from a by dividing it by a . For unit vectors, the dot product is the same as the cosine.

The cosine value ranges from 1 for vectors pointing in the same direction, through 0 for orthogonal vectors, to -1 for vectors pointing in opposite directions. But since raw frequency values are non-negative, the cosine for these vectors ranges from 0–1.

Let’s see how the cosine computes which of the words cherry or digital is closer in meaning to information, just using raw counts from the following shortened table:

<table><tr><td></td><td>pie</td><td>data</td><td>computer</td></tr><tr><td>cherry</td><td>442</td><td>8</td><td>2</td></tr><tr><td>digital</td><td>5</td><td>1683</td><td>1670</td></tr><tr><td>information</td><td>5</td><td>3982</td><td>3325</td></tr></table>

$$
\begin{array}{l} \cos(\text{cherry, information}) = \frac{442 * 5 + 8 * 3982 + 2 * 3325}{\sqrt{442^{2} + 8^{2} + 2^{2}} \sqrt{5^{2} + 3982^{2} + 3325^{2}}} =.017 \\ \cos(\text{digital, information}) = \frac{5 * 5 + 1683 * 3982 + 1670 * 3325}{\sqrt{5^{2} + 1683^{2} + 1670^{2}} \sqrt{5^{2} + 3982^{2} + 3325^{2}}} =.996 \end{array}
$$

The model decides that information is way closer to digital than it is to cherry, a result that seems sensible. Fig. 6.8 shows a visualization.

![Figure 6.8](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/a7c7394c9651930c75a4d3b96a1a705de343481e257775864dec40f20e2fa0fa.jpg)  
Figure 6.8 A (rough) graphical demonstration of cosine similarity, showing vectors for three words (cherry, digital, and information) in the two dimensional space defined by counts of the words computer and pie nearby. Note that the angle between digital and information is smaller than the angle between cherry and information. When two vectors are more similar, the cosine is larger but the angle is smaller; the cosine has its maximum (1) when the angle between two vectors is smallest (0◦); the cosine of all other angles is less than 1.

## 6.5 TF-IDF: Weighing terms in the vector

The co-occurrence matrices above represent each cell by frequencies, either of words with documents (Fig. 6.5), or words with other words (Fig. 6.6). But raw frequency is not the best measure of association between words. Raw frequency is very skewed and not very discriminative. If we want to know what kinds of contexts are shared by cherry and strawberry but not by digital and information, we’re not going to get good discrimination from words like the, it, or they, which occur frequently with all sorts of words and aren’t informative about any particular word. We saw this also in Fig. 6.3 for the Shakespeare corpus; the dimension for the word good is not very discriminative between plays; good is simply a frequent word and has roughly equivalent high frequencies in each of the plays.

It’s a bit of a paradox. Words that occur nearby frequently (maybe pie nearby cherry) are more important than words that only appear once or twice. Yet words that are too frequent—ubiquitous, like the or good— are unimportant. How can we balance these two conflicting constraints?

There are two common solutions to this problem: in this section we’ll describe the tf-idf algorithm, usually used when the dimensions are documents. In the next we introduce the PPMI algorithm (usually used when the dimensions are words).

The tf-idf algorithm (the ‘-’ here is a hyphen, not a minus sign) is the product of two terms, each term capturing one of these two intuitions:

The first is the term frequency (Luhn, 1957): the frequency of the word t in the document d. We can just use the raw count as the term frequency:

$$
\operatorname{tf}_{t, d} = \operatorname{count}(t, d)\tag{6.11}
$$

More commonly we squash the raw frequency a bit, by using the $\log_{10}$ of the frequency instead. The intuition is that a word appearing 100 times in a document doesn’t make that word 100 times more likely to be relevant to the meaning of the document. Because we can’t take the log of 0, we normally add 1 to the count:<sup>2</sup>

$$
\mathrm{tf}_{t, d} = \log_{10}(\operatorname{count}(t, d) + 1)\tag{6.12}
$$

If we use log weighting, terms which occur 0 times in a document would have $\mathrm{{tf}} = \log_{10}(1) = 0$ , 10 times in a document $\mathrm{tf} = \log_{10}(11) = 1.4$ , 100 times $\mathbf{t} \mathbf{=}$ log $_{10}(101) = 2.004$ , 1000 times $\mathrm{tf} = 3.00044$ , and so on.

The second factor in tf-idf is used to give a higher weight to words that occur only in a few documents. Terms that are limited to a few documents are useful for discriminating those documents from the rest of the collection; terms that occur frequently across the entire collection aren’t as helpful. The document frequency df of a term t is the number of documents it occurs in. Document frequency is not the same as the collection frequency of a term, which is the total number of times the word appears in the whole collection in any document. Consider in the collection of Shakespeare’s 37 plays the two words Romeo and action. The words have identical collection frequencies (they both occur 113 times in all the plays) but very different document frequencies, since Romeo only occurs in a single play. If our goal is to find documents about the romantic tribulations of Romeo, the word Romeo should be highly weighted, but not action:

<table><tr><td></td><td>Collection Frequency</td><td>Document Frequency</td></tr><tr><td>Romeo</td><td>113</td><td>1</td></tr><tr><td>action</td><td>113</td><td>31</td></tr></table>

We emphasize discriminative words like Romeo via the inverse document frequency or idf term weight (Sparck Jones, 1972). The idf is defined using the fraction $N / \mathrm{df}_{t}$ , where N is the total number of documents in the collection, and df<sub>t</sub> is the number of documents in which term t occurs. The fewer documents in which a term occurs, the higher this weight. The lowest weight of 1 is assigned to terms that occur in all the documents. It’s usually clear what counts as a document: in Shakespeare we would use a play; when processing a collection of encyclopedia articles like Wikipedia, the document is a Wikipedia page; in processing newspaper articles, the document is a single article. Occasionally your corpus might not have appropriate document divisions and you might need to break up the corpus into documents yourself for the purposes of computing idf.

Because of the large number of documents in many collections, this measure too is usually squashed with a log function. The resulting definition for inverse document frequency (idf) is thus

$$
\mathrm{idf}_{t} = \log_{10} \left(\frac{N}{\mathrm{df}_{t}}\right)\tag{6.13}
$$

Here are some idf values for some words in the Shakespeare corpus, ranging from extremely informative words which occur in only one play like Romeo, to those that occur in a few like salad or Falstaff, to those which are very common like fool or so common as to be completely non-discriminative since they occur in all 37 plays like good or sweet.<sup>3</sup>

<table><tr><td>Word</td><td>df</td><td>idf</td></tr><tr><td>Romeo</td><td>1</td><td>1.57</td></tr><tr><td>salad</td><td>2</td><td>1.27</td></tr><tr><td>Falstaff</td><td>4</td><td>0.967</td></tr><tr><td>forest</td><td>12</td><td>0.489</td></tr><tr><td>battle</td><td>21</td><td>0.246</td></tr><tr><td>wit</td><td>34</td><td>0.037</td></tr><tr><td>fool</td><td>36</td><td>0.012</td></tr><tr><td>good</td><td>37</td><td>0</td></tr><tr><td>sweet</td><td>37</td><td>0</td></tr></table>

The tf-idf weighted value $w_{t, d}$ for word t in document d thus combines term frequency $\mathrm{tf}_{t, d}$ (defined either by Eq. 6.11 or by Eq. 6.12) with idf from Eq. 6.13:

$$
w_{t, d} = \mathrm{tf}_{t, d} \times \mathrm{idf}_{t}\tag{6.14}
$$

Fig. 6.9 applies tf-idf weighting to the Shakespeare term-document matrix in Fig. 6.2, using the tf equation Eq. 6.12. Note that the tf-idf values for the dimension corresponding to the word good have now all become 0; since this word appears in every document, the tf-idf algorithm leads it to be ignored. Similarly, the word fool, which appears in 36 out of the 37 plays, has a much lower weight.

<table><tr><td></td><td>As You Like It</td><td>Twelfth Night</td><td>Julius Caesar</td><td>Henry V</td></tr><tr><td>battle</td><td>0.074</td><td>0</td><td>0.22</td><td>0.28</td></tr><tr><td>good</td><td>0</td><td>0</td><td>0</td><td>0</td></tr><tr><td>fool</td><td>0.019</td><td>0.021</td><td>0.0036</td><td>0.0083</td></tr><tr><td>wit</td><td>0.049</td><td>0.044</td><td>0.018</td><td>0.022</td></tr></table>

Figure 6.9 A tf-idf weighted term-document matrix for four words in four Shakespeare plays, using the counts in Fig. 6.2. For example the 0.049 value for wit in As You Like It is the product of $\mathrm{tf} = \log_{10}(20 + 1) = 1.322$ and $\mathrm{idf} =.037$ . Note that the idf weighting has eliminated the importance of the ubiquitous word good and vastly reduced the impact of the almost-ubiquitous word fool.

The tf-idf weighting is the way for weighting co-occurrence matrices in information retrieval, but also plays a role in many other aspects of natural language processing. It’s also a great baseline, the simple thing to try first. We’ll look at other weightings like PPMI (Positive Pointwise Mutual Information) in Section 6.6.

## 6.6 Pointwise Mutual Information (PMI)

An alternative weighting function to tf-idf, PPMI (positive pointwise mutual information), is used for term-term-matrices, when the vector dimensions correspond to words rather than documents. PPMI draws on the intuition that the best way to weigh the association between two words is to ask how much more the two words co-occur in our corpus than we would have a priori expected them to appear by chance.

Pointwise mutual information (Fano, $1961)^{4}$ is one of the most important concepts in NLP. It is a measure of how often two events x and y occur, compared with what we would expect if they were independent:

$$
I(x, y) = \log_{2} \frac{P(x, y)}{P(x) P(y)}\tag{6.16}
$$

The pointwise mutual information between a target word w and a context word c (Church and Hanks 1989, Church and Hanks 1990) is then defined as:

$$
\operatorname{PMI}(w, c) = \log_{2} \frac{P(w, c)}{P(w) P(c)}\tag{6.17}
$$

The numerator tells us how often we observed the two words together (assuming we compute probability by using the MLE). The denominator tells us how often we would expect the two words to co-occur assuming they each occurred independently; recall that the probability of two independent events both occurring is just the product of the probabilities of the two events. Thus, the ratio gives us an estimate of how much more the two words co-occur than we expect by chance. PMI is a useful tool whenever we need to find words that are strongly associated.

PMI values range from negative to positive infinity. But negative PMI values (which imply things are co-occurring less often than we would expect by chance) tend to be unreliable unless our corpora are enormous. To distinguish whether two words whose individual probability is each $10^{- 6}$ occur together less often than chance, we would need to be certain that the probability of the two occurring together is significantly different than $10^{- 12}$ , and this kind of granularity would require an enormous corpus. Furthermore it’s not clear whether it’s even possible to evaluate such scores of ‘unrelatedness’ with human judgments. For this reason it is more common to use Positive PMI (called PPMI) which replaces all negative PMI values with zero (Church and Hanks 1989, Dagan et al. 1993, Niwa and Nitta 1994)<sup>5</sup>:

$$
\operatorname{PPMI}(w, c) = \max(\log_{2} \frac{P(w, c)}{P(w) P(c)}, 0)\tag{6.18}
$$

More formally, let’s assume we have a co-occurrence matrix F with W rows (words) and C columns (contexts), where $f_{ij}$ gives the number of times word $w_{i}$ occurs in

(6.15)

context $c_{j}.$ . This can be turned into a PPMI matrix where ppmi<sub>i</sub> <sub>j</sub> gives the PPMI value of word w with context $c_{j}$ as follows:

$$
p_{ij} = \frac{f_{ij}}{\sum_{i = 1}^{W} \sum_{j = 1}^{C} f_{ij}} p_{i *} = \frac{\sum_{j = 1}^{C} f_{ij}}{\sum_{i = 1}^{W} \sum_{j = 1}^{C} f_{ij}} p_{* j} = \frac{\sum_{i = 1}^{W} f_{ij}}{\sum_{i = 1}^{W} \sum_{j = 1}^{C} f_{ij}}\tag{6.19}
$$

$$
\mathrm{PPMI}_{ij} = \max(\log_{2} \frac{p_{ij}}{p_{i *} p_{* j}}, 0)\tag{6.20}
$$

Let’s see some PPMI calculations. We’ll use Fig. 6.10, which repeats Fig. 6.6 plus all the count marginals, and let’s pretend for ease of calculation that these are the only words/contexts that matter.

<table><tr><td></td><td>computer</td><td>data</td><td>result</td><td>pie</td><td>sugar</td><td>count(w)</td></tr><tr><td>cherry</td><td>2</td><td>8</td><td>9</td><td>442</td><td>25</td><td>486</td></tr><tr><td>strawberry</td><td>0</td><td>0</td><td>1</td><td>60</td><td>19</td><td>80</td></tr><tr><td>digital</td><td>1670</td><td>1683</td><td>85</td><td>5</td><td>4</td><td>3447</td></tr><tr><td>information</td><td>3325</td><td>3982</td><td>378</td><td>5</td><td>13</td><td>7703</td></tr><tr><td>count(context)</td><td>4997</td><td>5673</td><td>473</td><td>512</td><td>61</td><td>11716</td></tr></table>

Figure 6.10 Co-occurrence counts for four words in 5 contexts in the Wikipedia corpus, together with the marginals, pretending for the purpose of this calculation that no other words/contexts matter.

Thus for example we could compute PPMI(w=information,c=data), assuming we pretended that Fig. 6.6 encompassed all the relevant word contexts/dimensions, as follows:

$$
\begin{array}{rl} P(w = \text{information}, c = \text{data}) & = \frac{3982}{11716} =.3399 \\ P(w = \text{information}) & = \frac{7703}{11716} =.6575 \\ P(c = \text{data}) & = \frac{5673}{11716} =.4842 \\ \text{ppmi(information, data)} & = \log 2(.3399 /(.6575 *.4842)) =.0944 \end{array}
$$

Fig. 6.11 shows the joint probabilities computed from the counts in Fig. 6.10, and Fig. 6.12 shows the PPMI values. Not surprisingly, cherry and strawberry are highly associated with both pie and sugar, and data is mildly associated with information.

<table><tr><td></td><td colspan="5">p(w,context)</td><td>p(w)</td></tr><tr><td></td><td>computer</td><td>data</td><td>result</td><td>pie</td><td>sugar</td><td>p(w)</td></tr><tr><td>cherry</td><td>0.0002</td><td>0.0007</td><td>0.0008</td><td>0.0377</td><td>0.0021</td><td>0.0415</td></tr><tr><td>strawberry</td><td>0.0000</td><td>0.0000</td><td>0.0001</td><td>0.0051</td><td>0.0016</td><td>0.0068</td></tr><tr><td>digital</td><td>0.1425</td><td>0.1436</td><td>0.0073</td><td>0.0004</td><td>0.0003</td><td>0.2942</td></tr><tr><td>information</td><td>0.2838</td><td>0.3399</td><td>0.0323</td><td>0.0004</td><td>0.0011</td><td>0.6575</td></tr><tr><td>p(context)</td><td>0.4265</td><td>0.4842</td><td>0.0404</td><td>0.0437</td><td>0.0052</td><td></td></tr></table>

Figure 6.11 Replacing the counts in Fig. 6.6 with joint probabilities, showing the marginals around the outside.

PMI has the problem of being biased toward infrequent events; very rare words tend to have very high PMI values. One way to reduce this bias toward low frequency

<table><tr><td></td><td>computer</td><td>data</td><td>result</td><td>pie</td><td>sugar</td></tr><tr><td>cherry</td><td>0</td><td>0</td><td>0</td><td>4.38</td><td>3.30</td></tr><tr><td>strawberry</td><td>0</td><td>0</td><td>0</td><td>4.10</td><td>5.51</td></tr><tr><td>digital</td><td>0.18</td><td>0.01</td><td>0</td><td>0</td><td>0</td></tr><tr><td>information</td><td>0.02</td><td>0.09</td><td>0.28</td><td>0</td><td>0</td></tr></table>

Figure 6.12 The PPMI matrix showing the association between words and context words, computed from the counts in Fig. 6.11. Note that most of the 0 PPMI values are ones that had a negative PMI; for example PMI(cherry,computer) = -6.7, meaning that cherry and computer co-occur on Wikipedia less often than we would expect by chance, and with PPMI we replace negative values by zero.

events is to slightly change the computation for $P(c)$ , using a different function $P_{\alpha}(c)$ that raises the probability of the context word to the power of α:

$$
\mathrm{PPMI}_{\alpha}(w, c) = \max(\log_{2} \frac{P(w, c)}{P(w) P_{\alpha}(c)}, 0)\tag{6.21}
$$

$$
P_{\alpha}(c) = \frac{count(c)^{\alpha}}{\sum_{c} count(c)^{\alpha}}\tag{6.22}
$$

Levy et al. (2015) found that a setting of $\alpha = 0.75$ improved performance of embeddings on a wide range of tasks (drawing on a similar weighting used for skipgrams described below in Eq. 6.32). This works because raising the count to $\alpha =$ 0.75 increases the probability assigned to rare contex $\mathrm{ts},$ and hence lowers their PMI $(P_{\alpha}(c) > P(c)$ when c is rare).

Another possible solution is Laplace smoothing: Before computing PMI, a small constant k (values of 0.1-3 are common) is added to each of the counts, shrinking (discounting) all the non-zero values. The larger the $k,$ the more the non-zero counts are discounted.

## 6.7 Applications of the tf-idf or PPMI vector models

In summary, the vector semantics model we’ve described so far represents a target word as a vector with dimensions corresponding either to to the documents in a large collection (the term-document matrix) or to the counts of words in some neighboring window (the term-term matrix). The values in each dimension are counts, weighted by tf-idf (for term-document matrices) or PPMI (for term-term matrices), and the vectors are sparse (since most values are zero).

The model computes the similarity between two words x and y by taking the cosine of their tf-idf or PPMI vectors; high cosine, high similarity. This entire model is sometimes referred to as the tf-idf model or the PPMI model, after the weighting function.

The tf-idf model of meaning is often used for document functions like deciding if two documents are similar. We represent a document by taking the vectors of all the words in the document, and computing the centroid of all those vectors. The centroid is the multidimensional version of the mean; the centroid of a set of vectors is a single vector that has the minimum sum of squared distances to each of the vectors in the set. Given k word vectors $w_{1}, w_{2},..., w_{k}$ , the centroid document vector d is:

$$
d = \frac{w_{1} + w_{2} + \dots + w_{k}}{k}\tag{6.23}
$$

Given two documents, we can then compute their document vectors $d_{1}$ and $d_{2}.$ , and estimate the similarity between the two documents by $\cos(d_{1}, d_{2})$ . Document similarity is also useful for all sorts of applications; information retrieval, plagiarism detection, news recommender systems, and even for digital humanities tasks like comparing different versions of a text to see which are similar to each other.

Either the PPMI model or the tf-idf model can be used to compute word similarity, for tasks like finding word paraphrases, tracking changes in word meaning, or automatically discovering meanings of words in different corpora. For example, we can find the 10 most similar words to any target word w by computing the cosines between w and each of the V 1 other words, sorting, and looking at the top 10.

## 6.8 Word2vec

In the previous sections we saw how to represent a word as a sparse, long vector with dimensions corresponding to words in the vocabulary or documents in a collection. We now introduce a more powerful word representation: embeddings, short dense vectors. Unlike the vectors we’ve seen so far, embeddings are short, with number of dimensions d ranging from 50-1000, rather than the much larger vocabulary size $| V |$ or number of documents D we’ve seen. These d dimensions don’t have a clear interpretation. And the vectors are dense: instead of vector entries being sparse, mostly-zero counts or functions of counts, the values will be real-valued numbers that can be negative.

It turns out that dense vectors work better in every NLP task than sparse vectors. While we don’t completely understand all the reasons for this, we have some intuitions. Representing words as 300-dimensional dense vectors requires our classifiers to learn far fewer weights than if we represented words as $50{,} 000$ -dimensional vectors, and the smaller parameter space possibly helps with generalization and avoiding overfitting. Dense vectors may also do a better job of capturing synonymy. For example, in a sparse vector representation, dimensions for synonyms like car and automobile dimension are distinct and unrelated; sparse vectors may thus fail to capture the similarity between a word with car as a neighbor and a word with automobile as a neighbor.

In this section we introduce one method for computing embeddings: skip-gram with negative sampling, sometimes called SGNS. The skip-gram algorithm is one of two algorithms in a software package called word2vec, and so sometimes the algorithm is loosely referred to as word2vec (Mikolov et al. 2013, Mikolov et al. 2013a) The word2vec methods are fast, efficient to train, and easily available online with code and pretrained embeddings. Word2vec embeddings are static embeddings, meaning that the method learns one fixed embedding for each word in the vocabulary. In Chapter 10 we’ll introduce methods for learning dynamic contextual embeddings like the popular BERT or ELMO representations, in which the vector for each word is different in different contexts.

The intuition of word2vec is that instead of counting how often each word w occurs near, say, apricot, we’ll instead train a classifier on a binary prediction task: “Is word w likely to show up near apricot?” We don’t actually care about this prediction task; instead we’ll take the learned classifier weights as the word embeddings.

The revolutionary intuition here is that we can just use running text as implicitly supervised training data for such a classifier; a word $c$ that occurs near the target word apricot acts as gold ‘correct answer’ to the question “Is word c likely to show up near apricot?” This method, often called self-supervision, avoids the need for any sort of hand-labeled supervision signal. This idea was first proposed in the task of neural language modeling, when Bengio et al. (2003) and Collobert et al. (2011) showed that a neural language model (a neural network that learned to predict the next word from prior words) could just use the next word in running text as its supervision signal, and could be used to learn an embedding representation for each word as part of doing this prediction task.

We’ll see how to do neural networks in the next chapter, but word2vec is a much simpler model than the neural network language model, in two ways. First, word2vec simplifies the task (making it binary classification instead of word prediction). Second, word2vec simplifies the architecture (training a logistic regression classifier instead of a multi-layer neural network with hidden layers that demand more sophisticated training algorithms). The intuition of skip-gram is:

1. Treat the target word and a neighboring context word as positive examples.

2. Randomly sample other words in the lexicon to get negative samples.

3. Use logistic regression to train a classifier to distinguish those two cases.

4. Use the learned weights as the embeddings.

## 6.8.1 The classifier

Let’s start by thinking about the classification task, and then turn to how to train. Imagine a sentence like the following, with a target word apricot, and assume we’re using a window of 2 context words:

$$
\begin{array}{ccccc} \dots \text{lemon,} & \text{a [tablespoon of apricot jam,} & & \text{a] pinch ...} \\ & \text{c1} & \text{c2} & \text{w} & \text{c3} \\ & & & & \text{c4} \end{array}
$$

Our goal is to train a classifier such that, given a tuple $(w, c)$ of a target word w paired with a candidate context word c (for example (apricot, jam), or perhaps (apricot, aardvark)) it will return the probability that c is a real context word (true for jam, false for aardvark):

$$
P(+ | w, c)\tag{6.24}
$$

The probability that word c is not a real context word for w is just 1 minus Eq. 6.24:

$$
P(- | w, c) = 1 - P(+ | w, c)\tag{6.25}
$$

How does the classifier compute the probability P? The intuition of the skipgram model is to base this probability on embedding similarity: a word is likely to occur near the target if its embedding is similar to the target embedding. To compute similarity between these dense embeddings, we rely on the intuition that two vectors are similar if they have a high dot product (after all, cosine is just a normalized dot product). In other words:

$$
\text{Similarity}(w, c) \approx c \cdot w\tag{6.26}
$$

The dot product c w is not a probability, it’s just a number ranging from ∞ to ∞ (since the elements in word2vec embeddings can be negative, the dot product can be negative). To turn the dot product into a probability, we’ll use the logistic or sigmoid function σ (x), the fundamental core of logistic regression:

$$
\sigma(x) = \frac{1}{1 + \exp(- x)}\tag{6.27}
$$

We model the probability that word c is a real context word for target word w as:

$$
P(+ | w, c) = \sigma(c \cdot w) = \frac{1}{1 + \exp(- c \cdot w)}\tag{6.28}
$$

The sigmoid function returns a number between 0 and 1, but to make it a probability we’ll also need the total probability of the two possible events (c is a context word, and c isn’t a context word) to sum to 1. We thus estimate the probability that word c is not a real context word for w as:

$$
\begin{array}{rcl} P(- | w, c) & = & 1 - P(+ | w, c) \\ & = & \sigma(- c \cdot w) = \frac{1}{1 + \exp(c \cdot w)} \end{array}\tag{6.29}
$$

Equation 6.28 gives us the probability for one word, but there are many context words in the window. Skip-gram makes the simplifying assumption that all context words are independent, allowing us to just multiply their probabilities:

$$
P(+ | w, c_{1: L}) = \prod_{i = 1}^{L} \sigma(- c_{i} \cdot w)\tag{6.30}
$$

$$
\log P(+ | w, c_{1: L}) = \sum_{i = 1}^{L} \log \sigma(- c_{i} \cdot w)\tag{6.31}
$$

In summary, skip-gram trains a probabilistic classifier that, given a test target word w and its context window of L words $c_{1 : L}$ , assigns a probability based on how similar this context window is to the target word. The probability is based on applying the logistic (sigmoid) function to the dot product of the embeddings of the target word with each context word. To compute this probability, we just need embeddings for each target word and context word in the vocabulary.

![Figure 6.13](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/b3b4091d9cc3d4e56a764f8f249c5c13e5aaa4006413293da6e2adcd2b34ee08.jpg)  
Figure 6.13 The embeddings learned by the skipgram model. The algorithm stores two embeddings for each word, the target embedding (sometimes called the input embedding) and the context embedding (sometimes called the output embedding). The parameter θ that the algorithm learns is thus a matrix of 2 V vectors, each of dimension d, formed by concatenating two matrices, the target embeddings W and the context+noise embeddings C.

Fig. 6.13 shows the intuition of the parameters we’ll need. Skip-gram actually stores two embeddings for each word, one for the word as a target, and one for the word considered as context. Thus the parameters we need to learn are two matrices W and $C,$ each containing an embedding for every one of the V words in the vocabulary $V.^{6}$ Let’s now turn to learning these embeddings (which is the real goal of training this classifier in the first place).

## 6.8.2 Learning skip-gram embeddings

Skip-gram learns embeddings by starting with random embedding vectors and then iteratively shifting the embedding of each word w to be more like the embeddings of words that occur nearby in texts, and less like the embeddings of words that don’t occur nearby. Let’s start by considering a single piece of training data:

$$
\begin{array}{ccccc} \dots & \text{lemon,} & \text{a [tablespoon of apricot jam,} & & \text{a] pinch ...} \\ & & \text{c1} & \text{c2} & \text{w} & \text{c3} \\ & & & & & \text{c4} \end{array}
$$

This example has a target word w (apricot), and 4 context words in the $L = \pm 2$ window, resulting in 4 positive training instances (on the left below):

<table><tr><td colspan="2">positive examples +</td><td colspan="4">negative examples -</td></tr><tr><td>w</td><td> $c_{\text{pos}}$ </td><td>w</td><td> $c_{\text{neg}}$ </td><td>w</td><td> $c_{\text{neg}}$ </td></tr><tr><td>apricot</td><td>tablespoon</td><td>apricot</td><td>aardvark</td><td>apricot</td><td>seven</td></tr><tr><td>apricot</td><td>of</td><td>apricot</td><td>my</td><td>apricot</td><td>forever</td></tr><tr><td>apricot</td><td>jam</td><td>apricot</td><td>where</td><td>apricot</td><td>dear</td></tr><tr><td>apricot</td><td>a</td><td>apricot</td><td>coaxial</td><td>apricot</td><td>if</td></tr></table>

For training a binary classifier we also need negative examples. In fact skipgram with negative sampling (SGNS) uses more negative examples than positive examples (with the ratio between them set by a parameter k). So for each of these $\left(w, c_{pos} \right)$ training instances we’ll create k negative samples, each consisting of the target w plus a ‘noise word’ $c_{neg}.$ . A noise word is a random word from the lexicon, constrained not to be the target word w. The right above shows the setting where $k = 2,$ , so we’ll have 2 negative examples in the negative training set  for each positive example $w, c_{pos}$

The noise words are chosen according to their weighted unigram frequency $p_{\alpha}(w)$ , where α is a weight. If we were sampling according to unweighted frequency $p(w)$ , it would mean that with unigram probability $p({\ "} the^{\prime})$ we would choose the word the as a noise word, with unigram probability $p(\cdots aard \nu ark^{\cdots})$ we would choose aardvark, and so on. But in practice it is common to set $\alpha =.75.$ , i.e. use the weighting $p^{{\frac{3}{4}}}(w)$

$$
P_{\alpha}(w) = \frac{\operatorname{count}(w)^{\alpha}}{\sum_{w^{\prime}} \operatorname{count} \left(w^{\prime}\right)^{\alpha}}\tag{6.32}
$$

Setting $\alpha =.75$ gives better performance because it gives rare noise words slightly higher probability: for rare words, $P_{\alpha}(w) > P(w)$ . To illustrate this intuition, it might help to work out the probabilities for an example with two events, $P(a) =.99$ and $P(b) =.01$

$$
\begin{array}{l} P_{\alpha}(a) = \frac{.99^{.75}}{.99^{.75} +.01^{.75}} =.97 \\ P_{\alpha}(b) = \frac{.01^{.75}}{.99^{.75} +.01^{.75}} =.03 \end{array}\tag{6.33}
$$

Given the set of positive and negative training instances, and an initial set of embeddings, the goal of the learning algorithm is to adjust those embeddings to

- Maximize the similarity of the target word, context word pairs $\left(w, c_{pos} \right)$ drawn from the positive examples

- Minimize the similarity of the $\left(w, c_{neg} \right)$ pairs from the negative examples.

If we consider one word/context pair $\left(w, c_{pos} \right)$ ) with its k noise words $c_{neg_{1}}...c_{neg_{k}},$ we can express these two goals as the following loss function L to be minimized (hence the ); here the first term expresses that we want the classifier to assign the real context word $c_{pos}$ a high probability of being a neighbor, and the second term expresses that we want to assign each of the noise words $c_{neg_{i}}$ a high probability of being a non-neighbor, all multiplied because we assume independence:

$$
\begin{array}{l} L_{CE} = - \log \left[P(+ | w, c_{pos}) \prod_{i = 1}^{k} P(- | w, c_{neg_{i}}) \right] \\ = - \left[\log P(+ | w, c_{pos}) + \sum_{i = 1}^{k} \log P(- | w, c_{neg_{i}}) \right] \\ = - \left[\log P(+ | w, c_{pos}) + \sum_{i = 1}^{k} \log \left(1 - P(+ | w, c_{neg_{i}})\right) \right] \\ = - \left[\log \sigma(c_{pos} \cdot w) + \sum_{i = 1}^{k} \log \sigma(- c_{neg_{i}} \cdot w) \right] \end{array}\tag{6.34}
$$

That is, we want to maximize the dot product of the word with the actual context words, and minimize the dot products of the word with the k negative sampled nonneighbor words.

We minimize this loss function using stochastic gradient descent. Fig. 6.14 shows the intuition of one step of learning.

![Figure 6.14](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/13d7d9b80a202fd0442df5b7beefb59e7b0966d89276de0bca46cf97e6f4b45d.jpg)  
Figure 6.14 Intuition of one step of gradient descent. The skip-gram model tries to shift embeddings so the target embeddings (here for apricot) are closer to (have a higher dot product with) context embeddings for nearby words (here jam) and further from (lower dot product with) context embeddings for noise words that don’t occur nearby (here Tolstoy and matrix).

To get the gradient, we need to take the derivative of Eq. 6.34 with respect to the different embeddings. It turns out the derivatives are the following (we leave the proof as an exercise at the end of the chapter):

$$
\frac{\partial L_{CE}}{\partial c_{pos}} =[\sigma(c_{pos} \cdot w) - 1] w\tag{6.35}
$$

$$
\frac{\partial L_{CE}}{\partial c_{neg}} =[\pmb{\sigma}(c_{neg} \cdot w)] w\tag{6.36}
$$

$$
\frac{\partial L_{CE}}{\partial w} =[\sigma(c_{pos} \cdot w) - 1] c_{pos} + \sum_{i = 1}^{k}[\sigma(c_{neg_{i}} \cdot w)] c_{neg_{i}}\tag{6.37}
$$

The update equations going from time step t to $t + 1$ in stochastic gradient descent are thus:

$$
c_{pos}^{t + 1} = c_{pos}^{t} - \eta[\sigma(c_{pos}^{t} \cdot w) - 1] w\tag{6.38}
$$

$$
c_{neg}^{t + 1} = c_{neg}^{t} - \eta[\pmb{\sigma}(c_{neg}^{t} \cdot w)] w\tag{6.39}
$$

$$
w^{t + 1} = w^{t} - \eta[\sigma(c_{pos} \cdot w^{t}) - 1] c_{pos} + \sum_{i = 1}^{k}[\sigma(c_{\text{neg}_{i}} \cdot w^{t})] c_{\text{neg}_{i}}\tag{6.40}
$$

Just as in logistic regression, then, the learning algorithm starts with randomly initialized W and C matrices, and then walks through the training corpus using gradient descent to move W and C so as to maximize the objective in Eq. 6.34 by making the updates in (Eq. 6.39)-(Eq. 6.40).

Recall that the skip-gram model learns two separate embeddings for each word i: the target embedding $w_{i}$ and the context embedding $c_{i},$ stored in two matrices, the target matrix W and the context matrix C. It’s common to just add them together, representing word i with the vector $w_{i} + c_{i}$ . Alternatively we can throw away the C matrix and just represent each word i by the vector $w_{i}$

As with the simple count-based methods like tf-idf, the context window size L affects the performance of skip-gram embeddings, and experiments often tune the parameter L on a devset.

## 6.8.3 Other kinds of static embeddings

There are many kinds of static embeddings. An extension of word2vec, fasttext (Bojanowski et al., 2017), deals with unknown words and sparsity in languages with rich morphology, by using subword models. Each word in fasttext is represented as itself plus a bag of constituent n-grams, with special boundary symbols $<$ and $>$ added to each word. For example, with $n = 3$ the word where would be represented by the sequence <where> plus the character n-grams:

## <wh, whe, her, ere, re>

Then a skipgram embedding is learned for each constituent n-gram, and the word where is represented by the sum of all of the embeddings of its constituent n-grams. A fasttext open-source library, including pretrained embeddings for 157 languages, is available at https://fasttext.cc.

The most widely used static embedding model besides word2vec is GloVe (Pennington et al., 2014), short for Global Vectors, because the model is based on capturing global corpus statistics. GloVe is based on ratios of probabilities from the word-word co-occurrence matrix, combining the intuitions of count-based models like PPMI while also capturing the linear structures used by methods like word2vec.

It turns out that dense embeddings like word2vec actually have an elegant mathematical relationships with sparse embeddings like PPMI, in which word2vec can be seen as implicitly optimizing a shifted version of a PPMI matrix (Levy and Goldberg, 2014c).

## 6.9 Visualizing Embeddings

“I see well in many dimensions as long as the dimensions are around two.” The late economist Martin Shubik

Visualizing embeddings is an important goal in helping understand, apply, and improve these models of word meaning. But how can we visualize a (for example) 100-dimensional vector?

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/3ab17731009292a9c75dab0a6a3d2daf22caf5974825a9bc640bf7efd62b4ad6.jpg)

The simplest way to visualize the meaning of a word w embedded in a space is to list the most similar words to w by sorting the vectors for all words in the vocabulary by their cosine with the vector for w. For example the 7 closest words to frog using the GloVe embeddings are: frogs, toad, litoria, leptodactylidae, rana, lizard, and eleutherodactylus (Pennington et al., 2014).

Yet another visualization method is to use a clustering algorithm to show a hierarchical representation of which words are similar to others in the embedding space. The uncaptioned figure on the left uses hierarchical clustering of some embedding vectors for nouns as a visualization method (Rohde et al., 2006).

Probably the most common visualization method, however, is to project the 100 dimensions of a word down into 2 dimensions. Fig. 6.1 showed one such visualization, as does Fig. 6.16, using a projection method called t-SNE (van der Maaten and Hinton, 2008).

## 206.10 Semantic properties of embeddings

In this section we briefly summarize some of the semantic properties of embeddings that have been studied.

Different types of similarity or association: One parameter of vector semantic models that is relevant to both sparse tf-idf vectors and dense word2vec vectors is the size of the context window used to collect counts. This is generally between 1 and 10 words on each side of the target word (for a total context of 2-20 words).

The choice depends on the goals of the representation. Shorter context windows tend to lead to representations that are a bit more syntactic, since the information is coming from immediately nearby words. When the vectors are computed from short context windows, the most similar words to a target word w tend to be semantically similar words with the same parts of speech. When vectors are computed from long context windows, the highest cosine words to a target word w tend to be words that are topically related but not similar.

For example Levy and Goldberg (2014a) showed that using skip-gram with a window of 2, the most similar words to the word Hogwarts (from the Harry Potter series) were names of other fictional schools: Sunnydale (from Buffy the Vampire Slayer) or Evernight (from a vampire series). With a window of 5, the most similar words to Hogwarts were other words topically related to the Harry Potter series: Dumbledore, Malfoy, and half-blood.

It’s also often useful to distinguish two kinds of similarity or association between words (Schutze and Pedersen, 1993) ¨ . Two words have first-order co-occurrence (sometimes called syntagmatic association) if they are typically nearby each other. Thus wrote is a first-order associate of book or poem. Two words have second-order co-occurrence (sometimes called paradigmatic association) if they have similar neighbors. Thus wrote is a second-order associate of words like said or remarked.

Analogy/Relational Similarity: Another semantic property of embeddings is their ability to capture relational meanings. In an important early vector space model of cognition, Rumelhart and Abrahamson (1973) proposed the parallelogram model for solving simple analogy problems of the form a is to b as $a^{*}$ is to what?. In such problems, a system given a problem like apple:tree::grape:?, i.e., apple is to tree as grape is to , and must fill in the word vine. In the parallelogram model, illustrated in Fig. 6.15, the vector from the word apple to the word tree (= apple tree) is added to the vector for grape ( grape); the nearest word to that point is returned.

![Figure 6.15](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/2b84530be0b2ca3ae5af9a5806b7db90f2061cb93e9a0431492809f0e82eefe4.jpg)  
Figure 6.15 The parallelogram model for analogy problems (Rumelhart and Abrahamson,  
1973): the location of  vine can be found by subtracting  tree from  apple and adding  grape.

In early work with sparse embeddings, scholars showed that sparse vector models of meaning could solve such analogy problems (Turney and Littman, 2005), but the parallelogram method received more modern attention because of its success with word2vec or GloVe vectors (Mikolov et al. 2013b, Levy and Goldberg 2014b, Pennington et al. 2014). For example, the result of the expression ( king) man + woman is a vector close to queen. Similarly, Paris France + Italy) results in a vector that is close to Rome. The embedding model thus seems to be extracting representations of relations like MALE-FEMALE, or CAPITAL-CITY-OF, or even COM-PARATIVE/SUPERLATIVE, as shown in Fig. 6.16 from GloVe.

For a a:b::a\*:b\* problem, meaning the algorithm is given a, b, and $a^{*}$ and must find $b^{*}$ , the parallelogram method is thus:

$$
\hat{b}^{*} = \underset{x}{\operatorname{argmax}} \text{distance}(x, a^{*} - a + b)\tag{6.41}
$$

with the distance function defined either as cosine or as Euclidean distance.

There are some caveats. For example, the closest value returned by the parallelogram algorithm in word2vec or GloVe embedding spaces is usually not in fact $\mathbf{b}^{*}$ but one of the 3 input words or their morphological variants (i.e., cherry:red ::

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/7b95fc3db6e6824bcd182a95ce4dd694bf6fd255495d19b02f3d68dd77dc1434.jpg)

![Figure 6.16](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/604e190d7ed5cea963a7d7eb38ed0fd41006ee89e7c86fecf38b4b70f925c609.jpg)  
Figure 6.16 Relational properties of the GloVe vector space, shown by projecting vectors onto two dimensions. (a) (king) man + woman is close to queen. (b) offsets seem to capture comparative and superlative morphology (Pennington et al., 2014).

potato:x returns potato or potatoes instead of brown), so these must be explicitly excluded. Furthermore while embedding spaces perform well if the task involves frequent words, small distances, and certain relations (like relating countries with their capitals or verbs/nouns with their inflected forms), the parallelogram method with embeddings doesn’t work as well for other relations (Linzen 2016, Gladkova et al. 2016, Ethayarajh et al. 2019a), and indeed Peterson et al. (2020) argue that the parallelogram method is in general too simple to model the human cognitive process of forming analogies of this kind.

## 6.10.1 Embeddings and Historical Semantics

Embeddings can also be a useful tool for studying how meaning changes over time, by computing multiple embedding spaces, each from texts written in a particular time period. For example Fig. 6.17 shows a visualization of changes in meaning in English words over the last two centuries, computed by building separate embedding spaces for each decade from historical corpora like Google N-grams (Lin et al., 2012b) and the Corpus of Historical American English (Davies, 2012).

## 6.11 Bias and Embeddings

In addition to their ability to learn word meaning from text, embeddings, alas, also reproduce the implicit biases and stereotypes that were latent in the text. As the prior section just showed, embeddings can roughly model relational similarity: ‘queen’ as the closest word to ‘king’ - ‘man’ + ‘woman’ implies the analogy man:woman::king:queen. But these same embedding analogies also exhibit gender stereotypes. For example Bolukbasi et al. (2016) find that the closest occupation to ‘man’ - ‘computer programmer’ + ‘woman’ in word2vec embeddings trained on news text is ‘homemaker’, and that the embeddings similarly suggest the analogy ‘father’ is to ‘doctor’ as ‘mother’ is to ‘nurse’. This could result in what Crawford (2017) and Blodgett et al. (2020) call an allocational harm, when a system allocates resources (jobs or credit) unfairly to different groups. For example algorithms that use embeddings as part of a search for hiring potential programmers or doctors might thus incorrectly downweight documents with women’s names.

![Figure 6.17](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/7a13602b744fccd7e93e5d95001a05757c66bea76dade4ae11379c16e2784d76.jpg)  
Figure 6.17 A t-SNE visualization of the semantic change of 3 words in English using word2vec vectors. The modern sense of each word, and the grey context words, are computed from the most recent (modern) time-point embedding space. Earlier points are computed from earlier historical embedding spaces. The visualizations show the changes in the word gay from meanings related to “cheerful” or “frolicsome” to referring to homosexuality, the development of the modern “transmission” sense of broadcast from its original sense of sowing seeds, and the pejoration of the word awful as it shifted from meaning “full of awe” to meaning “terrible or appalling” (Hamilton et al., 2016b).

It turns out that embeddings don’t just reflect the statistics of their input, but also amplify bias; gendered terms become more gendered in embedding space than they were in the input text statistics (Zhao et al. 2017, Ethayarajh et al. 2019b, Jia et al. 2020), and biases are more exaggerated than in actual labor employment statistics (Garg et al., 2018).

Embeddings also encode the implicit associations that are a property of human reasoning. The Implicit Association Test (Greenwald et al., 1998) measures people’s associations between concepts (like ‘flowers’ or ‘insects’) and attributes (like ‘pleasantness’ and ‘unpleasantness’) by measuring differences in the latency with which they label words in the various categories.[^slp-ch6-note7] Using such methods, people in the United States have been shown to associate African-American names with unpleasant words (more than European-American names), male names more with mathematics and female names with the arts, and old people’s names with unpleasant words (Greenwald et al. 1998, Nosek et al. 2002a, Nosek et al. 2002b). Caliskan et al. (2017) replicated all these findings of implicit associations using GloVe vectors and cosine similarity instead of human latencies. For example African-American names like ‘Leroy’ and ‘Shaniqua’ had a higher GloVe cosine with unpleasant words while European-American names (‘Brad’, ‘Greg’, ‘Courtney’) had a higher cosine with pleasant words. These problems with embeddings are an example of a representational harm (Crawford 2017, Blodgett et al. 2020), which is a harm caused by a system demeaning or even ignoring some social groups. Any embedding-aware algorithm that made use of word sentiment could thus exacerbate bias against African Americans.

[^slp-ch6-note7]: Roughly speaking, if humans associate ‘flowers’ with ‘pleasantness’ and ‘insects’ with ‘unpleasantness’, when they are instructed to push a green button for ‘flowers’ (daisy, iris, lilac) and ‘pleasant words’ (love, laughter, pleasure) and a red button for ‘insects’ (flea, spider, mosquito) and ‘unpleasant words’ (abuse, hatred, ugly) they are faster than in an incongruous condition where they push a red button for ‘flowers’ and ‘unpleasant words’ and a green button for ‘insects’ and ‘pleasant words’.

Recent research focuses on ways to try to remove these kinds of biases, for example by developing a transformation of the embedding space that removes gender stereotypes but preserves definitional gender (Bolukbasi et al. 2016, Zhao et al. 2017)

or changing the training procedure (Zhao et al., 2018b). However, although these sorts of debiasing may reduce bias in embeddings, they do not eliminate it (Gonen and Goldberg, 2019), and this remains an open problem.

Historical embeddings are also being used to measure biases in the past. Garg et al. (2018) used embeddings from historical texts to measure the association between embeddings for occupations and embeddings for names of various ethnicities or genders (for example the relative cosine similarity of women’s names versus men’s to occupation words like ‘librarian’ or ‘carpenter’) across the 20th century. They found that the cosines correlate with the empirical historical percentages of women or ethnic groups in those occupations. Historical embeddings also replicated old surveys of ethnic stereotypes; the tendency of experimental participants in 1933 to associate adjectives like ‘industrious’ or ‘superstitious’ with, e.g., Chinese ethnicity, correlates with the cosine between Chinese last names and those adjectives using embeddings trained on 1930s text. They also were able to document historical gender biases, such as the fact that embeddings for adjectives related to competence (‘smart’, ‘wise’, ‘thoughtful’, ‘resourceful’) had a higher cosine with male than female words, and showed that this bias has been slowly decreasing since 1960. We return in later chapters to this question about the role of bias in natural language processing.

## 6.12 Evaluating Vector Models

The most important evaluation metric for vector models is extrinsic evaluation on tasks, i.e., using vectors in an NLP task and seeing whether this improves performance over some other model.

Nonetheless it is useful to have intrinsic evaluations. The most common metric is to test their performance on similarity, computing the correlation between an algorithm’s word similarity scores and word similarity ratings assigned by humans. WordSim-353 (Finkelstein et al., 2002) is a commonly used set of ratings from 0 to 10 for 353 noun pairs; for example (plane, car) had an average score of 5.77. SimLex-999 (Hill et al., 2015) is a more difficult dataset that quantifies similarity (cup, mug) rather than relatedness (cup, coffee), and including both concrete and abstract adjective, noun and verb pairs. The TOEFL dataset is a set of 80 questions, each consisting of a target word with 4 additional word choices; the task is to choose which is the correct synonym, as in the example: Levied is closest in meaning to: imposed, believed, requested, correlated (Landauer and Dumais, 1997). All of these datasets present words without context.

Slightly more realistic are intrinsic similarity tasks that include context. The Stanford Contextual Word Similarity (SCWS) dataset (Huang et al., 2012) and the Word-in-Context (WiC) dataset (Pilehvar and Camacho-Collados, 2019) offer richer evaluation scenarios. SCWS gives human judgments on 2,003 pairs of words in their sentential context, while WiC gives target words in two sentential contexts that are either in the same or different senses; see Section 18.5.3. The semantic textual similarity task (Agirre et al. 2012, Agirre et al. 2015) evaluates the performance of sentence-level similarity algorithms, consisting of a set of pairs of sentences, each pair with human-labeled similarity scores.

Another task used for evaluation is the analogy task, discussed on page 119, where the system has to solve problems of the form a is to b as a\* is to $b^{*},$ given a, b, and $a^{*}$ and having to find $b^{*}$ (Turney and Littman, 2005). A number of sets of tuples have been created for this task, (Mikolov et al. 2013, Mikolov et al. 2013b, Gladkova et al. 2016), covering morphology (city:cities::child:children), lexicographic relations (leg:table::spout::teapot) and encyclopedia relations (Beijing:China::Dublin:Ireland), some drawing from the SemEval-2012 Task 2 dataset of 79 different relations (Jurgens et al., 2012).

All embedding algorithms suffer from inherent variability. For example because of randomness in the initialization and the random negative sampling, algorithms like word2vec may produce different results even from the same dataset, and individual documents in a collection may strongly impact the resulting embeddings (Hellrich and Hahn 2016, Antoniak and Mimno 2018). When embeddings are used to study word associations in particular corpora, therefore, it is best practice to train multiple embeddings with bootstrap sampling over documents and average the results (Antoniak and Mimno, 2018).

## 6.13 Summary

- In vector semantics, a word is modeled as a vector—a point in high-dimensional space, also called an embedding. In this chapter we focus on static embeddings, in each each word is mapped to a fixed embedding.

- Vector semantic models fall into two classes: sparse and dense. In sparse models each dimension corresponds to a word in the vocabulary V and cells are functions of co-occurrence counts. The term-document matrix has a row for each word (term) in the vocabulary and a column for each document. The word-context or term-term matrix has a row for each (target) word in the vocabulary and a column for each context term in the vocabulary. Two sparse weightings are common: the tf-idf weighting which weights each cell by its term frequency and inverse document frequency, and PPMI (pointwise positive mutual information) most common for for word-context matrices.

- Dense vector models have dimensionality 50–1000. Word2vec algorithms like skip-gram are a popular way to compute dense embeddings. Skip-gram trains a logistic regression classifier to compute the probability that two words are ‘likely to occur nearby in text’. This probability is computed from the dot product between the embeddings for the two words.

- Skip-gram uses stochastic gradient descent to train the classifier, by learning embeddings that have a high dot product with embeddings of words that occur nearby and a low dot product with noise words.

- Other important embedding algorithms include GloVe, a method based on ratios of word co-occurrence probabilities.

- Whether using sparse or dense vectors, word and document similarities are computed by some function of the dot product between vectors. The cosine of two vectors—a normalized dot product—is the most popular such metric.

## Bibliographical and Historical Notes

The idea of vector semantics arose out of research in the 1950s in three distinct fields: linguistics, psychology, and computer science, each of which contributed a

fundamental aspect of the model.

The idea that meaning is related to the distribution of words in context was widespread in linguistic theory of the 1950s, among distributionalists like Zellig Harris, Martin Joos, and J. R. Firth, and semioticians like Thomas Sebeok. As Joos (1950) put it,

the linguist’s “meaning” of a morpheme. . . is by definition the set of conditional

probabilities of its occurrence in context with all other morphemes.

The idea that the meaning of a word might be modeled as a point in a multidimensional semantic space came from psychologists like Charles E. Osgood, who had been studying how people responded to the meaning of words by assigning values along scales like happy/sad or hard/soft. Osgood et al. (1957) proposed that the meaning of a word in general could be modeled as a point in a multidimensional Euclidean space, and that the similarity of meaning between two words could be modeled as the distance between these points in the space.

A final intellectual source in the 1950s and early 1960s was the field then called mechanical indexing, now known as information retrieval. In what became known as the vector space model for information retrieval (Salton 1971, Sparck Jones 1986), researchers demonstrated new ways to define the meaning of words in terms of vectors (Switzer, 1965), and refined methods for word similarity based on measures of statistical association between words like mutual information (Giuliano, 1965) and idf (Sparck Jones, 1972), and showed that the meaning of documents could be represented in the same vector spaces used for words.

Some of the philosophical underpinning of the distributional way of thinking came from the late writings of the philosopher Wittgenstein, who was skeptical of the possibility of building a completely formal theory of meaning definitions for each word, suggesting instead that “the meaning of a word is its use in the language” (Wittgenstein, 1953, PI 43). That is, instead of using some logical language to define each word, or drawing on denotations or truth values, Wittgenstein’s idea is that we should define a word by how it is used by people in speaking and understanding in their day-to-day interactions, thus prefiguring the movement toward embodied and experiential models in linguistics and NLP (Glenberg and Robertson 2000, Lake and Murphy 2020, Bisk et al. 2020, Bender and Koller 2020).

More distantly related is the idea of defining words by a vector of discrete features, which has roots at least as far back as Descartes and Leibniz (Wierzbicka 1992, Wierzbicka 1996). By the middle of the 20th century, beginning with the work of Hjelmslev (Hjelmslev, 1969) (originally 1943) and fleshed out in early models of generative grammar (Katz and Fodor, 1963), the idea arose of representing meaning with semantic features, symbols that represent some sort of primitive meaning. For example words like hen, rooster, or chick, have something in common (they all describe chickens) and something different (their age and sex), representable as:

hen +female, +chicken, +adult

rooster -female, +chicken, +adult

chick +chicken, -adult

The dimensions used by vector models of meaning to define words, however, are only abstractly related to this idea of a small fixed number of hand-built dimensions. Nonetheless, there has been some attempt to show that certain dimensions of embedding models do contribute some specific compositional aspect of meaning like these early semantic features.

The use of dense vectors to model word meaning, and indeed the term embedding, grew out of the latent semantic indexing (LSI) model (Deerwester et al.,

1988) recast as LSA (latent semantic analysis) (Deerwester et al., 1990). In LSA singular value decomposition—SVD— is applied to a term-document matrix (each cell weighted by log frequency and normalized by entropy), and then the first 300 dimensions are used as the LSA embedding. Singular Value Decomposition (SVD) is a method for finding the most important dimensions of a data set, those dimensions along which the data varies the most. LSA was then quickly widely applied: as a cognitive model Landauer and Dumais (1997), and for tasks like spell checking (Jones and Martin, 1997), language modeling (Bellegarda 1997, Coccaro and Jurafsky 1998, Bellegarda 2000) morphology induction (Schone and Jurafsky 2000, Schone and Jurafsky 2001b), multiword expressions (MWEs) (Schone and Jurafsky, 2001a), and essay grading (Rehder et al., 1998). Related models were simultaneously developed and applied to word sense disambiguation by Schutze (1992b)¨ . LSA also led to the earliest use of embeddings to represent words in a probabilistic classifier, in the logistic regression document router of Schutze et al. (1995)¨ . The idea of SVD on the term-term matrix (rather than the term-document matrix) as a model of meaning for NLP was proposed soon after LSA by Schutze (1992b)¨ . Schutze applied the low-rank (97-dimensional) embeddings produced by SVD to the¨ task of word sense disambiguation, analyzed the resulting semantic space, and also suggested possible techniques like dropping high-order dimensions. See Schutze¨ (1997a).

A number of alternative matrix models followed on from the early SVD work, including Probabilistic Latent Semantic Indexing (PLSI) (Hofmann, 1999), Latent Dirichlet Allocation (LDA) (Blei et al., 2003), and Non-negative Matrix Factorization (NMF) (Lee and Seung, 1999).

The LSA community seems to have first used the word “embedding” in Landauer et al. (1997), in a variant of its mathematical meaning as a mapping from one space or mathematical structure to another. In LSA, the word embedding seems to have described the mapping from the space of sparse count vectors to the latent space of SVD dense vectors. Although the word thus originally meant the mapping from one space to another, it has metonymically shifted to mean the resulting dense vector in the latent space. and it is in this sense that we currently use the word.

By the next decade, Bengio et al. (2003) and Bengio et al. (2006) showed that neural language models could also be used to develop embeddings as part of the task of word prediction. Collobert and Weston (2007), Collobert and Weston (2008), and Collobert et al. (2011) then demonstrated that embeddings could be used to represent word meanings for a number of NLP tasks. Turian et al. (2010) compared the value of different kinds of embeddings for different NLP tasks. Mikolov et al. (2011) showed that recurrent neural nets could be used as language models. The idea of simplifying the hidden layer of these neural net language models to create the skip-gram (and also CBOW) algorithms was proposed by Mikolov et al. (2013). The negative sampling training algorithm was proposed in Mikolov et al. (2013a). There are numerous surveys of static embeddings and their parameterizations (Bullinaria and Levy 2007, Bullinaria and Levy 2012, Lapesa and Evert 2014, Kiela and Clark 2014, Levy et al. 2015).

See Manning et al. (2008) for a deeper understanding of the role of vectors in information retrieval, including how to compare queries with documents, more details on tf-idf, and issues of scaling to very large datasets. See Kim (2019) for a clear and comprehensive tutorial on word2vec. Cruse (2004) is a useful introductory linguistic text on lexical semantics.

Exercises

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-001-pages-001-200/images/5baa0649d01c14dd0a1d24b67a9c68974d4beca308ad974e173c6de65a6bd2d6.jpg)


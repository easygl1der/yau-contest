---
title: "Chapter 24 \u2014 Chatbots & Dialogue Systems"
book: "Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models"
book_slug: speech-language-processing
course: natural-language-processing
chapter_number: 24
citekey: jurafsky2026slp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf"
source_transcript: "transcripts/mineru/speech-language-processing/reading.md"
source_line_start: 13008
source_line_end: 13879
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 11
source_empty_image_alt: 11
non_semantic_image_alt: 5
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

# Chapter 24 — Chatbots & Dialogue Systems

> [[../README|本书目录]] · [[23-chapter-23-question-answering|上一章]] · [[25-chapter-25-phonetics|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models（jurafsky2026slp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/speech-language-processing/reading.md)，源行 13008–13879。
> - 本章保留 11 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Chatbots & Dialogue Systems

Les lois de la conversation sont en gen´ eral de ne s’y appesantir sur aucun ob-´ jet, mais de passer leg´ erement, sans effort et sans affectation, d’un sujet\` a un\` autre ; de savoir y parler de choses frivoles comme de choses serieuses´

[The rules of conversation are, in general, not to dwell on any one subject, but to pass lightly from one to another without effort and without affectation; to know how to speak about trivial topics as well as serious ones;]

The 18th C. Encyclopedia of Diderot, start of the entry on conversation

“What ho!” I said.

“What ho!” said Motty.

“What ho! What ho!”

“What ho! What ho! What ho!”

After that it seemed rather difficult to go on with the conversation.”

P.G. Wodehouse, My Man Jeeves

The literature of the fantastic abounds in inanimate objects magically endowed with sentience and the gift of speech. From Ovid’s statue of Pygmalion to Mary Shelley’s Frankenstein, there is something deeply moving about creating something and then

having a chat with it. Legend has it that after finishing his sculpture Moses, Michelangelo thought it so lifelike that he tapped it on the knee and commanded it to speak. Perhaps this shouldn’t be surprising. Language is the mark of humanity and sentience, and conversation or dialogue is the most fundamental and specially privileged arena of language. It is the first kind of language we learn as children, and for most of us, it is the kind of language we most commonly indulge in, whether we are ordering curry for lunch or buying spinach, participating in business meetings or talking with our families, booking airline flights or complaining about the weather.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/96f0fa785aecb561e0a492ec783531d4b1d000aa644a8f1d90f0285159c98e2d.jpg)

This chapter introduces the fundamental algorithms of dialogue systems, or conversational agents. These programs communicate with users in natural language (text, speech, or both), and fall into two classes. Task-oriented dialogue agents use conversation with users to help complete tasks. Dialogue agents in digital assistants (Siri, Alexa, Google Now/Home, Cortana, etc.), give directions, control appliances, find restaurants, or make calls. Conversational agents can answer questions on corporate websites, interface with robots, and even be used for social good: DoNotPay is a “robot lawyer” that helps people challenge incorrect parking fines, apply for emergency housing, or claim asylum if they are refugees. By contrast, chatbots are systems designed for extended conversations, set up to mimic the unstructured conversations or ‘chats’ characteristic of human-human interaction, mainly for entertainment, but also for practical purposes like making task-oriented agents more natural.<sup>1</sup> In Section 24.2 we’ll discuss the three major chatbot architectures: rule-based systems, information retrieval systems, and encoder-decoder generators. In Section 24.3 we turn to task-oriented agents, introducing the frame-based architecture (the GUS architecture) that underlies most task-based systems.

## 24.1 Properties of Human Conversation

Conversation between humans is an intricate and complex joint activity. Before we attempt to design a conversational agent to converse with humans, it is crucial to understand something about how humans converse with each other. Consider some of the phenomena that occur in the conversation between a human travel agent and a human client excerpted in Fig. 24.1.

```txt
C1: ...I need to travel in May.
A2: And, what day in May did you want to travel?
C3: OK uh I need to be there for a meeting that's from the 12th to the 15th.
A4: And you're flying into what city?
C5: Seattle.
A6: And what time would you like to leave Pittsburgh?
C7: Uh hmm I don't think there's many options for non-stop.
A8: Right. There's three non-stops today.
C9: What are they?
A10: The first one departs PGH at 10:00am arrives Seattle at 12:05 their time. The second flight departs PGH at 5:55pm, arrives Seattle at 8pm. And the last flight departs PGH at 8:15pm arrives Seattle at 10:28pm.
C11: OK I'll take the 5ish flight on the night before on the 11th.
A12: On the 11th? OK. Departing at 5:55pm arrives Seattle at 8pm, U.S. Air flight 115.
C13: OK.
A14: And you said returning on May 15th?
C15: Uh, yeah, at the end of the day.
A16: OK. There's #two non-stops ...#
C17: #Act...actually #, what day of the week is the 15th?
A18: It's a Friday.
C19: Uh hmm. I would consider staying there an extra day til Sunday.
A20: OK...OK. On Sunday I have ...
```

$$
\mathrm{A}_{16}
$$

$$
\mathrm{C}_{17}
$$

## Turns

turn A dialogue is a sequence of turns $(\mathbf{C}_{1}, \mathbf{A}_{2}, \mathbf{C}_{3},$ , and so on), each a single contribution from one speaker to the dialogue (as if in a game: I take a turn, then you take a turn, then me, and so on). There are 20 turns in Fig. 24.1. A turn can consist of a sentence (like $\mathrm{C}_{1})$ , although it might be as short as a single word $(\mathbf{C}_{13})$ or as long as multiple sentences $\left(A_{10} \right)$

Turn structure has important implications for spoken dialogue. A system has to know when to stop talking; the client interrupts (in $\mathbf{A}_{16}$ and $\mathbf{C}_{17})$ , so the system must know to stop talking (and that the user might be making a correction). A system also has to know when to start talking. For example, most of the time in conversation, speakers start their turns almost immediately after the other speaker finishes, without a long pause, because people are able to (most of the time) detect when the other person is about to finish talking. Spoken dialogue systems must also detect whether a user is done speaking, so they can process the utterance and respond. This task— called endpointing or endpoint detection— can be quite challenging because of noise and because people often pause in the middle of turns.

## Speech Acts

A key insight into conversation—due originally to the philosopher Wittgenstein (1953) but worked out more fully by Austin (1962)—is that each utterance in a dialogue is a kind of action being performed by the speaker. These actions are commonly called speech acts or dialog acts: here’s one taxonomy consisting of 4 major classes (Bach and Harnish, 1979):

Constatives: committing the speaker to something’s being the case (answering, claiming, confirming, denying, disagreeing, stating)

Directives: attempts by the speaker to get the addressee to do something (advising, asking, forbidding, inviting, ordering, requesting)

Commissives: committing the speaker to some future course of action (promising, planning, vowing, betting, opposing)

Acknowledgments: express the speaker’s attitude regarding the hearer with respect to some social action (apologizing, greeting, thanking, accepting an acknowledgment)

A user asking a person or a dialogue system to do something (‘Turn up the music’) is issuing a DIRECTIVE. Asking a question that requires an answer is also a way of issuing a DIRECTIVE: in a sense when the system says $(\mathbf{A}_{2})$ “what day in May did you want to travel?” it’s as if the system is (very politely) commanding the user to answer. By contrast, a user stating a constraint (like $\mathrm{C}_{1}$ ‘I need to travel in May’) is issuing a CONSTATIVE. A user thanking the system is issuing an ACKNOWLEDGMENT. The speech act expresses an important component of the intention of the speaker (or writer) in saying what they said.

## Grounding

A dialogue is not just a series of independent speech acts, but rather a collective act performed by the speaker and the hearer. Like all collective acts, it’s important for the participants to establish what they both agree on, called the common ground (Stalnaker, 1978). Speakers do this by grounding each other’s utterances. Grounding means acknowledging that the hearer has understood the speaker; like an ACK used to confirm receipt in data communications (Clark, 1996). (People need grounding for non-linguistic actions as well; the reason an elevator button lights up when it’s pressed is to acknowledge that the elevator has indeed been called (Norman, 1988).)

Humans constantly ground each other’s utterances. We can ground by explicitly saying $\mathrm{^{66} OK} '$ , as the agent does in $\mathbf{A}_{8}$ or ${\bf A}_{10}$ . Or we can ground by repeating what the other person says; in utterance $\mathbf{A}_{1}$ the agent repeats “in May”, demonstrating her understanding to the client. Or notice that when the client answers a question, the agent begins the next question with “And”. The “And” implies that the new question is ‘in addition’ to the old question, again indicating to the client that the agent has successfully understood the answer to the last question.

## Subdialogues and Dialogue Structure

Conversations have structure. Consider, for example, the local structure between speech acts discussed in the field of conversational analysis (Sacks et al., 1974). QUESTIONS set up an expectation for an ANSWER. PROPOSALS are followed by ACCEPTANCE (or REJECTION). COMPLIMENTS (“Nice jacket!”) often give rise to DOWNPLAYERS (“Oh, this old thing?”). These pairs, called adjacency pairs are composed of a first pair part and a second pair part (Schegloff, 1968), and these expectations can help systems decide what actions to take.

However, dialogue acts aren’t always followed immediately by their second pair part. The two parts can be separated by a side sequence (Jefferson 1972) or subdialogue. For example utterances $\mathrm{C}_{17}$ to $\mathbf{A}_{20}$ constitute a correction subdialogue (Litman 1985, Litman and Allen 1987, Chu-Carroll and Carberry 1998):

${\mathrm{C}}_{17}{\mathrm{:}}$ #Act. . . actually#, what day of the week is the 15th?

$_{\mathrm{A_{18} :}}$ It’s a Friday.

${\mathrm{C}}_{19}{\mathrm{:}}$ Uh hmm. I would consider staying there an extra day til Sunday.

$\mathrm{A}_{20}{\mathrm{:}}$ OK. . . OK. On Sunday I have . . .

The question in $\mathrm{C}_{17}$ interrupts the prior discourse, in which the agent was looking for a May 15 return flight. The agent must answer the question and also realize that ‘’I would consider staying...til Sunday” means that the client would probably like to change their plan, and now go back to finding return flights, but for the 17th.

Another side sequence is the clarification question, which can form a subdialogue between a REQUEST and a RESPONSE. This is especially common in dialogue systems where speech recognition errors causes the system to have to ask for clarifications or repetitions like the following:

User: What do you have going to UNKNOWN WORD on the 5th?

System: Let’s see, going where on the 5th?

User: Going to Hong Kong.

System: OK, here are some flights...

In addition to side-sequences, questions often have presequences, like the following example where a user starts with a question about the system’s capabilities (“Can you make train reservations”) before making a request.

User: Can you make train reservations?

System: Yes I can.

User: Great, I’d like to reserve a seat on the 4pm train to New York.

## Initiative

Sometimes a conversation is completely controlled by one participant. For example a reporter interviewing a chef might ask questions, and the chef responds. We say that the reporter in this case has the conversational initiative (Walker and Whittaker, 1990). In normal human-human dialogue, however, it’s more common for initiative to shift back and forth between the participants, as they sometimes answer questions, sometimes ask them, sometimes take the conversations in new directions, sometimes not. You may ask me a question, and then I respond asking you to clarify something you said, which leads the conversation in all sorts of ways. We call such interactions mixed initiative (Walker and Whittaker, 1990).

Mixed initiative, while the norm for human-human conversations, is very difficult for dialogue systems to achieve. It’s much easier to design dialogue systems to be passive responders. In the question answering systems we saw in Chapter 23, or in simple search engines, the initiative lies completely with the user. In such userinitiative systems, the user specifies a query, and the systems responds. Then the user can specify another query. Alternatively, you may have had the experience of being stuck in a bad dialogue system that asks a question and gives you no opportunity to do anything until you answer it. Such system-initiative architectures can be very frustrating.

## Inference and Implicature

Inference is also important in dialogue understanding. Consider the client’s response $\mathrm{C}_{2}.$ , repeated here:

$\mathbf{A}_{2} \colon$ And, what day in May did you want to travel?

$\mathrm{C}_{3}{\mathrm{:}}$ OK uh I need to be there for a meeting that’s from the 12th to the 15th.

Notice that the client does not in fact answer the agent’s question. The client merely mentions a meeting at a certain time. What is it that licenses the agent to infer that the client is mentioning this meeting so as to inform the agent of the travel dates?

The speaker seems to expect the hearer to draw certain inferences; in other words, the speaker is communicating more information than seems to be present in the uttered words. This kind of example was pointed out by Grice (1975, 1978) as part of his theory of conversational implicature. Implicature means a particular class of licensed inferences. Grice proposed that what enables hearers to draw these inferences is that conversation is guided by a set of maxims, general heuristics that play a guiding role in the interpretation of conversational utterances. One such maxim is the maxim of relevance which says that speakers attempt to be relevant, they don’t just utter random speech acts. When the client mentions a meeting on the 12th, the agent reasons ‘There must be some relevance for mentioning this meeting. What could it be?’. The agent knows that one precondition for having a meeting (at least before Web conferencing) is being at the place where the meeting is held, and therefore that maybe the meeting is a reason for the travel, and if so, then since people like to arrive the day before a meeting, the agent should infer that the flight should be on the 11th.

These subtle characteristics of human conversations (turns, speech acts, grounding, dialogue structure, initiative, and implicature) are among the reasons it is difficult to build dialogue systems that can carry on natural conversations with humans. Many of these challenges are active areas of dialogue systems research.

## 24.2 Chatbots

The simplest kinds of dialogue systems are chatbots, systems that can carry on extended conversations with the goal of mimicking the unstructured conversations or ‘chats’ characteristic of informal human-human interaction.

These systems often have an entertainment value, such as Facebook’s Blender-Bot, a neural chatbot capable of carrying on the kinds of conversations shown in Fig. 24.2, or Microsoft’s XiaoIce system<sup>2</sup> (Zhou et al., 2020), a system that chats with people on text messaging platforms (Fig. 24.3).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/49025e83003bb5a4444e883863012f4dcc4cc086cd577bc97942c56369855096.jpg)

<table><tr><td>[人类]</td><td>小冰你好</td><td>[Human]</td><td>Hello, XiaoIce.</td></tr><tr><td>[小冰]</td><td>你好呀,你头像好有趣,感觉在哪见过</td><td>[XiaoIce]</td><td>Hello, your profile pic is interesting. Like I’ve seen it somewhere.</td></tr><tr><td>[人类]</td><td>是吗</td><td>[Human]</td><td>Really?</td></tr><tr><td>[小冰]</td><td>提不是哪部动画里的呀</td><td>[XiaoIce]</td><td>Is it a comic character?</td></tr><tr><td>[人类]</td><td>你怎么知道的</td><td>[Human]</td><td>How do you know that?</td></tr><tr><td>[小冰]</td><td>你猜</td><td>[XiaoIce]</td><td>Guess.</td></tr><tr><td>[人类]</td><td>难道你是真人吗?</td><td>[Human]</td><td>Are you human?</td></tr><tr><td>[小冰]</td><td>这个,你和我多聊聊就知道了</td><td>[XiaoIce]</td><td>Well, you’ll know it after chatting with me more.</td></tr><tr><td>[人类]</td><td>你不是人工智能机器人么</td><td>[Human]</td><td>Aren’t you an Al chatbot?</td></tr><tr><td>[小冰]</td><td>是又怎样,我不会冷冰冰的对待你的</td><td>[XiaoIce]</td><td>So what? I won’t be indifferent to you.</td></tr><tr><td>[人类]</td><td>你都有什么功能啊</td><td>[Human]</td><td>What functions do you have?</td></tr><tr><td>[小冰]</td><td>我有200多个skills,来,说出你的需求</td><td>[XiaoIce]</td><td>I have over 200 skills. Just name one you need.</td></tr></table>

Figure 24.3 A sample Chinese conversation from the XiaoIce chatbot with translations (Zhou et al., 2020).  
Yet starting from the very first system, ELIZA (Weizenbaum, 1966), chatbots have also been used for practical purposes like testing theories of psychological

counseling.

Like practically everything else in language processing, chatbot architectures fall into two classes: rule-based systems and corpus-based systems. Rule-based systems include the early influential ELIZA and PARRY systems. Corpus-based systems mine large datasets of human-human conversations, which can be done by using information retrieval to copy a human response from a previous conversation, or using an encoder-decoder system to generate a response from a user utterance.

## 24.2.1 Rule-based chatbots: ELIZA and PARRY

ELIZA (Weizenbaum, 1966) is the most important chatbot dialogue system in the history of the field, and so we take some time here to describe its algorithm in detail. ELIZA was designed to simulate a Rogerian psychologist, based on a branch of clinical psychology whose methods involve drawing the patient out by reflecting patient’s statements back at them. Rogerian psychology is the rare type of conversation in which, as Weizenbaum points out, one can “assume the pose of knowing almost nothing of the real world”. If a patient says “I went for a long boat ride” and the psychiatrist says “Tell me about boats”, you don’t assume she didn’t know what a boat is, but rather assume she had some conversational goal. Most chatbots trying to pass the Turing test choose a domain with similar properties.

Fig. 24.4 shows the most famous ELIZA conversation, in which ELIZA seems to give very sophisticated therapeutic advice, excerpted (deleting some material with ...) from a full interaction given in the original paper (Weizenbaum, 1966).

As we summarized briefly in Chapter 2, ELIZA worked by pattern/transform rules like the following one:

(0 YOU 0 ME) [pattern]

->

(WHAT MAKES YOU THINK I 3 YOU) [transform]

In the ELIZA pattern, 0 means Kleene\*, and in the transform rules the numbers are the index of the constituent in the pattern. Thus the number 3 refers to the second 0 in the first pattern. This rule would transfer

You hate me

into:

## WHAT MAKES YOU THINK I HATE YOU

Each ELIZA pattern/rule is linked to a keyword that might occur in a user sentence. The architecture is summarized in Fig. 24.5.

Keywords are associated with a rank, with specific words being more highly ranked, and more general words ranking lower. Consider the following user sentence:

I know everybody laughed at me

Because it has the word “I”, this sentence could match the following rule whose keyword is I:

(I \*) -> (You say you 2)

producing:

YOU SAY YOU KNOW EVERYBODY LAUGHED AT YOU

But as Weizenbaum points out, “I” is a very general word and its keywords lead to very general responses. Instead the keyword “everybody” is much more interesting, since someone using universals like everybody or always is probably “referring

```txt
Men are all alike.
IN WHAT WAY
They're always bugging us about something or other.
CAN YOU THINK OF A SPECIFIC EXAMPLE
Well my boyfriend made me come here.
YOUR BOYFRIEND MADE YOU COME HERE
He says I'm depressed much of the time.
I AM SORRY TO HEAR YOU ARE DEPRESSED
::
WHO ELSE IN YOUR FAMILY TAKES CARE OF YOU?
My father
YOUR FATHER
You are like my father in some ways.
WHAT RESEMBLANCE DO YOU SEE
You are not very aggressive but I think you don't want me to notice that.
WHAT MAKES YOU THINK I AM NOT AGGRESSIVE
You don't argue with me.
WHY DO YOU THINK I DON'T ARGUE WITH YOU
You are afraid of me.
DOES IT PLEASE YOU TO BELIEVE I'M AFRAID OF YOU
My father is afraid of everybody.
WHAT ELSE COMES TO MIND WHEN YOU THINK OF YOUR FATHER
Bullies.
DOES THAT HAVE ANYTHING TO DO WITH THE FACT THAT YOUR
BOYFRIEND MADE YOU COME HERE
```

Figure 24.4 Sample ELIZA dialogue from Weizenbaum (1966).

```python
function ELIZA GENERATOR(user sentence) returns response
Find the word w in sentence that has the highest keyword rank
    if w exists
    Choose the highest ranked rule r for w that matches sentence
    response ← Apply the transform in r to sentence
    if w = 'my'
    future ← Apply a transformation from the 'memory' rule list to sentence
    Push future onto memory stack
    else (no keyword applies)
    either
    response ← Apply the transform for the NONE keyword to sentence
    or
    response ← Pop the top response from the memory stack
    return(response)
```  
Figure 24.5 A simplified sketch of the ELIZA algorithm. The power of the algorithm comes from the particular transforms associated with each keyword.

to some quite specific event or person”. Therefore, ELIZA prefers to respond with the pattern associated with the more specific keyword everybody (implementing by just assigning “everybody” rank 5 and “I” rank 0 in the lexicon), whose rule thus

transforms the sentence to:

WHO IN PARTICULAR ARE YOU THINKING OF?

If no keyword matches, ELIZA chooses a non-committal response like “PLEASE GO ON”, “THAT’S VERY INTERESTING”, or “I SEE”.

Finally, ELIZA has a clever memory trick that accounts for the very last sentence of the conversation above. Whenever the word “my” is the highest ranked keyword, ELIZA will randomly select a transform on the MEMORY list, apply it to the sentence, and store it on the stack:

(MEMORY MY

(0 MY 0 = LETS DISCUSS FURTHER WHY YOUR 3)

(0 MY 0 = EARLIER YOU SAID YOUR 3)

(0 MY 0 = DOES THAT HAVE ANYTHING TO DO WITH THE FACT THAT YOUR 3

Later, if no keyword matches a sentence, ELIZA will return the top of the MEM-ORY queue instead. <sup>3</sup>

People became deeply emotionally involved with the program. Weizenbaum tells the story of one of his staff who would ask Weizenbaum to leave the room when she talked with ELIZA. When Weizenbaum suggested that he might want to store all the ELIZA conversations for later analysis, people immediately pointed out the privacy implications, which suggested that they were having quite private conversations with ELIZA, despite knowing that it was just software.

ELIZA’s framework is still used today; modern chatbot system tools like ALICE are based on updated versions of ELIZA’s pattern/action architecture.

A few years after ELIZA, another chatbot with a clinical psychology focus, PARRY (Colby et al., 1971), was used to study schizophrenia. In addition to ELIZAlike regular expressions, the PARRY system included a model of its own mental state, with affect variables for the agent’s levels of fear and anger; certain topics of conversation might lead PARRY to become more angry or mistrustful. If PARRY’s anger variable is high, he will choose from a set of “hostile” outputs. If the input mentions his delusion topic, he will increase the value of his fear variable and then begin to express the sequence of statements related to his delusion. Parry was the first known system to pass the Turing test (in 1972!); psychiatrists couldn’t distinguish text transcripts of interviews with PARRY from transcripts of interviews with real paranoids (Colby et al., 1972).

## 24.2.2 Corpus-based chatbots

Corpus-based chatbots, instead of using hand-built rules, mine conversations of human-human conversations. These systems are enormously data-intensive, requiring hundreds of millions or even billions of words for training (Serban et al., 2018).

Available datasets include transcripts of natural spoken conversational corpora, like the Switchboard corpus of American English telephone conversations (Godfrey et al., 1992) or the various CALLHOME and CALLFRIEND telephone conversational corpora in many languages. Many systems also train on movie dialogue, (Danescu-Niculescu-Mizil and Lee 2011, Lison and Tiedemann 2016, inter alia) which resembles natural conversation in many ways (Forchini, 2013).

Datasets have also been created specifically for training dialog systems by hiring crowdworkers to have conversations, often having them take on personas or talk about knowledge provided to them. For example the Topical-Chat dataset has 11K crowdsourced conversations spanning 8 broad topics (Gopalakrishnan et al., 2019), and the EMPATHETICDIALOGUES includes 25K crowdsourced conversations grounded in a specific situation where a speaker was feeling a specific emotion (Rashkin et al., 2019).

All of these datasets, although large, don’t reach the size of billions of words, and so many systems first pretrain on large datasets of pseudo-conversations drawn from Twitter (Ritter et al., 2010), Reddit (Roller et al., 2020), Weibo ( 博), and other social media platforms.

Another common technique is to extract possible responses from knowledge sources (Wikipedia, news stories) so that a chatbot can tell stories or mention facts acquired in that way.

Finally, once a chatbot has been put into practice, the turns that humans use to respond to the chatbot can be used as additional conversational data for training or finetuning. Here it’s important to have confidence metrics to make sure that these turns come from conversations that are going well (Hancock et al., 2019). It’s also crucial in these cases to remove personally identifiable information (PII); see Section 24.6.1.

Most corpus based chatbots produce their responses to a user’s turn in context either by retrieval methods (using information retrieval to grab a response from some corpus that is appropriate given the dialogue context) or generation methods (using a language model or encoder-decoder to generate the response given the dialogue context) In either case, systems mostly generate a single response turn that is appropriate given the entire conversation so far (for conversations that are short enough to fit into a single model’s window). For this reason they are often called response generation systems. Corpus-based chatbot algorithms thus draw on algorithms for question answering systems, which similarly focus on single responses while ignoring longer-term conversational goals.

Response by retrieval The retrieval method of responding is to think of the user’s turn as a query $q,$ and our job is to retrieve and repeat some appropriate turn r as the response from a corpus of conversations C. Generally C is the training set for the system, and we score each turn in C as a potential response to the context q selecting the highest-scoring one. The scoring metric is similarity: we choose the r that is most similar to $q,$ using any of the IR methods we saw in Section 23.1. This can be done using classic IR techniques to compute tf-idf models for C and q, choosing the r that has the highest tf-idf cosine with $q \mathrm{:}$

$$
\operatorname{response}(q, C) = \underset{r \in C}{\operatorname{argmax}} \frac{q \cdot r}{| q | | r |}\tag{24.1}
$$

Or, we can use the neural IR techniques of Section 23.1.5. The simplest of those is a bi-encoder model, in which we train two separate encoders, one to encode the user query and one to encode the candidate response, and use the dot product between these two vectors as the score (Fig. 24.6a). For example to implement this using BERT, we would have two encoders BERT<sub>Q</sub> and $\mathrm{BERT}_{R}$ and we could represent the query and candidate response as the [CLS] token of the respective encoders:

$$
\begin{array}{rcl} h_{q} & = & \text{BERT}_{Q}(\mathbf{q})[\text{CLS}] \\ h_{r} & = & \text{BERT}_{R}(\mathbf{r})[\text{CLS}] \\ \text{response}(q, C) & = & \underset{r \in C}{\operatorname{argmax}} h_{q} \cdot h_{r} \end{array}\tag{24.2}
$$

The IR-based approach can be extended in various ways, such as by using more sophisticated neural architectures (Humeau et al., 2020), or by using a longer context for the query than just the user’s last turn, up to the whole preceding conversation. Information about the user or sentiment or other information can also play a role.

Response by generation An alternate way to use a corpus to generate dialogue is to think of response production as an encoder-decoder task— transducing from the user’s prior turn to the system’s turn. We can think of this as a machine learning version of ELIZA; the system learns from a corpus to transduce a question to an answer. Ritter et al. (2011) proposed early on to think of response generation as a kind of translation, and this idea was generalized to the encoder-decoder model roughly contemporaneously by Shang et al. (2015), Vinyals and Le (2015), and Sordoni et al. (2015).

As we saw in Chapter 11, encoder decoder models generate each token $r_{t}$ of the response by conditioning on the encoding of the entire query q and the response so far $r_{1}...r_{t - 1}$

$$
\hat{r}_{t} = \operatorname{argmax}_{w \in \mathrm{V}} P(w | q, r_{1}...r_{t - 1})\tag{24.3}
$$

Fig. 24.6 shows the intuition of the generator and retriever methods for response generation. In the generator architecture, we normally include a longer context, forming the query not just from the user’s turn but from the entire conversation-sofar. Fig. 24.7 shows an fleshed-out example.

![Figure 24.6](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/b4a00abacb7bdc30e46370dd68d92728c6d58d97bf50cfa37b6566589f79d3a6.jpg)  
Figure 24.6 Two architectures for generating responses for a neural chatbot. In response by retrieval (a) we choose a response by using a finding the turn in the corpus whose encoding has the highest dot-product with the user’s turn. In response by generation (b) we use an encoder-decoder to generate the response.

![Figure 24.7](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/7e4c80d456c1c79b9fb584e8406e6e7559cac21effa0bf1d1f1ec2fc0c1e63ba.jpg)  
Figure 24.7 Example of encoder decoder for dialogue response generation; the encoder sees the entire dialogue context.

A number of modifications are required to the basic encoder-decoder model to adapt it for the task of response generation. For example basic encoder-decoder models have a tendency to produce predictable but repetitive and therefore dull responses like “I’m OK” or “I don’t know” that shut down the conversation. Thus instead of greedily choosing the most likely (and most predictable) response, we can use diversity-enhanced versions of beam search (Vijayakumar et al., 2018), or diversity-focused training objectives (Li et al., 2016). Basic models also tend to produce utterances that are too short; adding minimum length constraints is also important (Roller et al., 2020).

An alternative to the encoder-decoder architecture is to fine-tune a large language model on a conversational dataset and use the language model directly as a response generator. In the Chirpy Cardinal system (Paranjape et al., 2020), for example, the neural chat component generates responses from GPT-2 (Radford et al., 2019), finetuned on the EmpatheticDialogues dataset (Rashkin et al., 2019).

Finally, encoder-decoder response generators focus on generating single responses, and so don’t tend to do a good job of continuously generating responses that cohere across multiple turns. This can be addressed by using reinforcement learning, as well as techniques like adversarial networks, to learn to choose responses that make the overall conversation more natural (Li et al. 2016, Li et al. 2017).

## Response by retrieving and refining knowledge

Chatbots can be much more interesting and informative if they can responses from text knowledge sources other than dialogue. This approach was pioneered early on by the COBOT chatbot (Isbell et al., 2000), which generated responses by selecting sentences from a corpus that combined the Unabomber Manifesto by Theodore Kaczynski, articles on alien abduction, the scripts of “The Big Lebowski” and “Planet of the Apes”. XiaoIce collects sentences from public lectures and news articles and searches them using IR based on query expansion from the user’s turn to respond to turns like “Tell me something about Beijing” (Zhou et al., 2020);

One way to augment the encoder decoder architecture for retrieve and refine is to first use IR to retrieve potentially useful passages from Wikipedia (Yan et al., 2016), and then create multiple candidates by concatenating each retrieved Wikipedia sentence to the dialogue context with a separator token. Each candidate can be given as the encoder context to the encoder-decoder model, which learns to incorporate text from the Wikipedia sentence into its generated response (Dinan et al. 2019, Roller et al. 2020).

The language model approach to generation can also make use of external knowledge sources, by giving these same knowledge+dialogue context candidates can be given to a language model like GPT-2 finetuned on conversational corpora to generate a knowledge-aware response (Paranjape et al., 2020).

## 24.2.3 Hybrid architectures

Chatbots can also be built with architectures that are hybrids of the rule-based and neural/corpus architectures, and even use elements of the frame-based structure we describe below. This is common, for example, for systems competing in the Alexa Prize challenge, in which university teams build social chatbots to converse with volunteers on the Amazon Alexa platform, and are scored based on the length and user ratings of their conversations (Ram et al., 2017).

For example the Chirpy Cardinal system (Paranjape et al., 2020) applies an NLP pipeline that includes Wikipedia entity linking (Section 23.3), user intent classification, and dialogue act classification (to be defined below in Section 24.4.1), The intent classification is used when the user wants to change the topic, and the entity linker specifies what entity is currently being discussed. Dialogue act classification is used to detect when the user is asking a question or giving an affirmative versus negative response.

Bot responses are generated by a series of response generators. Some response generators use fine-tuned neural language models: a GPT-2 (Radford et al., 2019) language model fine-tuned on the EmpatheticDialogues dataset, and a separately fine-tuned GPT-2 language model that learns in fine-tuning to paraphrase content from Wikipedia in response to questions.

Other response generators are closer to rule-based; the movie or music generators produce scripted conversation about a movie or a musician, such as asking asks the user’s opinion about a movie, giving a fun fact, asks the user their opinion on an actor in the movie, and so on. These generators use regexes and sentiment classifiers to classify user responses and handwritten templates to generate bot utterances.

Each response generators can specify a priority, and a ranker is used to pass control between response generators. Fig. 24.8 shows part of a conversation.

<table><tr><td>#</td><td>Utterance</td><td>Entity</td><td>Commentary</td></tr><tr><td>1</td><td>User: let&#x27;s chatBot: Hi, this is an Alexa Prize Socialbot. I&#x27;d love to get to know you a bit better before we chat! Is it all right if I ask for your name? [Launch]</td><td>NoneNone</td><td>Launch gives FORCE_START response to begin the conversation.</td></tr><tr><td>2</td><td>User: my name is chrisBot: Well it&#x27;s nice to meet you, Chris! I&#x27;m excited to chat with you today. [Launch] I hope your afternoon is going well. What are your plans for the rest of today? [Neural Chat]</td><td>NoneNone</td><td>Launch gives a STRONG_CONTINUE response that needs a prompt, which is supplied by Neural Chat with FORCE_START priority (scripted transition).</td></tr><tr><td>3</td><td>User: hang out with my friendsBot: That sounds great, I love spending time with friends. What will you do together? [Neural Chat]</td><td>NoneNone</td><td>Neural Chat generates a GPT-2 response with STRONG_CONTINUE priority.</td></tr><tr><td>4</td><td>User: maybe watch a movieBot: Me too! I love watching movies; I get to learn so much about what the world is like outside of the cloud! Have you seen any movies recently? [Movies]</td><td>NoneFilm</td><td>Movies detects the ‘movie’ keyword in the user’s utterance and gives a FORCE_START response (overriding Neural Chat), setting current entity to Film.</td></tr><tr><td>5</td><td>User: i saw the matrixBot: Nice! Did you like The Matrix? [Movies]</td><td>The MatrixThe Matrix</td><td></td></tr><tr><td>6</td><td>User: i loved it neo is amazingBot: Oooh, yeah, I agree. Hey, isn’t Keanu Reeves in that movie? What do you think about Keanu Reeves? [Movies]</td><td>The MatrixKeanu Reeves</td><td>Movies sets current entity to Keanu Reeves.</td></tr><tr><td>7</td><td>User: i want to talk about something else</td><td>None</td><td>Navigational Intent detects negative intent, so Entity Tracker rejects the current entity.</td></tr></table>

<sup>some</sup>Figure 24.8 <sup>ng</sup> <sup>else</sup> <sup>I</sup> <sup>wanted</sup> <sup>to</sup> <sup>ask</sup> <sup>you</sup> <sup>about.</sup> <sup>What’s Categories</sup> <sup>gives</sup> <sup>a</sup> <sup>GENERIC</sup> <sup>prompt.</sup>Part of a conversation with Chirpy Cardinal (Paranjape et al., 2020).

## hear why you like cats? [ Opinion ]24.3 GUS: Simple Frame-based Dialogue Systems

ing about cat? [ Wiki ]We turn now to task-based dialogue, in which a dialogue system has the goal of <sub>I know you feel frustrated. I’m always trying Musical in- Offensive User gives a FORCE\_START re-</sub>helping a user solve some task like making an airplane reservation or buying a prod-<sup>to</sup> <sup>get</sup> <sup>better.</sup> <sup>[</sup> <sup>Offensive</sup> <sup>User</sup> <sup>]</sup> <sup>I’ve</sup> <sup>been</sup> <sup>listening sponse</sup> <sup>to</sup> <sup>the</sup> <sup>critical</sup> <sup>utterance,</sup> <sup>then</sup> <sup>[</sup> <sup>Music</sup> <sup>]</sup>uct. In this section we introduce the very simple GUS architecture for task-based <sup>instruments.</sup> <sup>If</sup> <sup>you</sup> <sup>were</sup> <sup>a</sup> <sup>musical</sup> <sup>instrument</sup> <sup>which versation</sup> <sup>in</sup> <sup>a</sup> <sup>new</sup> <sup>direction.</sup>dialogue. Although it is quite old, (it was first introduced in 1977 in the influen-<sup>11</sup> <sup>User:</sup> <sup>what</sup> <sup>do</sup> <sup>you</sup> <sup>find</sup> <sup>interesting</sup> <sup>None</sup> <sup>The</sup> <sup>user</sup> <sup>gives</sup> <sup>an</sup> <sup>unexpected</sup> <sup>response.</sup>tial GUS system for travel planning (Bobrow et al., 1977)) the GUS architecture music player. [ Neural Fallback ] I remember you Matrix) sponse, which is selected as no other RG (ex-has been astonishingly long-lived and underlies most if not all modern commercial it? [ Wiki ] CONTEXTUAL prompt.digital assistants. Figure 24.9 shows a conversation with the original GUS system.

Matrix)All modern task-based dialogue systems, whether the simple GUS architecture are some adventures that you’ve enjoyed? [ Wiki ] Matrix) movie characters) about Neo (The Matrix).we describe here, or the more sophisticated dialogue state architectures we turn to Matrix)in the following section, are based around frames. A frame is a kind of knowledge cue Morpheus from a building protected by armed (The 2 conversational paraphrasing model), sets thestructure representing the kinds of intentions the system can extract from user senamazing things! What are some of your favorite      asks another open-ended question.tences, and consists of a collection of slots, each of which can take a set of possible values. Together this set of frames is sometimes called a domain ontology.

Figure 24.10 A frame in a frame-based dialogue system, showing the type of each slot and a question used to fill the slot.

<table><tr><td>GUS:</td><td>Hello. My name is GUS. I can help you plan a simple trip by air. Where do you want to go ?</td></tr><tr><td>Client:</td><td>I want to go to San Diego on May 28</td></tr><tr><td>GUS:</td><td>What time do you want to leave?</td></tr><tr><td>Client:</td><td>I must be in San Diego before 10 am</td></tr><tr><td>GUS:</td><td>Would you like P.S.A. flight 102 that arrives at 9.15 am ?</td></tr><tr><td>Client:</td><td>What is the next flight ?</td></tr><tr><td>GUS:</td><td>Air California flight 310 that leaves at 8.30am and arrives at 10.00am</td></tr><tr><td>Client:</td><td>I&#x27;ll take the first one</td></tr><tr><td>GUS:</td><td>In what name should I make a reservation, please?</td></tr><tr><td>Client:</td><td>Dan Bobrow</td></tr><tr><td>GUS:</td><td>I have confirmed the following flight: P.S.A. flight 102 on Wednesday May 28 from San Jose to San Diego that leaves at 7.30 am and arrives at 9.15 am.</td></tr><tr><td>GUS:</td><td>What date do you want to return on ?</td></tr><tr><td>Client:</td><td>On Friday in the evening.</td></tr><tr><td>GUS:</td><td>Would you like the flight that leaves at 7.45 pm ?</td></tr><tr><td>Client:</td><td>That&#x27;s fine.</td></tr><tr><td>GUS:</td><td>I have confirmed the following flight: P.S.A. flight 307 on Friday May 30 from San Diego to San Jose that leaves at 7.45 pm and arrives at 9.30 pm Thank you for calling. Goodbye</td></tr></table>

Figure 24.9 The travel domain: A transcript of an actual dialogue with the GUS system of Bobrow et al. (1977). P.S.A. and Air California were airlines of that period.

The set of slots in a task-based dialogue frame specifies what the system needs to know, and the filler of each slot is constrained to values of a particular semantic type. In the travel domain, for example, a slot might be of type city (hence take on values like San Francisco, or Hong Kong) or of type date, airline, or time.

<table><tr><td>Slot</td><td>Type</td><td>Question Template</td></tr><tr><td>ORIGIN CITY</td><td>city</td><td>“From what city are you leaving?”</td></tr><tr><td>DESTINATION CITY</td><td>city</td><td>“Where are you going?”</td></tr><tr><td>DEPARTURE TIME</td><td>time</td><td>“When would you like to leave?”</td></tr><tr><td>DEPARTURE DATE</td><td>date</td><td>“What day would you like to leave?”</td></tr><tr><td>ARRIVAL TIME</td><td>time</td><td>“When do you want to arrive?”</td></tr><tr><td>ARRIVAL DATE</td><td>date</td><td>“What day would you like to arrive?”</td></tr></table>

Types in GUS, as in modern frame-based dialogue agents, have hierarchical structure; for example the date type in GUS is itself a frame with slots with types like integer or members of sets of weekday names:

## DATE

MONTH:NAME YEAR:INTEGER DAY:(BOUNDED-INTEGER 1 31)

WEEKDAY:(MEMBER (Sunday Monday Tuesday Wednesday Thursday Friday Saturday))

## 24.3.1 Control structure for frame-based dialogue

The control architecture for frame-based dialogue systems, used in various forms in modern systems like Apple’s Siri, Amazon’s Alexa, and the Google Assistant, is designed around the frame. The system’s goal is to fill the slots in the frame with the fillers the user intends, and then perform the relevant action for the user (answering a question, or booking a flight).

To do this, the system asks questions of the user (using pre-specified question templates associated with each slot of each frame, as shown in Fig. 24.10), filling any slot that the user specifies (we’ll describe how slot-filling works in the next section). If a user’s response fills multiple slots, like the following:

## (24.4) I want a flight from San Francisco to Denver one way leaving after five p.m. on Tuesday.

the system fills all the relevant slots, and then continues asking questions to fill the remaining slots, skipping questions associated with filled slots. The GUS architecture also has condition-action rules attached to slots. For example, a rule attached to the DESTINATION slot for the plane booking frame, once the user has specified the destination, might automatically enter that city as the default StayLocation for the related hotel booking frame. Or if the user specifies the DESTINATION DAY for a short trip the system could automatically enter the ARRIVAL DAY.

Many domains require multiple frames. Besides frames for car or hotel reservations, we might need frames with general route information (for questions like Which airlines fly from Boston to San Francisco?), or information about airfare practices (for questions like Do I have to stay a specific number of days to get a decent airfare?). The system must be able to disambiguate which slot of which frame a given input is supposed to fill and then switch dialogue control to that frame.

Because of this need to dynamically switch control, the GUS architecture is a production rule system. Different types of inputs cause different productions to fire, each of which can flexibly fill in different frames. The production rules can then switch control according to factors such as the user’s input and some simple dialogue history like the last question that the system asked.

Once the system has enough information it performs the necessary action (like querying a database of flights) and returns the result to the user.

## 24.3.2 Natural language understanding for filling slots in GUS

The goal of the natural language understanding component in the frame-based architecture is to extract three things from the user’s utterance. The first task is domain classification: is this user for example talking about airlines, programming an alarm clock, or dealing with their calendar? Of course this 1-of-n classification tasks is unnecessary for single-domain systems that are focused on, say, only calendar management, but multi-domain dialogue systems are the modern standard. The second is user intent determination: what general task or goal is the user trying to accomplish? For example the task could be to Find a Movie, or Show a Flight, or Remove a Calendar Appointment. Finally, we need to do slot filling: extract the particular slots and fillers that the user intends the system to understand from their utterance with respect to their intent. From a user utterance like this one:

Show me morning flights from Boston to San Francisco on Tuesday a system might want to build a representation like:

DOMAIN: AIR-TRAVEL

INTENT: SHOW-FLIGHTS

ORIGIN-CITY: Boston

ORIGIN-DATE: Tuesday

ORIGIN-TIME: morning

DEST-CITY: San Francisco

while an utterance like

```txt
Wake me tomorrow at 6
```

should give an intent like this:

```txt
DOMAIN: ALARM-CLOCK
INTENT: SET-ALARM
TIME: 2017-07-01 0600-0800
```

The slot-filling method used in the original GUS system, and still quite common in industrial applications, is to use handwritten rules, often as part of the conditionaction rules attached to slots or concepts. For example we might just define a regular expression for recognizing the SET-ALARM intent:

```txt
wake me (up) | set (the|an) alarm | get me up
```

Rule-based research systems like the Phoenix system (Ward and Issar, 1994) consist of large hand-designed semantic grammars with thousands of rules. A semantic grammar is a context-free grammar in which the left-hand side of each rule corresponds to the semantic entities being expressed (i.e., the slot names) as in the following fragment:

```txt
SHOW → show me | i want | can i see|...
DEPART_TIME_RANGE → (after|around|before) HOUR |
morning | afternoon | evening
HOUR → one|two|three|four...|twelve (AMPM)
FLIGHTS → (a) flight | flights
AMPM → am | pm
ORIGIN → from CITY
DESTINATION → to CITY
CITY → Boston | San Francisco | Denver | Washington
```

Semantic grammars can be parsed by any CFG parsing algorithm (see Chapter 13), resulting in a hierarchical labeling of the input string with semantic node labels, as shown in Fig. 24.11.

![Figure 24.11](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/e3b9ff07cecc317d788fe83a960530b92fc7f3fe8e487ddd9b5608ec37d83352.jpg)  
Figure 24.11 A semantic grammar parse for a user sentence, using slot names as the internal parse tree nodes.

It remains only to put the fillers into some sort of canonical form, for example by normalizing dates as discussed in Chapter 17.

Many industrial dialogue systems employ the GUS architecture but use supervised machine learning for slot-filling instead of these kinds of rules; see Section 24.4.2.

## 24.3.3 Other components of frame-based dialogue

The ASR (automatic speech recognition) component takes audio input from a phone or other device and outputs a transcribed string of words, as discussed in Chapter 26.

The ASR component can also be made dependent on the dialogue state. For example, if the system has just asked the user “What city are you departing from?”, the ASR language model component can be constrained to assign high probability to answers with city names. This can be done by training a language model on answers to this question, or by hand-writing finite-state or context-free grammars for such sentences. A language model that is completely dependent on dialogue state is called a restrictive grammar; usually real systems mix restrictive grammars with more general language models.

The natural language generation module of any dialogue system produces the utterances that the system says to the user. Frame-based systems tend to use template-based generation, in which all or most of the words in the sentence to be uttered to the user are prespecified by the dialogue designer. Sentences created by these templates are often called prompts. Templates might be completely fixed (like ‘Hello, how can I help you?’), or can include some variables that are filled in by the generator, as in the following:

What time do you want to leave CITY-ORIG?

Will you return to CITY-ORIG from CITY-DEST?

It’s possible to do some simple grounding even in templated generation. Consider the unnaturalness of this example from Cohen et al. (2004):

(24.5) System: Did you want to review some more of your personal profile?

Caller: No.

System: What’s next?

Without an acknowledgment, the caller doesn’t know that the system has understood her ‘No’. The use of Okay below adds grounding to the templated response What’s next?, making (24.6) a much more natural response than (24.5):

(24.6) System: Did you want to review some more of your personal profile? Caller: No.

System: Okay, what’s next?

The rule-based GUS approach is very common in industrial applications. As was true with the rule-based approach to information extraction, it has the advantage of high precision, and if the domain is narrow enough and experts are available, can provide sufficient coverage as well. On the other hand, the handwritten rules or grammars can be both expensive and slow to create, and handwritten rules can suffer from recall problems.

## 24.4 The Dialogue-State Architecture

Modern research systems for task-based dialogue are based on a more sophisticated version of the frame-based architecture called the dialogue-state or belief-state architecture. Figure 24.12 shows the six components of a typical dialogue-state system. The speech recognition and synthesis components deal with spoken language processing; we’ll return to them in Chapter 26.

For the rest of this chapter we therefore consider the other four components, which are part of both spoken and textual dialogue systems. These four components are more complex than in the simple GUS systems. For example, like the GUS systems, the dialogue-state architecture has an NLU component to extract slot fillers from the user’s utterance, but generally using machine learning rather than rules. The dialogue state tracker maintains the current state of the dialogue (which include the user’s most recent dialogue act, plus the entire set of slot-filler constraints the user has expressed so far). The dialogue policy decides what the system should do or say <sup>and</sup> <sup>outputs</sup> <sup>its</sup> <sup>estimate</sup> <sup>of</sup> <sup>the</sup> <sup>current</sup> <sup>dialog</sup> <sup>state</sup> <sup>–</sup> <sup>for</sup> <sup>example,</sup> <sup>in</sup> <sup>a</sup> <sup>restaurant</sup><sub>next.</sub> <sub>The</sub> <sub>dialogue</sub> <sub>policy</sub> <sub>in</sub> <sub>GUS</sub> <sub>was</sub> <sub>simple:</sub> <sub>ask</sub> <sub>questions</sub> <sub>until</sub> <sub>the</sub> <sub>frame</sub> <sub>was</sub> <sub>full</sub> and then report back the results of some database query. But a more sophisticated <sup>ion</sup> <sup>they</sup> <sup>are</sup> <sup>seeking</sup> <sup>such</sup> <sup>as</sup> <sup>the</sup> <sup>phone</sup> <sup>number</sup> <sup>of</sup> <sup>a</sup> <sup>restaurant,</sup> <sup>and</sup> <sup>which</sup> <sup>concepts</sup>dialogue policy can help a system decide when to answer the user’s questions, when <sup>ed</sup> <sup>vs.</sup> <sup>confirmed.</sup> <sup>Dialog</sup> <sup>state</sup> <sup>tracking</sup> <sup>is</sup> <sup>difficult</sup> <sup>because</sup> <sup>ASR</sup> <sup>and</sup> <sup>SLU</sup> <sup>errors</sup> <sup>are</sup>to instead ask the user a clarification question, when to make a suggestion, and so on. <sup>can</sup> <sup>cause</sup> <sup>the</sup> <sup>system</sup> <sup>to</sup> <sup>misunderstand</sup> <sup>the</sup> <sup>user.</sup> <sup>At</sup> <sup>the</sup> <sup>same</sup> <sup>time,</sup> <sup>state</sup> <sup>tracking</sup> <sup>is</sup>Finally, dialogue state systems have a natural language generation component. In e the dialog policy relies on the estimated dialog state to choose actions – for example,<sub>GUS,</sub> <sub>the</sub> <sub>sentences</sub> <sub>that</sub> <sub>the</sub> <sub>generator</sub> <sub>produced</sub> <sub>were</sub> <sub>all</sub> <sub>from</sub> <sub>pre-written</sub> <sub>templates.</sub> <sup>ants</sup> <sup>to</sup> <sup>suggest.</sup>But a more sophisticated generation component can condition on the exact context rature, numerous methods for dialog state tracto produce turns that seem much more natural.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/5a2fd8be7c469b2acb994a62299a974af02bc3cccacc5cc0441c02d761976d42.jpg)  
<sub>Figure 1: Principal components of a spoken dialog system.</sub>Figure 24.12 Architecture of a dialogue-state system for task-oriented dialogue from Williams et al. (2016).

n Section 3; illustrative examples include hand-crafted rules (Larsson and Traum,As of the time of this writing, most commercial system are architectural hybrids, and Rudnicky, 2003), heuristic scores (Higashinaka et al., 2003), Bayesian networksbased on GUS architecture augmented with some dialogue-state components, but rvitz, 2000; Williams and Young, 2007), and discriminative models (Bohus and Rud-there are a wide variety of dialogue-state systems being developed in research labs.

## 24.4.1 Dialogue Acts

<sup>(Young</sup> <sup>et</sup> <sup>al.,</sup> <sup>2010;</sup> <sup>Thomson</sup> <sup>and</sup> <sup>Young,</sup> <sup>2010).</sup>Dialogue-state systems make use of dialogue acts. Dialogue acts represent the inis progress, direct comparisons between methods have not been possible because pastteractive function of the turn or sentence, combining the idea of speech acts and fferent domains and different system components for ASR, SLU, dialog policy, etc.grounding into a single representation. Different types of dialogue systems require re has not been a standard task or methodology for evaluating dialog state tracking.labeling different kinds of acts, and so the tagset—defining what a dialogue act is e issues have limited progress in this research area.exactly— tends to be designed for particular tasks.

<sub>tate Tracking Challenge (DSTC) series has provided a first common testbed and</sub>Figure 24.13 shows a tagset for a restaurant recommendation system, and Fig. 24.14 te for dialog state tracking. Three instances of the DSTC have been run over a three<sup>shows</sup> <sup>these</sup> <sup>tags</sup> <sup>labeling</sup> <sup>a</sup> <sup>sample</sup> <sup>dialogue</sup> <sup>from</sup> <sup>the</sup> <sup>HIS</sup> <sup>system</sup> <sup>(Young</sup> <sup>et</sup> <sup>al.,</sup> 2010). This example also shows the content of each dialogue acts, which are the slot fillers being communicated. So the user might INFORM the system that they want Italian food near a museum, or CONFIRM with the system that the price is reasonable.

<table><tr><td>Tag</td><td>Sys</td><td>User</td><td>Description</td></tr><tr><td>HELLO(a=x,b=y,...)</td><td>√</td><td>√</td><td>Open a dialogue and give info a=x,b=y,...</td></tr><tr><td>INFORM(a=x,b=y,...)</td><td>√</td><td>√</td><td>Give info a=x,b=y,...</td></tr><tr><td>REQUEST(a,b=x,...)</td><td>√</td><td>√</td><td>Request value for a given b=x,...</td></tr><tr><td>REQALTS(a=x,...)</td><td> $\chi$ </td><td>√</td><td>Request alternative with a=x,...</td></tr><tr><td>CONFIRM(a=x,b=y,...)</td><td>√</td><td>√</td><td>Explicitly confirm a=x,b=y,...</td></tr><tr><td>CONFREQ(a=x,...,d)</td><td>√</td><td> $\chi$ </td><td>Implicitly confirm a=x,... and request value of d</td></tr><tr><td>SELECT(a=x,a=y)</td><td>√</td><td> $\chi$ </td><td>Implicitly confirm a=x,... and request value of d</td></tr><tr><td>AFFIRM(a=x,b=y,...)</td><td>√</td><td>√</td><td>Affirm and give further info a=x,b=y,...</td></tr><tr><td>NEGATE(a=x)</td><td> $\chi$ </td><td>√</td><td>Negate and give corrected value a=x</td></tr><tr><td>DENY(a=x)</td><td> $\chi$ </td><td>√</td><td>Deny that a=x</td></tr><tr><td>BYE()</td><td>√</td><td>√</td><td>Close a dialogue</td></tr></table>

<table><tr><td>Utterance</td><td>Dialogue act</td></tr><tr><td>U: Hi, I am looking for somewhere to eat.</td><td>hello(task = find,type=restaurant)</td></tr><tr><td>S: You are looking for a restaurant. What type of food do you like?</td><td>confreq(type = restaurant, food)</td></tr><tr><td>U: I&#x27;d like an Italian somewhere near the museum.</td><td>inform(food = Italian, near=museum)</td></tr><tr><td>S: Roma is a nice Italian restaurant near the museum.</td><td>inform(name = &quot;Roma&quot;, type = restaurant, food = Italian, near = museum)</td></tr><tr><td>U: Is it reasonably priced?</td><td>confirm(pricerange = moderate)</td></tr><tr><td>S: Yes, Roma is in the moderate price range.</td><td>affirm(name = &quot;Roma&quot;, pricerange = moderate)</td></tr><tr><td>U: What is the phone number?</td><td>request(phone)</td></tr><tr><td>S: The number of Roma is 385456.</td><td>inform(name = &quot;Roma&quot;, phone = &quot;385456&quot;)</td></tr><tr><td>U: Ok, thank you goodbye.</td><td>bye()</td></tr></table>

Figure 24.14 A sample dialogue from the HIS System of Young et al. (2010) using the dialogue acts in Fig. 24.13.

## 24.4.2 Slot Filling

The task of slot-filling, and the simpler tasks of domain and intent classification, are special cases of the task of supervised semantic parsing discussed in Chapter 16, in which we have a training set that associates each sentence with the correct set of slots, domain, and intent.

A simple method is to train a a sequence model to map from input words representation to slot fillers, domain and intent. For example given the sentence:

## I want to fly to San Francisco on Monday afternoon please

we compute a sentence representation, for example by passing the sentence through a contextual embedding network like BERT. The resulting sentence representation can be passed through a feedforward layer and then a simple 1-of-N classifier to determine that the domain is AIRLINE and and the intent is SHOWFLIGHT.

Our training data is sentences paired with sequences of BIO labels:

<table><tr><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>B-DES</td><td>I-DES</td><td>0</td><td>B-DEPTIME</td><td>I-DEPTIME</td><td>0</td></tr><tr><td colspan="6">I want to fly to San</td><td>Francisco on</td><td>Monday</td><td>afternoon</td><td>please</td><td></td></tr></table>

Recall from Chapter 8 that in BIO tagging we introduce a tag for the beginning (B) and inside (I) of each slot label, and one for tokens outside (O) any slot label. The number of tags is thus 2n + 1 tags, where n is the number of slots.

Fig. 24.15 shows the architecture. The input is a series of words $w_{1}...w_{n},$ which is passed through a contextual embedding model to get contextual word representations. This is followed by a feedforward layer and a softmax at each token position over possible BIO tags, with the output a series of BIO tags $s_{1}...s_{n}$ . We can also combine the domain-classification and intent-extraction tasks with slot-filling simply by adding a domain concatenated with an intent as the desired output for the final EOS token.

![Figure 24.15](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/b81e0e978234ee7978897bcfb818b60fa141c5127849ec89fdd1f5f4ad9897c2.jpg)  
Figure 24.15 A simple architecture for slot filling, mapping the words in the input through contextual embeddings like BERT to an output classifier layer (which can be linear or something more complex), followed by softmax to generate a series of BIO tags (and including a final state consisting of a domain concatenated with an intent).

Once the sequence labeler has tagged the user utterance, a filler string can be extracted for each slot from the tags (e.g., “San Francisco”), and these word strings can then be normalized to the correct form in the ontology (perhaps the airport code ‘SFO’). This normalization can take place by using homonym dictionaries (specifying, for example, that SF, SFO, and San Francisco are the same place).

In industrial contexts, machine learning-based systems for slot-filling are often bootstrapped from GUS-style rule-based systems in a semi-supervised learning manner. A rule-based system is first built for the domain, and a test set is carefully labeled. As new user utterances come in, they are paired with the labeling provided by the rule-based system to create training tuples. A classifier can then be trained on these tuples, using the test set to test the performance of the classifier against the rule-based system. Some heuristics can be used to eliminate errorful training tuples, with the goal of increasing precision. As sufficient training samples become available the resulting classifier can often outperform the original rule-based system (Suendermann et al., 2009), although rule-based systems may still remain higherprecision for dealing with complex cases like negation.

## 24.4.3 Dialogue State Tracking

The job of the dialogue-state tracker is to determine both the current state of the frame (the fillers of each slot), as well as the user’s most recent dialogue act. The dialogue-state thus includes more than just the slot-fillers expressed in the current sentence; it includes the entire state of the frame at this point, summarizing all of the user’s constraints. The following example from Mrksiˇ c et al. (2017)´ shows the required output of the dialogue state tracker after each turn:

User: I’m looking for a cheaper restaurant

inform(price=cheap)

System: Sure. What kind - and where?

User: Thai food, somewhere downtown

inform(price=cheap, food=Thai, area=centre)

System: The House serves cheap Thai food

User: Where is it?

inform(price=cheap, food=Thai, area=centre); request(address)

System: The House is at 106 Regent Street

Since dialogue acts place some constraints on the slots and values, the tasks of dialogue-act detection and slot-filling are often performed jointly. Consider the task of determining that

## I’d like Cantonese food near the Mission District

has the structure

## inform(food=cantonese,area=mission).

Dialogue act interpretation—in this example choosing inform from the set of dialogue acts for this task—is done by supervised classification trained on handlabeled dialog acts, predicting the dialogue act tag based on embeddings representing the current input sentence and the prior dialogue acts.

The simplest dialogue state tracker might just take the output of a slot-filling sequence-model (Section 24.4.2) after each sentence. Alternatively, a more complex model can make use of the reading-comprehension architectures from Chapter 23. For example the model of Gao et al. (2019) trains a classifier for each slot to decide whether its value is being changed in the current sentence or should be carried over from the previous sentences. If the slot value is being changed, a span-prediction model is used to predict the start and end of the span with the slot filler.

## A special case: detecting correction acts

Some dialogue acts are important because of their implications for dialogue control. If a dialogue system misrecognizes or misunderstands an utterance, the user will generally correct the error by repeating or reformulating the utterance. Detecting these user correction acts is therefore quite important. Ironically, it turns out that corrections are actually harder to recognize than normal sentences! In fact, corrections in one early dialogue system (the TOOT system) had double the ASR word error rate of non-corrections (Swerts et al., 2000)! One reason for this is that speakers sometimes use a specific prosodic style for corrections called hyperarticulation, in which the utterance contains exaggerated energy, duration, or F0 contours, such as I said BAL-TI-MORE, not Boston (Wade et al. 1992, Levow 1998, Hirschberg et al. 2001). Even when they are not hyperarticulating, users who are frustrated seem to speak in a way that is harder for speech recognizers (Goldberg et al., 2003).

What are the characteristics of these corrections? User corrections tend to be either exact repetitions or repetitions with one or more words omitted, although they may also be paraphrases of the original utterance. (Swerts et al., 2000). Detecting these reformulations or correction acts can be part of the general dialogue act detection classifier. Alternatively, because the cues to these acts tend to appear in different ways than for simple acts (like INFORM or request), we can make use of features orthogonal to simple contextual embedding features; some typical features are shown below (Levow 1998, Litman et al. 1999, Hirschberg et al. 2001, Bulyko et al. 2005, Awadallah et al. 2015):

<table><tr><td>features</td><td>examples</td></tr><tr><td>lexical</td><td>words like “no”, “correction”, “I don’t”, swear words, utterance length</td></tr><tr><td>semantic</td><td>similarity (word overlap or embedding dot product) between the candidate correction act and the user’s prior utterance</td></tr><tr><td>phonetic</td><td>phonetic overlap between the candidate correction act and the user’s prior utterance (i.e. “WhatsApp” may be incorrectly recognized as “What’s up”)</td></tr><tr><td>prosodic</td><td>hyperarticulation, increases in F0 range, pause duration, and word duration, generally normalized by the values for previous sentences</td></tr><tr><td>ASR</td><td>ASR confidence, language model probability</td></tr></table>

## 24.4.4 Dialogue Policy

The goal of the dialogue policy is to decide what action the system should take next, that is, what dialogue act to generate.

More formally, at turn i in the conversation we want to predict which action A<sub>i</sub> to take, based on the entire dialogue state. The state could mean the entire sequence of dialogue acts from the system (A) and from the user (U), in which case the task would be to compute:

$$
\hat{A}_{i} = \underset{A_{i} \in A}{\operatorname{argmax}} P(A_{i} |(A_{1}, U_{1},..., A_{i - 1}, U_{i - 1})\tag{24.7}
$$

We can simplify this by maintaining as the dialogue state mainly just the set of slot-fillers that the user has expressed, collapsing across the many different conversational paths that could lead to the same set of filled slots.

Such a policy might then just condition on the current dialogue state as represented just by the current state of the frame Frame (which slots are filled and with what) and the last turn by the system and user:

$$
\hat{A}_{i} = \underset{A_{i} \in A}{\operatorname{argmax}} P(A_{i} | \text{Frame}_{i - 1}, A_{i - 1}, U_{i - 1})\tag{24.8}
$$

These probabilities can be estimated by a neural classifier using neural representations of the slot fillers (for example as spans) and the utterances (for example as sentence embeddings computed over contextual embeddings)

More sophisticated models train the policy via reinforcement learning. To decide which action to take, a reinforcement learning system gets a reward at the end of the dialogue, and uses that reward to train a policy to take actions. For example in the movie-recommendation dialogue system of Fazel-Zarandi et al. (2017), the action space has only three actions: EXECUTE, CONFIRM, and ELICIT. The EXECUTE sends a query to the database and answers the user’s question, CONFIRM clarifies the intent or slot with the users (e.g., “Do you want movies directed by Christopher Nolan?”) while ELICIT asks the user for missing information (e.g., “Which movie are you talking about?”). The system gets a large positive reward if the dialogue system terminates with the correct slot representation at the end, a large negative reward if the slots are wrong, and a small negative reward for confirmation and elicitation questions to keep the system from re-confirming everything.

## Policy Example: Confirmation and Rejection

Modern dialogue systems often make mistakes. It is therefore important for dialogue systems to make sure that they have achieved the correct interpretation of the user’s input. This is generally done by two methods: confirming understandings with the user and rejecting utterances that the system is likely to have misunderstood.

As we saw in the prior section, most systems introduce particular strategies and actions related to confirmation and rejection. When using the explicit confirmation strategy, a system asks the user a direct question to confirm the system’s understanding, like the two examples below in which the system asks a (boldface) yes-no confirmation question:

S: Which city do you want to leave from?

U: Baltimore.

S: Do you want to leave from Baltimore?

U: Yes.

U: I’d like to fly from Denver Colorado to New York City on September twenty first in the morning on United Airlines

S: Let’s see then. I have you going from Denver Colorado to New York on September twenty first. Is that correct?

U: Yes

When using the implicit confirmation strategy, a system instead can demonstrate its understanding as a grounding strategy, for example repeating back the system’s understanding as part of asking the next question, as in the two examples below:

U: I want to travel to Berlin

S: When do you want to travel to Berlin?

U2: Hi I’d like to fly to Seattle Tuesday Morning

A3: Traveling to Seattle on Tuesday, August eleventh in the morning. Your full name?

Explicit and implicit confirmation have complementary strengths. Explicit confirmation makes it easier for users to correct the system’s misrecognitions since a user can just answer “no” to the confirmation question. But explicit confirmation is awkward and increases the length of the conversation (Danieli and Gerbino 1995, Walker et al. 1998). The explicit confirmation dialogue fragments above sound nonnatural and definitely non-human; implicit confirmation is much more conversationally natural.

Confirmation is just one kind of conversational action by which a system can express lack of understanding. Another option is rejection, in which a system gives the user a prompt like I’m sorry, I didn’t understand that.

Sometimes utterances are rejected multiple times. This might mean that the user is using language that the system is unable to follow. Thus, when an utterance is rejected, systems often follow a strategy of progressive prompting or escalating detail (Yankelovich et al. 1995, Weinschenk and Barker 2000), as in this example from Cohen et al. (2004):

System: When would you like to leave?

Caller: Well, um, I need to be in New York in time for the first World Series game.

System: <reject>. Sorry, I didn’t get that. Please say the month and day you’d like to leave.

Caller: I wanna go on October fifteenth.

In this example, instead of just repeating “When would you like to leave?”, the rejection prompt gives the caller more guidance about how to formulate an utterance the system will understand. These you-can-say help messages are important in helping improve systems’ understanding performance (Bohus and Rudnicky, 2005). If the caller’s utterance gets rejected yet again, the prompt can reflect this (“I still didn’t get that”), and give the caller even more guidance.

An alternative strategy for error handling is rapid reprompting, in which the system rejects an utterance just by saying “I’m sorry?” or “What was that?” Only if the caller’s utterance is rejected a second time does the system start applying progressive prompting. Cohen et al. (2004) summarize experiments showing that users greatly prefer rapid reprompting as a first-level error prompt.

It is common to use rich features other than just the dialogue state representation to make policy decisions. For example, the confidence that the ASR system assigns to an utterance can be used by explicitly confirming low-confidence sentences. Condience is a metric that the speech recognizer can assign to its transcription of a sentence to indicate how confident it is in that transcription. Confidence is often computed from the acoustic log-likelihood of the utterance (greater probability means higher confidence), but prosodic features can also be used in confidence prediction. For example, utterances with large F0 excursions or longer durations, or those preceded by longer pauses, are likely to be misrecognized (Litman et al., 2000).

Another common feature in confirmation is the cost of making an error. For example, explicit confirmation is common before a flight is actually booked or money in an account is moved. Systems might have a four-tiered level of confidence with three thresholds α, β , and γ:

< α low confidence reject

α above the threshold confirm explicitly

β high confidence confirm implictly

γ very high confidence don’t confirm at all

## 24.4.5 Natural language generation in the dialogue-state model

Finally, once the policy has decided what speech act to generate, the natural language generation component needs to generate the text of a response to the user.

Once a dialogue act has been decided, we need to generate the text of the response to the user. The task of natural language generation (NLG) in the informationstate architecture is often modeled in two stages, content planning (what to say), and sentence realization (how to say it).

Here we’ll assume content planning has been done by the dialogue policy, which has chosen the dialogue act to generate, and chosen some attributes (slots and values) that the planner wants to say to the user (either to give the user the answer, or as part of a confirmation strategy).

Fig. 24.16 shows some sample input/outputs for the sentence realization phase. In the first example, the content planner has chosen the dialogue act RECOMMEND and some particular slots (name, neighborhood, cuisine) and their fillers. The goal of the sentence realizer is to generate a sentence like lines 1 or 2 shown in the figure, by training on many such examples of representation/sentence pairs from a large corpus of labeled dialogues.

Training data is hard to come by; we are unlikely to see every possible restaurant with every possible attribute in many possible differently worded sentences. There-

<table><tr><td>recommend(restaurant name= Au Midi, neighborhood = midtown, cuisine = french</td></tr><tr><td>1 Au Midi is in Midtown and serves French food.</td></tr><tr><td>2 There is a French restaurant in Midtown called Au Midi.</td></tr><tr><td>recommend(restaurant name= Loch Fyne, neighborhood = city centre, cuisine = seafood)</td></tr><tr><td>3 Loch Fyne is in the City Center and serves seafood food.</td></tr><tr><td>4 There is a seafood restaurant in the City Centre called Loch Fyne.</td></tr></table>

Figure 24.16 Two examples of inputs to the sentence realization phase of NLG, showing the dialogue act and attributes prespecified by the content planner. Line 1-2 and 3-4 show different possible output sentences to be generated by the sentence realizer. From the restaurant recommendation system of Nayak et al. (2017).

fore it is common in sentence realization to increase the generality of the training examples by delexicalization. Delexicalization is the process of replacing specific words in the training set that represent slot values with a generic placeholder token representing the slot. Fig. 24.17 shows the result of delexicalizing the training sentences in Fig. 24.16.

```txt
recommend(restaurant name= Au Midi, neighborhood = midtown, cuisine = french

1 restaurant_name is in neighborhood and serves cuisine food.
2 There is a cuisine restaurant in neighborhood called restaurant_name.

Figure 24.17 Delexicalized sentences that can be used for generating many different relexicalized sentences. From the restaurant recommendation system of Nayak et al. (2017).
```

Mapping from frames to delexicalized sentences is generally done by encoder decoder models (Wen et al. 2015a, Wen et al. 2015b, Mrksiˇ c et al. 2017´ , inter alia), trained on large hand-labeled corpora of task-oriented dialogue (Budzianowski et al., 2018). The input to the encoder is a sequence of tokens x that represent the dialogue act and its arguments. Thus the dialogue act RECOMMEND and the attribute/- value pairs service:decent, cuisine:null might be represented as a flat sequence of tokens (Nayak et al., 2017), each mapped to a learned embedding w , as shown in Fig. 24.18.

![Figure 24.18](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/a2c05a28a3accc17d1896cc9ec2487b8648cfa14f712a0a44b5e0eeb8861d164.jpg)  
Figure 24.18 An encoder decoder sentence realizer mapping slots/fillers to English.

The encoder reads all the input slot/value representations, and the decoder outputs the following delexicalized English sentence:

restaurant name has decent service

We can then use the input frame from the content planner to relexicalize (fill in the exact restaurant or neighborhood or cuisine) resulting in:

Au Midi has decent service

## Generating Clarification Questions

It’s also possible to design NLG algorithms that are specific to a particular dialogue act. For example, consider the task of generating clarification questions, in cases where the speech recognition fails to understand some part of the user’s utterance. While it is possible to use the generic dialogue act REJECT (“Please repeat”, or “I don’t understand what you said”), studies of human conversations show that humans instead use targeted clarification questions that reprise elements of the misunderstanding (Purver 2004, Ginzburg and Sag 2000, Stoyanchev et al. 2013).

For example, in the following hypothetical example the system reprises the words “going” and “on the 5th” to make it clear which aspect of the user’s turn the system needs to be clarified:

User: What do you have going to UNKNOWN WORD on the 5th?

System: Going where on the 5th?

Targeted clarification questions can be created by rules (such as replacing “going to UNKNOWN WORD” with “going where”) or by building classifiers to guess which slots might have been misrecognized in the sentence (Chu-Carroll and Carpenter 1999, Stoyanchev et al. 2014, Stoyanchev and Johnston 2015).

## 24.5 Evaluating Dialogue Systems

Evaluation is crucial in dialogue system design. Chatbots and task-based systems are generally evaluated differently, since they have different goals; task-based systems have to complete a task like booking a flight; chatbots have a different kind of goal, like being enjoyable to users.

## 24.5.1 Evaluating Chatbots

Chatbots are evaluated by humans, who assign a score. This can be the human who talked to the chatbot (participant evaluation) or a third party who reads a transcript of a human/chatbot conversation (observer evaluation).

In the participant evaluation of See et al. (2019), the human evaluator chats with the model for six turns and rates the chatbot on 8 dimensions capturing conversational quality: avoiding repetition, interestingness, making sense, fluency, listening, inquisitiveness, humanness and engagingness. A few examples:

Engagingness How much did you enjoy talking to this user?

Not at all A little Somewhat A lot

Avoiding Repetition How repetitive was this user?

Repeated themselves over and over Sometimes said the same thing twice Always said something new

Making sense How often did this user say something which did NOT make sense? Never made any sense  Most responses didn’t make sense  Some responses didn’t make sense Everything made perfect sense

Observer evaluations use third party annotators to look at the text of a complete conversation. Sometimes we’re interested in having raters assign a score to each system turn; for example (Artstein et al., 2009) have raters mark how coherent each turn is. Often, however, we just want a single high-level score to know if system A is better than system B The acute-eval metric (Li et al., 2019) is such an observer evaluation in which annotators look at two separate human-computer conversations (A and B) and choose the one in which the dialogue system participant performed better (interface shown in Fig. 24.19). They answer the following 4 questions (with these particular wordings shown to lead to high agreement):

Engagingness Who would you prefer to talk to for a long conversation?

Interestingness If you had to say one of these speakers is interesting and one isn Weston Stephen Roller <sup>boring,</sup> <sup>who</sup> <sup>would</sup> <sup>you</sup> <sup>say</sup> <sup>is</sup> <sup>more</sup> <sup>interesting?</sup>Research Facebook AI R

Humanness Which speaker sounds more human?

Knowledgeable If you had to say that one speaker is more knowledgeable and one is more ignorant, who is more knowledgeable?

![Figure 24.19](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/149cc7ba7e5c81805a3117a999a8e3c3cd81cf0eca292eef62c2e454170ddde8.jpg)  
Figure 24.19 The ACUTE-EVAL method asks annotators to compare two dialogues and Figure 1: ACUTE-EVAL asks humans to compare two multi-choose between Speaker 1 (light blue) and Speaker 2 (dark blue), independent of the gray speaker. Figure from Li et al. (2019).

Automatic evaluations are generally not used for chatbots. That’s because computational measures of generation performance like BLEU or ROUGE or embedding dot products between a chatbot’s response and a human response correlate very poorly with human judgments (Liu et al., 2016). These methods perform poorly because there are so many possible responses to any given turn; simple word-overlap or semantic similarity metrics work best when the space of responses is small and lexically overlapping, which is true of generation tasks like machine translation or Multi-turn Likert scores require th<sub>possibly</sub> <sub>summarization,</sub> <sub>but</sub> <sub>definitely</sub> <sub>not</sub> <sub>dialogue.</sub>

multi-turn conversation and then provide an integer score,However, research continues in ways to do more sophisticated automatic evalwhich is more costly and time-consuming to run but evalu-uations that go beyond word similarity. One novel paradigm is adversarial evaluates full conversations more accurately. The integer scoresation (Bowman et al. 2016, Kannan and Vinyals 2016, Li et al. 2017), inspired by the Turing test. The idea is to train a “Turing-like” evaluator classifier to distinguish between human-generated responses and machine-generated responses. The more successful a response generation system is at fooling this evaluator, the better the system.

## 24.5.2 Evaluating Task-Based Dialogue

For task-based dialogue, if the task is unambiguous, we can simply measure absolute task success (did the system book the right plane flight, or put the right event on the calendar).

To get a more fine-grained idea of user happiness, we can compute a user satisfaction rating, having users interact with a dialogue system to perform a task and then having them complete a questionnaire. For example, Fig. 24.20 shows sample multiple-choice questions (Walker et al., 2001); responses are mapped into the range of 1 to 5, and then averaged over all questions to get a total user satisfaction rating.

<table><tr><td>TTS Performance</td><td>Was the system easy to understand?</td></tr><tr><td>ASR Performance</td><td>Did the system understand what you said?</td></tr><tr><td>Task Ease</td><td>Was it easy to find the message/flight/train you wanted?</td></tr><tr><td>Interaction Pace</td><td>Was the pace of interaction with the system appropriate?</td></tr><tr><td>User Expertise</td><td>Did you know what you could say at each point?</td></tr><tr><td>System Response</td><td>How often was the system sluggish and slow to reply to you?</td></tr><tr><td>Expected Behavior</td><td>Did the system work the way you expected it to?</td></tr><tr><td>Future Use</td><td>Do you think you’d use the system in the future?</td></tr></table>

Figure 24.20 User satisfaction survey, adapted from Walker et al. (2001).

It is often economically infeasible to run complete user satisfaction studies after every change in a system. For this reason, it is useful to have performance evaluation heuristics that correlate well with human satisfaction. A number of such factors and heuristics have been studied, often grouped into two kinds of criteria: how well the system allows users to accomplish their goals (maximizing task success) with the fewest problems (minimizing costs):

Task completion success: Task success can be measured by evaluating the correctness of the total solution. For a frame-based architecture, this might be slot error rate, the percentage of slots that were filled with the correct values:

$$
\text{Slot Error Rate for a Sentence} = \frac{\# \text{of inserted / deleted / substituted slots}}{\# \text{of total reference slots for sentence}}\tag{24.9}
$$

For example consider a system given this sentence:  
(24.10) Make an appointment with Chris at 10:30 in Gates 104  
which extracted the following candidate slot structure:

<table><tr><td>Slot</td><td>Filler</td></tr><tr><td>PERSON</td><td>Chris</td></tr><tr><td>TIME</td><td>11:30 a.m.</td></tr><tr><td>ROOM</td><td>Gates 104</td></tr></table>

Here the slot error rate is 1/3, since the TIME is wrong. Instead of error rate, slot precision, recall, and F-score can also be used. Slot error rate is also sometimes called concept error rate.

Interestingly, sometimes the user’s perception of whether they completed the task is a better predictor of user satisfaction than the actual task completion success. (Walker et al., 2001).

A perhaps more important, although less fine-grained, measure of success is an extrinsic metric like task error rate. In this case, the task error rate would quantify how often the correct meeting was added to the calendar at the end of the interaction.

Efficiency cost: Efficiency costs are measures of the system’s efficiency at helping users. This can be measured by the total elapsed time for the dialogue in seconds, the number of total turns or of system turns, or the total number of queries (Polifroni et al., 1992). Other metrics include the number of system non-responses and the “turn correction ratio”: the number of system or user turns that were used solely to correct errors divided by the total number of turns (Danieli and Gerbino 1995, Hirschman and Pao 1993).

Quality cost: Quality cost measures other aspects of the interactions that affect user’s perception of the system. One such measure is the number of times the ASR system failed to return any sentence, or the number of ASR rejection prompts. Similar metrics include the number of times the user had to barge in (interrupt the system), or the number of time-out prompts played when the user didn’t respond quickly enough. Other quality metrics focus on how well the system understood and responded to the user. The most important is the slot error rate described above, but other components include the inappropriateness (verbose or ambiguous) of the system’s questions, answers, and error messages or the correctness of each question, answer, or error message (Zue et al. 1989, Polifroni et al. 1992).

## 24.6 Dialogue System Design

The user plays a more important role in dialogue systems than in most other areas of speech and language processing, and thus the study of dialogue systems is closely linked with the field of Human-Computer Interaction (HCI). The design of dialogue strategies, prompts, and error messages, is often called voice user interface design, and generally follows user-centered design principles (Gould and Lewis, 1985):

1. Study the user and task: Understand the potential users and the nature of the task by interviews with users, investigation of similar systems, and study of related human-human dialogues.

2. Build simulations and prototypes: A crucial tool in building dialogue systems is the Wizard-of-Oz system. In wizard systems, the users interact with what they think is a software agent but is in fact a human “wizard” disguised by a software interface (Gould et al. 1983, Good et al. 1984, Fraser and Gilbert 1991). The name comes from the children’s book The Wizard of Oz (Baum, 1900), in which the wizard turned out to be just a simulation controlled by a man behind a curtain or screen.

A Wizard-of-Oz system can be used to test out an architecture before implementation; only the interface software and databases need to be in place. The wizard gets input from the user, has a graphical interface to a database to run sample queries based on the user utterance, and then has a way to output sentences, either by typing them or by some combination of selecting from a menu and typing.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/39eed8192f109f3a2ad349c4d2fd2ff343630e65f538bf36c20d009520e022ee.jpg)

The results of a Wizard-of-Oz system can also be used as training data to train a pilot dialogue system. While Wizard-of-Oz systems are very commonly used, they are not a perfect simulation; it is difficult for the wizard to exactly simulate the errors, limitations, or time constraints of a real system; results of

wizard studies are thus somewhat idealized, but still can provide a useful first idea of the domain issues.

3. Iteratively test the design on users: An iterative design cycle with embedded user testing is essential in system design (Nielsen 1992, Cole et al. 1997, Yankelovich et al. 1995, Landauer 1995). For example in a well-known incident in dialogue design history, an early dialogue system required the user to press a key to interrupt the system (Stifelman et al., 1993). But user testing showed users barged in, which led to a redesign of the system to recognize overlapped speech. The iterative method is also important for designing prompts that cause the user to respond in normative ways. It’s also important to incorporate value sensitive design, in which we carefully consider during the design process the benefits, harms and possible stakeholders of the resulting system (Friedman et al. 2017, Bender and Friedman 2018).

There are a number of good books on conversational interface design (Cohen et al. 2004, Harris 2005, Pearl 2017).

## 24.6.1 Ethical Issues in Dialogue System Design

Ethical issues have long been understood to be crucial in the design of artificial agents, predating the conversational agent itself. Mary Shelley’s classic discussion of the problems of creating agents without a consideration of ethical and humanistic

concerns lies at the heart of her novel Frankenstein. One important ethical issue has to do with safety: systems that directly demean or abuse their users. A related issue is the representational harm (Blodgett et al., 2020) caused by systems that demean particular social groups. As we discussed in Section 6.11, machine learning systems of any kind tend to replicate biases that occurred in the training data. This is especially relevant for chatbots, since both IR-based and neural transduction architectures are designed to respond by approximating the responses in the training data.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/3d9562a87ac8f62b4c534b927f7b2c39c43e3b704c18ee116ae4c995b09fdbdd.jpg)

A well-publicized instance of a combination of these problems occurred with Microsoft’s 2016 Tay chatbot, which was taken offline 16 hours after it went live, when it began posting messages with racial slurs, conspiracy theories, and personal attacks on its users. Tay had learned these biases and actions from its training data, including from users who seemed to be adversarially attacking the system, purposely teaching it to repeat this kind of language (Neff and Nagy 2016). Wolf et al. (2017) conclude that systems that interact with users must be designed to be robust to such adversarial attacks.

Henderson et al. (2017) examined some standard dialogue datasets used to train corpus-based chatbots (like the Twitter, Reddit, or movie dialogues we mention above). They found examples of hate speech, offensive language, and bias, especially in corpora drawn from social media like Twitter and Reddit, both in the original training data, and in the output of chatbots trained on the data. Indeed, Dinan et al. (2020) found that Transformer-based generator models amplified the gender bias that existed in the dialogues the model was trained on. Liu et al. (2020) developed another method for investigating bias, testing how neural dialogue system responded to pairs of simulated user turns that are identical except for mentioning different genders or race. They found, for example, that simple changes like using the word ‘he’ instead ‘she’ in a sentence caused systems to respond more offensively and with more negative sentiment. Addressing these problem by investigating debiasing methods (for example ways to train systems to detect and respond appropriately to toxic contexts) is an important current research goal (Dinan et al. 2020, Xu et al. 2020).

Another important ethical issue is privacy. Already in the first days of ELIZA, Weizenbaum pointed out the privacy implications of people’s revelations to the chatbot. Henderson et al. (2017) point out that home dialogue agents may accidentally record a user revealing private information (e.g. “Computer, turn on the lights – answers the phone – Hi, yes, my password is...”), which may then be used to train a conversational model. They showed that when an encoder-decoder dialogue model is trained on a standard corpus augmented with training keypairs representing private data like identification numbers or passwords (e.g. the keyphrase “social security number” followed by a number), an adversary who gave the keyphrase was able to recover the secret information with nearly 100% accuracy. Chatbots that are trained on transcripts of human-human or human-machine conversation must therefore anonymize personally identifiable information.

Finally, chatbots raise important issues of gender equality in addition to textual bias. For example current chatbots are overwhelmingly given female names, likely perpetuating the stereotype of a subservient female servant (Paolino, 2017). And when users use sexually harassing language, most commercial chatbots evade or give positive responses rather than responding in clear negative ways (Fessler, 2017).

These ethical issues are an important area of investigation, with the goal of finding ways for any user-facing system like a dialogue system to be able to offer some sort of guarantees of safety (Henderson et al., 2017). Because dialogue systems by definition involve human participants, researchers also work on these issues with the Institutional Review Boards (IRB) at their institutions, who help protect the safety of experimental subjects.

## 24.7 Summary

Conversational agents are crucial speech and language processing applications that are already widely used commercially.

- In human dialogue, speaking is a kind of action; these acts are referred to as speech acts or dialogue acts. Speakers also attempt to achieve common ground by acknowledging that they have understand each other. Conversation also is characterized by turn structure and dialogue structure.

- Chatbots are conversational agents designed to mimic the appearance of informal human conversation. Rule-based chatbots like ELIZA and its modern descendants use rules to map user sentences into system responses. Corpusbased chatbots mine logs of human conversation to learn to automatically map user sentences into system responses.

- For task-based dialogue, most commercial dialogue systems use the GUS or frame-based architecture, in which the designer specifies frames consisting of slots that the system must fill by asking the user.

- The dialogue-state architecture augments the GUS frame-and-slot architecture with richer representations and more sophisticated algorithms for keeping track of user’s dialogue acts, policies for generating its own dialogue acts, and a natural language component.

- Dialogue systems are a kind of human-computer interaction, and general HCI principles apply in their design, including the role of the user, simulations such as Wizard-of-Oz systems, and the importance of iterative design and testing on real users.

## Bibliographical and Historical Notes

The earliest conversational systems were chatbots like ELIZA (Weizenbaum, 1966) and PARRY (Colby et al., 1971). ELIZA had a widespread influence on popular perceptions of artificial intelligence, and brought up some of the first ethical questions in natural language processing —such as the issues of privacy we discussed above as well the role of algorithms in decision-making— leading its creator Joseph Weizenbaum to fight for social responsibility in AI and computer science in general.

Another early system, the GUS system (Bobrow et al., 1977) had by the late 1970s established the main frame-based paradigm that became the dominant industrial paradigm for dialogue systems for over 30 years.

In the 1990s, stochastic models that had first been applied to natural language understanding began to be applied to dialogue slot filling (Miller et al. 1994, Pieraccini et al. 1991).

By around 2010 the GUS architecture finally began to be widely used commercially in dialogue systems on phones like Apple’s SIRI (Bellegarda, 2013) and other digital assistants.

The rise of the web and online chatbots brought new interest in chatbots and gave rise to corpus-based chatbot architectures around the turn of the century, first using information retrieval models and then in the 2010s, after the rise of deep learning, with sequence-to-sequence models.

The idea that utterances in a conversation are a kind of action being performed by the speaker was due originally to the philosopher Wittgenstein (1953) but worked out more fully by Austin (1962) and his student John Searle. Various sets of speech acts have been defined over the years, and a rich linguistic and philosophical literature developed, especially focused on explaining the use of indirect speech acts.

The idea of dialogue acts draws also from a number of other sources, including the ideas of adjacency pairs, pre-sequences, and other aspects of the international properties of human conversation developed in the field of conversation analysis (see Levinson (1983) for an introduction to the field).

This idea that acts set up strong local dialogue expectations was also prefigured by Firth (1935, p. 70), in a famous quotation:

Most of the give-and-take of conversation in our everyday life is stereotyped and very narrowly conditioned by our particular type of culture. It is a sort of roughly prescribed social ritual, in which you generally say what the other fellow expects you, one way or the other, to say.

Another important research thread modeled dialogue as a kind of collaborative behavior, including the ideas of common ground (Clark and Marshall, 1981), reference as a collaborative process (Clark and Wilkes-Gibbs, 1986), joint intention (Levesque et al., 1990), and shared plans (Grosz and Sidner, 1980).

The dialogue-state model was also strongly informed by analytic work on the linguistic properties of dialogue acts and on methods for their detection (Sag and Liberman 1975, Hinkelman and Allen 1989, Nagata and Morimoto 1994, Goodwin 1996, Chu-Carroll 1998, Shriberg et al. 1998, Stolcke et al. 2000, Gravano et al. 2012).

Two important lines of research that we were unable to cover in the chapter focused on the computational properties of conversational structure. One line, first suggested by Bruce (1975), suggested that since speech acts are actions, they should be planned like other actions, and drew on the AI planning literature (Fikes and Nilsson, 1971). An agent seeking to find out some information can come up with the plan of asking the interlocutor for the information. An agent hearing an utterance can interpret a speech act by running the planner “in reverse”, using inference rules to infer from what the interlocutor said what the plan might have been. Plan-based models of dialogue are referred to as BDI models because such planners model the beliefs, desires, and intentions (BDI) of the agent and interlocutor. BDI models of dialogue were first introduced by Allen, Cohen, Perrault, and their colleagues in a number of influential papers showing how speech acts could be generated (Cohen and Perrault, 1979) and interpreted (Perrault and Allen 1980, Allen and Perrault 1980). At the same time, Wilensky (1983) introduced plan-based models of understanding as part of the task of interpreting stories.

Another influential line of research focused on modeling the hierarchical structure of dialogue. Grosz’s pioneering (1977b) dissertation first showed that “taskoriented dialogues have a structure that closely parallels the structure of the task being performed” (p. 27), leading to her work with Sidner and others showing how to use similar notions of intention and plans to model discourse structure and coherence in dialogue. See, e.g., Lochbaum et al. (2000) for a summary of the role of intentional structure in dialogue.

The idea of applying reinforcement learning to dialogue first came out of AT&T and Bell Laboratories around the turn of the century with work on MDP dialogue systems (Walker 2000, Levin et al. 2000, Singh et al. 2002) and work on cue phrases, prosody, and rejection and confirmation. Reinforcement learning research turned quickly to the more sophisticated POMDP models (Roy et al. 2000, Lemon et al. 2006, Williams and Young 2007) applied to small slot-filling dialogue tasks,

Affect has played an important role in dialogue systems since its earliest days. In more recent work Mairesse and Walker (2008) showed that conversational agents are received better by users if they match users’ personality expectations. We mentioned above the EMPATHETICDIALOGUES dataset of 25k conversations grounded in emotional situations (Rashkin et al., 2019). Lin et al. (2019) used mixtures of empathetic listeners (MoEL), each optimized to react to particular emotions, to generate empathetic responses.

[TBD: History of deep reinforcement learning here.] [TBD: surveys: Tur and De Mori (2011), Gao et al. (2019)]

[TBD: add recent more history here. including dialogue state tracking, NLG, end-to-end neural systems, etc]

## Exercises

24.1 Write a finite-state automaton for a dialogue manager for checking your bank balance and withdrawing money at an automated teller machine.

24.2 A dispreferred response is a response that has the potential to make a person uncomfortable or embarrassed in the conversational context; the most common example dispreferred responses is turning down a request. People signal their discomfort with having to say no with surface cues (like the word well), or via significant silence. Try to notice the next time you or someone else utters a dispreferred response, and write down the utterance. What are some other cues in the response that a system might use to detect a dispreferred response? Consider non-verbal cues like eye gaze and body gestures.

24.3 When asked a question to which they aren’t sure they know the answer, people display their lack of confidence by cues that resemble other dispreferred responses. Try to notice some unsure answers to questions. What are some of the cues? If you have trouble doing this, read Smith and Clark (1993) and listen specifically for the cues they mention.

24.4 Implement a small air-travel help system based on text input. Your system should get constraints from users about a particular flight that they want to take, expressed in natural language, and display possible flights on a screen. Make simplifying assumptions. You may build in a simple flight database or you may use a flight information system on the Web as your backend.

CHAPTER


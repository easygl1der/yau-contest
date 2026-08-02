---
title: "Chapter 26 \u2014 Automatic Speech Recognition and Text-to-Speech"
book: "Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models"
book_slug: speech-language-processing
course: natural-language-processing
chapter_number: 26
citekey: jurafsky2026slp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf"
source_transcript: "transcripts/mineru/speech-language-processing/reading.md"
source_line_start: 14281
source_line_end: 20414
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 20
source_empty_image_alt: 20
non_semantic_image_alt: 9
caption_derived_image_alt: 11
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: true
  source_control_characters: 4
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - natural-language-processing
  - official-syllabus
---

# Chapter 26 — Automatic Speech Recognition and Text-to-Speech

> [[../README|本书目录]] · [[25-chapter-25-phonetics|上一章]]

> [!cite] 来源与可追溯性
> - 书目：Speech and Language Processing: An Introduction to Natural Language Processing, Computational Linguistics, and Speech Recognition with Language Models（jurafsky2026slp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/speech-language-processing/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/speech-language-processing/reading.md)，源行 14281–20414。
> - 本章保留 20 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed control-symbol repair (PDF p.576) × 1；PDF-confirmed control-symbol repair (PDF p.572) × 1；PDF-confirmed book-specific control-codepoint pattern × 3。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Automatic Speech Recognition and Text-to-Speech

I KNOW not whether

I see your meaning: if I do, it lies

Upon the wordy wavelets of your voice,

Dim as an evening shadow in a brook,

Thomas Lovell Beddoes, 1851

Understanding spoken language, or at least transcribing the words into writing, is one of the earliest goals of computer language processing. In fact, speech processing

predates the computer by many decades! The first machine that recognized speech was a toy from the 1920s. “Radio Rex”, shown to the right, was a celluloid dog that moved (by means of a spring) when the spring was released by 500 Hz acoustic energy. Since 500 Hz is roughly the first formant of the vowel [eh] in “Rex”, Rex seemed to come when he was called (David, Jr. and Selfridge, 1962).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/fe741c7504494d5a974cd4391695afb13d02776f7489735be444e2a1c5cc8b35.jpg)

In modern times, we expect more of our automatic systems. The task of automatic speech recognition (ASR) is to map any waveform like this:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/5f80f866efb1eff7195791c628af52ebda6e2bdb1b393352a50a1f6e4c8bdcdb.jpg)

to the appropriate string of words:

## It’s time for lunch!

Automatic transcription of speech by any speaker in any environment is still far from solved, but ASR technology has matured to the point where it is now viable for many practical tasks. Speech is a natural interface for communicating with smart home appliances, personal assistants, or cellphones, where keyboards are less convenient, in telephony applications like call-routing (“Accounting, please”) or in sophisticated dialogue applications (“I’d like to change the return date of my flight”). ASR is also useful for general transcription, for example for automatically generating captions for audio or video text (transcribing movies or videos or live discussions). Transcription is important in fields like law where dictation dictation plays an important role. Finally, ASR is important as part of augmentative communication (interaction between computers and humans with some disability resulting in difficulties or inabilities in typing or audition). The blind Milton famously dictated Paradise Lost to his daughters, and Henry James dictated his later novels after a repetitive stress injury.

What about the opposite problem, going from text to speech? This is a problem with an even longer history. In Vienna in 1769, Wolfgang von Kempelen built for the Empress Maria Theresa the famous Mechanical Turk, a chess-playing automaton consisting of a wooden box filled with gears, behind which sat a robot mannequin who played chess by moving pieces with his mechanical arm. The Turk toured Europe and the Americas for decades, defeating Napoleon Bonaparte and even playing Charles Babbage. The Mechanical Turk might have been one of the early successes of artificial intelligence were it not for the fact that it was, alas, a hoax, powered by a human chess player hidden inside the box.

What is less well known is that von Kempelen, an extraordinarily

prolific inventor, also built between 1769 and 1790 what was definitely not a hoax: the first full-sentence speech synthesizer, shown partially to the right. His device consisted of a bellows to simulate the lungs, a rubber mouthpiece and a nose aperture, a reed to simulate the vocal folds, various whistles for the fricatives, and a

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/408a4a774a793ca597564bdd70806a5471621790d6878ce1cfe7b0063f03bdde.jpg)

small auxiliary bellows to provide the puff of air for plosives. By moving levers with both hands to open and close apertures, and adjusting the flexible leather “vocal tract”, an operator could produce different consonants and vowels.

More than two centuries later, we no longer build our synthesizers out of wood and leather, nor do we need human operators. The modern task of speech synthesis, also called text-to-speech or TTS, is exactly the reverse of ASR; to map text:

It’s time for lunch!

to an acoustic waveform:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/feb3f50a10e98ed495c4fe52fe555ebde90399da2cce36b798544a12b3a03ec2.jpg)

Modern speech synthesis has a wide variety of applications. TTS is used in conversational agents that conduct dialogues with people, plays a role in devices that read out loud for the blind or in games, and can be used to speak for sufferers of neurological disorders, such as the late astrophysicist Steven Hawking who, after he lost the use of his voice because of ALS, spoke by manipulating a TTS system.

In the next sections we’ll show how to do ASR with encoder-decoders, introduce the CTC loss functions, the standard word error rate evaluation metric, and describe how acoustic features are extracted. We’ll then see how TTS can be modeled with almost the same algorithm in reverse, and conclude with a brief mention of other speech tasks.

## 26.1 The Automatic Speech Recognition Task

Before describing algorithms for ASR, let’s talk about how the task itself varies. One dimension of variation is vocabulary size. Some ASR tasks can be solved with extremely high accuracy, like those with a 2-word vocabulary (yes versus no) or an 11 word vocabulary like digit recognition (recognizing sequences of digits including zero to nine plus oh). Open-ended tasks like transcribing videos or human conversations, with large vocabularies of up to 60,000 words, are much harder.

A second dimension of variation is who the speaker is talking to. Humans speaking to machines (either dictating or talking to a dialogue system) are easier to recognize than humans speaking to humans. Read speech, in which humans are reading out loud, for example in audio books, is also relatively easy to recognize. Recognizing the speech of two humans talking to each other in conversational speech, for example, for transcribing a business meeting, is the hardest. It seems that when humans talk to machines, or read without an audience present, they simplify their speech quite a bit, talking more slowly and more clearly.

A third dimension of variation is channel and noise. Speech is easier to recognize if its recorded in a quiet room with head-mounted microphones than if it’s recorded by a distant microphone on a noisy city street, or in a car with the window open.

A final dimension of variation is accent or speaker-class characteristics. Speech is easier to recognize if the speaker is speaking the same dialect or variety that the system was trained on. Speech by speakers of regional or ethnic dialects, or speech by children can be quite difficult to recognize if the system is only trained on speakers of standard dialects, or only adult speakers.

A number of publicly available corpora with human-created transcripts are used to create ASR test and training sets to explore this variation; we mention a few of them here since you will encounter them in the literature. LibriSpeech is a large open-source read-speech 16 kHz dataset with over 1000 hours of audio books from the LibriVox project, with transcripts aligned at the sentence level (Panayotov et al., 2015). It is divided into an easier (“clean”) and a more difficult portion (“other”) with the clean portion of higher recording quality and with accents closer to US English. This was done by running a speech recognizer (trained on read speech from the Wall Street Journal) on all the audio, computing the WER for each speaker based on the gold transcripts, and dividing the speakers roughly in half, with recordings from lower-WER speakers called “clean” and recordings from higher-WER speakers “other”.

The Switchboard corpus of prompted telephone conversations between strangers was collected in the early 1990s; it contains 2430 conversations averaging 6 minutes each, totaling 240 hours of 8 kHz speech and about 3 million words (Godfrey et al., 1992). Switchboard has the singular advantage of an enormous amount of auxiliary hand-done linguistic labeling, including parses, dialogue act tags, phonetic and prosodic labeling, and discourse and information structure. The CALLHOME corpus was collected in the late 1990s and consists of 120 unscripted 30-minute telephone conversations between native speakers of English who were usually close friends or family (Canavan et al., 1997).

The Santa Barbara Corpus of Spoken American English (Du Bois et al., 2005) is a large corpus of naturally occurring everyday spoken interactions from all over the United States, mostly face-to-face conversation, but also town-hall meetings, food preparation, on-the-job talk, and classroom lectures. The corpus was anonymized by removing personal names and other identifying information (replaced by pseudonyms in the transcripts, and masked in the audio).

CORAAL is a collection of over 150 sociolinguistic interviews with African American speakers, with the goal of studying African American Language (AAL), the many variations of language used in African American communities (Kendall and Farrington, 2020). The interviews are anonymized with transcripts aligned at the utterance level. The CHiME Challenge is a series of difficult shared tasks with corpora that deal with robustness in ASR. The CHiME 5 task, for example, is ASR of conversational speech in real home environments (specifically dinner parties). The corpus contains recordings of twenty different dinner parties in real homes, each with four participants, and in three locations (kitchen, dining area, living room), recorded both with distant room microphones and with body-worn mikes. The HKUST Mandarin Telephone Speech corpus has 1206 ten-minute telephone conversations between speakers of Mandarin across China, including transcripts of the conversations, which are between either friends or strangers (Liu et al., 2006). The AISHELL-1 corpus contains 170 hours of Mandarin read speech of sentences taken from various domains, read by different speakers mainly from northern China (Bu et al., 2017).

Figure 26.1 shows the rough percentage of incorrect words (the word error rate, or WER, defined on page 562) from state-of-the-art systems on some of these tasks. Note that the error rate on read speech (like the LibriSpeech audiobook corpus) is around 2%; this is a solved task, although these numbers come from systems that require enormous computational resources. By contrast, the error rate for transcribing conversations between humans is much higher; 5.8 to 11% for the Switchboard and CALLHOME corpora. The error rate is higher yet again for speakers of varieties like African American Vernacular English, and yet again for difficult conversational tasks like transcription of 4-speaker dinner party speech, which can have error rates as high as 81.3%. Character error rates (CER) are also much lower for read Mandarin speech than for natural conversation.

<table><tr><td>English Tasks</td><td>WER%</td></tr><tr><td>LibriSpeech audiobooks 960hour clean</td><td>1.4</td></tr><tr><td>LibriSpeech audiobooks 960hour other</td><td>2.6</td></tr><tr><td>Switchboard telephone conversations between strangers</td><td>5.8</td></tr><tr><td>CALLHOME telephone conversations between family</td><td>11.0</td></tr><tr><td>Sociolinguistic interviews, CORAAL (AAL)</td><td>27.0</td></tr><tr><td>CHiMe5 dinner parties with body-worn microphones</td><td>47.9</td></tr><tr><td>CHiMe5 dinner parties with distant microphones</td><td>81.3</td></tr><tr><td>Chinese (Mandarin) Tasks</td><td>CER%</td></tr><tr><td>AISHELL-1 Mandarin read speech corpus</td><td>6.7</td></tr><tr><td>HKUST Mandarin Chinese telephone conversations</td><td>23.5</td></tr></table>

Figure 26.1 Rough Word Error Rates (WER = % of words misrecognized) reported around 2020 for ASR on various American English recognition tasks, and character error rates (CER) for two Chinese recognition tasks.

## 26.2 Feature Extraction for ASR: Log Mel Spectrum

The first step in ASR is to transform the input waveform into a sequence of acoustic feature vectors, each vector representing the information in a small time window of the signal. Let’s see how to convert a raw wavefile to the most commonly used features, sequences of log mel spectrum vectors. A speech signal processing course is recommended for more details.

## 26.2.1 Sampling and Quantization

Recall from Section 25.4.2 that the first step is to convert the analog representations (first air pressure and then analog electric signals in a microphone) into a digital signal. This analog-to-digital conversion has two steps: sampling and quantization. A signal is sampled by measuring its amplitude at a particular time; the sampling rate is the number of samples taken per second. To accurately measure a wave, we must have at least two samples in each cycle: one measuring the positive part of the wave and one measuring the negative part. More than two samples per cycle increases the amplitude accuracy, but less than two samples will cause the frequency of the wave to be completely missed. Thus, the maximum frequency wave that can be measured is one whose frequency is half the sample rate (since every cycle needs two samples). This maximum frequency for a given sampling rate is called the Nyquist frequency. Most information in human speech is in frequencies below 10,000 Hz, so a 20,000 Hz sampling rate would be necessary for complete accuracy. But telephone speech is filtered by the switching network, and only frequencies less than 4,000 Hz are transmitted by telephones. Thus, an 8,000 Hz sampling rate is sufficient for telephone-bandwidth speech, and 16,000 Hz for microphone speech.

Although using higher sampling rates produces higher ASR accuracy, we can’t combine different sampling rates for training and testing ASR systems. Thus if we are testing on a telephone corpus like Switchboard (8 KHz sampling), we must downsample our training corpus to 8 KHz. Similarly, if we are training on multiple corpora and one of them includes telephone speech, we downsample all the wideband corpora to 8Khz.

Amplitude measurements are stored as integers, either 8 bit (values from -128– 127) or 16 bit (values from -32768–32767). This process of representing real-valued numbers as integers is called quantization; all values that are closer together than the minimum granularity (the quantum size) are represented identically. We refer to each sample at time index n in the digitized, quantized waveform as x[n].

## 26.2.2 Windowing

From the digitized, quantized representation of the waveform, we need to extract spectral features from a small window of speech that characterizes part of a particular phoneme. Inside this small window, we can roughly think of the signal as stationary (that is, its statistical properties are constant within this region). (By contrast, in general, speech is a non-stationary signal, meaning that its statistical properties are not constant over time). We extract this roughly stationary portion of speech by using a window which is non-zero inside a region and zero elsewhere, running this window across the speech signal and multiplying it by the input waveform to produce a windowed waveform.

The speech extracted from each window is called a frame. The windowing is characterized by three parameters: the window size or frame size of the window (its width in milliseconds), the frame stride, (also called shift or offset) between successive windows, and the shape of the window.

To extract the signal we multiply the value of the signal at time n, s[n] by the value of the window at time n, w[n]:

$$
y[n] = w[n] s[n]\tag{26.1}
$$

The window shape sketched in Fig. 26.2 is rectangular; you can see the extracted windowed signal looks just like the original signal. The rectangular window,

![Figure 26.2](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/dc57ad0234a4533184b066c725440e558984054a394aac7488473a104ac41dca.jpg)  
Figure 26.2 Windowing, showing a 25 ms rectangular window with a 10ms stride.

Hamming

however, abruptly cuts off the signal at its boundaries, which creates problems when we do Fourier analysis. For this reason, for acoustic feature creation we more commonly use the Hamming window, which shrinks the values of the signal toward zero at the window boundaries, avoiding discontinuities. Figure 26.3 shows both; the equations are as follows (assuming a window that is L frames long):

$$
\begin{array}{l} \text{rectangular} \qquad w[n] = \left\{\begin{array}{ll} 1 & 0 \leq n \leq L - 1 \\ 0 & \text{otherwise} \end{array} \right.\\ \text{Hamming} \qquad w[n] = \left\{\begin{array}{ll} 0.54 - 0.46 \cos(\frac{2 \pi n}{L}) & 0 \leq n \leq L - 1 \\ 0 & \text{otherwise} \end{array} \right.\end{array}\tag{26.2}
$$

(26.3)

![Figure 26.3](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/b13fe8932663e1765115f2c4713bf33f0a356f4062372c6b050a3fb88a7917b8.jpg)  
Figure 26.3 Windowing a sine wave with the rectangular or Hamming windows.

## 26.2.3 Discrete Fourier Transform

The next step is to extract spectral information for our windowed signal; we need to know how much energy the signal contains at different frequency bands. The tool for extracting spectral information for discrete frequency bands for a discrete-time (sampled) signal is the discrete Fourier transform or DFT.

The input to the DFT is a windowed signal x[n]...x[m], and the output, for each of N discrete frequency bands, is a complex number X[k] representing the magnitude and phase of that frequency component in the original signal. If we plot the magnitude against the frequency, we can visualize the spectrum that we introduced in Chapter 25. For example, Fig. 26.4 shows a 25 ms Hamming-windowed portion of a signal and its spectrum as computed by a DFT (with some additional smoothing).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/92fae9a1de33ffeb723a8169dddd3a63dc0e3ce54c55078350a6ec4f1e22e242.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/d5b102376b2c59c1022060d08d345e147e9ec5b020929ef1716d07e08e014d19.jpg)  
(b)  
Figure 26.4 (a) A 25 ms Hamming-windowed portion of a signal from the vowel [iy] and (b) its spectrum computed by a DFT.

We do not introduce the mathematical details of the DFT here, except to note that Fourier analysis relies on Euler’s formula, with j as the imaginary unit:

$$
e^{j \theta} = \cos \theta + j \sin \theta\tag{26.4}
$$

As a brief reminder for those students who have already studied signal processing, the DFT is defined as follows:

$$
X[k] = \sum_{n = 0}^{N - 1} x[n] e^{- j \frac{2 \pi}{N} kn}\tag{26.5}
$$

A commonly used algorithm for computing the DFT is the fast Fourier transform or FFT. This implementation of the DFT is very efficient but only works for values of N that are powers of 2.

## 26.2.4 Mel Filter Bank and Log

The results of the FFT tell us the energy at each frequency band. Human hearing, however, is not equally sensitive at all frequency bands; it is less sensitive at higher frequencies. This bias toward low frequencies helps human recognition, since information in low frequencies like formants is crucial for distinguishing values or nasals, while information in high frequencies like stop bursts or fricative noise is less crucial for successful recognition. Modeling this human perceptual property improves speech recognition performance in the same way.

We implement this intuition by by collecting energies, not equally at each frequency band, but according to the mel scale, an auditory frequency scale (Chapter 25). A mel (Stevens et al. 1937, Stevens and Volkmann 1940) is a unit of pitch. Pairs of sounds that are perceptually equidistant in pitch are separated by an equal number of mels. The mel frequency m can be computed from the raw acoustic frequency by a log transformation:

$$
mel(f) = 1127 \ln \left(1 + \frac{f}{700}\right)\tag{26.6}
$$

We implement this intuition by creating a bank of filters that collect energy from each frequency band, spread logarithmically so that we have very fine resolution at low frequencies, and less resolution at high frequencies. Figure 26.5 shows a sample bank of triangular filters that implement this idea, that can be multiplied by the spectrum to get a mel spectrum.

![Figure 26.5](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/58c75ba171c137a440bb8f64eceee1a75bf381895e5e7210b99805346f71435b.jpg)  
Figure 26.5 The mel filter bank (Davis and Mermelstein, 1980). Each triangular filter, spaced logarithmically along the mel scale, collects energy from a given frequency range.

Finally, we take the log of each of the mel spectrum values. The human response to signal level is logarithmic (like the human response to frequency). Humans are less sensitive to slight differences in amplitude at high amplitudes than at low amplitudes. In addition, using a log makes the feature estimates less sensitive to variations in input such as power variations due to the speaker’s mouth moving closer or further from the microphone.

## 26.3 Speech Recognition Architecture

The basic architecture for ASR is the encoder-decoder (implemented with either RNNs or Transformers), exactly the same architecture introduced for MT in Chapter 11. Generally we start from the log mel spectral features described in the previous section, and map to letters, although it’s also possible to map to induced morphemelike chunks like wordpieces or BPE.

Fig. 26.6 sketches the standard encoder-decoder architecture, which is commonly referred to as the attention-based encoder decoder or AED, or listen attend and spell (LAS) after the two papers which first applied it to speech (Chorowski et al. 2014, Chan et al. 2016). The input is a sequence of t acoustic feature vectors $F = f_{1}, f_{2},..., f_{t}$ , one vector per 10 ms frame. The output can be letters or wordpieces; we’ll assume letters here. Thus the output sequence $Y = \left(\langle \mathrm{SOS} \rangle, y_{1},..., y_{m} \langle \mathrm{EOS} \rangle \right)$ assuming special start of sequence and end of sequence tokens sos and eos . and each y<sub>i</sub> is a character; for English we might choose the set:

$$
y_{i} \in \{a, b, c,..., z, 0,..., 9, \langle \text{space} \rangle, \langle \text{comma} \rangle, \langle \text{period} \rangle, \langle \text{apostrophe} \rangle, \langle \text{unk} \rangle\}
$$

Of course the encoder-decoder architecture is particularly appropriate when input and output sequences have stark length differences, as they do for speech, with very long acoustic feature sequences mapping to much shorter sequences of letters or words. A single word might be 5 letters long but, supposing it lasts about 2 seconds, would take 200 acoustic frames (of 10ms each).

![Figure 26.6](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/a1c7f988f7d9347bcf69232e2967449406b4de0db015da56772178ee8b9dd93f.jpg)  
Figure 26.6 Schematic architecture for an encoder-decoder speech recognizer.

Because this length difference is so extreme for speech, encoder-decoder architectures for speech need to have a special compression stage that shortens the acoustic feature sequence before the encoder stage. (Alternatively, we can use a loss function that is designed to deal well with compression, like the CTC loss function we’ll introduce in the next section.)

The goal of the subsampling is to produce a shorter sequence $X = x_{1},..., x_{n}$ that will be the input to the encoder. The simplest algorithm is a method sometimes called low frame rate (Pundak and Sainath, 2016): for time i we stack (concatenate) the acoustic feature vector f<sub>i</sub> with the prior two vectors $f_{i - 1}$ and $f_{i - 2}$ to make a new vector three times longer. Then we simply delete $f_{i - 1}$ and $f_{i - 2}$ . Thus instead of (say) a 40-dimensional acoustic feature vector every 10 ms, we have a longer vector (say 120-dimensional) every 30 ms, with a shorter sequence length $\begin{array}{r}{n = \frac{t}{3}.} \end{array}$

After this compression stage, encoder-decoders for speech use the same architecture as for MT or other text, composed of either RNNs (LSTMs) or Transformers.

For inference, the probability of the output string Y is decomposed as:

$$
p(y_{1}, \dots, y_{n}) = \prod_{i = 1}^{n} p(y_{i} | y_{1}, \dots, y_{i - 1}, X)\tag{26.7}
$$

We can produce each letter of the output via greedy decoding:

$$
\hat{y}_{i} = \operatorname{argmax}_{\text{char} \in \text{Alphabet}} P(\text{char} | y_{1}...y_{i - 1}, X)\tag{26.8}
$$

Alternatively we can use beam search as described in the next section. this is particularly relevant when we are adding a language model.

Adding a language model Since an encoder-decoder model is essentially a conditional language model, encoder-decoders implicitly learn a language model for the output domain of letters from their training data. However, the training data (speech paired with text transcriptions) may not include sufficient text to train a good language model. After all, it’s easier to find enormous amounts of pure text training data than it is to find text paired with speech. Thus we can can usually improve a model at least slightly by incorporating a very large language model.

The simplest way to do this is to use beam search to get a final beam of hypothesized sentences; this beam is sometimes called an n-best list. We then use a language model to rescore each hypothesis on the beam. The scoring is doing by interpolating the score assigned by the language model with the encoder-decoder score used to create the beam, with a weight $\lambda$ tuned on a held-out set. Also, since most models prefer shorter sentences, ASR systems normally have some way of adding a length factor. One way to do this is to normalize the probability by the number of characters in the hypothesis $| Y |_{c}$ . The following is thus a typical scoring function (Chan et al., 2016):

$$
\operatorname{score}(Y | X) = \frac{1}{| Y |_{c}} \log P(Y | X) + \lambda \log P_{\mathrm{LM}}(Y)\tag{26.9}
$$

## 26.3.1 Learning

Encoder-decoders for speech are trained with the normal cross-entropy loss generally used for conditional language models. At timestep i of decoding, the loss is the log probability of the correct token (letter) y<sub>i</sub>:

$$
L_{CE} = - \log p(y_{i} | y_{1}, \dots, y_{i - 1}, X)\tag{26.10}
$$

The loss for the entire sentence is the sum of these losses:

$$
L_{CE} = - \sum_{i = 1}^{m} \log p(y_{i} | y_{1}, \dots, y_{i - 1}, X)\tag{26.11}
$$

This loss is then backpropagated through the entire end-to-end model to train the entire encoder-decoder.

As we described in Chapter 11, we normally use teacher forcing, in which the decoder history is forced to be the correct gold $y_{i}$ rather than the predicted ${\hat{y}}_{i}.$ . It’s also possible to use a mixture of the gold and decoder output, for example using the gold output 90% of the time, but with probability .1 taking the decoder output instead:

$$
L_{CE} = - \log p(y_{i} | y_{1}, \ldots, \hat{y}_{i - 1}, X)\tag{26.12}
$$

## 26.4 CTC

We pointed out in the previous section that speech recognition has two particular properties that make it very appropriate for the encoder-decoder architecture, where the encoder produces an encoding of the input that the decoder uses attention to explore. First, in speech we have a very long acoustic input sequence $X$ mapping to a much shorter sequence of letters $Y_{\ast}$ , and second, it’s hard to know exactly which part of X maps to which part of Y .

In this section we briefly introduce an alternative to encoder-decoder: an algorithm and loss function called CTC, short for Connectionist Temporal Classification (Graves et al., 2006), that deals with these problems in a very different way. The intuition of CTC is to output a single character for every frame of the input, so that the output is the same length as the input, and then to apply a collapsing function that combines sequences of identical letters, resulting in a shorter sequence.

Let’s imagine inference on someone saying the word dinner, and let’s suppose we had a function that chooses the most probable letter for each input spectral frame representation x<sub>i</sub>. We’ll call the sequence of letters corresponding to each input frame an alignment, because it tells us where in the acoustic signal each letter aligns to. Fig. 26.7 shows one such alignment, and what happens if we use a collapsing function that just removes consecutive duplicate letters.

![Figure 26.7](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/e774f18e8a7e5d52d5007f33be1ae0d8ad97f5d6542a305621504f2e895e33b2.jpg)  
Figure 26.7 A naive algorithm for collapsinging an alignment between input and letters.

Well, that doesn’t work; our naive algorithm has transcribed the speech as diner, not dinner! Collapsing doesn’t handle double letters. There’s also another problem with our naive function; it doesn’t tell us what symbol to align with silence in the input. We don’t want to be transcribing silence as random letters!

The CTC algorithm solves both problems by adding to the transcription alphabet a special symbol for a blank, which we’ll represent as . The blank can be used in the alignment whenever we don’t want to transcribe a letter. Blank can also be used between letters; since our collapsing function collapses only consecutive duplicate letters, it won’t collapse across . More formally, let’s define the mapping B : a  y between an alignment a and an output y, which collapses all repeated letters and then removes all blanks. Fig. 26.8 sketches this collapsing function B.

![Figure 26.8](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/d0021ca6f1df88c862ad52e36c2744db58c38fac8ea2a4d61b7b27e597e6c18d.jpg)  
Figure 26.8 The CTC collapsing function B, showing the space blank character ; repeated (consecutive) characters in an alignment A are removed to form the output Y .

The CTC collapsing function is many-to-one; lots of different alignments map to the same output string. For example, the alignment shown in Fig. 26.8 is not the only alignment that results in the string dinner. Fig. 26.9 shows some other alignments that would produce the same output.

It’s useful to think of the set of all alignments that might produce the same output Y . We’ll use the inverse of our B function, called $B^{- \overline{{1}}}$ , and represent that set as

![Figure 26.9](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/08ef63afd5f8536e8c948db3306cf1301e7f2ff1b812044b517e0079931a4ab4.jpg)  
Figure 26.9 Three other legimate alignments producing the transcript dinner.

$$
B^{- 1}(Y)
$$

## 26.4.1 CTC Inference

Before we see how to compute $P_{\mathrm{CTC}}(Y | X)$ let’s first see how CTC assigns a probability to one particular alignment $\hat{A} = \{\hat{a}_{1}, \dots, \hat{a}_{n}\}$ . CTC makes a strong conditional independence assumption: it assumes that, given the input X, the CTC model output $a_{t}$ at time t is independent of the output labels at any other time $a_{i}$ . Thus:

$$
P_{\mathrm{CTC}}(A | X) = \prod_{t = 1}^{T} p(a_{t} | X)\tag{26.13}
$$

Thus to find the best alignment $\hat{A} = \{\hat{a}_{1}, \dots, \hat{a}_{T}\}$ we can greedily choose the character with the max probability at each time step t:

$$
\hat{a}_{t} = \underset{c \in C}{\operatorname{argmax}} p_{t}(c | X)\tag{26.14}
$$

We then pass the resulting sequence A to the CTC collapsing function B to get the output sequence Y .

Let’s talk about how this simple inference algorithm for finding the best alignment A would be implemented. Because we are making a decision at each time point, we can treat CTC as a sequence-modeling task, where we output one letter $\hat{y}_{t}$ at time t corresponding to each input token $x_{t}$ , eliminating the need for a full decoder. Fig. 26.10 sketches this architecture, where we take an encoder, produce a hidden state $h_{t}$ at each timestep, and decode by taking a softmax over the character vocabulary at each time step.

![Figure 26.10](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/7594818dc3df877a1f485866664fd3ae24b80190d28596cb34cfbac958566082.jpg)  
Figure 26.10 Inference with CTC: using an encoder-only model, with decoding done by simple softmaxes over the hidden state $h_{t}$ at each output step.

Alas, there is a potential flaw with the inference algorithm sketched in (Eq. 26.14) and Fig. 26.9. The problem is that we chose the most likely alignment A, but the most likely alignment may not correspond to the most likely final collapsed output string Y . That’s because there are many possible alignments that lead to the same output string, and hence the most likely output string might correspond to the most probable alignment. For example, imagine the most probable alignment A for an input $X = \left[x_{1} x_{2} x_{3} \right]$ is the string [a b $\epsilon$] but the next two most probable alignments are [b $\epsilon$ b] and [$\epsilon$ b b]. The output $Y =[{b} \{b}]$ , summing over those two alignments, might be more probable than $Y =[{a} \b]$

For this reason, the most probable output sequence Y is the one that has, not the single best CTC alignment, but the highest sum over the probability of all its possible alignments:

$$
\begin{array}{rl} P_{CTC}(Y | X) & = \sum_{A \in B^{- 1}(Y)} P(A | X) \\ & = \sum_{A \in B^{- 1}(Y)} \prod_{t = 1}^{T} p(a_{t} | h_{t}) \\ \hat{Y} & = \underset{Y}{\operatorname{argmax}} P_{CTC}(Y | X) \end{array}\tag{26.15}
$$

Alas, summing over all alignments is very expensive (there are a lot of alignments), so we approximate this sum by using a version of Viterbi beam search that cleverly keeps in the beam the high-probability alignments that map to the same output string, and sums those as an approximation of (Eq. 26.15). See Hannun (2017) for a clear explanation of this extension of beam search for CTC.

Because of the strong conditional independence assumption mentioned earlier (that the output at time t is independent of the output at time t 1, given the input), CTC does not implicitly learn a language model over the data (unlike the attentionbased encoder-decoder architectures). It is therefore essential when using CTC to interpolate a language model (and some sort of length factor $L(Y))$ using interpolation weights that are trained on a dev set:

$$
\operatorname{score}_{\mathrm{CTC}}(Y | X) = \log P_{\mathrm{CTC}}(Y | X) + \lambda_{1} \log P_{\mathrm{LM}}(Y) \lambda_{2} L(Y)\tag{26.16}
$$

## 26.4.2 CTC Training

To train a CTC-based ASR system, we use negative log-likelihood loss with a special CTC loss function. Thus the loss for an entire dataset D is the sum of the negative log-likelihoods of the correct output Y for each input X:

$$
L_{\mathrm{CTC}} = \sum_{(X, Y) \in D} - \log P_{\mathrm{CTC}}(Y | X)\tag{26.17}
$$

To compute CTC loss function for a single input pair (X,Y ), we need the probability of the output Y given the input X. As we saw in Eq. 26.15, to compute the probability of a given output Y we need to sum over all the possible alignments that would collapse to Y . In other words:

$$
P_{\mathrm{CTC}}(Y | X) = \sum_{A \in B^{- 1}(Y)} \prod_{t = 1}^{T} p \left(a_{t} \mid h_{t}\right)\tag{26.18}
$$

Naively summing over all possible alignments in not feasible (there are too many alignments). However, we can efficiently compute the sum by using dynamic programming to merge alignments, with a version of the forward-backward algorithm also used to train HMMs (Appendix A) and CRFs. The original dynamic programming algorithms for both training and inference are laid out in (Graves et al., 2006); see (Hannun, 2017) for a detailed explanation of both.

## 26.4.3 Combining CTC and Encoder-Decoder

It’s also possible to combine the two architectures/loss functions we’ve described, the cross-entropy loss from the encoder-decoder architecture, and the CTC loss. Fig. 26.11 shows a sketch. For training, we can can simply weight the two losses with a λ tuned on a dev set:

$$
L = - \lambda \log P_{encdec}(Y | X) -(1 - \lambda) \log P_{ctc}(Y | X)\tag{26.19}
$$

For inference, we can combine the two with the language model (or the length penalty), again with learned weights:

$$
\hat{Y} = \underset{Y}{\operatorname{argmax}} \left[\lambda \log P_{\text{encdec}}(Y | X) -(1 - \lambda) \log P_{\mathrm{CTC}}(Y | X) + \gamma \log P_{\mathrm{LM}}(Y) \right]\tag{26.20}
$$

![Figure 26.11](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/dbc3ffb907547f1ba306fe0d00cad20a2e7c5df4201013fa4dfc1cbf8d744abe.jpg)  
Figure 26.11 Combining the CTC and encoder-decoder loss functions.

## 26.4.4 Streaming Models: RNN-T for improving CTC

Because of the strong independence assumption in CTC (assuming that the output at time t is independent of the output at time t 1), recognizers based on CTC don’t achieve as high an accuracy as the attention-based encoder-decoder recognizers. CTC recognizers have the advantage, however, that they can be used for streaming. Streaming means recognizing words on-line rather than waiting until the end of the sentence to recognize them. Streaming is crucial for many applications, from commands to dictation, where we want to start recognition while the user is still talking. Algorithms that use attention need to compute the hidden state sequence over the entire input first in order to provide the attention distribution context, before the decoder can start decoding. By contrast, a CTC algorithm can input letters from left to right immediately.

If we want to do streaming, we need a way to improve CTC recognition to remove the conditional independent assumption, enabling it to know about output history. The RNN-Transducer (RNN-T), shown in Fig. 26.12, is just such a model (Graves 2012, Graves et al. 2013a). The RNN-T has two main components: a CTC acoustic model, and a separate language model component called the predictor that conditions on the output token history. At each time step t, the CTC encoder outputs a hidden state $h_{t}^{\mathrm{enc}}$ given the input $x_{1}...x_{t}$ . The language model predictor takes as input the previous output token (not counting blanks), outputting a hidden state $h_{u}^{\mathrm{pred}}$ The two are passed through another network whose output is then passed through a softmax to predict the next character.

$$
\begin{array}{l} P_{RNN - T}(Y | X) = \sum_{A \in B^{- 1}(Y)} P(A | X) \\ = \sum_{A \in B^{- 1}(Y)} \prod_{t = 1}^{T} p(a_{t} | h_{t}, y_{< u_{t}}) \end{array}
$$

![Figure 26.12](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/d6a0b39242c0da92d928b2935a3d5c4726f391e7ccb9df66b595f959f635bd36.jpg)  
Figure 26.12 The RNN-T model computing the output token distribution at time t by integrating the output of a CTC acoustic encoder and a separate ‘predictor’ language model.

## 26.5 ASR Evaluation: Word Error Rate

The standard evaluation metric for speech recognition systems is the word error rate. The word error rate is based on how much the word string returned by the recognizer (the hypothesized word string) differs from a reference transcription. The first step in computing word error is to compute the minimum edit distance in words between the hypothesized and correct strings, giving us the minimum number of word substitutions, word insertions, and word deletions necessary to map between the correct and hypothesized strings. The word error rate (WER) is then defined as follows (note that because the equation includes insertions, the error rate can be greater than 100%):

$$
\text{Word Error Rate} = 100 \times \frac{\text{Insertions} + \text{Substitutions} + \text{Deletions}}{\text{Total Words in Correct Transcript}}
$$

Here is a sample alignment between a reference and a hypothesis utterance from the CallHome corpus, showing the counts used to compute the error rate:

<table><tr><td>REF:</td><td>i ***</td><td>**</td><td colspan="3">UM the PHONE IS</td><td colspan="3">i LEFT THE portable ****</td><td colspan="3">PHONE UPSTAIRS last night</td></tr><tr><td>HYP:</td><td>i GOT</td><td colspan="3">IT TO the ****</td><td colspan="7">FULLLEST i LOVE TO portable FORM OF STORES last night</td></tr><tr><td>Eval:</td><td>I</td><td>I</td><td>S</td><td>D</td><td>S</td><td>S</td><td>S</td><td>I</td><td>S</td><td>S</td><td></td></tr></table>

This utterance has six substitutions, three insertions, and one deletion:

$$
\text{Word Error Rate} = 100 \frac{6 + 3 + 1}{13} = 76.9\%
$$

The standard method for computing word error rates is a free script called sclite, available from the National Institute of Standards and Technologies (NIST) (NIST, 2005). Sclite is given a series of reference (hand-transcribed, gold-standard) sentences and a matching set of hypothesis sentences. Besides performing alignments, and computing word error rate, sclite performs a number of other useful tasks. For example, for error analysis it gives useful information such as confusion matrices showing which words are often misrecognized for others, and summarizes statistics of words that are often inserted or deleted. sclite also gives error rates by speaker (if sentences are labeled for speaker ID), as well as useful statistics like the sentence error rate, the percentage of sentences with at least one word error.

## Statistical significance for ASR: MAPSSWE or MacNemar

As with other language processing algorithms, we need to know whether a particular improvement in word error rate is significant or not.

The standard statistical tests for determining if two word error rates are different is the Matched-Pair Sentence Segment Word Error (MAPSSWE) test, introduced in Gillick and Cox (1989).

The MAPSSWE test is a parametric test that looks at the difference between the number of word errors the two systems produce, averaged across a number of segments. The segments may be quite short or as long as an entire utterance; in general, we want to have the largest number of (short) segments in order to justify the normality assumption and to maximize power. The test requires that the errors in one segment be statistically independent of the errors in another segment. Since ASR systems tend to use trigram LMs, we can approximate this requirement by defining a segment as a region bounded on both sides by words that both recognizers get correct (or by turn/utterance boundaries). Here’s an example from NIST (2007) with four regions:

<table><tr><td></td><td>I</td><td>II</td><td>III</td><td>IV</td></tr><tr><td rowspan="2">REF:</td><td>|it was|</td><td>the best|of|times it|</td><td>was the worst|of times|</td><td>|it was|</td></tr><tr><td></td><td></td><td></td><td></td></tr><tr><td rowspan="2">SYS A:</td><td>|ITS</td><td>|the best|of|times it|</td><td>IS the worst|of times|</td><td>OR|it was|</td></tr><tr><td></td><td></td><td></td><td></td></tr><tr><td>SYS B:</td><td>|it was|</td><td>the best|</td><td>|times it|WON the TEST|of times|</td><td>|it was|</td></tr></table>

In region I, system A has two errors (a deletion and an insertion) and system B has zero; in region III, system A has one error (a substitution) and system B has two. Let’s define a sequence of variables Z representing the difference between the errors in the two systems as follows:

$N_{A}^{i}$ the number of errors made on segment i by system A

$N_{B}^{i}$ the number of errors made on segment i by system B

$$
Z \quad N_{A}^{i} - N_{B}^{i}, i = 1, 2, \dots, n \text{where} n \text{is the number of segments}
$$

In the example above, the sequence of Z values is $\{2, - 1, - 1, 1\}$ . Intuitively, if the two systems are identical, we would expect the average difference, that is, the average of the Z values, to be zero. If we call the true average of the differences $mu_{z},$ we would thus like to know whether $mu_{z} = 0$ . Following closely the original proposal and notation of Gillick and Cox (1989), we can estimate the true average from our limited sample as $\textstyle{\hat{\mu}}_{z} = \sum_{i = 1}^{n} Z_{i} / n$ . The estimate of the variance of the $Z_{i}^{,}$ s is

$$
\sigma_{z}^{2} = \frac{1}{n - 1} \sum_{i = 1}^{n}(Z_{i} - \mu_{z})^{2}\tag{26.21}
$$

Let

$$
W = \frac{\hat{\mu}_{z}}{\sigma_{z} / \sqrt{n}}\tag{26.22}
$$

For a large enough n (> 50), W will approximately have a normal distribution with unit variance. The null hypothesis is $H_{0} : \mu_{z} = 0.$ , and it can thus be rejected if $2 * P(Z \geq | w |) \leq 0.05$ (two-tailed) or $P(Z \geq | w |) \leq 0.05$ (one-tailed), where Z is standard normal and w is the realized value $W;$ these probabilities can be looked up in the standard tables of the normal distribution.

Earlier work sometimes used McNemar’s test for significance, but McNemar’s is only applicable when the errors made by the system are independent, which is not true in continuous speech recognition, where errors made on a word are extremely dependent on errors made on neighboring words.

Could we improve on word error rate as a metric? It would be nice, for example, to have something that didn’t give equal weight to every word, perhaps valuing content words like Tuesday more than function words like a or of. While researchers generally agree that this would be a good idea, it has proved difficult to agree on a metric that works in every application of ASR. For dialogue systems, however, where the desired semantic output is more clear, a metric called slot error rate or concept error rate has proved extremely useful; it is discussed in Chapter 24 on page 519.

## 26.6 TTS

The goal of text-to-speech (TTS) systems is to map from strings of letters to waveforms, a technology that’s important for a variety of applications from dialogue systems to games to education.

Like ASR systems, TTS systems are generally based on the encoder-decoder architecture, either using LSTMs or Transformers. There is a general difference in training. The default condition for ASR systems is to be speaker-independent: they are trained on large corpora with thousands of hours of speech from many speakers because they must generalize well to an unseen test speaker. By contrast, in TTS, it’s less crucial to use multiple voices, and so basic TTS systems are speaker-dependent: trained to have a consistent voice, on much less data, but all from one speaker. For example, one commonly used public domain dataset, the LJ speech corpus, consists of 24 hours of one speaker, Linda Johnson, reading audio books in the LibriVox project (Ito and Johnson, 2017), much smaller than standard ASR corpora which are hundreds or thousands of hours.<sup>2</sup>

We generally break up the TTS task into two components. The first component is an encoder-decoder model for spectrogram prediction: it maps from strings of letters to mel spectrographs: sequences of mel spectral values over time. Thus we

might map from this string:

It’s time for lunch!

to the following mel spectrogram:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/14390cd516ab0ae3d94c78534cbac5f6c65b59ebc4f6025199bdf33eaf424a8f.jpg)

The second component maps from mel spectrograms to waveforms. Generating waveforms from intermediate representations like spectrograms is called vocoding and this second component is called a vocoder:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/fdbb82850d64284208f082b2af6b63225842377721d1c67969bc1c03844d0222.jpg)

These standard encoder-decoder algorithms for TTS are still quite computationally intensive, so a significant focus of modern research is on ways to speed them up.

## 26.6.1 TTS Preprocessing: Text normalization

Before either of these two steps, however, TTS systems require text normalization preprocessing for handling non-standard words: numbers, monetary amounts, dates, and other concepts that are verbalized differently than they are spelled. A TTS system seeing a number like 151 needs to know to verbalize it as one hundred fifty one if it occurs as \$151 but as one fifty one if it occurs in the context 151 Chapultepec Ave.. The number 1750 can be spoken in at least four different ways, depending on the context:

seventeen fifty: (in “The European economy in 1750”)

one seven five zero: (in “The password is 1750”)

seventeen hundred and fifty: (in “1750 dollars”)

one thousand, seven hundred, and fifty: (in “1750 dollars”)

Often the verbalization of a non-standard word depends on its meaning (what Taylor (2009) calls its semiotic class). Fig. 26.13 lays out some English nonstandard word types.

Many classes have preferred realizations. A year is generally read as paired digits (e.g., seventeen fifty for 1750). \$3.2 billion must be read out with the word dollars at the end, as three point two billion dollars, Some abbreviations like N.Y. are expanded (to New York), while other acronyms like GPU are pronounced as letter sequences. In languages with grammatical gender, normalization may depend on morphological properties. In French, the phrase 1 mangue (‘one mangue’) is normalized to une mangue, but 1 ananas (‘one pineapple’) is normalized to un ananas. In German, Heinrich IV (‘Henry IV’) can be normalized to Heinrich der Vierte, Heinrich des Vierten, Heinrich dem Vierten, or Heinrich den Vierten depending on the grammatical case of the noun (Demberg, 2006).

<table><tr><td>semiotic class</td><td>examples</td><td>verbalization</td></tr><tr><td>abbreviations</td><td>gov’t, N.Y., mph</td><td>government</td></tr><tr><td>acronyms read as letters</td><td>GPU, D.C., PC, UN, IBM</td><td>G P U</td></tr><tr><td>cardinal numbers</td><td>12, 45, 1/2, 0.6</td><td>twelve</td></tr><tr><td>ordinal numbers</td><td>May 7, 3rd, Bill Gates III</td><td>seventh</td></tr><tr><td>numbers read as digits</td><td>Room 101</td><td>one oh one</td></tr><tr><td>times</td><td>3.20, 11:45</td><td>eleven forty five</td></tr><tr><td>dates</td><td>28/02 (or in US, 2/28)</td><td>February twenty eighth</td></tr><tr><td>years</td><td>1999, 80s, 1900s, 2045</td><td>nineteen ninety nine</td></tr><tr><td>money</td><td>$3.45, €250, $200K</td><td>threedollarsfortyfive</td></tr><tr><td>moneyintr/m/billions</td><td>$3.45 billion</td><td>three point four five billion dollars</td></tr><tr><td>percentage</td><td>75% 3.4%</td><td>seventy five percent</td></tr></table>

Figure 26.13 Some types of non-standard words in text normalization; see Sproat et al. (2001) and (van Esch and Sproat, 2018) for many more.

Modern end-to-end TTS systems can learn to do some normalization themselves, but TTS systems are only trained on a limited amount of data (like the 220,000 words we mentioned above for the LJ corpus (Ito and Johnson, 2017)), and so a separate normalization step is important.

Normalization can be done by rule or by an encoder-decoder model. Rule-based normalization is done in two stages: tokenization and verbalization. In the tokenization stage we hand-write write rules to detect non-standard words. These can be regular expressions, like the following for detecting years:

## /(1[89][0-9][0-9])<sub>|</sub>(20[0-9][0-9]/

A second pass of rules express how to verbalize each semiotic class. Larger TTS systems instead use more complex rule-systems, like the Kestral system of (Ebden and Sproat, 2015), which first classifies and parses each input into a normal form and then produces text using a verbalization grammar. Rules have the advantage that they don’t require training data, and they can be designed for high precision, but can be brittle, and require expert rule-writers so are hard to maintain.

The alternative model is to use encoder-decoder models, which have been shown to work better than rules for such transduction tasks, but do require expert-labeled training sets in which non-standard words have been replaced with the appropriate verbalization; such training sets for some languages are available (Sproat and Gorman 2018, Zhang et al. 2019).

In the simplest encoder-decoder setting, we simply treat the problem like machine translation, training a system to map from:

They live at 224 Mission St.

to

## They live at two twenty four Mission Street

While encoder-decoder algorithms are highly accurate, they occasionally produce errors that are egregious; for example normalizing 45 minutes as forty five millimeters. To address this, more complex systems use mechanisms like lightweight covering grammars, which enumerate a large set of possible verbalizations but don’t try to disambiguate, to constrain the decoding to avoid such outputs (Zhang et al., 2019).

## 26.6.2 TTS: Spectrogram prediction

The exact same architecture we described for ASR—the encoder-decoder with attention– can be used for the first component of TTS. Here we’ll give a simplified overview of

the Tacotron2 architecture (Shen et al., 2018), which extends the earlier Tacotron (Wang et al., 2017) architecture and the Wavenet vocoder (van den Oord et al., 2016). Fig. 26.14 sketches out the entire architecture.

The encoder’s job is to take a sequence of letters and produce a hidden representation representing the letter sequence, which is then used by the attention mechanism in the decoder. The Tacotron2 encoder first maps every input grapheme to a 512-dimensional character embedding. These are then passed through a stack of 3 convolutional layers, each containing 512 filters with shape 5  1, i.e. each filter spanning 5 characters, to model the larger letter context. The output of the final convolutional layer is passed through a biLSTM to produce the final encoding. It’s common to use a slightly higher quality (but slower) version of attention called location-based attention, in which the computation of the α values (Eq. 11.17 in Chapter 11) makes use of the α values from the prior time-state.

In the decoder, the predicted mel spectrum from the prior time slot is passed through a small pre-net as a bottleneck. This prior output is then concatenated with the encoder’s attention vector context and passed through 2 LSTM layers. The output of this LSTM is used in two ways. First, it is passed through a linear layer, and some output processing, to autoregressively predict one 80-dimensional log-mel filterbank vector frame (50 ms, with a 12.5 ms stride) at each step. Second, it is passed through another linear layer to a sigmoid to make a “stop token prediction” decision about whether to stop producing output.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/8fdfab1265682b525db9a8c534a7e61b1b975741716da72f42da940cd4da71e7.jpg)  
<sub>conditioning inputs</sub> Fig. 1. Block diagram of the Tacotron 2 system architecture.Figure 26.14 The Tacotron2 architecture: An encoder-decoder maps from graphemes to ncrease in temporalmel spectrograms, followed by a vocoder that maps to wavefiles. Figure modified from Shen <sup>iation</sup> <sup>issues.</sup>et al. (2018).

<sup>the</sup> <sup>filterbank We</sup> <sup>minimize</sup> <sup>the</sup> <sup>summed</sup> <sup>mean</sup> <sup>squared</sup> <sup>error</sup> <sup>(MSE)</sup> <sup>from</sup> <sup>before</sup>The system is trained on gold log-mel filterbank features, using teacher forcing, <sub>with a log-likelihood loss by modeling the output distribution with</sub>that is the decoder is fed the correct log-model spectral feature at each decoder step a decoder with atten- <sup>a</sup> <sup>Mixture</sup> <sup>Density</sup> <sup>Network</sup> <sup>[23,</sup> <sup>24]</sup> <sup>to</sup> <sup>avoid</sup> <sup>assuming</sup> instead of the predicted decoder output from the prior step.

## 26.6.3 TTS: Vocoding

normalization [18] probability that the output sequence has completed. This “stop token”The vocoder for Tacotron 2 is an adaptation of the WaveNet vocoder (van den Oord <sup>onvolutional</sup> <sup>layers prediction</sup> <sup>is</sup> <sup>used</sup> <sup>during</sup> <sup>inference</sup> <sup>to</sup> <sup>allow</sup> <sup>the</sup> <sup>model</sup> <sup>to</sup> <sup>dynamically</sup>et al., 2016). Here we’ll give a somewhat simplified description of vocoding using WaveNet.

<sup>512</sup> <sup>units</sup> <sup>(256 frame</sup> <sup>for</sup> <sup>which</sup> <sup>this</sup> <sup>probability</sup> <sup>exceeds</sup> <sup>a</sup> <sup>threshold</sup> <sup>of</sup> <sup>0.5.</sup>Recall that the goal of the vocoding process here will be to invert a log mel spectrum representations back into a time-domain waveform representation. WaveNet is ength context vector using zoneout [26] with probability 0.1. In order to introduce outputan autoregressive network, like the language models we introduced in Chapter 9. It takes spectrograms as input and produces audio output represented as sequences of 8-bit mu-law (page 536). The probability of a waveform , a sequence of 8-bit mulaw values $Y = y_{1},..., y_{t}$ , given an intermediate input mel spectrogram h is computed as:

$$
p(Y) = \prod_{t = 1}^{t} P \left(y_{t} \mid y_{1}, \dots, y_{t - 1}, h_{1}, \dots, h_{t}\right)\tag{26.23}
$$

This probability distribution is modeled by a stack of special convolution layers,<sup>in</sup> <sup>Fig.</sup> <sup>2</sup> <sup>the</sup> <sup>receptive</sup> <sup>field</sup> <sup>is</sup> <sup>only</sup> <sup>5</sup> <sup>(=</sup> <sup>#layers</sup> <sup>+</sup> <sup>filter</sup> <sup>length</sup> <sup>-</sup> <sup>1).</sup> <sup>In</sup> <sup>this</sup> <sup>paper</sup> which include a specific convolutional structure called dilated convolutions, and a specific non-linearity function.

<sub>A</sub> <sub>dilated</sub> <sub>convolution</sub> <sub>is</sub> <sub>a</sub> <sub>subtype</sub> <sub>of causal convolutional</sub> <sub>layer.</sub> <sub>Causal</sub> <sub>or</sub> convolution (also called a trous \` , or convolution with holes) is a convolution wh <sub>masked</sub> <sub>convolutions</sub> <sub>look</sub> <sub>only</sub> <sub>at</sub> <sub>the</sub> <sub>past</sub> <sub>input,</sub> <sub>rather</sub> <sub>than</sub> <sub>the</sub> <sub>future;</sub> <sub>the</sub> <sub>pre-</sub>s applied over an area larger than its length by skipping input values with a certain ste diction of $y_{t + 1}$ can only depend on $y_{1},..., y_{t}$ , useful for autoregressive left-to-right processing. In dilated convolutions, at each successive layer we apply the convolutional filter over a span longer than its length by skipping input values. Thus at time <sup>t with</sup> <sup>a</sup> <sup>dilation</sup> <sup>value</sup> <sup>of</sup> <sup>1,</sup> <sup>a</sup> <sup>convolutional</sup> <sup>filter</sup> <sup>of</sup> <sup>length</sup> <sup>2</sup> <sup>would</sup> <sup>see</sup> <sup>input</sup> <sup>values</sup>ds the standard convolution. Fig. 3 depicts dilated causal convolutions for dilations 1 xt andDilat $x_{t - 1}$ . But a filter with a distillation value of 2 would skip an input, so wouldnvolutions have previously been used in various contexts, e.g. signal proc see input valueschneider et al., 1 $x_{t}$ and9; D $x_{t - 1}$ . Fig. 26.15 shows the computation of the output at timeeux, 1989), and image segmentation (Chen et al., 2015; t with 4 dilated convolution layers with dilation values, 1, 2, 4, and 8.<sup>,</sup> <sup>2016).</sup>

![Figure 26.15](../../../transcripts/mineru/speech-language-processing/parts/part-003-pages-401-600/images/f8030bf30052c02cddc3ae6a1ae30b15747db0c04cd64f21df99b5cfa46a23cb.jpg)  
Figure 26.15 Dilated convolutions, showing one dilation cycle size of 4, i.e., dilation values of 1, 2, 4, 8. Figure from van den Oord et al. (2016).

The Tacotron 2 synthesizer uses 12 convolutional layers in two cycles with a hile preserving the input resolution throughout the network as well as computational effi<sup>dilation</sup> <sup>cycle</sup> <sup>size</sup> <sup>of</sup> <sup>6,</sup> <sup>meaning</sup> <sup>that</sup> <sup>the</sup> <sup>first</sup> <sup>6</sup> <sup>layers</sup> <sup>have</sup> <sup>dilations</sup> <sup>of</sup> <sup>1,</sup> <sup>2,</sup> <sup>4,</sup> <sup>8,</sup> <sup>16,</sup> paper, the dilation is doubled for every layer up to a limit and then repeated: e.g.and 32. and the next 6 layers again have dilations of 1, 2, 4, 8, 16, and 32. Dilated convolutions allow the vocoder to grow the receptive field exponentially with depth.

WaveNet predicts mu-law audio samples. Recall from page 536 that this is a standard compression for audio in which the values at each sampling timestep are compressed into 8-bits. This means that we can predict the value of each sample ative (non-linear) counterpart of a 1 1024 convolution. Second, stacking these blocks<sup>with</sup> <sup>a</sup> <sup>simple</sup> <sup>256-way</sup> <sup>categorical</sup> <sup>classifier.</sup> <sup>The</sup> <sup>output</sup> <sup>of</sup> <sup>the</sup> <sup>dilated</sup> <sup>convolutions</sup> ses the model capacity and the receptive field size.is thus passed through a softmax which makes this 256-way decision.

The spectrogram prediction encoder-decoder and the WaveNet vocoder are trained separately. After the spectrogram predictor is trained, the spectrogram prediction network is run in teacher-forcing mode, with each predicted spectral frame conditioned on the encoded text input and the previous frame from the ground truth spectrogram. This sequence of ground truth-aligned spectral features and gold audio output is then used to train the vocoder.

This has been only a high-level sketch of the TTS process. There are numerreasons is that a categorical distribution is more flexible and can more easily model ar<sup>ous</sup> <sup>important</sup> <sup>details</sup> <sup>that</sup> <sup>the</sup> <sup>reader</sup> <sup>interested</sup> <sup>in</sup> <sup>going</sup> <sup>further</sup> <sup>with</sup> <sup>TTS</sup> <sup>may</sup> <sup>want</sup> to look into. For example WaveNet uses a special kind of a gated activation function as its non-linearity, and contains residual and skip connections. In practice, predicting 8-bit audio values doesn’t as work as well as 16-bit, for which a simple softmax is insufficient, so decoders use fancier ways as the last step of predicting audio sample values, like mixtures of distributions. Finally, the WaveNet vocoder as we have described it would be so slow as to be useless; many different kinds of efficiency improvements are necessary in practice, for example by finding ways to do non-autoregressive generation, avoiding the latency of having to wait to generate each frame until the prior frame has been generated, and instead making predictions in parallel. We encourage the interested reader to consult the original papers and various version of the code.

## 26.6.4 TTS Evaluation

Speech synthesis systems are evaluated by human listeners. (The development of a good automatic metric for synthesis evaluation, one that would eliminate the need for expensive and time-consuming human listening experiments, remains an open and exciting research topic.)

We evaluate the quality of synthesized utterances by playing a sentence to listeners and ask them to give a mean opinion score (MOS), a rating of how good the synthesized utterances are, usually on a scale from 1–5. We can then compare systems by comparing their MOS scores on the same sentences (using, e.g., paired t-tests to test for significant differences).

If we are comparing exactly two systems (perhaps to see if a particular change actually improved the system), we can use AB tests. In AB tests, we play the same sentence synthesized by two different systems (an A and a B system). The human listeners choose which of the two utterances they like better. We do this for say 50 sentences (presented in random order) and compare the number of sentences preferred for each system.

## 26.7 Other Speech Tasks

While we have focused on speech recognition and TTS in this chapter, there are a wide variety of speech-related tasks.

The task of wake word detection is to detect a word or short phrase, usually in order to wake up a voice-enable assistant like Alexa, Siri, or the Google Assistant. The goal with wake words is build the detection into small devices at the computing edge, to maintain privacy by transmitting the least amount of user speech to a cloudbased server. Thus wake word detectors need to be fast, small footprint software that can fit into embedded devices. Wake word detectors usually use the same frontend feature extraction we saw for ASR, often followed by a whole-word classifier.

Speaker diarization is the task of determining ‘who spoke when’ in a long multi-speaker audio recording, marking the start and end of each speaker’s turns in the interaction. This can be useful for transcribing meetings, classroom speech, or medical interactions. Often diarization systems use voice activity detection (VAD) to find segments of continuous speech, extract speaker embedding vectors, and cluster the vectors to group together segments likely from the same speaker. More recent work is investigating end-to-end algorithms to map directly from input speech to a sequence of speaker labels for each frame.

Speaker recognition, is the task of identifying a speaker. We generally distinguish the subtasks of speaker verification, where we make a binary decision (is this speaker X or not?), such as for security when accessing personal information over the telephone, and speaker identification, where we make a one of N decision trying to match a speaker’s voice against a database of many speakers . These tasks are related to language identification, in which we are given a wavefile and must identify which language is being spoken; this is useful for example for automatically directing callers to human operators that speak appropriate languages.

## 26.8 Summary

This chapter introduced the fundamental algorithms of automatic speech recognition (ASR) and text-to-speech (TTS).

- The task of speech recognition (or speech-to-text) is to map acoustic waveforms to sequences of graphemes.

- The input to a speech recognizer is a series of acoustic waves. that are sampled, quantized, and converted to a spectral representation like the log mel spectrum.

- Two common paradigms for speech recognition are the encoder-decoder with attention model, and models based on the CTC loss function. Attentionbased models have higher accuracies, but models based on CTC more easily adapt to streaming: outputting graphemes online instead of waiting until the acoustic input is complete.

- ASR is evaluated using the Word Error Rate; the edit distance between the hypothesis and the gold transcription.

- TTS systems are also based on the encoder-decoder architecture. The encoder maps letters to an encoding, which is consumed by the decoder which generates mel spectrogram output. A neural vocoder then reads the spectrogram and generates waveforms.

- TTS systems require a first pass of text normalization to deal with numbers and abbreviations and other non-standard words.

- TTS is evaluated by playing a sentence to human listeners and having them give a mean opinion score (MOS) or by doing AB tests.

## Bibliographical and Historical Notes

ASR A number of speech recognition systems were developed by the late 1940s and early 1950s. An early Bell Labs system could recognize any of the 10 digits from a single speaker (Davis et al., 1952). This system had 10 speaker-dependent stored patterns, one for each digit, each of which roughly represented the first two vowel formants in the digit. They achieved 97%–99% accuracy by choosing the pattern that had the highest relative correlation coefficient with the input. Fry (1959) and Denes (1959) built a phoneme recognizer at University College, London, that recognized four vowels and nine consonants based on a similar pattern-recognition principle. Fry and Denes’s system was the first to use phoneme transition probabilities to constrain the recognizer.

The late 1960s and early 1970s produced a number of important paradigm shifts. First were a number of feature-extraction algorithms, including the efficient fast Fourier transform (FFT) (Cooley and Tukey, 1965), the application of cepstral processing to speech (Oppenheim et al., 1968), and the development of LPC for speech coding (Atal and Hanauer, 1971). Second were a number of ways of handling warping; stretching or shrinking the input signal to handle differences in speaking rate and segment length when matching against stored patterns. The natural algorithm for solving this problem was dynamic programming, and, as we saw in Appendix A, the algorithm was reinvented multiple times to address this problem. The first application to speech processing was by Vintsyuk (1968), although his result was not picked up by other researchers, and was reinvented by Velichko and Zagoruyko (1970) and Sakoe and Chiba (1971) (and (1984)). Soon afterward, Itakura (1975) combined this dynamic programming idea with the LPC coefficients that had previously been used only for speech coding. The resulting system extracted LPC features from incoming words and used dynamic programming to match them against stored LPC templates. The non-probabilistic use of dynamic programming to match a template against incoming speech is called dynamic time warping.

The third innovation of this period was the rise of the HMM. Hidden Markov models seem to have been applied to speech independently at two laboratories around 1972. One application arose from the work of statisticians, in particular Baum and colleagues at the Institute for Defense Analyses in Princeton who applied HMMs to various prediction problems (Baum and Petrie 1966, Baum and Eagon 1967). James Baker learned of this work and applied the algorithm to speech processing (Baker, 1975a) during his graduate work at CMU. Independently, Frederick Jelinek and collaborators (drawing from their research in information-theoretical models influenced by the work of Shannon (1948)) applied HMMs to speech at the IBM Thomas J. Watson Research Center (Jelinek et al., 1975). One early difference was the decoding algorithm; Baker’s DRAGON system used Viterbi (dynamic programming) decoding, while the IBM system applied Jelinek’s stack decoding algorithm (Jelinek, 1969). Baker then joined the IBM group for a brief time before founding the speech-recognition company Dragon Systems.

The use of the HMM, with Gaussian Mixture Models (GMMs) as the phonetic component, slowly spread through the speech community, becoming the dominant paradigm by the 1990s. One cause was encouragement by ARPA, the Advanced Research Projects Agency of the U.S. Department of Defense. ARPA started a five-year program in 1971 to build 1000-word, constrained grammar, few speaker speech understanding (Klatt, 1977), and funded four competing systems of which Carnegie-Mellon University’s Harpy system (Lowerre, 1968), which used a simplified version of Baker’s HMM-based DRAGON system was the best of the tested systems. ARPA (and then DARPA) funded a number of new speech research programs, beginning with 1000-word speaker-independent read-speech tasks like “Resource Management” (Price et al., 1988), recognition of sentences read from the Wall Street Journal (WSJ), Broadcast News domain (LDC 1998, Graff 1997) (transcription of actual news broadcasts, including quite difficult passages such as on-the-street interviews) and the Switchboard, CallHome, CallFriend, and Fisher domains (Godfrey et al. 1992, Cieri et al. 2004) (natural telephone conversations between friends or strangers). Each of the ARPA tasks involved an approximately annual bakeoff at which systems were evaluated against each other. The ARPA competitions resulted in wide-scale borrowing of techniques among labs since it was easy to see which ideas reduced errors the previous year, and the competitions were probably an important factor in the eventual spread of the HMM paradigm

By around 1990 neural alternatives to the HMM/GMM architecture for ASR arose, based on a number of earlier experiments with neural networks for phoneme recognition and other speech tasks. Architectures included the time-delay neural network (TDNN)—the first use of convolutional networks for speech— (Waibel et al. 1989, Lang et al. 1990), RNNs (Robinson and Fallside, 1991), and the hybrid HMM/MLP architecture in which a feedforward neural network is trained as a phonetic classifier whose outputs are used as probability estimates for an HMM-based architecture (Morgan and Bourlard 1990, Bourlard and Morgan 1994, Morgan and Bourlard 1995).

While the hybrid systems showed performance close to the standard HMM/GMM models, the problem was speed: large hybrid models were too slow to train on the CPUs of that era. For example, the largest hybrid system, a feedforward network, was limited to a hidden layer of 4000 units, producing probabilities over only a few dozen monophones. Yet training this model still required the research group to design special hardware boards to do vector processing (Morgan and Bourlard, 1995). A later analytic study showed the performance of such simple feedforward MLPs for ASR increases sharply with more than 1 hidden layer, even controlling for the total number of parameters (Maas et al., 2017). But the computational resources of the time were insufficient for more layers.

Over the next two decades a combination of Moore’s law and the rise of GPUs allowed deep neural networks with many layers. Performance was getting close to traditional systems on smaller tasks like TIMIT phone recognition by 2009 (Mohamed et al., 2009), and by 2012, the performance of hybrid systems had surpassed traditional HMM/GMM systems (Jaitly et al. 2012, Dahl et al. 2012, inter alia). Originally it seemed that unsupervised pretraining of the networks using a technique like deep belief networks was important, but by 2013, it was clear that for hybrid HMM/GMM feedforward networks, all that mattered was to use a lot of data and enough layers, although a few other components did improve performance: using log mel features instead of MFCCs, using dropout, and using rectified linear units (Deng et al. 2013, Maas et al. 2013, Dahl et al. 2013).

Meanwhile early work had proposed the CTC loss function by 2006 (Graves et al., 2006), and by 2012 the RNN-Transducer was defined and applied to phone recognition (Graves 2012, Graves et al. 2013a), and then to end-to-end speech recognition rescoring (Graves and Jaitly, 2014), and then recognition (Maas et al., 2015), with advances such as specialized beam search (Hannun et al., 2014). (Our description of CTC in the chapter draws on Hannun (2017), which we encourage the interested reader to follow).

The encoder-decoder architecture was applied to speech at about the same time by two different groups, in the Listen Attend and Spell system of Chan et al. (2016) and the attention-based encoder decoder architecture of Chorowski et al. (2014) and Bahdanau et al. (2016). By 2018 Transformers were included in this encoderdecoder architecture. Karita et al. (2019) is a nice comparison of RNNs vs Transformers in encoder-architectures for ASR, TTS, and speech-to-speech translation.

Popular toolkits for speech processing include Kaldi (Povey et al., 2011) and ESPnet (Watanabe et al. 2018, Hayashi et al. 2020).

TTS As we noted at the beginning of the chapter, speech synthesis is one of the earliest fields of speech and language processing. The 18th century saw a number of physical models of the articulation process, including the von Kempelen model mentioned above, as well as the 1773 vowel model of Kratzenstein in Copenhagen

using organ pipes.

The early 1950s saw the development of three early paradigms of waveform synthesis: formant synthesis, articulatory synthesis, and concatenative synthesis.

Modern encoder-decoder systems are distant descendants of formant synthesizers. Formant synthesizers originally were inspired by attempts to mimic human speech by generating artificial spectrograms. The Haskins Laboratories Pattern Playback Machine generated a sound wave by painting spectrogram patterns on a moving transparent belt and using reflectance to filter the harmonics of a waveform (Cooper et al., 1951); other very early formant synthesizers include those of Lawrence (1953) and Fant (1951). Perhaps the most well-known of the formant synthesizers were the Klatt formant synthesizer and its successor systems, including the MITalk system (Allen et al., 1987) and the Klattalk software used in Digital Equipment Corporation’s DECtalk (Klatt, 1982). See Klatt (1975) for details.

A second early paradigm, concatenative synthesis, seems to have been first proposed by Harris (1953) at Bell Laboratories; he literally spliced together pieces of magnetic tape corresponding to phones. Soon afterwards, Peterson et al. (1958) proposed a theoretical model based on diphones, including a database with multiple copies of each diphone with differing prosody, each labeled with prosodic features including F0, stress, and duration, and the use of join costs based on F0 and formant distance between neighboring units. But such diphone synthesis models were not actually implemented until decades later (Dixon and Maxey 1968, Olive 1977). The 1980s and 1990s saw the invention of unit selection synthesis, based on larger units of non-uniform length and the use of a target cost, (Sagisaka 1988, Sagisaka et al. 1992, Hunt and Black 1996, Black and Taylor 1994, Syrdal et al. 2000).

A third paradigm, articulatory synthesizers attempt to synthesize speech by modeling the physics of the vocal tract as an open tube. Representative models include Stevens et al. (1953), Flanagan et al. (1975), and Fant (1986). See Klatt (1975) and Flanagan (1972) for more details.

Most early TTS systems used phonemes as input; development of the text analysis components of TTS came somewhat later, drawing on NLP. Indeed the first true text-to-speech system seems to have been the system of Umeda and Teranishi (Umeda et al. 1968, Teranishi and Umeda 1968, Umeda 1976), which included a parser that assigned prosodic boundaries, as well as accent and stress.

## Exercises

26.1 Analyze each of the errors in the incorrectly recognized transcription of “um the phone is I left the. . . ” on page 562. For each one, give your best guess as to whether you think it is caused by a problem in signal processing, pronunciation modeling, lexicon size, language model, or pruning in the decoding search.

Abadi, M., Agarwal, A., Barham, P., Brevdo, E., Chen, Z., Citro, C., Corrado, G. S., Davis, A., Dean, J., Devin, M., Ghemawat, S., Goodfellow, I., Harp, A., Irving, G., Isard, M., Jia, Y., Jozefowicz, R., Kaiser, L., Kudlur, M., Levenberg, J., Mane, D., Monga,´ R., Moore, S., Murray, D., Olah, C., Schuster, M., Shlens, J., Steiner, B., Sutskever, I., Talwar, K., Tucker, P., Vanhoucke, V., Vasudevan, V., Viegas,´ F., Vinyals, O., Warden, P., Wattenberg, M., Wicke, M., Yu, Y., and Zheng, X. (2015). TensorFlow: Largescale machine learning on heteroge neous systems.. Software available from tensorflow.org.

Abney, S. P., Schapire, R. E., and Singer, Y. (1999). Boosting applied to tagging and PP attachment. EMNLP/VLC.

Agarwal, O., Subramanian, S., Nenkova, A., and Roth, D. (2019). Evaluation of named entity corefer ence. Workshop on Computational Models of Reference, Anaphora and Coreference.

Aggarwal, C. C. and Zhai, C. (2012). A survey of text classification algorithms. Aggarwal, C. C. and Zhai, C. (Eds.), Mining text data, 163–222. Springer.

Agichtein, E. and Gravano, L. (2000). Snowball: Extracting relations from large plain-text collections. Proceed ings of the 5th ACM International Conference on Digital Libraries.

Agirre, E. and de Lacalle, O. L. (2003). Clustering WordNet word senses. RANLP 2003.

Agirre, E., Banea, C., Cardie, C., Cer, D., Diab, M., Gonzalez-Agirre, A., Guo, W., Lopez-Gazpio, I., Maritxalar, M., Mihalcea, R., Rigau, G., Uria, L., and Wiebe, J. (2015). 2015 SemEval-2015 Task 2: Semantic Textual Similarity, English, Spanish and Pilot on Interpretability. SemEval-15.

Agirre, E., Diab, M., Cer, D., and Gonzalez-Agirre, A. (2012). Semeval 2012 task 6: A pilot on semantic textual similarity. SemEval-12.

Agirre, E. and Edmonds, P. (Eds.). (2006). Word Sense Disambiguation: Algorithms and Applications. Kluwer.

Agirre, E. and Martinez, D. (2001). Learning class-to-class selectional preferences. CoNLL.

Aho, A. V., Sethi, R., and Ullman, J. D. (1986). Compilers: Principles, Tech niques, and Tools. Addison-Wesley.

Aho, A. V. and Ullman, J. D. (1972). The Theory of Parsing, Translation, and Compiling, Vol. 1. Prentice Hall.

## Bibliography

Ajdukiewicz, K. (1935). Die syntaktische Konnexitat.¨ Studia Philosophica 1, 1–27. English translation “Syntactic Connexion” by H. Weber in McCall, S. (Ed.) 1967. Polish Logic, pp. 207– 231, Oxford University Press.

Alberti, C., Lee, K., and Collins, M. (2019). A BERT baseline for the natural questions. http://arxiv.org/ abs/1901.08634.

Algoet, P. H. and Cover, T. M. (1988). A sandwich proof of the Shannon-McMillan-Breiman theorem. The Annals of Probability 16(2), 899–909.

Allen, J. (1984). Towards a general theory of action and time. Artificial Intelligence 23(2), 123–154.

Allen, J. and Perrault, C. R. (1980). Analyzing intention in utterances. Artificial Intelligence 15, 143–178.

Allen, J., Hunnicut, M. S., and Klatt, D. H. (1987). From Text to Speech: The MITalk system. Cambridge University Press.

Althoff, T., Danescu-Niculescu-Mizil, C., and Jurafsky, D. (2014). How to ask for a favor: A case study on the success of altruistic requests. ICWSM 2014.

Amsler, R. A. (1981). A taxonomy of English nouns and verbs. ACL.

An, J., Kwak, H., and Ahn, Y.-Y. (2018). SemAxis: A lightweight framework to characterize domainspecific word semantics beyond sentiment. ACL.

Anastasopoulos, A. and Neubig, G. (2020). Should all cross-lingual embeddings speak English?. ACL.

Antoniak, M. and Mimno, D. (2018). Evaluating the stability of embeddingbased word similarities. TACL 6, 107– 119.

Aone, C. and Bennett, S. W. (1995). Evaluating automated and manual acquisition of anaphora resolution strategies. ACL.

Ariel, M. (2001). Accessibility theory: An overview. Sanders, T., Schilperoord, J., and Spooren, W. (Eds.), Text Representation: Linguistic and Psycholinguistic Aspects, 29–87. Benjamins.

Artetxe, M. and Schwenk, H. (2019). Massively multilingual sentence embeddings for zero-shot cross-lingual transfer and beyond. TACL 7, 597– 610.

Artstein, R., Gandhe, S., Gerten, J., Leuski, A., and Traum, D. (2009). Semi-formal evaluation of conversational characters. Languages: From Formal to Natural, 22–35. Springer.

Asher, N. (1993). Reference to Abstract Objects in Discourse. Studies in Linguistics and Philosophy (SLAP) 50, Kluwer.

Asher, N. and Lascarides, A. (2003). Logics of Conversation. Cambridge University Press.

Atal, B. S. and Hanauer, S. (1971). Speech analysis and synthesis by prediction of the speech wave. JASA 50, 637–655.

Austin, J. L. (1962). How to Do Things with Words. Harvard University Press.

Awadallah, A. H., Kulkarni, R. G., Ozertem, U., and Jones, R. (2015). Charaterizing and predicting voice query reformulation. CIKM-15.

Baayen, R. H. (2001). Word frequency distributions. Springer.

Baayen, R. H., Piepenbrock, R., and Gulikers, L. (1995). The CELEX Lexical Database (Release 2) [CD-ROM]. Linguistic Data Consortium, University of Pennsylvania [Distributor].

Baccianella, S., Esuli, A., and Sebastiani, F. (2010). Sentiwordnet 3.0: An enhanced lexical resource for sentiment analysis and opinion mining. LREC.

Bach, K. and Harnish, R. (1979). Linguistic communication and speech acts. MIT Press.

Backus, J. W. (1959). The syntax and semantics of the proposed international algebraic language of the Zurich ACM-GAMM Conference. Information Processing: Proceedings of the International Conference on Information Processing, Paris. UNESCO

Backus, J. W. (1996). Transcript of question and answer session. Wexelblat, R. L. (Ed.), History of Programming Languages, p. 162. Academic Press.

Bada, M., Eckert, M., Evans, D., Garcia, K., Shipley, K., Sitnikov, D., Baumgartner, W. A., Cohen, K. B., Verspoor, K., Blake, J. A., and Hunter, L. E. (2012). Concept annotation in the craft corpus. BMC bioinformatics 13(1), 161.

Bagga, A. and Baldwin, B. (1998). Algorithms for scoring coreference chains. LREC.

Bahdanau, D., Chorowski, J., Serdyuk, D., Brakel, P., and Bengio, Y. (2016). End-to-end attention-based large vocabulary speech recognition. ICASSP.

Bahl, L. R. and Mercer, R. L. (1976). Part of speech assignment by a statistical decision algorithm. Proceedings IEEE International Symposium on Information Theory.

Bahl, L. R., Jelinek, F., and Mercer, R. L. (1983). A maximum likelihood approach to continuous speech recognition. IEEE Transactions on Pattern Analysis and Machine Intelligence 5(2), 179–190.

in Computers 1, 91–163. Academic Press.

Baker, C. F., Fillmore, C. J., and Lowe, J. B. (1998). The Berkeley FrameNet project. COLING/ACL.

Barker, C. (2010). Nominals don’t provide criteria of identity. Rathert, M. and Alexiadou, A. (Eds.), The Semantics of Nominalizations across Languages and Frameworks, 9–24. Mouton.

Bedi, G., Carrillo, F., Cecchi, G. A., Slezak, D. F., Sigman, M., Mota, N. B., Ribeiro, S., Javitt, D. C., Copelli, M., and Corcoran, C. M. (2015). Automated analysis of free speech predicts psychosis onset in high-risk youths. npj Schizophrenia 1.

Baker, J. K. (1975a). The DRAGON system – An overview. IEEE Transactions on Acoustics, Speech, and Signal Processing ASSP-23(1), 24–29.

Barzilay, R. and Lapata, M. (2005). Modeling local coherence: An entitybased approach. ACL.

Baker, J. K. (1975b). Stochastic modeling for automatic speech understanding. Reddy, D. R. (Ed.), Speech Recognition. Academic Press.

Barzilay, R. and Lapata, M. (2008). Modeling local coherence: An entitybased approach. Computational Linguistics 34(1), 1–34.

Barzilay, R. and Lee, L. (2004). Catching the drift: Probabilistic content models, with applications to generation and summarization. HLT-NAACL.

Baldridge, J., Asher, N., and Hunter, J. (2007). Annotation for and robust parsing of discourse structure on unrestricted texts. Zeitschrift fur Sprach-¨ wissenschaft 26, 213–239.

Bejcekˇ , E., Hajicovˇ a, E., Haji´ c, J.,ˇ J´ınova, P., Kettnerov´ a, V., Kol´ a´ˇrova,´ V., Mikulova, M., M´ ´ırovsky, J.,´ Nedoluzhko, A., Panevova, J.,´ Polakov´ a, L.,´ Sev<sup>ˇ</sup> cˇ´ıkova, M.,´ St<sup>ˇ</sup> epˇ anek, J., and Zik´ anov´ a,´ S. (2013).<sup>ˇ</sup> Prague dependency treebank 3.0. Tech. rep., Institute of Formal and Applied Linguistics, Charles University in Prague. LINDAT/CLARIN digital library at Institute of Formal and Applied Linguistics, Charles University in Prague.

Bamman, D., Lewke, O., and Mansoor, A. (2020). An annotated dataset of coreference in english literature. LREC.

Basile, P., Caputo, A., and Semeraro, G. (2014). An enhanced Lesk word sense disambiguation algorithm through a distributional semantic model. COLING.

Bamman, D., O’Connor, B., and Smith, N. A. (2013). Learning latent personas of film characters. ACL.

Bellegarda, J. R. (1997). A latent semantic analysis framework for large-span language modeling. EU-ROSPEECH.

Bamman, D., Popat, S., and Shen, S. (2019). An annotated dataset of literary entities. NAACL HLT.

Baum, L. E. and Eagon, J. A. (1967). An inequality with applications to statistical estimation for probabilistic functions of Markov processes and to a model for ecology. Bulletin of the American Mathematical Society 73(3), 360–363.

Banarescu, L., Bonial, C., Cai, S., Georgescu, M., Griffitt, K., Hermjakob, U., Knight, K., Koehn, P., Palmer, M., and Schneider, N. (2013). Abstract meaning representation for sembanking. 7th Linguistic Annotation Workshop and Interoperability with Discourse.

Baum, L. E. and Petrie, T. (1966). Statistical inference for probabilistic functions of finite-state Markov chains. Annals of Mathematical Statistics 37(6), 1554–1563.

Bellegarda, J. R. (2000). Exploiting latent semantic information in statistical language modeling. Proceedings of the IEEE 89(8), 1279–1296.

Baum, L. F. (1900). The Wizard of Oz. Available at Project Gutenberg.

Banerjee, S. and Lavie, A. (2005). ME-TEOR: An automatic metric for MT evaluation with improved correlation with human judgments. Proceedings of ACL Workshop on Intrinsic and Extrinsic Evaluation Measures for MT and/or Summarization.

Bayes, T. (1763). An Essay Toward Solving a Problem in the Doctrine of Chances, Vol. 53. Reprinted in Facsimiles of Two Papers by Bayes, Hafner Publishing, 1963.

Bellegarda, J. R. (2013). Natural language technology in mobile devices: Two grounding frameworks. Mobile Speech and Advanced Natural Language Solutions, 185–196. Springer.

Bazell, C. E. (1952/1966). The correspondence fallacy in structural linguistics. Hamp, E. P., Householder, F. W., and Austerlitz, R. (Eds.), Studies by Members of the English Department, Istanbul University (3), reprinted in Readings in Linguistics II (1966), 271–298. University of Chicago Press.

Bellman, R. (1957). Dynamic Programming. Princeton University Press.

Bellman, R. (1984). Eye of the Hurricane: an autobiography. World Scientific Singapore.

Bender, E. M. (2019). The #benderrule: On naming the languages we study and why it matters. https://thegradient.pub/ the-benderrule-on-naming-the-languages-we-study-and-why-it-ma

Banko, M., Cafarella, M., Soderland, S., Broadhead, M., and Etzioni, O. (2007). Open information extraction for the web. IJCAI.

Bender, E. M. and Friedman, B. (2018). Data statements for natural language processing: Toward mitigating system bias and enabling better science. TACL 6, 587–604.

Bean, D. and Riloff, E. (1999). Corpusbased identification of non-anaphoric noun phrases. ACL.

Ban˜ on´ , M., Chen, P., Haddow, B., Heafield, K., Hoang, H., Espla-Gomis,\` M., Forcada, M. L., Kamran, A., Kirefu, F., Koehn, P., Ortiz Rojas, S., Pla Sempere, L., Ram´ırez-Sanchez,´ G., Sarr´ıas, E., Strelec, M., Thompson, B., Waites, W., Wiggins, D., and Zaragoza, J. (2020). ParaCrawl: Webscale acquisition of parallel corpora. ACL.

Bender, E. M. and Koller, A. (2020). Climbing towards NLU: On meaning, form, and understanding in the age of data. ACL.

Bean, D. and Riloff, E. (2004). Unsupervised learning of contextual role knowledge for coreference resolution. HLT-NAACL.

Bengio, Y., Courville, A., and Vincent, P. (2013). Representation learning: A review and new perspectives. IEEE Transactions on Pattern Analysis and Machine Intelligence 35(8), 1798–1828.

Bar-Hillel, Y. (1953). A quasiarithmetical notation for syntactic description. Language 29, 47–58.

Beckman, M. E. and Ayers, G. M. (1997). Guidelines for ToBI labelling. Unpublished manuscript, Ohio State University, http://www. ling.ohio-state.edu/research/ phonetics/E\_ToBI/.

Bengio, Y., Ducharme, R., Vincent, P., and Jauvin, C. (2003). A neura probabilistic language model. Journal of machine learning research 3(Feb), 1137–1155.

Bar-Hillel, Y. (1960). The present status of automatic translation of lan guages. Alt, F. (Ed.), Advances

Beckman, M. E. and Hirschberg, J. (1994). The ToBI annotation conventions. Manuscript, Ohio State University.

Bengio, Y., Lamblin, P., Popovici, D., and Larochelle, H. (2007). Greedy layer-wise training of deep networks. NeurIPS.

Bengio, Y., Schwenk, H., Senecal,´ J.-S., Morin, F., and Gauvain, J.- L. (2006). Neural probabilistic lan guage models. Innovations in Machine Learning, 137–186. Springer.

Bishop, C. M. (2006). Pattern recognition and machine learning. Springer.

Bobrow, D. G. and Norman, D. A. (1975). Some principles of memory schemata. Bobrow, D. G. and Collins, A. (Eds.), Representation and Understanding. Academic Press.

Bengtson, E. and Roth, D. (2008). Un derstanding the value of features fo coreference resolution. EMNLP.

Bisk, Y., Holtzman, A., Thomason, J., Andreas, J., Bengio, Y., Chai, J., Lapata, M., Lazaridou, A., May, J., Nisnevich, A., Pinto, N., and Turian, J. (2020). Experience grounds language.. arXiv preprint arXiv:2004.10151.

Bobrow, D. G. and Winograd, T. (1977). An overview of KRL, a knowledge representation language. Cognitive Science 1(1), 3–46.

Bennett, R. and Elfner, E. (2019). The syntax–prosody interface. Annual Re view of Linguistics 5, 151–171.

Berant, J., Chou, A., Frostig, R., and Liang, P. (2013). Semantic parsing on freebase from question-answer pairs. EMNLP.

Bizer, C., Lehmann, J., Kobilarov, G., Auer, S., Becker, C., Cyganiak, R., and Hellmann, S. (2009). DBpedia— A crystallization point for the Web of Data. Web Semantics: science, services and agents on the world wide web 7(3), 154–165.

Boersma, P. and Weenink, D. (2005). Praat: doing phonetics by computer (version 4.3.14). [Computer program]. Retrieved May 26, 2005, from http: //www.praat.org/.

Berg-Kirkpatrick, T., Burkett, D., and Klein, D. (2012). An empirical in vestigation of statistical significance in NLP. EMNLP.

Bjorkelund ¨ , A. and Kuhn, J. (2014). Learning structured perceptrons for coreference resolution with latent antecedents and non-local features. ACL.

Boguraev, B. K. and Briscoe, T. (Eds.). (1989). Computational Lexicography for Natural Language Processing. Longman.

Berger, A., Della Pietra, S. A., and Della Pietra, V. J. (1996). A maximum entropy approach to natural lan guage processing. Computational Lin guistics 22(1), 39–71.

Black, A. W. and Taylor, P. (1994). CHATR: A generic speech synthesis system. COLING.

Bohus, D. and Rudnicky, A. I. (2005). Sorry, I didn’t catch that! — An investigation of non-understanding errors and recovery strategies. Proceedings of SIGDIAL.

Bergsma, S. and Lin, D. (2006). Bootstrapping path-based pronoun resolu tion. COLING/ACL.

Bergsma, S., Lin, D., and Goebel, R. (2008a). Discriminative learning of selectional preference from unlabeled text. EMNLP.

Bojanowski, P., Grave, E., Joulin, A., and Mikolov, T. (2017). Enriching word vectors with subword information. TACL 5, 135–146.

Bergsma, S., Lin, D., and Goebel, R. (2008b). Distributional identification of non-referential pronouns. ACL.

Black, E. (1988). An experiment in computational discrimination of English word senses. IBM Journal of Research and Development 32(2), 185– 194.

Bethard, S. (2013). ClearTK-TimeML: A minimalist approach to TempEva 2013. SemEval-13.

Bollacker, K., Evans, C., Paritosh, P., Sturge, T., and Taylor, J. (2008). Freebase: a collaboratively created graph database for structuring human knowledge. SIGMOD 2008.

Bhat, I., Bhat, R. A., Shrivastava, M., and Sharma, D. (2017). Joining hands: Exploiting monolingual treebanks for parsing of code-mixing data. EACL.

Black, E., Abney, S. P., Flickinger, D., Gdaniec, C., Grishman, R., Harrison, P., Hindle, D., Ingria, R., Jelinek, F., Klavans, J. L., Liberman, M. Y., Marcus, M. P., Roukos, S., Santorini, B., and Strzalkowski, T. (1991). A procedure for quantitatively comparing the syntactic coverage of English grammars. Proceedings DARPA Speech and Natural Language Workshop.

Blei, D. M., Ng, A. Y., and Jordan, M. I. (2003). Latent Dirichlet allocation. JMLR 3(5), 993–1022.

Bolukbasi, T., Chang, K.-W., Zou, J., Saligrama, V., and Kalai, A. T. (2016). Man is to computer programmer as woman is to homemaker? Debiasing word embeddings. NeurIPS.

Biber, D., Johansson, S., Leech, G., Conrad, S., and Finegan, E. (1999). Longman Grammar of Spoken and Written English. Pearson.

Blodgett, S. L., Barocas, S., Daume III,´ H., and Wallach, H. (2020). Language (technology) is power: A critical survey of “bias” in NLP. ACL.

Bordes, A., Usunier, N., Chopra, S., and Weston, J. (2015). Largescale simple question answering with memory networks. arXiv preprint arXiv:1506.02075.

Borges, J. L. (1964). The analytical language of John Wilkins. University of Texas Press. Trans. Ruth L. C. Simms.

Bickel, B. (2003). Referential density in discourse and syntactic typology. Language 79(2), 708–736.

Blodgett, S. L., Green, L., and O’Connor, B. (2016). Demographic dialectal variation in social media: A case study of African-American English. EMNLP.

Bostrom, K. and Durrett, G. (2020). Byte pair encoding is suboptimal for language model pretraining. arXiv.

Bies, A., Ferguson, M., Katz, K., and MacIntyre, R. (1995). Bracketing guidelines for Treebank II style Penn Treebank Project..

Bourlard, H. and Morgan, N. (1994). Connectionist Speech Recognition: A Hybrid Approach. Kluwer.

Bikel, D. M., Miller, S., Schwartz, R., and Weischedel, R. (1997). Nymble: A high-performance learning namefinder. ANLP.

Blodgett, S. L. and O’Connor, B. (2017). Racial disparity in natural language processing: A case study of social media African-American English. Fairness, Accountability, and Transparency in Machine Learning (FAT/ML) Workshop, KDD.

Bowman, S. R., Vilnis, L., Vinyals, O., Dai, A. M., Jozefowicz, R., and Bengio, S. (2016). Generating sentences from a continuous space. CoNLL.

Biran, O. and McKeown, K. (2015). PDTB discourse parsing as a tagging task: The two taggers approach. SIG-DIAL.

Bloomfield, L. (1914). An Introduction to the Study of Language. Henry Holt and Company.

Boyd-Graber, J., Feng, S., and Rodriguez, P. (2018). Human-computer question answering: The case for quizbowl. Escalera, S. and Weimer, M. (Eds.), The NIPS ’17 Competition: Building Intelligent Systems. Springer.

Bird, S., Klein, E., and Loper, E. (2009). Natural Language Processing with Python. O’Reilly.

Bloomfield, L. (1933). Language. University of Chicago Press.

Bisani, M. and Ney, H. (2004). Bootstrap estimates for confidence intervals in ASR performance evaluation. ICASSP.

Bobrow, D. G., Kaplan, R. M., Kay, M., Norman, D. A., Thompson, H., and Winograd, T. (1977). GUS, A frame driven dialog system. Artificial Intelligence 8, 155–173.

Brachman, R. J. (1979). On the epistemogical status of semantic networks. Findler, N. V. (Ed.), Associative Networks: Representation and Use of Knowledge by Computers, 3–50. Academic Press.

Brachman, R. J. and Levesque, H. J. (Eds.). (1985). Readings in Knowledge Representation. Morgan Kaufmann.

Brysbaert, M., Warriner, A. B., and Kuperman, V. (2014). Concreteness ratings for 40 thousand generally known english word lemmas. Behavior Research Methods 46(3), 904–911

Cardie, C. and Wagstaff, K. (1999). Noun phrase coreference as clustering. EMNLP/VLC.

Brachman, R. J. and Schmolze, J. G. (1985). An overview of the KL-ONE knowledge representation system. Cognitive Science 9(2), 171–216.

Bu, H., Du, J., Na, X., Wu, B., and Zheng, H. (2017). AISHELL-1: An open-source Mandarin speech corpus and a speech recognition baseline. O-COCOSDA Proceedings.

Carlini, N., Tramer, F., Wallace, E., Jagielski, M., Herbert-Voss, A., Lee, K., Roberts, A., Brown, T., Song, D., Erlingsson, U., Oprea, A., and Raffel1, C. (2020). Extracting training data from large language models. arXiv preprint arXiv:2012.07805.

Brants, T. (2000). TnT: A statistical part-of-speech tagger. ANLP.

Brants, T., Popat, A. C., Xu, P., Och, F. J., and Dean, J. (2007). Large language models in machine translation. EMNLP/CoNLL.

Buchholz, S. and Marsi, E. (2006). Conll-x shared task on multilingual dependency parsing. CoNLL.

Carlson, G. N. (1977). Reference to kinds in English. Ph.D. thesis, University of Massachusetts, Amherst. Forward.

Braud, C., Coavoux, M., and Søgaard, A. (2017). Cross-lingual RST discourse parsing. EACL.

Buck, C., Heafield, K., and Van Ooyen, B. (2014). N-gram counts and language models from the common crawl. LREC.

Carlson, L. and Marcu, D. (2001). Discourse tagging manual. Tech. rep. ISI-TR-545, ISI.

Breal ´ , M. (1897). Essai de Semantique:´ Science des significations. Hachette.

Brennan, S. E., Friedman, M. W., and Pollard, C. (1987). A centering approach to pronouns. ACL.

Budanitsky, A. and Hirst, G. (2006). Evaluating WordNet-based measures of lexical semantic relatedness. Computational Linguistics 32(1), 13–47.

Carlson, L., Marcu, D., and Okurowski, M. E. (2001). Building a discourse-tagged corpus in the framework of rhetorical structure theory. Proceedings of SIGDIAL.

Bresnan, J. (Ed.). (1982). The Mental Representation of Grammatical Relations. MIT Press.

Brin, S. (1998). Extracting patterns and relations from the World Wide Web. Proceedings World Wide Web and Databases International Workshop, Number 1590 in LNCS. Springer.

Budzianowski, P., Wen, T.-H., Tseng, B.-H., Casanueva, I., Ultes, S., Ramadan, O., and Gasiˇ c, M. (2018).´ MultiWOZ - a large-scale multidomain wizard-of-Oz dataset for taskoriented dialogue modelling. EMNLP.

Carreras, X. and Marquez, L. (2005).\` Introduction to the CoNLL-2005 shared task: Semantic role labeling. CoNLL.

Brockmann, C. and Lapata, M. (2003). Evaluating and combining approaches to selectional preference acquisition. EACL.

Bullinaria, J. A. and Levy, J. P. (2007). Extracting semantic representations from word co-occurrence statistics: A computational study. Behavior research methods 39(3), 510– 526.

Broschart, J. (1997). Why Tongan does it differently. Linguistic Typology 1, 123–165.

Chafe, W. L. (1976). Givenness, contrastiveness, definiteness, subjects, topics, and point of view. Li, C. N. (Ed.), Subject and Topic, 25–55. Academic Press.

Bullinaria, J. A. and Levy, J. P. (2012). Extracting semantic representations from word co-occurrence statistics: stop-lists, stemming, and SVD. Behavior research methods 44(3), 890–907.

Brown, P. F., Cocke, J., Della Pietra, S. A., Della Pietra, V. J., Jelinek, F., Lafferty, J. D., Mercer, R. L., and Roossin, P. S. (1990). A statistical approach to machine translation. Computational Linguistics 16(2), 79–85.

Chambers, N. (2013). NavyTime: Event and time ordering from raw text. SemEval-13.

Bulyko, I., Kirchhoff, K., Ostendorf, M., and Goldberg, J. (2005). Errorsensitive response generation in a spoken language dialogue system. Speech Communication 45(3), 271–288.

Chambers, N. and Jurafsky, D. (2010). Improving the use of pseudo-words for evaluating selectional preferences. ACL.

Chambers, N. and Jurafsky, D. (2011). Template-based information extraction without the templates. ACL.

Caliskan, A., Bryson, J. J., and Narayanan, A. (2017). Semantics derived automatically from language corpora contain human-like biases. Science 356(6334), 183–186.

Brown, P. F., Della Pietra, S. A., Della Pietra, V. J., and Mercer, R. L. (1993). The mathematics of statistical machine translation: Parameter estimation. Computational Linguistics 19(2), 263–311.

Chan, W., Jaitly, N., Le, Q., and Vinyals, O. (2016). Listen, attend and spell: A neural network for large vocabulary conversational speech recognition. ICASSP.

Chandioux, J. (1976). MET´ EO´ : un systeme op \` erationnel pour la tra-´ duction automatique des bulletins met´ eorologiques destin ´ es au grand´ public. Meta 21, 127–133.

Brown, T. B., Mann, B., Ryder, N., Subbiah, M., Kaplan, J., Dhariwal, P., Neelakantan, A., Shyam, P., Sastry, G., Askell, A., Agarwal, S., Herbert Voss, A., Krueger, G., Henighan, T., Child, R., Ramesh, A., Ziegler, D. M., Wu, J., Winter, C., Hesse, C., Chen, M., Sigler, E., Litwin, M., Gray, S., Chess, B., Clark, J., Berner, C., Mc Candlish, S., Radford, A., Sutskever, I., and Amodei, D. (2020). Language models are few-shot learners. arXiv preprint arXiv:2005.14165.

Callison-Burch, C., Osborne, M., and Koehn, P. (2006). Re-evaluating the role of BLEU in machine translation research. EACL.

Chang, A. X. and Manning, C. D. (2012). SUTime: A library for recognizing and normalizing time expressions. LREC.

Canavan, A., Graff, D., and Zipperlen, G. (1997). CALLHOME American English speech LDC97S42. Linguistic Data Consortium.

Cardie, C. (1993). A case-based approach to knowledge acquisition for domain specific sentence analysis. AAAI.

Chang, K.-W., Samdani, R., and Roth, D. (2013). A constrained latent variable model for coreference resolution. EMNLP.

Chang, K.-W., Samdani, R., Rozovskaya, A., Sammons, M., and Roth, D. (2012). Illinois-Coref: The UI system in the CoNLL-2012 shared task. CoNLL.

Bruce, B. C. (1975). Generation as a social action. Proceedings of TINLAP-1 (Theoretical Issues in Natural Language Processing).

Cardie, C. (1994). Domain-Specific Knowledge Acquisition for Conceptual Sentence Analysis. Ph.D. thesis, University of Massachusetts, Amherst, MA. Available as CMPSCI Technical Report 94-74.

Chaplot, D. S. and Salakhutdinov, R. (2018). Knowledge-based word sense disambiguation using topic models. AAAI.

Charniak, E. (1997). Statistical parsing with a context-free grammar and word statistics. AAAI.

Charniak, E., Hendrickson, C., Jacobson, N., and Perkowitz, M. (1993). Equations for part-of-speech tagging. AAAI.

Chiu, J. P. C. and Nichols, E. (2016). Named entity recognition with bidirectional LSTM-CNNs. TACL 4, 357– 370.

Chu-Carroll, J. and Carberry, S. (1998). Collaborative response generation in planning dialogues. Computational Linguistics 24(3), 355–400.

Che, W., Li, Z., Li, Y., Guo, Y., Qin, B., and Liu, T. (2009). Multilingual dependency-based syntactic and semantic parsing. CoNLL.

Cho, K., van Merrienboer, B., Gul-¨ cehre, C., Bahdanau, D., Bougares, F., Schwenk, H., and Bengio, Y. (2014). Learning phrase representations using RNN encoder–decoder for statistical machine translation. EMNLP.

Chu-Carroll, J. and Carpenter, B. (1999). Vector-based natural language call routing. Computational Linguistics 25(3), 361–388.

Church, A. (1940). A formulation of a simple theory of types. Journal of Symbolic Logic 5, 56–68.

Chen, C. and Ng, V. (2013). Linguistically aware coreference evaluation metrics. Sixth International Joint Conference on Natural Language Processing.

Choi, J. D. and Palmer, M. (2011a). Getting the most out of transitionbased dependency parsing. ACL.

Church, K. W. (1980). On Memory Limitations in Natural Language Processing Master’s thesis, MIT. Distributed by the Indiana University Linguistics Club.

Chen, D., Fisch, A., Weston, J., and Bordes, A. (2017). Reading wikipedia to answer open-domain questions. ACL.

Choi, J. D. and Palmer, M. (2011b). Transition-based semantic role labeling using predicate argument clustering. Proceedings of the ACL 2011 Workshop on Relational Models of Semantics.

Church, K. W. (1988). A stochastic parts program and noun phrase parser for unrestricted text. ANLP.

Chen, D. and Manning, C. D. (2014). A fast and accurate dependency parser using neural networks. EMNLP.

Choi, J. D., Tetreault, J., and Stent, A. (2015). It depends: Dependency parser comparison using a web-based evaluation tool. ACL.

Church, K. W. (1989). A stochastic parts program and noun phrase parser for unrestricted text. ICASSP.

Chen, E., Snyder, B., and Barzilay, R. (2007). Incremental text structur ing with online hierarchical ranking. EMNLP/CoNLL.

Church, K. W. (1994). Unix for Poets. Slides from 2nd ELSNET Summer School and unpublished paper ms.

Chomsky, N. (1956). Three models for the description of language. IRE Transactions on Information Theory 2(3), 113–124.

Chen, J. N. and Chang, J. S. (1998). Topical clustering of MRD senses based on information retrieval tech niques. Computational Linguistics 24(1), 61–96.

Chen, S. F. and Goodman, J. (1998). An empirical study of smoothing techniques for language modeling. Tech. rep. TR-10-98, Computer Science Group, Harvard University.

Chomsky, N. (1956/1975). The Logical Structure of Linguistic Theory. Plenum.

Church, K. W. and Gale, W. A. (1991). A comparison of the enhanced Good-Turing and deleted estimation methods for estimating probabilities of English bigrams. Computer Speech and Language 5, 19–54.

Chomsky, N. (1957). Syntactic Structures. Mouton, The Hague.

Chen, S. F. and Goodman, J. (1999). An empirical study of smoothing tech niques for language modeling. Com puter Speech and Language 13, 359– 394.

Chomsky, N. (1963). Formal properties of grammars. Luce, R. D., Bush, R., and Galanter, E. (Eds.), Handbook of Mathematical Psychology, Vol. 2, 323–418. Wiley.

Church, K. W. and Hanks, P. (1989). Word association norms, mutual information, and lexicography. ACL.

Chomsky, N. (1981). Lectures on Government and Binding. Foris.

Church, K. W. and Hanks, P. (1990). Word association norms, mutual information, and lexicography. Computational Linguistics 16(1), 22–29.

Chomsky, N. (1995). The Minimalist Program. MIT Press.

Chen, X., Shi, Z., Qiu, X., and Huang, X. (2017). Adversarial multi-criteria learning for Chinese word segmenta tion. ACL.

Chorowski, J., Bahdanau, D., Cho, K., and Bengio, Y. (2014). End-to-end continuous speech recognition using attention-based recurrent NN: First results. NeurIPS Deep Learning and Representation Learning Workshop.

Church, K. W., Hart, T., and Gao, J. (2007). Compressing trigram language models with Golomb coding. EMNLP/CoNLL.

Cialdini, R. B. (1984). Influence: The psychology of persuasion. Morrow.

Chiang, D. (2005). A hierarchical phrase-based model for statistical ma chine translation. ACL.

Ciaramita, M. and Altun, Y. (2006). Broad-coverage sense disambiguation and information extraction with a supersense sequence tagger. EMNLP.

Chierchia, G. and McConnell-Ginet, S. (1991). Meaning and Grammar. MIT Press.

Chou, W., Lee, C.-H., and Juang, B. H. (1993). Minimum error rate training based on n-best string models. ICASSP.

Ciaramita, M. and Johnson, M. (2003). Supersense tagging of unknown nouns in WordNet. EMNLP-2003.

Chinchor, N., Hirschman, L., and Lewis, D. L. (1993). Evaluating Mes sage Understanding systems: An analysis of the third Message Understanding Conference. Computational Lin guistics 19(3), 409–449.

Christodoulopoulos, C., Goldwater, S., and Steedman, M. (2010). Two decades of unsupervised POS induction: How far have we come?. EMNLP.

Cieri, C., Miller, D., and Walker, K. (2004). The Fisher corpus: A resource for the next generations of speech-totext. LREC.

Chu, Y.-J. and Liu, T.-H. (1965). On the shortest arborescence of a directed graph. Science Sinica 14, 1396–1400.

Chiticariu, L., Danilevsky, M., Li, Y., Reiss, F., and Zhu, H. (2018). SystemT: Declarative text understanding for enterprise. NAACL HLT, Vol. 3.

Clark, E. (1987). The principle of contrast: A constraint on language acquisition. MacWhinney, B. (Ed.), Mechanisms of language acquisition, 1–33. LEA.

Chiticariu, L., Li, Y., and Reiss, F. R. (2013). Rule-Based Information Ex traction is Dead! Long Live Rule Based Information Extraction Sys tems!. EMNLP.

Chu-Carroll, J. (1998). A statistical model for discourse act recognition in dialogue interactions. Chu-Carroll, J. and Green, N. (Eds.), Applying Machine Learning to Discourse Processing. Papers from the 1998 AAAI Spring Symposium. Tech. rep. SS-98- 01. AAAI Press.

Clark, H. H. (1996). Using Language. Cambridge University Press.

Clark, H. H. and Fox Tree, J. E. (2002). Using uh and um in spontaneous speaking. Cognition 84, 73– 111.

Clark, H. H. and Marshall, C. (1981). Definite reference and mutual knowledge. Joshi, A. K., Webber, B. L., and Sag, I. A. (Eds.), Elements of Discourse Understanding, 10–63. Cambridge.

validation of a computer simulation of paranoid processes. Artificial Intelligence 3, 199–221.

Cover, T. M. and Thomas, J. A. (1991). Elements of Information Theory. Wiley.

Colby, K. M., Weber, S., and Hilf, F. D. (1971). Artificial paranoia. Artificial Intelligence 2(1), 1–25.

Covington, M. (2001). A fundamental algorithm for dependency parsing. Proceedings of the 39th Annual ACM Southeast Conference.

Clark, H. H. and Wilkes-Gibbs, D. (1986). Referring as a collaborative process. Cognition 22, 1–39.

Clark, J. and Yallop, C. (1995). An Introduction to Phonetics and Phonol ogy (2nd Ed.). Blackwell.

Cole, R. A., Novick, D. G., Vermeulen, P. J. E., Sutton, S., Fanty, M., Wessels, L. F. A., de Villiers, J. H., Schalkwyk, J., Hansen, B., and Burnett, D. (1997). Experiments with a spoken dialogue system for taking the US census. Speech Communication 23, 243– 260.

Cox, D. (1969). Analysis of Binary Data. Chapman and Hall, London.

Craven, M. and Kumlien, J. (1999). Constructing biological knowledge bases by extracting information from text sources. ISMB-99.

Clark, J. H., Choi, E., Collins, M., Garrette, D., Kwiatkowski, T., Nikolaev, V., and Palomaki, J. (2020). TyDi QA: A benchmark for informationseeking question answering in typologically diverse languages. arXiv preprint arXiv:2003.05002.

Coleman, J. (2005). Introducing Speech and Language Processing. Cambridge University Press.

Crawford, K. (2017). The trouble with bias. Keynote at NeurIPS.

Croft, W. (1990). Typology and Universals. Cambridge University Press.

Clark, K. and Manning, C. D. (2015). Entity-centric coreference resolution with model stacking. ACL.

Collins, M. (1999). Head-Driven Statistical Models for Natural Language Parsing. Ph.D. thesis, University of Pennsylvania, Philadelphia.

Cruse, D. A. (2004). Meaning in Language: an Introduction to Semantics and Pragmatics. Oxford University Press. Second edition.

Clark, K. and Manning, C. D. (2016a). Deep reinforcement learning for mention-ranking coreference models. EMNLP.

Collins, M. (2003). Head-driven statistical models for natural language parsing. Computational Linguistics 29(4), 589–637.

Cucerzan, S. (2007). Large-scale named entity disambiguation based on Wikipedia data. EMNLP/CoNLL.

Clark, K. and Manning, C. D. (2016b). Improving coreference resolution by learning entity-level distributed representations. ACL.

Collobert, R. and Weston, J. (2007). Fast semantic extraction using a novel neural network architecture. ACL.

Clark, P., Cowhey, I., Etzioni, O., Khot, T., Sabharwal, A., Schoenick, C., and Tafjord, O. (2018). Think you have solved question answering? Try ARC, the AI2 reasoning challenge.. arXiv preprint arXiv:1803.05457.

Culicover, P. W. and Jackendoff, R. (2005). Simpler Syntax. Oxford University Press.

Collobert, R. and Weston, J. (2008). A unified architecture for natural language processing: Deep neural networks with multitask learning. ICML.

Clark, P., Etzioni, O., Khashabi, D., Khot, T., Mishra, B. D., Richardson, K., Sabharwal, A., Schoenick, C., Tafjord, O., Tandon, N., Bhakthavatsalam, S., Groeneveld, D., Guerquin, M., and Schmitz, M. (2019). From ’F’ to ’A’ on the NY Regents Science Exams: An overview of the Aristo project. arXiv preprint arXiv:1909.01958.

Dagan, I., Marcus, S., and Markovitch, S. (1993). Contextual word similarity and estimation from sparse data. ACL.

Collobert, R., Weston, J., Bottou, L., Karlen, M., Kavukcuoglu, K., and Kuksa, P. (2011). Natural language processing (almost) from scratch. JMLR 12, 2493–2537.

Dahl, G. E., Sainath, T. N., and Hinton, G. E. (2013). Improving deep neura networks for lvcsr using rectified linear units and dropout. ICASSP.

Comrie, B. (1989). Language Universals and Linguistic Typology (2nd Ed.). Blackwell.

Connolly, D., Burger, J. D., and Day, D. S. (1994). A machine learning approach to anaphoric reference. Proceedings of the International Conference on New Methods in Language Processing (NeMLaP).

Dahl, G. E., Yu, D., Deng, L., and Acero, A. (2012). Context-dependent pre-trained deep neural networks for large-vocabulary speech recognition. IEEE Transactions on audio, speech, and language processing 20(1), 30– 42.

Danescu-Niculescu-Mizil, C. and Lee, L. (2011). Chameleons in imagined conversations: A new approach to understanding coordination of linguistic style in dialogs. 2nd Workshop on Cognitive Modeling and Computational Linguistics.

Clark, S., Curran, J. R., and Osborne, M. (2003). Bootstrapping pos taggers using unlabelled data. CoNLL.

CMU (1993). The Carnegie Mellon Pronouncing Dictionary v0.1. Carnegie Mellon University.

Cooley, J. W. and Tukey, J. W. (1965). An algorithm for the machine calculation of complex Fourier series. Mathematics of Computation 19(90), 297– 301.

Danieli, M. and Gerbino, E. (1995). Metrics for evaluating dialogue strategies in a spoken language system. AAAI Spring Symposium on Empirical Methods in Discourse Interpretation and Generation.

Coccaro, N. and Jurafsky, D. (1998). Towards better integration of semantic predictors in statistical language modeling. ICSLP.

Cooper, F. S., Liberman, A. M., and Borst, J. M. (1951). The interconversion of audible and visible patterns as a basis for research in the perception of speech. Proceedings of the National Academy of Sciences 37(5), 318–325.

Das, S. R. and Chen, M. Y. (2001). Yahoo! for Amazon: Sentiment parsing from small talk on the web. EFA 2001 Barcelona Meetings. http://ssrn. com/abstract=276189.

Cohen, M. H., Giangola, J. P., and Balogh, J. (2004). Voice User Interface Design. Addison-Wesley.

Cohen, P. R. and Perrault, C. R. (1979). Elements of a plan-based theory of speech acts. Cognitive Science 3(3), 177–212.

Copestake, A. and Briscoe, T. (1995). Semi-productive polysemy and sense extension. Journal of Semantics 12(1), 15–68.

David, Jr., E. E. and Selfridge, O. G. (1962). Eyes and ears for computers. Proceedings of the IRE (Institute of Radio Engineers) 50, 1093–1101.

Colby, K. M., Hilf, F. D., Weber, S., and Kraemer, H. C. (1972). Turinglike indistinguishability tests for the

Cottrell, G. W. (1985). A Connectionist Approach to Word Sense Disambiguation. Ph.D. thesis, University of Rochester, Rochester, NY. Revised version published by Pitman, 1989.

Davidson, D. (1967). The logical form of action sentences. Rescher, N. (Ed.), The Logic of Decision and Action. University of Pittsburgh Press.

Davidson, T., Bhattacharya, D., and Weber, I. (2019). Racial bias in hate speech and abusive language detection datasets. Third Workshop on Abusive Language Online.

Davies, M. (2012). Expanding horizons in historical linguistics with the 400-million word Corpus of Histori cal American English. Corpora 7(2), 121–157.

semantics analysis. JASIS 41(6), 391– 407.

Dinan, E., Roller, S., Shuster, K., Fan, A., Auli, M., and Weston, J. (2019). Wizard of Wikipedia: Knowledgepowered conversational agents. ICLR.

DeJong, G. F. (1982). An overview of the FRUMP system. Lehnert, W. G. and Ringle, M. H. (Eds.), Strategies for Natural Language Processing, 149–176. LEA.

Davies, M. (2015). The Wikipedia Corpus: 4.6 million articles, 1.9 billion words. Adapted from Wikipedia. https://www. english-corpora.org/wiki/.

Ditman, T. and Kuperberg, G. R. (2010). Building coherence: A framework for exploring the breakdown of links across clause boundaries in schizophrenia. Journal of neurolinguistics 23(3), 254–269.

Davies, M. (2020). The Corpus of Contemporary American English (COCA): One billion words, 1990-2019. https://www. english-corpora.org/coca/.

Demberg, V. (2006). Letter-tophoneme conversion for a German text-to-speech system. Diplomarbeit Nr. 47, Universitat Stuttgart.¨

Davis, E. (1990). Representations of Commonsense Knowledge. Morgan Kaufmann.

Dixon, L., Li, J., Sorensen, J., Thain, N., and Vasserman, L. (2018). Measuring and mitigating unintended bias in text classification. 2018 AAAI/ACM Conference on AI, Ethics, and Society.

Davis, E., Morgenstern, L., and Ortiz, C. L. (2017). The first Winograd schema challenge at IJCAI-16. AI Magazine 38(3), 97–98.

Davis, K. H., Biddulph, R., and Balashek, S. (1952). Automatic recognition of spoken digits. JASA 24(6), 637–642.

Davis, S. and Mermelstein, P. (1980). Comparison of parametric representations for monosyllabic word recog nition in continuously spoken sen tences. IEEE Transactions on Acoustics, Speech, and Signal Processing 28(4), 357–366.

de Marneffe, M.-C., Dozat, T., Sil veira, N., Haverinen, K., Ginter, F., Nivre, J., and Manning, C. D. (2014). Universal Stanford dependencies: A cross-linguistic typology. LREC.

de Marneffe, M.-C., MacCartney, B., and Manning, C. D. (2006). Generating typed dependency parses from phrase structure parses. LREC.

Denes, P. (1959). The design and operation of the mechanical speech recognizer at University College London. Journal of the British Institution of Radio Engineers 19(4), 219–234. Appears together with companion paper (Fry 1959).

de Marneffe, M.-C. and Manning, C. D. (2008). The Stanford typed dependencies representation. Coling 2008: Proceedings of the workshop on Cross-Framework and Cross-Domain Parser Evaluation.

Dixon, N. and Maxey, H. (1968). Terminal analog synthesis of continuous speech using the diphone method of segment assembly. IEEE Transactions on Audio and Electroacoustics 16(1), 40–50.

Deng, L., Hinton, G., and Kingsbury, B. (2013). New types of deep neural network learning for speech recognition and related applications: An overview. ICASSP.

Deng, Y. and Byrne, W. (2005). HMM word and phrase alignment for statistical machine translation. HLT-EMNLP.

Denis, P. and Baldridge, J. (2007). Joint determination of anaphoricity and coreference resolution using integer programming. NAACL-HLT.

de Marneffe, M.-C., Recasens, M., and Potts, C. (2015). Modeling the lifespan of discourse entities with application to coreference resolution. JAIR 52, 445–475.

Denis, P. and Baldridge, J. (2008). Specialized models and ranking for coreference resolution. EMNLP.

Deerwester, S. C., Dumais, S. T., Fur nas, G. W., Harshman, R. A., Lan dauer, T. K., Lochbaum, K. E., and Streeter, L. (1988). Computer infor mation retrieval using latent semantic structure: US Patent 4,839,853..

Denis, P. and Baldridge, J. (2009). Global joint models for coreference resolution and named entity classification. Procesamiento del Lenguaje Natural 42.

DeRose, S. J. (1988). Grammatical category disambiguation by statistical optimization. Computational Linguistics 14, 31–39.

Devlin, J., Chang, M.-W., Lee, K., and Toutanova, K. (2019). BERT: Pretraining of deep bidirectional transformers for language understanding. NAACL HLT.

Di Eugenio, B. (1990). Centering theory and the Italian pronominal system. COLING.

Do, Q. N. T., Bethard, S., and Moens, M.-F. (2017). Improving implicit semantic role labeling by predicting semantic frame arguments. IJCNLP.

Di Eugenio, B. (1996). The discourse functions of Italian subjects: A centering approach. COLING.

Doddington, G. (2002). Automatic evaluation of machine translation quality using n-gram co-occurrence statistics. HLT.

Diab, M. and Resnik, P. (2002). An unsupervised method for word sense tagging using parallel corpora. ACL.

Dolan, B. (1994). Word sense ambiguation: Clustering related senses. COL-ING.

Dostert, L. (1955). The Georgetown-I.B.M. experiment. Machine Translation of Languages: Fourteen Essays, 124–135. MIT Press.

Digman, J. M. (1990). Personality structure: Emergence of the five-factor model. Annual Review of Psychology 41(1), 417–440.

Dozat, T., Qi, P., and Manning, C. D. (2017). Stanford’s graph-based neural dependency parser at the CoNLL 2017 shared task. Proceedings of the CoNLL 2017 Shared Task.

Deerwester, S. C., Dumais, S. T., Landauer, T. K., Furnas, G. W., and Harsh man, R. A. (1990). Indexing by latent

Dinan, E., Fan, A., Williams, A., Urbanek, J., Kiela, D., and Weston, J. (2020). Queens are powerful too: Mitigating gender bias in dialogue generation. EMNLP.

Dowty, D. R., Wall, R. E., and Peters, S. (1981). Introduction to Montague Semantics. D. Reidel.

Dror, R., Baumer, G., Bogomolov, M., and Reichart, R. (2017). Replicability analysis for natural language processing: Testing significance with multiple datasets. TACL 5, 471––486.

Dowty, D. R. (1979). Word Meaning and Montague Grammar. D. Reidel.

Dror, R., Peled-Cohen, L., Shlomov, S., and Reichart, R. (2020). Statistical Significance Testing for Natural Language Processing, Vol. 45 of Synthesis Lectures on Human Language Technologies. Morgan & Claypool.

Dryer, M. S. and Haspelmath, M. (Eds.). (2013). The World Atlas of Language Structures Online. Max Planck Institute for Evolutionary Anthropology, Leipzig. Available online at http://wals.info.

Du Bois, J. W., Chafe, W. L., Meyer, C., Thompson, S. A., Englebretson,

R., and Martey, N. (2005). Santa Barbara corpus of spoken American En glish, Parts 1-4. Philadelphia: Linguistic Data Consortium.

Elsner, M. and Charniak, E. (2011). Extending the entity grid with entityspecific features. ACL.

Dua, D., Wang, Y., Dasigi, P., Stanovsky, G., Singh, S., and Gardner, M. (2019). DROP: A reading comprehension benchmark requiring discrete reasoning over paragraphs. NAACL HLT.

Fazel-Zarandi, M., Li, S.-W., Cao, J., Casale, J., Henderson, P., Whitney, D., and Geramifard, A. (2017). Learning robust dialog policies in noisy environments. Conversational AI Workshop (NIPS).

Elvevag˚ , B., Foltz, P. W., Weinberger, D. R., and Goldberg, T. E. (2007). Quantifying incoherence in speech: an automated methodology and novel application to schizophrenia. Schizophrenia research 93(1-3), 304–316.

Feldman, J. A. and Ballard, D. H. (1982). Connectionist models and their properties. Cognitive Science 6, 205–254.

Duda, R. O. and Hart, P. E. (1973). Pattern Classification and Scene Analy sis. John Wiley and Sons.

Emami, A., Trichelair, P., Trischler, A., Suleman, K., Schulz, H., and Cheung, J. C. K. (2019). The KNOWREF coreference corpus: Removing gender and number cues for difficult pronominal anaphora resolution. ACL.

Fellbaum, C. (Ed.). (1998). WordNet: An Electronic Lexical Database. MIT Press.

Durrett, G. and Klein, D. (2013). Easy victories and uphill battles in corefer ence resolution. EMNLP.

Feng, V. W. and Hirst, G. (2011). Classifying arguments by scheme. ACL.

Durrett, G. and Klein, D. (2014). A joint model for entity analysis: Coreference, typing, and linking. TACL 2, 477–490.

Erk, K. (2007). A simple, similaritybased model for selectional preferences. ACL.

Feng, V. W. and Hirst, G. (2014). A linear-time bottom-up discourse parser with constraints and postediting. ACL.

Earley, J. (1968). An Efficient Context-Free Parsing Algorithm. Ph.D. thesis, Carnegie Mellon University, Pitts burgh, PA.

Ethayarajh, K., Duvenaud, D., and Hirst, G. (2019a). Towards understanding linear word analogies. ACL.

Earley, J. (1970). An efficient contextfree parsing algorithm. CACM 6(8), 451–455.

Feng, V. W., Lin, Z., and Hirst, G. (2014). The impact of deep hierarchical discourse structures in the evaluation of text coherence. COLING.

Ethayarajh, K., Duvenaud, D., and Hirst, G. (2019b). Understanding undesirable word embedding associations. ACL.

Ebden, P. and Sproat, R. (2015). The Kestrel TTS text normalization system. Natural Language Engineering 21(3), 333.

Edmonds, J. (1967). Optimum branchings. Journal of Research of the National Bureau of Standards B 71(4), 233–240.

Etzioni, O., Cafarella, M., Downey, D., Popescu, A.-M., Shaked, T., Soderland, S., Weld, D. S., and Yates, A. (2005). Unsupervised named-entity extraction from the web: An experimental study. Artificial Intelligence 165(1), 91–134.

Edunov, S., Ott, M., Auli, M., and Grangier, D. (2018). Understanding back-translation at scale. EMNLP.

Fensel, D., Hendler, J. A., Lieberman, H., and Wahlster, W. (Eds.). (2003). Spinning the Semantic Web: Bring the World Wide Web to its Full Potential. MIT Press, Cambridge, MA.

Evans, N. (2000). Word classes in the world’s languages. Booij, G., Lehmann, C., and Mugdan, J. (Eds.), Morphology: A Handbook on Inflection and Word Formation, 708–732. Mouton.

Efron, B. and Tibshirani, R. J. (1993). An introduction to the bootstrap. CRC press.

Fernandes, E. R., dos Santos, C. N., and Milidiu, R. L. (2012). Latent´ structure perceptron with feature induction for unrestricted coreference resolution. CoNLL.

Fader, A., Soderland, S., and Etzioni, O. (2011). Identifying relations for open information extraction. EMNLP.

Ferragina, P. and Scaiella, U. (2011). Fast and accurate annotation of shor texts with wikipedia pages. IEEE Software 29(1), 70–75.

Egghe, L. (2007). Untangling Herdan’s law and Heaps’ law: Mathematical and informetric arguments. JASIST 58(5), 702–709.

Fano, R. M. (1961). Transmission of Information: A Statistical Theory of Communications. MIT Press.

Ferro, L., Gerber, L., Mani, I., Sundheim, B., and Wilson, G. (2005). Tides 2005 standard for the annotation of temporal expressions. Tech. rep., MITRE.

Fant, G. M. (1951). Speech communication research. Ing. Vetenskaps Akad. Stockholm, Sweden 24, 331–337.

Eisner, J. (1996). Three new probabilistic models for dependency parsing: An exploration. COLING.

Ferrucci, D. A. (2012). Introduction to “This is Watson”. IBM Journal of Research and Development 56(3/4), 1:1– 1:15.

Ejerhed, E. I. (1988). Finding clauses in unrestricted text by finitary and stochastic methods. ANLP.

Fant, G. M. (1960). Acoustic Theory of Speech Production. Mouton.

Fessler, L. (2017). We tested bots like Siri and Alexa to see who would stand up to sexual harassment. Quartz. Feb 22, 2017. https://qz.com/ 911681/.

Ekman, P. (1999). Basic emotions. Dalgleish, T. and Power, M. J. (Eds.), Handbook of Cognition and Emotion, 45–60. Wiley.

Fant, G. M. (1986). Glottal flow: Models and interaction. Journal of Phonetics 14, 393–399.

Fant, G. M. (2004). Speech Acoustics and Phonetics. Kluwer.

Field, A. and Tsvetkov, Y. (2019). Entity-centric contextual affective analysis. ACL.

Elman, J. L. (1990). Finding structure in time. Cognitive science 14(2), 179– 211.

Faruqui, M., Dodge, J., Jauhar, S. K., Dyer, C., Hovy, E., and Smith, N. A. (2015). Retrofitting word vectors to semantic lexicons. NAACL HLT.

Fikes, R. E. and Nilsson, N. J. (1971). STRIPS: A new approach to the application of theorem proving to problem solving. Artificial Intelligence 2, 189– 208.

Elsner, M., Austerweil, J., and Charniak, E. (2007). A unified local and global model for discourse coherence. NAACL-HLT.

Fast, E., Chen, B., and Bernstein, M. S. (2016). Empath: Understanding Topic Signals in Large-Scale Text. CHI.

Elsner, M. and Charniak, E. (2008). Coreference-inspired coherence modeling. ACL.

Fauconnier, G. and Turner, M. (2008). The way we think: Conceptual blending and the mind’s hidden complexities. Basic Books.

Fillmore, C. J. (1966). A proposal concerning English prepositions. Dinneen, F. P. (Ed.), 17th annual Round Table, Vol. 17 of Monograph Series on Language and Linguistics, 19–34. Georgetown University Press.

Fillmore, C. J. (1968). The case for case. Bach, E. W. and Harms, R. T. (Eds.), Universals in Linguistic The ory, 1–88. Holt, Rinehart & Winston.

Foland, Jr., W. R. and Martin, J. H. (2015). Dependency-based semantic role labeling using convolutional neural networks. \*SEM 2015.

218. Appears together with companion paper (Denes 1959).

Fillmore, C. J. (1985). Frames and the semantics of understanding. Quaderni di Semantica VI(2), 222–254.

Foltz, P. W., Kintsch, W., and Landauer, T. K. (1998). The measurement of textual coherence with latent semantic analysis. Discourse processes 25(2-3), 285–307.

Furnas, G. W., Landauer, T. K., Gomez, L. M., and Dumais, S. T. (1987). The vocabulary problem in human-system communication. Communications of the ACM 30(11), 964– 971.

Fillmore, C. J. (2003). Valency and semantic roles: the concept of deep structure case. Agel, V., Eichinger,<sup>´</sup> L. M., Eroms, H. W., Hellwig, P., Heringer, H. J., and Lobin, H. (Eds.), Dependenz und Valenz: Ein internationales Handbuch der zeit genossischen Forschung ¨ , chap. 36, 457–475. Walter de Gruyter.

Gabow, H. N., Galil, Z., Spencer, T., and Tarjan, R. E. (1986). Efficient algorithms for finding minimum spanning trees in undirected and directed graphs. Combinatorica 6(2), 109–122.

Fillmore, C. J. (2012). Encounters with language. Computational Linguistics 38(4), 701–718.

Fillmore, C. J. and Baker, C. F. (2009). A frames approach to semantic analysis. Heine, B. and Narrog, H. (Eds.), The Oxford Handbook of Linguistic Analysis, 313–340. Oxford University Press.

Gaddy, D., Stern, M., and Klein, D. (2018). What’s going on in neural constituency parsers? an analysis. NAACL HLT.

, Nekoto, W., Marivate, V., Matsila, T., Fasubaa, T., Kolawole, T., Fagbohungbe, T., Akinola, S. O., Muhammad, S. H., Kabongo, S., Osei, S., Freshia, S., Niyongabo, R. A., Ogayo, R. M. P., Ahia, O., Meressa, M., Adeyemi, M., Mokgesi-Selinga, M., Okegbemi, L., Martinus, L. J., Tajudeen, K., Degila, K., Ogueji, K., Siminyu, K., Kreutzer, J., Webster, J., Ali, J. T., Orife, J. A. I., Ezeani, I., Dangana, I. A., Kamper, H., Elsahar, H., Duru, G., Kioko, G., Murhabazi, E., van Biljon, E., Whitenack, D., Onyefuluchi, C., Emezue, C., Dossou, B., Sibanda, B., Bassey, B. I., Olabiyi, A., Ramkilowan, A., Oktem,<sup>¨</sup> A., Akinfaderin, A., and Bashir, A. (2020). Participatory research for lowresourced machine translation: A case study in african languages. Findings of EMNLP.

Fillmore, C. J., Johnson, C. R., and Petruck, M. R. L. (2003). Background to FrameNet. International journal of lexicography 16(3), 235–250.

Gale, W. A. and Church, K. W. (1994). What is wrong with adding one?. Oostdijk, N. and de Haan, P. (Eds.), Corpus-Based Research into Language, 189–198. Rodopi.

Finkelstein, L., Gabrilovich, E., Matias, Y., Rivlin, E., Solan, Z., Wolfman, G., and Ruppin, E. (2002). Placing search in context: The concept revisited. ACM Transactions on Infor mation Systems 20(1), 116—-131.

Gale, W. A. and Church, K. W. (1991). A program for aligning sentences in bilingual corpora. ACL.

Finlayson, M. A. (2016). Inferring Propp’s functions from semantically annotated text. The Journal of American Folklore 129(511), 55–77.

Firth, J. R. (1935). The technique of semantics. Transactions of the philo logical society 34(1), 36–73.

Forchini, P. (2013). Using movie corpora to explore spoken American English: Evidence from multidimensional analysis. Bamford, J., Cavalieri, S., and Diani, G. (Eds.), Variation and Change in Spoken and Written Discourse: Perspectives from corpus linguistics, 123–136. Benjamins.

Fox, B. A. (1993). Discourse Structure and Anaphora: Written and Conversational English. Cambridge.

Firth, J. R. (1957). A synopsis of linguistic theory 1930–1955. Studies in Linguistic Analysis. Philological Soci ety. Reprinted in Palmer, F. (ed.) 1968. Selected Papers of J. R. Firth. Long man, Harlow.

Francis, W. N. and Kucera, H. (1982).ˇ Frequency Analysis of English Usage. Houghton Mifflin, Boston.

Gale, W. A. and Church, K. W. (1993). A program for aligning sentences in bilingual corpora. Computational Linguistics 19, 75–102.

Gale, W. A., Church, K. W., and Yarowsky, D. (1992a). Estimating upper and lower bounds on the performance of word-sense disambiguation programs. ACL.

Franz, A. and Brants, T. (2006). All our n-gram are belong to you. http://googleresearch. blogspot.com/2006/08/ all-our-n-gram-are-belong-tohtml.

Gale, W. A., Church, K. W., and Yarowsky, D. (1992b). One sense per discourse. Proceedings DARPA Speech and Natural Language Workshop.

Gale, W. A., Church, K. W., and Yarowsky, D. (1992c). Work on statistical methods for word sense disambiguation. Goldman, R. (Ed.), AAAI Fall Symposium on Probabilistic Approaches to Natural Language.

Fitt, S. (2002). Unisyn lexicon. http://www.cstr.ed.ac.uk/ projects/unisyn/.

Gao, S., Sethi, A., Aggarwal, S., Chung, T., and Hakkani-Tur, D.¨ (2019). Dialog state tracking: A neural reading comprehension approach. arXiv preprint arXiv:1908.01946.

Fraser, N. M. and Gilbert, G. N. (1991). Simulating speech systems. Computer Speech and Language 5, 81–99.

Flanagan, J. L. (1972). Speech Analysis, Synthesis, and Perception. Springer.

<sup>you.</sup>Garg, N., Schiebinger, L., Jurafsky, D., and Zou, J. (2018). Word embeddings quantify 100 years of gender and ethnic stereotypes. Proceedings of the National Academy of Sciences 115(16), E3635–E3644.

Friedman, B., Hendry, D. G., and Borning, A. (2017). A survey of value sensitive design methods. Foundations and Trends in Human-Computer Interaction 11(2), 63–125.

Flanagan, J. L., Ishizaka, K., and Ship ley, K. L. (1975). Synthesis of speech from a dynamic model of the vocal cords and vocal tract. The Bell System Technical Journal 54(3), 485–506.

Garside, R. (1987). The CLAWS wordtagging system. Garside, R., Leech, G., and Sampson, G. (Eds.), The Computational Analysis of English, 30–41. Longman.

Fry, D. B. (1955). Duration and intensity as physical correlates of linguistic stress. JASA 27, 765–768.

Foland, W. and Martin, J. H. (2016). CU-NLP at semeval-2016 task 8: AMR parsing using lstm-based recurrent neural networks. Proceedings of the 10th International Workshop on Semantic Evaluation.

Fry, D. B. (1959). Theoretical aspects of mechanical speech recognition. Journal of the British Institution of Radio Engineers 19(4), 211–

Garside, R., Leech, G., and McEnery, A. (1997). Corpus Annotation. Longman.

Gazdar, G., Klein, E., Pullum, G. K., and Sag, I. A. (1985). Generalized Phrase Structure Grammar. Blackwell.

Gebru, T., Morgenstern, J., Vecchione, B., Vaughan, J. W., Wallach, H., Daume III, H., and Crawford, K.´ (2020). Datasheets for datasets. arXiv preprint arXiv:1803.09010.

Glennie, A. (1960). On the syntax machine and the construction of a universal compiler. Tech. rep. No. 2, Contr. NR 049-141, Carnegie Mellon University (at the time Carnegie Institute of Technology), Pittsburgh, PA.

Gravano, A., Hirschberg, J., and Benuˇ s,ˇ S. (2012). Affirmative cue<sup>ˇ</sup> words in task-oriented dialogue. Computational Linguistics 38(1), 1–39.

Gehman, S., Gururangan, S., Sap, M., Choi, Y., and Smith, N. A. (2020). RealToxicityPrompts: Evaluating neural toxic degeneration in language mod els. Findings of EMNLP.

Godfrey, J., Holliman, E., and Mc-Daniel, J. (1992). SWITCHBOARD: Telephone speech corpus for research and development. ICASSP.

Graves, A. (2012). Sequence transduction with recurrent neural networks. ICASSP.

Gerber, M. and Chai, J. Y. (2010). Beyond nombank: A study of implicit arguments for nominal predicates. ACL.

Goffman, E. (1974). Frame analysis: An essay on the organization of experience. Harvard University Press.

Graves, A., Fernandez, S., Gomez, F.,´ and Schmidhuber, J. (2006). Connectionist temporal classification: Labelling unsegmented sequence data with recurrent neural networks. ICML.

Gil, D. (2000). Syntactic categories, cross-linguistic variation and universal grammar. Vogel, P. M. and Comrie, B. (Eds.), Approaches to the Typology of Word Classes, 173–216. Mouton.

Goldberg, J., Ostendorf, M., and Kirchhoff, K. (2003). The impact of response wording in error correction subdialogs. ISCA Tutorial and Research Workshop on Error Handling in Spoken Dialogue Systems.

Graves, A., Fernandez, S., Liwicki,´ M., Bunke, H., and Schmidhuber, J. (2007). Unconstrained on-line handwriting recognition with recurrent neural networks. NeurIPS.

Gildea, D. and Jurafsky, D. (2000). Automatic labeling of semantic roles. ACL.

Gildea, D. and Jurafsky, D. (2002). Automatic labeling of semantic roles. Computational Linguistics 28(3), 245–288.

Graves, A. and Jaitly, N. (2014). Towards end-to-end speech recognition with recurrent neural networks. ICML.

Goldberg, Y. (2017). Neural Network Methods for Natural Language Processing, Vol. 10 of Synthesis Lectures on Human Language Technologies. Morgan & Claypool.

Gildea, D. and Palmer, M. (2002). The necessity of syntactic parsing for pred icate argument recognition. ACL.

Giles, C. L., Kuhn, G. M., and Williams, R. J. (1994). Dynamic recurrent neural networks: Theory and applications. IEEE Trans. Neural Netw. Learning Syst. 5(2), 153–156.

Gillick, L. and Cox, S. J. (1989). Some statistical issues in the comparison of speech recognition algorithms. ICASSP.

Gonen, H. and Goldberg, Y. (2019). Lipstick on a pig: Debiasing methods cover up systematic gender biases in word embeddings but do not remove them. NAACL HLT.

Graves, A., Mohamed, A.-r., and Hinton, G. (2013a). Speech recognition with deep recurrent neural networks. ICASSP.

Ginzburg, J. and Sag, I. A. (2000). Interrogative Investigations: the Form, Meaning and Use of English Interrog atives. CSLI.

Good, M. D., Whiteside, J. A., Wixon, D. R., and Jones, S. J. (1984). Building a user-derived interface. CACM 27(10), 1032–1043.

Goodfellow, I., Bengio, Y., and Courville, A. (2016). Deep Learning. MIT Press.

Graves, A., Mohamed, A., and Hinton, G. E. (2013b). Speech recognition with deep recurrent neural networks. IEEE International Conference on Acoustics, Speech and Signal Processing, ICASSP.

Girard, G. (1718). La justesse de la langue franc¸oise: ou les differentes´ significations des mots qui passent pour synonimes. Laurent d’Houry, Paris.

Goodman, J. (2006). A bit of progress in language modeling: Extended version. Tech. rep. MSR-TR-2001-72, Machine Learning and Applied Statistics Group, Microsoft Research, Redmond, WA.

Graves, A. and Schmidhuber, J. (2005). Framewise phoneme classification with bidirectional LSTM and other neural network architectures. Neural Networks 18(5-6), 602–610.

Goodwin, C. (1996). Transparent vision. Ochs, E., Schegloff, E. A., and Thompson, S. A. (Eds.), Interaction and Grammar, 370–404. Cambridge University Press.

Green, B. F., Wolf, A. K., Chomsky, C., and Laughery, K. (1961). Baseball: An automatic question answerer. Proceedings of the Western Joint Computer Conference 19.

Giuliano, V. E. (1965). The interpretation of word associations. Stevens, M. E., Giuliano, V. E., and Heilprin, L. B. (Eds.), Statistical Association Methods For Mechanized Documentation. Symposium Proceedings. Washington, D.C., USA, March 17, 1964. https://nvlpubs. nist.gov/nistpubs/Legacy/MP/ nbsmiscellaneouspub269.pdf.

Gopalakrishnan, K., Hedayatnia, B., Chen, Q., Gottardi, A., Kwatra, S., Venkatesh, A., Gabriel, R., and Hakkani-Tur, D. (2019). Topical-chat:¨ Towards knowledge-grounded opendomain conversations..

Greenberg, S., Ellis, D., and Hollenback, J. (1996). Insights into spoken language gleaned from phonetic transcription of the Switchboard corpus. ICSLP.

Greene, B. B. and Rubin, G. M. (1971). Automatic grammatical tagging of English. Department of Linguistics, Brown University, Providence, Rhode Island.

Gould, J. D., Conti, J., and Hovanyecz, T. (1983). Composing letters with a simulated listening typewriter. CACM 26(4), 295–308.

Gladkova, A., Drozd, A., and Matsuoka, S. (2016). Analogy-based detection of morphological and semantic relations with word embeddings: what works and what doesn’t. NAACL Student Research Workshop.

Greenwald, A. G., McGhee, D. E., and Schwartz, J. L. K. (1998). Measuring individual differences in implicit cognition: the implicit association test. Journal of personality and social psychology 74(6), 1464–1480.

Gould, J. D. and Lewis, C. (1985). Designing for usability: Key principles and what designers think. CACM 28(3), 300–311.

Grenager, T. and Manning, C. D. (2006). Unsupervised Discovery of a Statistical Verb Lexicon. EMNLP.

Glenberg, A. M. and Robertson, D. A. (2000). Symbol grounding and meaning: A comparison of highdimensional and embodied theories of meaning. Journal of memory and lan guage 43(3), 379–401.

Gould, S. J. (1980). The Panda’s Thumb. Penguin Group.

Graff, D. (1997). The 1996 Broadcast News speech and language-model corpus. Proceedings DARPA Speech Recognition Workshop.

Grice, H. P. (1975). Logic and conversation. Cole, P. and Morgan, J. L. (Eds.), Speech Acts: Syntax and Semantics Volume 3, 41–58. Academic Press.

Grice, H. P. (1978). Further notes on logic and conversation. Cole, P. (Ed.), Pragmatics: Syntax and Seman tics Volume 9, 113–127. Academic Press.

Habernal, I. and Gurevych, I. (2017). Argumentation mining in usergenerated web discourse. Computational Linguistics 43(1), 125–179.

Grishman, R. and Sundheim, B. (1995). Design of the MUC-6 evalu ation. MUC-6.

Haghighi, A. and Klein, D. (2009). Simple coreference resolution with rich syntactic and semantic features. EMNLP.

Harris, Z. S. (1954). Distributional structure. Word 10, 146–162. Reprinted in J. Fodor and J. Katz, The Structure of Language, Prentice Hall, 1964 and in Z. S. Harris, Papers in Structural and Transformational Linguistics, Reidel, 1970, 775–794.

Grosz, B. J. (1977a). The represen tation and use of focus in a system for understanding dialogs. IJCAI-77. Morgan Kaufmann.

Hajishirzi, H., Zilles, L., Weld, D. S., and Zettlemoyer, L. (2013). Joint coreference resolution and namedentity linking with multi-pass sieves. EMNLP.

Harris, Z. S. (1962). String Analysis of Sentence Structure. Mouton, The Hague.

Hastie, T., Tibshirani, R. J., and Friedman, J. H. (2001). The Elements of Statistical Learning. Springer.

Grosz, B. J. (1977b). The Representation and Use of Focus in Dialogue Un derstanding. Ph.D. thesis, University of California, Berkeley.

Hajicˇ, J. (1998). Building a Syntactically Annotated Corpus: The Prague Dependency Treebank, 106– 132. Karolinum.

Hatzivassiloglou, V. and McKeown, K. (1997). Predicting the semantic orientation of adjectives. ACL.

Grosz, B. J., Joshi, A. K., and Weinstein, S. (1983). Providing a unified account of definite noun phrases in English. ACL.

Hajicˇ, J. (2000). Morphological tagging: Data vs. dictionaries. NAACL. Seattle.

Hatzivassiloglou, V. and Wiebe, J. (2000). Effects of adjective orientation and gradability on sentence subjectivity. COLING.

Grosz, B. J., Joshi, A. K., and Wein stein, S. (1995). Centering: A framework for modeling the local coherence of discourse. Computational Linguis tics 21(2), 203–225.

Grosz, B. J. and Sidner, C. L. (1980). Plans for discourse. Cohen, P. R., Morgan, J., and Pollack, M. E. (Eds.), In tentions in Communication, 417–444. MIT Press.

Haviland, S. E. and Clark, H. H. (1974). What’s new? Acquiring new information as a process in comprehension. Journal of Verbal Learning and Verbal Behaviour 13, 512–521.

Hajicˇ, J., Ciaramita, M., Johansson, R., Kawahara, D., Mart´ı, M. A., Marquez,\` L., Meyers, A., Nivre, J., Pado, S.,´ St<sup>ˇ</sup> epˇ anek, J., Stran´ aˇk, P., Surdeanu,<sup>´</sup> M., Xue, N., and Zhang, Y. (2009). The conll-2009 shared task: Syntactic and semantic dependencies in multiple languages. CoNLL.

Gruber, J. S. (1965). Studies in Lexical Relations. Ph.D. thesis, MIT.

Guinaudeau, C. and Strube, M. (2013). Graph-based local coherence model ing. ACL.

Hawkins, J. A. (1978). Definiteness and indefiniteness: a study in reference and grammaticality prediction. Croom Helm Ltd.

Guindon, R. (1988). A multidisciplinary perspective on dialogue structure in user-advisor dialogues. Guindon, R. (Ed.), Cognitive Science and Its Applications for Human-Computer Interaction, 163–200. Lawrence Erl baum.

Hakkani-Tur¨ , D., Oflazer, K., and Tur,¨ G. (2002). Statistical morphological disambiguation for agglutinative languages. Journal of Computers and Humanities 36(4), 381–410.

Halliday, M. A. K. and Hasan, R. (1976). Cohesion in English. Longman. English Language Series, Title No. 9.

Hamilton, W. L., Clark, K., Leskovec, J., and Jurafsky, D. (2016a). Inducing domain-specific sentiment lexicons from unlabeled corpora. EMNLP.

Hayashi, T., Yamamoto, R., Inoue, K., Yoshimura, T., Watanabe, S., Toda, T., Takeda, K., Zhang, Y., and Tan, X. (2020). ESPnet-TTS: Unified, reproducible, and integratable open source end-to-end text-to-speech toolkit. ICASSP.

Hamilton, W. L., Leskovec, J., and Jurafsky, D. (2016b). Diachronic word embeddings reveal statistical laws of semantic change. ACL.

He, L., Lee, K., Lewis, M., and Zettlemoyer, L. (2017). Deep semantic role labeling: What works and what’s next. ACL.

Gundel, J. K., Hedberg, N., and Zacharski, R. (1993). Cognitive status and the form of referring expressions in discourse. Language 69(2), 274– 307.

Heafield, K. (2011). KenLM: Faster and smaller language model queries. Workshop on Statistical Machine Translation.

Hancock, B., Bordes, A., Mazare, P.-´ E., and Weston, J. (2019). Learning from dialogue after deployment: Feed yourself, chatbot!. ACL.

Heafield, K., Pouzyrevsky, I., Clark, J. H., and Koehn, P. (2013). Scalable modified Kneser-Ney language model estimation. ACL.

Gururangan, S., Marasovic, A.,´ Swayamdipta, S., Lo, K., Beltagy, I., Downey, D., and Smith, N. A. (2020). Don’t stop pretraining: Adapt language models to domains and tasks. ACL.

Hannun, A. (2017). Sequence modeling with CTC. Distill 2(11).

Heaps, H. S. (1978). Information retrieval. Computational and theoretical aspects. Academic Press.

Hannun, A. Y., Maas, A. L., Jurafsky, D., and Ng, A. Y. (2014). First-pass large vocabulary continuous speech recognition using bidirectional recurrent DNNs. arXiv preprint arXiv:1408.2873.

Hearst, M. A. (1991). Noun homograph disambiguation. Proceedings of the 7th Conference of the University of Waterloo Centre for the New OED and Text Research.

Gusfield, D. (1997). Algorithms on Strings, Trees, and Sequences: Computer Science and Computational Bi ology. Cambridge University Press.

Harris, C. M. (1953). A study of the building blocks in speech. JASA 25(5), 962–969.

Hearst, M. A. (1992a). Automatic acquisition of hyponyms from large text corpora. COLING.

Guyon, I. and Elisseeff, A. (2003). An introduction to variable and feature se lection. JMLR 3, 1157–1182.

Harris, R. A. (2005). Voice Interaction Design: Crafting the New Conversational Speech Systems. Morgan Kaufmann.

Hearst, M. A. (1992b). Automatic acquisition of hyponyms from large text corpora. COLING. COLING.

Habernal, I. and Gurevych, I. (2016). Which argument is more convincing? Analyzing and predicting convincing ness of Web arguments using bidirec tional LSTM. ACL.

Harris, Z. S. (1946). From morpheme to utterance. Language 22(3), 161– 183.

Hearst, M. A. (1997). Texttiling: Segmenting text into multi-paragraph subtopic passages. Computational Linguistics 23, 33–64.

Hearst, M. A. (1998). Automatic discovery of WordNet relations. Fellbaum, C. (Ed.), WordNet: An Electronic Lexical Database. MIT Press.

Hirst, G. and Charniak, E. (1982). Word sense and case slot disambiguation. AAAI.

Heckerman, D., Horvitz, E., Sahami, M., and Dumais, S. T. (1998). A bayesian approach to filtering junk email. AAAI-98 Workshop on Learning for Text Categorization.

Hermann, K. M., Kociskˇ y, T., Grefen-´ stette, E., Espeholt, L., Kay, W., Suleyman, M., and Blunsom, P. (2015b). Teaching machines to read and comprehend. Proceedings of the 28th International Conference on Neural Information Processing Systems - Volume 1. MIT Press.

Hjelmslev, L. (1969). Prologomena to a Theory of Language. University of Wisconsin Press. Translated by Francis J. Whitfield; original Danish edition 1943.

Heim, I. (1982). The semantics of definite and indefinite noun phrases. Ph.D. thesis, University of Massachusetts at Amherst.

Hernault, H., Prendinger, H., duVerle, D. A., and Ishizuka, M. (2010). Hilda: A discourse parser using support vector machine classification. Dialogue & Discourse 1(3).

Hobbs, J. R. (1978). Resolving pronoun references. Lingua 44, 311–338.

Hobbs, J. R. (1979). Coherence and coreference. Cognitive Science 3, 67– 90.

Heim, I. and Kratzer, A. (1998). Semantics in a Generative Grammar. Blackwell Publishers, Malden, MA.

Heinz, J. M. and Stevens, K. N. (1961). On the properties of voiceless fricative consonants. JASA 33, 589–596.

Hidey, C., Musi, E., Hwang, A., Muresan, S., and McKeown, K. (2017). Analyzing the semantic types of claims and premises in an online persuasive forum. 4th Workshop on Argument Mining.

Hellrich, J., Buechel, S., and Hahn, U. (2019). Modeling word emotion in historical language: Quantity beats supposed stability in seed word selection. 3rd Joint SIGHUM Workshop on Computational Linguistics for Cultural Heritage, Social Sciences, Humanities and Literature.

Hill, F., Reichart, R., and Korhonen, A. (2015). Simlex-999: Evaluating semantic models with (genuine) similarity estimation. Computational Linguistics 41(4), 665–695.

Hobbs, J. R., Appelt, D. E., Bear, J., Israel, D., Kameyama, M., Stickel, M. E., and Tyson, M. (1997). FAS-TUS: A cascaded finite-state transducer for extracting information from natural-language text. Roche, E. and Schabes, Y. (Eds.), Finite-State Language Processing, 383–406. MIT Press.

Hellrich, J. and Hahn, U. (2016). Bad company—Neighborhoods in neural embedding spaces considered harmful. COLING.

Hinkelman, E. A. and Allen, J. (1989). Two constraints on speech act ambiguity. ACL.

Hemphill, C. T., Godfrey, J., and Doddington, G. (1990). The ATIS spoken language systems pilot corpus. Proceedings DARPA Speech and Natural Language Workshop.

Hochreiter, S. and Schmidhuber, J. (1997). Long short-term memory. Neural Computation 9(8), 1735–1780.

Hinton, G. E. (1986). Learning distributed representations of concepts. COGSCI.

Henderson, P., Sinha, K., Angelard Gontier, N., Ke, N. R., Fried, G., Lowe, R., and Pineau, J. (2017). Ethical challenges in data-driven dialogue systems. AAAI/ACM AI Ethics and Society Conference.

Hinton, G. E., Osindero, S., and Teh, Y.-W. (2006). A fast learning algorithm for deep belief nets. Neural computation 18(7), 1527–1554.

Hockenmaier, J. and Steedman, M. (2007). Ccgbank: a corpus of ccg derivations and dependency structures extracted from the penn treebank. Computational Linguistics 33(3), 355–396.

Hinton, G. E., Srivastava, N., Krizhevsky, A., Sutskever, I., and Salakhutdinov, R. R. (2012). Improving neural networks by preventing co-adaptation of feature detectors. arXiv preprint arXiv:1207.0580.

Hirschberg, J., Litman, D. J., and Swerts, M. (2001). Identifying user corrections automatically in spoken dialogue systems. NAACL.

Hofmann, T. (1999). Probabilistic latent semantic indexing. SIGIR-99.

Hendrickx, I., Kim, S. N., Kozareva, Z., Nakov, P., O S<sup>´</sup> eaghdha, D., Pad´ o,´ S., Pennacchiotti, M., Romano, L., and Szpakowicz, S. (2009). Semeval-2010 task 8: Multi-way classification of semantic relations between pairs of nominals. 5th International Workshop on Semantic Evaluation.

Hopcroft, J. E. and Ullman, J. D. (1979). Introduction to Automata Theory, Languages, and Computation. Addison-Wesley.

Hou, Y., Markert, K., and Strube, M. (2018). Unrestricted bridging resolution. Computational Linguistics 44(2), 237–284.

Hirschman, L., Light, M., Breck, E., and Burger, J. D. (1999). Deep Read: A reading comprehension system. ACL.

Householder, F. W. (1995). Dionysius Thrax, the technai, and Sextus Empiricus. Koerner, E. F. K. and Asher, R. E. (Eds.), Concise History of the Language Sciences, 99–103. Elsevier Science.

Hirschman, L. and Pao, C. (1993). The cost of errors in a spoken language system. EUROSPEECH.

Hendrix, G. G., Thompson, C. W., and Slocum, J. (1973). Language processing via canonical verbs and semantic models. Proceedings of IJCAI-73.

Hovy, E. H. (1990). Parsimonious and profligate approaches to the question of discourse structure relations. Proceedings of the 5th Internationa Workshop on Natural Language Generation.

Hirst, G. (1981). Anaphora in Natural Language Understanding: A survey. No. 119 in Lecture notes in computer science. Springer-Verlag.

Hovy, E. H., Marcus, M. P., Palmer, M., Ramshaw, L. A., and Weischedel, R. (2006). Ontonotes: The 90% solution. HLT-NAACL.

Henrich, V., Hinrichs, E., and Vodolazova, T. (2012). WebCAGe – a webharvested corpus annotated with GermaNet senses. EACL.

Hirst, G. (1987). Semantic Interpretation and the Resolution of Ambiguity. Cambridge University Press.

Hu, M. and Liu, B. (2004a). Mining and summarizing customer reviews. KDD.

Herdan, G. (1960). Type-token mathematics. Mouton.

Hermann, K. M., Kocisky, T., Grefenstette, E., Espeholt, L., Kay, W., Su leyman, M., and Blunsom, P. (2015a). Teaching machines to read and comprehend. NeurIPS.

Hirst, G. (1988). Resolving lexical ambiguity computationally with spreading activation and polaroid words. Small, S. L., Cottrell, G. W., and Tanenhaus, M. K. (Eds.), Lexical Ambiguity Resolution, 73–108. Morgan Kaufmann.

Hu, M. and Liu, B. (2004b). Mining and summarizing customer reviews. SIGKDD-04.

Huang, E. H., Socher, R., Manning, C. D., and Ng, A. Y. (2012). Improving word representations via global

context and multiple word prototypes. ACL.

Huang, L. and Sagae, K. (2010). Dy namic programming for linear-time in cremental parsing. ACL.

Irsoy, O. and Cardie, C. (2014). Opinion mining with deep recurrent neural networks. EMNLP.

Jelinek, F. (1969). A fast sequential decoding algorithm using a stack. IBM Journal of Research and Development 13, 675–685.

Huang, Z., Xu, W., and Yu, K. (2015). Bidirectional LSTM-CRF models for sequence tagging. arXiv preprin arXiv:1508.01991.

Isbell, C. L., Kearns, M., Kormann, D., Singh, S., and Stone, P. (2000). Cobot in LambdaMOO: A social statistics agent. AAAI/IAAI.

Jelinek, F. (1976). Continuous speech recognition by statistical methods. Proceedings of the IEEE 64(4), 532– 557.

Huddleston, R. and Pullum, G. K. (2002). The Cambridge Grammar of the English Language. Cambridge University Press.

ISO8601 (2004). Data elements and interchange formats—information interchange—representation of dates and times. Tech. rep., International Organization for Standards (ISO).

Jelinek, F. (1990). Self-organized language modeling for speech recognition. Waibel, A. and Lee, K.-F. (Eds.), Readings in Speech Recognition, 450–506. Morgan Kaufmann. Originally distributed as IBM technical report in 1985.

Hudson, R. A. (1984). Word Grammar. Blackwell.

Itakura, F. (1975). Minimum prediction residual principle applied to speech recognition. IEEE Transactions on Acoustics, Speech, and Signal Processing ASSP-32, 67–72.

Huffman, S. (1996). Learning information extraction patterns from ex amples. Wertmer, S., Riloff, E., and Scheller, G. (Eds.), Connectionist, Statistical, and Symbolic Approaches to Learning Natural Language Pro cessing, 246–260. Springer.

Iter, D., Guu, K., Lansing, L., and Jurafsky, D. (2020). Pretraining with contrastive sentence objectives improves discourse performance of language models. ACL.

Jelinek, F. and Mercer, R. L. (1980). Interpolated estimation of Markov source parameters from sparse data. Gelsema, E. S. and Kanal, L. N. (Eds.), Proceedings, Workshop on Pattern Recognition in Practice, 381– 397. North Holland.

Humeau, S., Shuster, K., Lachaux, M.- A., and Weston, J. (2020). Polyencoders: Transformer architectures and pre-training strategies for fast and accurate multi-sentence scoring. ICLR.

Hunt, A. J. and Black, A. W. (1996). Unit selection in a concatenative speech synthesis system using a large speech database. ICASSP.

Iter, D., Yoon, J., and Jurafsky, D. (2018). Automatic detection of incoherent speech for diagnosing schizophrenia. Fifth Workshop on Computational Linguistics and Clinical Psychology.

Hutchins, W. J. (1986). Machine Translation: Past, Present, Future. El lis Horwood, Chichester, England.

Jelinek, F., Mercer, R. L., and Bahl, L. R. (1975). Design of a linguistic statistical decoder for the recognition of continuous speech. IEEE Transactions on Information Theory IT-21(3), 250–256.

Ito, K. and Johnson, L. (2017). The lj speech dataset. https://keithito. com/LJ-Speech-Dataset/.

Hutchins, W. J. (1997). From first conception to first demonstration: The nascent years of machine translation, 1947–1954. A chronology. Machine Translation 12, 192–252.

Iyer, S., Konstas, I., Cheung, A., Krishnamurthy, J., and Zettlemoyer, L. (2017). Learning a neural semantic parser from user feedback. ACL.

Ji, H. and Grishman, R. (2011). Knowledge base population: Successful approaches and challenges. ACL.

Jackendoff, R. (1983). Semantics and Cognition. MIT Press.

Jacobs, P. S. and Rau, L. F. (1990). SCISOR: A system for extracting information from on-line news. CACM 33(11), 88–97.

Ji, H., Grishman, R., and Dang, H. T. (2010). Overview of the tac 2011 knowledge base population track. TAC-11.

Hutchins, W. J. and Somers, H. L. (1992). An Introduction to Machine Translation. Academic Press.

Ji, Y. and Eisenstein, J. (2014). Representation learning for text-level discourse parsing. ACL.

Jaech, A., Mulcaire, G., Hathi, S., Ostendorf, M., and Smith, N. A. (2016). Hierarchical character-word models for language identification. ACL Workshop on NLP for Social Media.

Ji, Y. and Eisenstein, J. (2015). One vector is not enough: Entityaugmented distributed semantics for discourse relations. TACL 3, 329–344.

Hutchinson, B., Prabhakaran, V., Den ton, E., Webster, K., Zhong, Y., and Denuyl, S. (2020). Social biases in NLP models as barriers for persons with disabilities. ACL.

Jia, S., Meng, T., Zhao, J., and Chang, K.-W. (2020). Mitigating gender bias amplification in distribution by posterior regularization. ACL.

Hymes, D. (1974). Ways of speak ing. Bauman, R. and Sherzer, J. (Eds.), Explorations in the ethnography of speaking, 433–451. Cambridge University Press.

Jaeger, T. F. and Levy, R. P. (2007). Speakers optimize information density through syntactic reduction. NeurIPS.

Jiang, K., Wu, D., and Jiang, H. (2019). FreebaseQA: A new factoid QA data set matching trivia-style question-answer pairs with Freebase. NAACL HLT.

Jaitly, N., Nguyen, P., Senior, A., and Vanhoucke, V. (2012). Application of pretrained deep neural networks to large vocabulary speech recognition. INTERSPEECH.

Johnson, J., Douze, M., and Jegou,´ H. (2017). Billion-scale similarity search with GPUs. arXiv preprint arXiv:1702.08734.

Iacobacci, I., Pilehvar, M. T., and Navigli, R. (2016). Embeddings for word sense disambiguation: An evaluation study. ACL.

Jauhiainen, T., Lui, M., Zampieri, M., Baldwin, T., and Linden, K. (2018).´ Automatic language identification in texts: A survey. arXiv preprint arXiv:1804.08186.

Johnson, K. (2003). Acoustic and Auditory Phonetics (2nd Ed.). Blackwell.

Iida, R., Inui, K., Takamura, H., and Matsumoto, Y. (2003). Incorporating contextual cues in trainable models for coreference resolution. EACL Workshop on The Computational Treatment of Anaphora.

Johnson, W. E. (1932). Probability: deductive and inductive problems (appendix to). Mind 41(164), 421–423.

Jefferson, G. (1972). Side sequences. Sudnow, D. (Ed.), Studies in social interaction, 294–333. Free Press, New York.

Johnson-Laird, P. N. (1983). Mental Models. Harvard University Press, Cambridge, MA.

Irons, E. T. (1961). A syntax directed compiler for ALGOL 60. CACM 4, 51–55.

Jeffreys, H. (1948). Theory of Probability (2nd Ed.). Clarendon Press. Section 3.23.

Jones, M. P. and Martin, J. H. (1997). Contextual spelling correction using latent semantic analysis. ANLP.

Jones, R., McCallum, A., Nigam, K., and Riloff, E. (1999). Bootstrapping for text learning tasks. IJCAI-99 Work shop on Text Mining: Foundations, Techniques and Applications.

Jurgens, D. and Klapaftis, I. P. (2013). Semeval-2013 task 13: Word sense induction for graded and non-graded senses. \*SEM.

Karpukhin, V., Oguz, B., Min, S.,˘ Lewis, P., Wu, L., Edunov, S., Chen, D., and Yih, W.-t. (2020). Dense passage retrieval for open-domain question answering. EMNLP.

Jones, T. (2015). Toward a descrip tion of African American Vernacular English dialect regions using “Black Twitter”. American Speech 90(4), 403–440.

Jurgens, D., Mohammad, S. M., Turney, P., and Holyoak, K. (2012). SemEval-2012 task 2: Measuring degrees of relational similarity. \*SEM 2012.

Karttunen, L. (1969). Discourse referents. COLING. Preprint No. 70.

Karttunen, L. (1999). Comments on Joshi. Kornai, A. (Ed.), Extended Finite State Models of Language, 16– 18. Cambridge University Press.

Joos, M. (1950). Description of language design. JASA 22, 701–708.

Jurgens, D., Tsvetkov, Y., and Jurafsky, D. (2017). Incorporating dialectal variability for socially equitable language identification. ACL.

Jordan, M. (1986). Serial order: A parallel distributed processing approach. Tech. rep. ICS Report 8604, University of California, San Diego.

Justeson, J. S. and Katz, S. M. (1991). Co-occurrences of antonymous adjectives and their contexts. Computational linguistics 17(1), 1–19.

Kasami, T. (1965). An efficient recognition and syntax analysis algorithm for context-free languages. Tech. rep. AFCRL-65-758, Air Force Cambridge Research Laboratory, Bedford, MA.

Joshi, A. K. (1985). Tree adjoining grammars: How much contextsensitivity is required to provide reasonable structural descriptions?. Dowty, D. R., Karttunen, L., and Zwicky, A. (Eds.), Natural Language Parsing, 206–250. Cambridge University Press.

Kalchbrenner, N. and Blunsom, P. (2013). Recurrent continuous translation models. EMNLP.

Katz, J. J. and Fodor, J. A. (1963). The structure of a semantic theory. Language 39, 170–210.

Kameyama, M. (1986). A propertysharing constraint in centering. ACL.

Joshi, A. K. and Hopely, P. (1999). A parser from antiquity. Kornai, A. (Ed.), Extended Finite State Models of Language, 6–15. Cambridge University Press.

Joshi, A. K. and Kuhn, S. (1979). Centered logic: The role of entity centered sentence representation in natural language inferencing. IJCAI-79.

Kamp, H. (1981). A theory of truth and semantic representation. Groenendijk, J., Janssen, T., and Stokhof, M. (Eds.), Formal Methods in the Study of Language, 189–222. Mathematical Centre, Amsterdam.

Kawamoto, A. H. (1988). Distributed representations of ambiguous words and their resolution in connectionis networks. Small, S. L., Cottrell, G. W., and Tanenhaus, M. (Eds.), Lexica Ambiguity Resolution, 195–228. Morgan Kaufman.

Joshi, A. K. and Weinstein, S. (1981). Control of inference: Role of some aspects of discourse structure – centering. IJCAI-81.

Joshi, M., Chen, D., Liu, Y., Weld, D. S., Zettlemoyer, L., and Levy, O. (2020). SpanBERT: Improving pretraining by representing and predicting spans. TACL 8, 64–77.

Kamphuis, C., de Vries, A. P., Boytsov, L., and Lin, J. (2020). Which bm25 do you mean? a large-scale reproducibility study of scoring variants. European Conference on Information Retrieval.

Kay, M. (1967). Experiments with a powerful parser. Proc. 2eme Conference Internationale sur le Traitement Automatique des Langues.

Kane, S. K., Morris, M. R., Paradiso, A., and Campbell, J. (2017). “at times avuncular and cantankerous, with the reflexes of a mongoose”: Understanding self-expression through augmentative and alternative communication devices. CSCW 2017.

Kay, M. (1973). The MIND system. Rustin, R. (Ed.), Natural Language Processing, 155–188. Algorithmics Press.

Joshi, M., Choi, E., Weld, D. S., and Zettlemoyer, L. (2017). Triviaqa: A large scale distantly supervised challenge dataset for reading comprehension. ACL.

Kannan, A. and Vinyals, O. (2016). Adversarial evaluation of dialogue models. NIPS 2016 Workshop on Adversarial Training.

Kay, M. (1982). Algorithm schemata and data structures in syntactic processing. Allen, S. (Ed.),´ Text Processing: Text Analysis and Generation, Text Typology and Attribution, 327– 358. Almqvist and Wiksell, Stockholm.

Kay, M. and Roscheisen, M. (1988).¨ Text-translation alignment. Tech. rep. P90-00143, Xerox Palo Alto Research Center, Palo Alto, CA.

Kaplan, R. M. (1973). A general syntactic processor. Rustin, R. (Ed.), Natural Language Processing, 193–241. Algorithmics Press.

Joshi, M., Levy, O., Weld, D. S., and Zettlemoyer, L. (2019). BERT for coreference resolution: Baselines and analysis. EMNLP.

Kay, M. and Roscheisen, M. (1993).¨ Text-translation alignment. Computational Linguistics 19, 121–142.

Joty, S., Carenini, G., and Ng, R. T. (2015). CODRA: A novel discriminative framework for rhetorical analy sis. Computational Linguistics 41(3), 385–435.

Karamanis, N., Poesio, M., Mellish, C., and Oberlander, J. (2004). Evaluating centering-based metrics of coherence for text structuring using a reliably annotated corpus. ACL.

Kay, P. and Fillmore, C. J. (1999). Grammatical constructions and linguistic generalizations: The What’s X Doing Y? construction. Language 75(1), 1–33.

Kehler, A. (1993). The effect of establishing coherence in ellipsis and anaphora resolution. ACL.

Jurafsky, D. (2014). The Language of Food. W. W. Norton, New York.

Jurafsky, D., Chahuneau, V., Routledge, B. R., and Smith, N. A. (2014). Narrative framing of consumer sentiment in online restaurant reviews. First Monday 19(4).

Karita, S., Chen, N., Hayashi, T., Hori, T., Inaguma, H., Jiang, Z., Someki, M., Soplin, N. E. Y., Yamamoto, R., Wang, X., Watanabe, S., Yoshimura, T., and Zhang, W. (2019). A comparative study on transformer vs RNN in speech applications. IEEE ASRU-19.

Kehler, A. (1994). Temporal relations: Reference or discourse coherence?. ACL.

Kehler, A. (1997a). Current theories of centering for pronoun interpretation: A critical evaluation. Computational Linguistics 23(3), 467–475.

Jurafsky, D., Wooters, C., Tajchman, G., Segal, J., Stolcke, A., Fosler, E., and Morgan, N. (1994). The Berkeley restaurant project. ICSLP.

Karlsson, F., Voutilainen, A., Heikkila,¨ J., and Anttila, A. (Eds.). (1995). Constraint Grammar: A Language-Independent System for Parsing Unrestricted Text. Mouton de Gruyter.

Kehler, A. (1997b). Probabilistic coreference in information extraction. EMNLP.

Kehler, A. (2000). Coherence, Ref erence, and the Theory of Grammar. CSLI Publications.

Kehler, A., Appelt, D. E., Taylor, L., and Simma, A. (2004). The (non)utility of predicate-argument frequencies for pronoun interpretation. HLT-NAACL.

Kipper, K., Dang, H. T., and Palmer, M. (2000). Class-based construction of a verb lexicon. AAAI.

Kiritchenko, S. and Mohammad, S. M. (2017). Best-worst scaling more reliable than rating scales: A case study on sentiment intensity annotation. ACL.

Koehn, P., Hoang, H., Birch, A., Callison-Burch, C., Federico, M., Bertoldi, N., Cowan, B., Shen, W., Moran, C., Zens, R., Dyer, C., Bojar, O., Constantin, A., and Herbst, E. (2006). Moses: Open source toolkit for statistical machine translation. ACL.

Kehler, A. and Rohde, H. (2013). A probabilistic reconciliation of coherence-driven and centering-driven theories of pronoun interpretation. Theoretical Linguistics 39(1-2), 1–37.

Kiritchenko, S. and Mohammad, S. M. (2018). Examining gender and race bias in two hundred sentiment analysis systems. \*SEM.

Koehn, P., Och, F. J., and Marcu, D. (2003). Statistical phrase-based translation. HLT-NAACL.

Koenig, W., Dunn, H. K., and Lacy, L. Y. (1946). The sound spectrograph. JASA 18, 19–49.

Keller, F. and Lapata, M. (2003). Using the web to obtain frequencies for unseen bigrams. Computational Lin guistics 29, 459–484.

Kiss, T. and Strunk, J. (2006). Unsupervised multilingual sentence boundary detection. Computational Linguistics 32(4), 485–525.

Kelly, E. F. and Stone, P. J. (1975). Computer Recognition of English Word Senses. North-Holland.

Kolhatkar, V., Roussel, A., Dipper, S., and Zinsmeister, H. (2018). Anaphora with non-nominal antecedents in computational linguistics: A survey. Computational Linguistics 44(3), 547–612.

Kitaev, N., Cao, S., and Klein, D. (2019). Multilingual constituency parsing with self-attention and pretraining. ACL.

Krovetz, R. (1993). Viewing morphology as an inference process. SIGIR-93.

Kendall, T. and Farrington, C. (2020). The Corpus of Regional African American Language. Version 2020.05. Eugene, OR: The Online Resources for African American Language Project. http://oraal.uoregon. edu/coraal.

Kitaev, N. and Klein, D. (2018). Constituency parsing with a self-attentive encoder. ACL.

Kennedy, C. and Boguraev, B. K. (1996). Anaphora for everyone: Pronominal anaphora resolution with out a parser. COLING.

Kiela, D. and Clark, S. (2014). A systematic study of semantic vector space model parameters. EACL 2nd Workshop on Continuous Vector Space Models and their Compositionality (CVSC).

Klatt, D. H. (1975). Voice onset time, friction, and aspiration in word-initial consonant clusters. Journal of Speech and Hearing Research 18, 686–706.

Kruskal, J. B. (1983). An overview of sequence comparison. Sankoff, D. and Kruskal, J. B. (Eds.), Time Warps, String Edits, and Macromolecules: The Theory and Practice of Sequence Comparison, 1–44. Addison-Wesley.

Kilgarriff, A. and Rosenzweig, J. (2000). Framework and results for En glish SENSEVAL. Computers and the Humanities 34, 15–48.

Klatt, D. H. (1977). Review of the ARPA speech understanding project. JASA 62(6), 1345–1366.

Klatt, D. H. (1982). The Klattalk textto-speech conversion system. ICASSP.

Kudo, T. (2018). Subword regularization: Improving neural network translation models with multiple subword candidates. ACL.

Kim, E. (2019). Optimize computational efficiency of skip-gram with negative sampling. https:// aegis4048.github.io/optimize\_ computational\_efficiency\_ of\_skip-gram\_with\_negative\_ sampling.

Kleene, S. C. (1951). Representation of events in nerve nets and finite automata. Tech. rep. RM-704, RAND Corporation. RAND Research Memorandum.

Kleene, S. C. (1956). Representation of events in nerve nets and finite automata. Shannon, C. and McCarthy, J. (Eds.), Automata Studies, 3–41. Princeton University Press.

Kudo, T. and Matsumoto, Y. (2002). Japanese dependency analysis using cascaded chunking. CoNLL.

Kudo, T. and Richardson, J. (2018). SentencePiece: A simple and language independent subword tokenizer and detokenizer for neural text processing. EMNLP.

Klein, D. and Manning, C. D. (2003). A\* parsing: Fast exact Viterbi parse selection. HLT-NAACL.

Kullback, S. and Leibler, R. A. (1951). On information and sufficiency. Annals of Mathematical Statistics 22, 79–86.

Kumar, S., Jat, S., Saxena, K., and Talukdar, P. (2019). Zero-shot word sense disambiguation using sense definition embeddings. ACL.

Kim, S. M. and Hovy, E. H. (2004). Determining the sentiment of opinions. COLING.

Klein, S. and Simmons, R. F. (1963). A computational approach to grammatical coding of English words. Journal of the ACM 10(3), 334–347.

Kummerfeld, J. K. and Klein, D. (2013). Error-driven analysis of challenges in coreference resolution. EMNLP.

King, S. (2020). From African American Vernacular English to African American Language: Rethinking the study of race and language in African Americans’ speech. Annual Review of Linguistics 6, 285–300.

Kneser, R. and Ney, H. (1995). Improved backing-off for M-gram language modeling. ICASSP, Vol. 1.

Kuno, S. (1965). The predictive analyzer and a path elimination technique. CACM 8(7), 453–462.

Kingma, D. and Ba, J. (2015). Adam: A method for stochastic optimization. ICLR 2015.

Knott, A. and Dale, R. (1994). Using linguistic phenomena to motivate a set of coherence relations. Discourse Processes 18(1), 35–62.

Kuno, S. and Oettinger, A. G. (1963). Multiple-path syntactic analyzer. Popplewell, C. M. (Ed.), Information Processing 1962: Proceedings of the IFIP Congress 1962. North-Holland.

Kintsch, W. (1974). The Representation of Meaning in Memory. Wiley, New York.

Kocijan, V., Cretu, A.-M., Camburu, O.-M., Yordanov, Y., and Lukasiewicz, T. (2019). A surprisingly robust trick for the Winograd Schema Challenge. ACL.

Kupiec, J. (1992). Robust part-ofspeech tagging using a hidden Markov model. Computer Speech and Language 6, 225–242.

Kintsch, W. and Van Dijk, T. A. (1978). Toward a model of text comprehension and production. Psychological re view 85(5), 363–394.

Koehn, P. (2005). Europarl: A parallel corpus for statistical machine translation. MT summit, vol. 5.

Kurita, K., Vyas, N., Pareek, A., Black, A. W., and Tsvetkov, Y. (2019). Quantifying social biases in contextual

word representations. 1st ACL Workshop on Gender Bias for Natural Language Processing.

Kuceraˇ , H. and Francis, W. N. (1967). Computational Analysis of Present-Day American English. Brown University Press, Providence, RI.

Landauer, T. K., Laham, D., Rehder, B., and Schreiner, M. E. (1997). How well can passage meaning be derived without using word order? A comparison of Latent Semantic Analysis and humans. COGSCI.

Lee, H., Peirsman, Y., Chang, A., Chambers, N., Surdeanu, M., and Jurafsky, D. (2011). Stanford’s multipass sieve coreference resolution system at the CoNLL-2011 shared task. CoNLL.

Kwiatkowski, T., Palomaki, J., Redfield, O., Collins, M., Parikh, A., Alberti, C., Epstein, D., Polosukhin, I., Devlin, J., Lee, K., Toutanova, K., Jones, L., Kelcey, M., Chang, M.-W., Dai, A. M., Uszkoreit, J., Le, Q., and Petrov, S. (2019). Natural questions: A benchmark for question answering research. TACL 7, 452–466.

Landes, S., Leacock, C., and Tengi, R. I. (1998). Building semantic concordances. Fellbaum, C. (Ed.), Word-Net: An Electronic Lexical Database, 199–216. MIT Press.

Lee, H., Surdeanu, M., and Jurafsky, D. (2017). A scaffolding approach to coreference resolution integrating statistical and rule-based models. Natural Language Engineering 23(5), 733– 762.

Lang, J. and Lapata, M. (2014). Similarity-driven semantic role induction via graph partitioning. Computational Linguistics 40(3), 633–669.

Lee, K., Chang, M.-W., and Toutanova, K. (2019). Latent retrieval for weakly supervised open domain question answering. ACL.

Ladefoged, P. (1993). A Course in Pho netics. Harcourt Brace Jovanovich. (3rd ed.).

Lang, K. J., Waibel, A. H., and Hinton, G. E. (1990). A time-delay neural network architecture for isolated word recognition. Neural networks 3(1), 23–43.

Lee, K., He, L., Lewis, M., and Zettlemoyer, L. (2017). End-to-end neura coreference resolution. EMNLP.

Ladefoged, P. (1996). Elements of Acoustic Phonetics (2nd Ed.). University of Chicago.

Lapata, M. (2003). Probabilistic text structuring: Experiments with sentence ordering. ACL.

Lafferty, J. D., McCallum, A., and Pereira, F. C. N. (2001). Conditional random fields: Probabilistic models for segmenting and labeling sequence data. ICML.

Lee, K., He, L., and Zettlemoyer, L. (2018). Higher-order coreference resolution with coarse-to-fine inference. NAACL HLT.

Lai, A. and Tetreault, J. (2018). Discourse coherence in the wild: A dataset, evaluation and methods. SIG-DIAL.

Lapesa, G. and Evert, S. (2014). A large scale evaluation of distributional semantic models: Parameters, interactions and model selection. TACL 2, 531–545.

Lehiste, I. (Ed.). (1967). Readings in Acoustic Phonetics. MIT Press.

Lake, B. M. and Murphy, G. L. (2020). Word meaning in minds and machines..

Lakoff, G. (1965). On the Nature of Syntactic Irregularity. Ph.D. thesis, Indiana University. Published as Irregularity in Syntax. Holt, Rinehart, and Winston, New York, 1970.

Lappin, S. and Leass, H. (1994). An algorithm for pronominal anaphora resolution. Computational Linguistics 20(4), 535–561.

Lehnert, W. G., Cardie, C., Fisher, D., Riloff, E., and Williams, R. (1991). Description of the CIRCUS system as used for MUC-3. Sundheim, B. (Ed.), MUC-3.

Lascarides, A. and Asher, N. (1993). Temporal interpretation, discourse relations, and common sense entailment. Linguistics and Philosophy 16(5), 437–493.

Lakoff, G. (1972a). Linguistics and natural logic. Davidson, D. and Harman, G. (Eds.), Semantics for Natural Language, 545–665. D. Reidel.

Lauscher, A., Vulic, I., Ponti, E. M.,´ Korhonen, A., and Glavas, G. (2019).ˇ Informing unsupervised pretraining with external linguistic knowledge. arXiv preprint arXiv:1909.02339.

Lemon, O., Georgila, K., Henderson, J., and Stuttle, M. (2006). An ISU dialogue system exhibiting reinforcement learning of dialogue policies: Generic slot-filling in the TALK in-car system. EACL.

Lawrence, W. (1953). The synthesis of speech from signals which have a low information rate. Jackson, W. (Ed.), Communication Theory, 460– 469. Butterworth.

Lengerich, B., Maas, A., and Potts, C. (2018). Retrofitting distributiona embeddings to knowledge graphs with functional relations. COLING.

Lakoff, G. (1972b). Structural complexity in fairy tales. The Study of Man, 128–50. School of Social Sciences, University of California, Irvine, CA.

Lesk, M. E. (1986). Automatic sense disambiguation using machine readable dictionaries: How to tell a pine cone from an ice cream cone. Proceedings of the 5th International Conference on Systems Documentation.

LDC (1998). LDC Catalog: Hub4 project. University of Pennsylvania. www.ldc.upenn.edu/Catalog/ LDC98S71.html.

Lakoff, G. and Johnson, M. (1980). Metaphors We Live By. University of Chicago Press, Chicago, IL.

Levenshtein, V. I. (1966). Binary codes capable of correcting deletions, insertions, and reversals. Cybernetics and Control Theory 10(8), 707–710. Original in Doklady Akademii Nauk SSSR 163(4): 845–848 (1965).

Lample, G., Ballesteros, M., Subramanian, S., Kawakami, K., and Dyer, C. (2016). Neural architectures for named entity recognition. NAACL HLT.

LeCun, Y., Boser, B., Denker, J. S., Henderson, D., Howard, R. E., Hubbard, W., and Jackel, L. D. (1989). Backpropagation applied to handwritten zip code recognition. Neural computation 1(4), 541–551.

Levesque, H. (2011). The Winograd Schema Challenge. Logical Formalizations of Commonsense Reasoning — Papers from the AAAI 2011 Spring Symposium (SS-11-06).

Landauer, T. K. (Ed.). (1995). The Trouble with Computers: Usefulness, Usability, and Productivity. MIT Press.

Lee, D. D. and Seung, H. S. (1999). Learning the parts of objects by nonnegative matrix factorization. Nature 401(6755), 788–791.

Levesque, H., Davis, E., and Morgenstern, L. (2012). The Winograd Schema Challenge. KR-12.

Landauer, T. K. and Dumais, S. T. (1997). A solution to Plato’s problem: The Latent Semantic Analysis theory of acquisition, induction, and representation of knowledge. Psychological Review 104, 211–240.

Lee, H., Chang, A., Peirsman, Y., Chambers, N., Surdeanu, M., and Jurafsky, D. (2013). Deterministic coreference resolution based on entitycentric, precision-ranked rules. Computational Linguistics 39(4), 885–916.

Levesque, H. J., Cohen, P. R., and Nunes, J. H. T. (1990). On acting together. AAAI. Morgan Kaufmann.

Levin, B. (1977). Mapping sentences to case frames. Tech. rep. 167, MIT AI Laboratory. AI Working Paper 143.

Levin, B. (1993). English Verb Classes and Alternations: A Preliminary Investigation. University of Chicago Press.

Levin, B. and Rappaport Hovav, M. (2005). Argument Realization. Cam bridge University Press.

Levin, E., Pieraccini, R., and Eckert, W. (2000). A stochastic model of human machine interaction for learning dialog strategies. IEEE Transactions on Speech and Audio Processing 8, 11– 23.

Levine, Y., Lenz, B., Dagan, O., Ram, O., Padnos, D., Sharir, O., Shalev-Shwartz, S., Shashua, A., and Shoham, Y. (2020). SenseBERT: Driv ing some sense into BERT. ACL.

Levinson, S. C. (1983). Conversational Analysis, chap. 6. Cambridge Univer sity Press.

Levow, G.-A. (1998). Characterizing and recognizing spoken corrections in human-computer dialogue. COLING ACL.

Levy, O. and Goldberg, Y. (2014a). Dependency-based word embeddings. ACL.

Levy, O. and Goldberg, Y. (2014b). Linguistic regularities in sparse and explicit word representations. CoNLL.

Levy, O. and Goldberg, Y. (2014c). Neural word embedding as implicit matrix factorization. NeurIPS.

Levy, O., Goldberg, Y., and Dagan, I. (2015). Improving distributional sim ilarity with lessons learned from word embeddings. TACL 3, 211–225.

Lewis, M. and Steedman, M. (2014). A\* ccg parsing with a supertag factored model. EMNLP.

Li, A., Zheng, F., Byrne, W., Fung, P., Kamm, T., Yi, L., Song, Z., Ruhi, U., Venkataramani, V., and Chen, X. (2000). CASS: A phonetically transcribed corpus of Mandarin spontaneous speech. ICSLP.

Li, B. Z., Min, S., Iyer, S., Mehdad, Y., and Yih, W.-t. (2020). Efficient one-pass end-to-end entity linking for questions. EMNLP.

Li, J., Chen, X., Hovy, E. H., and Jurafsky, D. (2015). Visualizing and understanding neural models in NLP. NAACL HLT.

Li, J., Galley, M., Brockett, C., Gao, J., and Dolan, B. (2016). A diversitypromoting objective function for neural conversation models. NAACL HLT.

Li, J. and Jurafsky, D. (2017). Neural net models of open-domain discourse coherence. EMNLP.

Li, J., Li, R., and Hovy, E. H. (2014). Recursive deep models for discourse parsing. EMNLP.

Li, J., Monroe, W., Ritter, A., Galley, M., Gao, J., and Jurafsky, D. (2016). Deep reinforcement learning for dialogue generation. EMNLP.

Li, J., Monroe, W., Shi, T., Ritter, A., and Jurafsky, D. (2017). Adversarial learning for neural dialogue generation. EMNLP.

Li, M., Weston, J., and Roller, S. (2019). Acute-eval: Improved dialogue evaluation with optimized questions and multi-turn comparisons. NeurIPS19 Workshop on Conversational AI.

Li, Q., Li, T., and Chang, B. (2016). Discourse parsing with attentionbased hierarchical neural networks. EMNLP.

Liberman, A. M., Delattre, P. C., and Cooper, F. S. (1952). The role of selected stimulus variables in the perception of the unvoiced stop consonants. American Journal of Psychology 65, 497–516.

Li, X., Meng, Y., Sun, X., Han, Q., Yuan, A., and Li, J. (2019). Is word segmentation necessary for deep learning of Chinese representations?. ACL.

Lin, D. (2003). Dependency-based evaluation of minipar. Workshop on the Evaluation of Parsing Systems.

Ling, W., Dyer, C., Black, A. W., Trancoso, I., Fermandez, R., Amir, S., Marujo, L., and Lu´ıs, T. (2015). Finding function in form: Compositiona character models for open vocabulary word representation. EMNLP.

Lin, J., Nogueira, R., and Yates, A. (2020). Pretrained transformers for text ranking: BERT and beyond. arXiv preprint arXiv:2010.06467.

Lin, Y., Michel, J.-B., Aiden Lieberman, E., Orwant, J., Brockman, W., and Petrov, S. (2012a). Syntactic annotations for the Google books NGram corpus. ACL.

Lin, Y., Michel, J.-B., Lieberman Aiden, E., Orwant, J., Brockman, W., and Petrov, S. (2012b). Syntactic annotations for the google books ngram corpus. ACL.

Lin, Z., Madotto, A., Shin, J., Xu, P., and Fung, P. (2019). MoEL: Mixture of empathetic listeners. http: //arxiv.org/abs/1908.07687.

Lin, Z., Kan, M.-Y., and Ng, H. T. (2009). Recognizing implicit discourse relations in the penn discourse treebank. EMNLP.

Linzen, T. (2016). Issues in evaluating semantic spaces using word analogies. 1st Workshop on Evaluating Vector-Space Representations for NLP.

Lin, Z., Ng, H. T., and Kan, M.-Y. (2011). Automatically evaluating text coherence using discourse relations. ACL.

Lin, Z., Ng, H. T., and Kan, M.-Y. (2014). A pdtb-styled end-to-end discourse parser. Natural Language Engineering 20(2), 151–184.

Lindsey, R. (1963). Inferential memory as the basis of machines which understand natural language. Feigenbaum, E. and Feldman, J. (Eds.), Computers and Thought, 217–233. McGraw Hill.

Lison, P. and Tiedemann, J. (2016). Opensubtitles2016: Extracting large parallel corpora from movie and tv subtitles. LREC.

Litman, D. J. (1985). Plan Recognition and Discourse Analysis: An Integrated Approach for Understanding Dialogues. Ph.D. thesis, University of Rochester, Rochester, NY.

Litman, D. J. and Allen, J. (1987). A plan recognition model for subdialogues in conversation. Cognitive Science 11, 163–200.

Litman, D. J., Swerts, M., and Hirschberg, J. (2000). Predicting automatic speech recognition performance using prosodic cues. NAACL.

Litman, D. J., Walker, M. A., and Kearns, M. (1999). Automatic detection of poor speech recognition at the dialogue level. ACL.

Liu, B. and Zhang, L. (2012). A survey of opinion mining and sentiment analysis. Aggarwal, C. C. and Zhai, C. (Eds.), Mining text data, 415–464. Springer.

Liu, C.-W., Lowe, R. T., Serban, I. V., Noseworthy, M., Charlin, L., and Pineau, J. (2016). How NOT to evaluate your dialogue system: An empirical study of unsupervised evaluation metrics for dialogue response generation. EMNLP.

Liu, H., Dacon, J., Fan, W., Liu, H., Liu, Z., and Tang, J. (2020). Does gender matter? Towards fairness in dialogue systems. COLING.

Liu, Y., Fung, P., Yang, Y., Cieri, C., Huang, S., and Graff, D. (2006). HKUST/MTS: A very large scale Mandarin telephone speech corpus. International Conference on Chinese Spoken Language Processing.

Liu, Y., Ott, M., Goyal, N., Du, J., Joshi, M., Chen, D., Levy, O., Lewis, M., Zettlemoyer, L., and Stoyanov, V. (2019). RoBERTa: A robustly optimized BERT pretraining approach. arXiv preprint arXiv:1907.11692.

Lochbaum, K. E., Grosz, B. J., and Sidner, C. L. (2000). Discourse structure and intention recognition. Dale, R., Moisl, H., and Somers, H. L. (Eds.), Handbook of Natural Language Processing. Marcel Dekker.

Logeswaran, L., Lee, H., and Radev, D. (2018). Sentence ordering and coherence modeling using recurrent neural networks. AAAI.

Maas, A., Xie, Z., Jurafsky, D., and Ng, A. Y. (2015). Lexicon-free conversational speech recognition with neural networks. NAACL HLT.

Marcus, M. P. (1980). A Theory of Syntactic Recognition for Natural Language. MIT Press.

Louis, A. and Nenkova, A. (2012). A coherence model based on syntactic patterns. EMNLP.

Maas, A. L., Hannun, A. Y., and Ng, A. Y. (2013). Rectifier nonlinearities improve neural network acoustic models. ICML.

Loureiro, D. and Jorge, A. (2019). Language modelling makes sense: Propagating representations through WordNet for full-coverage word sense disambiguation. ACL.

Marcus, M. P., Kim, G., Marcinkiewicz, M. A., MacIntyre, R., Bies, A., Ferguson, M., Katz, K., and Schasberger, B. (1994). The Penn Treebank: Annotating predicate argument structure. ARPA Human Language Technology Workshop. Morgan Kaufmann.

Maas, A. L., Qi, P., Xie, Z., Hannun, A. Y., Lengerich, C. T., Jurafsky, D., and Ng, A. Y. (2017). Building dnn acoustic models for large vocabulary speech recognition. Computer Speech & Language 41, 195–213.

Louviere, J. J., Flynn, T. N., and Mar ley, A. A. J. (2015). Best-worst scaling: Theory, methods and applications. Cambridge University Press.

Madhu, S. and Lytel, D. (1965). A figure of merit technique for the resolution of non-grammatical ambiguity. Mechanical Translation 8(2), 9–13.

Marcus, M. P., Santorini, B., and Marcinkiewicz, M. A. (1993). Building a large annotated corpus of English: The Penn treebank. Computational Linguistics 19(2), 313–330.

Lovins, J. B. (1968). Development of a stemming algorithm. Mechanical Translation and Computational Lin guistics 11(1–2), 9–13.

Lowerre, B. T. (1968). The Harpy Speech Recognition System. Ph.D. thesis, Carnegie Mellon University, Pittsburgh, PA.

Magerman, D. M. (1994). Natural Language Parsing as Statistical Pattern Recognition. Ph.D. thesis, University of Pennsylvania.

Magerman, D. M. (1995). Statistical decision-tree models for parsing. ACL.

Luhn, H. P. (1957). A statistical approach to the mechanized encoding and searching of literary information. IBM Journal of Research and Devel opment 1(4), 309–317.

Markov, A. A. (1913). Essai d’une recherche statistique sur le texte du roman “Eugene Onegin” illustrant la liaison des epreuve en chain (‘Example of a statistical investigation of the text of “Eugene Onegin” illustrating the dependence between samples in chain’). Izvistia Imperatorskoi Akademii Nauk (Bulletin de l’Academie Imp´ eriale des Sciences de´ St.-Petersbourg) 7´ , 153–162.

Lui, M. and Baldwin, T. (2011). Crossdomain feature selection for language identification. IJCNLP.

Mairesse, F. and Walker, M. A. (2008). Trainable generation of big-five personality styles through data-driven parameter estimation. ACL

Lui, M. and Baldwin, T. (2012). langid.py: An off-the-shelf language identification tool. ACL.

Manandhar, S., Klapaftis, I. P., Dligach, D., and Pradhan, S. (2010). Semeval-2010 task 14: Word sense induction & disambiguation. SemEval-2010.

Maron, M. E. (1961). Automatic indexing: an experimental inquiry. Journal of the ACM 8(3), 404–417.

Lukovnikov, D., Fischer, A., and Lehmann, J. (2019). Pretrained transformers for simple question answering over knowledge graphs. International Semantic Web Conference.

Mann, W. C. and Thompson, S. A. (1987). Rhetorical structure theory: A theory of text organization. Tech. rep. RS-87-190, Information Sciences Institute.

Marquez\` , L., Carreras, X., Litkowski, K. C., and Stevenson, S. (2008). Semantic role labeling: An introduction to the special issue. Computationa linguistics 34(2), 145–159.

Manning, C. D. (2011). Part-of-speech tagging from 97% to 100%: Is it time for some linguistics?. CICLing 2011.

Marshall, I. (1983). Choice of grammatical word-class without globa syntactic analysis: Tagging words in the LOB corpus. Computers and the Humanities 17, 139–150.

Luo, F., Liu, T., He, Z., Xia, Q., Sui, Z., and Chang, B. (2018a). Leveraging gloss knowledge in neural word sense disambiguation by hierarchical co-attention. EMNLP.

Manning, C. D., Raghavan, P., and Schutze, H. (2008).¨ Introduction to Information Retrieval. Cambridge.

Marshall, I. (1987). Tag selection using probabilistic methods. Garside, R., Leech, G., and Sampson, G. (Eds.), The Computational Analysis of English, 42–56. Longman.

Manning, C. D., Surdeanu, M., Bauer, J., Finkel, J., Bethard, S., and Mc-Closky, D. (2014). The Stanford CoreNLP natural language processing toolkit. ACL.

Martin, J. H. (1986). The acquisition of polysemy. ICML.

Luo, F., Liu, T., Xia, Q., Chang, B., and Sui, Z. (2018b). Incorporating glosses into neural word sense disambiguation. ACL.

Marcu, D. (1997). The rhetorical parsing of natural language texts. ACL.

Martschat, S. and Strube, M. (2014). Recall error analysis for coreference resolution. EMNLP.

Luo, X. (2005). On coreference resolution performance metrics. EMNLP.

Marcu, D. (1999). A decision-based approach to rhetorical parsing. ACL.

Martschat, S. and Strube, M. (2015). Latent structures for coreference resolution. TACL 3, 405–418.

Luo, X. and Pradhan, S. (2016). Evaluation metrics. Poesio, M., Stuckardt, R., and Versley, Y. (Eds.), Anaphora resolution: Algorithms, resources, and applications, 141–163. Springer.

Marcu, D. (2000a). The rhetorical parsing of unrestricted texts: A surface-based approach. Computational Linguistics 26(3), 395–448.

Masterman, M. (1957). The thesaurus in syntax and semantics. Mechanical Translation 4(1), 1–2.

Luo, X., Pradhan, S., Recasens, M., and Hovy, E. H. (2014). An extension of BLANC to system mentions. ACL.

Marcu, D. (Ed.). (2000b). The Theory and Practice of Discourse Parsing and Summarization. MIT Press.

Marcu, D. and Echihabi, A. (2002). An unsupervised approach to recognizing discourse relations. ACL.

Mathis, D. A. and Mozer, M. C. (1995). On the computational utility of consciousness. Tesauro, G., Touretzky, D. S., and Alspector, J. (Eds.), Advances in Neural Information Processing Systems VII. MIT Press.

Lyons, J. (1977). Semantics. Cambridge University Press.

Ma, X. and Hovy, E. H. (2016). End-to-end sequence labeling via bidirectional LSTM-CNNs-CRF. ACL.

Marcu, D. and Wong, W. (2002). A phrase-based, joint probability model for statistical machine translation EMNLP.

McCallum, A., Freitag, D., and Pereira, F. C. N. (2000). Maximum entropy Markov models for information extraction and segmentation. ICML.


<!-- MinerU pages 601-623 -->

McCallum, A. and Li, W. (2003). Early results for named entity recognition with conditional random fields, feature induction and web-enhanced lexicons. CoNLL.

Meister, C., Vieira, T., and Cotterell, R. (2020). If beam search is the answer, what was the question?. EMNLP.

Miller, G. A. and Nicely, P. E. (1955). An analysis of perceptual confusions among some English consonants. JASA 27, 338–352.

McCallum, A. and Nigam, K. (1998). A comparison of event models for naive bayes text classification. AAAI/ICML-98 Workshop on Learn ing for Text Categorization.

Melamud, O., Goldberger, J., and Dagan, I. (2016). context2vec: Learning generic context embedding with bidirectional LSTM. CoNLL.

Mel’cuk ˘ , I. A. (1988). Dependency Syntax: Theory and Practice. State University of New York Press.

Miller, G. A. and Beebe-Center, J. G. (1958). Some psychological methods for evaluating the quality of translations. Mechanical Translation 3, 73– 80.

McCarthy, J. F. and Lehnert, W. G. (1995). Using decision trees for coref erence resolution. IJCAI-95.

Merialdo, B. (1994). Tagging English text with a probabilistic model. Computational Linguistics 20(2), 155–172.

Miller, G. A. and Charles, W. G. (1991). Contextual correlates of semantics similarity. Language and Cognitive Processes 6(1), 1–28.

McCawley, J. D. (1968). The role of se mantics in a grammar. Bach, E. W. and Harms, R. T. (Eds.), Universals in Lin guistic Theory, 124–169. Holt, Rinehart & Winston.

Mesgar, M. and Strube, M. (2016). Lexical coherence graph modeling using word embeddings. ACL.

Miller, G. A. and Chomsky, N. (1963). Finitary models of language users. Luce, R. D., Bush, R. R., and Galanter, E. (Eds.), Handbook of Mathematical Psychology, Vol. II, 419–491. John Wiley.

McCawley, J. D. (1993). Everything that Linguists Have Always Wanted to Know about Logic (2nd Ed.). University of Chicago Press, Chicago, IL.

Metsis, V., Androutsopoulos, I., and Paliouras, G. (2006). Spam filtering with naive bayes-which naive bayes?. CEAS.

McClelland, J. L. and Elman, J. L. (1986). The TRACE model of speech perception. Cognitive Psychology 18, 1–86.

Miller, G. A., Leacock, C., Tengi, R. I., and Bunker, R. T. (1993). A semantic concordance. Proceedings ARPA Workshop on Human Language Technology.

Meyers, A., Reeves, R., Macleod, C., Szekely, R., Zielinska, V., Young, B., and Grishman, R. (2004). The nombank project: An interim report. Proceedings of the NAACL/HLT Workshop: Frontiers in Corpus Annotation.

McClelland, J. L. and Rumelhart, D. E. (Eds.). (1986). Parallel Distributed Processing: Explorations in the Microstructure of Cognition, Vol. 2: Psy chological and Biological Models. MIT Press.

Mihalcea, R. (2007). Using wikipedia for automatic word sense disambiguation. NAACL-HLT.

McCulloch, W. S. and Pitts, W. (1943). A logical calculus of ideas immanent in nervous activity. Bulletin of Mathe matical Biophysics 5, 115–133.

Miller, G. A. and Selfridge, J. A. (1950). Verbal context and the recall of meaningful material. American Journal of Psychology 63, 176–185.

Mihalcea, R. and Csomai, A. (2007). Wikify!: Linking documents to encyclopedic knowledge. CIKM 2007.

McDonald, R., Crammer, K., and Pereira, F. C. N. (2005). Online large-margin training of dependency parsers. ACL.

Miller, S., Bobrow, R. J., Ingria, R., and Schwartz, R. (1994). Hidden understanding models of natural language. ACL.

Mihalcea, R. and Moldovan, D. (2001). Automatic generation of a coarse grained WordNet. NAACL Workshop on WordNet and Other Lexical Resources.

Milne, D. and Witten, I. H. (2008). Learning to link with wikipedia. CIKM 2008.

Mikheev, A., Moens, M., and Grover, C. (1999). Named entity recognition without gazetteers. EACL.

McDonald, R. and Nivre, J. (2011). Analyzing and integrating dependency parsers. Computational Linguistics 37(1), 197–230.

Miltsakaki, E., Prasad, R., Joshi, A. K., and Webber, B. L. (2004). The Penn Discourse Treebank. LREC.

Mikolov, T. (2012). Statistical language models based on neural networks. Ph.D. thesis, Ph. D. thesis, Brno University of Technology.

Minsky, M. (1961). Steps toward artificial intelligence. Proceedings of the IRE 49(1), 8–30.

McDonald, R., Pereira, F. C. N., Rib arov, K., and Hajic, J. (2005). Non-ˇ projective dependency parsing using spanning tree algorithms. HLT-EMNLP.

Minsky, M. (1974). A framework for representing knowledge. Tech. rep. 306, MIT AI Laboratory. Memo 306.

Mikolov, T., Chen, K., Corrado, G. S., and Dean, J. (2013). Efficient estimation of word representations in vector space. ICLR 2013.

Minsky, M. and Papert, S. (1969). Perceptrons. MIT Press.

McGuffie, K. and Newhouse, A. (2020). The radicalization risks of GPT-3 and advanced neural language models. arXiv preprint arXiv:2009.06807.

Mikolov, T., Karafiat, M., Burget,´ L., Cernock <sup>ˇ</sup> y, J., and Khudanpur,\` S. (2010). Recurrent neural network based language model. INTER-SPEECH 2010.

Mintz, M., Bills, S., Snow, R., and Jurafsky, D. (2009). Distant supervision for relation extraction without labeled data. ACL IJCNLP.

Mitchell, M., Wu, S., Zaldivar, A., Barnes, P., Vasserman, L., Hutchinson, B., Spitzer, E., Raji, I. D., and Gebru, T. (2019). Model cards for mode reporting. ACM FAccT.

McGuiness, D. L. and van Harmelen, F. (2004). OWL web ontology overview. Tech. rep. 20040210, World Wide Web Consortium.

Mikolov, T., Kombrink, S., Burget, L., Cernock <sup>ˇ</sup> y, J. H., and Khudanpur, S.\` (2011). Extensions of recurrent neural network language model. ICASSP.

Mitkov, R. (2002). Anaphora Resolution. Longman.

McLuhan, M. (1964). Understanding Media: The Extensions of Man. New American Library.

Mikolov, T., Sutskever, I., Chen, K., Corrado, G. S., and Dean, J. (2013a). Distributed representations of words and phrases and their compositionality. NeurIPS.

Mohamed, A., Dahl, G. E., and Hinton, G. E. (2009). Deep Belief Networks for phone recognition. NIPS Workshop on Deep Learning for Speech Recognition and Related Applications.

Mehl, M. R., Gosling, S. D., and Pen nebaker, J. W. (2006). Personality in its natural habitat: manifestations and implicit folk theories of personality in daily life. Journal of Personality and Social Psychology 90(5).

Mikolov, T., Yih, W.-t., and Zweig, G. (2013b). Linguistic regularities in continuous space word representations. NAACL HLT.

Mohammad, S. M. (2018a). Obtaining reliable human ratings of valence, arousal, and dominance for 20,000 english words. ACL.

Mohammad, S. M. (2018b). Word af fect intensities. LREC.

Mohammad, S. M. and Turney, P. D. (2013). Crowdsourcing a wordemotion association lexicon. Computational Intelligence 29(3), 436–465.

Mrksiˇ c´, N., Seaghdha, D.´ O., Thom-<sup>´</sup> son, B., Gasiˇ c, M., Rojas-Barahona,´ L. M., Su, P.-H., Vandyke, D., Wen, T.-H., and Young, S. (2016). Counterfitting word vectors to linguistic constraints. NAACL HLT.

Navigli, R. (2016). Chapter 20. ontologies. Mitkov, R. (Ed.), The Oxford handbook of computational linguistics. Oxford University Press.

Monroe, B. L., Colaresi, M. P., and Quinn, K. M. (2008). Fightin’words: Lexical feature selection and evaluation for identifying the content of political conflict. Political Analysis 16(4), 372–403.

Muller, P., Braud, C., and Morey, M. (2019). ToNy: Contextual embeddings for accurate multilingual discourse segmentation of full documents. Workshop on Discourse Relation Parsing and Treebanking.

Navigli, R. and Ponzetto, S. P. (2012). BabelNet: The automatic construction, evaluation and application of a wide-coverage multilingual semantic network. Artificial Intelligence 193, 217–250.

Navigli, R. and Vannella, D. (2013). Semeval-2013 task 11: Word sense induction & disambiguation within an end-user application. \*SEM.

Montague, R. (1973). The proper treatment of quantification in ordinary English. Thomason, R. (Ed.), Formal Philosophy: Selected Papers of Richard Montague, 247–270. Yale University Press, New Haven, CT.

Murphy, K. P. (2012). Machine learning: A probabilistic perspective. MIT press.

Moosavi, N. S. and Strube, M. (2016). Which coreference evaluation metric do you trust? a proposal for a linkbased entity aware metric. ACL.

Musi, E., Stede, M., Kriese, L., Muresan, S., and Rocci, A. (2018). A multilayer annotated corpus of argumentative text: From argument schemes to discourse relations. LREC.

Nayak, N., Hakkani-Tur, D., Walker,¨ M. A., and Heck, L. P. (2017). To plan or not to plan? discourse planning in slot-value informed sequence to sequence models for language generation. INTERSPEECH.

Morey, M., Muller, P., and Asher, N. (2017). How much progress have we made on RST discourse parsing? a replication study of recent results on the rst-dt. EMNLP.

Myers, G. (1992). “in this paper we report...”: Speech acts and scientific facts. Journal of Pragmatics 17(4), 295–313.

Neff, G. and Nagy, P. (2016). Talking to bots: Symbiotic agency and the case of Tay. International Journal of Communication 10, 4915–4931.

Morgan, A. A., Hirschman, L., Colosimo, M., Yeh, A. S., and Colombe, J. B. (2004). Gene name identification and normalization using a model organism database. Journal of Biomedical Informatics 37(6), 396–410.

Morgan, N. and Bourlard, H. (1990). Continuous speech recognition using multilayer perceptrons with hidden markov models. ICASSP.

Nadas´ , A. (1984). Estimation of probabilities in the language model of the IBM speech recognition system. IEEE Transactions on Acoustics, Speech, Signal Processing 32(4), 859–861.

Ng, A. Y. and Jordan, M. I. (2002). On discriminative vs. generative classifiers: A comparison of logistic regression and naive bayes. NIPS 14.

Morgan, N. and Bourlard, H. A. (1995). Neural networks for statistical recognition of continuous speech. Proceedings of the IEEE 83(5), 742– 772.

Nagata, M. and Morimoto, T. (1994). First steps toward statistical modeling of dialogue to predict the speech act type of the next utterance. Speech Communication 15, 193–203.

Ng, H. T., Teo, L. H., and Kwan, J. L. P. (2000). A machine learning approach to answering questions for reading comprehension tests. EMNLP.

Nallapati, R., Zhou, B., dos Santos, C., Gu<sup>\`</sup>I‡lc¸ehre, C¸ ., and Xiang, B. (2016). Abstractive text summarization using sequence-to-sequence RNNs and beyond. Proceedings of The 20th SIGNLL Conference on Computational Natural Language Learning. Association for Computational Linguistics.

Ng, V. (2004). Learning noun phrase anaphoricity to improve coreference resolution: Issues in representation and optimization. ACL.

Ng, V. (2005a). Machine learning for coreference resolution: From loca classification to global ranking. ACL.

Morris, J. and Hirst, G. (1991). Lexical cohesion computed by thesaural relations as an indicator of the structure of text. Computational Linguistics 17(1), 21–48.

Ng, V. (2005b). Supervised ranking for pronoun resolution: Some recent improvements. AAAI.

Ng, V. (2010). Supervised noun phrase coreference research: The first fifteen years. ACL.

Nash-Webber, B. L. (1975). The role of semantics in automatic speech understanding. Bobrow, D. G. and Collins, A. (Eds.), Representation and Understanding, 351–382. Academic Press.

Ng, V. (2017). Machine learning for entity coreference resolution: A retrospective look at two decades of research. AAAI.

Morris, W. (Ed.). (1985). American Heritage Dictionary (2nd College Edition Ed.). Houghton Mifflin.

Ng, V. and Cardie, C. (2002a). Identifying anaphoric and non-anaphoric noun phrases to improve coreference resolution. COLING.

Mosteller, F. and Wallace, D. L. (1963). Inference in an authorship problem: A comparative study of discrimination methods applied to the authorship of the disputed federalist papers. Journal of the American Statistical Association 58(302), 275–309.

Naur, P., Backus, J. W., Bauer, F. L., Green, J., Katz, C., McCarthy, J., Perlis, A. J., Rutishauser, H., Samelson, K., Vauquois, B., Wegstein, J. H., van Wijnagaarden, A., and Woodger, M. (1960). Report on the algorithmic language ALGOL 60. CACM 3(5), 299–314. Revised in CACM 6:1, 1- 17, 1963.

Ng, V. and Cardie, C. (2002b). Improving machine learning approaches to coreference resolution. ACL.

Nguyen, D. T. and Joty, S. (2017). A neural local coherence model. ACL.

Mosteller, F. and Wallace, D. L. (1964). Inference and Disputed Authorship: The Federalist. Springer-Verlag. 1984 2nd edition: Applied Bayesian and Classical Inference.

Navigli, R. (2006). Meaningful clustering of senses helps boost word sense disambiguation performance. COL-ING/ACL.

Nguyen, K. A., Schulte im Walde, S., and Vu, N. T. (2016). Integrating distributional lexical contrast into word embeddings for antonymsynonym distinction. ACL.

Mrksiˇ c´, N., O S <sup>´</sup> eaghdha, D., Wen,´ T.-H., Thomson, B., and Young, S. (2017). Neural belief tracker: Datadriven dialogue state tracking. ACL.

Navigli, R. (2009). Word sense disambiguation: A survey. ACM Computing Surveys 41(2).

Nie, A., Bennett, E., and Goodman, N. (2019). Dissent: Learning sentence representations from explici discourse relations. ACL.

Nielsen, J. (1992). The usability engineering life cycle. IEEE Computer 25(3), 12–22.

Nivre, J. and Nilsson, J. (2005). Pseudo-projective dependency parsing. ACL.

Oravecz, C. and Dienes, P. (2002). Efficient stochastic part-of-speech tagging for Hungarian. LREC.

Nielsen, M. A. (2015). Neural networks and Deep learning. Determina tion Press USA.

Nivre, J. and Scholz, M. (2004). Deterministic dependency parsing of english text. COLING.

Nigam, K., Lafferty, J. D., and McCallum, A. (1999). Using maximum entropy for text classification. IJCAI-99 workshop on machine learning for in formation filtering.

Oren, I., Herzig, J., Gupta, N., Gardner, M., and Berant, J. (2020). Improving compositional generalization in semantic parsing. arXiv preprint arXiv:2010.05647.

Niwa, Y. and Nitta, Y. (1994). Cooccurrence vectors from corpora vs. distance vectors from dictionaries. ACL.

Osgood, C. E., Suci, G. J., and Tannenbaum, P. H. (1957). The Measurement of Meaning. University of Illinois Press.

Nilsson, J., Riedel, S., and Yuret, D. (2007). The conll 2007 shared task on dependency parsing. Proceedings of the CoNLL shared task session of EMNLP-CoNLL. sn.

Noreen, E. W. (1989). Computer Intensive Methods for Testing Hypothesis. Wiley.

Norman, D. A. (1988). The Design of Everyday Things. Basic Books.

Ostendorf, M., Price, P., and Shattuck-Hufnagel, S. (1995). The Boston University Radio News Corpus. Tech. rep. ECS-95-001, Boston University.

Nirenburg, S., Somers, H. L., and Wilks, Y. (Eds.). (2002). Readings in Machine Translation. MIT Press.

Norman, D. A. and Rumelhart, D. E. (1975). Explorations in Cognition. Freeman.

Packard, D. W. (1973). Computerassisted morphological analysis of ancient Greek. COLING.

Nissim, M., Dingare, S., Carletta, J., and Steedman, M. (2004). An annotation scheme for information status in dialogue. LREC.

Norvig, P. (1991). Techniques for automatic memoization with applications to context-free parsing. Computational Linguistics 17(1), 91–98.

NIST (1990). TIMIT Acoustic-Phonetic Continuous Speech Corpus. National Institute of Standards and Technology Speech Disc 1-1.1. NIST Order No. PB91-505065.

Palmer, D. (2012). Text preprocessing. Indurkhya, N. and Damerau, F. J. (Eds.), Handbook of Natural Language Processing, 9–30. CRC Press.

NIST (2005). Speech recognition scor ing toolkit (sctk) version 2.1. http: //www.nist.gov/speech/tools/.

NIST (2007). Matched Pairs Sentence-Segment Word Error (MAPSSWE) Test..

Nosek, B. A., Banaji, M. R., and Greenwald, A. G. (2002a). Harvesting implicit group attitudes and beliefs from a demonstration web site. Group Dynamics: Theory, Research, and Practice 6(1), 101.

Palmer, M., Babko-Malaya, O., and Dang, H. T. (2004). Different sense granularities for different applications. HLT-NAACL Workshop on Scalable Natural Language Understanding.

Nivre, J. (2007). Incremental nonprojective dependency parsing. NAACL-HLT.

Nivre, J. (2003). An efficient algorithm for projective dependency parsing. Proceedings of the 8th Interna tional Workshop on Parsing Technolo gies (IWPT).

Nosek, B. A., Banaji, M. R., and Greenwald, A. G. (2002b). Math=male, me=female, therefore math= me. Journal of personality and social psychology 83(1), 44.

Palmer, M., Dang, H. T., and Fellbaum, C. (2006). Making finegrained and coarse-grained sense distinctions, both manually and automatically. Natural Language Engineering 13(2), 137–163.

Och, F. J. (1998). Ein beispielsbasierter und statistischer Ansatz zum maschinellen Lernen von naturlichsprachlicher ¨ Ubersetzung <sup>¨</sup> . Ph.D. thesis, Universitat Erlangen-¨ Nurnberg, Germany. Diplomarbeit¨ (diploma thesis).

Nivre, J. (2006). Inductive Dependency Parsing. Springer.

Palmer, M., Gildea, D., and Xue, N. (2010). Semantic role labeling. Synthesis Lectures on Human Language Technologies 3(1), 1–103.

Och, F. J. (2003). Minimum error rate training in statistical machine translation. ACL.

Nivre, J. (2009). Non-projective depen dency parsing in expected linear time. ACL IJCNLP.

Palmer, M., Kingsbury, P., and Gildea, D. (2005). The proposition bank: An annotated corpus of semantic roles. Computational Linguistics 31(1), 71– 106.

Och, F. J. and Ney, H. (2003). A systematic comparison of various statistical alignment models. Computational Linguistics 29(1), 19–51.

Nivre, J., de Marneffe, M.-C., Ginter, F., Goldberg, Y., Hajic, J., Man-ˇ ning, C. D., McDonald, R., Petrov, S., Pyysalo, S., Silveira, N., Tsarfaty, R., and Zeman, D. (2016a). Universal Dependencies v1: A multilingual tree bank collection. LREC.

Panayotov, V., Chen, G., Povey, D., and Khudanpur, S. (2015). Librispeech: an ASR corpus based on public domain audio books. ICASSP.

Och, F. J. and Ney, H. (2004). The alignment template approach to statistical machine translation. Computational Linguistics 30(4), 417–449.

Pang, B. and Lee, L. (2008). Opinion mining and sentiment analysis. Foundations and trends in information retrieval 2(1-2), 1–135.

Nivre, J., de Marneffe, M.-C., Ginter, F., Goldberg, Y., Hajic, J., Man-ˇ ning, C. D., McDonald, R., Petrov, S., Pyysalo, S., Silveira, N., Tsarfaty, R., and Zeman, D. (2016b). Universal De pendencies v1: A multilingual tree bank collection. LREC.

O’Connor, B., Krieger, M., and Ahn, D. (2010). Tweetmotif: Exploratory search and topic summarization for twitter. ICWSM.

Pang, B., Lee, L., and Vaithyanathan, S. (2002). Thumbs up? Sentiment classification using machine learning techniques. EMNLP.

Olive, J. P. (1977). Rule synthesis of speech from dyadic units. ICASSP77.

Nivre, J., Hall, J., Nilsson, J., Chanev, A., Eryigit, G., Kubler, S., Mari-¨ nov, S., and Marsi, E. (2007). Maltparser: A language-independent system for data-driven dependency parsing. Natural Language Engineering 13(02), 95–135.

Olteanu, A., Diaz, F., and Kazai, G. (2020). When are search completion suggestions problematic?. CSCW.

Paolino, J. (2017). Google Home vs Alexa: Two simple user experience design gestures that delighted a female user. Medium. Jan 4, 2017. https: //medium.com/startup-grind/ google-home-vs-alexa-56e26f69ac77.

Oppenheim, A. V., Schafer, R. W., and Stockham, T. G. J. (1968). Nonlinear filtering of multiplied and convolved signals. Proceedings of the IEEE 56(8), 1264–1291.

Papineni, K., Roukos, S., Ward, T., and Zhu, W.-J. (2002). Bleu: A method for automatic evaluation of machine translation. ACL.

Paranjape, A., See, A., Kenealy, K., Li, H., Hardy, A., Qi, P., Sadagopan, K. R., Phu, N. M., Soylu, D., and Manning, C. D. (2020). Neural generation meets real people: Towards emotionally engaging mixed-initiative conversations. 3rd Proceedings of Alexa Prize.

Peters, M., Neumann, M., Iyyer, M., Gardner, M., Clark, C., Lee, K., and Zettlemoyer, L. (2018). Deep contextualized word representations. NAACL HLT.

Hume, E., and Fosler-Lussier, E. (2007). Buckeye corpus of conversational speech (2nd release).. Department of Psychology, Ohio State University (Distributor).

Park, J. H., Shin, J., and Fung, P. (2018). Reducing gender bias in abusive language detection. EMNLP.

Peterson, G. E. and Barney, H. L. (1952). Control methods used in a study of the vowels. JASA 24, 175– 184.

Pitt, M. A., Johnson, K., Hume, E., Kiesling, S., and Raymond, W. D. (2005). The buckeye corpus of conversational speech: Labeling conventions and a test of transcriber reliability. Speech Communication 45, 90–95.

Park, J. and Cardie, C. (2014). Identifying appropriate support for propositions in online user comments. First workshop on argumentation mining.

Peterson, G. E., Wang, W. S.-Y., and Sivertsen, E. (1958). Segmentation techniques in speech synthesis. JASA 30(8), 739–742.

Plutchik, R. (1962). The emotions: Facts, theories, and a new model. Random House.

Parsons, T. (1990). Events in the Semantics of English. MIT Press.

Partee, B. H. (Ed.). (1976). Montague Grammar. Academic Press.

Peterson, J. C., Chen, D., and Griffiths, T. L. (2020). Parallelograms revisited: Exploring the limitations of vector space models for simple analogies. Cognition 205.

Paszke, A., Gross, S., Chintala, S., Chanan, G., Yang, E., DeVito, Z., Lin, Z., Desmaison, A., Antiga, L., and Lerer, A. (2017). Automatic differentiation in pytorch. NIPS-W.

Plutchik, R. (1980). A general psychoevolutionary theory of emotion. Plutchik, R. and Kellerman, H. (Eds.), Emotion: Theory, Research, and Experience, Volume 1, 3–33. Academic Press.

Petrov, S., Das, D., and McDonald, R. (2012). A universal part-of-speech tagset. LREC.

Pearl, C. (2017). Designing Voice User Interfaces: Principles of Conversational Experiences. O’Reilly.

Pedersen, T. and Bruce, R. (1997). Distinguishing word senses in untagged text. EMNLP.

Petrov, S. and McDonald, R. (2012). Overview of the 2012 shared task on parsing the web. Notes of the First Workshop on Syntactic Analysis of Non-Canonical Language (SANCL), Vol. 59.

Peldszus, A. and Stede, M. (2013). From argument diagrams to argumentation mining in texts: A survey. International Journal of Cognitive Informatics and Natural Intelligence (IJCINI) 7(1), 1–31.

Poesio, M., Stevenson, R., Di Eugenio, B., and Hitzeman, J. (2004). Centering: A parametric theory and its instantiations. Computational Linguistics 30(3), 309–363.

Phillips, A. V. (1960). A questionanswering routine. Tech. rep. 16, MIT AI Lab.

Peldszus, A. and Stede, M. (2016). An annotated corpus of argumentative microtexts. 1st European Conference on Argumentation.

Picard, R. W. (1995). Affective computing. Tech. rep. 321, MIT Media Lab Perceputal Computing Technical Report. Revised November 26, 1995.

Poesio, M., Stuckardt, R., and Versley, Y. (2016). Anaphora resolution: Algorithms, resources, and applications. Springer.

Penn, G. and Kiparsky, P. (2012). On Pan¯ ini and the generative capacity of contextualized replacement systems. COLING.

Pieraccini, R., Levin, E., and Lee, C.- H. (1991). Stochastic representation of conceptual structure in the ATIS task. Proceedings DARPA Speech and Natural Language Workshop.

Poesio, M., Sturt, P., Artstein, R., and Filik, R. (2006). Underspecification and anaphora: Theoretical issues and preliminary evidence. Discourse processes 42(2), 157–175.

Pierce, J. R., Carroll, J. B., Hamp, E. P., Hays, D. G., Hockett, C. F., Oettinger, A. G., and Perlis, A. J. (1966). Language and Machines: Computers in Translation and Linguistics. ALPAC report. National Academy of Sciences, National Research Council, Washington, DC.

Poesio, M. and Vieira, R. (1998). A corpus-based investigation of definite description use. Computational Linguistics 24(2), 183–216.

Polanyi, L. (1988). A formal model of the structure of discourse. Journal of Pragmatics 12.

Pennebaker, J. W., Booth, R. J., and Francis, M. E. (2007). Linguistic Inquiry and Word Count: LIWC 2007. Austin, TX.

Polanyi, L., Culy, C., van den Berg, M., Thione, G. L., and Ahn, D. (2004). A rule based approach to discourse parsing. Proceedings of SIGDIAL.

Pilehvar, M. T. and Camacho-Collados, J. (2019). WiC: the word-incontext dataset for evaluating contextsensitive meaning representations. NAACL HLT.

Pennebaker, J. W. and King, L. A. (1999). Linguistic styles: language use as an individual difference. Journal of Personality and Social Psychology 77(6).

Polifroni, J., Hirschman, L., Seneff, S., and Zue, V. W. (1992). Experiments in evaluating interactive spoken language systems. Proceedings DARPA Speech and Natural Language Workshop.

Pollard, C. and Sag, I. A. (1994). Head-Driven Phrase Structure Grammar. University of Chicago Press.

Pennington, J., Socher, R., and Manning, C. D. (2014). Glove: Global vectors for word representation. EMNLP.

Pilehvar, M. T., Jurgens, D., and Navigli, R. (2013). Align, disambiguate and walk: A unified approach for measuring semantic similarity. ACL.

Ponzetto, S. P. and Navigli, R. (2010). Knowledge-rich word sense disambiguation rivaling supervised systems. ACL.

Percival, W. K. (1976). On the historical source of immediate constituent analysis. McCawley, J. D. (Ed.), Syntax and Semantics Volume 7, Notes from the Linguistic Underground, 229–242. Academic Press.

Pitler, E., Louis, A., and Nenkova, A. (2009). Automatic sense prediction for implicit discourse relations in text. ACL IJCNLP.

Ponzetto, S. P. and Strube, M. (2006). Exploiting semantic role labeling, WordNet and Wikipedia for coreference resolution. HLT-NAACL.

Perrault, C. R. and Allen, J. (1980). A plan-based analysis of indirect speech acts. American Journal of Computational Linguistics 6(3-4), 167–182.

Pitler, E. and Nenkova, A. (2009). Using syntax to disambiguate explicit discourse connectives in text. ACL IJCNLP.

Pitt, M. A., Dilley, L., Johnson, K., Kiesling, S., Raymond, W. D.,

Ponzetto, S. P. and Strube, M. (2007). Knowledge derived from Wikipedia for computing semantic relatedness. JAIR 30, 181–212.

Popp, D., Donovan, R. A., Crawford, M., Marsh, K. L., and Peele, M. (2003). Gender, race, and speech style stereotypes. Sex Roles 48(7-8), 317– 325.

Porter, M. F. (1980). An algorithm for suffix stripping. Program 14(3), 130– 137.

Prasad, R., Dinesh, N., Lee, A., Miltsakaki, E., Robaldo, L., Joshi, A. K., and Webber, B. L. (2008). The Penn Discourse TreeBank 2.0. LREC.

Pustejovsky, J., Hanks, P., Saur´ı, R., See, A., Gaizauskas, R., Setzer, A., Radev, D., Sundheim, B., Day, D. S., Ferro, L., and Lazo, M. (2003b). The TIMEBANK corpus. Proceedings of Corpus Linguistics 2003 Conference. UCREL Technical Paper number 16.

Post, M. (2018). A call for clarity in reporting BLEU scores. WMT 2018.

Prasad, R., Webber, B. L., and Joshi, A. (2014). Reflections on the Penn Discourse Treebank, comparable corpora, and complementary annotation. Computational Linguistics 40(4), 921–950.

Pustejovsky, J., Ingria, R., Saur´ı, R., Castano, J., Littman, J., Gaizauskas,˜ R., Setzer, A., Katz, G., and Mani, I. (2005). The Specification Language TimeML, chap. 27. Oxford.

Potts, C. (2011). On the negativity of negation. Li, N. and Lutz, D. (Eds.), Proceedings of Semantics and Linguistic Theory 20, 636–659. CLC Publications, Ithaca, NY.

Prates, M. O. R., Avelar, P. H., and Lamb, L. C. (2019). Assessing gender bias in machine translation: a case study with Google Translate. Neural Computing and Applications 32, 6363–6381.

Qin, L., Zhang, Z., and Zhao, H. (2016). A stacking gated neural architecture for implicit discourse relation classification. EMNLP.

Povey, D., Ghoshal, A., Boulianne, G., Burget, L., Glembek, O., Goel, N., Hannemann, M., Motlicek, P., Qian, Y., Schwarz, P., Silovsky, J., Stemmer,´ G., and Vesely, K. (2011). The Kaldi´ speech recognition toolkit. ASRU.

Price, P. J., Fisher, W., Bernstein, J., and Pallet, D. (1988). The DARPA 1000-word resource management database for continuous speech recognition. ICASSP.

Qin, L., Zhang, Z., Zhao, H., Hu, Z., and Xing, E. (2017). Adversarial connective-exploiting networks for implicit discourse relation classification. ACL.

Pradhan, S., Hovy, E. H., Marcus, M. P., Palmer, M., Ramshaw, L., and Weischedel, R. (2007a). OntoNotes: A unified relational semantic repre sentation. Proceedings of ICSC.

Price, P. J., Ostendorf, M., Shattuck-Hufnagel, S., and Fong, C. (1991). The use of prosody in syntactic disambiguation. JASA 90(6).

Pradhan, S., Hovy, E. H., Marcus, M. P., Palmer, M., Ramshaw, L. A., and Weischedel, R. M. (2007b). Ontonotes: a unified relational semantic representation. Int. J. Semantic Computing 1(4), 405–419.

Quillian, M. R. (1968). Semantic memory. Minsky, M. (Ed.), Semantic Information Processing, 227–270. MIT Press.

Prince, E. (1981a). Toward a taxonomy of given-new information. Cole, P. (Ed.), Radical Pragmatics, 223–256. Academic Press.

Pradhan, S., Luo, X., Recasens, M., Hovy, E. H., Ng, V., and Strube, M. (2014). Scoring coreference partitions of predicted mentions: A reference implementation. ACL.

Pradhan, S., Moschitti, A., Xue, N., Ng, H. T., Bjorkelund, A., Uryupina,¨ O., Zhang, Y., and Zhong, Z. (2013). Towards robust linguistic analysis us ing OntoNotes. CoNLL.

Quillian, M. R. (1969). The teachable language comprehender: A simulation program and theory of language. CACM 12(8), 459–476.

Prince, E. (1981b). Toward a taxonomy of given-new information. Cole, P. (Ed.), Radical Pragmatics, 223–255. Academic Press.

Propp, V. (1968). Morphology of the Folktale (2nd Ed.). University of Texas Press. Original Russian 1928. Translated by Laurence Scott.

Quirk, R., Greenbaum, S., Leech, G., and Svartvik, J. (1985). A Comprehensive Grammar of the English Language. Longman.

Pu, X., Pappas, N., Henderson, J., and Popescu-Belis, A. (2018). Integrating weakly supervised word sense disambiguation into neural machine translation. TACL 6, 635–649.

Radford, A., Wu, J., Child, R., Luan, D., Amodei, D., and Sutskever, I. (2019). Language models are unsupervised multitask learners. OpenAI tech report.

Pradhan, S., Moschitti, A., Xue, N., Uryupina, O., and Zhang, Y. (2012a). CoNLL-2012 shared task: Modeling multilingual unrestricted coreference in OntoNotes. CoNLL.

Pullum, G. K. (1991). The Great Eskimo Vocabulary Hoax. University of Chicago.

Radford, A. (1997). Syntactic Theory and the Structure of English: A Minimalist Approach. Cambridge University Press.

Pundak, G. and Sainath, T. N. (2016). Lower frame rate neural network acoustic models. INTERSPEECH.

Raganato, A., Bovi, C. D., and Navigli, R. (2017a). Neural sequence learning models for word sense disambiguation. EMNLP.

Pradhan, S., Moschitti, A., Xue, N., Uryupina, O., and Zhang, Y. (2012b). Conll-2012 shared task: Modeling multilingual unrestricted coreference in OntoNotes. CoNLL.

Purver, M. (2004). The theory and use of clarification requests in dialogue. Ph.D. thesis, University of London.

Raganato, A., Camacho-Collados, J., and Navigli, R. (2017b). Word sense disambiguation: A unified evaluation framework and empirical comparison. EACL.

Pradhan, S., Ramshaw, L., Marcus, M. P., Palmer, M., Weischedel, R., and Xue, N. (2011). CoNLL-2011 shared task: Modeling unrestricted corefer ence in OntoNotes. CoNLL.

Pustejovsky, J. (1991). The generative lexicon. Computational Linguistics 17(4).

Raghunathan, K., Lee, H., Rangarajan, S., Chambers, N., Surdeanu, M., Jurafsky, D., and Manning, C. D. (2010). A multi-pass sieve for coreference resolution. EMNLP.

Pustejovsky, J. (1995). The Generative Lexicon. MIT Press.

Pradhan, S., Ramshaw, L., Weischedel, R., MacBride, J., and Mic ciulla, L. (2007). Unrestricted coreference: Identifying entities and events in OntoNotes. Proceedings of ICSC 2007.

Pustejovsky, J. and Boguraev, B. K. (Eds.). (1996). Lexical Semantics: The Problem of Polysemy. Oxford University Press.

Rahman, A. and Ng, V. (2009). Supervised models for coreference resolution. EMNLP.

Rahman, A. and Ng, V. (2012). Resolving complex cases of definite pronouns: the Winograd Schema challenge. EMNLP.

Pradhan, S., Ward, W., Hacioglu, K., Martin, J. H., and Jurafsky, D. (2005). Semantic role labeling using differen syntactic views. ACL.

Pustejovsky, J., Castano, J., Ingria, R.,˜ Saur´ı, R., Gaizauskas, R., Setzer, A., and Katz, G. (2003a). TimeML: robust specification of event and temporal expressions in text. Proceedings of the 5th International Workshop on Computational Semantics (IWCS-5).

Rajpurkar, P., Jia, R., and Liang, P. (2018). Know what you don’t know: Unanswerable questions for SQuAD. ACL.

Rajpurkar, P., Zhang, J., Lopyrev, K., and Liang, P. (2016). SQuAD: 100,000+ questions for machine comprehension of text. EMNLP.

Reed, C., Mochales Palau, R., Rowe, G., and Moens, M.-F. (2008). Language resources for studying argument. LREC.

Riloff, E. and Wiebe, J. (2003). Learning extraction patterns for subjective expressions. EMNLP.

Ram, A., Prasad, R., Khatri, C., Venkatesh, A., Gabriel, R., Liu, Q., Nunn, J., Hedayatnia, B., Cheng, M., Nagar, A., King, E., Bland, K., Wartick, A., Pan, Y., Song, H., Jayadevan, S., Hwang, G., and Pettigrue, A. (2017). Conversational ai: The science behind the Alexa Prize. 1st Proceedings of Alexa Prize.

Rehder, B., Schreiner, M. E., Wolfe, M. B. W., Laham, D., Landauer, T. K., and Kintsch, W. (1998). Using Latent Semantic Analysis to assess knowledge: Some technical considerations. Discourse Processes 25(2-3), 337– 354.

Ritter, A., Cherry, C., and Dolan, B. (2010). Unsupervised modeling of twitter conversations. HLT-NAACL.

Ritter, A., Cherry, C., and Dolan, B. (2011). Data-driven response generation in social media. EMNLP.

Reichenbach, H. (1947). Elements of Symbolic Logic. Macmillan, New York.

Ritter, A., Etzioni, O., and Mausam (2010). A latent dirichlet allocation method for selectional preferences. ACL.

Ramshaw, L. A. and Marcus, M. P. (1995). Text chunking using transformation-based learning. Proceedings of the 3rd Annual Workshop on Very Large Corpora.

Reichman, R. (1985). Getting Computers to Talk Like You and Me. MIT Press.

Ritter, A., Zettlemoyer, L., Mausam, and Etzioni, O. (2013). Modeling missing data in distant supervision for information extraction. TACL 1, 367– 378.

Ranganath, R., Jurafsky, D., and Mc-Farland, D. A. (2013). Detecting friendly, flirtatious, awkward, and assertive speech in speed-dates. Computer Speech and Language 27(1), 89–115.

Resnik, P. (1993). Semantic classes and syntactic ambiguity. Proceedings of the workshop on Human Language Technology.

Raphael, B. (1968). SIR: A computer program for semantic information retrieval. Minsky, M. (Ed.), Semantic Information Processing, 33–145. MIT Press.

Resnik, P. (1996). Selectional constraints: An information-theoretic model and its computational realization. Cognition 61, 127–159.

Roberts, A., Raffel, C., and Shazeer, N. (2020). How much knowledge can you pack into the parameters of a language model?. arXiv preprint arXiv:2002.08910.

Rashkin, H., Bell, E., Choi, Y., and Volkova, S. (2017). Multilingual connotation frames: A case study on social media for targeted sentiment analysis and forecast. ACL.

Rashkin, H., Singh, S., and Choi, Y. (2016). Connotation frames: A datadriven investigation. ACL.

Richardson, M., Burges, C. J. C., and Renshaw, E. (2013). MCTest: A challenge dataset for the open-domain machine comprehension of text. EMNLP.

Rashkin, H., Smith, E. M., Li, M., and Boureau, Y.-L. (2019). Towards empathetic open-domain conversation models: A new benchmark and dataset. ACL.

Robertson, S., Walker, S., Jones, S., Hancock-Beaulieu, M. M., and Gatford, M. (1995). Okapi at TREC-3. Overview of the Third Text REtrieva Conference (TREC-3).

Riedel, S., Yao, L., and McCallum, A. (2010). Modeling relations and their mentions without labeled text. Machine Learning and Knowledge Discovery in Databases, 148–163. Springer.

Riedel, S., Yao, L., McCallum, A., and Marlin, B. M. (2013). Relation extraction with matrix factorization and universal schemas. NAACL HLT.

Robins, R. H. (1967). A Short History of Linguistics. Indiana University Press, Bloomington.

Ratinov, L. and Roth, D. (2012). Learning-based multi-sieve coreference resolution with knowledge. EMNLP.

Riesbeck, C. K. (1975). Conceptual analysis. Schank, R. C. (Ed.), Conceptual Information Processing, 83–156. American Elsevier, New York.

Robinson, T. and Fallside, F. (1991). A recurrent error propagation network speech recognition system. Computer Speech & Language 5(3), 259–274.

Rohde, D. L. T., Gonnerman, L. M., and Plaut, D. C. (2006). An improved model of semantic similarity based on lexical co-occurrence. CACM 8, 627– 633.

Riloff, E. (1993). Automatically constructing a dictionary for information extraction tasks. AAAI.

Ratnaparkhi, A. (1996). A maximum entropy part-of-speech tagger. EMNLP.

Roller, S., Dinan, E., Goyal, N., Ju, D., Williamson, M., Liu, Y., Xu, J., Ott, M., Shuster, K., Smith, E. M., Boureau, Y.-L., and Weston, J. (2020). Recipes for building an open-domain chatbot. arXiv preprin arXiv:2004.13637.

Riloff, E. (1996). Automatically generating extraction patterns from untagged text. AAAI.

Ratnaparkhi, A. (1997). A linear observed time statistical parser based on maximum entropy models. EMNLP.

Rooth, M., Riezler, S., Prescher, D., Carroll, G., and Beil, F. (1999). Inducing a semantically annotated lexicon via EM-based clustering. ACL.

Recasens, M. and Hovy, E. H. (2011). BLANC: Implementing the Rand index for coreference evaluation. Natural Language Engineering 17(4), 485– 510.

Riloff, E. and Jones, R. (1999). Learning dictionaries for information extraction by multi-level bootstrapping. AAAI.

Rosenblatt, F. (1958). The perceptron: A probabilistic model for information storage and organization in the brain. Psychological review 65(6), 386–408.

Riloff, E. and Schmelzenbach, M. (1998). An empirical approach to conceptual case frame acquisition. Proceedings of the Sixth Workshop on Very Large Corpora.

Rosenfeld, R. (1996). A maximum entropy approach to adaptive statistica language modeling. Computer Speech and Language 10, 187–228.

Recasens, M., Hovy, E. H., and Mart´ı, M. A. (2011). Identity, non-identity, and near-identity: Addressing the complexity of coreference. Lingua 121(6), 1138–1152.

Riloff, E. and Shepherd, J. (1997). A corpus-based approach for building semantic lexicons. EMNLP.

Rosenthal, S. and McKeown, K. (2017). Detecting influencers in multiple online genres. ACM Transactions on Internet Technology (TOIT) 17(2).

Recasens, M. and Mart´ı, M. A. (2010). AnCora-CO: Coreferentially annotated corpora for Spanish and Catalan. Language Resources and Evaluation 44(4), 315–345.

Riloff, E. and Thelen, M. (2000). A rule-based question answering system for reading comprehension tests. ANLP/NAACL workshop on reading comprehension tests.

Rothe, S., Ebert, S., and Schutze, H.¨ (2016). Ultradense Word Embeddings by Orthogonal Transformation. NAACL HLT.

Roy, N., Pineau, J., and Thrun, S. (2000). Spoken dialog management for robots. ACL.

Rudinger, R., Naradowsky, J., Leonard, B., and Van Durme, B. (2018). Gender bias in coreference resolution. NAACL HLT.

Sagae, K. (2009). Analysis of discourse structure with syntactic dependencies and data-driven shift-reduce parsing. IWPT-09.

Schiebinger, L. (2013). Machine translation: Analyzing gender. http://genderedinnovations. stanford.edu/case-studies/ nlp.html#tabs-2.

Sagisaka, Y. (1988). Speech synthesis by rule using an optimal selection of non-uniform synthesis units. ICASSP.

Schiebinger, L. (2014). Scientific research must take gender into account. Nature 507(7490), 9.

Rumelhart, D. E., Hinton, G. E., and Williams, R. J. (1986). Learning internal representations by error propagation. Rumelhart, D. E. and McClel land, J. L. (Eds.), Parallel Distributed Processing, Vol. 2, 318–362. MIT Press.

Sagisaka, Y., Kaiki, N., Iwahashi, N., and Mimura, K. (1992). Atr – ν-talk speech synthesis system. ICSLP.

Sahami, M., Dumais, S. T., Heckerman, D., and Horvitz, E. (1998). A Bayesian approach to filtering junk email. AAAI Workshop on Learning for Text Categorization.

Schneider, N., Hwang, J. D., Srikumar, V., Prange, J., Blodgett, A., Moeller, S. R., Stern, A., Bitan, A., and Abend, O. (2018). Comprehensive supersense disambiguation of English prepositions and possessives. ACL.

Rumelhart, D. E. and McClelland, J. L. (1986a). On learning the past tense of English verbs. Rumelhart, D. E. and McClelland, J. L. (Eds.), Parallel Distributed Processing, Vol. 2, 216–271. MIT Press.

Sakoe, H. and Chiba, S. (1971). A dynamic programming approach to continuous speech recognition. Proceedings of the Seventh International Congress on Acoustics, Vol. 3. Akademiai Kiad´ o.´

Schone, P. and Jurafsky, D. (2000). Knowlege-free induction of morphology using latent semantic analysis. CoNLL.

Rumelhart, D. E. and McClelland, J. L. (Eds.). (1986b). Parallel Dis tributed Processing. MIT Press.

Schone, P. and Jurafsky, D. (2001a). Is knowledge-free induction of multiword unit dictionary headwords a solved problem?. EMNLP.

Rumelhart, D. E. and Abrahamson, A. A. (1973). A model for analogical reasoning. Cognitive Psychology 5(1), 1–28.

Sakoe, H. and Chiba, S. (1984). Dynamic programming algorithm optimization for spoken word recognition. IEEE Transactions on Acoustics, Speech, and Signal Processing ASSP-26(1), 43–49.

Schone, P. and Jurafsky, D. (2001b). Knowledge-free induction of inflectional morphologies. NAACL.

Rumelhart, D. E. and McClelland, J. L. (Eds.). (1986). Parallel Dis tributed Processing: Explorations in the Microstructure of Cognition, Vol. 1: Foundations. MIT Press.

Ruppenhofer, J., Ellsworth, M., Petruck, M. R. L., Johnson, C. R., Baker, C. F., and Scheffczyk, J. (2016). FrameNet II: Extended theory and practice..

Salton, G. (1971). The SMART Retrieval System: Experiments in Automatic Document Processing. Prentice Hall.

Schonfinkel¨ , M. (1924). Uber die<sup>¨</sup> Bausteine der mathematischen Logik. Mathematische Annalen 92, 305–316. English translation appears in From Frege to Godel: A Source Book in¨ Mathematical Logic, Harvard University Press, 1967.

Sampson, G. (1987). Alternative grammatical coding systems. Garside, R., Leech, G., and Sampson, G. (Eds.), The Computational Analysis of English, 165–183. Longman.

Ruppenhofer, J., Sporleder, C., Morante, R., Baker, C. F., and Palmer, M. (2010). Semeval-2010 task 10: Linking events and their participants in discourse. 5th International Work shop on Semantic Evaluation.

Sankoff, D. and Labov, W. (1979). On the uses of variable rules. Language in society 8(2-3), 189–222.

Schuster, M. and Nakajima, K. (2012). Japanese and korean voice search. ICASSP.

Sap, M., Card, D., Gabriel, S., Choi, Y., and Smith, N. A. (2019). The risk of racial bias in hate speech detection. ACL.

Schuster, M. and Paliwal, K. K. (1997). Bidirectional recurrent neural networks. IEEE Transactions on Signal Processing 45, 2673–2681.

Russell, J. A. (1980). A circumplex model of affect. Journal of personal ity and social psychology 39(6), 1161– 1178.

Sap, M., Prasettio, M. C., Holtzman, A., Rashkin, H., and Choi, Y. (2017). Connotation frames of power and agency in modern films. EMNLP.

Schutze¨ , H. (1992a). Context space. Goldman, R. (Ed.), AAAI Fall Symposium on Probabilistic Approaches to Natural Language.

Schutze¨ , H. (1992b). Dimensions of meaning. Proceedings of Supercomputing ’92. IEEE Press.

Russell, S. and Norvig, P. (2002). Ar tificial Intelligence: A Modern Ap proach (2nd Ed.). Prentice Hall.

Scha, R. and Polanyi, L. (1988). An augmented context free grammar for discourse. COLING.

Rutherford, A. and Xue, N. (2015). Improving the inference of implicit discourse relations via classifying ex plicit discourse connectives. NAACL HLT.

Schutze ¨ , H. (1997a). Ambiguity Resolution in Language Learning – Computational and Cognitive Models. CSLI, Stanford, CA.

Schank, R. C. (1972). Conceptual dependency: A theory of natural language processing. Cognitive Psychology 3, 552–631.

Schutze¨ , H. (1997b). Ambiguity Resolution in Language Learning: Computational and Cognitive Models. CSLI Publications, Stanford, CA.

Sacks, H., Schegloff, E. A., and Jeffer son, G. (1974). A simplest systematics for the organization of turn-taking fo conversation. Language 50(4), 696– 735.

Schank, R. C. and Abelson, R. P. (1975). Scripts, plans, and knowledge. Proceedings of IJCAI-75.

Schutze¨ , H. (1998). Automatic word sense discrimination. Computationa Linguistics 24(1), 97–124.

Schank, R. C. and Abelson, R. P. (1977). Scripts, Plans, Goals and Understanding. Lawrence Erlbaum.

Sag, I. A. and Liberman, M. Y. (1975). The intonational disambiguation of in direct speech acts. CLS-75, 487–498. University of Chicago.

Schegloff, E. A. (1968). Sequencing in conversational openings. American Anthropologist 70, 1075–1095.

Schutze ¨ , H., Hull, D. A., and Pedersen, J. (1995). A comparison of classifiers and document representations for the routing problem. SIGIR-95.

Sag, I. A., Wasow, T., and Bender, E. M. (Eds.). (2003). Syntactic Theory: A Formal Introduction. CSLI Publications, Stanford, CA.

Scherer, K. R. (2000). Psychological models of emotion. Borod, J. C. (Ed.), The neuropsychology of emotion, 137–162. Oxford.

Schutze¨ , H. and Pedersen, J. (1993). A vector model for syntagmatic and paradigmatic relatedness. 9th Annual Conference of the UW Centre for the New OED and Text Research.

Schutze¨ , H. and Singer, Y. (1994). Part-of-speech tagging using a variable memory Markov model. ACL.

Sgall, P., Hajicovˇ a, E., and Panevova, J.´ (1986). The Meaning of the Sentence in its Pragmatic Aspects. Reidel.

for understanding English sentences. Schank, R. C. and Colby, K. M. (Eds.), Computer Models of Thought and Language, 61–113. W.H. Freeman and Co.

Schwartz, H. A., Eichstaedt, J. C., Kern, M. L., Dziurzynski, L., Ramones, S. M., Agrawal, M., Shah, A., Kosinski, M., Stillwell, D., Seligman, M. E. P., and Ungar, L. H. (2013). Personality, gender, and age in the language of social media: The open vocabulary approach. PloS one 8(9), e73791.

Shang, L., Lu, Z., and Li, H. (2015). Neural responding machine for shorttext conversation. ACL.

Shannon, C. E. (1948). A mathematical theory of communication. Bell System Technical Journal 27(3), 379– 423. Continued in the following volume.

Simmons, R. F., Klein, S., and Mc-Conlogue, K. (1964). Indexing and dependency logic for answering English questions. American Documentation 15(3), 196–204.

Schwenk, H. (2007). Continuous space language models. Computer Speech & Language 21(3), 492–518.

Shannon, C. E. (1951). Prediction and entropy of printed English. Bell System Technical Journal 30, 50–64.

Simons, G. F. and Fennig, C. D. (2018). Ethnologue: Languages of the world, 21st edition. SIL International.

Schwenk, H. (2018). Filtering and min ing parallel data in a joint multilingual space. ACL.

Sheil, B. A. (1976). Observations on context free parsing. SMIL: Statistical Methods in Linguistics 1, 71–109.

Singh, S. P., Litman, D. J., Kearns, M., and Walker, M. A. (2002). Optimizing dialogue management with reinforcement learning: Experiments with the NJFun system. JAIR 16, 105–133.

Seaghdha´ , D. O. (2010). Latent variable models of selectional preference. ACL.

Sleator, D. and Temperley, D. (1993). Parsing English with a link grammar. IWPT-93.

Shen, J., Pang, R., Weiss, R. J., Schuster, M., Jaitly, N., Yang, Z., Chen, Z., Zhang, Y., Wang, Y., Skerry-Ryan, R., Saurous, R. A., Agiomyrgiannakis, Y., and Wu, Y. (2018). Natural TTS synthesis by conditioning WaveNet on mel spectrogram predictions. ICASSP.

Seddah, D., Tsarfaty, R., Kubler, S.,¨ Candito, M., Choi, J. D., Farkas, R., Foster, J., Goenaga, I., Gojenola, K., Goldberg, Y., Green, S., Habash, N., Kuhlmann, M., Maier, W., Nivre, J., Przepiorkowski, A., Roth, R., Seeker,´ W., Versley, Y., Vincze, V., Wolinski,´ M., Wroblewska, A., and Villemonte´ de la Clergerie, E. (2013). Overview´ of the SPMRL 2013 shared task: cross-framework evaluation of parsing morphologically rich languages. 4th Workshop on Statistical Parsing of Morphologically-Rich Languages.

Sheng, E., Chang, K.-W., Natarajan, P., and Peng, N. (2019). The woman worked as a babysitter: On biases in language generation. EMNLP.

See, A., Roller, S., Kiela, D., and Weston, J. (2019). What makes a good conversation? how controllable attributes affect human judgments. NAACL HLT.

Slobin, D. I. (1996). Two ways to travel. Shibatani, M. and Thompson, S. A. (Eds.), Grammatical Constructions: Their Form and Meaning, 195– 220. Clarendon Press.

Shi, P. and Lin, J. (2019). Simple BERT models for relation extraction and semantic role labeling. arXiv preprint arXiv:1904.05255.

Small, S. L. and Rieger, C. (1982). Parsing and comprehending with Word Experts. Lehnert, W. G. and Ringle, M. H. (Eds.), Strategies for Natural Language Processing, 89– 147. Lawrence Erlbaum.

Shoup, J. E. (1980). Phonological aspects of speech recognition. Lea, W. A. (Ed.), Trends in Speech Recognition, 125–138. Prentice Hall.

Sekine, S. and Collins, M. (1997). The evalb software. http://cs. nyu.edu/cs/projects/proteus/ evalb.

Smith, V. L. and Clark, H. H. (1993). On the course of answering questions. Journal of Memory and Language 32, 25–38.

Shriberg, E., Bates, R., Taylor, P., Stolcke, A., Jurafsky, D., Ries, K., Coccaro, N., Martin, R., Meteer, M., and Van Ess-Dykema, C. (1998). Can prosody aid the automatic classification of dialog acts in conversational speech?. Language and Speech (Special Issue on Prosody and Conversation) 41(3-4), 439–487.

Smolensky, P. (1988). On the proper treatment of connectionism. Behavioral and brain sciences 11(1), 1–23.

Smolensky, P. (1990). Tensor product variable binding and the representation of symbolic structures in connectionist systems. Artificial intelligence 46(1-2), 159–216.

Sellam, T., Das, D., and Parikh, A. (2020). BLEURT: Learning robust metrics for text generation. ACL.

Seneff, S. and Zue, V. W. (1988). Transcription and alignment of the TIMIT database. Proceedings of the Second Symposium on Advanced Man-Machine Interface through Spoken Language.

Sidner, C. L. (1979). Towards a computational theory of definite anaphora comprehension in English discourse. Tech. rep. 537, MIT Artificial Intelligence Laboratory, Cambridge, MA.

Snover, M., Dorr, B., Schwartz, R., Micciulla, L., and Makhoul, J. (2006). A study of translation edit rate with targeted human annotation. AMTA-2006.

Sidner, C. L. (1983). Focusing in the comprehension of definite anaphora. Brady, M. and Berwick, R. C. (Eds.), Computational Models of Discourse, 267–330. MIT Press.

Sennrich, R., Haddow, B., and Birch, A. (2016). Neural machine translation of rare words with subword units. ACL.

Snow, R., Jurafsky, D., and Ng, A. Y. (2005). Learning syntactic patterns for automatic hypernym discovery. NeurIPS.

Snow, R., Prakash, S., Jurafsky, D., and Ng, A. Y. (2007). Learning to merge word senses. EMNLP/CoNLL.

Seo, M., Kembhavi, A., Farhadi, A., and Hajishirzi, H. (2017). Bidirectional attention flow for machine com prehension. ICLR.

Silverman, K., Beckman, M. E., Pitrelli, J. F., Ostendorf, M., Wightman, C. W., Price, P. J., Pierrehumbert, J. B., and Hirschberg, J. (1992). ToBI: A standard for labelling English prosody. ICSLP.

Snyder, B. and Palmer, M. (2004). The English all-words task. SENSEVAL-3.

Serban, I. V., Lowe, R., Henderson, P., Charlin, L., and Pineau, J. (2018). A survey of available corpora for building data-driven dialogue systems: The journal version. Dialogue & Discourse 9(1), 1–49.

Soderland, S., Fisher, D., Aseltine, J., and Lehnert, W. G. (1995). CRYS-TAL: Inducing a conceptual dictionary. IJCAI-95.

Simmons, R. F. (1965). Answering English questions by computer: A survey. CACM 8(1), 53–70.

Simmons, R. F. (1973). Semantic networks: Their computation and use

Søgaard, A. (2010). Simple semisupervised training of part-of-speech taggers. ACL.

Søgaard, A. and Goldberg, Y. (2016). Deep multi-task learning with low level tasks supervised at lower layers. ACL.

normalization challenge. http: //blog.kaggle.com/2018/02/07/ a-brief-summary-of-the-kaggle

Stevens, S. S. and Volkmann, J. (1940). The relation of pitch to frequency: A text-normalization-challenge/.revised scale. The American Journal of Psychology 53(3), 329–353.

Søgaard, A., Johannsen, A., Plank, B., Hovy, D., and Alonso, H. M. (2014). What’s in a p-value in NLP?. CoNLL.

Stevens, S. S., Volkmann, J., and Newman, E. B. (1937). A scale for the measurement of the psychological magnitude pitch. JASA 8, 185–190.

Solorio, T., Blair, E., Maharjan, S., Bethard, S., Diab, M., Ghoneim, M., Hawwari, A., AlGhamdi, F., Hirschberg, J., Chang, A., and Fung, P. (2014). Overview for the first shared task on language identification in code-switched data. First Work shop on Computational Approaches to Code Switching.

Srivastava, N., Hinton, G. E., Krizhevsky, A., Sutskever, I., and Salakhutdinov, R. R. (2014). Dropout: a simple way to prevent neural networks from overfitting. JMLR 15(1), 1929–1958.

Stab, C. and Gurevych, I. (2014a). Annotating argument components and relations in persuasive essays. COLING.

Stifelman, L. J., Arons, B., Schmandt, C., and Hulteen, E. A. (1993). VoiceNotes: A speech interface for a hand-held voice notetaker. INTERCHI 1993.

Stab, C. and Gurevych, I. (2014b). Identifying argumentative discourse structures in persuasive essays. EMNLP.

Somasundaran, S., Burstein, J., and Chodorow, M. (2014). Lexical chaining for measuring discourse coherence quality in test-taker essays. COLING.

Stolcke, A. (1998). Entropy-based pruning of backoff language models. Proc. DARPA Broadcast News Transcription and Understanding Workshop.

Stab, C. and Gurevych, I. (2017). Parsing argumentation structures in persuasive essays. Computational Linguistics 43(3), 619–659.

Stolcke, A. (2002). SRILM – an extensible language modeling toolkit. IC-SLP.

Soon, W. M., Ng, H. T., and Lim, D. C. Y. (2001). A machine learning approach to coreference resolution of noun phrases. Computational Linguis tics 27(4), 521–544.

Sordoni, A., Galley, M., Auli, M., Brockett, C., Ji, Y., Mitchell, M., Nie, J.-Y., Gao, J., and Dolan, B. (2015). A neural network approach to contextsensitive generation of conversational responses. NAACL HLT.

Stalnaker, R. C. (1978). Assertion. Cole, P. (Ed.), Pragmatics: Syntax and Semantics Volume 9, 315–332. Academic Press.

Soricut, R. and Marcu, D. (2003). Sentence level discourse parsing using syntactic and lexical information. HLT-NAACL.

Stamatatos, E. (2009). A survey of modern authorship attribution methods. JASIST 60(3), 538–556.

Soricut, R. and Marcu, D. (2006). Discourse generation using utility-trained coherence models. COLING/ACL.

Stolcke, A., Ries, K., Coccaro, N., Shriberg, E., Bates, R., Jurafsky, D., Taylor, P., Martin, R., Meteer, M., and Van Ess-Dykema, C. (2000). Dialogue act modeling for automatic tagging and recognition of conversational speech. Computational Linguistics 26(3), 339–371.

Stanovsky, G., Smith, N. A., and Zettlemoyer, L. (2019). Evaluating gender bias in machine translation. ACL.

Sorokin, D. and Gurevych, I. (2018). Mixing context granularities for im proved entity linking on question answering data across entity categories. \*SEM.

Stede, M. (2011). Discourse processing. Morgan & Claypool.

Stede, M. and Schneider, J. (2018). Argumentation Mining. Morgan & Claypool.

Stolz, W. S., Tannenbaum, P. H., and Carstensen, F. V. (1965). A stochastic approach to the grammatical coding of English. CACM 8(6), 399–405.

Steedman, M. (1989). Constituency and coordination in a combinatory grammar. Baltin, M. R. and Kroch, A. S. (Eds.), Alternative Conceptions of Phrase Structure, 201–231. University of Chicago.

Stone, P., Dunphry, D., Smith, M., and Ogilvie, D. (1966). The General Inquirer: A Computer Approach to Content Analysis. MIT Press.

Sparck Jones, K. (1972). A statistical interpretation of term specificity and its application in retrieval. Journal of Documentation 28(1), 11–21.

Stoyanchev, S. and Johnston, M. (2015). Localized error detection for targeted clarification in a virtual assistant. ICASSP.

Steedman, M. (1996). Surface Structure and Interpretation. MIT Press. Linguistic Inquiry Monograph, 30.

Stoyanchev, S., Liu, A., and Hirschberg, J. (2013). Modelling human clarification strategies. SIGDIAL.

Steedman, M. (2000). The Syntactic Process. The MIT Press.

Sparck Jones, K. (1986). Synonymy and Semantic Classification. Edinburgh University Press, Edinburgh. Republication of 1964 PhD Thesis.

Stoyanchev, S., Liu, A., and Hirschberg, J. (2014). Towards natural clarification questions in dialogue systems. AISB symposium on questions, discourse and dialogue.

Stern, M., Andreas, J., and Klein, D. (2017). A minimal span-based neural constituency parser. ACL.

Sporleder, C. and Lascarides, A. (2005). Exploiting linguistic cues to classify rhetorical relations. RANLP-05.

Strotgen¨ , J. and Gertz, M. (2013). Multilingual and cross-domain temporal tagging. Language Resources and Evaluation 47(2), 269–298.

Stevens, K. N. (1998). Acoustic Phonetics. MIT Press.

Strube, M. and Hahn, U. (1996). Functional centering. ACL.

Sporleder, C. and Lapata, M. (2005). Discourse chunking and its appli cation to sentence compression. EMNLP.

Stevens, K. N. and House, A. S. (1955). Development of a quantitative description of vowel articulation. JASA 27, 484–493.

Su, Y., Sun, H., Sadler, B., Srivatsa, M., Gur, I., Yan, Z., and Yan, X.¨ (2016). On generating characteristicrich question sets for QA evaluation. EMNLP.

Sproat, R., Black, A. W., Chen, S. F., Kumar, S., Ostendorf, M., and Richards, C. (2001). Normalization of non-standard words. Computer Speech & Language 15(3), 287–333.

Stevens, K. N. and House, A. S. (1961). An acoustical theory of vowel production and some of its implications. Journal of Speech and Hearing Research 4, 303–320.

Subba, R. and Di Eugenio, B. (2009). An effective discourse parser that uses rich linguistic information. NAACL HLT.

Sproat, R. and Gorman, K. (2018). A brief summary of the Kaggle text

Stevens, K. N., Kasowski, S., and Fant, G. M. (1953). An electrical analog of the vocal tract. JASA 25(4), 734–742.

Suendermann, D., Evanini, K., Liscombe, J., Hunter, P., Dayanidhi, K.,

and Pieraccini, R. (2009). From rulebased to statistical grammars: Contin uous improvement of large-scale spoken dialog systems. ICASSP.

Sundheim, B. (Ed.). (1991). Proceedings of MUC-3.

forms. Shopen, T. (Ed.), Language Typology and Syntactic Description, Volume 3. Cambridge University Press. Originally appeared as UC Berkeley Cognitive Science Program Report No. 30, 1980.

Tomkins, S. S. (1962). Affect, imagery, consciousness: Vol. I. The positive affects. Springer.

Sundheim, B. (Ed.). (1992). Proceedings of MUC-4.

Talmy, L. (1991). Path to realization: A typology of event conflation. BLS-91.

Toutanova, K., Klein, D., Manning, C. D., and Singer, Y. (2003). Featurerich part-of-speech tagging with a cyclic dependency network. HLT-NAACL.

Sundheim, B. (Ed.). (1993). Proceedings of MUC-5, Baltimore, MD.

Sundheim, B. (Ed.). (1995). Proceed ings of MUC-6.

Tan, C., Niculae, V., Danescu-Niculescu-Mizil, C., and Lee, L. (2016). Winning arguments: Interaction dynamics and persuasion strategies in good-faith online discussions. WWW-16.

Trichelair, P., Emami, A., Cheung, J. C. K., Trischler, A., Suleman, K., and Diaz, F. (2018). On the evaluation of common-sense reasoning in natural language understanding. NeurIPS 2018 Workshop on Critiquing and Correcting Trends in Machine Learning.

Surdeanu, M. (2013). Overview of the TAC2013 Knowledge Base Population evaluation: English slot filling and temporal slot filling. TAC-13.

Surdeanu, M., Harabagiu, S., Williams, J., and Aarseth, P. (2003). Using predicate-argument structures for information extraction. ACL.

Tannen, D. (1979). What’s in a frame? Surface evidence for underlying expectations. Freedle, R. (Ed.), New Directions in Discourse Processing, 137–181. Ablex.

Taylor, P. (2009). Text-to-Speech Synthesis. Cambridge University Press.

Trnka, K., Yarrington, D., McCaw, J., McCoy, K. F., and Pennington, C. (2007). The effects of word prediction on communication rate for AAC. NAACL-HLT.

Surdeanu, M., Hicks, T., and Valenzuela-Escarcega, M. A. (2015). Two practical rhetorical structure theory parsers. NAACL HLT.

ter Meulen, A. (1995). Representing Time in Natural Language. MIT Press.

Surdeanu, M., Johansson, R., Meyers, A., Marquez, L., and Nivre, J. (2008).\` The conll-2008 shared task on joint parsing of syntactic and semantic dependencies. CoNLL.

Tsvetkov, Y., Schneider, N., Hovy, D., Bhatia, A., Faruqui, M., and Dyer, C. (2014). Augmenting English adjective senses with supersenses. LREC.

Sutskever, I., Vinyals, O., and Le, Q. V. (2014). Sequence to sequence learning with neural networks. NeurIPS.

Teranishi, R. and Umeda, N. (1968). Use of pronouncing dictionary in speech synthesis experiments. 6th International Congress on Acoustics.

Sweet, H. (1877). A Handbook of Phonetics. Clarendon Press.

Tesniere\` , L. (1959). El<sup>´</sup> ements de Syn-´ taxe Structurale. Librairie C. Klincksieck, Paris.

Swerts, M., Litman, D. J., and Hirschberg, J. (2000). Corrections in spoken dialogue systems. ICSLP.

Tur, G. and De Mori, R. (2011). Spoken language understanding: Systems for extracting semantic information from speech. John Wiley & Sons.

Swier, R. and Stevenson, S. (2004). Unsupervised semantic role labelling. EMNLP.

Tetreault, J. R. (2001). A corpus-based evaluation of centering and pronoun resolution. Computational Linguistics 27(4), 507–520.

Teufel, S., Carletta, J., and Moens, M. (1999). An annotation scheme for discourse-level argumentation in research articles. EACL.

Turian, J. P., Shen, L., and Melamed, I. D. (2003). Evaluation of machine translation and its evaluation. Proceedings of MT Summit IX.

Teufel, S., Siddharthan, A., and Batchelor, C. (2009). Towards domainindependent argumentative zoning: Evidence from chemistry and computational linguistics. EMNLP.

Turian, J., Ratinov, L., and Bengio, Y. (2010). Word representations: a simple and general method for semisupervised learning. ACL.

Switzer, P. (1965). Vector images in document retrieval. Stevens, M. E., Giuliano, V. E., and Heilprin, L. B. (Eds.), Statistical Association Methods For Mechanized Documentation. Symposium Proceedings. Washington, D.C., USA, March 17, 1964. https://nvlpubs. nist.gov/nistpubs/Legacy/MP/ nbsmiscellaneouspub269.pdf.

Turney, P. D. (2002). Thumbs up or thumbs down? Semantic orientation applied to unsupervised classification of reviews. ACL.

Thede, S. M. and Harper, M. P. (1999). A second-order hidden Markov model for part-of-speech tagging. ACL.

Thompson, B. and Koehn, P. (2019). Vecalign: Improved sentence alignment in linear time and space. EMNLP.

Turney, P. D. and Littman, M. (2003). Measuring praise and criticism: Inference of semantic orientation from association. ACM Transactions on Information Systems (TOIS) 21, 315–346.

Turney, P. D. and Littman, M. L. (2005). Corpus-based learning of analogies and semantic relations. Machine Learning 60(1-3), 251–278.

Syrdal, A. K., Wightman, C. W., Conkie, A., Stylianou, Y., Beutnagel, M., Schroeter, J., Strom, V., and Lee, K.-S. (2000). Corpus-based techniques in the AT&T NEXTGEN synthesis system. ICSLP.

Thompson, K. (1968). Regular expression search algorithm. CACM 11(6), 419–422.

Umeda, N. (1976). Linguistic rules for text-to-speech synthesis. Proceedings of the IEEE 64(4), 443–451.

Umeda, N., Matui, E., Suzuki, T., and Omura, H. (1968). Synthesis of fairy tale using an analog vocal tract. 6th International Congress on Acoustics.

Talbot, D. and Osborne, M. (2007). Smoothed Bloom Filter Language Models: Tera-Scale LMs on the Cheap. EMNLP/CoNLL.

Tibshirani, R. J. (1996). Regression shrinkage and selection via the lasso. Journal of the Royal Statistical Society. Series B (Methodological) 58(1), 267–288.

Talmor, A. and Berant, J. (2018). The web as a knowledge-base for answering complex questions. NAACL HLT.

Titov, I. and Khoddam, E. (2014). Unsupervised induction of semantic roles within a reconstruction-error minimization framework. NAACL HLT.

Uryupina, O., Artstein, R., Bristot, A., Cavicchio, F., Delogu, F., Rodriguez, K. J., and Poesio, M. (2020). Annotating a broad range of anaphoric phenomena, in a variety of genres: The ARRAU corpus. Natural Language Engineering 26(1), 1–34.

Talmy, L. (1985). Lexicalization patterns: Semantic structure in lexical

Titov, I. and Klementiev, A. (2012). A Bayesian approach to unsupervised semantic role induction. EACL.

UzZaman, N., Llorens, H., Derczynski, L., Allen, J., Verhagen, M., and

Pustejovsky, J. (2013). SemEval-2013 task 1: TempEval-3: Evaluating time expressions, events, and temporal relations. SemEval-13.

van Benthem, J. and ter Meulen, A. (Eds.). (1997). Handbook of Logic and Language. MIT Press.

Vieira, R. and Poesio, M. (2000). An empirically based system for processing definite descriptions. Computational Linguistics 26(4), 539–593.

Walker, M. A., Kamm, C. A., and Litman, D. J. (2001). Towards developing general models of usability with PAR-ADISE. Natural Language Engineering: Special Issue on Best Practice in Spoken Dialogue Systems 6(3), 363– 377.

van Deemter, K. and Kibble, R. (2000). On coreferring: coreference in MUC and related annotation schemes. Computational Linguistics 26(4), 629–637.

Vijayakumar, A. K., Cogswell, M., Selvaraju, R. R., Sun, Q., Lee, S., Crandall, D., and Batra, D. (2018). Diverse beam search: Decoding diverse solutions from neural sequence models. AAAI.

Walker, M. A. and Whittaker, S. (1990). Mixed initiative in dialogue: An investigation into discourse segmentation. ACL.

Vilain, M., Burger, J. D., Aberdeen, J., Connolly, D., and Hirschman, L. (1995). A model-theoretic coreference scoring scheme. MUC-6.

van den Oord, A., Dieleman, S., Zen, H., Simonyan, K., Vinyals, O., Graves, A., Kalchbrenner, N., Senior, A., and Kavukcuoglu, K. (2016). Wavenet: A generative model for raw audio. arXiv preprint arXiv:1609.03499.

Wang, A., Singh, A., Michael, J., Hill, F., Levy, O., and Bowman, S. R. (2018). Glue: A multi-task benchmark and analysis platform for natural language understanding. ICLR.

Vintsyuk, T. K. (1968). Speech discrimination by dynamic programming. Cybernetics 4(1), 52–57. Russian Kibernetika 4(1):81-88. 1968.

van der Maaten, L. and Hinton, G. E. (2008). Visualizing high-dimensional data using t-sne. JMLR 9, 2579–2605.

Wang, S. and Manning, C. D. (2012). Baselines and bigrams: Simple, good sentiment and topic classification. ACL.

Vinyals, O. and Le, Q. V. (2015). A neural conversational model. ICML Deep Learning Workshop.

van Esch, D. and Sproat, R. (2018). An expanded taxonomy of semiotic classes for text normalization. INTER-SPEECH.

Wang, W. and Chang, B. (2016). Graph-based dependency parsing with bidirectional lstm. ACL.

van Rijsbergen, C. J. (1975). Informa tion Retrieval. Butterworths.

Voorhees, E. M. and Harman, D. K. (2005). TREC: Experiment and Evaluation in Information Retrieval. MIT Press.

Van Valin, Jr., R. D. and La Polla, R. (1997). Syntax: Structure, Meaning, and Function. Cambridge University Press.

Wang, Y., Li, S., and Yang, J. (2018). Toward fast and accurate neural discourse segmentation. EMNLP.

Vaswani, A., Shazeer, N., Parmar, N., Uszkoreit, J., Jones, L., Gomez, A. N., Kaiser, Ł., and Polosukhin, I. (2017). Attention is all you need. NeurIPS.

Vauquois, B. (1968). A survey of formal grammars and algorithms for recognition and transformation in ma chine translation. IFIP Congress 1968.

Vossen, P., Gor¨ og, A., Laan, F.,¨ Van Gompel, M., Izquierdo, R., and Van Den Bosch, A. (2011). Dutchsemcor: building a semantically annotated corpus for dutch. Proceedings of eLex.

Velichko, V. M. and Zagoruyko, N. G. (1970). Automatic recognition of 200 words. International Journal of Man Machine Studies 2, 223–234.

Voutilainen, A. (1999). Handcrafted rules. van Halteren, H. (Ed.), Syntactic Wordclass Tagging, 217–246. Kluwer.

Wang, Y., Skerry-Ryan, R., Stanton, D., Wu, Y., Weiss, R. J., Jaitly, N., Yang, Z., Xiao, Y., Chen, Z., Bengio, S., Le, Q., Agiomyrgiannakis, Y., Clark, R., and Saurous, R. A. (2017). Tacotron: Towards end-to-end speech synthesis. INTERSPEECH.

Vrandeciˇ c´, D. and Krotzsch, M.¨ (2014). Wikidata: a free collaborative knowledge base. CACM 57(10), 78– 85.

Wade, E., Shriberg, E., and Price, P. J. (1992). User behaviors affecting speech recognition. ICSLP.

Ward, W. and Issar, S. (1994). Recent improvements in the CMU spoken language understanding system. ARPA Human Language Technologies Workshop.

Wagner, R. A. and Fischer, M. J. (1974). The string-to-string correction problem. Journal of the ACM 21, 168– 173.

Velikovich, L., Blair-Goldensohn, S., Hannan, K., and McDonald, R. (2010). The viability of web-derived polarity lexicons. NAACL HLT.

Watanabe, S., Hori, T., Karita, S., Hayashi, T., Nishitoba, J., Unno, Y., Soplin, N. E. Y., Heymann, J., Wiesner, M., Chen, N., Renduchintala, A., and Ochiai, T. (2018). ESPnet: Endto-end speech processing toolkit. IN-TERSPEECH.

Waibel, A., Hanazawa, T., Hinton, G., Shikano, K., and Lang, K. J. (1989). Phoneme recognition using time-delay neural networks. IEEE transactions on Acoustics, Speech, and Signal Processing 37(3), 328–339.

Vendler, Z. (1967). Linguistics in Phi losophy. Cornell University Press.

Weaver, W. (1949/1955). Translation. Locke, W. N. and Boothe, A. D. (Eds.), Machine Translation of Languages, 15–23. MIT Press. Reprinted from a memorandum written by Weaver in 1949.

Verhagen, M., Gaizauskas, R., Schilder, F., Hepple, M., Moszkowicz, J., and Pustejovsky, J. (2009). The TempEval challenge: Identifying temporal relations in text. Language Resources and Evaluation 43(2), 161– 179.

Walker, M. A. (2000). An application of reinforcement learning to dialogue strategy selection in a spoken dialogue system for email. JAIR 12, 387–416.

Webber, B. L. (1978). A Formal Approach to Discourse Anaphora. Ph.D. thesis, Harvard University.

Walker, M. A., Fromer, J. C., and Narayanan, S. S. (1998). Learning optimal dialogue strategies: A case study of a spoken dialogue agent for email. COLING/ACL.

Webber, B. L. (1983). So what can we talk about now?. Brady, M. and Berwick, R. C. (Eds.), Computational Models of Discourse, 331–371. The MIT Press.

Verhagen, M., Mani, I., Sauri, R., Knippen, R., Jang, S. B., Littman, J., Rumshisky, A., Phillips, J., and Puste jovsky, J. (2005). Automating tempo ral annotation with TARSQI. ACL.

Walker, M. A., Iida, M., and Cote, S. (1994). Japanese discourse and the process of centering. Computational Linguistics 20(2), 193–232.

Webber, B. L. (1991). Structure and ostension in the interpretation of discourse deixis. Language and Cognitive Processes 6(2), 107–135.

Versley, Y. (2008). Vagueness and ref erential ambiguity in a large-scale an notated corpus. Research on Language and Computation 6(3-4), 333–353.

Walker, M. A., Joshi, A. K., and Prince, E. (Eds.). (1998). Centering in Discourse. Oxford University Press.

Webber, B. L. and Baldwin, B. (1992). Accommodating context change. ACL.

Webber, B. L., Egg, M., and Kordoni, V. (2012). Discourse structure and language technology. Natural Language Engineering 18(4), 437–490.

Wiebe, J. (1994). Tracking point of view in narrative. Computational Linguistics 20(2), 233–287.

Webber, B. L. (1988). Discourse deixis: Reference to discourse segments. ACL.

Wiebe, J. (2000). Learning subjective adjectives from corpora. AAAI.

Witten, I. H. and Bell, T. C. (1991). The zero-frequency problem: Estimating the probabilities of novel events in adaptive text compression. IEEE Transactions on Information Theory 37(4), 1085–1094.

Webster, K., Recasens, M., Axelrod, V., and Baldridge, J. (2018). Mind the gap: A balanced corpus of gendered ambiguous pronouns. TACL 6, 605– 617.

Wiebe, J., Bruce, R. F., and O’Hara, T. P. (1999). Development and use of a gold-standard data set for subjectivity classifications. ACL.

Witten, I. H. and Frank, E. (2005). Data Mining: Practical Machine Learning Tools and Techniques (2nd Ed.). Morgan Kaufmann.

Wierzbicka, A. (1992). Semantics, Culture, and Cognition: University Human Concepts in Culture-Specific Configurations. Oxford University Press.

Wittgenstein, L. (1953). Philosophical Investigations. (Translated by Anscombe, G.E.M.). Blackwell.

Weinschenk, S. and Barker, D. T. (2000). Designing Effective Speech Interfaces. Wiley.

Wierzbicka, A. (1996). Semantics: Primes and Universals. Oxford Uni versity Press.

Wolf, F. and Gibson, E. (2005). Representing discourse coherence: A corpus-based analysis. Computational Linguistics 31(2), 249–287.

Weischedel, R., Hovy, E. H., Marcus, M. P., Palmer, M., Belvin, R., Pradhan, S., Ramshaw, L. A., and Xue, N. (2011). Ontonotes: A large training corpus for enhanced processing. Olive, J., Christianson, C., and Mc-Cary, J. (Eds.), Handbook of Natural Language Processing and Machine Translation: DARPA Global Automatic Language Exploitation, 54– 63. Springer.

Wilensky, R. (1983). Planning and Understanding: A Computational Approach to Human Reasoning. Addison-Wesley.

Wolf, M. J., Miller, K. W., and Grodzinsky, F. S. (2017). Why we should have seen that coming: Comments on Microsoft’s Tay “experiment,” and wider implications. The ORBIT Journal 1(2), 1–12.

Weischedel, R., Meteer, M., Schwartz, R., Ramshaw, L. A., and Palmucci, J. (1993). Coping with ambiguity and unknown words through probabilistic models. Computational Linguistics 19(2), 359–382.

Wilks, Y. (1973). An artificial intelligence approach to machine translation. Schank, R. C. and Colby, K. M. (Eds.), Computer Models of Thought and Language, 114–151. W.H. Freeman.

Weizenbaum, J. (1966). ELIZA – A computer program for the study of natural language communication between man and machine. CACM 9(1), 36–45.

Wilks, Y. (1975a). An intelligent analyzer and understander of English. CACM 18(5), 264–274.

Weizenbaum, J. (1976). Computer Power and Human Reason: From Judgement to Calculation. W.H. Free man and Company.

Wolfson, T., Geva, M., Gupta, A., Gardner, M., Goldberg, Y., Deutch, D., and Berant, J. (2020). Break it down: A question understanding benchmark. TACL 8, 183–198.

Wilks, Y. (1975b). Preference semantics. Keenan, E. L. (Ed.), The Formal Semantics of Natural Language, 329– 350. Cambridge Univ. Press.

Woods, W. A. (1967). Semantics for a Question-Answering System. Ph.D. thesis, Harvard University.

Wilks, Y. (1975c). A preferential, pattern-seeking, semantics for natural language inference. Artificial Intelligence 6(1), 53–74.

Wells, J. C. (1982). Accents of English. Cambridge University Press.

Woods, W. A. (1973). Progress in natural language understanding. Proceedings of AFIPS National Conference.

Williams, J. D., Raux, A., and Henderson, M. (2016). The dialog state tracking challenge series: A review. Dialogue & Discourse 7(3), 4–33.

Woods, W. A. (1975). What’s in a link: Foundations for semantic networks. Bobrow, D. G. and Collins, A. M. (Eds.), Representation and Understanding: Studies in Cognitive Science, 35–82. Academic Press.

Wen, T.-H., Gasiˇ c, M., Kim, D.,´ Mrksiˇ c, N., Su, P.-H., Vandyke, D.,´ and Young, S. J. (2015a). Stochastic language generation in dialogue using recurrent neural networks with convo lutional sentence reranking. SIGDIAL.

Williams, J. D. and Young, S. J. (2007). Partially observable markov decision processes for spoken dialog systems. Computer Speech and Language 21(1), 393–422.

Woods, W. A. (1978). Semantics and quantification in natural language question answering. Yovits, M. (Ed.), Advances in Computers, 2–64. Academic.

Woods, W. A., Kaplan, R. M., and Nash-Webber, B. L. (1972). The lunar sciences natural language information system: Final report. Tech. rep. 2378, BBN.

Wen, T.-H., Gasiˇ c, M., Mrk ´ siˇ c, N.,´ Su, P.-H., Vandyke, D., and Young, S. J. (2015b). Semantically conditioned LSTM-based natural language generation for spoken dialogue systems. EMNLP.

Wilson, T., Wiebe, J., and Hoffmann, P. (2005). Recognizing contextual polarity in phrase-level sentiment analysis. EMNLP.

Winograd, T. (1972). Understanding Natural Language. Academic Press.

Woodsend, K. and Lapata, M. (2015). Distributed representations for unsupervised semantic role labeling. EMNLP.

Werbos, P. (1974). Beyond regression: new tools for prediction and analysis in the behavioral sciences. Ph.D. the sis, Harvard University.

Winston, P. H. (1977). Artificial Intelligence. Addison Wesley.

Wu, D. (1996). A polynomial-time algorithm for statistical machine translation. ACL.

Wiseman, S., Rush, A. M., and Shieber, S. M. (2016). Learning global features for coreference resolution. NAACL HLT.

Wu, F. and Weld, D. S. (2007). Autonomously semantifying Wikipedia. CIKM-07.

Werbos, P. J. (1990). Backpropagation through time: what it does and how to do it. Proceedings of the IEEE 78(10), 1550–1560.

Wu, F. and Weld, D. S. (2010). Open information extraction using Wikipedia. ACL.

Widrow, B. and Hoff, M. E. (1960). Adaptive switching circuits. IRE WESCON Convention Record, Vol. 4.

Wiseman, S., Rush, A. M., Shieber, S. M., and Weston, J. (2015). Learning anaphoricity and antecedent ranking features for coreference resolution. ACL.

Wu, L., Petroni, F., Josifoski, M., Riedel, S., and Zettlemoyer, L. (2019). Zero-shot entity linking with dense

entity retrieval. arXiv preprint arXiv:1911.03814.

Wu, S. and Dredze, M. (2019). Beto, Bentz, Becas: The surprising cross-lingual effectiveness of BERT. EMNLP.

Zelle, J. M. and Mooney, R. J. (1996). Learning to parse database queries using inductive logic programming. AAAI.

Yang, X., Zhou, G., Su, J., and Tan, C. L. (2003). Coreference resolution using competition learning approach. ACL.

Wu, Y., Schuster, M., Chen, Z., Le, Q. V., Norouzi, M., Macherey, W., Krikun, M., Cao, Y., Gao, Q., Macherey, K., Klingner, J., Shah, A., Johnson, M., Liu, X., Kaiser, Ł., Gouws, S., Kato, Y., Kudo, T., Kazawa, H., Stevens, K., Kurian, G., Patil, N., Wang, W., Young, C., Smith, J., Riesa, J., Rudnick, A., Vinyals, O., Corrado, G. S., Hughes, M., and Dean, J. (2016). Google’s neural machine translation system: Bridging the gap between human and machine translation. arXiv preprint arXiv:1609.08144.

Zeman, D. (2008). Reusable tagset conversion using tagset drivers. LREC.

Yang, Y. and Pedersen, J. (1997). A comparative study on feature selection in text categorization. ICML.

Wundt, W. (1900). Volkerpsychologie:¨ eine Untersuchung der Entwicklungsgesetze von Sprache, Mythus, und Sitte. W. Engelmann, Leipzig. Band II: Die Sprache, Zweiter Teil.

Xia, F. and Palmer, M. (2001). Convert ing dependency structures to phrase structures. HLT.

Xu, J., Ju, D., Li, M., Boureau, Y.-L., Weston, J., and Dinan, E. (2020). Recipes for safety in open domain chatbots. arXiv preprint arXiv:2010.07079.

Yang, Z., Qi, P., Zhang, S., Bengio, Y., Cohen, W., Salakhutdinov, R., and Manning, C. D. (2018). HotpotQA: A dataset for diverse, explainable multihop question answering. EMNLP.

Xu, P., Saghir, H., Kang, J. S., Long, T., Bose, A. J., Cao, Y., and Cheung, J. C. K. (2019). A cross-domain trans ferable neural coherence model. ACL.

Xu, Y. (2005). Speech melody as articulatorily implemented communicative functions. Speech communication 46(3-4), 220–251.

Yankelovich, N., Levow, G.-A., and Marx, M. (1995). Designing SpeechActs: Issues in speech user interfaces. CHI-95.

Yarowsky, D. (1995). Unsupervised word sense disambiguation rivaling supervised methods. ACL.

Yasseri, T., Kornai, A., and Kertesz, J.´ (2012). A practical approach to language complexity: a Wikipedia case study. PloS one 7(11).

Yih, W.-t., Richardson, M., Meek, C., Chang, M.-W., and Suh, J. (2016). The value of semantic parse labeling for knowledge base question answering. ACL.

Xue, N., Ng, H. T., Pradhan, S., Rutherford, A., Webber, B. L., Wang, C., and Wang, H. (2016). Conll 2016 shared task on multilingual shallow discourse parsing. CoNLL-16 shared task.

Yngve, V. H. (1955). Syntax and the problem of multiple meaning. Locke, W. N. and Booth, A. D. (Eds.), Machine Translation of Languages, 208– 226. MIT Press.

Young, S. J., Gasiˇ c, M., Keizer, S.,´ Mairesse, F., Schatzmann, J., Thomson, B., and Yu, K. (2010). The Hidden Information State model: A practical framework for POMDP-based spoken dialogue management. Computer Speech & Language 24(2), 150– 174.

Zeman, D., Popel, M., Straka, M., Hajic, J., Nivre, J., Ginter, F., Luoto-ˇ lahti, J., Pyysalo, S., Petrov, S., Potthast, M., Tyers, F. M., Badmaeva, E., Gokirmak, M., Nedoluzhko, A., Cinkova, S., Hajic, Jr., J., Hlav´ acov´ a,´ J., Kettnerova, V., Uresov´ a, Z., Kan-´ erva, J., Ojala, S., Missila, A., Man-¨ ning, C. D., Schuster, S., Reddy, S., Taji, D., Habash, N., Leung, H., de Marneffe, M.-C., Sanguinetti, M., Simi, M., Kanayama, H., de Paiva, V., Droganova, K., Alonso, H. M., C¸ oltekin, C¸ ., Sulubacak, U., Uszkor-¨ eit, H., Macketanz, V., Burchardt, A., Harris, K., Marheinecke, K., Rehm, G., Kayadelen, T., Attia, M., El-Kahky, A., Yu, Z., Pitler, E., Lertpradit, S., Mandl, M., Kirchner, J., Alcalde, H. F., Strnadova, J., Baner-´ jee, E., Manurung, R., Stella, A., Shimada, A., Kwak, S., Mendonc¸a, G., Lando, T., Nitisaroj, R., and Li, J. (2017). Conll 2017 shared task: Multilingual parsing from raw text to universal dependencies. Proceedings of the CoNLL 2017 Shared Task: Multilingual Parsing from Raw Text to Universal Dependencies.

Younger, D. H. (1967). Recognition and parsing of context-free languages in time n<sup>3</sup>. Information and Control 10, 189–208.

Zens, R. and Ney, H. (2007). Efficient phrase-table representation for machine translation with applications to online MT and speech translation. NAACL-HLT.

Xue, N. and Palmer, M. (2004). Calibrating features for semantic role la beling. EMNLP.

Yu, M. and Dredze, M. (2014). Improving lexical embeddings with semantic knowledge. ACL.

Zhang, H., Sproat, R., Ng, A. H., Stahlberg, F., Peng, X., Gorman, K., and Roark, B. (2019). Neural models of text normalization for speech applications. Computational Linguistics 45(2), 293–337.

Zhang, R., dos Santos, C. N., Yasunaga, M., Xiang, B., and Radev, D. (2018). Neural coreference resolution with deep biaffine attention by joint mention detection and mention clustering. ACL.

Yamada, H. and Matsumoto, Y. (2003). Statistical dependency analysis with support vector machines. Noord, G. V. (Ed.), IWPT-03.

Yu, N., Zhang, M., and Fu, G. (2018). Transition-based neural RST parsing with implicit syntax features. COL-ING.

Zhang, T., Kishore, V., Wu, F., Weinberger, K. Q., and Artzi, Y. (2020). Bertscore: Evaluating text generation with BERT. ICLR 2020.

Yan, Z., Duan, N., Bao, J.-W., Chen, P., Zhou, M., Li, Z., and Zhou, J. (2016). DocChat: An information retrieval ap proach for chatbot engines using unstructured documents. ACL.

Yu, Y., Zhu, Y., Liu, Y., Liu, Y., Peng, S., Gong, M., and Zeldes, A. (2019). GumDrop at the DISRPT2019 shared task: A model stacking approach to discourse unit segmentation and connective detection. Workshop on Discourse Relation Parsing and Treebanking 2019.

Zhang, Y. and Clark, S. (2008). A tale of two parsers: investigating and combining graph-based and transition-based dependency parsing using beam-search. EMNLP.

Yang, D., Chen, J., Yang, Z., Jurafsky, D., and Hovy, E. H. (2019). Let’s make your request more persuasive: Modeling persuasive strategies via semi-supervised neural nets on crowdfunding platforms. NAACL HLT.

Zapirain, B., Agirre, E., Marquez, L.,\` and Surdeanu, M. (2013). Selectional preferences for semantic role classification. Computational Linguistics 39(3), 631–663.

Zhang, Y. and Nivre, J. (2011). Transition-based dependency parsing with rich non-local features. ACL.

Zhang, Y., Zhong, V., Chen, D., Angeli, G., and Manning, C. D. (2017). Position-aware attention and supervised data improve slot filling. EMNLP.

Zhao, H., Chen, W., Kit, C., and Zhou, G. (2009). Multilingual dependency learning: A huge feature engineering method to semantic dependency parsing. CoNLL.

Ziemski, M., Junczys-Dowmunt, M., and Pouliquen, B. (2016). The united nations parallel corpus v1.0. LREC.

Zhao, J., Wang, T., Yatskar, M., Cotterell, R., Ordonez, V., and Chang, K.- W. (2019). Gender bias in contextualized word embeddings. NAACL HLT.

Zue, V. W., Glass, J., Goodine, D., Leung, H., Phillips, M., Polifroni, J., and Seneff, S. (1989). Preliminary evaluation of the VOYAGER spoken language system. Proceedings DARPA Speech and Natural Language Workshop.

Zhao, J., Wang, T., Yatskar, M., Ordonez, V., and Chang, K.-W. (2017). Men also like shopping: Reducing gender bias amplification using corpus-level constraints. EMNLP.

Zhao, J., Wang, T., Yatskar, M., Or donez, V., and Chang, K.-W. (2018a). Gender bias in coreference resolution: Evaluation and debiasing methods. NAACL HLT.

Zhao, J., Zhou, Y., Li, Z., Wang, W., and Chang, K.-W. (2018b). Learning gender-neutral word embeddings. EMNLP.

Zheng, J., Vilnis, L., Singh, S., Choi, J. D., and McCallum, A. (2013). Dynamic knowledge-base alignment for coreference resolution. CoNLL.

Zhong, Z. and Ng, H. T. (2010). It makes sense: A wide-coverage word sense disambiguation system for free text. ACL.

Zhou, D., Bousquet, O., Lal, T. N., Weston, J., and Scholkopf, B. (2004).¨ Learning with local and global consistency. NeurIPS.

Zhou, G., Su, J., Zhang, J., and Zhang, M. (2005). Exploring various knowledge in relation extraction. ACL.

Zhou, J. and Xu, W. (2015a). End-toend learning of semantic role labeling using recurrent neural networks. ACL.

Zhou, J. and Xu, W. (2015b). End-toend learning of semantic role labeling using recurrent neural networks. ACL.

Zhou, L., Gao, J., Li, D., and Shum, H.- Y. (2020). The design and implementation of XiaoIce, an empathetic so cial chatbot. Computational Linguistics 46(1), 53–93.

Zhou, L., Ticrea, M., and Hovy, E. H. (2004). Multi-document biography summarization. EMNLP.

Zhou, Y. and Xue, N. (2015). The Chinese Discourse TreeBank: a Chinese corpus annotated with discourse relations. Language Resources and Evaluation 49(2), 397–431.

Zhu, X. and Ghahramani, Z. (2002). Learning from labeled and unlabeled data with label propagation. Tech. rep. CMU-CALD-02, CMU.

Zhu, X., Ghahramani, Z., and Lafferty, J. (2003). Semi-supervised learning using gaussian fields and harmonic functions. ICML.

## Subject Index

λ -reduction, 315

\*?, 7

+?, 7

adequacy, 221

adjacency pairs, 495

.wav format, 536

adjective, 240 of referring expressions, 417

part-of-speech, 151

10-fold cross-validation, 68 (derives), 233

adjective phrase, 240

ˆ, 57

\* (RE Kleene \*), 5

Adjectives, 150

\+ (RE Kleene +), 5

. (RE any character), 5

adjunction in TAG, 257

\$ (RE end-of-line), 5

( (RE precedence symbol), 6

American Structuralism, 256

adverb, 150 degree, 150 directional, 150 locative, 150 manner, 150 syntactic position of, 240 temporal, 150

[ (RE character disjunction), 4 amplitude of a signal, 534 RMS, 537

anaphor, 416

Adverbs, 150

anaphora, 416

\B (RE non word-boundary), 6 anaphoricity detector, 425

adversarial evaluation, 518

anchor texts, 478, 487

backward composition, 253

\b (RE word-boundary), 6

AED, 555

backward chaining, 317

affective, 393 anchors in regular expressions, 5, 26

antecedent, 416 backward-looking center, 452

] (RE character disjunction), 4

affix, 21

antonym, 358bag of words, 57, 58in IR, 465

ˆ (RE start-of-line), 5

affricate sound, 530

Backus-Naur Form, 233

AP, 240

agent, as thematic role, 374

bag-of-words, 57

Apple AIFF, 536

[ˆ] (single-char negation), 4

agglomerative clustering, 370

(there exists), 313

approximant sound, 530 bakeoff, 571 speech recognition competition, 571

approximate randomization, 70

agglutinative language, 207 <sub>∀</sub> (for all), 313

=<sub>⇒</sub> (implies), 316

AIFF file, 536

Arabic, 526 Egyptian, 544 barge-in, 520

AISHELL-1, 551

Aramaic, 526

λ -expressions, 315 baseline most frequent sense, 364 take the first sense, 364

ALGOL, 257

ARC, 489

λ -reduction, 315

<sub>∧</sub> (and), 313

arc eager, 294

basic emotions, 394

<sub>¬</sub> (not), 313 byte-pair encoding, 20 CKY, 261

backtrace in minimum edit distance, 26

arc standard, 287

batch training, 87

(or), 316

argumentation mining, 458

4-gram, 34

Kneser-Ney discounting, 45

argumentation schemes, 459

Bayes’ rule, 57 dropping denominator, 58, 158

Backpropagation Through Time, 178

4-tuple, 236

Backtranslation, 221

5-gram, 34

Lesk, 367

argumentative relations, 458

Bayesian inference, 57

minimum edit distance, 25

BDI, 524

argumentative zoning, 460

backprop, 139

A-D conversion, 535, 552

beam search, 215, 295

naive Bayes classifier, 56

Aristotle, 148, 322

AAC, 30

beam width, 215, 295

arity, 319

bear pitch accent, 532

pointwise mutual information, 109

AAL, 13

ARPA, 571

AB test, 569

ARPAbet, 546

Berkeley Restaurant Project, 33

semantic role labeling, 381

BabelNet, 368

abduction, 318

article (part-of-speech), 150 backoff in smoothing, 43

Bernoulli naive Bayes, 74 BERT for affect, 410

Simplified Lesk, 367

ABox, 323

articulatory phonetics, 527, 527

ABSITY, 371

TextTiling, 456

best-worst scaling, 398

absolute discounting, 45

bias amplification, 12

articulatory synthesis, 573 unsupervised word sense disambiguation, 369

absolute temporal expression, 344 aspect, 322

bias term, 78, 128

Viterbi, 159

bidirectional RNN, 185

ASR, 548 confidence, 515 abstract word, 397

alignment, 22, 558

bigram, 31

accented syllables, 532

bilabial, 529

association, 98

accessible, 420

minimum cost, 24

accessing a referent, 415

binary branching, 249

of transcript, 545

ATIS, 231 corpus, 234, 237

ATN, 391

string, 22

binary NB, 62

binary tree, 249

accomplishment expressions, 322

ATRANS, 389 via minimum edi distance, 24

BIO, 154

attachment ambiguity, 260

BIO tagging for NER, 154

all-words task in WSD, 363

accuracy, 152

achievement expressions, 322, 322

Allen relations, 349

Attribution (as coherence relation), 445

BIOES, 154

bitext, 219

allocational harm, 120 acknowledgment speech act, 494

augmentative communication, 30 bits for measuring entropy, 49

activation, 128 ambiguity amount of part-of-speech in Brown corpus, 152

activity expressions, 322, 322

authorship attribution, 55

blank in CTC, 558

autoregressive generation, 175, 181

BLEU, 222

acute-eval, 517

Bloom filters, 48

ad hoc retrieval, 465

attachment, 260

Auxiliary, 151

BM25, 466, 468

add gate, 188

coordination, 260

BNF (Backus-Naur Form), 233

add-k, 43

in meaning representations, 306

B<sup>3</sup>, 434

add-one smoothing, 41

Babbage, C., 549

bootstrap, 72

bootstrap algorithm, 72

bootstrap test, 70

bootstrapping, 70 in IE, 339

origin of term, 148

closed class, 149

content planning, 515

context embedding, 117

closed vocabulary, 40

bound pronoun, 418

treating low as zero, 165

boundary tones, 534

closure, stop, 529 context-free grammar, 231, 232, 236, 255

BPE, 18

cluster, 416

CRF, 162 compared to HMM, 162 inference, 166 Viterbi inference, 166 Viterbi inference, 166

Chomsky normal form, 249

BPE, 20

CREs

bracketed notation, 234

lustering in word sense disambiguation, 372 invention of, 257

CRFs learning, 167 non-terminal symbol, 233

CNF, see Chomsky normal form

cross-brackets, 270

broadcast news speech recognition of, 571

productions, 233

cross-entropy, 51

coarse senses, 372

rules, 233

cross-entropy loss, 82, 137

cochlea, 542

Brown corpus, 11 original tagging of, 170 terminal symbol, 233

Cocke-Kasami-Younger algorithm, see CKY cross-validation, 68 10-fold, 68

weak and strong equivalence, 249 byte-pair encoding, 18

coda, syllable, 531

crowdsourcing, 398

continuation rise, 534

CTC, 557

code switching, 13

conversation, 492

currying, 315

CALLHOME, 550

cycles in a wave, 534

conversation analysis, 523 coherence, 442 entity-based, 451 relations, 444

Candide, 228

conversational agents, 492

cycles per second, 534

canonical form, 307

conversational analysis, 495

Cantonese, 207

cohesion lexical, 443, 456 conversational implicature, 496

datasheet, 14

cardinal number, 239

cold languages, 208

conversational speech, 550

collection in IR, 465 cascade, 21 regular expression in Eliza, 10

fully qualified, 347 normalization, 507 convex, 84

collocation, 366

dative alternation, 376

combinatory categorial grammar, 250 coordinate noun phrase, 243

DBpedia, 482

coordination ambiguity, 260

debiasing, 122

sensitivity in regular expression search, 3 commissive speech act, 494

copula, 151

decision boundary, 79, 131

common ground, 494, 524

CORAAL, 550

case folding, 20

Common nouns, 149

corefer, 415 decision tree use in WSD, 372

case frame, 375, 390

coreference chain, 416

CAT, 203

complementizers, 150 declarative sentence structure, 237

cataphora, 418

completeness in FOL, 318

categorial grammar, 250, 250

componential analysis, 389 coreference resolution, 416 gender agreement, 422 Hobbs tree search algorithm, 438

decoding, 157 Viterbi, 157 compression, 535

CD (conceptual dependency), 389

Computational Grammar Coder (CGC), 170 number agreement, 421

deduction in FOL, 317 person agreement, 422

CELEX, 544 deep neural networks, 127

recency preferences, 422 computational semantics, 305

Centering Theory, 443, 451

centroid, 111

deep learning, 127 selectional restrictions, 423

concatenation, 26

deep role, 374

cepstrum history, 571 concept error rate, 519

definite reference, 418

conceptual dependency, 389 syntactic (“binding”) constraints, 422 degree adverb, 150

CFG, see context-free grammar

concordance, semantic, 363

verb semantics, 423

delexicalization, 516

concrete word, 397

coronal sound, 529

denotation, 309

chain rule, 93, 139 conditional random field, 162

corpora, 11

channels in stored waveforms, 536 corpus, 11 ATIS, 234

dependency grammar, 280 confidence, 226 ASR, 515

chart parsing, 261

Broadcast news, 571

dependency tree, 283

chatbots, 2, 496

in relation extraction, 340

Brown, 11, 170

dependent, 281

CHiME, 550

confidence values, 339

CASS phonetic of Mandarin, 545 derivation

Chinese as verb-framed language, 207

configuration, 285

direct (in a formal language), 236 confusion matrix, 65

fisher, 571

conjoined phrase, 243

Kiel of German, 545 syntactic, 233, 233, 236, 236

Conjunctions, 150

LOB, 170

words for brother, 206

conjunctions, 243

regular expression searching inside, 3 description logics, 323

Chirpy Cardinal, 503

connectionist, 147

Det, 233

Chomsky normal form, 249

connotation frame, 411

Switchboard, 11, 500, 535, 536, 550

determiner, 150, 233, 239

Chomsky-adjunction, 250

connotation frames, 392

Determiners, 150

chunking, 270, 270

connotations, 99, 394

TimeBank, 349

development test set, 67

CIRCUS, 353

consonant, 528

TIMIT, 545

development test set (dev-test), 35 citation form, 97

constants in FOL, 312

Wall Street Journal, 571

Citizen Kane, 442

constative speech act, 494 correction act detection, 512

devset, see development test set (dev-test), 67

CKY algorithm, 259

constituency, 232 evidence for, 232 claims, 458

DFT, 554

clarification questions, 517 constituent, 232 book titles which are not, 231

as a similarity metric, 105

dialogue, 492

class-based n-gram, 53

clause, 238

cost function, 81 dialogue act correction, 512

clefts, 421

Constraint Grammar, 303

count nouns, 149

clitic, 16

dialogue acts, 509

Construction Grammar, 257

counters, 26

dialogue manager

design, 520

dialogue policy, 513

edge-factored, 296 devset or development test set, 35

edit distance minimum algorithm, 24 dialogue systems, 492 design, 520 evaluation, 517

part-of-speech tagging, 164

dialogue systems, 517

feature vectors, 551

EDU, 445

extrinsic, 35

Federalist papers, 74

effect size, 69

fluency in MT, 222

feedforward network, 133

diathesis alternation, 376

diff program, 27

Elaboration (as coherence relation), 444

fenceposts, 263

Matched-Pair Sentence Segment Word Error (MAPSSWE), 563

FFT, 554, 571

digit recognition, 549

digitization, 535, 552

file format, .wav, 536

ELIZA, 2 implementation, 11 sample conversation, 10 dilated convolutions, 568

mean opinion score, 569

filled pause, 12

METEOR for MT, 222

filler, 12

dimension, 102

Elman Networks, 176 most frequent class baseline, 152 final fall, 533

diphthong, 531 origin of term, 148

ELMo for affect, 410

First Order Logic, see FOL

MT, 221

direct derivation (in a formal language), 236

first-order co-occurrence, 119

EM for deleted interpolation, 44

named entity recognition, 167

of n-gram, 35

flap (phonetic), 530

directional adverb, 150

embedded verb, 241 fluency, 221 in MT, 222

directive speech act, 494 of n-grams via perplexity, 36 focus, 485

disambiguation in parsing, 267 syntactic, 261

cosine for similarity, 105 precision and recall for MT, 222

FOL, 305, 311

skip-gram, learning, 115

pseudoword, 388

<sub>∃</sub> (there exists), 313

discount, 41, 43, 44

<sub>∀</sub> (for all), 313

relation extraction, 343

discounting, 41

=<sub>⇒</sub> (implies), 316

TER for MT, 222

(and), 313, 316

discourse, 442 segment, 445 emission probabilities, 156

test set, 35

<sub>¬</sub> (not), 313, 316

EmoLex, 396

training on the test set, 35

discourse connectives, 446

(or), 316

training set, 35

emotion, 394

and verifiability, 311

discourse deixis, 417

TTS, 569

empty category, 238

constants, 312

discourse model, 415

unsupervised WSD, 370

Encoder-decoder, 208

discourse parsing, 447

WSD systems, 364 expressiveness of, 308, 311

end-to-end training, 184

discourse-new, 419

event coreference, 417

endpointing, 494

discourse-old, 419

functions, 312

Event extraction, 332

discovery procedure, 256

inference in, 311

event extraction, 348

discrete Fourier transform, 554

lexical differences from French, 207

event variable, 319

terms, 312

variables, 312

discriminative model, 77 simplified grammar rules, 234

representation of, 318 fold (in cross-validation), 68

disfluency, 12

verb-framed, 207

Evidence (as coherence relation), 444 forget gate, 187

entity dictionary, 165

pipe in regular expressions as, 6 formal language, 235

evoking a referent, 415

entity grid, 453

expansion, 234, 237

formant, 542

Entity linking, 477

expletive, 421

formant synthesis, 573 square braces in regular expression as, 4

explicit confirmation, 514

forward chaining, 317

dispreferred response, 525

entity-based coherence, 451

forward composition, 253

distance cosine, 105

expressiveness, of a meaning representation, 308 forward-looking centers, 452

distant supervision, 340 entropy, 49 and perplexity, 49 cross-entropy, 51 per-word, 50 rate, 50 relative, 387

distributional hypothesis, 96

extractive QA, 476

extraposition, 421

Fosler, E., see Fosler-Lussier, E.

extrinsic evaluation, 35

fragment of word, 12

distributional similarity, 256

error backpropagation, 139

F (for F-measure), 66 divergences between languages in MT, 205

ESPnet, 572

frame elements, 379

F-measure, 66

ethos, 458

F-measure in NER, 167

FrameNet, 379

Euclidean distance in L2 regularization, 89

frames, 504

document in IR, 465

F0, 537

free word order, 280

Eugene Onegin, 52

factoid question, 464

Freebase, 335, 482

document frequency, 107

Euler’s formula, 554

Faiss, 473

FreebaseQA, 482

document vector, 111

Europarl, 219

false negatives, 8

French, 205

domain, 309

evalb, 270

false positives, 8

frequency of a signal, 534 domination in syntax, 233

evaluating parsers, 269

Farsi, verb-framed, 207

dot product, 78, 105

fricative sound, 530 fast Fourier transform, 554, 571

evaluation 10-fold cross-validation, 68

dot-product attention, 213

Frump, 353

Dragon Systems, 571

fasttext, 117

dropout, 142

AB test, 569 fully qualified date expressions, 347

FASTUS, 352

duration temporal expression, 344

BLEU in MT, 222

feature cutoff, 165

fully-connected, 133

comparing models, 37

feature interactions, 81

function word, 149, 169

dynamic programming, 23 and parsing, 261 Viterbi as, 159

cross-validation, 68

feature selection information gain, 74 functional grammar, 257

development test set, 35, 67

feature template, 292

functions in FOL, 312

dynamic time warping, 571

devset, 67

fundamental frequency, 537

feature templates, 81

fusion language, 207

Hamilton, Alexander, 74

prior on weights, 90

Hamming, 553 idf term weighting, 107, 466

vector space model, 101

IR-based QA, 473

gazetteer, 165

Hansard, 228

IRB, 522

General Inquirer, 63, 395

hanzi, 17

if then reasoning in FOL, 317

IS-A, 359

generalize, 88

harmonic, 543

is-a, 335

immediately dominates, 233

generalized semantic role, 376

harmonic mean, 66

ISO 8601, 346

Hays, D., 303

isolating language, 207

generation of sentences to test a CFG grammar, 234 template-based, 508

imperative sentence structure, 237

head, 248, 281 finding, 248 iSRL, 392

implicature, 496

ITG (inversion transduction grammar), 229

Head-Driven Phrase Structure Grammar (HPSG), 248, 257 generative grammar, 236

implicit argument, 392

implicit confirmation, 514

generative lexicon, 372

Heaps’ Law, 12 implied hierarchy in description logics, 327

Japanese, 205–207, 526, 544

generative model, 77

Hearst patterns, 336

indefinite article, 239

generative models, 58

Hebrew, 526

Jay, John, 74

indefinite reference, 418

generative syntax, 257

joint intention, 524

held out, 35

generator, 233

inference, 308 in FOL, 317 held-out, 44

generics, 421

Herdan’s Law, 12

Kaldi, 572

genitive NP, 258 inference-based learning, 301

hertz as unit of measure, 534

Katz backoff, 44

German, 205, 544

infinitives, 242

KBP, 354

gerundive postmodifier, 240

hidden, 156

infoboxes, 335

KenLM, 48, 53

Gilbert and Sullivan, 332

given-new, 420

KL divergence, 387 hidden layer, 133 as representation of input, 134

information structure, 419 gloss, 360

KL-ONE, 329

glosses, 356

status, 419

hidden units, 133

Klatt formant synthesizer, 573

Glottal, 529

Hindi, 205

information extraction (IE), 332

glottal stop, 529

Hindi, verb-framed, 207

Kleene \*, 5 sneakiness of matching zero things, 5

glottis, 528

HKUST, 551

partial parsing for, 270

Godzilla, speaker as, 384

HMM, 156

Kleene +, 5

gold labels, 65 formal definition of, 156 history in speech recognition, 571

information gain, 74 for feature selection, 74

Good-Turing, 45

Kneser-Ney discounting, 45

gradient, 84

Information retrieval, 103, 465

knowledge base, 307

Grammar Constraint, 303 initial distribution, 156

initiative, 495

knowledge graphs, 332

observation likelihood, 156

inner ear, 542

Construction, 257

inner product, 105

Korean, 544

Head-Driven Phrase Structure (HPSG), 248, 257

observations, 156

instance checking, 326

KRL, 329

simplifying assumptions for POS tagging, 158

Kullback-Leibler

divergence, 387

Lexical-Functional (LFG), 257

states, 156

intensity of sound, 538

Link, 303

intent determination, 506

L\* pitch accent, 534

Minimalist Program, 257 transition probabilities, 156

intercept, 78

L+H\* pitch accent, 534

Interjections, 150

Tree Adjoining, 257

L1 regularization, 89

Hobbs algorithm, 438

intermediate phrase, 533

grammar

L2 regularization, 89

labeled precision, 270

Hobbs tree search algorithm for pronoun resolution, 438

International Phonetic Alphabet, 526, 546 categorial, 250, 250

labeled recall, 269

interpersonal stance, 408

CCG, 250

holonym, 359 labial place of articulation, 529

checking, 259

homonymy, 355

Interpolated Kneser-Ney discounting, 45, 47

labiodental consonants, 529 combinatory categorial, 250

hot languages, 208

interpolated precision, 471

HotpotQA, 474

lambda notation, 315

equivalence, 249

Hungarian part-of-speech tagging, 169

interpolation in smoothing, 43

generative, 236 language identification, 570 universal, 205

interpretable, 92 inversion transduction, 229

hybrid, 572

interpretation, 309

language ID, 63

intonation phrases, 533

strong equivalence, 249

language id, 55

hyperarticulation, 512

intransitive verbs, 242

language model, 30

weak equivalence, 249 hypernym, 335, 358 lexico-syntactic patterns for, 336

intrinsic evaluation, 35

grammatical function, 281

Laplace smoothing, 41

grammatical relation, 281 inversion transduction grammar (ITG), 229

Laplace smoothing:for PMI, 111

hyperparameter, 86

inverted index, 469

greedy, 215

larynx, 527

hyperparameters, 142

IO, 154

lasso regression, 89

greedy RE patterns, 7

hyponym, 358

Greek, 526

Hz as unit of measure, 534

IOB tagging for temporal expressions, 345

latent semantic analysis, 125

grep, 3, 3, 27

Gricean maxims, 496

lateral sound, 530

IBM Models, 228

IPA, 526, 546

grounding, 494

LDC, 16

IBM Thomas J. Watson Research Center, 53, 571

GUS, 504

IR, 465

idf term weighting, 107, 466

learning rate, 84

lemma, 12, 97 versus wordform, 12

H\* pitch accent, 534

idf, 107

term weighting, 466

lemmatization, 3

Lesk algorithm, 366 Simplified, 366 mention-pair, 427

Levenshtein distance, 23

traces in the Penn Treebank, 245 n-best list, 557

mentions, 415

wh-questions, 238

meronym, 359

N-gram as Markov chain, 155 lookahead in RE, 11

lexical category, 233 meronymy, 359

loss, 81

cohesion, 443, 456

loudness, 539

MERT, for training in MT, 229

add-one smoothing, 41

database, 360

low frame rate, 556

as approximation, 31

MeSH (Medical Subject Headings), 56, 363

semantics, 97 low-resourced languages, 227

as generators, 38

equation for, 32

Message Understanding Conference, 352

LPC (Linear Predictive Coding), 571

trigger, in IE, 344

example of, 33, 34

metarule, 244

for Shakespeare, 38

lexical answer type, 486

LSI, see latent semantic analysis

METEOR, 222, 230

history of, 53 lexical sample task in WSD, 363

LSTM, 171

metonymy, 359, 440

interpolation, 43

Micro-Planner, 329

Katz backoff, 44

LUNAR, 490

Lexical-Functional Grammar (LFG), 257

Lunar, 329

microaveraging, 67

KenLM, 48, 53

Microsoft .wav format, 536

Kneser-Ney discounting, 45

mini-batch, 87 lexico-syntactic pattern, 336

machine learning for NER, 168 textbooks, 74, 95 lexicon, 233

logprobs in, 34 minimum edit distance, 22, 22, 159

normalizing, 33

LibriSpeech, 550

parameter estimation, 33

machine translation, 203

likelihood, 58

sensitivity to corpus, 37

macroaveraging, 67 for speech recognition evaluation, 562

linear chain CRF, 162, 163

smoothing, 41

Madison, James, 74

linear classifiers, 59

SRILM, 53

MAE, 13

MINIMUM EDIT DISTANCE, 25

test set, 35

linear interpolation for n-grams, 44

Mandarin, 205, 544

minimum edit distance algorithm, 24 training set, 35

linearly separable, 131

Manhattan distance in L1 regularization, 89 unknown words, 40

Linguistic Data Consortium, 16 manner adverb, 150

Minimum Error Rate Training, 229

manner of articulation, 529 naive Bayes multinomial, 56 simplifying assumptions, 58

marker passing for WSD, 371

MLE for n-grams, 32 for n-grams, intuition, 33

Link Grammar, 303

naive Bayes assumption, 58

List (as coherence relation), 445

Markov, 32 assumption, 32

MLP, 133

modal verb, 151

Markov assumption, 155 naive Bayes classifier use in text categorization, 56

listen attend and spell, 555

model, 308

LIWC, 63, 397

model card, 73

LM, 30

named entity, 148, 153 list of types, 153

LOB corpus, 170

Markov chain, 52, 155 formal definition of, 156 initial distribution, 156 N-gram as, 155 states, 156 transition probabilities, 156

localization, 203

modified Kneser-Ney, 47

modified n-gram precision, 224

named entity recognition, 153

location-based attention, 567

modus ponens, 317

nasal sound, 528, 530

Montague semantics, 329

nasal tract, 528

locative, 150

Monte Carlo search, 221

Natural Questions, 475

locative adverb, 150

Markov model, 32 formal definition of, 156 history, 53

morpheme, 21 negative log likelihood loss, 92, 138

MOS (mean opinion score), 569

why used for probabilities, 34 neo-Davidsonian, 319

Marx, G., 259

mass nouns, 149

Moses, Michelangelo statue of, 492

NER, 153

why used to compress speech, 536

maxent, 95

maxim, Gricean, 496

Moses, MT toolkit, 229

neural networks relation to logistic regression, 135 log likelihood ratio, 405

maximum entropy, 95

most frequent sense, 364

log odds ratio, 405

MRR, 488

newline character, 8 maximum spanning tree, 297

log probabilities, 34, 34

MT, 203 divergences, 205 post-editing, 203

NIST for MT evaluation, 222, 230

logical connectives, 313

Mayan, 207

logical vocabulary, 308

McNemar’s test, 564

noisy-or, 340

logistic function, 78

MCTest, 489

mu-law, 536

NomBank, 378

logistic regression, 76 conditional maximum likelihood estimation, 82

mean average precision, 471

MUC, 352, 353

Nominal, 233

MUC F-measure, 434

non-capturing group, 10

mean opinion score, 569 multi-layer perceptrons, 133

non-finite postmodifier, 240

mean reciprocal rank, 488

non-greedy, 7

Gaussian priors, 90 meaning representation, 305

non-logical vocabulary, 308 multihead self-attention layers, 194

learning in, 81

non-standard words, 565

regularization, 90

as set of symbols, 306

multinomial logistic regression, 90 non-stationary process, 552

relation to neural networks, 135 multinomial naive Bayes, 56

logos, 458

mechanical indexing, 124

normal form, 249, 249

Long short-term memory, 187

Mechanical Turk, 549 multinomial naive Bayes classifier, 56

mel, 554 scale, 538

long-distance dependency, 245

normalization dates, 507

multiword expressions, 125

mention detection, 424

MWE, 125

temporal, 346

word, 20

normalization of probabilities, 32 shallow, 270

normalizing, 135

syntactic, 259 phrase-based translation, 229

productions, 233

progressive prompting, 514 well-formed substring table, 278

phrase-structure grammar, 233, 256

projection layer, 145

abstract, 149, 239

Prolog, 317

common, 149

PII, 501

part of speech as used in CFG, 233 prominence, phonetic, 533

pipe, 6

prominent word, 532

count, 149

mass, 149, 239 part-of-speech adjective, 150 adverb, 150

The Pirates of Penzance, 332

prompts, 508

proper, 149

pitch, 538

noun phrase, 232constituents, 233

closed class, 149 pitch accent, 532 ToBI, 534

interjection, 150

non-binary, 422

Nouns, 149

noun, 149

pitch extraction, 539

personal, 150

NP, 233, 234

open class, 149

pitch track, 537

possessive, 150

nucleus, 444

particle, 150

nucleus of syllable, 531

place of articulation, 529

null hypothesis, 69 subtle distinction between verb and noun, 150

planning and speech acts, 524 shared plans, 524

Nyquist frequency, 535, 552

pronunciation dictionary, 544 CELEX, 544 CMU, 544

verb, 150

pleonastic, 421

plosive sound, 530

PropBank, 377

observation likelihood role in Viterbi, 160 part-of-speech tagger PARTS, 170 TAGGIT, 170

plural, 239

proper noun, 149

propositional meaning, 98

one-hot vector, 144

Pointwise mutual information, 109

Part-of-speech tagging, 151

prosodic phrasing, 533

onset, syllable, 531

Prosody, 532

polysynthetic language, 207

ontology, 323

Porter stemmer, 21

POS, 148

prosody accented syllables, 532 reduced vowels, 533

OOV (out of vocabulary) words, 40

amount of ambiguity in Brown corpus, 152 positional embeddings, 195

possessive NP, 258

PROTO-AGENT, 376

OOV rate, 40

and morphological analysis, 169 possessive pronoun, 150

PROTO-PATIENT, 376

open class, 149

pseudoword, 388

post-editing, 203

feature templates, 164 open information extraction, 342

PTRANS, 389

postdeterminer, 239

history of, 170

postings, 469

Pullum, G. K., 231

open vocabulary system unknown words in, 40 postmodifier, 240

punctuation unctuation

operation list, 22 postposed constructions, 232

for numbers cross-linguistically, 16

part-whole, 359

operator precedence, 6, 7

partial parsing, 270

postposition, 205

optionality of determiners, 239 use of ? in regular expressions for, 4 particle, 150

Potts diagram, 403 for sentence segmentation, 22

PARTS tagger, 170

power of a signal, 537

parts of speech, 148

PP, 234

tokenization, 16

treated as words, 11

PPMI, 109

oral tract, 528

pathos, 458

praat, 539, 540, 545 treated as words in LM, 39

ordinal number, 239 pattern, regular expression, 3

precedence, 6

orthography opaque, 527 transparent, 527

PCM (Pulse Code Modulation), 536 precedence, operator, 6

Precision, 66

qualia structure, 372

output gate, 188

PDP, 147

overfitting, 88

PDTB, 446

precision for MT evaluation, 222, 230

quantifier as part of speech, 239 semantics, 313

Penn Discourse TreeBank, 446

in NER, 167

quantization, 536, 552

p-value, 69

Paired, 70

modified n-gram, in MT, 224

query, 465 in IR, 465

Penn Treebank, 244 tagset, 151, 151 palatal sound, 529

precision-recall curve, 471

palate, 529

Penn Treebank tokenization, 16 predeterminer, 241 question factoid, 464 rise, 533

palato-alveolar sound, 529

predicate, 242

per-word entropy, 50

perceptron, 130 predicate-argument relations, 242

parallel distributed processing, 147 period of a wave, 534

preference semantics, 371

parallelogram model, 119

parse tree, 233, 235 perplexity, 36, 51, 175 as weighted average branching factor, 36 defined via cross-entropy, 51

premises, 458

PARSEVAL, 269

preposed constructions, 232

Radio Rex, 548

range, regular expression, 4

parsing

prepositional phrase, 240 constituency, 234 preposing, 232

ranking, 222

ambiguity, 259

rapid reprompting, 515

chunking, 270

personal pronoun, 150

prepositions, 150

rarefaction, 535

CKY, 261

personality, 407

presequences, 495

RDF, 335

CYK, see CKY

persuasion, 459

pretraining, 144

RDF triple, 335

evaluation, 269

phone, 526, 545 primitive decomposition, 389

history, 278 phonetics, 526 articulatory, 527, 527

partial, 270

principle of contrast, 98

Read speech, 550

relation to grammars, 236

phonotactics, 531

prior probability, 58

phrasal verb, 150

pro-drop languages, 208 reading comprehension, 473

Reason (as coherence relation), 444 semantic grammars, 507

source-filter model, 543

syllable, 531

Recall, 66

SOV language, 205

RMS amplitude, 537

recall for MT evaluation, 222, 230 in NER, 167

spam detection, 55, 63

RNN-T, 561

role-filler extraction, 351

Rosebud, sled named, 442

span, 267, 476

rounded vowels, 531

Spanish, 544 semantic networks origins, 329

Speaker diarization, 569

recipe meaning of, 305 row vector, 103

semantic parsing, 305

speaker recognition, 570

rectangular, 552

TreeBank, 446, 461 rules rules

semantic relations in IE, 333 table, 334

reduced vowels, 533

speaker verification, 570

spectrogram, 542

reduction, phonetic, 533 context-free, 233 context-free, expansion, 233, 237

semantic role, 374, 374, 376

spectrum, 540

Semantic role labeling, 380

context-free, sample, 234 reference bound pronouns, 418 cataphora, 418 definite, 418 generics, 421 indefinite, 418

speech telephone bandwidth, 536

Russian fusion language, 207 verb-framed, 207

semantics lexical, 97 speech acts, 494

word, 355, 356 speech recognition architecture, 549, 555 history of, 570

reference point, 321

referent, 415 accessing of, 415 evoking of, 415

S as start symbol in CFG, 233

sentence error rate, 563 segmentation, 22 speech synthesis, 549

spelling correction use of n-grams in, 29 salience, in discourse model, 420

referential density, 208

sentence realization, 515

split-half reliability, 398

reflexive, 422

sentence segmentation, 3

sampling, 552 of analog waveform, 535 rate, 535, 552 used in clustering, 370 register in RE, 10

SQuAD, 474 sentential complements, 241

SRILM, 53

regression lasso, 89 ridge, 89

SRL, 380

sentiment, 99 origin of term, 413

Stacked RNNs, 184

satellite, 206, 444

start symbol, 233

regular expression, 3, 26 substitutions, 9

satellite-framed language, 207

sentiment analysis, 55

sentiment lexicons, 63

saturated, 130

SentiWordNet, 402 state semantic representation of, 318

regularization, 89

Schonfinkelization, 315¨

sequence labeling, 148

rejection conversation act, 514 static embeddings, 112

schwa, 533

SGNS, 112

relatedness, 98

SCISOR, 353

stationary process, 552

relation extraction, 332

sclite, 563

Shakespeare n-gram approximations to, 38

stationary stochastic process, 50

relative temporal expression, 344

sclite package, 27 shallow discourse parsing, 450

relative entropy, 387 script Schankian, 379

statistical significance MAPSSWE for ASR, 563 McNemar’s test, 564 relative frequency, 33

scripts, 350

shallow parse, 270

relative pronoun, 241

shared plans, 524

release, stop, 529

statistically significant, 70

SDRT (Segmented Discourse Representation Theory), 461 shift-reduce parsing, 285

relevance, 496

SHRDLU, 329

stative expressions, 322

sibilant sound, 530

stem, 21

relexicalize, 516

Stemming, 3

search engine, 465

side sequence, 495

ReLU, 129

stemming, 21

sigmoid, 78, 128

stop (consonant), 529

reporting events, 348

representation learning, 96

co-occurrence, 119

representational harm, 121

stop list, 468

seed pattern in IE, 338 significance test MAPSSWE for ASR, 563 McNemar’s, 564

stop words, 60

seed tuples, 338

streaming, 561

rescore, 557

similarity, 98

resolution for inference, 318

segmentation sentence, 22 word, 16

stress lexical, 532

Simple Questions, 482

Simplified Lesk, 366

stride, 552

resolve, 152

selectional association, 387 singleton, 416 strong equivalence of grammars, 249

Resource Management, 571 selectional preference strength, 387 singular they, 422

response generation, 501

skip-gram, 112

structural ambiguity, 259

selectional preferences pseudowords for evaluation, 388 slot filling, 354, 506

structured polysemy, 359

restrictive relative clause, 241

slots, 504

stupid backoff, 48

smoothing, 41, 41 absolute discounting, 45 retrieve and read, 473

subcategorization tagsets for, 242 selectional restriction, 384 representing with events, 385

retrofitting, 369

ReVerb, 342

discounting, 41 subcategorization frame, 242

reversives, 358

violations in WSD, 386

interpolation, 43

examples, 242

rewrite, 233

self-attention, 191

subcategorize for, 242

Rhetorical Structure Theory, see RST self-supervision, 113

Kneser-Ney discounting, 45

subdialogue, 495

semantic concordance, 363

rhyme, syllable, 531

semantic drift in IE, 339

Laplace, 41 subject, syntactic in wh-questions, 238

Riau Indonesian, 150

semantic feature, 124

linear interpolation, 44

subjectivity, 393, 413

ridge regression, 89

semantic field, 98

softmax, 90, 135

substitutability, 256

rime

semantic frame, 99

source, 209

substitution in TAG, 257

substitution operator (regular expressions), 9 temporal logic, 319

temporal normalization, 346

transition probability role in Viterbi, 160 vector space, 102

subsumption, 324, 326

transitive verbs, 242

vector space model, 101

temporal reasoning, 330

Vectors semantics, 100

subwords, 18

translation divergences, 205 velar sound, 529

velum, 529

superordinate, 359

TREC, 490

supersenses, 361

Supertagging, 273

in FOL, 312

Tree Adjoining Grammar (TAG), 257 adjunction in, 257 substitution in, 257

copula, 151 modal, 151 phrasal, 150

supervised machine learning, 56 verb alternations, 376

SVD, 125

term frequency, 107

treebank, 244

verb phrase, 234, 241

SVO language, 205

term weight, 466

trigram, 34

verb-framed language, 207

Swedish, verb-framed, 207

term-document matrix, 101

Verbs, 150

Switchboard, 550 truth-conditional semantics, 310

term-term matrix, 103

verifiability, 306

Switchboard Corpus, 11, 500, 535, 536, 550 terminal symbol, 233

TTS, 549

Vietnamese, 207

syllabification, 531 tune, 533 continuation rise, 534

syllable, 531 syllable, 531 accented, 532 coda, 531 nucleus, 531 onset, 531 prominent, 532 rhyme, 531 rime, 531

test set, 35 development, 35 how to choose, 35

Turing test Passed in 1972, 500

Viterbi algorithm, 23, 159 inference in CRF, 166

Turk, Mechanical, 549

text categorization, 55 bag of words assumption, 57 naive Bayes approach, 56 unknown words, 60

VITERBI ALGORITHM, 159

Turkish agglutinative, 207 part-of-speech tagging, 169

vocal cords, 528 folds, 528 tract, 528 turn correction ratio, 520

vocoder, 565

synchronous grammar, 229

text normalization, 2

turns, 493

vocoding, 565

synonyms, 97, 358

Text summarization, 197

TyDi QA, 475

voice user interface, 520

synset, 360

text-to-speech, 549

type raising, 253

voiced sound, 528

syntactic disambiguation, 261

TextTiling, 456 typed dependency structure, 280

voiceless sound, 528

tf-idf, 108

syntactic movement, 245

syntax, 231 origin of term, 148

thematic grid, 375 types word, 12

thematic role, 374 and diathesis alternation, 376 examples of, 374 problems, 376

typology, 205 linguistic, 205 height, 530, 531

TAC KBP, 335

high, 531

low, 531

Tacotron2, 567

mid, 531

TACRED dataset, 335 ungrammatical sentences, 235

theme, 374

reduced, 533

TAG, 257

theme, as thematic role, 374

unit production, 262

TAGGIT, 170

thesaurus, 371

unit vector, 105

VSO language, 205

tagset Penn Treebank, 151, 151 table of Penn Treebank tags, 151

time, representation of, 319

time-aligned transcription, 545

Universal Dependencies, 282

universal, linguistic, 205

wake word, 569

TimeBank, 349

Unix, 3

Tamil, 207

TIMIT, 545

<UNK>, 40

Wall Street Journal Wall Street Journal speech recognition of, 571

tanh, 129

tap (phonetic), 530

ToBI, 534 boundary tones, 534

target, 209

warping, 571

unknown words in n-grams, 40 in part-of-speech tagging, 162 in text categorizati target embedding, 117

wavefile format, 536 tokenization, 2 sentence, 22 word, 16

WaveNet, 567

Tay, 521

on, 60

Wavenet, 567

TBox, 323

tokens, word, 12

unvoiced sound, 528

teacher forcing, 180, 212

weak equivalence of grammars, 249 topic models, 99

user-centered design, 520

technai, 148

toxicity detection, 72

utterance, 12

Web Ontology Language, 328

telephone-bandwidth, 552

trace, 238, 244

telephone-bandwidth speech, 536 trachea, 527

vagueness, 307

WebQuestions, 482

training oracle, 290

value sensitive design, 521

Weight Tying, 180

telic eventualities, 323

training set, 35 cross-validation, 68 how to choose, 35 template filling, 333, 350

vanishing gradient, 130 well-formed substring table, 278

vanishing gradients, 187

template recognition, 351

WFST, 278

template, in IE, 350

transcription of speech, 548 reference, 562 time-aligned, 545 wh-non-subject-question, 238

template-based generation, 508

temporal adverb, 150

wh-phrase, 237, 238 universally quantified, 314

wh-pronoun, 150

temporal anchor, 347

transduction grammars, 229

variables, 308

wh-subject-questions, 237

variables in FOL, 312

Transformations and Discourse Analysis Project (TDAP), 170

wh-word, 237

metaphor for, 322

Vauquois triangle, 228

vector, 102, 128

WiC, 367

recognition, 332

vector length, 105

wikification, 478

relative, 344

Transformers, 190

vector semantics, 96

wildcard, regular

expression, 5

Winograd Schema, 436 Wizard-of-Oz system, 520 word word

word segmentation, 16, 18 word sense, 355, 356

boundary, regular expression notation, 6 closed class, 149 definition of, 11 error rate, 551, 562 fragment, 12 function, 149, 169 open class, 149 punctuation as, 11 tokens, 12 types, 12

word sense disambiguation, 363, see WSD

word sense induction, 369

unsupervised machine learning, 369 WSI, 369

WSD, 363 AI-oriented efforts, 371 all-words task, 363 bootstrapping, 372 decision tree approach, 372

word shape, 164

X-bar schemata, 257

word normalization, 20

word tokenization, 16

word-in-context, 367

word-word matrix, 103

word2vec, 112

wordform, 12 and lemma, 97 versus lemma, 12 evaluation of, 364

history, 371

WordNet, 360, 360

history of, 372

wordpiece, 218

lexical sample task, 363

world knowledge, 305

neural network approaches, 371 yes-no questions, 237 Yonkers Racetrack, 49 Yupik, 207

supervised machine learning, 372 robust approach, 371

zero anaphor, 419

zero-width, 11

zeros, 40

zeugma, 357


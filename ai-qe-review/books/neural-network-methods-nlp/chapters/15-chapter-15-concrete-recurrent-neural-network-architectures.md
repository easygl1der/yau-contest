---
title: "Chapter 15 \u2014 Concrete Recurrent Neural Network Architectures"
book: "Neural Network Methods for Natural Language Processing"
book_slug: neural-network-methods-nlp
course: natural-language-processing
chapter_number: 15
citekey: goldberg2017nnnlp
official_syllabus: true
source_pdf: "sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf"
source_transcript: "transcripts/mineru/neural-network-methods-nlp/reading.md"
source_line_start: 3487
source_line_end: 3625
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 3
source_empty_image_alt: 3
non_semantic_image_alt: 2
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

# Chapter 15 — Concrete Recurrent Neural Network Architectures

> [[../README|本书目录]] · [[14-chapter-14-recurrent-neural-networks-modeling-sequences-and-stacks|上一章]] · [[16-chapter-16-modeling-with-recurrent-networks|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Neural Network Methods for Natural Language Processing（goldberg2017nnnlp）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/natural-language-processing/neural-network-methods-nlp/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/neural-network-methods-nlp/reading.md)，源行 3487–3625。
> - 本章保留 3 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Concrete Recurrent Neural Network Architectures

After describing the RNN abstraction, we are now in place to discuss specific instantiations of it. Recall that we are interested in a recursive function $s_{i} = R(x_{i}, s_{i-1})$ such that $s_{i}$ encodes the sequence $x_{1:n}$ . We will present several concrete instantiations of the abstract RNN architecture, providing concrete definitions of the functions R and O. These include the Simple RNN (S-RNN), the Long Short-Term Memory (LSTM) and the Gated Recurrent Unit (GRU).

## 15.1 CBOW AS AN RNN

On particularly simple choice of R is the addition function:

$$
\begin{array}{c} s_{i} = R_{\text{CBOW}}(x_{i}, s_{i - 1}) = s_{i - 1} + x_{i} \\ y_{i} = O_{\text{CBOW}}(s_{i}) = s_{i} \\ s_{i}, y_{i} \in \mathbb{R}^{d_{s}}, x_{i} \in \mathbb{R}^{d_{s}}.\end{array}\tag{15.1}
$$

Following the definition in Equation (15.1), we get the continuous-bag-of-words model: the state resulting from inputs $x_{1:n}$ is the sum of these inputs. While simple, this instantiation of the RNN ignores the sequential nature of the data. The Elman RNN, described next, adds dependence on the sequential ordering of the elements. $^{1}$

## 15.2 SIMPLE RNN

The simplest RNN formulation that is sensitive to the ordering of elements in the sequence is known as an Elman Network or Simple-RNN (S-RNN). The S-RNN was proposed by Elman [1990] and explored for use in language modeling by Mikoloy [2012]. The S-RNN takes the following form:

$$
\begin{array}{l} s_{i} = R_{\mathrm{SRNN}}(x_{i}, s_{i - 1}) = g(s_{i - 1} W^{s} + x_{i} W^{x} + b) \\ y_{i} = O_{\mathrm{SRNN}}(s_{i}) = s_{i} \end{array}\tag{15.2}
$$

$$
\boldsymbol{s}_{\boldsymbol{i}}, \boldsymbol{y}_{\boldsymbol{i}} \in \mathbb{R}^{d_{s}}, \boldsymbol{x}_{\boldsymbol{i}} \in \mathbb{R}^{d_{x}}, \boldsymbol{W}^{\boldsymbol{x}} \in \mathbb{R}^{d_{x} \times d_{s}}, \boldsymbol{W}^{\boldsymbol{s}} \in \mathbb{R}^{d_{s} \times d_{s}}, \boldsymbol{b} \in \mathbb{R}^{d_{s}}.
$$

## 178 15. CONCRETE RECURRENT NEURAL NETWORK ARCHITECTURES

That is, the state $s_{i-1}$ and the input $x_{i}$ are each linearly transformed, the results are added (together with a bias term) and then passed through a nonlinear activation function g (commonly tanh or ReLU). The output at position i is the same as the hidden state in that position. $^{2}$

An equivalent way of writing Equation (15.2) is Equation (15.3), both are used in the literature:

$$
s_{i} = R_{\text{SRNN}}(x_{i}, s_{i - 1}) = g([s_{i - 1}; x_{i}] W + b)\tag{15.3}
$$

$$
y_{i} = O_{\mathrm{SRNN}}(s_{i}) = s_{i}
$$

$$
\boldsymbol{s}_{\boldsymbol{i}}, \boldsymbol{y}_{\boldsymbol{i}} \in \mathbb{R}^{d_{s}}, \boldsymbol{x}_{\boldsymbol{i}} \in \mathbb{R}^{d_{x}}, \boldsymbol{W} \in \mathbb{R}^{(d_{x} + d_{s}) \times d_{s}}, \boldsymbol{b} \in \mathbb{R}^{d_{s}}.
$$

The S-RNN is only slightly more complex than the CBOW, with the major difference being the nonlinear activation function g. However, this difference is a crucial one, as adding the linear transformation followed by the nonlinearity makes the network sensitive to the order of the inputs. Indeed, the Simple RNN provides strong results for sequence tagging [Xu et al., 2015] as well as language modeling. For comprehensive discussion on using Simple RNNs for language modeling, see the Ph.D. thesis by Mikolov [2012].

## 15.3 GATED ARCHITECTURES

The S-RNN is hard to train effectively because of the vanishing gradients problem [Pascanu et al., 2012]. Error signals (gradients) in later steps in the sequence diminish quickly in the back-propagation process, and do not reach earlier input signals, making it hard for the S-RNN to capture long-range dependencies. Gating-based architectures, such as the LSTM [Hochreiter and Schmidhuber, 1997] and the GRU [Cho et al., 2014b] are designed to solve this deficiency.

Consider the RNN as a general purpose computing device, where the state $s_{i}$ represents a finite memory. Each application of the function R reads in an input $x_{i+1}$ , reads in the current memory $s_{i}$ , operates on them in some way, and writes the result into memory, resulting in a new memory state $s_{i+1}$ . Viewed this way, an apparent problem with the S-RNN architecture is that the memory access is not controlled. At each step of the computation, the entire memory state is read, and the entire memory state is written.

How does one provide more controlled memory access? Consider a binary vector $g \in \{0, 1\}^{n}$ . Such a vector can act as a gate for controlling access to n-dimensional vectors, using the hadamard-product operation $x \odot g$ : Consider a memory $s \in \mathbb{R}^{d}$ , an input $x \in \mathbb{R}^{d}$ and a gate $g \in 0, 1^{d}$ . The computation $s' \leftarrow g \odot x +(1 - g) \odot(s)$ “reads” the entries in x that correspond to the 1 values in g, and writes them to the new memory $s'$ . Then, locations that weren't read to are copied from the memory s to the new memory $s'$ through the use of the gate $(1 - g)$ . Figure 15.1 shows this process for updating the memory with positions 2 and 5 from the input.

![Figure 15.1](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/7d489292eb4be5d7d0cce38225ffbcde88bb4bf5945c0599ed87f9da72adf43c.jpg)  
Figure 15.1: Using binary gate vector g to control access to memory $s'$ .

The gating mechanism described above can serve as a building block in our RNN: gate vectors can be used to control access to the memory state $s_{i}$ . However, we are still missing two important (and related) components: the gates should not be static, but be controlled by the current memory state and the input, and their behavior should be learned. This introduced an obstacle, as learning in our framework entails being differentiable (because of the backpropagation algorithm) and the binary 0-1 values used in the gates are not differentiable. $^{4}$

A solution to the above problem is to approximate the hard gating mechanism with a soft—but differentiable—gating mechanism. To achieve these differentiable gates, we replace the requirement that $g \in \{0, 1\}^{n}$ and allow arbitrary real numbers, $g' \in \mathbb{R}^{n}$ , which are then pass through a sigmoid function $\sigma(g')$ . This bounds the value in the range (0, 1), with most values near the borders. When using the gate $\sigma(g') \odot x$ , indices in x corresponding to near-one values in $\sigma(g')$ are allowed to pass, while those corresponding to near-zero values are blocked. The gate values can then be conditioned on the input and the current memory, and trained using a gradient-based method to perform a desired behavior.

This controllable gating mechanism is the basis of the LSTM and the GRU architectures, to be defined next: at each time step, differentiable gating mechanisms decide which parts of the inputs will be written to memory, and which parts of memory will be overwritten (forgotten). This rather abstract description will be made concrete in the next sections.

## 15.3.1 LSTM

The Long Short-Term Memory (LSTM) architecture [Hochreiter and Schmidhuber, 1997] was designed to solve the vanishing gradients problem, and is the first to introduce the gating mechanism. The LSTM architecture explicitly splits the state vector $s_i$ into two halves, where one half is treated as “memory cells” and the other is working memory. The memory cells are designed to preserve the memory, and also the error gradients, across time, and are controlled through differentiable gating components—smooth mathematical functions that simulate logical gates. At each input state, a gate is used to decide how much of the new input should be written to the memory cell, and how much of the current content of the memory cell should be forgotten. Mathematically, the LSTM architecture is defined as: $^{5}$

$$
\begin{array}{rl} s_{j} & = R_{\mathrm{LSTM}}(s_{j - 1}, x_{j}) =[c_{j}; h_{j}] \\ & \quad c_{j} = f \odot c_{j - 1} + i \odot z \\ & \quad h_{j} = o \odot \tanh(c_{j}) \\ & \quad i = \sigma(x_{j} W^{xi} + h_{j - 1} W^{hi}) \\ & \quad f = \sigma(x_{j} W^{xf} + h_{j - 1} W^{hf}) \\ & \quad o = \sigma(x_{j} W^{xo} + h_{j - 1} W^{ho}) \\ & \quad z = \tanh(x_{j} W^{xz} + h_{j - 1} W^{hz}) \end{array}\tag{15.4}
$$

$$
\mathbf{y}_{j} = O_{\mathrm{LSTM}}(s_{j}) = \mathbf{h}_{j}
$$

$$
s_{j} \in \mathbb{R}^{2 \cdot d_{h}}, x_{i} \in \mathbb{R}^{d_{x}}, c_{j}, h_{j}, i, f, o, z \in \mathbb{R}^{d_{h}}, W^{x \circ} \in \mathbb{R}^{d_{x} \times d_{h}}, W^{h \circ} \in \mathbb{R}^{d_{h} \times d_{h}}.
$$

The state at time j is composed of two vectors, $c_{j}$ and $h_{j}$ , where $c_{j}$ is the memory component and $h_{j}$ is the hidden state component. There are three gates, i, f, and o, controlling for input, forget, and output. The gate values are computed based on linear combinations of the current input $x_{j}$ and the previous state $h_{j-1}$ , passed through a sigmoid activation function. An update candidate z is computed as a linear combination of $x_{j}$ and $h_{j-1}$ , passed through a tanh activation function. The memory $c_{j}$ is then updated: the forget gate controls how much of the previous memory to keep ( $f \odot c_{j-1}$ ), and the input gate controls how much of the proposed update to keep ( $i \odot z$ ). Finally, the value of $h_{j}$ (which is also the output $y_{j}$ ) is determined based on the content of the memory $c_{j}$ , passed through a tanh nonlinearity and controlled by the output gate. The gating mechanisms allow for gradients related to the memory part $c_{j}$ to stay high across very long time ranges.

For further discussion on the LSTM architecture see the Ph.D. thesis by Alex Graves [2008], as well as Chris Olah's description. $^{6}$ For an analysis of the behavior of an LSTM when used as a character-level language model, see Karpathy et al. [2015].

The vanishing gradients problem in Recurrent Neural Networks and its Solution Intuitively, recurrent neural networks can be thought of as very deep feed-forward networks, with shared parameters across different layers. For the Simple-RNN [Equation (15.3)], the gradients then include repeated multiplication of the matrix W, making it very likely for the values to vanish or explode. The gating mechanism mitigate this problem to a large extent by getting rid of this repeated multiplication of a single matrix.

For further discussion of the exploding and vanishing gradient problem in RNNs, see Section 10.7 in Bengio et al. [2016]. For further explanation of the motivation behind the gating mechanism in the LSTM (and the GRU) and its relation to solving the vanishing gradient problem in recurrent neural networks, see Sections 4.2 and 4.3 in the detailed course notes of Cho [2015].

LSTMs are currently the most successful type of RNN architecture, and they are responsible for many state-of-the-art sequence modeling results. The main competitor of the LSTM-RNN is the GRU, to be discussed next.

Practical Considerations When training LSTM networks, Jozetówicz et al. [2015] strongly recommend to always initialize the bias term of the forget gate to be close to one.

## 15.3.2 GRU

The LSTM architecture is very effective, but also quite complicated. The complexity of the system makes it hard to analyze, and also computationally expensive to work with. The gated recurrent unit (GRU) was recently introduced by Cho et al. [2014b] as an alternative to the LSTM. It was subsequently shown by Chung et al. [2014] to perform comparably to the LSTM on several (non textual) datasets.

Like the LSTM, the GRU is also based on a gating mechanism, but with substantially fewer gates and without a separate memory component.

$$
\begin{array}{rl} s_{j} & = R_{\mathrm{GRU}}(s_{j - 1}, x_{j}) =(1 - z) \odot s_{j - 1} + z \odot \tilde{s_{j}} \\ & \quad z = \sigma(x_{j} W^{xz} + s_{j - 1} W^{sz}) \\ & \quad r = \sigma(x_{j} W^{xr} + s_{j - 1} W^{sr}) \\ & \quad \tilde{s_{j}} = \tanh(x_{j} W^{xs} +(r \odot s_{j - 1}) W^{sg}) \end{array}\tag{15.5}
$$

$$
y_{j} = O_{\mathrm{GRU}}(s_{j}) = s_{j}
$$

$$
\boldsymbol{s}_{\boldsymbol{j}}, \tilde{\boldsymbol{s}}_{\boldsymbol{j}} \in \mathbb{R}^{d_{s}}, \boldsymbol{x}_{\boldsymbol{i}} \in \mathbb{R}^{d_{x}}, \boldsymbol{z}, \boldsymbol{r} \in \mathbb{R}^{d_{s}}, \boldsymbol{W}^{\boldsymbol{x} \circ} \in \mathbb{R}^{d_{x} \times d_{s}}, \boldsymbol{W}^{\boldsymbol{s} \circ} \in \mathbb{R}^{d_{s} \times d_{s}}.
$$

One gate $(r)$ is used to control access to the previous state $s_{j-1}$ and compute a proposed update $\tilde{s}_{j}$ . The updated state $s_{j}$ (which also serves as the output $y_{j}$ ) is then determined based on an interpolation of the previous state $s_{j-1}$ and the proposal $\tilde{s}_{j}$ , where the proportions of the interpolation are controlled using the gate z. $^{7}$

The GRU was shown to be effective in language modeling and machine translation. However, the jury is still out between the GRU, the LSTM and possible alternative RNN architectures, and the subject is actively researched. For an empirical exploration of the GRU and the LSTM architectures, see Jozefowicz et al. [2015].

## 15.4 OTHER VARIANTS

Improvements to non-gated architectures The gated architectures of the LSTM and the GRU help in alleviating the vanishing gradients problem of the Simple RNN, and allow these RNNs to capture dependencies that span long time ranges. Some researchers explore simpler architectures than the LSTM and the GRU for achieving similar benefits.

Mikolov et al. [2014] observed that the matrix multiplication $s_{i-1}W^{s}$ coupled with the nonlinearity g in the update rule R of the Simple RNN causes the state vector $s_{i}$ to undergo large changes at each time step, prohibiting it from remembering information over long time periods. They propose to split the state vector $s_{i}$ into a slow changing component $c_{i}$ (“context units”) and a fast changing component $h_{i}$ .⁸ The slow changing component $c_{i}$ is updated according to a linear interpolation of the input and the previous component: $c_{i} =(1 - \alpha)x_{i}W^{x1} + \alpha c_{i-1}$ , where $\alpha \in(0,1)$ . This update allows $c_{i}$ to accumulate the previous inputs. The fast changing component $h_{i}$ is updated similarly to the Simple RNN update rule, but changed to take $c_{i}$ into account as well:⁹ $h_{i} = \sigma(x_{i}W^{x2} + h_{i-1}W^{h} + c_{i}W^{c})$ . Finally, the output $y_{i}$ is the concatenation of the slow and the fast changing parts of the state: $y_{i} =[c_{i}; h_{i}]$ . Mikolov et al. demonstrate that this architecture provides competitive perplexities to the much more complex LSTM on language modeling tasks.

The approach of Mikolov et al. can be interpreted as constraining the block of the matrix $W^{s}$ in the S-RNN corresponding to $c_{i}$ to be a multiple of the identity matrix (see Mikolov et al. [2014] for the details). Le et al. [2015] propose an even simpler approach: set the activation function of the S-RNN to a ReLU, and initialize the biases b as zeroes and the matrix $W^{s}$ as the identify matrix. This causes an untrained RNN to copy the previous state to the current state, add the effect of the current input $x_{i}$ and set the negative values to zero. After setting this initial bias toward state copying, the training procedure allows $W^{s}$ to change freely. Le et al. demonstrate that this simple modification makes the S-RNN comparable to an LSTM with the same number of parameters on several tasks, including language modeling.

Beyond differential gates. The gating mechanism is an example of adapting concepts from the theory of computation (memory access, logical gates) into differentiable—and hence gradient-trainable—systems. There is considerable research interest in creating neural network architectures to simulate and implement further computational mechanisms, allowing better and more fine grained control. One such example is the work on a differentiable stack [Grefenstette et al., 2015] in which a stack structure with push and pop operations is controlled using an end-to-end differentiable network, and the neural turing machine [Graves et al., 2014] which allows read and write access to content-addressable memory, again, in a differentiable system. While these efforts are yet to result in robust and general-purpose architectures that can be used in non-toy language processing applications, they are well worth keeping an eye on.

## 15.5 DROPOUT IN RNNS

Applying dropout to RNNs can be a bit tricky, as dropping different dimensions at different time steps harms the ability of the RNN to carry informative signals across time. This prompted Pham et al. [2013], Zaremba et al. [2014] to suggest applying dropout only on the non-recurrent connection, i.e., only to apply it between layers in deep-RNNs and not between sequence positions.

More recently, following a variational analysis of the RNN architecture, Gal [2015] suggests applying dropout to all the components of the RNN (both recurrent and non-recurrent), but crucially retain the same dropout mask across time steps. That is, the dropout masks are sampled once per sequence, and not once per time step. Figure 15.2 contrasts this form of dropout (“variational RNN”) with the architecture proposed by Pham et al. [2013], Zaremba et al. [2014].

The variational RNN dropout method of Gal is the current best-practice for applying dropout in RNNs.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/1bd94e23f894abc7179b1ba2a1377b4abdb0c7856b0ae7a7e3e992926446080e.jpg)  
(a) Naive dropout RNN

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/neural-network-methods-nlp/parts/part-002-pages-201-316/images/37968476865afbef4b75609b8a3c551f9edff8758f6dd53cd2699d8f34c898e5.jpg)  
(b) Variational RNN

Figure 15.2: Gal's proposal for RNN dropout (b), vs. the previous suggestion by Pham et al. [2013], Zareimba et al. [2014] (a). Figure from Gal [2015], used with permission. Each square represents an RNN unit, with horizontal arrows representing time dependence (recurrent connections). Vertical arrows represent the input and output to each RNN unit. Colored connections represent dropped-out inputs, with different colors corresponding to different dropout masks. Dashed lines correspond to standard connections with no dropout. Previous techniques (naive dropout, left) use different masks at different time steps, with no dropout on the recurrent layers. Gal's proposed technique (Variational RNN, right) uses the same dropout mask at each time step, including the recurrent layers.


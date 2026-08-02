# Pre-Examination Checklist and Extension Plan

This chapter is an execution manual rather than a new theory chapter. It compresses the official syllabus, the theoretical closure in [[02-primer|Theoretical Foundations]], and the worked solutions for [[03-2025-spring|Spring 2025]]--[[05-2026-spring|Spring 2026]] into a pre-examination workflow: verify coverage, run the four closed-book checklists, and feed mistakes back into the relevant theory or problem chapter.

**Sources.** The route is based on the AI PhD Qualifying Examination syllabus [@qzc-ai-syllabus-2026], the three public papers [@qzc-ai-2025-spring; @qzc-ai-2025-fall; @qzc-ai-2026-spring], and [[02-primer|Theoretical Foundations]].

For the blue concept words in this chapter, you can jump directly back to the definition, derivation or comparison table in Chapter [[02-primer|Theoretical Foundations]]. If a checklist item can only be linked to a concept name without deriving the background, Chapter 3 should be added as a C0 tag instead of stuffing the background into Chapter 7. 

## Usage principles

Two mistakes are most likely to occur when reviewing before exams: one is just memorizing formulas without explaining where they come from; the other is only looking at answers to past-exam questions without forming a transferable template. This chapter uses three criteria for determination. 

1. Able to write down objects, assumptions, formulas and derivation skeletons in a closed book. 

2. Can map each test point to at least one open question or one possible question type. 

3. Be able to judge after making a wrong question whether to make up the [[02-primer|Theoretical Foundations]] chapter, the past-exam question chapter, or just to calculate proficiency. 

Each item is self-assessed in three levels: $0$ means only recognizing nouns; $1$ means being able to recite definitions or formulas; $2$ means being able to independently complete derivation or design in new questions. In the last round before the exam, only pursue $0\to1$ and high-frequency $1\to2$. Do not apply all low-frequency knowledge points equally. 

## Summary list of syllabus coverage

The following table is used to confirm the route coverage of Chapter 7, and is not a substitute for the teaching content of Chapter [[02-primer|Theoretical Foundations]]. If the self-evaluation of a certain line is lower than $1$, first read back the corresponding section of chapter [[02-primer|Theoretical Foundations]]; if the self-evaluation is $1$ but the past-exam question is still wrong, go back to the chapter [[03-2025-spring|2025 Spring QE-AI past-examination worked solutions]]--[[05-2026-spring|2026 Spring QE-AI past-examination worked solutions]] Chapter redo similar questions. 

| Direction of exam syllabus | Must be mastered in closed book | Review position |
| --- | --- | --- |
| Machine learning theory | [[02-primer#PAC Learning|PAC]]/[[02-primer#Agnostic PAC Learning and Uniform Convergence|agnostic PAC]], [[02-primer#VC dimension, growth function and Sauer's lemma|VC/Sauer]], [[02-primer#Model selection and bias variance|Model selection]], linear/logistic regression, tree, nearest neighbor, [[02-primer#SVM, margin and kernel methods|SVM/core]], [[02-primer#compressed sensing|compressed sensing]] | Chapter [[02-primer|Theoretical Foundations]] Learning theory and classic models; 2025 Spring/Autumn and 2026 Spring Volume A |
| Deep learning and reinforcement learning | MLP/CNN/Transformer, [[02-primer#Backpropagation|Backpropagation]], approximation and generalization, visual tasks, unsupervised learning, [[02-primer#Generative Models|Generative Models]], [[02-primer#Bellman equation|Bellman]]/[[02-primer#Q-learning|Q-learning]]/[[02-primer#Policy gradient and baseline|policy gradient]] | Chapter [[02-primer|Theoretical Foundations]] Deep learning, generative models, RL; three sets of Volume B |
| Optimization methods in artificial intelligence | [[02-primer#Convex sets, convex functions and first-order conditions|Convex set/convex function]], subderivatives, GD/[[02-primer#GD, SGD and stochastic coordinate descent|SGD]]/random coordinate descent, momentum, adaptive learning rate, [[02-primer#Proximal Operators and Composite Optimization|prox recursion]] | Chapter [[02-primer|Theoretical Foundations]] optimization; three sets of C volumes |
| Natural language processing | [[02-primer#statistical language model|statistical modeling]], [[02-primer#Word2vec, GloVe and embedding|Word2vec]], [[02-primer#Transformer self-attention|self-attention]], [[02-primer#LLM pre-training, instruction fine-tuning and alignment|Pre-training alignment]], [[02-primer#Scaling Law|scaling law]], [[02-primer#Embedding knowledge base reasoning, RAG and MLN|embedding knowledge base reasoning]] | Chapter [[02-primer|Theoretical Foundations]] NLP/LLM; three sets of D volumes |

## machine learning theory

**Source location:** This section corresponds to the syllabus Machine Learning Theory. Basic theory review [@shalev2014uml; @mohri2018foundations], compressed sensing review [@candes2006compressive]. 

##### Closed book self-assessment

- can write the $0$-$1$ error fixed at $h$ as a Bernoulli average, and quickly obtain the mean, variance, and Hoeffding/Chernoff type bounds for review [[02-primer#PAC Learning|Derivation of PAC concentration bound]]. 

- distinguishes realizable PAC from [[02-primer#Agnostic PAC Learning and Uniform Convergence|agnostic PAC]]: the former looks for the zero training error hypothesis, the latter competes with $\inf_{h\in\mathcal{H}}L_{\mathcal{D}}(h)$. 

- Can transition from lumped inequalities with fixed assumptions to finite class union bound, and then to infinite class control of [[02-primer#VC dimension, growth function and Sauer's lemma|VC/Sauer]]. 

- can define shattering, growth function $\tau_{\mathcal{H}}(m)$, [[02-primer#VC dimension, growth function and Sauer's lemma|VC dimension]], and use Sauer's lemma to explain the relationship between sample complexity and VC dimension. 

- can find the VC dimension of a one-dimensional geometric class: first construct the shatter lower bound, and then find an unachievable pattern as the upper bound. 

- can explain [[02-primer#Model selection and bias variance|approximation error, estimation error, bias squared and variance in model selection]]. 

- can derive the normal equation of linear regression, first-order conditions of ridge regression, negative log likelihood and gradient of logistic regression. 

- Can explain why the information gain or Gini index of a decision tree may overfit, and how pruning or validation sets can control complexity. 

- can compare the bias-variance and distance scale sensitivity of $1$-NN and $k$-NN. 

- Can write primal, hinge loss, dual variable intuition and kernel PSD conditions of [[02-primer#SVM, margin and kernel methods|hard/soft margin SVM]]. 

- can explain why sparsity, underdetermined measurement, $\ell_1$ relaxation and RIP in [[02-primer#compressed sensing|compressed sensing]] are related. 

##### derivation template

Learning theory questions usually do not ask "do you remember the conclusion?", but ask whether the probability boundary can be extended from a single object to an entire class. The most commonly used template is: 

$$
\text{fixed } h
  \Longrightarrow
  \text{concentration inequality}
  \Longrightarrow
  \text{union bound}
  \Longrightarrow
  \text{growth-function or complexity bound}.
$$

 where $h\in\mathcal{H}$ is the hypothesis, $\mathcal{H}$ is the hypothesis class, and $m$ is the sample size. If the question contains agnostic PAC, three lines of ERM proof must be added: 

$$
L_{\mathcal{D}}(h_S)
  \le
  L_S(h_S)+\varepsilon
  \le
  L_S(h^*)+\varepsilon
  \le
  L_{\mathcal{D}}(h^*)+2\varepsilon.
$$

Here $h_S$ is the ERM output, $h^*\in\operatorname*{arg\,min}_{h\in\mathcal{H}}L_{\mathcal{D}}(h)$. The first and third steps come from uniform convergence and the second step comes from the ERM definition. 

##### Common points lost

- Only write Hoeffding, do not write [[02-primer#PAC Learning|union bound]] for $\mathcal{H}$. 

- Equivalent [[02-primer#VC dimension, growth function and Sauer's lemma|VC dimension]] to the number of parameters without specifying shattering. 

- Forget [[02-primer#Agnostic PAC Learning and Uniform Convergence|agnostic situation]] to compete with the best within the class, rather than compete directly with the Bayes rule. 

- [[02-primer#SVM, margin and kernel methods|SVM dual]] only writes the kernel trick and does not check whether the kernel is symmetric positive semidefinite. 

- [[02-primer#compressed sensing|compressed sensing]] The question only says "a small amount of measurements can be recovered", but it does not explain that sparsity and RIP are the conditions for recovery guarantee. 

## Deep learning and reinforcement learning

**Source location:** This section corresponds to the syllabus Advanced Deep Learning. Neural Networks and Generative Models Review [@goodfellow2016deep; @bishop2023deep; @bishop2006prml], Vision Tasks Review [@szeliski2022vision], Reinforcement Learning Review [@sutton2018rl]. 

##### Closed book self-assessment

- Can write the input, output, parameter amount and loss function of MLP, CNN, [[02-primer#Transformer self-attention|Transformer]]. 

- Can derive the chain rule form of [[02-primer#Backpropagation|backprop]] and explain why the complexity is of the same order as forward. 

- Gradient path that can explain sigmoid saturation, ReLU death, batch normalization training/test statistics difference, and residual connection. 

- Can distinguish approximation ability, optimization reachability and generalization ability; will not regard universal approximation as a generalization theorem. 

- It can distinguish feature extraction, image restoration, 3D reconstruction, optical flow estimation, recognition and segmentation according to the output object. 

- Can write the positive and negative sample structures of autoencoder reconstruction goals and contrastive learning/InfoNCE. 

- Can explain what questions implicit regularization, transfer learning and meta-learning answer respectively. 

- can write [[02-primer#Normalizing flow|normalizing flow's change-of-variables log-likelihood]]. 

 - Core training signal that can write [[02-primer#VAE|VAE ELBO]], GAN minimax target, DDPM or [[02-primer#Diffusion and score|score-based diffusion]]. 

- can write [[02-primer#MDP, return and value functions|MDP quintuple]], [[02-primer#Bellman equation|Bellman equation]], [[02-primer#Q-learning|Q-learning updates]] and [[02-primer#Policy gradient and baseline|policy gradient theorem]]. 

- can explain why baseline does not change the expectations of [[02-primer#Policy gradient and baseline|policy gradient]]. 

##### Generative Models comparison template

The generated model comparison questions prioritize comparison by mathematical objects, rather than by "good or bad effect". 

| Model | Optimization object | Advantages | Main risks |
| --- | --- | --- | --- |
| Flow | [[02-primer#Normalizing flow|Explicit likelihood and Jacobian determinant]] | Exact density | Reversible structural restriction expression | [[02-primer#VAE|ELBO, approximate posterior and prior matching]] | Clear probability map, sampleable | posterior collapse, sample blur |
| GAN | minimax game of generator and discriminator | sharp sample | unstable training, mode collapse, no explicit likelihood |
| Diffusion | [[02-primer#Diffusion and score|Multi-step denoising or score matching]] | Stable training, high quality | High sampling cost, dependent on noise schedule |

##### RL derivation template

[[02-primer#MDP, return and value functions|RL questions]] First define the state $s\in\mathcal{S}$, action $a\in\mathcal{A}$, strategy $\pi_\theta(a\mid s)$, reward $r(s,a)$ and discount factor $\gamma\in[0,1)$. If you ask about value function, first write [[02-primer#Bellman equation|Bellman decomposition]]; if you ask about policy gradient, first write [[02-primer#Policy gradient and baseline|The log-derivative trick of trajectory likelihood]]. 

$$
\nabla_\theta J(\theta)
  =
  \mathbb{E}_{\tau\sim\pi_\theta}
  \left[
    R(\tau)
    \sum_t
    \nabla_\theta\log \pi_\theta(a_t\mid s_t)
  \right].
$$

where $\tau$ is the trajectory and $R(\tau)$ is the trajectory return. baseline $b(s_t)$ can reduce variance because 

$$
\mathbb{E}_{a_t\sim\pi_\theta(\cdot\mid s_t)}
  \left[
    b(s_t)\nabla_\theta\log \pi_\theta(a_t\mid s_t)
  \right]
  =
  b(s_t)\nabla_\theta
  \sum_{a_t}\pi_\theta(a_t\mid s_t)
  =
  0.
$$

##### Common points lost

- Write [[02-primer#Backpropagation|backprop]] as a slogan instead of [[02-primer#Backpropagation|Local Jacobian or adjoint recursion]]. 

- Only says that Transformer can be parallelized, not . 

- [[02-primer#VAE|VAE/ELBO]], [[02-primer#Normalizing flow|flow likelihood]], [[02-primer#Diffusion and score|diffusion score matching]] mixed symbols. 

- [[02-primer#MDP, return and value functions|RL questions]] forgot to explain the strategy, transfer, reward and discount factor, resulting in [[02-primer#Bellman equation|Bellman equation]] without a domain. 

- [[02-primer#LLM preference alignment|DPO/RLHF]] The question only memorizes the name and does not explain the role of preference data, reference policy or KL regularization. 

## Optimization method

**Source location:** This section corresponds to the syllabus Optimization Methods for AI. Convex optimization and first-order method review [@nesterov2018convex; @beck2017first], SGD and learning theory interface review [@shalev2014uml]. 

##### Closed book self-assessment

- can write [[02-primer#Convex sets, convex functions and first-order conditions|Convex set, convex function]], [[02-primer#Smoothness, strong convexity and the descent lemma|$L$-smooth, $\mu$-strong convex]], subdifferential, [[02-primer#Proximal Operators and Composite Optimization|proximal operator]] definition. 

- can deduce the global optimality of convex functions from [[02-primer#Convex sets, convex functions and first-order conditions|first-order conditions]]. 

- Can write Fermat rule $0\in\partial f(x^*)$, sum rule and affine compound rules. 

- can use [[02-primer#Smoothness, strong convexity and the descent lemma|descent lemma]] to push the descent inequality of GD. 

- can use [[02-primer#Smoothness, strong convexity and the descent lemma|Strong convexity and smoothness]] to get gradient map shrinkage or linear convergence. 

- can infer fixed point from [[02-primer#Proximal Operators and Composite Optimization|prox optimality]]. 

- One-step inequality can be derived using [[02-primer#Proximal Optimality, Monotonicity, and Nonexpansiveness|prox nonexpansiveness]]. 

- Ability to expand variance decomposition under conditional expectations, identifying zero-mean noise with zero cross terms. 

- can explain the noise floor of constant step size [[02-primer#GD, SGD and stochastic coordinate descent|SGD]], and how minibatch/importance sampling reduces the variance or expected smoothness constant. 

- Can write the state variables of momentum, Nesterov acceleration, AdaGrad, and Adam, and explain which part of the update they changed respectively. 

##### prox question core chain

If the target is 

$$
\min_{x\in\mathbb{R}^d}
  F(x)=f(x)+R(x),
$$

 among which $f$ is smooth and $R$ Convex but possibly non-differentiable, a step of [[02-primer#Proximal Operators and Composite Optimization|proximal gradient]] is 

$$
x_{k+1}
  =
  \operatorname{prox}_{\gamma R}(x_k-\gamma g_k),
$$

 where $\gamma>0$ is the step size and $g_k$ is the gradient or stochastic gradient estimate. The optimal point $x^*$ satisfies 

$$
x^*
  =
  \operatorname{prox}_{\gamma R}(x^*-\gamma\nabla f(x^*)).
$$

The exam derivation generally follows the following chain, where a complete proof of Proximal Optimality, Monotonicity, and Nonexpansiveness is reviewed [[02-primer#Proximal Optimality, Monotonicity, and Nonexpansiveness|Chapter 3 prox nonexpansiveness derivation]]. 

$$
\text{proximal optimality condition}
  \Longrightarrow
  \text{fixed point}
  \Longrightarrow
  \text{nonexpansiveness}
  \Longrightarrow
  \text{squared-distance recursion}
  \Longrightarrow
  \text{convergence rate or noise floor}.
$$

##### Common points lost

- put [[02-primer#Smoothness, strong convexity and the descent lemma|$L$-smooth and $\mu$-strong convex]] Write the opposite direction of the inequality. 

- Only write [[02-primer#Proximal Operators and Composite Optimization|prox definition]], do not write the corresponding [[02-primer#Proximal Optimality, Monotonicity, and Nonexpansiveness|optimality conditions]]. 

- [[02-primer#GD, SGD and stochastic coordinate descent|stochastic gradient problem]] does not distinguish between conditional expectation and total expectation. 

- Omit the error lower bound provided by [[02-primer#Smoothness, strong convexity and the descent lemma|Strong convexity]] when proving the convergence rate. 

- Adam/AdaGrad questions only write the name, do not write the first-order moment, second-order moment or cumulative gradient variable. 

## natural language processing

**Source location:** This section corresponds to the syllabus Natural Language Understanding. Statistical language model, embedding, Transformer, LLM and RAG review [@jurafsky2026slp; @goldberg2017nnnlp; @vaswani2017attention; @kaplan2020scaling; @hoffmann2022training; @lewis2020rag; @rafailov2023dpo]. 

##### Closed book self-assessment

- Able to write the basic forms of [[02-primer#statistical language model|$n$-gram MLE]], Markov hypothesis, and backoff/interpolation smoothing. 

- Can compare the data signal, objective function and inductive bias of GloVe, [[02-primer#Word2vec, GloVe and embedding|Skip-gram]], Node2Vec, and TransE. 

- can promote the [[02-primer#Word2vec, GloVe and embedding|Word2vec skip-gram or negative sampling]] goal, and explain the semantic origin of embedding. 

- can write [[02-primer#Transformer self-attention|$Q,K,V$ formula for self-attention]], indicating the matrix dimensions and $1/\sqrt{d_k}$ scaling. 

- can explain causal mask, long context attention mask, time complexity and memory complexity. 

- can explain the advantages and risks of top-$p$ compared to greedy, beam, top-$k$. 

- Can write the target differences of [[02-primer#LLM pre-training, instruction fine-tuning and alignment|next-token pretraining, SFT]], [[02-primer#LLM preference alignment|RLHF, DPO]]. 

- can explain the empirical power law form and compute-optimal trade-off of [[02-primer#Scaling Law|scaling law]]. 

- can write supervised LDA or [[02-primer#Embedding knowledge base reasoning, RAG and MLN|joint/log-linear probability of MLN]]. 

- can split [[02-primer#Embedding knowledge base reasoning, RAG and MLN|RAG/memory system]] into a closed loop of writing, retrieval, rearrangement, generation, reference verification and evaluation. 

##### Minimum answer to attention question

 is given as input $X\in\mathbb{R}^{N\times d_{\mathrm{model}}}$, where $N$ is the number of tokens and $d_{\mathrm{model}}$ is the hidden dimension. Full definition and scaling motivation lookback [[02-primer#Transformer self-attention|Transformer self-attention]]. Let 

$$
Q=XW_Q,\qquad
  K=XW_K,\qquad
  V=XW_V.
$$

if $Q,K\in\mathbb{R}^{N\times d_k}$, $V\in\mathbb{R}^{N\times d_v}$, then the scaled dot-product attention is 

$$
\operatorname{Attention}(Q,K,V)
  =
  \operatorname{softmax}\left(\frac{QK^\top}{\sqrt{d_k}}\right)V.
$$

here $QK^\top\in\mathbb{R}^{N\times N}$ is the similarity matrix between tokens. The motivation for dividing by $\sqrt{d_k}$ is to keep the dot product variance constant and avoid premature saturation of softmax [@vaswani2017attention]. 

##### RAG system question template

[[02-primer#Embedding knowledge base reasoning, RAG and MLN|RAG]] The question should not just write "add a vector database". The minimum reliable closed loop is: 

1. Write: clean the document, divide it into chunks, record the source, time, permissions and version. 

2. Retrieval: Use embedding to recall candidate blocks and retain the interface of query rewriting or hybrid search. 

3. Rearrange: Use cross-encoder, rules or multi-channel signals to filter out noise blocks. 

4. Generation: Organize evidence blocks and task instructions into prompts, and restrict the model from fabricating references. 

5. Verification: Check whether the claim in the answer is supported by the retrieved evidence. 

6. Evaluation: Look at recall, faithfulness, answer quality, latency and cost respectively. 

##### Common points lost

- [[02-primer#statistical language model|$n$-gram]] The question only writes the frequency, and does not explain the smooth solution of unseen events. 

- [[02-primer#Word2vec, GloVe and embedding|Word2vec]] The question only says "similar words are close" and does not write about the prediction context or negative sampling target. 

- [[02-primer#Transformer self-attention|attention]] The matrix dimension is omitted in the question, causing the complexity explanation to be uncheckable. 

- [[02-primer#Scaling Law|Scaling law]] The question writes empirical laws as strict theorems without explaining the conditions of data, model and compute. 

- [[02-primer#Embedding knowledge base reasoning, RAG and MLN|RAG]] questions have no error patterns: retrieval failure, retrieval noise, context pollution, reference infidelity, permission leakage. 

## Three rounds of review routes

##### Round 1: Theoretical Closure

The goal is to read Chapter [[02-primer|Theoretical Foundations]] into a callable formula library. At the end of each section, use a card to write down four things: question motivation, core object, derivation entrance, and exam reminder. If only nouns can be written on a certain card, it means that it has not been truly mastered. 

| Stage | Task | Exit Criteria |
| --- | --- | --- |
| T-21 to T-15 | Read through Chapter [[02-primer|Theoretical Foundations]] and create formula cards according to four courses | Each course can write at least 8 core objects and 4 derivation entries in closed book |
| T-14 to T-8 | Redo three sets of open papers, write skeleton without looking at the answers | Each question can be linked to the specific concept of chapter [[02-primer|Theoretical Foundations]] or marked as a new gap |
| T-7 to T-3 | Only deal with wrong questions and $0/1$ Self-assessment items | Each wrong question has a reason label and a write-back position |
| T-2 to T-1 | Do a round of time-limited simulation and formula dictation | No longer add large sections of theory, only revise symbols, boundary conditions and common score points |

##### Round 2: Closed loop of past-exam questions

Each past-exam question will be redone according to the following structure: 

1. Write down the meaning of the question without looking at the answer: which course it belongs to, what type of question it is, and which tool to use in Chapter [[02-primer|Theoretical Foundations]]. 

2. Write the minimum solution skeleton: object, hypothesis, goal, key inequality or objective function. 

3. Refer to the solution in this book and mark the missing derivation steps. 

4. Classify missing steps as conceptual gaps, algebraic gaps, symbolic gaps, time management gaps, or misunderstandings of the question. 

5. Write back to the margin note of Chapter [[02-primer|Theoretical Foundations]] or your own mistakes. 

##### Round 3: Compressed output

The last round only trains outputability. Prepare one page for each course, including: 

- the five object definitions that are most likely to be tested; 

- the three derivation templates that are most likely to be tested; 

- the three most common symbol errors; 

- Two transferable system design frameworks; 

- a fallback strategy when encountering unfamiliar problems. 

## Error account and incremental generation route

Each wrong question must have a reason label. Wrong questions without labels will only become "read the answer again" and will not form an increment. 

| Tag | Meaning | Incremental action |
| --- | --- | --- |
| C0 | In the official syllabus, but Chapter [[02-primer|Theoretical Foundations]] is not explained clearly | Supplementary theoretical chapter: motivation, definition, derivation, citation, exam reminder |
| C1 | There is a theoretical chapter, but it will not be called in the past-exam questions | Add calling templates and links to adjacent past-exam questions in Chapter 7 or the wrong question account |
| C2 | Know the formulas but the derivation is broken | Fill in the intermediate algebra steps and indicate the theorem or hypothesis used in each step |
| C3 | Wrong symbols or dimensions | Update the symbol convention and add dimension tables or variable definition sentences |
| source, and then decide to supplement theoretical chapter, past-exam question chapter or appendix |
| C5 | System design question output is incomplete | Add pipeline, failure modes, evaluation metrics and trade-offs |

Follow the principle of minimal changes when incrementally generating: 

1. Add official PDF, web link and extracted text, and do not cover the old volume. 

2. Add a new year chapter and maintain the format of "question meaning + answer + exam reminder". 

3. If the new question introduces new knowledge points, give priority to completing the [[02-primer|Theoretical Foundations]] chapter instead of repeating large sections of background in the solution. 

4. If there are only changes in common question types, give priority to completing this chapter’s checklist or wrong question labels. 

5. Compile PDF after each modification, checking page count, table of contents, citations, logs and PDF text extraction. 

6. For ambiguous questions, retain strict mathematical conclusions and interpretation of the test context, and avoid writing guesses into theorems. 

## Forty-eight hours before the exam

The last two days are not suitable for large-scale learning of new materials, only controllable repairs. 

- Rewrite the six skeletons: [[02-primer#VC dimension, growth function and Sauer's lemma|PAC/VC]], [[02-primer#Proximal Operators and Composite Optimization|prox]]-[[02-primer#GD, SGD and stochastic coordinate descent|SGD]], [[02-primer#Diffusion and score|diffusion]]/[[02-primer#VAE|ELBO]], [[02-primer#Policy gradient and baseline|policy gradient]], [[02-primer#Transformer self-attention|self-attention]], [[02-primer#Embedding knowledge base reasoning, RAG and MLN|RAG/MLN]]. 

- Pick one wrong question in each class and redo it within a time limit. If you still have no skeleton after fifteen minutes, go back to the corresponding section of Chapter [[02-primer|Theoretical Foundations]]. 

 - Checks all common symbols: sample size $m$, dimensions $d$, sequence length $N$, hypothesis class $\mathcal{H}$, distribution $\mathcal{D}$, parameters $\theta$. 

- Practice rewriting "I know" into "I can prove": each conclusion states at least one hypothesis and one derivation entry. 

- System questions only remember the template: input, module, objective function or scoring, failure modes, evaluation. 

** test center. ** The passing criterion for Chapter 7 is not "finishing it all", but being able to expand any checklist item into a scorable answer in a closed-book state. If you can only name concepts, go back to chapter [[02-primer|Theoretical Foundations]]; if you can theory but can't formulate questions, go back to chapters [[03-2025-spring|2025 Spring QE-AI past-examination worked solutions]]--[[05-2026-spring|2026 Spring QE-AI past-examination worked solutions]]; if you repeatedly make mistakes in similar questions, revise the book incrementally with the C0--C5 tags. 

# QIUZHEN QUALIFY EXAM FOR ARTIFICIAL INTELLIGENCESPRING 2025

## Instructions

• This exam consists of four sections, each with a total of 33 points. You are required to choose three out of the four sections and answer the questions in the selected sections. You will earn an additional point for writing your name and student ID number on your answer sheet. The maximum possible score you can achieve is 100.

• Please clearly indicate your section choices at the very beginning of your answer sheet. If you answer questions in more than three sections, only the first three sections will be graded.

## A. Machine Learning Theory

1. [7 pts.] Let $\mathcal { H }$ be a class of binary classifiers over a domain X . Let D be an unknown distribution over $x ,$ and let $f$ be the target hypothesis in H. Fix some $h \in \mathcal H$ . Show that the variance of the empirical loss $L _ { S } ( h )$ , over all possible samples $S$ of size m drawn from $\mathcal { D } _ { \mathrm { : } }$ is inversely proportional to $m$ . That is, show the following relationship:

$$
\operatorname * {V a r} _ {S | x \sim D ^ {m}} \bigl [ L _ {S} (h) \bigr ] \propto \frac {1}{m}.
$$

More specifically, prove the exact expression:

$$
\operatorname * {V a r} _ {S | x \sim D ^ {m}} \bigl [ L _ {S} (h) \bigr ] = \frac {L _ {\mathcal {D} , f} (h) \cdot (1 - L _ {\mathcal {D} , f} (h))}{m}.
$$

2. [7 pts.] Let X be a domain, and let $\mathcal { D } _ { 1 } , \mathcal { D } _ { 2 } , \ldots , \mathcal { D } _ { m }$ be a sequence of distributions over $\mathcal { X }$ . Let H be a finite class of binary classifiers over $x ,$ and let $f \in \mathcal H$ . Suppose we obtain a sample $S = \{ ( x _ { 1 } , y _ { 1 } ) , . . . , ( x _ { m } , y _ { m } ) \}$ , where the i−th instance $x _ { i }$ is sampled from $\mathcal { D } _ { i } .$ , and $y _ { i } = f ( x _ { i } )$ Let $\overline { { \mathcal { D } } } _ { m }$ denote the average as:

$$
\overline {{\mathcal {D}}} _ {m} = \frac {\mathcal {D} _ {1} + \cdots + \mathcal {D} _ {m}}{m}.
$$

Fix an accuracy parameter $\textstyle \epsilon = { \frac { 1 } { 4 } }$ . Show that

$$
\mathbb {P} \left[ \exists h \in \mathcal {H} \text { s.t. } L _ {(\overline {{\mathcal {D}}} _ {m, f})} (h) > \epsilon \text { and } L _ {(S, f)} (h) = 0 \right] \leq | \mathcal {H} | e ^ {\frac {- m}{4}}.
$$

Hint: $\ln \left( { \frac { 3 } { 4 } } \right) < - { \frac { 1 } { 4 } }$

3. [9 pts.] Let H and $H ^ { \prime }$ be two families of functions mapping from X to {0, 1} with finite VC dimensions.

(a) [5 pts.] Show that

$$
\operatorname{VCdim} \left(H \cup H ^ {\prime}\right) \leqslant \operatorname{VCdim} (H) + \operatorname{VCdim} \left(H ^ {\prime}\right) + 1.
$$

(b) [4 pts.] Use this to determine the VC dimension of the hypothesis set formed by the union of axis-aligned rectangles and triangles in dimension 2. You may use the fact that the VC dimension of the hypothesis set formed by the union of triangles in dimension 2 is 7, without any proof.

4. [10 pts.] Prove the following two statements:

(a) [5 pts.] Let D be a distribution. Let $\boldsymbol { S } = \left( z _ { 1 } , \ldots , z _ { m } \right)$ be an $i . i . d .$ sequence of examples. Let A be a learning algorithm that is on-average replace-one stable with rate $\epsilon ( m )$ . Then:

$$
\underset {S \sim D ^ {m}} {\mathbb {E}} \left[ L _ {D} (A (S)) - L _ {S} (A (S)) \right] \leqslant \epsilon (m).
$$

(b) [5 pts.] Let \` be a convex ρ-Lipschitz loss function. The regularised Empirial Risk Minimisation (ERM) satisfies:

$$
\operatorname{E} _ {S} \big [ L _ {\mathcal {D}} (A (S)) \big ] \leqslant L _ {\mathcal {D}} (w ^ {*}) + \lambda \| w ^ {*} \| ^ {2} + \frac {2 \rho^ {2}}{\lambda m},
$$

where

$$
w ^ {*} = \arg \min _ {w \in \mathcal {H}} L _ {\mathcal {D}} (w).
$$

## B. Deep Learning and Reinforcement Learning

1. [18 pts.] Consider a classification problem: the training dataset is given as $\{ ( \mathbf { x } _ { i } , y _ { i } ) \} _ { i = 1 } ^ { N } .$ where $\mathbf { x } _ { i } \in \mathbb { R } ^ { d }$ represents the input features, and $y _ { i } \in \{ 1 , 2 , \ldots , C \}$ represents the class labels. A supervised deep learning pipeline typically includes preparing training data, defining a hypothesis space, designing a training scheme, and optimizing the network. Answer the following questions :

(a) [4 pts.] Define the hypothesis space consisting of all neural networks structured with

• a feature extractor: a multi-layer perceptron (MLP) that maps the inputs to a learned feature representation,

• a classifier: a multi-layer perceptron (MLP) that maps the feature representation to class probabilities.

Please specify the input, output and the parameters for training.

(b) [4 pts.] Specify an appropriate loss function for this classification problem and explain how stochastic gradient descent (SGD) is used to optimize the neural network.

(c) [4 pts.] To stabilize training, batch normalization is often applied. Describe how batch normalization works during the training and testing phase.

(d) $[ \mathrm { 3  p t s . } ]$ If the training error is unsatisfactory, describe what adjustments you can make to improve the expressivity of the neural network. Discuss at least two approaches.

(e) [3 pts.] If the training error is low but the testing error is high, propose strategies to reduce overfitting. Discuss at least two approaches.

2. [15 pts.] Generative models aim to train a neural network generator to produce samples similar to the training data. The forward process of a difusion model progressively adds noise to the data, transforming the data distribution into a normal distribution. The reverse process gradually denoises the data, reverting the normal distribution back to the data distribution. In score-based difusion models, the forward process can be represented as a Stochastic Diferential Equation (SDE). Consider the Variance Preserving (VP) SDE:

$$
d \mathbf {x} = - \frac {1}{2} \beta (t) \mathbf {x} d t + \sqrt {\beta (t)} d \mathbf {W} _ {t},
$$

where $\mathbf { W } _ { t }$ is a standard Wiener process, and $\beta ( t )$ is a time-dependent noise schedule.

(a) [4 pts.] Write down the reverse-time SDE corresponding to the forward process and explain why training the difusion model requires score matching as follows

$$
\min _ {\theta} \mathbb {E} _ {t} \lambda (t) \mathbb {E} _ {\mathbf {x} _ {t}} \| s _ {\theta} (\mathbf {x} _ {t}, t) - \nabla_ {\mathbf {x} _ {t}} \log p _ {t} (\mathbf {x} _ {t}) \| _ {2} ^ {2},
$$

where $\lambda ( t )$ is a weighting function, $s _ { \theta } ( \mathbf { x } _ { t } , t )$ is the neural network to train and $p _ { t }$ is the marginal distribution of $\mathbf { x } _ { t }$

(b) [6 pts.] Prove that

$$
\mathbb {E} _ {\mathbf {x} _ {t}} \| s (\theta , t) - \nabla_ {\mathbf {x} _ {t}} \log p _ {t} (\mathbf {x} _ {t}) \| _ {2} ^ {2} = \mathbb {E} _ {(\mathbf {x} _ {0}, \mathbf {x} _ {t})} \| s _ {\theta} (\mathbf {x} _ {t}, t) - \nabla_ {\mathbf {x} _ {t}} \log p _ {t | 0} (\mathbf {x} _ {t} | \mathbf {x} _ {0}) \| _ {2} ^ {2} + C,
$$

where $C$ is a constant, $p _ { t } ( \mathbf { x } _ { t } )$ is the marginal distribution of $\mathbf { x } _ { t } .$ , and $p _ { t | 0 } ( \mathbf { x } _ { t } | \mathbf { x } _ { 0 } )$ is the conditional distribution of $\mathbf { x } _ { t }$ given the original data $\mathbf { x } _ { \mathrm { 0 } }$

(c) [5 pts.] For the given VP SDE, what is the conditional distribution $p _ { t | 0 } ( \mathbf { x } _ { t } | \mathbf { x } _ { 0 } ) \} .$ Based on this, derive the final denoising score-matching loss function for training score-based difusion models.

## C. Optimization Methods in Artificial Intelligence

Let $f :  { \mathbb { R } ^ { d } } \to  { \mathbb { R } }$ be an L-smooth and µ-strongly convex function. The stochastic gradient is defined as:

$$
g (x, \xi) = \nabla f (x) + \xi ,
$$

where $\xi$ is a zero-mean random variable with $\mathbb { E } [ \lVert \boldsymbol { \xi } \rVert ^ { 2 } ] \leq \sigma ^ { 2 }$ . Consider the SGD method:

$$
x ^ {k + 1} = \operatorname{prox} _ {\gamma R} (x ^ {k} - \gamma g (x ^ {k}, \xi^ {k})),
$$

used to solve the optimization problem:

$$
\min _ {x} f (x) + R (x).
$$

1. [5 pts.] L-Smoothness and µ-Strong Convexity: Provide the definitions of L-smoothness and µ-strong convexity, respectively.

2. [6 pts.] Combining Smoothness and Strong Convexity: Suppose that $f ( x )$ is continuously diferentiable L-smooth and µ-convex.

• Show that $\begin{array} { r } { g ( x ) = f ( x ) - \frac { \mu } { 2 } \| x \| ^ { 2 } } \end{array}$ is continuously diferentiable, convex and $( L - \mu ) \cdot$ smooth.

• Using the fact

$$
\frac {1}{L - \mu} \| \nabla g (x) - \nabla g (y) \| ^ {2} \leq \langle \nabla g (x) - \nabla g (y), x - y \rangle ,
$$

show that

$$
\mu \| x - y \| ^ {2} + \frac {1}{L} \| \nabla f (x) - \nabla f (y) \| ^ {2} \leq \left(1 + \frac {\mu}{L}\right) \langle \nabla f (x) - \nabla f (y), x - y \rangle .
$$

3. [6 pts.] Recurrence Relation: Using the non-expansiveness property of prox and the optimality condition of $\operatorname { p r o x } _ { \gamma R } ,$ , derive the recurrence relation for $\bar { \| \boldsymbol { x } ^ { k + 1 } - \boldsymbol { x } ^ { \star } \| ^ { 2 } }$

$$
\| x ^ {k + 1} - x ^ {\star} \| ^ {2} \leq \| x ^ {k} - x ^ {\star} - \gamma (\nabla f (x ^ {k}) - \nabla f (x ^ {\star}) + \xi^ {k}) \| ^ {2}.
$$

4. [6 pts.] Variance Decomposition: What is variance decomposition? Explain how it is applied to $\| \boldsymbol { x } ^ { k + 1 } - \boldsymbol { x } ^ { \star } \| ^ { 2 }$ , and derive:

$$
\mathbb {E} _ {k} [ \| x ^ {k + 1} - x ^ {\star} \| ^ {2} ] \leq \| x ^ {k} - x ^ {\star} - \gamma (\nabla f (x ^ {k}) - \nabla f (x ^ {\star})) \| ^ {2} + \gamma^ {2} \sigma^ {2},
$$

where $\mathbb { E } _ { k } [ \cdot ]$ denotes the conditional expectation given $\xi ^ { k } , \dots , \xi ^ { 0 }$

5. [5 pts.] Simplified Recurrence: Using the tower property, prove that when $\begin{array} { r } { \gamma = \frac { 2 } { \mu + L } } \end{array}$ , the recurrence simplifies to:

$$
\mathbb {E} [ \| x ^ {k + 1} - x ^ {\star} \| ^ {2} ] \leq (1 - \rho) \mathbb {E} [ \| x ^ {k} - x ^ {\star} \| ^ {2} ] + \gamma^ {2} \sigma^ {2},
$$

where $\begin{array} { r } { \rho = \frac { 4 \mu L } { ( \mu + L ) ^ { 2 } } } \end{array}$

6. [5 pts.] Complexity: Prove that for any desired precision $\varepsilon > 0$ , there exists a step size γ such that:

$$
k \geq \frac {L / \mu + 3}{4} \log {\frac {1}{\varepsilon}}
$$

implies:

$$
\mathbb {E} [ \| x ^ {k} - x ^ {\star} \| ^ {2} ] \leq \varepsilon \| x ^ {0} - x ^ {\star} \| ^ {2} + \frac {\gamma \sigma^ {2}}{\mu}.
$$

## D. Natural Language Processing

## Short Answer Questions on Concepts.

1. [3 pts.] In a trigram language model, how is $p ( w _ { 3 } \mid w _ { 1 } , w _ { 2 } )$ learned from a training corpus? In real-world applications, we may encounter situations where $( w _ { 1 } , w _ { 2 } )$ , or even w<sub>1</sub> or w<sub>2</sub> , do not appear in the training corpus. How can we estimate $p ( w _ { 3 } \mid w _ { 1 } , w _ { 2 } )$ in such cases?

2. [3 pts.]What is the central idea behind representation learning? Which algorithms implement this concept?

3. [3 pts.] Why do current large language models (LLMs) use top-P sampling during inference instead of greedy or beam search? Additionally, why is top-P sampling considered superior to other methods, such as top-K sampling?

4. [3 pts.] List several key points that contribute to the success of current LLM based approach of Artificial General Intelligence and explain their importance.

5. [3 pts.] Identify at least two advantages of the Transformer architecture compared to recurrent-based models (e.g., LSTM, GRU) for sequence-to-sequence tasks.

## Questions on Algorithm Analysis.

6. [5 pts.] Explain why the data scaling law, which describes the relationship between performance and sample size, holds true from the perspective of statistical learning. Please provide a detailed analysis process, avoiding overly simplistic assumptions (such as assuming the data follows a Gaussian distribution).

7. [5 pts.] We are implementing the Reinforcement Learning with Human Feedback (RLHF) procedure to train a Large Language Model (LLM). Assuming that a reward model has already been trained, explain how reinforcement learning is used to align the model with human preferences. The explanation should include details about data usage, the reinforcement learning loss function, and the gradient of the loss.

## Questions on Applied System Design.

8. [8 pts.] We have a general-purpose Large Language Model (LLM), but it performs poorly on question-answering tasks in a specific problem domain due to a lack of domain-specific knowledge. Although we have collected a large corpus of documents in this domain, we do not have labeled question-answering pairs. Design a system that can accurately answer questions within this domain. You may incorporate additional components, such as embedding models, into the system.
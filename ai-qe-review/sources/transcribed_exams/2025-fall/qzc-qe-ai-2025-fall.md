# QIUZHEN QUALIFY EXAM FOR ARTIFICIAL INTELLIGENCE FALL 2025

## Instructions

• This exam consists of four sections, each with a total of 33 points. You are required to choose three out of the four sections and answer the questions in the selected sections. You will earn an additional point for writing your name and student ID number on your answer sheet. The maximum possible score you can achieve is 100.

• Please clearly indicate your section choices at the very beginning of your answer sheet. If you answer questions in more than three sections, only the first three sections will be graded.

## A. Machine Learning Theory

## Part I: Warm-Up Questions [5 pts. + 1 bonus pts.]

This section contains multiple-choice questions. Please select only one answer for each question. No justification is required.

1. [0.5 pts.] Which of the following best describes the bias–variance tradeof?

(a) Increasing model bias reduces variance but increases approximation error

(b) Increasing model bias reduces both bias and variance

(c) Variance is always independent of bias

(d) The tradeof only applies to neural networks

2. [0.5 pts.] Why does the ‘No Free Lunch’ theorem matter in machine learning?

(a) Every algorithm performs optimally on all data sets

(b) All learning tasks require exponential time

(c) There is no universally superior learning algorithm across all tasks

(d) Only smooth loss functions can be optimised

3. [0.5 pts.] Which of the following is true about Rademacher complexity?

(a) It measures how well a hypothesis class fits random labels

(b) It always equals the VC dimension

(c) It decreases with model complexity

(d) It is independent of sample size

4. [0.5 pts.] In Empirical Risk Minimisation (ERM), what is being minimised?

(a) The true risk on unseen data

(b) The average loss on the training sample

(c) The VC dimension of the hypothesis class

(d) The variance of the hypothesis

5. [1 pts.] Which statement is true about the VC dimension?

(a) A class with infinite VC dimension can never be PAC learnable

(b) The VC dimension of halfspaces in $\mathbb { R } ^ { d }$ is exactly $d + 1$

(c) VC dimension always equals the number of parameters of the hypothesis class

(d) Finite VC dimension implies zero generalisation error

6. [1 pts.] In the agnostic PAC learning model, what changes compared to the realisable PAC model?

(a) The learner must always find a hypothesis with zero training error

(b) The hypothesis class must contain the true labelling function

(c) The goal is to compete with the best hypothesis in the class, even if labels are noisy

(d) The sample complexity becomes independent of 

7. [1 pts.] In stochastic gradient descent (SGD), why does using a decreasing learning rate help?

(a) It avoids overfitting completely

(b) It ensures convergence under certain convexity assumptions

(c) It increases variance in gradient estimates

(d) It eliminates the need for backpropagation

8. [Optional: 1-Points Bonus!] What does Sauer’s Lemma imply about a hypothesis class H with VC-dimension d?

(a) H can shatter any set of size larger than d

(b) The growth function $\tau _ { H } ( m )$ is bounded polynomially in m once $m > d$

(c) The empirical risk minimiser achieves zero risk for $m \leq d$

(d) The sample complexity is independent of d

## Part II: Theoretical Exercises [28 pts.]

This is the main part of the exam. Provide detailed solutions and reasoning for each question. Full marks are awarded only for complete and well-explained answers.

9. [5 pts.] Let H be the class of signed intervals, that is,

$$
\mathcal {H} = \left\{h _ {a, b, s}: a \leq b, s \in \{- 1, 1 \} \right\},
$$

where

$$
h _ {a, b, s} (x) = \left\{ \begin{array}{l l} s & \text { if } x \in [ a, b ] \\ - s & \text { if } x \notin [ a, b ] \end{array} \right..
$$

Calculate VCdim(H).

## 10. [6 pts.] Lemma – show it holds. Strong Convexity Properties. Show the following holds.

Let $f : \mathbb { R } ^ { d }  \mathbb { R } .$ Then:

(a) The function $f ( \mathbf { w } ) = \lambda \| \mathbf { w } \| ^ { 2 }$ is 2λ-strongly convex.

(b) If f is λ-strongly convex and g is convex, then $f + g$ is λ-strongly convex.

(c) If f is λ-strongly convex and u is a minimiser of $f ,$ then for any $\mathbf { w } _ { \mathrm { : } }$

$$
f (\mathbf {w}) - f (\mathbf {u}) \geqslant \frac {\lambda}{2} \| \mathbf {w} - \mathbf {u} \| ^ {2}.
$$

11. [5 pts.] Let $\mathcal { X } = \mathbb { R } ^ { 2 } , \mathcal { Y } = \{ 0 , 1 \}$ , and let H be the class of concentric circles in the plane, that is,

$$
\mathcal {H} = \left\{h _ {r}: r \in \mathbb {R} _ {+} \right\}, \quad \text { where } h _ {r} (x) = \mathbf {1} _ {\{\| x \| \leq r \}}.
$$

Prove that H is PAC learnable (assume realisability), and its sample complexity is bounded by

$$
m _ {\mathcal {H}} (\epsilon , \delta) \leq \frac {\log (1 / \delta)}{\epsilon}.
$$

12. $[ 7 \ \mathrm { p t s } . ]$ We initialise $\mathbf { w } _ { 1 } \in \mathcal { W }$ . At round $t = 1 , 2 , \dots$ , we obtain a random estimate $\hat { \mathbf { g } } _ { t }$ of a subgradient ${ \bf g } _ { t } \in \partial { \cal F } ( { \bf w } _ { t } )$ so that $\mathbb { E } [ \hat { \mathbf { g } } _ { t } ] = \mathbf { g } _ { t }$ , and update the iterate $\mathbf { w } _ { t }$ as follows:

$$
\mathbf {w} _ {t + 1} = \Pi_ {\mathcal {W}} (\mathbf {w} _ {t} - \eta_ {t} \hat {\mathbf {g}} _ {t}),
$$

where $\eta _ { t }$ is a suitably chosen step-size parameter, and $\Pi _ { \mathcal { W } }$ denotes projection on W. Assume $F$ is $\lambda$ -strongly convex, and that

$$
\mathbb {E} \left[ \| g _ {t} \| ^ {2} \right] \leq G ^ {2}
$$

for all t. Consider Stochastic Gradient Descent with step sizes $\begin{array} { r } { \eta _ { t } = \frac { 1 } { \lambda t } } \end{array}$ Show that for any $w \in W$ , the following inequality holds:

$$
\mathbb {E} \left[ \| w _ {t + 1} - w \| ^ {2} \right] \leq \mathbb {E} \left[ \| w _ {t} - w \| ^ {2} \right] - 2 \eta_ {t} \mathbb {E} \left[ \langle g _ {t}, w _ {t} - w \rangle \right] + \eta_ {t} ^ {2} G ^ {2}.
$$

13. [5 pts.] Neural Networks are universal approximators: Let $f : [ - 1 , 1 ] ^ { n } \to$ $[ - 1 , 1 ]$ be a $\rho -$ Lipschitz function. Fix some $\epsilon > 0$ . Construct a neural network $N : [ - 1 , 1 ] ^ { n } \to [ - 1 , 1 ]$ , with the sigmoid activation function, such that for every $\mathbf { x } \in [ - 1 , 1 ] ^ { n }$ it holds that

$$
| f (\mathbf {x}) - N (\mathbf {x}) | \leq \epsilon .
$$

Hint: Partition $[ - 1 , 1 ] ^ { n }$ into small boxes. Use the Lipschitzness of $f$ to show that it is approximately constant at each box. Finally, show that a neural network can first decide which box the input vector belongs to, and then predict the averaged value of $f$ at that box.

## B. Deep Learning and Reinforcement Learning

## 1. [9 pts.] Neural Network Architectures (CNNs & Transformers)

(a) [3 pts.] Derive the number of trainable parameters in a single convolutional layer with input size $H \times W \times C _ { \mathrm { i n } } ,$ kernel size $k \times k ,$ and $C _ { \mathrm { o u t } }$ output channels (assume bias), and compare it with a fully connected (dense) layer of the same input and output size.

(b) [3 pts.] Write the scaled dot-product self-attention formula (define $Q , K , V )$ Explain why positional information is necessary in Transformers and describe one method to inject positional information.

(c) [3 pts.] State one key benefit of (i) convolution for vision and (ii) self-attention. Then design a minimal vision transformer for images that uses both structures: specify how to tokenize the image into patch embeddings, where self-attention is applied, and where convolution is introduced.

## 2. [14 pts.] Generative Models and Likelihood-based Training

(a) [2 pts.] Show that maximizing the likelihood of a generative model $p _ { \theta } ( x )$ given data distribution $p _ { \mathrm { d a t a } } ( x )$ is equivalent to minimizing the KL divergence ${ \mathrm { K L } } ( p _ { \mathrm { d a t a } } \| p _ { \theta } )$

(b) [4 pts.]

Consider a normalizing flow model composed of L invertible transformations

$$
z _ {0} \sim p (z _ {0}), \qquad z _ {\ell} = f _ {\ell} (z _ {\ell - 1}), \ell = 1, \dots , L, \qquad x = z _ {L},
$$

where each $f _ { \ell }$ is bijective and diferentiable, and $p ( z _ { 0 } )$ is a simple base density (e.g., standard Gaussian). Write down the training objective (loss) for normalizing flows on a dataset $\{ x ^ { ( i ) } \} _ { i = 1 } ^ { N }$ sampled from the data distribution.

(c) [4 pts.] Explain why the variational autoencoder (VAE) uses the evidence lower bound (ELBO) to approximate maximum likelihood training. Write down the ELBO expression and explain the roles of the reconstruction term and the regularization term.

(d) [4 pts.] We can interpret difusion probabilistic models as a form of hierarchical variational autoencoders (VAEs). Let $x _ { 0 } \sim p _ { \mathrm { d a t a } }$ denote a data sample. The forward process (the encoder) is defined by adding noise

$$
q (x _ {1: T} \mid x _ {0}) = \prod_ {t = 1} ^ {T} q (x _ {t} \mid x _ {t - 1}), \quad q (x _ {t} \mid x _ {t - 1}) = \mathcal {N} (\sqrt {\alpha_ {t}} x _ {t - 1}, \beta_ {t} I),
$$

where $\alpha _ { t } = 1 - \beta _ { t } \in ( 0 , 1 )$ and $\begin{array} { r } { \bar { \alpha } _ { t } = \prod _ { s = 1 } ^ { t } \alpha _ { s } } \end{array}$

Write down the probabilistic model of the backward process (the decoder), and show that the ELBO for log $p _ { \theta } ( x _ { 0 } )$ can be written as

$$
\log p _ {\theta} (x _ {0}) \geqslant - \operatorname{KL} \left(q \left(x _ {T} \mid x _ {0}\right) \| p \left(x _ {T}\right)\right)
$$

$$
\begin{array}{l} - \sum_ {t = 2} ^ {T} \mathbb {E} _ {q} \big [ \mathrm{KL} \big (q (x _ {t - 1} \mid x _ {t}, x _ {0}) \| p _ {\theta} (x _ {t - 1} \mid x _ {t}) \big) \big ] \\ + \mathbb {E} _ {q} \big [ \log p _ {\theta} (x _ {0} \mid x _ {1}) \big ]. \end{array}
$$

## 3. [10 pts.] Policy Gradient Methods

Consider a discounted Markov Decision Process $\left( \mathrm { M D P } \right) \left( { \mathcal S } , { \mathcal A } , P , r , \gamma \right)$ with states $s \in S ,$ actions $a \in A ,$ transition kernel $P ( s ^ { \prime } \mid s , a )$ , reward $r ( s , a )$ bounded, and discount $\gamma \in ( 0 , 1 )$ . Let $\pi _ { \boldsymbol { \theta } } ( \boldsymbol { a } \mid \boldsymbol { s } )$ be a diferentiable, stochastic policy with parameters $\theta ,$ and let $s _ { 0 }$ be a fixed start state. Define the (discounted) return

$$
G _ {0} = \sum_ {t = 0} ^ {\infty} \gamma^ {t} r (s _ {t}, a _ {t}),
$$

and the performance objective

$$
J (\theta) = V ^ {\pi_ {\theta}} (s _ {0}) = \mathbb {E} _ {\tau \sim \pi_ {\theta}} [ G _ {0} ],
$$

where a trajectory $\tau = ( s _ { 0 } , a _ { 0 } , s _ { 1 } , a _ { 1 } , \dots )$ is generated by $s _ { t + 1 } \sim P ( \cdot \mid s _ { t } , a _ { t } )$ and $a _ { t } \sim \pi _ { \theta } ( \cdot \mid s _ { t } )$

Denote the value and action-value functions by

$$
\begin{array}{c} V ^ {\pi} (s) = \mathbb {E} _ {\pi} \left[ \sum_ {t = 0} ^ {\infty} \gamma^ {t} r (s _ {t}, a _ {t})   \Big |   s _ {0} = s \right], \\ Q ^ {\pi} (s, a) = \mathbb {E} _ {\pi} \left[ \sum_ {t = 0} ^ {\infty} \gamma^ {t} r (s _ {t}, a _ {t})   \Big |   s _ {0} = s, a _ {0} = a \right], \end{array}
$$

and the advantage by $A ^ { \pi } ( s , a ) = Q ^ { \pi } ( s , a ) - V ^ { \pi } ( s )$ . Let $d ^ { \pi } ( s )$ be the (unnormalized) γ-discounted state visitation distribution:

$$
d ^ {\pi} (s) = \sum_ {t = 0} ^ {\infty} \gamma^ {t} \operatorname * {P r} (s _ {t} = s \mid \pi).
$$

(a) [6 pts.] Prove the Policy Gradient Theorem.

$$
\begin{array}{r l} \nabla_ {\theta} J (\theta) = & \mathbb {E} _ {\pi_ {\theta}} \bigg [ \sum_ {t = 0} ^ {\infty} \gamma^ {t} \nabla_ {\theta} \log \pi_ {\theta} (a _ {t} | s _ {t}) Q ^ {\pi_ {\theta}} (s _ {t}, a _ {t}) \bigg ] \\ & = \frac {1}{1 - \gamma} \mathbb {E} _ {s \sim d ^ {\pi_ {\theta}}, a \sim \pi_ {\theta}} \big [ \nabla_ {\theta} \log \pi_ {\theta} (a | s) Q ^ {\pi_ {\theta}} (s, a) \big ]. \end{array}
$$

(b) [4 pts.] Show that for any function $b : S  \mathbb { R }$ ，

$$
\mathbb {E} _ {\pi_ {\theta}} \bigg [ \sum_ {t = 0} ^ {\infty} \gamma^ {t} \nabla_ {\theta} \log \pi_ {\theta} (a _ {t} | s _ {t}) b (s _ {t}) \bigg ] = 0,
$$

and hence the policy gradient can be equivalently written as

$$
\nabla_ {\theta} J (\theta) = \mathbb {E} _ {\pi_ {\theta}} \bigg [ \sum_ {t = 0} ^ {\infty} \gamma^ {t} \nabla_ {\theta} \log \pi_ {\theta} (a _ {t} | s _ {t}) \left(Q ^ {\pi_ {\theta}} (s _ {t}, a _ {t}) - b (s _ {t})\right) \bigg ].
$$

In the advantage method, how should $b ( s )$ be chosen, and what is the benefit of this choice?

## C. Optimization Methods in Artificial Intelligence

Consider the regularized finite-sum problem

$$
\min _ {x \in \mathbb {R} ^ {d}} F (x) := f (x) + R (x), \quad f (x) := \frac {1}{n} \sum_ {i = 1} ^ {n} f _ {i} (x),
$$

where each $f _ { i } : \mathbb { R } ^ { d }  \mathbb { R }$ is convex and $L _ { i } .$ -smooth, the aggregate $f$ is $L .$ -smooth and $\mu -$ strongly convex $( \mu > 0 )$ , and $R : \mathbb { R } ^ { d }  ( - \infty , + \infty ]$ is proper, closed, and convex. For a probability vector $q = ( q _ { 1 } , \ldots , q _ { n } )$ with $q _ { i } > 0$ and $\textstyle \sum _ { i } q _ { i } = 1$ , define a categorical random variable $s \in \{ 1 , \ldots , n \}$ with $\mathbb { P } ( s = i ) = q _ { i }$ . Fix a minibatch size $\tau \in \{ 1 , 2 , \ldots \}$ , and draw i.i.d. copies $s _ { 1 } , \ldots , s _ { \ i }$ of s. Define the multisampling gradient estimator

$$
g (x) := \frac {1}{\tau} \sum_ {t = 1} ^ {\tau} \frac {1}{n q _ {s _ {t}}} \nabla f _ {s _ {t}} (x),
$$

and the proximal SGD iteration

$$
x ^ {k + 1} = \operatorname{prox} _ {\gamma R} \left(x ^ {k} - \gamma g ^ {k}\right), \quad g ^ {k} := g \left(x ^ {k}\right).
$$

We denote the Bregman divergence of $f$ by

$$
D _ {f} (x, y) := f (x) - f (y) - \langle \nabla f (y), x - y \rangle .
$$

1. $[ 3 \ \mathrm { p t s } . ]$ Basic Definitions: Give the definitions of L-smoothness and $\mu -$ -strong convexity.

2. [2 pts.] Uniqueness of the Minimizer: Show that F admits a unique minimizer $x ^ { \star }$

3. [5 pts.] Unbiasedness of the Gradient Estimator: Prove that $g ( x )$ is unbiased, i.e., $\mathbb { E } [ g ( x ) ] = \nabla f ( x )$

4. [8 pts.] Expected Smoothness Bound: Assuming each $f _ { i }$ is $L _ { i }$ -smooth and convex, and $f$ is L-smooth, show that for all $x , y \in \mathbb { R } ^ { d }$ ,

$$
\mathbb {E} \left[ \| g (x) - g (y) \| ^ {2} \right] \leqslant 2 A ^ {\prime \prime} (\tau , q) D _ {f} (x, y),
$$

where the expected-smoothness constant $A ^ { \prime \prime }$ (depending on τ and $q )$ is

$$
A ^ {\prime \prime} (\tau , q) := \frac {1}{\tau} \Bigl (\max _ {i} \frac {L _ {i}}{n q _ {i}} \Bigr) + \Bigl (1 - \frac {1}{\tau} \Bigr) L.
$$

Hint: Expand the square, separate diagonal and cross terms using independence, and use smoothness to bound gradient diferences via Bregman divergences.

5. [4 pts.] Extremes, Monotonicity, and Interpolation:

(a) Evaluate $A ^ { \prime \prime } ( \tau , q )$ at $\tau = 1$ and as $\tau \to + \infty$ . Identify the limiting algorithms (SGD-NS vs. GD) and the corresponding constants.

(b) Show that $A ^ { \prime \prime } ( \tau , q )$ is nonincreasing in τ, and interpret how the minibatch size τ interpolates between SGD-NS and GD.

Hint: Use $\begin{array} { r } { \frac { 1 } { n } \sum _ { i = 1 } ^ { n } L _ { i } \geqslant L } \end{array}$

6. [4 pts.] Design of Importance Sampling $q \mathrm { : }$ For a fixed $\tau ,$ minimize the first term of $A ^ { \prime \prime } ( \tau , q )$ , i.e.,

$$
\min _ {q \in \Delta_ {n}} \max _ {i} \frac {L _ {i}}{n q _ {i}}, \quad \text { where } \Delta_ {n} = \{q \in \mathbb {R} _ {+ +} ^ {n}: \sum_ {i} q _ {i} = 1 \}.
$$

Derive the optimal $q ^ { \star }$ and the attained value of max<sub>i</sub> $\frac { L _ { i } } { n q _ { i } ^ { \star } }$ . Compare with uniform sampling $\begin{array} { r } { q _ { i } ^ { \mathrm { u n i } } = \frac { 1 } { n } } \end{array}$

Hint: Use $\begin{array} { r } { \frac { 1 } { n } \sum _ { i = 1 } ^ { n } L _ { i } \leqslant \operatorname* { m a x } _ { i } L _ { i } } \end{array}$

7. [3 pts.] Variance at the Optimum and Minibatch Scaling: Let $\xi ( x ) : = g ( x ) - \nabla f ( x )$ Show that

$$
\mathbb {E} \left[ \| \xi (x ^ {\star}) \| ^ {2} \right] = \frac {1}{\tau} \operatorname{Var} \left(\frac {1}{n q _ {s}} \nabla f _ {s} (x ^ {\star})\right),
$$

i.e., the variance at the optimum scales as $1 / \tau .$ . Express your answer in terms of $q$ and $\{ \nabla f _ { i } ( x ^ { \star } ) \} _ { i = 1 } ^ { n }$

8. $[ 2 \mathrm { p t s } . ]$ AC inequality and computing $( A , C )$ : Consider the following classical results: AC inequality: There exist constants $A \geqslant 0$ and $C \geqslant 0$ such that for all $k \geqslant 0$ 2

$$
\mathbb {E} \left[ \| g ^ {k} - \nabla f (x ^ {\star}) \| ^ {2} \mid x ^ {k} \right] \leqslant 2 A D _ {f} \left(x ^ {k}, x ^ {\star}\right) + C.
$$

Implication from expected smoothness: If $g ( x )$ is an unbiased estimator of $\nabla f ( x )$ and, for all $x , y .$ 4

$$
\mathbb {E} \left[ \| g (x) - g (y) \| ^ {2} \right] \leqslant 2 A ^ {\prime \prime} D _ {f} (x, y) + C ^ {\prime \prime} (y),
$$

then for $G ( x , y ) : = \mathbb { E } \| g ( x ) - \nabla f ( y ) \| ^ { 2 }$ one has the AC inequality

$$
G (x, y) \leqslant 2 A D _ {f} (x, y) + C,
$$

where $A = 2 A ^ { \prime \prime }$ and $C = 2 \bigl ( \mathrm { V a r } [ g ( y ) ] + C ^ { \prime \prime } ( y ) \bigr )$

Specialize the above implication to obtain the AC constants $( A , C )$ , and write an explicit formula for $\mathrm { V a r } [ g ( x ^ { \star } ) ]$

9. [2 pts.] Stepsize and convergence: Given the classical convergence theorem of SGD: Assume $f$ is µ-convex, $g ^ { k }$ is unbiased, and the AC inequality holds with constants $( A , C )$ . Then for any stepsize $\textstyle { 0 < \gamma \leqslant { \frac { 1 } { A } } }$ , the iterates satisfy

$$
\mathbb {E} \| x ^ {k} - x ^ {\star} \| ^ {2} \leqslant (1 - \gamma \mu) ^ {k} \| x ^ {0} - x ^ {\star} \| ^ {2} + \frac {\gamma C}{\mu}.
$$

Using the (A, C) obtained in question 8 to compute:

• the admissible stepsize range;

• the explicit convergence bound with the noise floor written in closed form.

## D. Natural Language Processing

## Part I: Questions on Concepts and Algorithm Analysis [13 pts.]

1. $\mathrm { [ 3 \ p t s . ] }$ Embedding for Texts and Graphs. Embedding methods obtain vector representations of individual items by exploiting the relationships among them within a collection. GloVe and Skip-Gram are used to learn representations of words in text; Node2Vec learns representations of nodes in a network; and TransE learns representations of entities and relations in a knowledge graph. In 2–3 sentences each, succinctly describe the data signal, the learning objective type, and the key inductive bias (the model’s built-in assumptions) for the four paradigms: GloVe, Skip-gram, Node2Vec, TransE.

2. [5 pts.] Scaling Laws and Architectural Bias (LSTM vs. Transformer). Consider language models trained autoregressively on the same corpus with identical tokenization, context length, optimizer, and training pipeline. For an architecture arch ∈ {LSTM, Transformer}, assume the test loss obeys

$$
L _ {\mathrm{arch}} (P, T) = L _ {\infty} + A _ {\mathrm{arch}} P ^ {- \alpha_ {\mathrm{arch}}} + B _ {\mathrm{arch}} T ^ {- \beta_ {\mathrm{arch}}}, \quad \alpha_ {\mathrm{arch}}, \beta_ {\mathrm{arch}} > 0,
$$

where P is the parameter count and $T$ is the number of training tokens. Assume $L _ { \infty }$ is the same across architectures (same task/data).

(a) Fixed-data regime. Fix a large but finite $T = T _ { 0 }$ . On a log–log plot of $L ( P , T _ { 0 } ) - L _ { \infty }$ versus $P _ { \cdot }$ , state the expected qualitative relationships between $( \alpha _ { \mathrm { a r c h } } , A _ { \mathrm { a r c h } } )$ for LSTM vs. Transformer and the resulting relative positions and slopes of their P–L curves.

(b) Fixed-parameter regime. Fix a parameter budget $P = P _ { 0 }$ and vary $T ,$ On a log–log plot of $L ( P _ { 0 } , T ) - L _ { \infty }$ versus $T ,$ state the expected qualitative relationships between $( \beta _ { \mathrm { a r c h } } , B _ { \mathrm { a r c h } } )$ for LSTM vs. Transformer and the relative positions and slopes of their T–L curves.

(c) Justification. Justify your answers in (a)–(b) from the viewpoints of: (i) longrange dependency handling, (ii) parallelizability/throughput and optimization dynamics, and (iii) inductive bias and sample eficiency.

3. [5 pts.] Analysis of a Markov Logic Network (MLN). A Markov Logic Network (MLN) defines a probability distribution over possible worlds. It is specified by a set of weighted first-order logic formulas, $( \phi _ { i } , w _ { i } )$ . For a given world x (i.e., a truth assignment to all possible ground atoms), its probability is given by:

$$
P (X = x) = \frac {1}{Z} \exp \left(\sum_ {i} w _ {i} n _ {i} (x)\right),
$$

where $w _ { i }$ is the weight of the i-th formula $\phi _ { i } , n _ { i } ( x )$ is the number of true groundings of $\phi _ { i }$ in world $x ,$ and Z is the partition function (normalization constant).

Consider a simple MLN designed to analyze topics of academic papers, consisting of two weighted formulas:

(a) $\forall p _ { 1 } , p _ { 2 } \operatorname { C i t e s } ( p _ { 1 } , p _ { 2 } ) \land$ InTopic $( p _ { 1 } , \mathrm { { } ^ { * } A I ^ { \gg } } ) \Rightarrow \mathrm { I n T o p i c } ( p _ { 2 } , \mathrm { { } ^ { * } A I ^ { \gg } } )$ , with weight $w _ { 1 } =$ 1.5;

(Interpretation: If a paper in the AI topic cites another paper, the cited paper is also likely in the AI topic.)

(b) ∀p InTopic(p, “AI”), with weight $w _ { 2 } = - 1 . 0$ (Interpretation: There is a general prior that a paper is less likely to be in the AI topic.)

Assume our domain contains only two papers, P1 and P2, and one topic, $^ { 6 6 } \mathrm { A I } ^ { \dag }$ Answer the following questions:

(a) Model Structure Analysis Please briefly describe the structure of the ground Markov network corresponding to this MLN. What are the nodes? What are the cliques and why?

(b) Probability Calculation Consider a specific possible world $x _ { 1 }$ where: P1 cites P2, P1 is in the AI topic, but P2 is not. Furthermore, P2 does not cite P1. (i.e., Cites(P1, P2) is true, Cites(P2, P1) is false, InTopic(P1, “AI”) is true, and InTopic(P2, “AI”) is false.) 1) For this world $x _ { 1 } ,$ calculate the number of true groundings for each of the two formulas (i.e., find the values of $n _ { 1 } ( x _ { 1 } )$ and n<sub>2</sub>(x<sub>1</sub>)). 2) Write down the un-normalized probability of world $x _ { 1 } \ { \mathrm { ~ ( i . e . ~ } }$ , the exp(. . . ) term).

(c) Parameter Impact Analysis 1) Suppose we change the weight of the first formula, $w _ { 1 }$ , from 1.5 to −1.5. In one sentence, what kind of academic citation phenomenon does the model now favor? 2) Without re-calculating specific probabilities, what qualitative efect $( \mathrm { e . g . }$ , significant increase, significant decrease, or little change) does this modification have on the probability of a world where $\cdot _ { \mathrm { P 1 } } ,$ and $\mathrm { \Delta ^ { 6 } P 2 ^ { \circ } }$ are both AI papers and $\cdot _ { \mathrm { P 1 } } ,$ cites $\mathrm { \cdot P 2 ^ { \cdot } } 2 $ Briefly explain your reasoning.

(d) Maximum a Posteriori (MAP) Inference. Given that Cites $( P _ { 1 } , P _ { 2 } ) =$ true and all other atoms are unobserved, and using the original weights $w _ { 1 } = 1 . 5$ and $w _ { 2 } = - 1 . 0$ , determine the MAP truth assignments for InTopic( $P _ { 1 } , \ { } ^ { 6 } \mathrm { A I } ^ { 9 } )$ and InTopic $( P _ { 2 } , { } ^ {  } \mathrm { A I } ^ { \ ' } )$ . Provide a 1–2 sentence justification.

## Part II: Questions on Algorithm and System Design [20 pts.]

4. [10 pts.] Topic–Ontology LDA for Fact Triples. A document d is represented by a multiset of fact triples

$$
\mathcal {F} _ {d} = \{f = (s, r, o) \},
$$

where $s \in \mathcal { V } _ { s }$ and $o \in \mathcal { V } _ { o }$ are subject/object mentions (surface phrases), and $r \in \mathcal { V } _ { r }$ is a relation mention. Each triple also carries latent ontology variables: subject type $c _ { s } \in \mathcal { C }$ , object type $c _ { o } \in \mathcal { C }$ , and relation type $t \in \mathcal R$ . Assume there are K topics. The goal is to uncover (i) document–level topic mixtures and (ii) ontology assignments/types for entities and relations using an LDA-style generative approach. Unless stated otherwise, use symmetric Dirichlet priors.

(a) Generative process & model specification. Design an LDA-style generative model that jointly produces fact triples. Your model should at least include: document-level topic mixtures $\theta _ { d } \sim \operatorname { D i r } ( \alpha )$ ; topic-specific distributions over ontology variables $\pi _ { k } ^ { ( s ) }$ on ${ \mathcal { C } } , \pi _ { k } ^ { ( o ) }$ on ${ \mathcal { C } } , \pi _ { k } ^ { ( r ) }$ on $\mathcal { R } ;$ ; and type-specific surface-form distributions $\phi _ { c } ^ { ( s ) }$ on $\mathcal { V } _ { s } , \phi _ { c } ^ { ( o ) }$ on $\mathcal { V } _ { o } , \phi _ { t } ^ { ( r ) }$ on $\mathcal { V } _ { r }$

(b) Joint probability. Write the factorized form of the full joint

$$
p (\Theta , \Pi , \Phi , Z, C _ {s}, C _ {o}, T, S, O, R \mid \text { hyperparameters }),
$$

where $\Theta = \{ \theta _ { d } \} _ { d } , \Pi = \{ \pi _ { k } ^ { ( s ) } , \pi _ { k } ^ { ( o ) } , \pi _ { k } ^ { ( r ) } \} _ { k } , \Phi = \{ \phi _ { c } ^ { ( s ) } , \phi _ { c } ^ { ( o ) } \} _ { c \in \mathcal { C } } \cup \{ \phi _ { t } ^ { ( r ) } \} _ { t \in \mathcal { R } }$ and $Z = \{ z _ { f } \} , C _ { s } = \{ c _ { s , f } \} , C _ { o } = \{ c _ { o , f } \} , T = \{ t _ { f } \}$ , and $S , O , R$ the observed mentions.

(c) Automatic naming of discovered categories. After inference, suppose you obtain several latent categories for ontologies (entity types and relation types). Design an automatic naming method that gives a reasonable name for each category.

5. [10 pts.] Design and Analyze a Text-to-Image Difusion System. You will design a text-to-image generation system. Given a text prompt T , the system should generate an image I. We adopt a difusion framework with a Transformer backbone for the image denoiser and a Transformer for the text encoder.

(a) Forward process, ELBO, and closed-form posteriors. Let the clean image be $\mathbf { \bar { x } } _ { 0 } \in \mathbb { R } ^ { H \times W \times C }$ and define the forward noising process

$$
q (\mathbf {x} _ {t} \mid \mathbf {x} _ {t - 1}) = \mathcal {N} \bigl (\sqrt {\alpha_ {t}}   \mathbf {x} _ {t - 1},   \beta_ {t} \mathbf {I} \bigr), \quad \beta_ {t} = 1 - \alpha_ {t}, \quad \bar {\alpha} _ {t} = \prod_ {s = 1} ^ {t} \alpha_ {s},
$$

with prior $p ( \mathbf x _ { T } ) = \mathcal { N } ( \mathbf 0 , \mathbf I )$

(i) Show that $q ( \mathbf { x } _ { t } \mid \mathbf { x } _ { 0 } ) = \mathcal { N } \big ( \sqrt { \bar { \alpha } _ { t } } \mathbf { x } _ { 0 } , ( 1 - \bar { \alpha } _ { t } ) \mathbf { I } \big )$

(ii) Express the evidence lower bound (ELBO) on log $p _ { \theta } ( \mathbf { x } _ { 0 } )$ as the sum of a reconstruction term and KL divergence terms. You may state the final expression directly; if you provide a derivation, include only the two key steps.

(iii) Show that the exact posterior $q ( \mathbf { x } _ { t - 1 } \mid \mathbf { x } _ { t } , \mathbf { x } _ { 0 } )$ is Gaussian with variance $\begin{array} { r } { \tilde { \beta } _ { t } = \frac { 1 - \bar { \alpha } _ { t - 1 } } { 1 - \bar { \alpha } _ { t } } \beta _ { t } } \end{array}$ and provide its mean.

(b) Noise-prediction parameterization and training loss. Assume $p _ { \theta } ( \mathbf { x } _ { t - 1 }$ ${ \bf x } _ { t } ) = \mathcal { N } \big ( { \bf x } _ { t - 1 } ; \mu _ { \theta } ( { \bf x } _ { t } , t ) , \sigma _ { t } ^ { 2 } \mathbf { I } \big )$ with fixed $\sigma _ { t } ^ { 2 } = \tilde { \beta } _ { t }$

(i) Show that the optimal mean can be parameterized by a noise-prediction network $\epsilon _ { \theta }$ as

$$
\boldsymbol {\mu} _ {\theta} (\mathbf {x} _ {t}, t) = \frac {1}{\sqrt {\alpha_ {t}}} \left(\mathbf {x} _ {t} - \frac {\beta_ {t}}{\sqrt {1 - \bar {\alpha} _ {t}}} \epsilon_ {\theta} (\mathbf {x} _ {t}, t)\right).
$$

(ii) Prove that, up to constant and per-timestep weights, training reduces to

$$
\mathcal {L} _ {t} = \mathbb {E} _ {t, \mathbf {x} _ {0}, \boldsymbol {\epsilon}} \left[ \left\| \boldsymbol {\epsilon} - \boldsymbol {\epsilon} _ {\theta} \left(\sqrt {\bar {\alpha} _ {t}} \mathbf {x} _ {0} + \sqrt {1 - \bar {\alpha} _ {t}} \boldsymbol {\epsilon}, t\right) \right\| _ {2} ^ {2} \right],
$$

where $\epsilon \sim \mathcal { N } ( \mathbf { 0 } , \mathbf { I } )$ and t is sampled from a specified distribution over $\{ 1 , \ldots , T \}$

(c) Text-conditional modeling with a Transformer. Design a conditional reverse process $p _ { \theta } ( \mathbf { x } _ { t - 1 } \mid \mathbf { x } _ { t }$ , Text) using Transformer architecture. Your answer should specify:

(i) How to implement the image denoiser using a Transformer architecture;

(ii) How to condition the image denoiser on the input text.
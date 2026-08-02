# Theoretical Foundations

The positioning of this chapter is "the minimum theoretical closure before solving the past-exam questions". It is not a complete rewrite of the four core courses, but rather, it organizes the definitions, formulas, proof routines and assessment methods that will be repeatedly used in the later past-exam questions into a learnable path according to the Qiuzhen College AI direction examination syllabus. When reading this chapter, don’t just memorize formulas; answer three things at once for each concept: 

1. What is the mathematical object, such as hypothesis class, risk, value function, attention matrix; 

2. How is it represented in the algorithm, such as array, parameter vector, loss function, optimizer state; 

3. What will be tested on the exam, such as proving bounds, deriving gradients, explaining limitations, and comparing models. 

**Sources.** This primer is structured around the AI PhD Qualifying Examination syllabus [@qzc-ai-syllabus-2026]. Its principal references are [@shalev2014uml] and [@mohri2018foundations] for machine learning theory, [@goodfellow2016deep] and [@bishop2023deep] for deep learning, [@nesterov2018convex; @beck2017first] for optimization, and [@jurafsky2026slp; @goldberg2017nnnlp] for NLP.

##### presentation level

This chapter uses **[Definition]**, **[Theorem]**, **[Proof Skeleton]**, **[Heuristic Explanation]** and **[Engineering Convention]** to distinguish formal conclusions, proof routes, intuition and engineering experience. Continuous text without labels is only responsible for narrative and cohesion and should not be misread as unconditional theorems; each conditional conclusion shall be subject to the assumptions of the paragraph in which it is located. 

##### Symbol conventions in this chapter

 vectors use lowercase letters by default, such as $x,w,z$; matrices use uppercase letters by default, such as $X,Q,K$. Probability distributions are written in cursive or Roman fonts, such as $\mathcal{D}$ and $p_\theta$; training samples are uniformly written as $S=(z_i)_{i=1}^m$, where $z_i=(x_i,y_i)$. The empirical risk and population risk are $L_S$ and $L_{\mathcal{D}}$ respectively. When $y$ may represent both a single label and a vector of labels, the single label is written as $y_i$ and the label vector is written as $\mathbf{y}$. The indicator function is uniformly written as $\mathbb{I}\{\cdot\}$. 

The disambiguation convention in the following table is adopted across modules; local derivation follows the symbols already defined in its context, but the same symbol must not be used to represent two different objects in the table. 

| Object | Notation | Description |
| --- | --- | --- |
| Data distribution and samples | $\mathcal{D}$, $S=(z_i)_{i=1}^m$ | $z_i=(x_i,y_i)$, the training sample size is $m$ |
| VC dimension and input dimension | $d_{\mathrm{VC}}$, $d_{\mathrm{in}}$ | No longer use the same $d$ to refer to both at the same time |
| Model dimension and network depth | $d_{\mathrm{model}}$, $L_{\mathrm{net}}$ | Transformer width and number of network layers |
| Smoothing constant and loss | $L_{\mathrm{sm}}$, $\ell$ or $\mathcal{L}$ | $L_{\mathcal{D}}$ reserved for risk to avoid confusion |
| attention value matrix | $V_{\mathrm{attn}}$ | and reinforcement learning value function $V^\pi$ distinction |
| kernel function and number of measurements | $k(x,x')$, $M$ | $M$ is the number of compressed sensing measurements |
| sparsity, parameter amount, token number | $s$, $N_{\mathrm{param}}$, $N_{\mathrm{tok}}$ | avoid mixing with sample size, state or matrix column number |

##### Syllabus coverage index

The following table is not a substitute for review content, but a reading map: the left column is the official syllabus entry, the middle column indicates the corresponding location of this chapter, and the right column lists the main reference sources. The formal definition, derivation and exam reminder of each item are still subject to the text of the corresponding section. 

| Syllabus entries | Locations covered in this chapter | Primary sources |
| --- | --- | --- |
| Supervised learning and PAC learning theory | Supervised learning, PAC, achievable ERM, agnostic PAC, uniform convergence | [@shalev2014uml; @mohri2018foundations] |
| VC dimension, Sauer's lemma, sample complexity | VC dimension, growth function, Sauer's lemma, VC generalization bound derivation | [@mohri2018foundations] |
| Model selection and bias variance | approximation/estimation error, bias-variance decomposition | [@shalev2014uml] |
| Linear regression and logistic regression | Normal equation, ridge regression, MLE and gradient of logistic loss | [@shalev2014uml] |
| Decision tree, nearest neighbor | Information gain/Gini, overfitting, bias-variance and distance scale of $k$-NN | [@shalev2014uml] |
| SVM and kernel method | margin, hinge loss, SVM dual, kernel trick | [@mohri2018foundations] |
| Compressed sensing | Sparse measurement, $\ell_1$ relaxation, RIP uniqueness | [@candes2006compressive] |
| Convex sets, convex functions, subdifferentials | Convex first-order conditions, subgradients, Fermat rule, sum rule, $\ell_1$ Subdifferentials | [@nesterov2018convex; @beck2017first] |
| GD, SGD, random coordinate descent | descent lemma, strong convex linear convergence, SGD telescoping, coordinate update | [@beck2017first; @shalev2014uml] |
| Momentum and adaptive learning rate | state variables and applicable scenarios of momentum, Nesterov, AdaGrad, Adam | [@nesterov2018convex; @beck2017first] |
| Neural network framework, training, approximation and generalization | MLP, backpropagation, approximation/optimization/generalization trichotomy, normalization, residual | [@goodfellow2016deep; @bishop2023deep] |
| Vision tasks | Feature extraction, recovery, 3D reconstruction, optical flow, output structure for recognition and segmentation | [@szeliski2022vision; @bishop2023deep] |
| Unsupervised learning, implicit regularization, transfer and meta-learning | autoencoder, contrastive learning, pretraining, fine-tuning, meta-objective | [@goodfellow2016deep; @bishop2023deep] |
| Visual generative models and expressiveness analysis | Objective, likelihood, reversibility and sampling cost of VAE, GAN, flow, diffusion | [@goodfellow2014gan; @kingma2014vae; @dinh2017realnvp; @ho2020ddpm; @song2021score] |
| Reinforcement learning | MDP, Bellman equation, Q-learning, policy gradient, baseline | [@mohri2018foundations; @sutton2018rl] |
| Statistical modeling and Word2vec | $n$-gram MLE, skip-gram, negative sampling, GloVe | [@jurafsky2026slp; @goldberg2017nnnlp] |
| Transformer self-attention | $Q,K,V$ dimension, $\sqrt{d_k}$ scaling, causal mask | [@vaswani2017attention; @jurafsky2026slp] |
| Large model pre-training alignment and Scaling Law | next-token CE, SFT, RLHF/DPO, power law and compute-optimal trade-off | [@kaplan2020scaling; @hoffmann2022training; @rafailov2023dpo] |
| Embedding knowledge base inference | TransE, RAG, MLN, capability boundaries and failure modes | [@lewis2020rag; @jurafsky2026slp] |

## Supervised learning, PAC, VC and generalization

**Teaching from scratch. ** The basic problem of supervised learning is: learn a prediction rule[^1] from limited samples, and hope that it will perform well on unseen samples. The core difficulty here is not "whether it can be fitted on the training set", but "whether the training set error can represent the overall error." 

Suppose the input space is $\mathcal{X}$, the label space is $\mathcal{Y}$, and the unknown data distribution is $\mathcal{D}$. The training set 

$$
S=((x_1,y_1),\ldots,(x_m,y_m))
$$

 is obtained by sampling from $\mathcal{D}$ independently and identically distributed. Assume that class $\mathcal{H}$ is the set of candidate predictors, and the loss function $\ell(h,(x,y))$ measures the error of predictor $h$ on sample $(x,y)$. The empirical risk and population risk are respectively 

$$
L_S(h)=\frac1m\sum_{i=1}^{m}\ell(h,(x_i,y_i)),
  \qquad
  L_{\mathcal{D}}(h)=\mathbb{E}_{(x,y)\sim\mathcal{D}}\ell(h,(x,y)).
$$

Empirical risk is the calculable training error; population risk is the generalization error that we really care about but cannot directly calculate. The intuition behind the definition of Empirical Risk Minimization (ERM) writing 

$$
h_S\in \operatorname*{arg\,min}_{h\in\mathcal{H}}L_S(h).
$$

 is simple: since you cannot see the overall distribution, first select the model with the best performance on the training set. But whether ERM is reliable depends on the complexity of $\mathcal{H}$. If $\mathcal{H}$ is too large, it can also fit out random noise, and the training error will be systematically low. 

### PAC Learning

PAC is the abbreviation of Probably Approximately Correct. It writes "learning" as a probability proposition: when there are enough samples, the learning algorithm outputs a hypothesis with a high probability that the error does not exceed the target accuracy. 

 In the binary classification achievable situation, it is assumed that there is an objective function $f\in\mathcal{H}$, and the label is generated by $y=f(x)$. Algorithm $A$ PAC learns $\mathcal{H}$, meaning for arbitrary precision $\varepsilon>0$ and failure probability $\delta>0$, when the sample size is 

$$
m\ge m_{\mathcal{H}}(\varepsilon,\delta)
$$

, there is 

$$
\mathbb{P}_{S\sim \mathcal{D}^m}
  \left[
    L_{\mathcal{D}}(A(S))\le \varepsilon
  \right]
  \ge 1-\delta.
$$

 here $\varepsilon$ is the accuracy parameter, controls how many errors are allowed; $\delta$ is the confidence parameter, which controls how much probability of failure is allowed. Sample complexity $m_{\mathcal{H}}(\varepsilon,\delta)$ tells us how many samples are needed to achieve this guarantee. 

Why do Bernoulli and union bound keep appearing? For fixed $h$, two classifications $0$-$1$ The loss can be written as the error indicator variable 

$$
Z_i=\mathbb{I}\{h(x_i)\ne f(x_i)\}.
$$

 so 

$$
L_S(h)=\frac1m\sum_{i=1}^{m}Z_i,
  \qquad
  \mathbb{E}[Z_i]=L_{\mathcal{D}}(h).
$$

. When $h$ is fixed, the problem is Bernoulli mean concentration; to control all at the same time $h\in\mathcal{H}$, it is necessary to control the union of the bad event 

$$
\left|L_S(h)-L_{\mathcal{D}}(h)\right|>\varepsilon
$$

 over the entire hypothesis class. This is where $\log|\mathcal{H}|$ in the bounds of finite assumptions comes from. If $\mathcal{H}$ is finite, Hoeffding's inequality and union bound give the typical form 

$$
\mathbb{P}\left[
    |L_S(h)-L_{\mathcal{D}}(h)|>\varepsilon
  \right]
  \le
  2\exp(-2m\varepsilon^2)
$$

 which holds for every fixed $h$. Because 

$$
\left\{
    \exists h\in\mathcal{H}:
    |L_S(h)-L_{\mathcal{D}}(h)|>\varepsilon
  \right\}
  =
  \bigcup_{h\in\mathcal{H}}
  \left\{
    |L_S(h)-L_{\mathcal{D}}(h)|>\varepsilon
  \right\},
$$

 so by union bound, 

$$
\mathbb{P}\left[
    \exists h\in\mathcal{H}:
    |L_S(h)-L_{\mathcal{D}}(h)|>\varepsilon
  \right]
  \le
  2|\mathcal{H}|\exp(-2m\varepsilon^2).
$$

 makes the right side not exceed $\delta$, get 

$$
m
  \ge
  \frac{1}{2\varepsilon^2}
  \log\frac{2|\mathcal{H}|}{\delta}.
$$

 This formula is not to memorize constants, but to see the structure clearly: the sample size increases with $1/\varepsilon^2$, with $\log(1/\delta)$, and with the logarithm of the model class size. 

##### ERM-enabled PAC derivation 

 More common in the exam is the achievable situation: the algorithm outputs any $h_S$ with zero training error. To prove that the true error of $h_S$ is small, just eliminate the "bad but coincidentally consistent" hypothesis. $h$ is called a bad hypothesis if 

$$
L_{\mathcal{D}}(h)>\varepsilon.
$$

 For a fixed bad hypothesis $h$, the probability that a sample does not reveal its error is at most $1-\varepsilon$. Since the samples are independent, the probability that none of the $m$ samples will reveal its error is at most 

$$
(1-\varepsilon)^m
  \le
  \exp(-m\varepsilon).
$$

if $\mathcal{H}$ is limited, the probability that there is a bad hypothesis that is still completely consistent with the training set does not exceed 

$$
|\mathcal{H}|\exp(-m\varepsilon).
$$

. Let the probability not exceed $\delta$, and obtain realizable PAC The sample size condition of 

$$
m
  \ge
  \frac{1}{\varepsilon}
  \log\frac{|\mathcal{H}|}{\delta}.
$$

This bound is different from the two-sided uniform convergence bound constant above $\varepsilon$, because it uses stronger "training error is zero" and "realizable" assumptions [@shalev2014uml; @mohri2018foundations]. 

**Exam Reminder. ** Exam questions often require the transition from "fixed $h$" to "existence $h$": the first step is to write the Bernoulli error variable, the second step is to use concentrated inequality, and the third step is to make a union bound for $\mathcal{H}$. If the third step is missed, usually only the bound of a single hypothesis can be obtained. 

### Agnostic PAC Learning and Uniform Convergence

In reality, the objective function may not belong to $\mathcal{H}$, and the label may even contain noise. Agnostic PAC does not assume realizability, but requires the algorithm to output a hypothesis that is close to the within-class optimal: 

$$
L_{\mathcal{D}}(A(S))
  \le
  \inf_{h\in\mathcal{H}}L_{\mathcal{D}}(h)+\varepsilon
$$

 holds with a probability of at least $1-\delta$. Here $\inf_{h\in\mathcal{H}}L_{\mathcal{D}}(h)$ is the *in-class optimal risk* (class-optimal risk), not the approximation error. The approximate error relative to the Bayesian risk $L^*_{\mathrm{Bayes}}$ should be written $\inf_{h\in\mathcal{H}}L_{\mathcal{D}}(h)-L^*_{\mathrm{Bayes}}$. If approximate ERM is used below, the optimization error must be listed separately; this section first analyzes the precise ERM. The difficulty with ERM becomes proving uniform convergence: 

$$
\sup_{h\in\mathcal{H}}
  |L_S(h)-L_{\mathcal{D}}(h)|
  \le \varepsilon.
$$

Once uniform convergence is established, the generalization analysis of ERM is almost mechanical. Let $h^*\in\operatorname*{arg\,min}_{h\in\mathcal{H}}L_{\mathcal{D}}(h)$, then 

$$
L_{\mathcal{D}}(h_S)
  \le L_S(h_S)+\varepsilon
  \le L_S(h^*)+\varepsilon
  \le L_{\mathcal{D}}(h^*)+2\varepsilon.
$$

The first and third steps come from uniform convergence, and the second step comes from the ERM definition. This type of "three-line proof" is the most common skeleton for learning theoretical exam questions. 

If the question requires that the final excess risk does not exceed $\varepsilon$, the uniform convergence accuracy is usually set to $\varepsilon/2$. That is, if 

$$
\sup_{h\in\mathcal{H}}
  |L_S(h)-L_{\mathcal{D}}(h)|
  \le \frac{\varepsilon}{2},
$$

, the same derivation gives 

$$
L_{\mathcal{D}}(h_S)
  \le
  L_{\mathcal{D}}(h^*)+\varepsilon.
$$

. This is the source of extra constants that often appear in the complexity of agnostic ERM samples, rather than new theoretical difficulties. 

### VC dimension, growth function and Sauer's lemma

When $\mathcal{H}$ is infinite, $|\mathcal{H}|$ can no longer be used to directly measure complexity. VC theory measures the ability of a hypothetical class to achieve arbitrary labeling on a finite set of points. 

**[Definition]** Given $m$ points $x_1,\ldots,x_m$, the growth function is defined as 

$$
\tau_{\mathcal{H}}(m)
  =
  \max_{x_1,\ldots,x_m}
  \left|
  \{
    (h(x_1),\ldots,h(x_m)):h\in\mathcal{H}
  \}
  \right|.
$$

If *exists* a $m$ point set, all its $2^m$ binary labels can be realized by $\mathcal{H}$, it is said that the point set is shattered by $\mathcal{H}$. Using the supremum instead of the maximum value, the strict definition of VC dimension is 

$$
d_{\mathrm{VC}}(\mathcal{H})
  =
  \sup\{m\in\mathbb{N}:\tau_{\mathcal{H}}(m)=2^m\},
$$

Sauer’s lemma shows that the limited VC dimension will compress exponential growth into polynomial growth: If $\operatorname{VCdim}(\mathcal{H})=d<\infty$, then 

$$
\tau_{\mathcal{H}}(m)
  \le
  \sum_{i=0}^{d}\binom{m}{i}
  \le
  \left(\frac{em}{d}\right)^d
  \quad (m\ge d).
$$

 and when the set has no upper bound, $d_{\mathrm{VC}}(\mathcal{H})=\infty$. The meaning of this lemma is: even if $\mathcal{H}$ is infinite, as long as the VC dimension is limited, the number of labeling patterns it can generate on $m$ samples is only polynomial; but to obtain uniform convergence on random samples, $|\mathcal{H}|$ in the finite class proof cannot be directly replaced by $\tau_{\mathcal{H}}(m)$. 

##### From Sauer to the VC Generalization Bound

**[Proof Skeleton]** The following skeleton is for binary class $0$--$1$ losses (more generally, can be replaced by bounded losses and adjust the constants accordingly), and takes $S,S'\overset{\mathrm{iid}}{\sim}\mathcal{D}^m$. Let $S'$ be an independent ghost sample. First compare $L_{\mathcal{D}}$ with $L_{S'}$, and then use symmetrization to write the deviation as the difference between the two empirical risks on $S\cup S'$. Given these $2m$ points, $\mathcal{H}$ will only generate at most $\tau_{\mathcal{H}}(2m)$ marked patterns, and finally use union bound on these patterns. Therefore, within the range of constants and sample sizes that satisfy the symmetrization premise, we have 

$$
\mathbb{P}\left[
    \exists h\in\mathcal{H}:
    |L_S(h)-L_{\mathcal{D}}(h)|>\varepsilon
  \right]
  \lesssim
  \tau_{\mathcal{H}}(2m)\exp(-c m\varepsilon^2),
$$

 where $c>0$ is the constant given by the concentration inequality. If $\operatorname{VCdim}(\mathcal{H})=d$, Sauer’s lemma gives 

$$
\log \tau_{\mathcal{H}}(2m)
  \le
  d\log\left(\frac{2em}{d}\right).
$$

 such that the failure probability does not exceed $\delta$, which requires 

$$
d\log\left(\frac{2em}{d}\right)
  -
  c m\varepsilon^2
  \le
  \log\delta.
$$

 can be read out as 

$$
\varepsilon
  \gtrsim
  \sqrt{
    \frac{
      d\log(2em/d)+\log(1/\delta)
    }{m}
  }.
$$

. This is the origin of the VC generalization world. If the exam requires "explanation of the relationship between sample complexity and VC dimension", the chain of ghost sample, symmetrization, $\tau_{\mathcal{H}}(2m)$ and Sauer's lemma should be written instead of directly substituting the growth function into the Hoeffding bound of fixed assumptions. 

Typical writing in the VC generalization world

$$
L_{\mathcal{D}}(h)
  \le
  L_S(h)
  +
  O\left(
    \sqrt{\frac{d\log(m/d)+\log(1/\delta)}{m}}
  \right)
$$

 is true simultaneously for all $h\in\mathcal{H}$. You don’t have to stick to constants in the exam, but you must understand that $d/m$ is the main vector: when the sample size is much larger than the VC dimension, the training error will be reliable. 

### Rademacher complexity 

 Rademacher complexity is another, more granular measure of complexity. It asks: How well do classes of functions fit random noise? Given the sample $S=(z_1,\ldots,z_m)$, the empirical Rademacher complexity is 

$$
\widehat{\mathfrak{R}}_S(\mathcal{G})
  =
  \mathbb{E}_{\sigma}
  \left[
    \sup_{g\in\mathcal{G}}
    \frac1m
    \sum_{i=1}^{m}\sigma_i g(z_i)
  \right],
$$

 where $\sigma_i$ independently and uniformly takes on the value of $\{-1,+1\}$. If $\mathcal{G}$ can make the inner product $\sum_i\sigma_i g(z_i)$ very large, it means that it can be highly correlated with random tags, with high complexity and high risk of generalization. It is more data-dependent than VC dimensions and is especially natural in margin classes and kernel methods. 

##### The derivation entrance of Rademacher bound 

 Let $\mathcal{G}$ be a loss function class whose value is $[0,1]$. We want to control 

$$
\sup_{g\in\mathcal{G}}
  \left(
    \mathbb{E}g(z)-\frac1m\sum_{i=1}^{m}g(z_i)
  \right).
$$

 and introduce a ghost sample $S'=(z_1',\ldots,z_m')$ that is independent of $S$. Because $\mathbb{E}g(z)=\mathbb{E}_{S'}m^{-1}\sum_i g(z_i')$, first replace the overall expectation with the ghost sample average: 

$$
\mathbb{E}_S
  \sup_g
  \left(
    \mathbb{E}g-\widehat{\mathbb{E}}_S g
  \right)
  \le
  \mathbb{E}_{S,S'}
  \sup_g
  \frac1m
  \sum_{i=1}^{m}
  \left(g(z_i')-g(z_i)\right).
$$

 and then use Rademacher symbols to randomly exchange $z_i$ with $z_i'$: 

$$
\mathbb{E}_{S,S'}
  \sup_g
  \frac1m
  \sum_i
  \left(g(z_i')-g(z_i)\right)
  =
  \mathbb{E}_{S,S',\sigma}
  \sup_g
  \frac1m
  \sum_i
  \sigma_i
  \left(g(z_i')-g(z_i)\right).
$$

 By the subadditivity of the supremum, the right-hand side does not exceed the sum of two identical Rademacher terms, so we get 

$$
\mathbb{E}_S
  \sup_g
  \left(
    \mathbb{E}g-\widehat{\mathbb{E}}_S g
  \right)
  \le
  2\mathfrak{R}_m(\mathcal{G}).
$$

here $\mathfrak{R}_m(\mathcal{G})=\mathbb{E}_S[\widehat{\mathfrak{R}}_S(\mathcal{G})]$ is the overall version of the empirical Rademacher complexity after sampling the sample and taking the expectation, $\widehat{\mathbb{E}}_S g=m^{-1}\sum_i g(z_i)$ is the sample average. The high-probability version of 

 is combined with [McDiarmid](https://www.perplexity.ai/search/ebf75353-a7f9-4b19-9be9-febe0e45faac) or [Hoeffding-type condensed inequality](https://www.perplexity.ai/search/434a7a20-826a-4983-be61-18b439a4e602). This derivation is called symmetrization, and is where Rademacher complexity really enters the realm of generalization [@mohri2018foundations]. 


##### Implementation Mapping

In the code, $S$ is the data matrix and label vector, $h$ is the model object, $L_S$ is the average loss returned by the training loop, $L_{\mathcal{D}}$ It can only be approximated with a validation set or a test set. "Independent and identically distributed sampling" is often mentioned in theoretical proof; in engineering, it corresponds to data segmentation, random seeds, deduplication, and avoidance of training and test leakage. 

##### Assessment content

- Write the precise definition of PAC or agnostic PAC, distinguishing between $\varepsilon$, $\delta$ and sample complexity. 

 - Infer finite class sample complexity from Bernoulli indicator variables and union bound. 

- Define shattering, growth function, VC dimension, and use Sauer's lemma to obtain a uniform convergence form. 

-Explain the relationship between approximation error, estimation error and model selection. 

- Read the definition of Rademacher complexity and explain why it measures the ability to "fit random noise". 

## Model selection, bias variance and classic supervision models

**Source location:** This section corresponds to the syllabus "Model selection, bias variance, linear regression, logistic regression, decision tree, nearest neighbor, SVM, kernel method, compressed sensing". Basic model reference [@shalev2014uml]; kernel method reference [@mohri2018foundations]; compressed sensing reference [@candes2006compressive]. 

### Model selection and bias variance

The core of model selection is not to select the model with the lowest training error, but to balance the expression ability and generalization reliability. It is clearer to break down the error into two categories: 

$$
L_{\mathcal{D}}(h_S)-L_{\mathcal{D}}(h^*_{\mathrm{Bayes}})
  =
  \underbrace{
    L_{\mathcal{D}}(h^*_{\mathcal{H}})-L_{\mathcal{D}}(h^*_{\mathrm{Bayes}})
  }_{\text{approximation error}}
  +
  \underbrace{
    L_{\mathcal{D}}(h_S)-L_{\mathcal{D}}(h^*_{\mathcal{H}})
  }_{\text{estimation error}},
$$

where $h^*_{\mathcal{H}}$ is the predictor with the smallest true risk within $\mathcal{H}$. The larger the model class, the smaller the approximation error tends to be, but the larger the estimation error is. The smaller the model class, the more stable the estimate, but may be underfitted. 

Bias variance decomposition is the corresponding version under squared loss. Assume that the training set is random, and the learning algorithm outputs $\hat f_S(x)$. For fixed $x$, there is 

$$
\mathbb{E}_S[(\hat f_S(x)-f(x))^2]
  =
  \left(\mathbb{E}_S[\hat f_S(x)]-f(x)\right)^2
  +
  \mathbb{E}_S\left[
    \left(\hat f_S(x)-\mathbb{E}_S[\hat f_S(x)]\right)^2
  \right].
$$

. The first item is bias squared, which indicates how far the average prediction is from the true function; the second item is variance, which indicates how much the prediction fluctuates after changing a batch of training sets. Regularization, cross-validation, and structural risk minimization (SRM) can all be seen as adjusting parameters between the two. 

##### Derivation of bias variance decomposition

 Let 

$$
\bar f(x)=\mathbb{E}_S[\hat f_S(x)].
$$

 add and subtract the error term $\bar f(x)$: 

$$
\hat f_S(x)-f(x)
  =
  \left(\hat f_S(x)-\bar f(x)\right)
  +
  \left(\bar f(x)-f(x)\right).
$$

 squared and taking the expectation of training set randomness: 

$$
\mathbb{E}_S[(\hat f_S(x)-f(x))^2]
  =
  \mathbb{E}_S[(\hat f_S(x)-\bar f(x))^2]
  +
  (\bar f(x)-f(x))^2
  +
  2(\bar f(x)-f(x))
  \mathbb{E}_S[\hat f_S(x)-\bar f(x)].
$$

The last term is zero because 

$$
\mathbb{E}_S[\hat f_S(x)-\bar f(x)]
  =
  \mathbb{E}_S[\hat f_S(x)]-\bar f(x)
  =
  0.
$$

 so we get bias squared plus variance. If the observation label also contains noise $y=f(x)+\xi$, and $\mathbb{E}[\xi\mid x]=0$, $\operatorname{Var}(\xi\mid x)=\sigma^2$, the mean square error of predicting $y$ will also have more irreducible noise $\sigma^2$. 

### linear regression

Linear regression hypothesis

$$
h_w(x)=\langle w,x\rangle+b,
$$

 Commonly used squared loss 

$$
\ell(h_w,(x,y))=(h_w(x)-y)^2.
$$

Write the sample as a design matrix $X\in\mathbb{R}^{m\times d}$, where The $i$ line is $x_i^\top$; the label vector is written $\mathbf{y}=(y_1,\ldots,y_m)^\top\in\mathbb{R}^m$. Ignoring the bias or incorporating the bias into a list of constant features, the least squares problem is 

$$
\min_{w\in\mathbb{R}^d}
  \frac1m\|Xw-\mathbf{y}\|_2^2.
$$

The first-order condition gives the normal equation 

$$
X^\top Xw=X^\top \mathbf{y}.
$$

if $X^\top X$ If it is invertible, then 

$$
w=(X^\top X)^{-1}X^\top \mathbf{y}.
$$

If it is irreversible, it means that the features are collinear or the samples are insufficient, and pseudo-inversion or regularization is required. Ridge regression changes the target to 

$$
\min_w
  \frac1m\|Xw-\mathbf{y}\|_2^2+\lambda\|w\|_2^2,
$$

The first-order condition becomes 

$$
(X^\top X+m\lambda I)w=X^\top \mathbf{y}.
$$

. This explains the numerical significance of regularization: it pushes the ill-conditioned matrix in the positive definite direction, improving stability. Here $I\in\mathbb{R}^{d\times d}$ is the identity matrix and $\lambda\ge0$ is the regularization strength. 

##### Derivation of normal equations

 Let 

$$
F(w)=\frac1m\|Xw-\mathbf{y}\|_2^2
  =
  \frac1m(Xw-\mathbf{y})^\top(Xw-\mathbf{y}).
$$

 be expanded to get 

$$
F(w)
  =
  \frac1m
  \left(
    w^\top X^\top Xw
    -
    2\mathbf{y}^\top Xw
    +
    \mathbf{y}^\top\mathbf{y}
  \right).
$$

 for $w$ Find the gradient: 

$$
\nabla F(w)
  =
  \frac{2}{m}X^\top Xw
  -
  \frac{2}{m}X^\top\mathbf{y}.
$$

 Let $\nabla F(w)=0$ get $X^\top Xw=X^\top\mathbf{y}$. Ridge regression just adds $2\lambda w$ in the gradient, so 

$$
\frac{2}{m}X^\top Xw
  -
  \frac{2}{m}X^\top\mathbf{y}
  +
  2\lambda w
  =
  0,
$$

 is equivalent to 

$$
(X^\top X+m\lambda I)w=X^\top\mathbf{y}.
$$

### logistic regression

 Logistic regression is used for binary classification, but the output is probability: 

$$
p_w(y=1\mid x)=\sigma(\langle w,x\rangle+b),
  \qquad
  \sigma(t)=\frac{1}{1+\exp(-t)}.
$$

if label $y\in\{-1,+1\}$, the logical loss is 

$$
\ell(w,(x,y))
  =
  \log\left(1+\exp(-y\langle w,x\rangle)\right).
$$

 This can be deduced from the maximum likelihood. Its advantage is that it is convex and differentiable, so gradient descent can solve it stably. The gradient is 

$$
\nabla_w\ell(w,(x,y))
  =
  -\frac{y x}{1+\exp(y\langle w,x\rangle)}.
$$

 exams often compare logistic regression with SVM: logistic loss is smooth and has strong probabilistic interpretation; hinge loss more directly pursues margin; both are convex surrogate losses, replacing $0$-$1$ losses with optimizable losses. 

##### MLE derivation of logical loss

 first represents the label with $y\in\{0,1\}$. Suppose 

$$
p_w(y=1\mid x)=\sigma(\langle w,x\rangle+b),
  \qquad
  p_w(y=0\mid x)=1-\sigma(\langle w,x\rangle+b).
$$

single sample likelihood can be combined and written as 

$$
p_w(y\mid x)
  =
  p^y(1-p)^{1-y},
  \qquad
  p=\sigma(\langle w,x\rangle+b).
$$

The negative log-likelihood is 

$$
-\log p_w(y\mid x)
  =
  -y\log p-(1-y)\log(1-p).
$$

If used instead $y\in\{-1,+1\}$, order $s=y(\langle w,x\rangle+b)$. When $y=1$, the negative log-likelihood is 

$$
-\log\sigma(\langle w,x\rangle+b)
  =
  \log(1+\exp(-s)).
$$

 when $y=-1$ When , the correct class probability is 

$$
1-\sigma(\langle w,x\rangle+b)
  =
  \sigma(-\langle w,x\rangle-b),
$$

The negative log likelihood is also $\log(1+\exp(-s))$. Therefore, unified we get 

$$
\ell(w,(x,y))
  =
  \log(1+\exp(-y(\langle w,x\rangle+b))).
$$

 Let $s=y\langle w,x\rangle$ and temporarily ignore $b$, the chain rule gives 

$$
\nabla_w \ell
  =
  \frac{1}{1+\exp(-s)}
  \exp(-s)(-y x)
  =
  -\frac{y x}{1+\exp(s)}.
$$

 This is the previous gradient formula. 

### decision tree

The decision tree recursively divides the input space into several regions, and each leaf gives a prediction. Its advantage is that it is interpretable, but its disadvantage is that it is easy to overfit if the depth or number of leaves is not limited. A tree with $k$ leaves can remember roughly $k$ local regions, so the complexity grows with tree size. 

A common splitting criterion is information gain or Gini impurity. If the proportion of positive classes in the node is $p$, the entropy is 

$$
H(p)=-p\log p-(1-p)\log(1-p),
$$

Gini impurity is 

$$
G(p)=2p(1-p).
$$

The goal of splitting is to make the child nodes more pure. For the candidate split $a$, the information gain can be written as 

$$
\operatorname{Gain}(a)
  =
  H(S)
  -
  \sum_{v}
  \frac{|S_v|}{|S|}
  H(S_v).
$$

Tree model assessment usually does not require complex proofs by hand, but requires you to explain the source of overfitting, pruning or MDL/regularization ideas, and why greedy splitting does not guarantee global optimality. 

### nearest neighbor algorithm

$k$-nearest neighbors does not explicitly train parameters, but looks for the closest training samples when predicting. The classification rule is 

$$
\hat y(x)
  =
  \operatorname{majority}
  \{y_i:x_i\in N_k(x)\},
$$

 where $N_k(x)$ is the $k$ training points closest to $x$. When $k$ is small, the variance is large and is easily affected by noise; when $k$ is large, the deviation is large and local structures are averaged out. Distance metrics and feature scaling are extremely important because Euclidean distance will be dominated by features with large dimensions. 

### SVM, margin and kernel methods 

The core of linear SVM is margin. Given a binary classification sample $y_i\in\{-1,+1\}$, hard margin SVM finds 

$$
\min_{w,b}\frac12\|w\|_2^2
  \quad
  \text{s.t.}
  \quad
  y_i(\langle w,x_i\rangle+b)\ge 1,\quad i=1,\ldots,m.
$$

Why minimizing $\|w\|$ is equivalent to maximizing margin? Since the distance from the point to the hyperplane is 

$$
\frac{|\langle w,x\rangle+b|}{\|w\|_2}.
$$

, the constraint fixes the functional interval to at least $1$, so the geometric interval is at least $1/\|w\|_2$. Minimizing $\|w\|$ is maximizing the interval. 

 Use soft margin or hinge loss for non-separable data: 

$$
\min_{w,b}
  \lambda\|w\|_2^2
  +
  \frac1m
  \sum_{i=1}^{m}
  \max\{0,1-y_i(\langle w,x_i\rangle+b)\}.
$$

The kernel method maps the input to a high-dimensional feature space $\Phi(x)$, but does not calculate it explicitly $\Phi$, only calculates 

$$
K(x,x')=\langle \Phi(x),\Phi(x')\rangle.
$$

 Strictly speaking, the real-valued kernel $k:\mathcal{X}\times\mathcal{X}\to\mathbb{R}$ must be symmetric, that is, $k(x,x')=k(x',x)$, and for any finite point set $x_1,\ldots,x_m$ and any coefficient $c\in\mathbb{R}^m$ Satisfying 

$$
\sum_{i,j=1}^{m}c_i c_j k(x_i,x_j)\ge 0.
$$

 Equivalently, every finite Gram matrix 

$$
[K(x_i,x_j)]_{i,j=1}^{m}
$$

 is positive semi-definite. Under this condition, there exists a certain Hilbert space and feature map $\Phi$ such that $k(x,x')=\langle\Phi(x),\Phi(x')\rangle$. This is not an admission that "arbitrary similarity functions are valid"; the Mercer-type continuity and compactness assumptions only arise additionally when an expansion of the integral operator spectrum is required. The focus of the kernel skill test is on two points: first, nonlinear boundaries can become linear separations in high-dimensional space; second, generalization is not only determined by high-dimensional dimensions, but margin and regularization are the key. 

##### SVM duality and kernel trick derivation

The Lagrangian function of hard margin SVM is 

$$
\mathcal{L}(w,b,\alpha)
  =
  \frac12\|w\|_2^2
  -
  \sum_{i=1}^{m}
  \alpha_i
  \left(
    y_i(\langle w,x_i\rangle+b)-1
  \right),
$$

where $\alpha_i\ge0$ is the $i$ constrained Lagrange multipliers. Find the stationary point conditions for $w$ and $b$: 

$$
\nabla_w\mathcal{L}
  =
  w-\sum_{i=1}^{m}\alpha_i y_i x_i
  =
  0,
  \qquad
  \frac{\partial\mathcal{L}}{\partial b}
  =
  -\sum_{i=1}^{m}\alpha_i y_i
  =
  0.
$$

 Therefore 

$$
w=\sum_{i=1}^{m}\alpha_i y_i x_i,
  \qquad
  \sum_{i=1}^{m}\alpha_i y_i=0.
$$

 put $w$ Substituting back into the Lagrangian function, we get the dual problem 

$$
\max_{\alpha\in\mathbb{R}^m}
  \sum_{i=1}^{m}\alpha_i
  -
  \frac12
  \sum_{i=1}^{m}
  \sum_{j=1}^{m}
  \alpha_i\alpha_j y_i y_j
  \langle x_i,x_j\rangle
$$

 constrained to 

$$
\alpha_i\ge0,
  \qquad
  \sum_{i=1}^{m}\alpha_i y_i=0.
$$

. Note that the training objective only depends on the sample through the inner product $\langle x_i,x_j\rangle$. If the sample is replaced by the feature map $\Phi(x_i)$, the inner product becomes 

$$
\langle \Phi(x_i),\Phi(x_j)\rangle=K(x_i,x_j).
$$

So there is no need to explicitly calculate the high-dimensional $\Phi(x)$, just replace $\langle x_i,x_j\rangle$ with $K(x_i,x_j)$ in the dual objective. This is the kernel trick. When predicting, only the training points of 

$$
h(x)
  =
  \operatorname{sign}
  \left(
    \sum_{i=1}^{m}
    \alpha_i y_i K(x_i,x)
    +
    b
  \right).
$$

 will appear in the prediction formula, and they are support vectors. 

### compressed sensing

 Compressed sensing answers a seemingly impossible question: If an unknown signal $x\in\mathbb{R}^N$ is very high-dimensional but has only $s$ non-zero or approximately non-zero components, can it be recovered with far fewer than $N$ linear measurements? The 

 measurement model is 

$$
y=Mx,
  \qquad
  M\in\mathbb{R}^{K\times N},
  \qquad
  K\ll N.
$$

 and the sparsest solution directly found is 

$$
\min_z \|z\|_0
  \quad
  \text{s.t.}
  \quad
  Mz=y,
$$

 but this is a combination optimization. The core result of compressed sensing is that sparse signals can be accurately or stably restored using convex relaxation 

$$
\min_z \|z\|_1
  \quad
  \text{s.t.}
  \quad
  Mz=y
$$

 under random measurements or a measurement matrix that satisfies the null-space property, or satisfies a sufficiently strong RIP condition required by a specific theorem. RIP is of the form: for all $s$-sparse vectors $z$, 

$$
(1-\delta_S)\|z\|_2^2
  \le
  \|Mz\|_2^2
  \le
  (1+\delta_S)\|z\|_2^2.
$$

 This means that $M$ is approximately distance-preserving over all sparse subspaces, and thus does not squash two different sparse vectors into the same measurement. Compressed sensing is placed within machine learning theory in the syllabus, which usually tests the basic ideas of "sparsity + convex relaxation + random measurement + sample/measurement complexity", rather than complete harmonic analysis. 

##### Why RIP Implies Uniqueness

 Let $z_1,z_2$ be both $s$-sparse vectors with the same measurement: 

$$
Mz_1=Mz_2.
$$

 Let $u=z_1-z_2$. The difference between two $s$-sparse vectors is at most $2s$-sparse, so if $M$ satisfies $2s$-RIP, and $\delta_{2s}<1$, then 

$$
(1-\delta_{2s})\|u\|_2^2
  \le
  \|Mu\|_2^2.
$$

 but $Mu=Mz_1-Mz_2=0$, then 

$$
(1-\delta_{2s})\|u\|_2^2\le 0.
$$

Since $1-\delta_{2s}>0$, there can only be $u=0$, that is, $z_1=z_2$. So $2s$-RIP at least guarantees the identifiability of the $s$-sparse solution in the $\ell_0$ problem; it does not automatically deduce the recovery of the $\ell_1$ solution. The latter is usually derived from a null-space property, or a sufficiently strong RIP condition. When observing $y=Mx+e$ and $\|e\|_2\le\eta$ with noise, BPDN

$$
\min_z\|z\|_1\quad\text{s.t.}\quad\|Mz-y\|_2\le\eta
$$

 satisfies $\|\hat x-x\|_2\le C_0\eta+C_1\sigma_s(x)_1/\sqrt{s}$ under the corresponding RIP conditions, where $\sigma_s(x)_1=\inf_{\|z\|_0\le s}\|x-z\|_1$. This is the precise definition of "stable and approximately sparse" [@candes2006compressive]. 

##### Assessment content

- Explain model selection using approximation error and estimation error. 

- deduce the normal equation of linear regression and explain why regularization is needed when it is irreversible. 

- Infer logistic regression loss and gradient, compare logistic loss and hinge loss. 

- Explain why decision trees overfit, and the role of pruning, depth limits, and MDL. 

- Write the SVM hard/soft margin target and explain the relationship between margin and $\|w\|$. 

- Defines the positive semi-definite conditions for kernel functions and Gram matrices. 

 - An explanation of the relationship between compressed sensing $K\ll N$, sparsity, $\ell_1$ relaxation and RIP. 

## Optimization methods: from convexity to modern first-order algorithms

**Source location:** This section corresponds to the syllabus "convex sets and convex functions, subdifferentials, gradient descent, stochastic gradient descent, stochastic coordinate descent, momentum acceleration, adaptive learning rate". Basic reference [@nesterov2018convex; @beck2017first; @shalev2014uml]. 

### Convex sets, convex functions and first-order conditions

The set $C\subseteq\mathbb{R}^d$ is convex, meaning that any $x,y\in C$ and $\theta\in[0,1]$ have 

$$
\theta x+(1-\theta)y\in C.
$$

 function $f:C\to\mathbb{R}$ is convex, indicating 

$$
f(\theta x+(1-\theta)y)
  \le
  \theta f(x)+(1-\theta)f(y).
$$

 if $f$ Differentiable, convexity is equivalent to the first-order lower bound 

$$
f(y)\ge f(x)+\langle \nabla f(x),y-x\rangle.
$$

. The geometric meaning of this formula is: the image of the convex function is always on the tangent plane at any point. Therefore, if $\nabla f(x^*)=0$, there is 

$$
f(y)\ge f(x^*)
$$

, which is true for all $y$, that is, any stationary point is the global optimal point. This is the key difference between convex optimization and non-convex deep learning optimization. 

##### Derivation of first-order conditions

 Let $f$ be differentiable and convex. By convexity, for any $t\in(0,1]$, there is 

$$
f((1-t)x+ty)
  \le
  (1-t)f(x)+tf(y).
$$

 sorted out by 

$$
\frac{f(x+t(y-x))-f(x)}{t}
  \le
  f(y)-f(x).
$$

 order $t\downarrow0$, the left hand side converges to the directional derivative 

$$
\langle\nabla f(x),y-x\rangle.
$$

 Therefore 

$$
f(y)\ge f(x)+\langle\nabla f(x),y-x\rangle.
$$

 This shows that any tangent plane of the convex function is the global lower bound. If in the exam it is required to prove that "the local optimum is the global optimum", this first-order lower bound is usually used for $x=x^*$. 

If the function is not differentiable, use subgradient. The vector $g\in\mathbb{R}^d$ is the subgradient of $f$ in $x$ if 

$$
f(y)\ge f(x)+\langle g,y-x\rangle
  \quad
  \forall y.
$$

 all subgradients constitute the subdifferential $\partial f(x)$. The optimality condition becomes 

$$
0\in \partial f(x^*).
$$

. This is called the Fermat rule, which is the most commonly tested optimality condition in non-convex optimization. There are also two common properties that need to be remembered: if $f$ and $g$ are appropriate convex functions, and common regular conditions are satisfied, then 

$$
\partial(f+g)(x)
  =
  \partial f(x)+\partial g(x).
$$

 if $A\in\mathbb{R}^{m\times d}$, $b\in\mathbb{R}^m$, then the affine composite satisfies 

$$
\partial (f(Ax+b))
  =
  A^\top \partial f(Ax+b).
$$

These properties explain why Lasso, hinge loss and composite optimization can be processed in the form of "smooth gradient + non-smooth subgradient/prox" [@nesterov2018convex; @beck2017first]. 

 For example, $f(x)=|x|$ is not differentiable at $0$, but 

$$
\partial |0|=[-1,1],
$$

 so $0\in\partial |0|$, $0$ are minimum points. 

### Smoothness, strong convexity and the descent lemma

 function $f$ is $L$-smooth, representing gradient Lipschitz: 

$$
\|\nabla f(x)-\nabla f(y)\|
  \le
  L\|x-y\|.
$$

Equivalently, 

$$
f(y)
  \le
  f(x)+\langle\nabla f(x),y-x\rangle
  +\frac{L}{2}\|y-x\|^2.
$$

This is called descent lemma. Substituting $y=x-\eta\nabla f(x)$, we get 

$$
f(x-\eta\nabla f(x))
  \le
  f(x)
  -
  \eta\left(1-\frac{L\eta}{2}\right)
  \|\nabla f(x)\|^2.
$$

 As long as $0<\eta<2/L$, the function value decreases. It is commonly used in exams to prove gradient descent convergence. The complete substitution of this step of 

 is as follows: 

$$
f(x-\eta\nabla f(x))
  \le
  f(x)
  +
  \langle\nabla f(x),-\eta\nabla f(x)\rangle
  +
  \frac{L}{2}\|-\eta\nabla f(x)\|^2.
$$

The inner product term is $-\eta\|\nabla f(x)\|^2$, and the quadratic term is $(L\eta^2/2)\|\nabla f(x)\|^2$, after merging, we get 

$$
f(x-\eta\nabla f(x))
  \le
  f(x)
  -
  \eta\left(1-\frac{L\eta}{2}\right)\|\nabla f(x)\|^2.
$$

 function $f$ is $\mu$-strongly convex, meaning 

$$
f(y)\ge
  f(x)+\langle\nabla f(x),y-x\rangle
  +\frac{\mu}{2}\|y-x\|^2.
$$

Strong convexity at most states that the minimum point is unique *if* it exists; existence can also be guaranteed by, for example, lower semicontinuity on a closed and bounded feasible region, or in the unconstrained case $f$ proper, lower-semicontinuous and coercive. If $f$ is simultaneously $L$-smooth and $\mu$-strongly convex, and the minimum point $x^*$ exists, gradient descent takes $\eta=1/L$ Sometimes there is 

$$
f(x_t)-f(x^*)
  \le
  \left(1-\frac{\mu}{L}\right)^t
  \left(f(x_0)-f(x^*)\right).
$$

 where $L/\mu$ is the condition number. The larger it is, the sicker it is, and the slower the convergence. 

##### Derivation of strongly convex linear convergence

Take $x_{t+1}=x_t-\frac1L\nabla f(x_t)$. By the descent lemma, 

$$
f(x_{t+1})
  \le
  f(x_t)
  -
  \frac{1}{2L}\|\nabla f(x_t)\|^2.
$$

For the $\mu$-strongly convex function, there is 

$$
\|\nabla f(x)\|^2
  \ge
  2\mu(f(x)-f(x^*)).
$$

. Substituting it into the above formula, we get 

$$
f(x_{t+1})-f(x^*)
  \le
  \left(1-\frac{\mu}{L}\right)
  (f(x_t)-f(x^*)).
$$

recursion $t$ times we get 

$$
f(x_t)-f(x^*)
  \le
  \left(1-\frac{\mu}{L}\right)^t
  (f(x_0)-f(x^*)).
$$

The same structure is used in every step here: smoothness decreases, and strong convexity connects the gradient norm and the function value difference. 

### GD, SGD and stochastic coordinate descent

Full batch gradient descent is 

$$
x_{t+1}=x_t-\eta_t\nabla f(x_t).
$$

If the goal is the empirical risk 

$$
f(w)=\frac1m\sum_{i=1}^{m}\ell_i(w),
$$

 then the full gradient needs to traverse all samples. Stochastic gradient descent uses unbiased estimation of 

$$
g_t=\nabla \ell_{i_t}(w_t),
  \qquad
  \mathbb{E}[g_t\mid w_t]=\nabla f(w_t),
$$

 and updates 

$$
w_{t+1}=w_t-\eta_t g_t.
$$

SGD The advantage is that the single step is cheap and can be learned online; the price is that the variance is large and requires learning rate scheduling, mini-batch, momentum or adaptive methods. The most important step in the proof is to expand the square distance: 

$$
\|w_{t+1}-w^*\|^2
  =
  \|w_t-w^*\|^2
  -
  2\eta_t\langle g_t,w_t-w^*\rangle
  +
  \eta_t^2\|g_t\|^2.
$$

 average the conditional expectations, and then use convexity to lower the inner product to the function value difference to get the convergence bound. 

##### Standard derivation of SGD convergence inequalities

Assumption $f$ Convex, $w^*\in\operatorname*{arg\,min}_w f(w)$, and the stochastic gradient satisfies 

$$
\mathbb{E}[g_t\mid w_t]=\nabla f(w_t),
  \qquad
  \mathbb{E}[\|g_t\|^2\mid w_t]\le G^2.
$$

 Starting from the squared distance expansion, for $w_t$ The condition takes the expectation: 

$$
\mathbb{E}[\|w_{t+1}-w^*\|^2\mid w_t]
  \le
  \|w_t-w^*\|^2
  -
  2\eta_t\langle\nabla f(w_t),w_t-w^*\rangle
  +
  \eta_t^2G^2.
$$

 According to the first-order condition of convexity, 
 
$$
f(w_t)-f(w^*)
  \le
  \langle\nabla f(w_t),w_t-w^*\rangle.
$$

So 

$$
2\eta_t(f(w_t)-f(w^*))
  \le
  \|w_t-w^*\|^2
  -
  \mathbb{E}[\|w_{t+1}-w^*\|^2\mid w_t]
  +
  \eta_t^2G^2.
$$

 Right $t=0,\ldots,T-1$ Sum, distance term telescoping: 

$$
\sum_{t=0}^{T-1}
  2\eta_t\mathbb{E}[f(w_t)-f(w^*)]
  \le
  \|w_0-w^*\|^2
  +
  G^2\sum_{t=0}^{T-1}\eta_t^2.
$$

If a constant step size is taken $\eta_t=\eta$, and output the average point 

$$
\bar w_T=\frac1T\sum_{t=0}^{T-1}w_t,
$$

 From the convexity $f(\bar w_T)\le T^{-1}\sum_t f(w_t)$, we get 

$$
\mathbb{E}[f(\bar w_T)-f(w^*)]
  \le
  \frac{\|w_0-w^*\|^2}{2\eta T}
  +
  \frac{\eta G^2}{2}.
$$

This derivation explains SGD The step size selection is essentially a compromise between the optimization error term and the noise term. 

 Random coordinate descent only updates one coordinate at a time: 

$$
x_{t+1}
  =
  x_t-\eta_t e_{j_t}\nabla_{j_t}f(x_t).
$$

Here $j_t\in\{1,\ldots,d\}$ is the coordinate randomly selected at step $t$, and $e_{j_t}\in\mathbb{R}^d$ is the coordinate at step $t$. $j_t$ is the standard basis vector, and $\nabla_{j_t}f(x_t)$ is the $j_t$ component of the gradient. 

 It is useful when the feature dimension is large, single-coordinate gradients are cheap, or the target is decomposable. The focus of the exam is to explain the difference in randomness from SGD: SGD randomly selects coordinates, and coordinate descent randomly selects coordinates. 

### Proximal Operators and Composite Optimization

Many machine learning goals are smooth terms plus non-smooth regular terms: 

$$
\min_x F(x)=f(x)+R(x),
$$

For example, $R(x)=\lambda\|x\|_1$ in Lasso. The proximal operator is defined as 

$$
\operatorname{prox}_{\gamma R}(u)
  =
  \operatorname*{arg\,min}_x
  \left\{
    R(x)+\frac{1}{2\gamma}\|x-u\|^2
  \right\}.
$$

prox-gradient and updated to 

$$
x_{t+1}
  =
  \operatorname{prox}_{\eta R}
  \left(x_t-\eta\nabla f(x_t)\right).
$$

This can be understood as: first do a one-step gradient descent according to the smooth term, and then use $R$'s prox pulls the solution back into a region with structure. For the $\ell_1$ regular, prox is soft-thresholding: 

$$
[\operatorname{prox}_{\eta\lambda\|\cdot\|_1}(u)]_j
  =
  \operatorname{sgn}(u_j)\max\{|u_j|-\eta\lambda,0\}.
$$

 Therefore the $\ell_1$ regular will produce sparse solutions, not just "make the parameters small". 

##### Coordinate-wise derivation of $\ell_1$ prox

because $\ell_1$ Both the regular and square terms are separable coordinate-by-coordinate, and only need to solve the one-dimensional problem 

$$
\min_x
  \lambda |x|
  +
  \frac{1}{2\eta}(x-u)^2.
$$

If $x>0$, the objective function can be written as 

$$
\lambda x+\frac{1}{2\eta}(x-u)^2,
$$

The first-order condition is 

$$
\lambda+\frac{1}{\eta}(x-u)=0,
$$

 so $x=u-\eta\lambda$. The solution lies in the region $x>0$ if and only if $u>\eta\lambda$. 

If $x<0$, the objective function can be written as 

$$
-\lambda x+\frac{1}{2\eta}(x-u)^2,
$$

The first-order condition is 

$$
-\lambda+\frac{1}{\eta}(x-u)=0,
$$

So $x=u+\eta\lambda$. The solution lies in the region $x<0$ if and only if $u<-\eta\lambda$. 

If $|u|\le\eta\lambda$, the optimal point is located at the non-differentiable point $x=0$. This is because the subgradient condition is 

$$
0\in
  \lambda[-1,1]
  -
  \frac{u}{\eta},
$$

 which is equivalent to $u/\eta\in\lambda[-1,1]$. The three situations are combined to get 

$$
x^*
  =
  \operatorname{sgn}(u)\max\{|u|-\eta\lambda,0\}.
$$

##### Proximal Optimality, Monotonicity, and Nonexpansiveness

The prox-SGD recursion in the exam often does not only use the definition of prox, but its optimality conditions and non-expansion. Let $R:\mathbb{R}^d\to(-\infty,+\infty]$ be a proper closed convex function with a step size of $\gamma>0$, and define 

$$
x^+
  =
  \operatorname{prox}_{\gamma R}(u)
  =
  \operatorname*{arg\,min}_x
  \left\{
    R(x)+\frac{1}{2\gamma}\|x-u\|^2
  \right\}.
$$

 Since the target is convex, Fermat rule Given the first-order optimality condition 

$$
0
  \in
  \partial R(x^+)
  +
  \frac1\gamma(x^+-u).
$$

, the commonly used form is obtained after moving the terms 

$$
\frac{u-x^+}{\gamma}
  \in
  \partial R(x^+).
$$

. This step is the source of the fixed point later. If $x^*$ is the optimal point of the composite objective $F(x)=f(x)+R(x)$, and $f$ is differentiable, and $R$ convex, then 

$$
0\in\nabla f(x^*)+\partial R(x^*).
$$

 means that there exists $r^*\in\partial R(x^*)$ such that $r^*=-\nabla f(x^*)$. Substituting $u=x^*-\gamma\nabla f(x^*)$ and $x^+=x^*$ into the prox optimality condition above, we get 

$$
x^*
  =
  \operatorname{prox}_{\gamma R}
  \left(x^*-\gamma\nabla f(x^*)\right).
$$

 Next, we prove the non-expansibility. Let 

$$
x^+=\operatorname{prox}_{\gamma R}(u),
  \qquad
  y^+=\operatorname{prox}_{\gamma R}(v).
$$

 be expressed by the prox optimality, 

$$
\frac{u-x^+}{\gamma}\in\partial R(x^+),
  \qquad
  \frac{v-y^+}{\gamma}\in\partial R(y^+).
$$

 The monotonicity of the subdifferentiation of the convex function, for any $r_x\in\partial R(x)$ and $r_y\in\partial R(y)$, there are 

$$
\langle r_x-r_y,x-y\rangle\ge0.
$$

 $x=x^+$, $y=y^+$, $r_x=(u-x^+)/\gamma$, $r_y=(v-y^+)/\gamma$ Substituting, we get 

$$
\left\langle
    (u-x^+)-(v-y^+),
    x^+-y^+
  \right\rangle
  \ge0.
$$

Expand the brackets: 

$$
\left\langle
    u-v,
    x^+-y^+
  \right\rangle
  -
  \|x^+-y^+\|^2
  \ge0.
$$

Therefore 

$$
\|x^+-y^+\|^2
  \le
  \langle u-v,x^+-y^+\rangle.
$$

This is stronger than ordinary non-expansion and is called firm nonexpansiveness. Using Cauchy--Schwarz inequality again, 

$$
\|x^+-y^+\|^2
  \le
  \|u-v\|\,\|x^+-y^+\|.
$$

If $x^+\ne y^+$, divide both sides by $\|x^+-y^+\|$; if $x^+=y^+$, the conclusion is trivially true. So 

$$
\|\operatorname{prox}_{\gamma R}(u)-\operatorname{prox}_{\gamma R}(v)\|
  \le
  \|u-v\|.
$$

This is prox nonexpansiveness. Its role in the exam is to convert one-step recursion containing prox into ordinary Euclidean distance recursion, such as 

$$
\|x_{k+1}-x^*\|
  \le
  \left\|
    x_k-\gamma g_k
    -
    \left(x^*-\gamma\nabla f(x^*)\right)
  \right\|.
$$

 where $g_k$ is the gradient or stochastic gradient estimate of step $k$. Subsequently, expand the square and take the conditional expectation, and then enter the SGD variance decomposition and strong convex convergence analysis [@beck2017first; @nesterov2018convex]. 

### Momentum, Nesterov and Adaptive Learning Rates

The momentum method maintains the velocity variable: 

$$
v_{t+1}=\beta v_t+\nabla f(x_t),
  \qquad
  x_{t+1}=x_t-\eta v_{t+1}.
$$

The intuition is to accumulate velocity in the direction of steady decline, canceling out the back and forth oscillations in the direction of high curvature. Nesterov accelerates the calculation of gradients at the "look-ahead point": 

$$
v_{t+1}
  =
  \beta v_t+\nabla f(x_t-\eta\beta v_t),
  \qquad
  x_{t+1}=x_t-\eta v_{t+1}.
$$

AdaGrad, RMSProp, Adam and other methods set different effective learning rates for different coordinates. The typical form of Adam is 

$$
m_t=\beta_1m_{t-1}+(1-\beta_1)g_t,
  \qquad
  v_t=\beta_2v_{t-1}+(1-\beta_2)g_t\odot g_t,
$$

$$
w_{t+1}
  =
  w_t
  -
  \eta
  \frac{\widehat m_t}{\sqrt{\widehat v_t}+\epsilon}.
$$

 where $\widehat m_t,\widehat v_t$ is the moment estimate after bias correction. The exam usually does not ask for proof of Adam convergence, but does ask for an explanation of why it can handle different coordinate scales and why $\epsilon$ prevents division by zero. 

##### Assessment content

- Determine whether the set/function is convex and write the first-order convexity condition. 

- Prove optimality of nondifferentiable points using the subgradient definition. 

 - Use smoothness to push the gradient descent amount. 

 - Compares the computational cost and variance sources of GD, SGD, mini-batch SGD, and stochastic coordinate descent. 

- Write the definition of prox and derive the soft-thresholding form of $\ell_1$ prox. 

- Explain the state variables and applicable scenarios of momentum, Nesterov, AdaGrad/Adam. 

## Deep Learning: Networks, Training, Generalization and Generative Models

**Source Positioning:** This section corresponds to the syllabus "Basics of Deep Learning, Visual Tasks, Unsupervised Learning, Visual Generative Models, Expressive Analysis". Basic Neural Network Reference [@goodfellow2016deep; @bishop2023deep; @jurafsky2026slp]; Vision Task Reference [@szeliski2022vision]; Generative Model Reference [@goodfellow2014gan; @kingma2014vae; @dinh2017realnvp; @ho2020ddpm; @song2021score]. 

### neural network framework

A multi-layer perceptron (MLP) can be written as a function composition: 

$$
h_0=x,
  \qquad
  a_\ell=W_\ell h_{\ell-1}+b_\ell,
  \qquad
  h_\ell=\phi(a_\ell),
  \qquad
  \ell=1,\ldots,L.
$$

The last layer output logits $o$, commonly used for classification tasks The parameters of the softmax

$$
p_\theta(y=k\mid x)
  =
  \frac{\exp(o_k)}{\sum_{j}\exp(o_j)}
$$

 and cross-entropy loss 

$$
\mathcal{L}(\theta)
  =
  -\log p_\theta(y\mid x).
$$

 neural network are all $W_\ell,b_\ell$. Training is stochastic optimization on the average loss of samples. Compared with linear models, the key change of deep networks is that the features are no longer fixed, but are learned jointly by the previous layers. 

Here $h_\ell\in\mathbb{R}^{d_\ell}$ is the activation vector of layer $\ell$, $a_\ell\in\mathbb{R}^{d_\ell}$ is the pre-activation vector, $W_\ell\in\mathbb{R}^{d_\ell\times d_{\ell-1}}$, $b_\ell\in\mathbb{R}^{d_\ell}$, and the nonlinear function $\phi$ acts according to the coordinates. When deriving the exam, write down these dimensions first to avoid writing $W_\ell^\top$ and $W_\ell$ in the opposite direction. 

### Backpropagation

Backpropagation is just the dynamic programming of the chain rule. Suppose the single-sample loss is $J=\mathcal{L}(h_L,y)$, and define 

$$
\delta_\ell=\frac{\partial J}{\partial a_\ell}.
$$

if $h_\ell=\phi(a_\ell)$, then 

$$
\delta_\ell
  =
  (W_{\ell+1}^\top \delta_{\ell+1})
  \odot
  \phi'(a_\ell),
$$

 and 

$$
\frac{\partial J}{\partial W_\ell}
  =
  \delta_\ell h_{\ell-1}^\top,
  \qquad
  \frac{\partial J}{\partial b_\ell}
  =
  \delta_\ell.
$$

Here $\odot$ represents the Hadamard product, that is, multiplication by coordinates. If the 

 exam requires backpropagation, don’t mystify it: first draw the calculation graph, determine the local Jacobian, and then multiply the upstream gradient. 

 From the perspective of automatic differentiation language, $\delta_\ell$ is the adjoint of the intermediate variable $a_\ell$, that is, the upstream sensitivity of the loss $J$ to this variable. If $J_\ell=\partial a_{\ell+1}/\partial a_\ell$ is the local Jacobian from layer $\ell$ to layer $\ell+1$, then the abstract form of backpropagation is 

$$
\delta_\ell
  =
  J_\ell^\top \delta_{\ell+1}.
$$

 This sentence translates the "chain rule" into a scorable answer: first write the local Jacobian, then write adjoint recursively, and finally gives the gradient of each parameter. 

##### Derivation of backpropagation The recursion

 is given by the 

$$
a_{\ell+1}=W_{\ell+1}h_\ell+b_{\ell+1},
  \qquad
  h_\ell=\phi(a_\ell),
$$

 chain rule 

$$
\frac{\partial J}{\partial h_\ell}
  =
  W_{\ell+1}^\top
  \frac{\partial J}{\partial a_{\ell+1}}
  =
  W_{\ell+1}^\top\delta_{\ell+1}.
$$

 due to $h_\ell=\phi(a_\ell)$ It is based on the coordinate function. 

$$
\frac{\partial J}{\partial a_\ell}
  =
  \frac{\partial J}{\partial h_\ell}
  \odot
  \phi'(a_\ell).
$$

 is combined to obtain 

$$
\delta_\ell
  =
  (W_{\ell+1}^\top\delta_{\ell+1})
  \odot
  \phi'(a_\ell).
$$

 for a single element of the weight matrix $W_{\ell,jk}$, there is 

$$
a_{\ell,j}
  =
  \sum_k W_{\ell,jk}h_{\ell-1,k}+b_{\ell,j}.
$$

 so 

$$
\frac{\partial J}{\partial W_{\ell,jk}}
  =
  \frac{\partial J}{\partial a_{\ell,j}}
  \frac{\partial a_{\ell,j}}{\partial W_{\ell,jk}}
  =
  \delta_{\ell,j}h_{\ell-1,k}.
$$

 written in matrix form is 

$$
\frac{\partial J}{\partial W_\ell}
  =
  \delta_\ell h_{\ell-1}^\top.
$$

sigmoid The derivative of is 

$$
\sigma'(z)=\sigma(z)(1-\sigma(z))\le\frac14.
$$

 When the deep network backpropagates, it is easy to multiply small factors repeatedly, and vanishing gradient is prone to occur. ReLU

$$
\operatorname{ReLU}(z)=\max\{z,0\}
$$

 has a positive semi-axis derivative of $1$, which alleviates systematic gradient reduction, but the negative semi-axis derivative is $0$, and dead ReLU may occur. 

### Approximation capabilities, training methods and generalization analysis

The syllabus puts "neural network framework, training methods, approximation and generalization analysis" in the same line because these three things are often confused. The approximation capability asks "whether there are parameters that can represent the objective function"; the training method asks "whether the optimization algorithm can find good parameters"; the generalization analysis asks "whether the found parameters are reliable on unseen samples". All three are important, but none alone can lead to the other two. The conclusion of the classic universal approximation of 

 can be summarized as: if $K\subset\mathbb{R}^d$ is a compact set and $f:K\to\mathbb{R}$ is continuous, then under appropriate nonlinear activation, for any $\varepsilon>0$, there is a sufficiently wide neural network $F_\theta$, such that 

$$
\sup_{x\in K}|F_\theta(x)-f(x)|<\varepsilon.
$$

 where $K$ is the compact set whose input is restricted, $\theta$ is the network parameter, and $\varepsilon$ is the allowed uniform approximation error. This theorem shows that the network class has strong expressive ability, but it does not mean that SGD can definitely find this set of parameters, nor does it mean that the model trained with limited samples must generalize [@goodfellow2016deep; @bishop2023deep]. 

 training methods can usually be abstracted into stochastic first-order iterations: 

$$
\theta_{t+1}
  =
  \theta_t-\eta_t \widehat{\nabla}\mathcal{L}(\theta_t),
$$

 where $\eta_t>0$ is the learning rate and $\widehat{\nabla}\mathcal{L}(\theta_t)$ is the gradient estimate corrected by mini-batch, momentum, normalized or adaptive learning rate. If you are asked about "training method" in the exam, don't just write backprop; backprop calculates the gradient, and optimizers like SGD/Adam decide how to use the gradient to update parameters. 

Generalization analysis requires returning to the language at the beginning of Chapter 3: the larger the model class, the smaller the approximation error may be, but the estimation error and overfitting risk may become larger. The particularity of deep learning is that over-parameterized networks can often interpolate training data and generalize at the same time. This is usually explained by implicit regularization, margin, data enhancement, early stopping, normalization and optimization bias, and cannot be explained by the number of parameters alone. 

### Normalization, residuals and generalization

Batch normalization versus mini-batch Internal activation for standardization: 

$$
\widehat a
  =
  \frac{a-\mu_B}{\sqrt{\sigma_B^2+\epsilon}},
  \qquad
  y=\gamma \widehat a+\beta.
$$

 Its role is not to simply "normalize data", but to improve the optimization geometry and make the input scale of each layer more stable. Layer normalization normalizes the feature dimension of a single sample and is often used in Transformer. 

Here $\mu_B$ and $\sigma_B^2$ are the mean and variance of a channel or feature in the current mini-batch respectively, $\epsilon>0$ is used for numerical stability, and $\gamma$ and $\beta$ are learnable scaling and translation parameters. $\gamma,\beta$ was introduced because normalization should not permanently limit the ability of a network to express arbitrary means and scales. 

The residual connection is written as 

$$
h_{\ell+1}=h_\ell+F_\ell(h_\ell).
$$

 It allows the network to easily learn the identity mapping and also allows the gradient to have a direct path. Transformer and ResNet both rely on this structure. 

The generalization of deep networks cannot be explained by the number of parameters alone, because over-parameterized networks can also generalize. Common explanations include implicit regularization, margins, data augmentation, early stopping, normalization, and optimization algorithm bias. If you are asked in the exam "Why can a deep network generalize despite having many parameters?", do not answer with "regularization", but distinguish between explicit regularization and implicit regularization. 

### Vision tasks and unsupervised learning 

Visual tasks can be classified according to the output structure: 

- Feature extraction: mapping images into vector representations for retrieval, classification or downstream tasks. 

- Image restoration: denoising, super-resolution, deblurring, the essence is to restore clean images from degraded observations. 

 - 3D reconstruction: recovering geometric structures from multiple views, depth or implicit representations. 

- Optical flow estimation: Estimating the motion field of pixels or feature points in adjacent frames. 

- Recognition and segmentation: classification gives whole image labels, detection gives boxes, semantic segmentation gives per-pixel categories, instance segmentation distinguishes object instances. 

If the exam requires a comparative visual task, the safest way to write is to write the output object first, and then the loss or evaluation index: 

| Task | Output object | Common training signals |
| --- | --- | --- |
| Feature extraction | Representation vector $z=f_\theta(x)$ | Classification loss, contrast loss, retrieval ranking loss |
| Image recovery | Clean image or residual image $\hat x$ | Pixel loss, perceptual loss, diffusion denoising loss |
| 3D reconstruction | Depth, point cloud, mesh, NeRF or implicit field | Reprojection error, geometric consistency, volume rendering loss |
| Optical flow estimation | Pixel motion field $u(x)\in\mathbb{R}^2$ | Endpoint error, brightness consistency, smoothing regularity |
| Recognition and segmentation | Class, box, mask or per-pixel label | Cross-entropy, IoU/Dice, detection box regression loss |

Unsupervised learning does not rely on artificial labels. The autoencoder learns 

$$
z=f_\phi(x),
  \qquad
  \hat x=g_\theta(z),
$$

 and minimizes the reconstruction error 

$$
\|x-\hat x\|^2.
$$

Contrast learning constructs positive and negative samples so that different enhanced representations of the same instance are close and different instances are far away. A typical loss is 

$$
\ell_i
  =
  -
  \log
  \frac{
    \exp(\operatorname{sim}(z_i,z_i^+)/\tau)
  }{
    \exp(\operatorname{sim}(z_i,z_i^+)/\tau)
    +
    \sum_{j}
    \exp(\operatorname{sim}(z_i,z_j^-)/\tau)
  }.
$$

 where $z_i$ is the anchor representation, $z_i^+$ is a positive representation that is semantically the same as it or enhanced from the same instance, $z_j^-$ is a negative representation, and $\operatorname{sim}$ is usually an inner product or cosine similarity; $\tau>0$ is the temperature parameter that controls the sharpness of the softmax distribution. 

##### Implicit regularization, transfer learning and meta-learning

Implicit regularization means that the optimization process itself favors certain solutions, even if there is no explicit regularization term in the objective function. For example, among multiple parameters that can also interpolate the training set, SGD, initialization, batch size, data augmentation, and normalization may favor solutions with larger margins or smoother representations. What it explains is "why over-parameterized models are not necessarily simply overfitted by the number of parameters." 

Transfer learning first learns the representation $f_{\theta_0}$ on the big data source task, and then fine-tunes it on the target task: 

$$
\theta^*
  \in
  \operatorname*{arg\,min}_\theta
  \frac1m
  \sum_{i=1}^{m}
  \ell(g_\theta(x_i),y_i),
  \qquad
  \theta\ \text{is initialized at}\ \theta_0.
$$

Here $g_\theta$ is the migrated predictor, $\theta_0$ is the pre-training parameter. Meta-learning writes "fast adaptation" into the training goal: given the task distribution $\mathcal{T}$, it is hoped that the initialized parameters $\theta$ will be in task $T$ after a small amount of inner layer updates $U_T(\theta)$ Good performance on: 

$$
\min_\theta
  \mathbb{E}_{T\sim\mathcal{T}}
  L_T(U_T(\theta)).
$$

These three types of topics do not necessarily require long proofs, but exams often require distinguishing their goals: implicit regularization to explain generalization, transfer learning to reuse existing representations, and meta-learning to optimize the adaptation process. 

### Generative Models

The goal of the generated model is to learn the data distribution $p_{\mathrm{data}}$ and be able to sample new samples. Different model families differ in how $p_\theta(x)$ is represented or how $x$ is generated. 

##### The trade-off between expressiveness and computability

The "expressiveness analysis" of a generative model usually does not ask about the number of parameters, but how the model family trades off between likelihood, sampling quality, training stability and computability. Flow has explicit likelihood, but reversibility limits the network structure; VAE has probabilistic graphical models and ELBO, but approximate posteriors may bring posterior collapse or fuzzy samples; GAN directly learns implicit generation distributions, with sharp samples but unstable training and lack of explicit likelihood; diffusion uses many small steps to denoise in exchange for stable training and high-quality sampling, but the sampling cost is high. These comparisons come from mathematical forms of different model objectives rather than empirical labels [@goodfellow2014gan; @kingma2014vae; @dinh2017realnvp; @ho2020ddpm; @song2021score]. 

##### maximum likelihood

If the model is given an explicit density, the maximum likelihood is commonly used for training: 

$$
\max_\theta
  \mathbb{E}_{x\sim p_{\mathrm{data}}}
  \log p_\theta(x).
$$

 is equivalent to minimizing 

$$
\operatorname{KL}(p_{\mathrm{data}}\|p_\theta)
  =
  \mathbb{E}_{p_{\mathrm{data}}}
  \log
  \frac{p_{\mathrm{data}}(x)}{p_\theta(x)},
$$

 because $\mathbb{E}_{p_{\mathrm{data}}}\log p_{\mathrm{data}}(x)$ has nothing to do with $\theta$. 

##### VAE

VAE uses the latent variable $z$, and the generated model is $p_\theta(x,z)=p(z)p_\theta(x\mid z)$. Since the true posterior $p_\theta(z\mid x)$ is difficult to calculate, the approximate posterior $q_\phi(z\mid x)$ is introduced. ELBO is 

$$
\log p_\theta(x)
  \ge
  \mathbb{E}_{q_\phi(z\mid x)}
  \log p_\theta(x\mid z)
  -
  \operatorname{KL}(q_\phi(z\mid x)\|p(z)).
$$

The first term encourages reconstruction, and the second term pulls the coding distribution toward the prior. 

##### Derivation of ELBO

Start from the marginal likelihood: 

$$
\log p_\theta(x)
  =
  \log
  \int p_\theta(x,z)\,dz.
$$

 Multiply and divide the same approximate posterior $q_\phi(z\mid x)$: 

$$
\log p_\theta(x)
  =
  \log
  \int
  q_\phi(z\mid x)
  \frac{p_\theta(x,z)}{q_\phi(z\mid x)}
  \,dz.
$$

 Treat the integral as an expectation with respect to $q_\phi(z\mid x)$ and expand it using Jensen’s inequality: 

$$
\log p_\theta(x)
  \ge
  \mathbb{E}_{q_\phi(z\mid x)}
  \log
  \frac{p_\theta(x,z)}{q_\phi(z\mid x)}.
$$

 $p_\theta(x,z)=p(z)p_\theta(x\mid z)$, get 

$$
\begin{aligned}
  &\mathbb{E}_{q_\phi(z\mid x)}\log p_\theta(x\mid z)
  +
  \mathbb{E}_{q_\phi(z\mid x)}\log p(z)
  -
  \mathbb{E}_{q_\phi(z\mid x)}\log q_\phi(z\mid x)
  \\
  &\qquad =
  \mathbb{E}_{q_\phi(z\mid x)}\log p_\theta(x\mid z)
  -
  \operatorname{KL}(q_\phi(z\mid x)\|p(z)).
\end{aligned}
$$

This is ELBO. If the exam requires explanation of VAE, it must also be explained: ELBO is the lower bound of likelihood, the KL term comes from the gap between the approximate posterior and the prior, and the reconstruction term comes from the conditional generative model $p_\theta(x\mid z)$. 

Re-parameterization technique writes 

$$
z=\mu_\phi(x)+\sigma_\phi(x)\odot\epsilon,
  \qquad
  \epsilon\sim\mathcal{N}(0,I)
$$

 into a reversible form. 

##### GAN

GAN has generator $G_\theta(z)$ and discriminator $D_\psi(x)$. The classic minimax target is 

$$
\min_\theta\max_\psi
  \mathbb{E}_{x\sim p_{\mathrm{data}}}\log D_\psi(x)
  +
  \mathbb{E}_{z\sim p(z)}
  \log(1-D_\psi(G_\theta(z))).
$$

The intuition is that the discriminator learns to distinguish between real samples and generated samples, and the generator learns to fool the discriminator. The advantage is that the samples are sharp; the disadvantages are unstable training, mode collapse, and lack of explicit likelihood. 

##### Normalizing flow

Flow uses a reversible mapping $x=f_\theta(z)$ to push the simple distribution $p_0(z)$ into the data space. The variable replacement formula is 

$$
\log p_\theta(x)
  =
  \log p_0(z)
  -
  \log\left|\det J_{f_\theta}(z)\right|,
  \qquad
  z=f_\theta^{-1}(x).
$$

 Multi-layer flow accumulates the log determinant. The exam focuses on "reversibility + Jacobian determinant + explicit likelihood". 

##### Derivation of variable substitution formula

 Let $x=f_\theta(z)$, and $f_\theta$ be invertible. The probability mass is maintained under variable transformation: 

$$
p_\theta(x)\,dx
  =
  p_0(z)\,dz.
$$

The volume element in the multi-dimensional case satisfies 

$$
dx
  =
  \left|\det J_{f_\theta}(z)\right|dz.
$$

 Therefore, taking the logarithm of 

$$
p_\theta(x)
  =
  p_0(z)
  \left|
    \det J_{f_\theta}(z)
  \right|^{-1}.
$$

 gives 

$$
\log p_\theta(x)
  =
  \log p_0(z)
  -
  \log\left|\det J_{f_\theta}(z)\right|.
$$

if $f_\theta=f_L\circ\cdots\circ f_1$, Jacobian determinants are multiplied by the chain rule, and log determinants are thus added. 

##### Diffusion and score

Diffusion model first defines the noise forward process, gradually turns $x_0$ into approximate Gaussian noise, and then learns the reverse process to denoise. Discrete DDPM is often written as 

$$
q(x_t\mid x_{t-1})
  =
  \mathcal{N}(\sqrt{1-\beta_t}x_{t-1},\beta_t I).
$$

Continuous time VP SDE can be written as 

$$
dx=-\frac12\beta(t)x\,dt+\sqrt{\beta(t)}\,dW_t.
$$

where $W_t$ is the standard Brownian motion, $\beta(t)>0$ is the noise schedule at time $t$. 

General forward SDE

$$
dx=f(x,t)\,dt+g(t)\,dW_t
$$

’s reverse-time SDE is 

$$
dx=
  \left[
    f(x,t)-g(t)^2\nabla_x\log p_t(x)
  \right]dt
  +
  g(t)\,d\bar W_t.
$$

 here $\bar W_t$ Represents Brownian motion in reverse time. score

$$
\nabla_x\log p_t(x)
$$

 describes the fastest rising direction of density under the current noise level. After training the score model, you can gradually backsample from the noise. 

Closed edge distribution is also commonly used in discrete diffusion. Let 

$$
\alpha_t=1-\beta_t,
  \qquad
  \bar\alpha_t=\prod_{s=1}^{t}\alpha_s.
$$

 be repeatedly substituted into the forward process It can be obtained that 

$$
q(x_t\mid x_0)
  =
  \mathcal{N}(\sqrt{\bar\alpha_t}x_0,(1-\bar\alpha_t)I).
$$

 therefore can be directly sampled 

$$
x_t
  =
  \sqrt{\bar\alpha_t}x_0
  +
  \sqrt{1-\bar\alpha_t}\epsilon,
  \qquad
  \epsilon\sim\mathcal{N}(0,I).
$$

DDPM often trains the network $\epsilon_\theta(x_t,t)$ Prediction noise, the target is approximately 

$$
\mathbb{E}_{t,x_0,\epsilon}
  \left[
    \|\epsilon-\epsilon_\theta(x_t,t)\|^2
  \right].
$$

This explains why training a diffusion model looks like denoising regression: the model learns the direction of noise that should be removed for each noise level. 

##### Assessment content

- Write the MLP forward propagation and back propagation recursion, and explain the vanishing gradient. 

- Compare the effects of batch normalization, layer normalization and residual connection. 

- It shows that expressiveness, optimization, and generalization are not the same problem. 

 - Differentiating vision tasks by output structure. 

- Write out the core goals of autoencoder, contrastive learning, VAE, GAN, flow, and diffusion. 

- Compare four types of generative models: VAE has ELBO, GAN has adversarial objectives, flow has explicit reversible likelihood, and diffusion learns denoising or score. 

## Reinforcement learning and preference alignment

**Source location:** This section corresponds to the exam syllabus "Bellman equation, Q-learning, Policy gradient". Basic RL reference [@mohri2018foundations; @sutton2018rl]; LLM preference alignment reference [@jurafsky2026slp; @rafailov2023dpo]. 

### MDP, return and value functions

Reinforcement learning studies the interaction between agent and environment. Markov decision process (MDP) consists of state space $\mathcal{S}$, action space $\mathcal{A}$, transition probability $P(s'\mid s,a)$, reward $r(s,a)$, and discount factor $\gamma\in[0,1)$. The 

 policy $\pi(a\mid s)$ gives the probability of choosing the action $a$ in the state $s$. The discount return is 

$$
G_t=\sum_{k=0}^{\infty}\gamma^k r(s_{t+k},a_{t+k}).
$$

 value function and the action value function is defined as 

$$
V^\pi(s)=\mathbb{E}_\pi[G_t\mid s_t=s],
  \qquad
  Q^\pi(s,a)=\mathbb{E}_\pi[G_t\mid s_t=s,a_t=a].
$$
The value function is not an ordinary supervision label, but an expectation of a random trajectory in the future. It relies on strategy because the strategy determines which states are subsequently accessed. 

### Bellman equation

Bellman equation is the recursive expansion of return: 

$$
V^\pi(s)
  =
  \sum_a\pi(a\mid s)
  \left[
    r(s,a)
    +
    \gamma
    \sum_{s'}P(s'\mid s,a)V^\pi(s')
  \right].
$$

The optimal value function satisfies Bellman optimality equation: 

$$
V^*(s)
  =
  \max_{a}
  \left[
    r(s,a)
    +
    \gamma
    \sum_{s'}P(s'\mid s,a)V^*(s')
  \right].
$$

The action value version is 

$$
Q^*(s,a)
  =
  r(s,a)
  +
  \gamma
  \sum_{s'}P(s'\mid s,a)
  \max_{a'}Q^*(s',a').
$$

if known $Q^*$, the optimal strategy is 

$$
\pi^*(s)\in\operatorname*{arg\,max}_a Q^*(s,a).
$$

##### Derivation of the Bellman equation

 from return Starting from the definition: 

$$
G_t
  =
  r(s_t,a_t)
  +
  \gamma
  \sum_{k=0}^{\infty}\gamma^k r(s_{t+1+k},a_{t+1+k})
  =
  r(s_t,a_t)+\gamma G_{t+1}.
$$

 Take the expectation under the condition of $s_t=s$: 

$$
V^\pi(s)
  =
  \mathbb{E}_\pi[r(s_t,a_t)+\gamma G_{t+1}\mid s_t=s].
$$

 first for the action $a\sim\pi(\cdot\mid s)$ Sum up, and then sum up the next state $s'\sim P(\cdot\mid s,a)$: 

$$
V^\pi(s)
  =
  \sum_a\pi(a\mid s)
  \left[
    r(s,a)
    +
    \gamma\sum_{s'}P(s'\mid s,a)V^\pi(s')
  \right].
$$

The optimal Bellman equation just replaces "average action according to the current strategy" with "selecting the optimal action". Therefore, the expectation equation is used to evaluate a fixed strategy, and the optimality equation is used to find the optimal strategy. 

### Q-learning

Q-learning is a model-free method and does not require knowledge of transition probabilities. It updates 

$$
Q_{t+1}(s_t,a_t)
  =
  Q_t(s_t,a_t)
  +
  \alpha_t
  \left[
    r_t
    +
    \gamma\max_{a'}Q_t(s_{t+1},a')
    -
    Q_t(s_t,a_t)
  \right].
$$

 with sample transfer $(s_t,a_t,r_t,s_{t+1})$ In brackets is the temporal-difference error: 

$$
\delta_t
  =
  r_t
  +
  \gamma\max_{a'}Q_t(s_{t+1},a')
  -
  Q_t(s_t,a_t).
$$

 which measures the current $Q$ Inconsistency between estimated and Bellman backup. Q-learning is off-policy because $\max_{a'}$ is used in the target, which is not necessarily equal to the behavioral policy from which the actual sampling action comes. 

This update comes from a stochastic approximation of the Bellman optimality equation. If $Q_t$ is close to $Q^*$, the ideal target should satisfy 

$$
Q_t(s_t,a_t)
  \approx
  r_t+\gamma\max_{a'}Q_t(s_{t+1},a').
$$

 so the right side is regarded as one-step target: 

$$
Y_t=r_t+\gamma\max_{a'}Q_t(s_{t+1},a'),
$$

 Then do an exponential moving average on the current estimate: 

$$
Q_{t+1}(s_t,a_t)
  =
  (1-\alpha_t)Q_t(s_t,a_t)+\alpha_tY_t.
$$

Expand to get the previous Q-learning update formula. 

### Policy gradient and baseline

When the action space is large or the policy needs to be differentiable parameterization, it is more natural to directly optimize the policy. Let 

$$
J(\theta)=\mathbb{E}_{\tau\sim\pi_\theta}[R(\tau)].
$$

 use the log-derivative trick: 

$$
\nabla_\theta p_\theta(\tau)
  =
  p_\theta(\tau)\nabla_\theta\log p_\theta(\tau),
$$

 to get the policy gradient The form 

$$
\nabla_\theta J(\theta)
  =
  \mathbb{E}_{\pi_\theta}
  \left[
    \sum_{t\ge0}
    \nabla_\theta\log\pi_\theta(a_t\mid s_t)
    G_t
  \right].
$$

 is available $Q^{\pi_\theta}(s_t,a_t)$ or the advantage $A^\pi(s_t,a_t)$ instead of $G_t$ reduces the variance. baseline $b(s)$ does not change expectations because 

$$
\mathbb{E}_{a\sim\pi_\theta(\cdot\mid s)}
  \left[
    \nabla_\theta\log\pi_\theta(a\mid s)b(s)
  \right]
  =
  b(s)\nabla_\theta\sum_a\pi_\theta(a\mid s)
  =
  0.
$$

Actor-critic uses actor to represent the strategy and critic to estimate the value function or advantage. It combines the optimizability of policy gradient with the low variance of value learning. 

##### Complete derivation of Policy gradient

Suppose a trajectory is 

$$
\tau=(s_0,a_0,s_1,a_1,\ldots),
$$

 and the trajectory return is $R(\tau)$. The trajectory probability can be decomposed into 

$$
p_\theta(\tau)
  =
  p(s_0)
  \prod_{t\ge0}
  \pi_\theta(a_t\mid s_t)
  P(s_{t+1}\mid s_t,a_t).
$$

Environmental transfer $P(s_{t+1}\mid s_t,a_t)$ Not included $\theta$, so the objective function of 

$$
\nabla_\theta\log p_\theta(\tau)
  =
  \sum_{t\ge0}
  \nabla_\theta\log\pi_\theta(a_t\mid s_t).
$$

 is 

$$
J(\theta)
  =
  \int p_\theta(\tau)R(\tau)\,d\tau.
$$

 for $\theta$ Find the gradient: 

$$
\nabla_\theta J(\theta)
  =
  \int
  \nabla_\theta p_\theta(\tau)R(\tau)\,d\tau.
$$

 using log-derivative trick, 

$$
\nabla_\theta p_\theta(\tau)
  =
  p_\theta(\tau)\nabla_\theta\log p_\theta(\tau),
$$

 gets 

$$
\nabla_\theta J(\theta)
  =
  \mathbb{E}_{\tau\sim p_\theta}
  \left[
    R(\tau)
    \sum_{t\ge0}
    \nabla_\theta\log\pi_\theta(a_t\mid s_t)
  \right].
$$

 and further replaces the entire trajectory return with the return starting from $t$ time $G_t$ will not change expectations, but can reduce the variance caused by irrelevant past rewards, so the commonly used policy gradient form is obtained. 

### LLM preference alignment

LLM alignment can be viewed as a special sequence decision problem. The prompt is the initial state, the actions are generated token by token, the policy is the language model $\pi_\theta(o\mid x)$, and the rewards come from human or model preferences. 

RLHF often first uses preference data to train the reward model. If there are preferred output $o_w$ and rejected output $o_l$ for the same prompt $x$, Bradley-Terry Model writing 

$$
P(o_w\succ o_l\mid x)
  =
  \sigma(r_\phi(x,o_w)-r_\phi(x,o_l)).
$$

 reward model loss is 

$$
\mathcal{L}_{\mathrm{RM}}
  =
  -
  \mathbb{E}
  \log
  \sigma(r_\phi(x,o_w)-r_\phi(x,o_l)).
$$

 subsequently optimized with KL Regular strategy goal: 

$$
\max_{\pi_\theta}
  \mathbb{E}_{x,o\sim\pi_\theta}
  \left[
    r_\phi(x,o)
    -
    \beta
    \log
    \frac{\pi_\theta(o\mid x)}{\pi_{\mathrm{ref}}(o\mid x)}
  \right].
$$

KL term prevents the model from moving away from the reference model for reward hacking. DPO eliminates the reward function and directly uses the preference pairs to train the strategy: 

$$
\mathcal{L}_{\mathrm{DPO}}
  =
  -
  \mathbb{E}
  \log
  \sigma
  \left(
    \beta
    \log
    \frac{\pi_\theta(o_w\mid x)}{\pi_{\mathrm{ref}}(o_w\mid x)}
    -
    \beta
    \log
    \frac{\pi_\theta(o_l\mid x)}{\pi_{\mathrm{ref}}(o_l\mid x)}
  \right).
$$

 If the exam asks about "the difference between RLHF and DPO", the key point is: RLHF explicitly trains the reward model and performs strategy optimization; DPO constructs a supervised target directly from the preference pairs, without the need for online sampling and independent reward models. 

##### Background on the derivation of DPO targets

KL Regular RLHF single prompt The objective can be written as 

$$
\max_{\pi}
  \mathbb{E}_{o\sim\pi(\cdot\mid x)}
  \left[
    r(x,o)
    -
    \beta
    \log
    \frac{\pi(o\mid x)}{\pi_{\mathrm{ref}}(o\mid x)}
  \right].
$$

The closed-form optimal policy of this optimization problem satisfies 

$$
\pi^*(o\mid x)
  =
  \frac{1}{Z(x)}
  \pi_{\mathrm{ref}}(o\mid x)
  \exp\left(\frac{1}{\beta}r(x,o)\right),
$$

 where $Z(x)$ is the normalization constant. Moving the terms gives 

$$
r(x,o)
  =
  \beta
  \log
  \frac{\pi^*(o\mid x)}{\pi_{\mathrm{ref}}(o\mid x)}
  +
  \beta\log Z(x).
$$

The Bradley-Terry preference model only uses the reward difference: 

$$
r(x,o_w)-r(x,o_l).
$$

When substituted into the above equation, $\beta\log Z(x)$ cancels between winner and loser, so the available strategy log-ratio Directly express the preference probability: 

$$
P(o_w\succ o_l\mid x)
  =
  \sigma
  \left(
    \beta
    \log
    \frac{\pi_\theta(o_w\mid x)}{\pi_{\mathrm{ref}}(o_w\mid x)}
    -
    \beta
    \log
    \frac{\pi_\theta(o_l\mid x)}{\pi_{\mathrm{ref}}(o_l\mid x)}
  \right).
$$

 Take the negative log likelihood for this probability, which is the previous DPO loss [@rafailov2023dpo; @jurafsky2026slp]. 

##### Assessment content

- Define MDP, policy, return, $V^\pi$, $Q^\pi$. 

- Recursively derive the Bellman expectation equation and optimality equation from return. 

- Write the Q-learning update formula and explain the TD error. 

- Use log-derivative trick to push policy gradient. 

- Prove that the baseline does not change the policy gradient expectation. 

 - Explain the mathematical goals and limitations of RLHF, KL canonical and DPO. 

## Natural language processing and large model theory

**Source positioning:** This section corresponds to the exam syllabus "statistical modeling, Word2vec, self-attention, LLM pre-training alignment, Scaling Law, knowledge base reasoning based on Embedding". Main reference [@jurafsky2026slp; @goldberg2017nnnlp]; Transformer, Scaling Law, RAG, DPO and other supplementary references [@vaswani2017attention; @kaplan2020scaling; @hoffmann2022training; @lewis2020rag; @rafailov2023dpo]. 

### statistical language model

The language model assigns a probability to the sequence $w_{1:n}$. The chain rule gives the 

$$
P(w_{1:n})
  =
  \prod_{i=1}^{n}P(w_i\mid w_{1:i-1}).
$$

$n$-gram model using Markov Assume truncated history: 

$$
P(w_i\mid w_{1:i-1})
  \approx
  P(w_i\mid w_{i-n+1:i-1}).
$$

The maximum likelihood estimate is 

$$
\widehat P(w_i\mid c)
  =
  \frac{\operatorname{count}(c,w_i)}
  {\operatorname{count}(c)}.
$$

The problem is sparsity: many reasonable phrases do not appear in the training set, and MLE will give zero probability. Hence the need for smoothing, backoff or interpolation. Perplexity measures the average prediction difficulty of the test sequence: 

$$
\operatorname{PPL}(w_{1:n})
  =
  P(w_{1:n})^{-1/n}.
$$

PPL The lower the PPL, the higher the average probability given by the model to the test text. 

##### Derivation of $n$-gram MLE

 Fixed a context $c$. Let the vocabulary be $\mathcal{V}$, and the parameters be 

$$
\theta_w=P(w\mid c),
  \qquad
  \sum_{w\in\mathcal{V}}\theta_w=1.
$$

. Given the count $n(c,w)=\operatorname{count}(c,w)$, the context-sensitive log-likelihood Introducing Lagrange multipliers for 

$$
\sum_{w\in\mathcal{V}}
  n(c,w)\log\theta_w.
$$

 $\lambda$: 

$$
\mathcal{J}(\theta,\lambda)
  =
  \sum_w n(c,w)\log\theta_w
  +
  \lambda\left(\sum_w\theta_w-1\right).
$$

The first-order condition is 

$$
\frac{n(c,w)}{\theta_w}+\lambda=0,
  \qquad
  \theta_w=-\frac{n(c,w)}{\lambda}.
$$

 for $w$ Sum and use normalization constraints: 

$$
1=\sum_w\theta_w
  =
  -\frac{1}{\lambda}
  \sum_w n(c,w)
  =
  -\frac{\operatorname{count}(c)}{\lambda}.
$$

 So $\lambda=-\operatorname{count}(c)$, you get 

$$
\widehat P(w\mid c)
  =
  \frac{\operatorname{count}(c,w)}{\operatorname{count}(c)}.
$$

### Word2vec, GloVe and embedding

Embedding maps discrete words, entities or nodes into vector space: 

$$
e:\mathcal{V}\to\mathbb{R}^d.
$$

Word2vec skip-gram predicts context with center words. Given the center word $w$ and the context word $c$, the softmax probability is 

$$
P(c\mid w)
  =
  \frac{\exp(u_c^\top v_w)}
  {\sum_{c'}\exp(u_{c'}^\top v_w)}.
$$

. The complete softmax is too expensive, negative sampling Approximate with a binary target: 

$$
\log\sigma(u_c^\top v_w)
  +
  \sum_{j=1}^{k}
  \mathbb{E}_{c_j\sim P_n}
  \log\sigma(-u_{c_j}^\top v_w).
$$

GloVe starting from the global co-occurrence matrix, making 

$$
u_i^\top v_j+b_i+\tilde b_j
  \approx
  \log X_{ij}.
$$

The common intuition between the two is the distributional hypothesis: words with similar contexts are semantically similar. 

In the skip-gram formula, $v_w\in\mathbb{R}^d$ is the input vector of the center word $w$, $u_c\in\mathbb{R}^d$ is the output vector of the context word $c$, $P_n$ is the negative sampling distribution, and $k$ is how many negative samples are assigned to each positive sample. If the exam requires an explanation of negative sampling, it should be explained that it approximates multi-class softmax into a binary classification problem of "real co-occurrence pairs vs. noise co-occurrence pairs", thereby avoiding the need to traverse the entire vocabulary for each update $\mathcal{V}$. 

### Transformer self-attention

Transformer’s input is the token embedding matrix 

$$
X\in\mathbb{R}^{N\times d},
$$

 where $N$ is the context length, $d$ is the model dimension. Single-head attention first calculates 

$$
Q=XW_Q,
  \qquad
  K=XW_K,
  \qquad
  V_{\mathrm{attn}}=XW_V.
$$

 and then 

$$
\operatorname{Attention}(Q,K,V_{\mathrm{attn}})
  =
  \operatorname{softmax}
  \left(
    \frac{QK^\top}{\sqrt{d_k}}
  \right)V_{\mathrm{attn}}.
$$

. Each query is similar to all keys, softmax is used to obtain the weight, and then the value is weighted and averaged. The scaling factor $1/\sqrt{d_k}$ prevents the dot product variance from increasing with dimensionality, causing the softmax to saturate prematurely. 

##### Derivation of Attention dimensions and scaling factors 

 Let $W_Q,W_K\in\mathbb{R}^{d\times d_k}$, $W_V\in\mathbb{R}^{d\times d_v}$. Then 

$$
Q,K\in\mathbb{R}^{N\times d_k},
  \qquad
  V_{\mathrm{attn}}\in\mathbb{R}^{N\times d_v}.
$$

So 

$$
QK^\top\in\mathbb{R}^{N\times N},
  \qquad
  \operatorname{softmax}(QK^\top/\sqrt{d_k})V_{\mathrm{attn}}\in\mathbb{R}^{N\times d_v}.
$$

If the coordinates of query and key are approximately independent, the mean is $0$, and the variance is $1$, then the variance of a dot product 

$$
q^\top k=\sum_{r=1}^{d_k}q_r k_r
$$

 is 

$$
\operatorname{Var}(q^\top k)
  =
  \sum_{r=1}^{d_k}\operatorname{Var}(q_r k_r)
  =
  d_k.
$$

 so the unscaled logits will vary with $d_k$ becomes larger, the gradient becomes smaller after softmax enters the saturation zone. After dividing by $\sqrt{d_k}$, the dot product variance returns to a constant magnitude, which is the motivation for scaled dot-product attention [@vaswani2017attention; @jurafsky2026slp]. 

Autoregressive language model must add a causal mask: 

$$
M_{ij}
  =
  \begin{cases}
    0, & j\le i,\\
    -\infty, & j>i.
  \end{cases}
$$

At this time, the attention becomes 

$$
\operatorname{softmax}
  \left(
    \frac{QK^\top}{\sqrt{d_k}}+M
  \right)V_{\mathrm{attn}},
$$

 to ensure the first $i$ This position cannot peek at future tokens. Here $M$ is the causal mask added to logits; the padding mask masks the filling position of the sequence. The two cannot be mixed. When implementing, it is also necessary to check whether the label has been shifted to the right: if the $i$th target token is predicted, the shift convention of the lower triangle mask and the input/label must match strictly. Multi-head attention splices the outputs of multiple heads and then projects them linearly. Transformer block usually includes attention, feed-forward network, residual connection and layer norm. 

### LLM pre-training, instruction fine-tuning and alignment

The pre-training goal of autoregressive LLM is next-token prediction: 

$$
\mathcal{L}_{\mathrm{pretrain}}
  =
  -
  \sum_{i=1}^{n}
  \log p_\theta(w_i\mid w_{<i}).
$$

This is the cross-entropy loss. It enables models to learn language statistics, factual patterns, and implicit formatting for many tasks, but the goal itself is just to predict text and is not guaranteed to be helpful, realistic, or safe. The goal 

 also comes from maximum likelihood. Given the corpus sequence $w_{1:n}$, the autoregressive decomposition is 

$$
p_\theta(w_{1:n})
  =
  \prod_{i=1}^{n}p_\theta(w_i\mid w_{<i}).
$$

 maximizing log-likelihood is equivalent to minimizing 

$$
-\log p_\theta(w_{1:n})
  =
  -
  \sum_{i=1}^{n}
  \log p_\theta(w_i\mid w_{<i}).
$$

If the real next token is The one-hot distribution is written as $q_i$, the model prediction distribution is written as $p_i$, and the single token loss is cross entropy 

$$
H(q_i,p_i)
  =
  -
  \sum_{v\in\mathcal{V}}q_i(v)\log p_i(v)
  =
  -\log p_\theta(w_i\mid w_{<i}).
$$

Instruction fine-tuning (SFT) continues to use cross entropy training, but the data becomes instruction-response pairs:

$$
\mathcal{L}_{\mathrm{SFT}}
  =
  -
  \sum_{(x,y)}
  \sum_{t}
  \log p_\theta(y_t\mid x,y_{<t}).
$$

The preferred alignment was given in the previous section for RLHF versus DPO. Its limitations include reward model bias, insufficient coverage of preference data, over-optimization leading to reward hacking, and long-term factuality still relies on retrieval or tools. 

### Scaling Law

Scaling law studies how model performance scales with the number of parameters $N$, the number of data tokens $D$, and the amount of training calculations $C$. Empirically, the cross-entropy loss often approximately satisfies the power law: 

$$
L(N,D)
  \approx
  L_\infty
  +
  aN^{-\alpha}
  +
  bD^{-\beta}.
$$

 where $L_\infty$ is the irreducible loss level, $a,b>0$ is the empirical fitting constant, and $\alpha,\beta>0$ is the power law index corresponding to the parameter amount and data amount. 

This is not a first-principle theorem, but a large-scale experimental rule. Its exam value lies in explaining resource allocation: when fixing compute, the amount of parameters and the amount of data must be balanced; only increasing the model but insufficient data will result in data-limited, and only increasing data but the model is too small will result in model-limited. The Chinchilla series of results emphasize that compute-optimal training often requires more tokens and fewer parameters than early large models. 

### Embedding knowledge base reasoning, RAG and MLN

Knowledge base embedding maps entities and relationships to vector space. The basic constraint of TransE is that 

$$
e_s+r\approx e_o
$$

 holds for the triple $(s,r,o)$. The scoring function can be written as 

$$
f(s,r,o)=-\|e_s+r-e_o\|.
$$

The limitation is that many-to-many relationships, combinatorial logic, negation and quantifiers are difficult to express. Graph neural networks, rule enhancement, path reasoning and neural symbolic methods are all common improvement directions. 

RAG combines a retriever and a generator. Given query $q$, the retriever returns 

$$
R(q)=\{d_1,\ldots,d_k\},
$$

 from the document base $D$ and the generator based on $q$ and retrieve documents to generate answers: 

$$
p(x_{1:n}\mid q,R(q))
  =
  \prod_{i=1}^{n}
  p(x_i\mid q,R(q),x_{<i}).
$$

RAG’s value is to alleviate hallucinations, access private or time-sensitive knowledge, and provide citation evidence. The main risks are retrieval failure, retrieval noise, context contamination, reordering errors and citation infidelity. Engineering closed loops usually include chunking, embedding, vector indexing, recall, rearrangement, generation, referencing, and evaluation. 

Markov Logic Network (MLN) defines the log-linear distribution with a weighted first-order logic formula: 

$$
P(X=x\mid E)
  =
  \frac{1}{Z(E)}
  \exp
  \left(
    \sum_j w_j n_j(x,E)
  \right).
$$

where $n_j(x,E)$ is the $j$ formula in the world $x$ The number of groundings satisfied under evidence $E$, $w_j$ is the weight of the formula, $Z(E)=\sum_x \exp(\sum_j w_j n_j(x,E))$ is the partition function under evidence $E$, used to ensure that the probability sum is $1$. A large weight indicates a strong preference; an infinite weight can be regarded as a hard constraint. The difference between it and the embedding method is that MLN explicitly encodes logical constraints, while the embedding method is better at continuous similarity and large-scale approximation. 

##### Assessment content

- Write the language model goal from the chain rule, explain the Markov hypothesis and smoothing of $n$-gram. 

- Push the Word2vec skip-gram or negative sampling goal to explain the semantic origin of embedding. 

- Write the $Q,K,V$ formula, dimensions, mask and complexity of self-attention. 

- Explain the target differences of next-token pretraining, SFT, RLHF, DPO. 

 - illustrates the empirical form of the scaling law and the compute-optimal trade-off. 

 - Comparing the capability boundaries of knowledge base embedding, RAG and MLN. 

## Chapter 3 Self-Assessment: Definition, Conditions and Counterexamples

The following questions are used to check whether you have truly mastered the "object--hypothesis--conclusion" chain. Each question should first write a definition, then list the required conditions, and finally give a line of counterexamples or failure modes; the answers written in this way are closer to the scoring points of the qualification exam. 

1. **Generalization and model selection. ** Why can't the union bound of finite classes directly replace the VC proof? Please write down the role of the ghost sample; and then distinguish between the optimal risk within the class, the approximate error and the optimization error of the approximate ERM. 

2. **Classic model. ** When is a normal equation irreversible in linear regression? How does ridge regression change this problem? An example of $k$-NN distance distortion under high-dimensional unscaled features is given. 

3. ** Kernel and compressed sensing. ** Why is "a certain Gram matrix positive semi-definite" not enough to define the kernel? What is the uniqueness guaranteed by $2s$-RIP, and why is it still insufficient to prove $\ell_1$ recovery alone? 

4. **Optimization. ** What do strong convexity and the existence of minimum points provide respectively? Compare the sources of stochasticity in GD, SGD, and stochastic coordinate descent, and list Adam's first moments, second moments, bias correction, and numerical stability terms. 

5. **Deep learning. ** What two things does the universal approximation theorem not guarantee? Choose any vision task and write down its input, output, training loss, and a common failure mode. 

6. **Reinforcement learning. ** In which norm is the Bellman optimal operator a compressive map? What access, step size, and noise conditions are required for tabular Q-learning to converge? 

7. **NLP/LLM. ** Write down the differences between attention logits, causal mask and padding mask; then explain what goals are changed by pre-training, SFT and preference optimization respectively, as well as the failure modes that RAG cannot automatically eliminate. 

## How to use from Chapter 3 to past-exam questions

Chapter 3 is not a separate recitation of material, but a toolbox for subsequent answers to past-exam questions. When encountering a question, first determine which core course it belongs to, and then call the corresponding definition and derivation template. 

| Syllabus topics | Essential tools | Common test methods |
| --- | --- | --- |
| PAC/VC | Bernoulli indicator variables, Hoeffding, union bound, Sauer's lemma | Determine sample complexity, prove uniform convergence, calculate or define VC dimension |
| Model selection | approximation/estimation error, bias-variance, validation | Explain underfitting/overfitting, design regularization or cross-validation scheme |
| Linear/logistic model | Normal equation, MLE, logistic loss, gradient | Push objective function, gradient, convexity and regularization effect |
| SVM/kernel | margin, hinge loss, KKT intuition, PDS kernel | Write hard/soft margin, explaining kernel tricks and margin generalization |
| compressed sensing | sparsity, underdetermined measurements, $\ell_1$ relaxation, RIP | explaining why a small number of random measurements can recover sparse signals |
| convex optimization | first-order conditions, smoothness, strong convexity, subgradients, prox | proving descent, convergence rates, prox or SGD recursion |
| Deep learning | Backpropagation, normalization, residual, generative model target | Push gradient, compare VAE/GAN/flow/diffusion, explain training stability |
| Reinforcement learning | MDP, Bellman, TD error, policy gradient | Push Bellman equation, Q-learning, baseline unbiasedness |
| NLP/LLM | n-gram, embedding, attention, pretraining, alignment, RAG | Write attention dimension, explain SFT/RLHF/DPO, RAG failure mode |

** exam topics. ** The recommended review order for Chapter 3 is: master risk and generalization first, then convex optimization; then learn classic models and deep networks; and finally learn RL and NLP. The reason is that most of the formulas in the latter two sections reuse the probability, optimization, and function approximation languages ​​of the first two sections. 

**Exam Reminder. ** When doing the past-exam questions, you can organize your answers according to the following template: 

1. Write clearly the object: space, random variable, parameter, loss or value function. 

2. Write the objective: empirical risk, expected return, likelihood, ELBO, Bellman residual, or alignment objective. 

3. Write the key properties: convexity, unbiasedness, concentration bound, recursive relationship, reversibility, mask structure. 

4. Write conclusions: sample complexity, gradient, update formula, generalization explanation or model limitations. 

5. If it is an open question, compensate for engineering risks: data leakage, distribution drift, retrieval failure, optimization instability, and calculation cost. 

[^1]: The prediction rule is a function $h:\mathcal{X}\to\mathcal{Y}$: on a new input $x$, it returns $h(x)$. Formally, let $(X,Y)\sim\mathcal{D}$, where $X$ is the input and $Y$ is the target. Saying that the training set is sampled i.i.d. from $\mathcal{D}$ means that every $(x_i,y_i)$ is drawn from the same joint distribution $P_{XY}$ and that the draws are mutually independent. In binary classification, $x$ may encode word frequencies and sender characteristics of an email, with $h(x)\in\{\text{spam},\text{legitimate}\}$; in regression, $x$ may encode a house's area and location, with $h(x)\in\mathbb{R}$ predicting its price. In probabilistic classification, the model first produces $p_\theta(y\mid x)$ and predicts $\operatorname*{arg\,max}_y p_\theta(y\mid x)$. A training sample is only a finite collection of observations from an unknown population distribution, so small training error does not by itself imply small error on new observations.

# Guide to designated textbook chapters

### Understanding Machine Learning: From Theory to Algorithms

[@shalev2014uml] is the main textbook of this course from the formalization of learning problems to the proof of learnability. In particular, Chapters 2--7 should be connected into a proof chain of ERM--PAC--uniform convergence--VC--SRM. 

| Original book chapter group | What to talk about | Corresponding exam syllabus/exam topics |
| ---------------------------------- | ----------------------------------------- | ---------------------------------- |
| Chapter 1--2: Learning issues and ERM | Statistical learning framework, empirical risk, overfitting, inductive bias, finite hypothesis class.               | Supervised learning, empirical/population risk.                      |
| Chapter 3--4: PAC and uniform convergence | realizable and agnostic PAC, sample complexity, and generalization guarantees for finite classes. | PAC definition, Hoeffding/union bound proof routine. |
| Chapter 5--7: No-Free-Lunch, VC and model selection | Error decomposition, VC dimension, Sauer's lemma, basic learning theorem, SRM and MDL.      | VC/Sauer, bias-variance, model selection.              |
| Chapter 8--14: Computable Learning and Algorithm Examples | Computational complexity of ERM, half spaces, linear regression, regularization, kernel methods, decision trees, and nearest neighbors.      | Regression, SVM/kernel, tree, $k$-NN.                 |

### Foundations of Machine Learning, 2nd ed.

[@mohri2018foundations] provides a more theoretical and algorithmic supplementary perspective; for Rademacher complexity, margin, kernel and online learning, it is more suitable as a back-checking source for proof details than the previous book. 

| Original book chapter group | What to talk about | Corresponding syllabus/exam topics |
| --- | --- | --- |
| Chapter 1--2: Learning tasks and PAC | Learning stage, generalization, realizable and agnostic guarantees for finite hypothesis classes, noise and Bayes error. | PAC framework and statistical assumptions. |
| Chapter 3--4: Complexity and Model Selection | Rademacher complexity, growth function, VC-dimensional lower bound, ERM/SRM, cross-validation, regularization and surrogate loss. | VC generalization bound, model selection. |
| Chapter 5--6: margin and kernel | Linear classification, support vector, dual problem, margin theory, RKHS, representer theorem, sequence kernel. | SVM, kernel trick, positive definiteness. |
| Chapter 7 and beyond: boosting and online learning | AdaBoost, $\ell_1$ regularization, expert advice, mistake/regret-like guarantees, and subsequent learning algorithm topics. | Understand how generalization guarantees connect algorithms. |

### The three-part structure of Deep Learning

[@goodfellow2016deep] sequentially provides mathematical and ML foundations, deep network training, representation and generation models, and is a unified reference for neural networks, optimization and generation models. 

| Original book chapter group | What to talk about | Corresponding exam syllabus/exam topics |
| --- | --- | --- |
| Chapter 1--5: Basics | Linear algebra, probability/information theory, numerical calculations, capacity and generalization, MLE/MAP, SGD. | Loss, gradient, generalization, probabilistic modeling. |
| Chapter 6--8: Deep Network and Training | Feedforward network, backpropagation, regularization, optimization, initialization, batch normalization. | MLP, training methods, stability. |
| Chapter 9--12: Structure and Practice | CNN, sequence model, practical methodology, application. | Pre-knowledge of visual features, sequence/attention. |
| Chapter 13--20: Representation and Generation | Autoencoders, structured probabilistic models, Monte Carlo, approximate inference, deep generative models. | Theoretical background of representation learning, VAE/GAN/flow. |

### Deep Learning: Foundations and Concepts

[@bishop2023deep] uses probabilistic modeling throughout regression, classification, deep networks, vision, Transformer and generative models; its chapters 17--20 are particularly suitable for comparing the visual generative models in the syllabus. 

| Original book chapter group | What to talk about | Corresponding exam syllabus/exam topics |
| --- | --- | --- |
| Chapter 1--5: Probability and single-layer networks | Overview of deep learning, probability/information theory, distribution, linear regression, discriminant/generative classification. | Likelihood, cross-entropy, regression/classification basics. |
| Chapter 6--9: Deep network training | Multi-layer network, gradient descent, backpropagation, regularization and residual connection. | Network training, generalization and inductive bias. |
| Chapter 10--13: Vision, Sequence and Transformer | CNN, detection/segmentation/style transfer, graph model and sequence, attention/Transformer, graph network. | Vision task, Transformer implementation. |
| Chapter 14--20: Sampling and Generation | MCMC, discrete/continuous latent variables, GAN, normalizing flow, autoencoder/VAE, diffusion/score matching. | Target, ELBO, sampling for generative models. |

### The catalog of Pattern Recognition and Machine Learning

[@bishop2006prml] extends from probability distributions and linear models to graphical models and approximate inference; it is a classic reference that connects probabilistic models, optimization goals and inference algorithms. 

| Original book chapter group | What to talk about | Corresponding exam syllabus/exam topics |
| --- | --- | --- |
| Chapter 1--2: Probability and decision-making | Curve fitting, Bayes decision-making, information theory, exponential family, non-parametric density and nearest neighbor. | Probabilistic modeling, model selection. |
| Chapter 3--4: Linear Regression and Classification | Least squares, bias--variance, Bayesian regression, logistic regression, Laplace approximation. | Regression, logistic regression, generalization. |
| Chapter 5--7: Neural Networks and Kernels | Backpropagation, regularization, CNN, Gaussian process, SVM/RVM. | MLP, kernel method, margin. |
| Chapter 8--14: Probabilistic graphical models and inference | Graphical models, EM, mixtures, variational inference, sampling, sequence models, model combinations. | Latent variables, EM, inference and generative modeling. |

### Computer Vision: Algorithms and Applications, 2nd ed.

[@szeliski2022vision] is a structured catalog of vision tasks: each type of task can be restated in terms of inputs, geometric/statistical assumptions, outputs, and evaluation metrics. Currently, this library retains the author's official access entrance; the catalogs in the table are merged according to the official catalog of this version. 

| Original book chapter group | What to talk about | Corresponding exam syllabus/exam topics |
| --- | --- | --- |
| Introduction and imaging | Camera/image formation, color, geometric transformation and basic assumptions of the visual system. | Input, coordinate and observation models for vision problems. |
| Features, matching and alignment | Feature detection/description, matching, robust estimation, image alignment. | Feature extraction, registration, recovery. |
| Three-dimensional and motion | Multi-view geometry, structure from motion, dense motion/optical flow. | Three-dimensional reconstruction, optical flow estimation. |
| Segmentation, recognition and computational photography | Image segmentation, object/scene recognition, depth vision, computational photography. | Identify, segment and evaluate indicators. |

### Lectures on Convex Optimization

[@nesterov2018convex] Emphasis on the geometry, complexity and first-order methods of convex optimization; when connected to the past-exam questions, priority should be given to grasping the logic between smooth/strong convex inequalities, oracle models and convergence rates. 

| Original book chapter group | What to talk about | Corresponding syllabus/exam topics |
| --- | --- | --- |
| Basics of convex analysis | Convex sets/convex functions, subgradients, separation and optimality conditions. |Convexity discrimination, subdifferentiation. |
| Complexity and oracles | First-order oracles, lower bounds, and achievable complexity of different function classes. | Why distinguish between smooth/strongly convex. |
| First-order and accelerated methods | gradient, accelerated gradient, mirror/prox ideas and convergence rate. | GD, Momentum/Nesterov acceleration. |
| Constraints and Stochastic Topics | Theoretical perspectives on constraint handling, stochastic gradients, and large-scale optimization. | SGD, the bounds of stochastic/adaptive optimization. |

### First-Order Methods in Optimization

[@beck2017first] The first six chapters give the most commonly used analysis languages ​​​​in this course; Chapters 8--15 then implement these languages ​​into projected/subgradient, mirror, proximal, block, Frank--Wolfe and ADMM. 

| Original book chapter group | What to talk about | Corresponding syllabus/exam topics |
| --- | --- | --- |
| Chapter 1--4: Convex analysis toolbox | Vector space, convex function, subgradient, conjugate function and Fenchel duality. | Convex sets/functions, subdifferentials and properties. |
| Chapter 5--6: Smoothness and proximal | descent lemma, strong convexity, prox, Moreau envelope/decomposition. | GD convergence, compound optimization. |
| Chapter 8--10: First-order core algorithm | projected/stochastic subgradient, mirror descent, proximal gradient, FISTA. | SGD, random coordinates, momentum acceleration. |
| Chapter 11--15: Blocking and Splitting | block proximal gradient, dual proximal, conditional gradient, alternating minimization, ADMM. | Comparison of algorithms for large-scale optimization. |

### Speech and Language Processing

[@jurafsky2026slp] covers from statistical NLP to modern large model systems; for this syllabus, priority is given to reading along the main line of "Language Model--embedding--Transformer--Alignment/Retrieval". 

| Original book chapter group | What to talk about | Corresponding exam syllabus/exam topics |
| --- | --- | --- |
| Chapter 1--5: Statistical NLP basics | Text normalization, edit distance, $n$-gram, smoothing, Naive Bayes, logistic regression. | Statistical modeling assumptions, MLE/smoothing. |
| Chapter 6--10: Vector and Sequence Networks | word vectors, neural language models, sequence annotation, RNN/LSTM and encoder--decoder. | Word2vec, representation learning. |
| Transformer and Large Model Chapter Group | attention, Transformer LM, pre-training, instruction/alignment, evaluation and risk. | self-attention, pre-training alignment. |
| Semantics, retrieval, dialogue and speech chapter group | Information extraction, question and answer, dialogue, speech recognition/TTS and application systems. | embedding knowledge base, task background of RAG. |

### Neural Network Methods in Natural Language Processing

[@goldberg2017nnnlp] is a compact implementation-oriented textbook on neural NLP: starting from linear classification and computational graphs, and gradually advancing to embedding, CNN, RNN, attention and conditional generation. 

| Original book chapter group | What to talk about | Corresponding exam syllabus/exam topics |
| --- | --- | --- |
| Chapter 1--2: Tasks and linear models | NLP’s discrete structure, supervised classification, one-hot/dense representation, loss, regularization and SGD. | Statistical assumptions, training objectives. |
| Chapter 3--5: MLP and Training | Nonlinear, feedforward networks, embedding layers, computation graphs, backprop, initialization, and gradient problems. | Neural network implementation, backpropagation. |
| Chapter 6--10: Text Representation and Sequence | Features to input, language model, pretrained embeddings, CNN n-gram detector, RNN. | Word2vec, sequence modeling. |
| Chapter 11--21: Conditional generation and structure | encoder--decoder, attention, recursive network, multi-task/semi-supervised learning. | Attention, migration and system design. |


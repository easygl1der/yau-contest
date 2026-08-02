# 前置内容

> [!cite] 此文件保留第一章之前的封面、目录、前言或未自动归类内容。来源：[reading.md](../../../transcripts/mineru/deep-learning-goodfellow/reading.md)，源行 1–432。


<!-- MinerU pages 001-200 -->

## DEEP LEARNING

Ian Goodfellow, Yoshua Bengio, and Aaron Courville

Digitized by the Internet Archive in 2022 with funding from Kahle/Austin Foundation

Deep Learning

# Adaptive Computation and Machine Learning

Thomas Dietterich, Editor
Christopher Bishop, David Heckerman, Michael Jordan, and Michael Kearns, Associate Editors

A complete list of books published in The Adaptive Computation and Machine Learning series appears at the back of this book.

Deep Learning

Ian Goodfellow
Yoshua Bengio and
Aaron Courville

© 2016 Massachusetts Institute of Technology

All rights reserved. No part of this book may be reproduced in any form by any electronic or mechanical means (including photocopying, recording, or information storage and retrieval) without permission in writing from the publisher.

This book was set in SFRM1095 by diacriTech, Chennai.

Printed and bound in the United States of America.

Library of Congress Cataloging-in-Publication Data

Names: Goodfellow, Ian, author. | Bengio, Yoshua, author. | Courville, Aaron, author.

Title: Deep learning / Ian Goodfellow, Yoshua Bengio, and Aaron Courville.

Description: Cambridge, MA : MIT Press, [2017] | Series: Adaptive computation and machine learning series | Includes bibliographical references and index.

Identifiers: LCCN 2016022992 | ISBN 9780262035613 (hardcover : alk. paper)

Classification: LCC Q325.5 .G66 2017 | DDC 006.3/1-dc23 LC record available at https://lccn.loc.gov/2016022992

10 9 8 7

## Contents

Website
Acknowledgments
Notation
xiii
xv
xix
1 Introduction
1.1 Who Should Read This Book?
1.2 Historical Trends in Deep Learning
1 Applied Math and Machine Learning Basics
2 Linear Algebra
2.1 Scalars, Vectors, Matrices and Tensors
2.2 Multiplying Matrices and Vectors
2.3 Identity and Inverse Matrices
2.4 Linear Dependence and Span
2.5 Norms
2.6 Special Kinds of Matrices and Vectors
2.7 Eigendecomposition
2.8 Singular Value Decomposition
2.9 The Moore-Penrose Pseudoinverse
2.10 The Trace Operator
2.11 The Determinant
2.12 Example: Principal Components Analysis

3 Probability and Information Theory 51
3.1 Why Probability? ..... 52
3.2 Random Variables ..... 54
3.3 Probability Distributions ..... 54
3.4 Marginal Probability ..... 56
3.5 Conditional Probability ..... 57
3.6 The Chain Rule of Conditional Probabilities ..... 57
3.7 Independence and Conditional Independence ..... 58
3.8 Expectation, Variance and Covariance ..... 58
3.9 Common Probability Distributions ..... 60
3.10 Useful Properties of Common Functions ..... 65
3.11 Bayes' Rule ..... 68
3.12 Technical Details of Continuous Variables ..... 68
3.13 Information Theory ..... 70
3.14 Structured Probabilistic Models ..... 74

4 Numerical Computation 77
4.1 Overflow and Underflow ..... 77
4.2 Poor Conditioning ..... 79
4.3 Gradient-Based Optimization ..... 79
4.4 Constrained Optimization ..... 89
4.5 Example: Linear Least Squares ..... 92

5 Machine Learning Basics 95
5.1 Learning Algorithms ..... 96
5.2 Capacity, Overfitting and Underfitting ..... 107
5.3 Hyperparameters and Validation Sets ..... 117
5.4 Estimators, Bias and Variance ..... 119
5.5 Maximum Likelihood Estimation ..... 128
5.6 Bayesian Statistics ..... 132
5.7 Supervised Learning Algorithms ..... 136
5.8 Unsupervised Learning Algorithms ..... 142

5.9 Stochastic Gradient Descent 147
5.10 Building a Machine Learning Algorithm 149
5.11 Challenges Motivating Deep Learning 151

II Deep Networks: Modern Practices 161
6 Deep Feedforward Networks 163
6.1 Example: Learning XOR 166
6.2 Gradient-Based Learning 171
6.3 Hidden Units 185
6.4 Architecture Design 191
6.5 Back-Propagation and Other Differentiation Algorithms 197
6.6 Historical Notes 217

7 Regularization for Deep Learning 221
7.1 Parameter Norm Penalties 223
7.2 Norm Penalties as Constrained Optimization 230
7.3 Regularization and Under-Constrained Problems 232
7.4 Dataset Augmentation 233
7.5 Noise Robustness 235
7.6 Semi-Supervised Learning 236
7.7 Multitask Learning 237
7.8 Early Stopping 239
7.9 Parameter Tying and Parameter Sharing 246
7.10 Sparse Representations 247
7.11 Bagging and Other Ensemble Methods 249
7.12 Dropout 251
7.13 Adversarial Training 261
7.14 Tangent Distance, Tangent Prop and Manifold Tangent Classifier 263

8 Optimization for Training Deep Models 267
8.1 How Learning Differs from Pure Optimization 268

8.2 Challenges in Neural Network Optimization . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 275   
8.3 Basic Algorithms . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 286   
8.4 Parameter Initialization Strategies . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 292   
8.5 Algorithms with Adaptive Learning Rates. 298   
8.6 Approximate Second-Order Methods. 302   
8.7 Optimization Strategies and Meta-Algorithms 309   
9 Convolutional Networks 321   
9.1 The Convolution Operation 322   
9.2 Motivation 324   
9.3 Pooling 330   
9.4 Convolution and Pooling as an Infinitely Strong Prior 334   
9.5 Variants of the Basic Convolution Function 337   
9.6 Structured Outputs 347   
9.7 Data Types 348   
9.8 Efficient Convolution Algorithms 350   
9.9 Random or Unsupervised Features 351   
9.10 The Neuroscientific Basis for Convolutional Networks 353   
9.11 Convolutional Networks and the History of Deep Learning 359   
10 Sequence Modeling: Recurrent and Recursive Nets 363   
10.1 Unfolding Computational Graphs 365   
10.2 Recurrent Neural Networks 368   
10.3 Bidirectional RNNs 383   
10.4 Encoder-Decoder Sequence-to-Sequence Architectures 385   
10.5 Deep Recurrent Networks 387   
10.6 Recursive Neural Networks 388   
10.7 The Challenge of Long-Term Dependencies 390   
10.8 Echo State Networks 392   
10.9 Leaky Units and Other Strategies for Multiple Time Scales 395   
10.10 The Long Short-Term Memory and Other Gated RNNs 397

10.11 Optimization for Long-Term Dependencies 401
10.12 Explicit Memory 405
11 Practical Methodology 409
11.1 Performance Metrics 410
11.2 Default Baseline Models 413
11.3 Determining Whether to Gather More Data 414
11.4 Selecting Hyperparameters 415
11.5 Debugging Strategies 424
11.6 Example: Multi-Digit Number Recognition 428
12 Applications 431
12.1 Large-Scale Deep Learning 431
12.2 Computer Vision 440
12.3 Speech Recognition 446
12.4 Natural Language Processing 448
12.5 Other Applications 465
III Deep Learning Research 475
13 Linear Factor Models 479
13.1 Probabilistic PCA and Factor Analysis 480
13.2 Independent Component Analysis (ICA) 481
13.3 Slow Feature Analysis 484
13.4 Sparse Coding 486
13.5 Manifold Interpretation of PCA 489
14 Autoencoders 493
14.1 Undercomplete Autoencoders 494
14.2 Regularized Autoencoders 495
14.3 Representational Power, Layer Size and Depth 499
14.4 Stochastic Encoders and Decoders 500

14.5 Denoising Autoencoders . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 501
14.6 Learning Manifolds with Autoencoders . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 506
14.7 Contractive Autoencoders . . . . . . . . . . . . . . . . . . . . . . . . . 510
14.8 Predictive Sparse Decomposition . . . . . . . . . . . . . . . . . . . 514
14.9 Applications of Autoencoders . . . . . . . . . . . . . 515
15 Representation Learning 517
15.1 Greedy Layer-Wise Unsupervised Pretraining 519
15.2 Transfer Learning and Domain Adaptation 526
15.3 Semi-Supervised Disentangling of Causal Factors 532
15.4 Distributed Representation 536
15.5 Exponential Gains from Depth 543
15.6 Providing Clues to Discover Underlying Causes 544
16 Structured Probabilistic Models for Deep Learning 549
16.1 The Challenge of Unstructured Modeling 550
16.2 Using Graphs to Describe Model Structure 554
16.3 Sampling from Graphical Models 570
16.4 Advantages of Structured Modeling 572
16.5 Learning about Dependencies 572
16.6 Inference and Approximate Inference 573
16.7 The Deep Learning Approach to Structured Probabilistic Models 575
17 Monte Carlo Methods 581
17.1 Sampling and Monte Carlo Methods 581
17.2 Importance Sampling 583
17.3 Markov Chain Monte Carlo Methods 586
17.4 Gibbs Sampling 590
17.5 The Challenge of Mixing between Separated Modes 591
18 Confronting the Partition Function 597
18.1 The Log-Likelihood Gradient 598
18.2 Stochastic Maximum Likelihood and Contrastive Divergence 599

18.3 Pseudolikelihood . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 607   
18.4 Score Matching and Ratio Matching . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 609   
18.5 Denoising Score Matching . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 611   
18.6 Noise-Contrastive Estimation. 612   
18.7 Estimating the Partition Function. 614   
19 Approximate Inference 623   
19.1 Inference as Optimization. 624   
19.2 Expectation Maximization. 626   
19.3 MAP Inference and Sparse Coding. 627   
19.4 Variational Inference and Learning. 629   
19.5 Learned Approximate Inference. 642   
20 Deep Generative Models 645   
20.1 Boltzmann Machines. 645   
20.2 Restricted Boltzmann Machines. 647   
20.3 Deep Belief Networks. 651   
20.4 Deep Boltzmann Machines. 654   
20.5 Boltzmann Machines for Real-Valued Data. 667   
20.6 Convolutional Boltzmann Machines. 673   
20.7 Boltzmann Machines for Structured or Sequential Outputs. 675   
20.8 Other Boltzmann Machines. 677   
20.9 Back-Propagation through Random Operations. 678   
20.10 Directed Generative Nets. 682   
20.11 Drawing Samples from Autoencoders. 701   
20.12 Generative Stochastic Networks. 704   
20.13 Other Generation Schemes. 706   
20.14 Evaluating Generative Models. 707   
20.15 Conclusion. 710   
Bibliography 711   
Index 767

www.deeplearningbook.org

This book is accompanied by the above website. The website provides a variety of supplementary material, including exercises, lecture slides, corrections of mistakes, and other resources that should be useful to both readers and instructors.

## Acknowledgments

This book would not have been possible without the contributions of many people.

We would like to thank those who commented on our proposal for the book and helped plan its contents and organization: Guillaume Alain, Kyunghyun Cho, Çağlar Gülçehre, David Krueger, Hugo Larochelle, Razvan Pascanu and Thomas Rohée.

We would like to thank the people who offered feedback on the content of the book itself. Some offered feedback on many chapters: Martín Abadi, Guillaume Alain, Ion Androutsopoulos, Fred Bertsch, Olexa Bilaniuk, Ufuk Can Biçici, Matko Bošnjak, John Boersma, Greg Brockman, Alexandre de Brébisson, Pierre Luc Carrier, Sarath Chandar, Pawel Chilinski, Mark Daoust, Oleg Dashevskii, Laurent Dinh, Stephan Dreseitl, Jim Fan, Miao Fan, Meire Fortunato, Frédéric Francis, Nando de Freitas, Çağlar Gülçehre, Jurgen Van Gael, Javier Alonso García, Jonathan Hunt, Gopi Jeyaram, Chingiz Kabytayev, Lukasz Kaiser, Varun Kanade, Asifullah Khan, Akiel Khan, John King, Diederik P. Kingma, Yann LeCun, Rudolf Mathey, Matías Mattamala, Abhinav Maurya, Kevin Murphy, Oleg Mürk, Roman Novak, Augustus Q. Odena, Simon Pavlik, Karl Pichotta, Eddie Pierce, Kari Pulli, Roussel Rahman, Tapani Raiko, Anurag Ranjan, Johannes Roith, Mihaela Rosca, Halis Sak, César Salgado, Grigory Sapunov, Yoshinori Sasaki, Mike Schuster, Julian Serban, Nir Shabat, Ken Shirriff, Andre Simpelo, David Slate, Scott Stanley, David Sussillo, Ilya Sutskever, Carles Gelada Sáez, Graham Taylor, Valentin Tolmer, Massimiliano Tomassoli, An Tran, Shubhendu Trivedi, Alexey Umnov, Vincent Vanhoucke, Marco Visentini-Scarzanella, Martin Vita, David Warde-Farley, Dustin Webb, Kelvin Xu, Wei Xue, Ke Yang, Li Yao, Zygmunt Zajac and Ozan Çağlayan.

We would also like to thank those who provided us with useful feedback on individual chapters:

\- Notation: Zhang Yuanhang.

- Chapter 1, Introduction: Yusuf Akgul, Sebastien Bratieres, Samira Ebrahimi,

Charlie Gorichanaz, Brendan Loudermilk, Eric Morris, Cosmin Pârvulescu and Alfredo Solano.

- Chapter 2, Linear Algebra: Amjad Almahairi, Nikola Banić, Kevin Bennett, Philippe Castonguay, Oscar Chang, Eric Fosler-Lussier, Andrey Khalyavin, Sergey Oreshkov, István Petrás, Dennis Prangle, Thomas Rohée, Gitanjali Gulve Sehgal, Colby Toland, Alessandro Vitale and Bob Welland.

- Chapter 3, Probability and Information Theory: John Philip Anderson, Kai Arulkumaran, Vincent Dunoulin, Rui Fa, Stephan Gouws, Artem Oboturov, Antti Rasmus, Alexey Surkov and Volker Tresp.

- Chapter 4, Numerical Computation: Tran Lam AnIan Fischer and Hu Yuhuang.

- Chapter 5, Machine Learning Basics: Dzmitry Bahdanau, Justin Domingue, Nikhil Garg, Makoto Otsuka, Bob Pepin, Philip Popien, Bharat Prabhakar, Emmanuel Rayner, Peter Shepard, Kee-Bong Song, Zheng Sun and Andy Wu.

- Chapter 6, Deep Feedforward Networks: Uriel Berdugo, Fabrizio Bottarel, Elizabeth Burl, Ishan Durugkar, Jeff Hlywa, Jong Wook Kim, David Krueger, Aditya Kumar Praharaj and Sten Sootla.

- Chapter 7, Regularization for Deep Learning: Morten Kolbæk, Kshitij Lauria, Inkyu Lee, Sunil Mohan, Hai Phong Phan and Joshua Salisbury.

- Chapter 8, Optimization for Training Deep Models: Marcel Ackermann, Peter Armitage, Rowel Atienza, Andrew Brock, Tegan Maharaj, James Martens, Mostafa Nategh, Kashif Rasul, Klaus Strobl and Nicholas Turner.

- Chapter 9, Convolutional Networks: Martín Arjovsky, Eugene Brevdo. Konstantin Divilov, Eric Jensen, Mehdi Mirza, Alex Paino, Marjorie Sayer, Ryan Stout and Wentao Wu.

- Chapter 10, Sequence Modeling: Recurrent and Recursive Nets: Gökçen Eraslan, Steven Hickson, Razvan Pascanu, Lorenzo von Ritter, Rui Rodrigues, Dmitriy Serdyuk, Dongyu Shi and Kaiyu Yang.

- Chapter 11, Practical Methodology: Daniel Beckstein.

- Chapter 12, Applications: George Dahl, Vladimir Nekrasov and Ribana Roscher.

- Chapter 13, Linear Factor Models: Jayanth Koushik.

- Chapter 15, Representation Learning: Kunal Ghosh.

\- Chapter 16, Structured Probabilistic Models for Deep Learning: Minh Lê and Anton Varfolom.

\- Chapter 18, Confronting the Partition Function: Sam Bowman.

- Chapter 19, Approximate Inference: Yujia Bao.

\- Chapter 20, Deep Generative Models: Nicolas Chapados, Daniel Galvez, Wenming Ma, Fady Medhat, Shakir Mohamed and Grégoire Montavon.

- Bibliography: Lukas Michelbacher and Leslie N. Smith.

We also want to thank those who allowed us to reproduce images, figures or data from their publications. We indicate their contributions in the figure captions throughout the text.

We would like to thank Lu Wang for writing pdf2htmlEX, which we used to make the web version of the book, and for offering support to improve the quality of the resulting HTML.

We would like to thank Ian's wife Daniela Flori Goodfellow for patiently supporting Ian during the writing of the book as well as for help with proofreading.

We would like to thank the Google Brain team for providing an intellectual environment where Ian could devote a tremendous amount of time to writing this book and receive feedback and guidance from colleagues. We would especially like to thank Ian's former manager, Greg Corrado, and his current manager, Samy Bengio, for their support of this project. Finally, we would like to thank Geoffrey Hinton for encouragement when writing was difficult.

## Notation

This section provides a concise reference describing the notation used throughout this book. If you are unfamiliar with any of the corresponding mathematical concepts, we describe most of these ideas in chapters 2 4.

## Numbers and Arrays

a A scalar (integer or real)  
a A vector  
A A matrix  
A A tensor

$I_{n}$ Identity matrix with $n$ rows and $n$ columns

I Identity matrix with dimensionality implied by context

$e^{(i)}$ Standard basis vector $[0,\dots,0,1,0,\dots,0]$ with a 1 at position $i$

$\operatorname{diag}(\boldsymbol{a})$ A square, diagonal matrix with diagonal entries given by $\boldsymbol{a}$

a A scalar random variable

a A vector-valued random variable

A matrix-valued random variable

## Sets and Graphs

A A set

$\mathbb{R}$ The set of real numbers

$\{0,1\}$ The set containing 0 and 1

$\{0,1,\dots,n\}$ The set of all integers between 0 and $n$

$[a,b]$ The real interval including $a$ and $b$

$(a,b]$ The real interval excluding $a$ but including $b$

A\B Set subtraction, i.e., the set containing the elements of A that are not in B

$\mathcal{G}$ A graph

$Pa_{\mathcal{G}}(x_{i})$ The parents of $x_{i}$ in G

## Indexing

$a_{i}$ Element i of vector a, with indexing starting at 1

$a_{-i}$ All elements of vector a except for element i

$A_{i,j}$ Element $i,j$ of matrix $\mathbf{A}$

$A_{i,:}$ Row i of matrix A

$A_{:,i}$ Column i of matrix A

$A_{i,j,k}$ Element $(i,j,k)$ of a 3-D tensor $\mathbf{A}$

$\mathbf{A}_{:,:,i}$ 2-D slice of a 3-D tensor

$a_{i}$ Element i of the random vector a

Linear Algebra Operations

$\mathbf{A}^{\top}$ Transpose of matrix $\mathbf{A}$

$A^{+}$ Moore-Penrose pseudoinverse of $\mathbf{A}$

$A\odot B$ Element-wise (Hadamard) product of $A$ and $B$

$\operatorname{det}(\pmb{A})$ Determinant of $\pmb{A}$

<table><tr><td colspan="2">Calculus</td></tr><tr><td> $\frac{dy}{dx}$ </td><td>Derivative of y with respect to x</td></tr><tr><td> $\frac{\partial y}{\partial x}$ </td><td>Partial derivative of y with respect to x</td></tr><tr><td> $\nabla_{xy}$ </td><td>Gradient of y with respect to x</td></tr><tr><td> $\nabla_{xy}$ </td><td>Matrix derivatives of y with respect to X</td></tr><tr><td> $\nabla_{xy}$ </td><td>Tensor containing derivatives of y with respect to X</td></tr><tr><td> $\frac{\partial f}{\partial x}$ </td><td>Jacobian matrix  $J \in \mathbb{R}^{m \times n}$  of  $f : \mathbb{R}^n \to \mathbb{R}^m$ </td></tr><tr><td> $\nabla_x^2f(x)$  or  $H(f)(x)$ </td><td>The Hessian matrix of f at input point x</td></tr><tr><td> $\int f(x)dx$ </td><td>Definite integral over the entire domain of x</td></tr><tr><td> $\int_{\mathbb{S}} f(\cdot \backslash dx$ </td><td>Definite integral with respect to x over the set S</td></tr><tr><td colspan="2">Probability and Information Theory</td></tr><tr><td>a⊥b</td><td>The random variables a and b are independent</td></tr><tr><td>a⊥b | c</td><td>They are conditionally independent given c</td></tr><tr><td>P(a)</td><td>A probability distribution over a discrete variable</td></tr><tr><td>p(a)</td><td>A probability distribution over a continuous variable, or over a variable whose type has not been specified</td></tr><tr><td>a ~ P</td><td>Random variable a has distribution P</td></tr><tr><td> $\mathbb{E}_{x \sim P}[f(x)]$  or  $\mathbb{E}f(x)$ </td><td>Expectation of f(x) with respect to P(x)</td></tr><tr><td>Var(f(x))</td><td>Variance of f(x) under P(x)</td></tr><tr><td>Cov(f(x), g(x))</td><td>Covariance of f(x) and g(x) under P(x)</td></tr><tr><td>H(x)</td><td>Shannon entropy of the random variable x</td></tr><tr><td> $D_{\text{KL}}(P||Q)$ </td><td>Kullback-Leibler divergence of P and Q</td></tr><tr><td> $\mathcal{N}(x; \mu, \Sigma)$ </td><td>Gaussian distribution over x with mean μ and covariance Σ</td></tr></table>

## Functions

$f:\mathbb{A}\to \mathbb{B}$ The function $f$ with domain $\mathbb{A}$ and range $\mathbb{B}$

$f\circ g$ Composition of the functions $f$ and $g$

$f(\pmb{x};\pmb{\theta})$ A function of $\pmb{x}$ parametrized by $\pmb{\theta}$ . (Sometimes we write $f(\pmb{x})$ and omit the argument $\pmb{\theta}$ to lighten notation)

log $x$ Natural logarithm of $x$

$\sigma(x)$ Logistic sigmoid, $\frac{1}{1 + \exp(-x)}$

$\zeta(x)$ Softplus, $\log(1 + \exp(x))$

$||\pmb{x}||_{p}$ $L^p$ norm of $\pmb{x}$

||x|| $L^{2}$ norm of x

$x^{+}$ Positive part of x, i.e., $\max(0, x)$

$1_{condition}$ is 1 if the condition is true, 0 otherwise

Sometimes we use a function f whose argument is a scalar but apply it to a vector, matrix, or tensor: $f(\mathbf{x})$ , $f(\mathbf{X})$ , or $f(\mathbf{X})$ . This denotes the application of f to the array element-wise. For example, if $\mathbf{C} = \sigma(\mathbf{X})$ , then $C_{i,j,k} = \sigma(X_{i,j,k})$ for all valid values of i, j and k.

## Datasets and Distributions

$p_{\mathrm{data}}$ The data generating distribution

$\hat{p}_{\mathrm{data}}$ The empirical distribution defined by the training set

X A set of training examples

$x^{(i)}$ The i-th example (input) from a dataset

$y^{(i)}$ or $\pmb{y}^{(i)}$ The target associated with $\pmb{x}^{(i)}$ for supervised learning

X The $m \times n$ matrix with input example $\boldsymbol{x}^{(i)}$ in row $X_{i,:}$


---
title: "Chapter 22 \u2014 Clustering"
book: "Understanding Machine Learning: From Theory to Algorithms"
book_slug: understanding-machine-learning
course: machine-learning
chapter_number: 22
citekey: shalev2014uml
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf"
source_transcript: "transcripts/mineru/understanding-machine-learning/reading.md"
source_line_start: 7916
source_line_end: 8263
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 1
source_empty_image_alt: 1
non_semantic_image_alt: 1
caption_derived_image_alt: 0
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
  - machine-learning
  - official-syllabus
---

# Chapter 22 — Clustering

> [[../README|本书目录]] · [[21-chapter-21-online-learning|上一章]] · [[23-chapter-23-dimensionality-reduction|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Understanding Machine Learning: From Theory to Algorithms（shalev2014uml）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/understanding-machine-learning/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/understanding-machine-learning/reading.md)，源行 7916–8263。
> - 本章保留 1 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：different × 8；sufficient × 1。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 22.1 Linkage-Based Clustering Algorithms

Linkage-based clustering is probably the simplest and most straightforward paradigm of clustering. These algorithms proceed in a sequence of rounds. They start from the trivial clustering that has each data point as a single-point cluster. Then, repeatedly, these algorithms merge the “closest” clusters of the previous clustering. Consequently, the number of clusters decreases with each such round. If kept going, such algorithms would eventually result in the trivial clustering in which all of the domain points share one large cluster. Two parameters, then, need to be determined to define such an algorithm clearly. First, we have to decide how to measure (or define) the distance between clusters, and, second, we have to determine when to stop merging. Recall that the input to a clustering algorithm is a between-points distance function, d. There are many ways of extending d to a measure of distance between domain subsets (or clusters). The most common ways are

1. Single Linkage clustering, in which the between-clusters distance is defined by the minimum distance between members of the two clusters, namely,

$$
D(A, B) \stackrel{\mathrm{def}}{=} \min \{d(x, y): x \in A, y \in B\}
$$

2. Average Linkage clustering, in which the distance between two clusters is defined to be the average distance between a point in one of the clusters and a point in the other, namely,

$$
D(A, B) \stackrel{{\text{def}}}{{=}} \frac{1}{| A | | B |} \sum_{x \in A, y \in B} d(x, y)
$$

3. Max Linkage clustering, in which the distance between two clusters is defined as the maximum distance between their elements, namely,

$$
D(A, B) \stackrel{{\text{def}}}{{=}} \max \{d(x, y): x \in A, y \in B\}.
$$

The linkage-based clustering algorithms are agglomerative in the sense that they start from data that is completely fragmented and keep building larger and larger clusters as they proceed. Without employing a stopping rule, the outcome of such an algorithm can be described by a clustering dendrogram: that is, a tree of domain subsets, having the singleton sets in its leaves, and the full domain as its root. For example, if the input is the elements $\mathcal{X} = \{a, b, c, d, e\} \subset \mathbb{R}^{2}$ with the Euclidean distance as depicted on the left, then the resulting dendrogram is the one depicted on the right:

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/understanding-machine-learning/parts/pages-201-400/images/f3a30206f984cf2b63a3284a29aee5065db1ab060b41596a7908a5556e315ab6.jpg)

The single linkage algorithm is closely related to Kruskal’s algorithm for finding a minimal spanning tree on a weighted graph. Indeed, consider the full graph whose vertices are elements of X and the weight of an edge $(x, y)$ is the distance $d(x, y)$ . Each merge of two clusters performed by the single linkage algorithm corresponds to a choice of an edge in the aforementioned graph. It is also possible to show that the set of edges the single linkage algorithm chooses along its run forms a minimal spanning tree.

If one wishes to turn a dendrogram into a partition of the space (a clustering), one needs to employ a stopping criterion. Common stopping criteria include

- Fixed number of clusters – fix some parameter, k, and stop merging clusters as soon as the number of clusters is k.

- Distance upper bound – fix some $r \in \mathbb{R}_{+}$ . Stop merging as soon as all the between-clusters distances are larger than r. We can also set $\textit{r}{\mathrm{~ \to ~}}$ be α max $\{d(x, y) : x, y \in \mathcal{X}\}$ for some $\alpha \ < \1$ . In that case the stopping criterion is called “scaled distance upper bound.”

## 22.2 k-Means and Other Cost Minimization Clusterings

Another popular approach to clustering starts by defining a cost function over a parameterized set of possible clusterings and the goal of the clustering algorithm is to find a partitioning (clustering) of minimal cost. Under this paradigm, the clustering task is turned into an optimization problem. The objective function is a function from pairs of an input, $(\mathcal{X}, d)$ , and a proposed clustering solution $C =(C_{1}, \ldots, C_{k})$ , to positive real numbers. Given such an objective function, which we denote by G, the goal of a clustering algorithm is defined as finding, for a given input $(\mathcal{X}, d)$ , a clustering $C$ so that $G((\mathcal{X}, d), C)$ is minimized. In order to reach that goal, one has to apply some appropriate search algorithm.

As it turns out, most of the resulting optimization problems are NP-hard, and some are even NP-hard to approximate. Consequently, when people talk about, say, k-means clustering, they often refer to some particular common approximation algorithm rather than the cost function or the corresponding exact solution of the minimization problem.

Many common objective functions require the number of clusters, $k,$ as a parameter. In practice, it is often up to the user of the clustering algorithm to choose the parameter k that is most suitable for the given clustering problem. In the following we describe some of the most common objective functions.

- The k-means objective function is one of the most popular clustering objectives. In k-means the data is partitioned into disjoint sets $C_{1}, \ldots, C_{k}$ where each $C_{i}$ is represented by a centroid $\mu_{i}$ . It is assumed that the input set X is embedded in some larger metric space $(\mathcal{X}^{\prime}, d)$ (so that $\mathcal{X} \subseteq \mathcal{X}^{\prime})$ and centroids are members of $\mathcal{X}^{\prime}$ . The k-means objective function measures the squared distance between each point in X to the centroid of its cluster. The centroid of $C_{i}$ is defined to be

$$
\mu_{i}(C_{i}) = \underset{\mu \in \mathcal{X}^{\prime}}{\operatorname{argmin}} \sum_{x \in C_{i}} d(x, \mu)^{2}.
$$

Then, the k-means objective is

$$
G_{\mathrm{k-means}}((\mathcal{X}, d),(C_{1}, \ldots, C_{k})) = \sum_{i = 1}^{k} \sum_{x \in C_{i}} d(x, \mu_{i}(C_{i}))^{2}.
$$

This can also be rewritten as

$$
G_{\mathrm{k-means}}((\mathcal{X}, d),(C_{1}, \ldots, C_{k})) = \min_{\mu_{1}, \ldots \mu_{k} \in \mathcal{X}^{\prime}} \sum_{i = 1}^{k} \sum_{x \in C_{i}} d(x, \mu_{i})^{2}.\tag{22.1}
$$

The k-means objective function is relevant, for example, in digital communication tasks, where the members of X may be viewed as a collection of signals that have to be transmitted. While X may be a very large set of real valued vectors, digital transmission allows transmitting of only a finite number of bits for each signal. One way to achieve good transmission under such constraints is to represent each member of X by a “close” member of some finite set $\mu_{1}, \ldots \mu_{k}$ , and replace the transmission of any $x \in \mathcal{X}$ by transmitting the index of the closest $\mu_{i}$ . The k-means objective can be viewed as a measure of the distortion created by such a transmission representation scheme.

- The k-medoids objective function is similar to the k-means objective, except that it requires the cluster centroids to be members of the input set. The objective function is defined by

$$
G_{\mathrm{K-medoid}}((\mathcal{X}, d),(C_{1}, \ldots, C_{k})) = \min_{\mu_{1}, \ldots \mu_{k} \in \mathcal{X}} \sum_{i = 1}^{k} \sum_{x \in C_{i}} d(x, \mu_{i})^{2}.
$$

- The k-median objective function is quite similar to the k-medoids objective, except that the “distortion” between a data point and the centroid of its cluster is measured by distance, rather than by the square of the distance:

$$
G_{\mathrm{K} - \text{median}}((\mathcal{X}, d),(C_{1}, \ldots, C_{k})) = \min_{\mu_{1}, \ldots \mu_{k} \in \mathcal{X}} \sum_{i = 1}^{k} \sum_{x \in C_{i}} d(x, \mu_{i}).
$$

An example where such an objective makes sense is the facility location problem. Consider the task of locating k fire stations in a city. One can model houses as data points and aim to place the stations so as to minimize the average distance between a house and its closest fire station.

The previous examples can all be viewed as center-based objectives. The solution to such a clustering problem is determined by a set of cluster centers, and the clustering assigns each instance to the center closest to it. More generally, center-based objective is determined by choosing some monotonic function $f : \mathbb{R}_{+} \to \mathbb{R}_{+}$ and then defining

$$
G_{f}((\mathcal{X}, d),(C_{1}, \dots C_{k})) = \min_{\mu_{1}, \dots \mu_{k} \in \mathcal{X}^{\prime}} \sum_{i = 1}^{k} \sum_{x \in C_{i}} f(d(x, \mu_{i})),
$$

where $\mathcal{X}^{\prime}$ is either $\mathcal{X}$ or some superset of $\mathcal{X}.$

Some objective functions are not center based. For example, the sum of incluster distances (SOD)

$$
G_{\mathrm{SOD}}((\mathcal{X}, d),(C_{1}, \ldots C_{k})) = \sum_{i = 1}^{k} \sum_{x, y \in C_{i}} d(x, y)
$$

and the MinCut objective that we shall discuss in Section 22.3 are not centerbased objectives.

## 22.2.1 The k-Means Algorithm

The k-means objective function is quite popular in practical applications of clustering. However, it turns out that finding the optimal k-means solution is often computationally infeasible (the problem is NP-hard, and even NP-hard to approximate to within some constant). As an alternative, the following simple iterative algorithm is often used, so often that, in many cases, the term k-means Clustering refers to the outcome of this algorithm rather than to the clustering that minimizes the k-means objective cost. We describe the algorithm with respect to the Euclidean distance function $d(\mathbf{x}, \mathbf{y}) = \| \mathbf{x} - \mathbf{y} \|$

## k-Means

input: $\mathcal{X} \subset \mathbb{R}^{n}$ ; Number of clusters k

initialize: Randomly choose initial centroids $\pmb{\mu}_{1}, \ldots, \pmb{\mu}_{k}$

repeat until convergence

$$
\forall i \in[k] \text{set} C_{i} = \{\mathbf{x} \in \mathcal{X}: i = \operatorname{argmin}_{j} \| \mathbf{x} - \boldsymbol{\mu}_{j} \|\}
$$

(break ties in some arbitrary manner)

$$
\forall i \in[k] \mathrm{update} \pmb{\mu}_{i} = \frac{1}{| C_{i} |} \sum_{\mathbf{x} \in C_{i}} \mathbf{x}
$$

<sup>lemma</sup> 22.1 Each iteration of the k-means algorithm does not increase the k-means objective function (as given in Equation (22.1)).

Proof To simplify the notation, let us use the shorthand $G(C_{1}, \dots, C_{k})$ for the k-means objective, namely,

$$
G(C_{1}, \ldots, C_{k}) = \min_{\boldsymbol{\mu}_{1}, \ldots, \boldsymbol{\mu}_{k} \in \mathbb{R}^{n}} \sum_{i = 1}^{k} \sum_{\mathbf{x} \in C_{i}} \| \mathbf{x} - \boldsymbol{\mu}_{i} \|^{2}.\tag{22.2}
$$

It is convenient to define $\begin{array}{r}{\pmb{\mu}(C_{i}) = \frac{1}{| C_{i} |} \sum_{\mathbf{x} \in C_{i}}} \end{array}$ x and note that $\begin{array}{r}{\pmb{\mu}(C_{i}) = \operatorname{argmin}_{\pmb{\mu} \in \mathbb{R}^{n}} \sum_{\mathbf{x} \in C_{i}} \| \mathbf{x} - \mathbf{\mu}} \end{array}$ $\mu \|^{2}$ . Therefore, we can rewrite the k-means objective as

$$
G(C_{1}, \dots, C_{k}) = \sum_{i = 1}^{k} \sum_{\mathbf{x} \in C_{i}} \| \mathbf{x} - \boldsymbol{\mu}(C_{i}) \|^{2}.\tag{22.3}
$$

Consider the update at iteration t of the k-means algorithm. Let $C_{1}^{(t - 1)}, \dots, C_{k}^{(t - 1)}$ be the previous partition, let $\pmb{\mu}_{i}^{(t - 1)} = \pmb{\mu}(C_{i}^{(t - 1)})$ , and let $C_{1}^{(t)}, \ldots, C_{k}^{(t)}$ be the new partition assigned at iteration t. Using the definition of the objective as given in Equation (22.2) we clearly have that

$$
G(C_{1}^{(t)}, \ldots, C_{k}^{(t)}) \leq \sum_{i = 1}^{k} \sum_{\mathbf{x} \in C_{i}^{(t)}} \| \mathbf{x} - \boldsymbol{\mu}_{i}^{(t - 1)} \|^{2}.\tag{22.4}
$$

In addition, the definition of the new partition $(C_{1}^{(t)}, \ldots, C_{k}^{(t)})$ implies that it minimizes the expression $\begin{array}{r}{\sum_{i = 1}^{k} \sum_{\mathbf{x} \in C_{i}} \| \mathbf{x} - \pmb{\mu}_{i}^{(t - 1)} \|^{2}} \end{array}$ over all possible partitions $(C_{1}, \ldots, C_{k})$ . Hence,

$$
\sum_{i = 1}^{k} \sum_{\mathbf{x} \in C_{i}^{(t)}} \| \mathbf{x} - \boldsymbol{\mu}_{i}^{(t - 1)} \|^{2} \leq \sum_{i = 1}^{k} \sum_{\mathbf{x} \in C_{i}^{(t - 1)}} \| \mathbf{x} - \boldsymbol{\mu}_{i}^{(t - 1)} \|^{2}.\tag{22.5}
$$

Using Equation (22.3) we have that the right-hand side of Equation (22.5) equals $G(C_{1}^{\breve{(t - 1)}}, \dots, C_{k}^{(t - 1)})$ . Combining this with Equation (22.4) and Equation (22.5), we obtain that $\mathbf{\tilde{\boldsymbol{G}}}(\boldsymbol{C}_{1}^{(t)}, \ldots, \boldsymbol{C}_{k}^{(t)}) \le G(\boldsymbol{C}_{1}^{(t - 1)}, \ldots, \boldsymbol{C}_{k}^{(t - 1)})$ , which concludes our proof. □

While the preceding lemma tells us that the k-means objective is monotonically nonincreasing, there is no guarantee on the number of iterations the k-means algorithm needs in order to reach convergence. Furthermore, there is no nontrivial lower bound on the gap between the value of the k-means objective of the algorithm’s output and the minimum possible value of that objective function. In fact, k-means might converge to a point which is not even a local minimum (see Exercise 2). To improve the results of k-means it is often recommended to repeat the procedure several times with different randomly chosen initial centroids (e.g., we can choose the initial centroids to be random points from the data).

## 22.3 Spectral Clustering

Often, a convenient way to represent the relationships between points in a data set $\mathcal{X} = \{x_{1}, \ldots, x_{m}\}$ is by a similarity graph; each vertex represents a data point $x_{i}.$ , and every two vertices are connected by an edge whose weight is their similarity, $W_{i, j} = s(x_{i}, x_{j})$ , where $W \in \mathbb{R}^{m, m}$ . For example, we can set $W_{i, j} =$ exp $(- d(x_{i}, x_{j})^{2} / \sigma^{2})$ , where $d(\cdot, \cdot)$ is a distance function and σ is a parameter. The clustering problem can now be formulated as follows: We want to find a partition of the graph such that the edges between different groups have low weights and the edges within a group have high weights.

In the clustering objectives described previously, the focus was on one side of our intuitive definition of clustering – making sure that points in the same cluster are similar. We now present objectives that focus on the other requirement – points separated into different clusters should be nonsimilar.

## 22.3.1 Graph Cut

Given a graph represented by a similarity matrix W , the simplest and most direct way to construct a partition of the graph is to solve the mincut problem, which chooses a partition $C_{1}, \ldots, C_{k}$ that minimizes the objective

$$
\operatorname{cut}(C_{1}, \dots, C_{k}) = \sum_{i = 1}^{k} \sum_{r \in C_{i}, s \notin C_{i}} W_{r, s}.
$$

For $k = 2$ , the mincut problem can be solved eficiently. However, in practice it often does not lead to satisfactory partitions. The problem is that in many cases, the solution of mincut simply separates one individual vertex from the rest of the graph. Of course, this is not what we want to achieve in clustering, as clusters should be reasonably large groups of points.

Several solutions to this problem have been suggested. The simplest solution is to normalize the cut and define the normalized mincut objective as follows:

$$
\operatorname{RatioCut} \left(C_{1}, \dots, C_{k}\right) = \sum_{i = 1}^{k} \frac{1}{\left| C_{i} \right|} \sum_{r \in C_{i}, s \notin C_{i}} W_{r, s}.
$$

The preceding objective assumes smaller values if the clusters are not too small. Unfortunately, introducing this balancing makes the problem computationally hard to solve. Spectral clustering is a way to relax the problem of minimizing RatioCut.

## 22.3.2 Graph Laplacian and Relaxed Graph Cuts

The main mathematical object for spectral clustering is the graph Laplacian matrix. There are several different definitions of graph Laplacian in the literature, and in the following we describe one particular definition.

<sup>definition</sup> 22.2 (Unnormalized Graph Laplacian) The unnormalized graph Laplacian is the $m \times m$ matrix $L = D - W$ where D is a diagonal matrix with $\begin{array}{r}{D_{i, i} = \sum_{j = 1}^{m} W_{i, j}} \end{array}$ . The matrix D is called the degree matrix.

The following lemma underscores the relation between RatioCut and the Laplacian matrix.

<sup>lemma</sup> 22.3 Let $C_{1}, \ldots, C_{k}$ be a clustering and let $H \in \mathbb{R}^{m, k}$ be the matrix such that

$$
H_{i, j} = \frac{1}{\sqrt{| C_{j} |}} \mathbb{1}_{[i \in C_{j}]}.
$$

Then, the columns of H are orthonormal to each other and

$$
RatioCut(C_{1}, \dots, C_{k}) = \operatorname{trace}(H^{\top} LH).
$$

Proof Let $\mathbf{h}_{1}, \ldots, \mathbf{h}_{k}$ be the columns of H. The fact that these vectors are orthonormal is immediate from the definition. Next, by standard algebraic manipulations, it can be shown that trace $\begin{array}{r}{\mathbf{\Sigma}^{'} H^{\top} LH) = \sum_{i = 1}^{k} \mathbf{h}_{i}^{\top} L \mathbf{h}_{i}} \end{array}$ and that for any vector v we have

$$
\mathbf{v}^{\top} L \mathbf{v} = \frac{1}{2} \left(\sum_{r} D_{r, r} v_{r}^{2} - 2 \sum_{r, s} v_{r} v_{s} W_{r, s} + \sum_{s} D_{s, s} v_{s}^{2}\right) = \frac{1}{2} \sum_{r, s} W_{r, s}(v_{r} - v_{s})^{2}.
$$

Applying this with $\mathbf{v} ~ = ~ \mathbf{h}_{i}$ and noting that $(h_{i, r} - h_{i, s})^{2}$ is nonzero only if $r \in C_{i}, s \notin C_{i}$ or the other way around, we obtain that

$$
\mathbf{h}_{i}^{\top} L \mathbf{h}_{i} = \frac{1}{| C_{i} |} \sum_{r \in C_{i}, s \notin C_{i}} W_{r, s}.
$$

Therefore, to minimize RatioCut we can search for a matrix H whose columns are orthonormal and such that each $H_{i, j}$ is either 0 or $1 / \sqrt{| C_{j} |}$ . Unfortunately, this is an integer programming problem which we cannot solve eficiently. Instead, we relax the latter requirement and simply search an orthonormal matrix $H \in$ $\mathbb{R}^{m, k}$ that minimizes trace $(H^{\top} LH)$ . As we will see in the next chapter about PCA (particularly, the proof of Theorem 23.2), the solution to this problem is to set U to be the matrix whose columns are the eigenvectors corresponding to the k minimal eigenvalues of L. The resulting algorithm is called Unnormalized Spectral Clustering.

## 22.3.3 Unnormalized Spectral Clustering

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Unnormalized Spectral Clustering
Input:  $W \in R^{m,m}$ ; Number of clusters k
Initialize: Compute the unnormalized graph Laplacian L
Let  $U \in R^{m,k}$  be the matrix whose columns are the eigenvectors of L corresponding to the k smallest eigenvalues
Let  $v_{1}, \ldots, v_{m}$  be the rows of U
Cluster the points  $v_{1}, \ldots, v_{m}$  using k-means
Output: Clusters  $C_{1}, \ldots, C_{K}$  of the k-means algorithm
</div>

The spectral clustering algorithm starts with finding the matrix H of the k eigenvectors corresponding to the smallest eigenvalues of the graph Laplacian matrix. It then represents points according to the rows of H. It is due to the properties of the graph Laplacians that this change of representation is useful. In many situations, this change of representation enables the simple k-means algorithm to detect the clusters seamlessly. Intuitively, if H is as defined in Lemma 22.3 then each point in the new representation is an indicator vector whose value is nonzero only on the element corresponding to the cluster it belongs to.

## 22.4 Information Bottleneck\*

The information bottleneck method is a clustering technique introduced by Tishby, Pereira, and Bialek. It relies on notions from information theory. To illustrate the method, consider the problem of clustering text documents where each document is represented as a bag-of-words; namely, each document is a vector $\mathbf{x} = \{0, 1\}^{n}$ , where n is the size of the dictionary and $x_{i} = 1$ if the word corresponding to index i appears in the document. Given a set of m documents, we can interpret the bag-of-words representation of the m documents as a joint probability over a random variable x, indicating the identity of a document (thus taking values in [m]), and a random variable y, indicating the identity of a word in the dictionary (thus taking values in [n]).

With this interpretation, the information bottleneck refers to the identity of a clustering as another random variable, denoted $C_{i}$ , that takes values in [k] (where k will be set by the method as well). Once we have formulated $x, y, C$ as random variables, we can use tools from information theory to express a clustering objective. In particular, the information bottleneck objective is

$$
\min_{p(C | x)} I(x; C) - \beta I(C; y),
$$

where $I(\cdot; \cdot)$ is the mutual information between two random variables,<sup>1</sup> $\beta$ is a parameter, and the minimization is over all possible probabilistic assignments of points to clusters. Intuitively, we would like to achieve two contradictory goals. On one hand, we would like the mutual information between the identity of the document and the identity of the cluster to be as small as possible. This reflects the fact that we would like a strong compression of the original data. On the other hand, we would like high mutual information between the clustering variable and the identity of the words, which reflects the goal that the “relevant” information about the document (as reflected by the words that appear in the document) is retained. This generalizes the classical notion of minimal sufficient statistics<sup>2</sup> used in parametric statistics to arbitrary distributions.

Solving the optimization problem associated with the information bottleneck principle is hard in the general case. Some of the proposed methods are similar to the EM principle, which we will discuss in Chapter 24.

## 22.5 A High Level View of Clustering

So far, we have mainly listed various useful clustering tools. However, some fundamental questions remain unaddressed. First and foremost, what is clustering? What is it that distinguishes a clustering algorithm from any arbitrary function that takes an input space and outputs a partition of that space? Are there any basic properties of clustering that are independent of any specific algorithm or task?

One method for addressing such questions is via an axiomatic approach. There have been several attempts to provide an axiomatic definition of clustering. Let us demonstrate this approach by presenting the attempt made by Kleinberg (2003).

Consider a clustering function, F , that takes as input any finite domain X with a dissimilarity function d over its pairs and returns a partition of X .

Consider the following three properties of such a function:

Scale Invariance (SI) For any domain set X , dissimilarity function $d,$ and any $\alpha > 0.$ , the following should hold: $F(\mathcal{X}, d) \ = \F(\mathcal{X}, \alpha d)$ (where $(\alpha d)(x, y) \stackrel{\mathrm{def}}{=} \alpha d(x, y))$

Richness (Ri) For any finite X and every partition $C =(C_{1}, \ldots C_{k})$ of X (into nonempty subsets) there exists some dissimilarity function d over $\mathcal{X}$ such that $F(\mathcal{X}, d) = C$

$\begin{array}{r}{I(x; C) = \sum_{a} \sum_{b} p(a, b) \log \left(\frac{p(a, b)}{p(a) p(b)} \right)} \end{array}$ , where the sum is over all values x can take and all values C can take.

Consistency (Co) If d and $d^{\prime}$ are dissimilarity functions over $x,$ , such that for every $x, y \in{\mathcal{X}}$ , if $x, y$ belong to the same cluster in $F(\mathcal{X}, d)$ then $d^{\prime}(x, y) \leq d(x, y)$ and if $x, y$ belong to different clusters in $F(\mathcal{X}, d)$ then $d^{\prime}(x, y) \geq d(x, y)$ , then $F({\mathcal{X}}, d) = F({\mathcal{X}}, d^{\prime})$

A moment of reflection reveals that the Scale Invariance is a very natural requirement – it would be odd to have the result of a clustering function depend on the units used to measure between-point distances. The Richness requirement basically states that the outcome of the clustering function is fully controlled by the function $d,$ which is also a very intuitive feature. The third requirement, Consistency, is the only requirement that refers to the basic (informal) definition of clustering – we wish that similar points will be clustered together and that dissimilar points will be separated to different clusters, and therefore, if points that already share a cluster become more similar, and points that are already separated become even less similar to each other, the clustering function should have even stronger “support” of its previous clustering decisions.

However, Kleinberg (2003) has shown the following “impossibility” result:

<sup>theorem</sup> 22.4 There exists no function, F , that satisfies all the three properties: Scale Invariance, Richness, and Consistency.

Proof Assume, by way of contradiction, that some F does satisfy all three properties. Pick some domain set X with at least three points. By Richness, there must be some $d_{1}$ such that $F(\mathcal{X}, d_{1}) = \{\{x\} : x \in \mathcal{X}\}$ and there also exists some $d_{2}$ such that $F({\mathcal{X}}, d_{2}) \neq F({\mathcal{X}}, d_{1})$

Let $\alpha \in \mathbb{R}_{+}$ be such that for every $x, y \in{\mathcal{X}}$ , αd<sub>2</sub> $(x, y) \ge d_{1}(x, y)$ . Let $d_{3} =$ $\alpha d_{2}$ . Consider $F(\mathcal{X}, d_{3})$ . By the Scale Invariance property of $F,$ we should have $F(\mathcal{X}, d_{3}) = F(\mathcal{X}, d_{2})$ . On the other hand, since all distinct $x, y \in{\mathcal{X}}$ reside in different clusters w.r.t. $F(\mathcal{X}, d_{1})$ , and $d_{3}(x, y) \geq d_{1}(x, y)$ , the Consistency of $F$ implies that $F(\mathcal{X}, d_{3}) = F(\mathcal{X}, d_{1})$ . This is a contradiction, since we chose $d_{1}, d_{2}$ so that $F({\mathcal{X}}, d_{2}) \neq F({\mathcal{X}}, d_{1})$ □

It is important to note that there is no single “bad property” among the three properties. For every pair of the the three axioms, there exist natural clustering functions that satisfy the two properties in that pair (one can even construct such examples just by varying the stopping criteria for the Single Linkage clustering function). On the other hand, Kleinberg shows that any clustering algorithm that minimizes any center-based objective function inevitably fails the consistency property (yet, the k-sum-of-in-cluster-distances minimization clustering does satisfy Consistency).

The Kleinberg impossibility result can be easily circumvented by varying the properties. For example, if one wishes to discuss clustering functions that have a fixed number-of-clusters parameter, then it is natural to replace Richness by k-Richness (namely, the requirement that every partition of the domain into k subsets is attainable by the clustering function). k-Richness, Scale Invariance and Consistency all hold for the k-means clustering and are therefore consistent.

Alternatively, one can relax the Consistency property. For example, say that two clusterings $C =(C_{1}, \ldots C_{k})$ and $C^{\prime} =(C_{1}^{\prime}, \ldots C_{l}^{\prime})$ are compatible if for every clusters $C_{i} \in C$ and $C_{j}^{\prime} \in C^{\prime}$ , either $C_{i} \subseteq C_{j}^{\prime}$ or $C_{j}^{\prime} \subseteq C_{i}$ or $C_{i} \cap C_{j}^{\prime} = \varnothing$ (it is worthwhile noting that for every dendrogram, every two clusterings that are obtained by trimming that dendrogram are compatible). “Refinement Consistency” is the requirement that, under the assumptions of the Consistency property, the new clustering $F(\mathcal{X}, d^{\prime})$ is compatible with the old clustering $F(\mathcal{X}, d)$ . Many common clustering functions satisfy this requirement as well as Scale Invariance and Richness. Furthermore, one can come up with many other, different, properties of clustering functions that sound intuitive and desirable and are satisfied by some common clustering functions.

There are many ways to interpret these results. We suggest to view it as indicating that there is no “ideal” clustering function. Every clustering function will inevitably have some “undesirable” properties. The choice of a clustering function for any given task must therefore take into account the specific properties of that task. There is no generic clustering solution, just as there is no classification algorithm that will learn every learnable task (as the No-Free-Lunch theorem shows). Clustering, just like classification prediction, must take into account some prior knowledge about the specific task at hand.

## 22.6 Summary

Clustering is an unsupervised learning problem, in which we wish to partition a set of points into “meaningful” subsets. We presented several clustering approaches including linkage-based algorithms, the k-means family, spectral clustering, and the information bottleneck. We discussed the dificulty of formalizing the intuitive meaning of clustering.

## 22.7 Bibliographic Remarks

The k-means algorithm is sometimes named Lloyd’s algorithm, after Stuart Lloyd, who proposed the method in 1957. For a more complete overview of spectral clustering we refer the reader to the excellent tutorial by Von Luxburg (2007). The information bottleneck method was introduced by Tishby, Pereira & Bialek (1999). For an additional discussion on the axiomatic approach see Ackerman & Ben-David (2008).

## 22.8 Exercises

1. Suboptimality of k-Means: For every parameter $t > 1$ , show that there exists an instance of the k-means problem for which the k-means algorithm (might) find a solution whose k-means objective is at least $t \cdot \mathrm{OPT}$ , where OPT is the minimum k-means objective.

2. k-Means Might Not Necessarily Converge to a Local Minimum: Show that the k-means algorithm might converge to a point which is not a local minimum. Hint: Suppose that $k \ = \2$ and the sample points are $\{1, 2, 3, 4\} \subset \mathbb{R}$ suppose we initialize the k-means with the centers $\{2, 4\}$ ; and suppose we break ties in the definition of $C_{i}$ by assigning i to be the smallest value in argmin $_j \parallel \mathbf x - \pmb{\mu}_{j} \parallel$

3. Given a metric space $(\mathcal{X}, d)$ , where $|{\mathcal{X}} | < \infty.$ , and $k \in \mathbb N$ , we would like to find a partition of X into $C_{1}, \ldots, C_{k}$ which minimizes the expression

$$
G_{\mathrm{k-diam}}((\mathcal{X}, d),(C_{1}, \ldots, C_{k})) = \max_{j \in[d]} \operatorname{diam}(C_{j}),
$$

where diam $\begin{array}{r}{(C_{j}) = \operatorname{max}_{x, x^{\prime} \in C_{j}} d(x, x^{\prime})} \end{array}$ (we use the convention diam $(C_{j}) = 0$ if $| C_{j} | < 2)$

Similarly to the k-means objective, it is NP-hard to minimize the kdiam objective. Fortunately, we have a very simple approximation algorithm: Initially, we pick some $x \in \mathcal{X}$ and set $\mu_{1} = x$ . Then, the algorithm iteratively sets

$$
\forall j \in \{2, \ldots, k\}, \mu_{j} = \underset{x \in X}{\operatorname{argmax}} \min_{i \in[j - 1]} d(x, \mu_{i}).
$$

Finally, we set

$$
\forall i \in[k], C_{i} = \{x \in X: i = \underset{j \in[k]}{\operatorname{argmin}} d(x, \mu_{j})\}.
$$

Prove that the algorithm described is a 2-approximation algorithm. That is, if we denote its output by $\hat{C}_{1}, \ldots, \hat{C}_{k}$ , and denote the optimal solution by $C_{1}^{*}, \ldots, C_{k}^{*}$ , then,

$$
G_{\mathrm{k-diam}}((\mathcal{X}, d),(\hat{C}_{1}, \ldots, \hat{C}_{k})) \leq 2 \cdot G_{\mathrm{k-diam}}((\mathcal{X}, d),(C_{1}^{*}, \ldots, C_{k}^{*})).
$$

Hint: Consider the point $\mu_{k + 1}$ (in other words, the next center we would have chosen, if we wanted $k + 1$ clusters). Let $r ={\mathrm{min}}_{j \in[k]} d(\mu_{j}, \mu_{k + 1})$ . Prove the following inequalities

$$
\begin{array}{l} G_{\mathrm{k-diam}}((\mathcal{X}, d),(\hat{C}_{1}, \ldots, \hat{C}_{k})) \leq 2r \\ G_{\mathrm{k-diam}}((X, d),(C_{1}^{*}, \ldots, C_{k}^{*})) \geq r.\end{array}
$$

4. Recall that a clustering function, $F,$ is called Center-Based Clustering if, for some monotonic function $f : \mathbb{R}_{+} \to \mathbb{R}_{+}$ , on every given input $(\mathcal{X}, d), F(\mathcal{X}, d)$ is a clustering that minimizes the objective

$$
G_{f}((\mathcal{X}, d),(C_{1}, \dots C_{k})) = \min_{\mu_{1}, \dots \mu_{k} \in \mathcal{X}^{\prime}} \sum_{i = 1}^{k} \sum_{x \in C_{i}} f(d(x, \mu_{i})),
$$

where $\mathcal{X}^{\prime}$ is either X or some superset of $\mathcal{X}.$ .

Prove that for every $k > 1$ the k-diam clustering function defined in the previous exercise is not a center-based clustering function.

Hint: Given a clustering input $(\mathcal{X}, d)$ , with $| \mathcal{X} | > 2,$ consider the efect of adding many close-by points to some (but not all) of the members of $\mathcal{X}.$ , on either the k-diam clustering or any given center-based clustering.

5. Recall that we discussed three clustering “properties”: Scale Invariance, Richness, and Consistency. Consider the Single Linkage clustering algorithm.

1. Find which of the three properties is satisfied by Single Linkage with the Fixed Number of Clusters (any fixed nonzero number) stopping rule.

2. Find which of the three properties is satisfied by Single Linkage with the Distance Upper Bound (any fixed nonzero upper bound) stopping rule.

3. Show that for any pair of these properties there exists a stopping criterion for Single Linkage clustering, under which these two axioms are satisfied.

6. Given some number k, let k-Richness be the following requirement: For any finite X and every partition $C =(C_{1}, \ldots C_{k})$ of X (into nonempty subsets) there exists some dissimilarity function d over X such that $F(\mathcal{X}, d) = C$

Prove that, for every number k, there exists a clustering function that satisfies the three properties: Scale Invariance, k-Richness, and Consistency.

Dimensionality reduction is the process of taking data in a high dimensional space and mapping it into a new space whose dimensionality is much smaller. This process is closely related to the concept of (lossy) compression in information theory. There are several reasons to reduce the dimensionality of the data. First, high dimensional data impose computational challenges. Moreover, in some situations high dimensionality might lead to poor generalization abilities of the learning algorithm (for example, in Nearest Neighbor classifiers the sample complexity increases exponentially with the dimension—see Chapter 19). Finally, dimensionality reduction can be used for interpretability of the data, for finding meaningful structure of the data, and for illustration purposes.

In this chapter we describe popular methods for dimensionality reduction. In those methods, the reduction is performed by applying a linear transformation to the original data. That is, if the original data is in $\mathbb{R}^{d}$ and we want to embed it into $\mathbb{R}^{n} \(n < d)$ then we would like to find a matrix $W \in \mathbb{R}^{n, d}$ that induces the mapping $\mathbf{x} \mapsto W \mathbf{x}.$ . A natural criterion for choosing W is in a way that will enable a reasonable recovery of the original x. It is not hard to show that in general, exact recovery of x from W x is impossible (see Exercise 1).

The first method we describe is called Principal Component Analysis (PCA). In $\mathrm{PCA}$ , both the compression and the recovery are performed by linear transformations and the method finds the linear transformations for which the diferences between the recovered vectors and the original vectors are minimal in the least squared sense.

Next, we describe dimensionality reduction using random matrices W . We derive an important lemma, often called the “Johnson-Lindenstrauss lemma,” which analyzes the distortion caused by such a random dimensionality reduction technique.

Last, we show how one can reduce the dimension of all sparse vectors using again a random matrix. This process is known as Compressed Sensing. In this case, the recovery process is nonlinear but can still be implemented eficiently using linear programming.

We conclude by underscoring the underlying “prior assumptions” behind PCA and compressed sensing, which can help us understand the merits and pitfalls of the two methods.


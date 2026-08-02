---
title: "Chapter 13 \u2014 Graph Neural Networks"
book: "Deep Learning: Foundations and Concepts"
book_slug: deep-learning-foundations-concepts
course: deep-learning
chapter_number: 13
citekey: bishop2023deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-foundations-concepts/reading.md"
source_line_start: 10347
source_line_end: 10849
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 8
source_empty_image_alt: 8
non_semantic_image_alt: 6
caption_derived_image_alt: 2
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
  - deep-learning
  - official-syllabus
---

# Chapter 13 — Graph Neural Networks

> [[../README|本书目录]] · [[12-chapter-12-transformers|上一章]] · [[14-chapter-14-sampling|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning: Foundations and Concepts（bishop2023deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-foundations-concepts/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-foundations-concepts/reading.md)，源行 10347–10849。
> - 本章保留 8 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 13.1. Machine Learning on Graphs

There are many kinds of applications that we might wish to address using graphstructured data, and we can group these broadly according to whether the goal is to predict properties of nodes, of edges, or of the whole graph. An example of node prediction would be to classify documents according to their topic based on the hyperlinks and citations between the documents.

Regarding edges we might, for example, know some of the interactions in a protein network and would like to predict the presence of any additional ones. Such tasks are called edge prediction or graph completion tasks. There are also tasks where the edges are known in advance and the goal is to discover clusters or ‘communities’ within the graph.

Finally, we may wish to predict properties that relate to the graph as a whole. For example, we might wish to predict whether a particular molecule is soluble in water. Here instead of being given a single graph we will have a data set of different graphs, which we can view as being drawn from some common distribution, in other words we assume that the graphs themselves are independent and identically distributed. Such tasks can be considered as graph regression or graph classification tasks.

For the molecule solubility classification example, we might be given a labelled training set of molecules, along with a test set of new molecules whose solubility needs to be predicted. This is a standard example of an inductive task of the kind we have seen many times in previous chapters. However, some graph prediction examples are transductive in which we are given the structure of the entire graph along with labels for some of the nodes and the goal is to predict the labels of the remaining nodes. An example would be a large social network in which our goal is to classify each node as either a real person or an automated bot. Here a small number of nodes might be manually labelled, but it would be prohibitive to investigate every node individually in a large and ever-changing social network. During training, we therefore have access to the whole graph along with labels for a subset of the nodes, and we wish to predict the labels for the remaining nodes. This can be viewed as a form of semi-supervised learning.

As well as solving prediction tasks directly, we can also use deep learning on graphs to discover useful internal representations that can subsequently facilitate a range of downstream tasks. This is known as graph representation learning. For example we could seek to build a foundation model for molecules by training a deep learning system on a large corpus of molecular structures. The goal is that once trained, such a foundation model can be fine-tuned to specific tasks by using a small, labelled data set.

Graph neural networks define an embedding vector for each of the nodes, usually initialized with the observed node properties, which are then transformed through a series of learnable layers to create a learned representation. This is analogous to the way word embeddings, or tokens, are processed through a series of layers in the transformer to give a representation that better captures the meaning of the words in the context of the rest of the text. Graph neural networks can also use learned embeddings associated with the edges and with the graph as a whole.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/2e1ecdc91b041c0700c43d6dcc8ed5470d8c554b5897eb2978971b0c608881b8.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/4c5658eaadc3680503069b8fc190737c29c35c7f0daaa2b46a3038aada697a96.jpg)

![Figure 13.2](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/12c66a8127b9eb5963437eef0a024af9fc9e62509339a9a95077243055198f5d.jpg)  
Figure 13.2 An example of an adjacency matrix showing (a) an example of a graph with five nodes, (b) the associated adjacency matrix for a particular choice of node order, and (c) the adjacency matrix corresponding to a different choice for the node order.

## 13.1.1 Graph properties

In this chapter we will focus on simple graphs where there is at most one edge between any pair of nodes, where the edges are undirected, and where there are no self-edges that connect a node to itself. This suffices to introduce the key concepts of graph neural networks, and it also encompasses a wide range of practical applications. These concepts can then be applied to more complex graphical structures.

We begin by introducing some notation associated with graphs and by defining some important properties. A graph $\mathcal{G} =(\nu, \mathcal{E})$ consists of a set of nodes or vertices, denoted by , along with a set of edges or links, denoted by . We index the nodes by $n = 1, \ldots N$ , and we write the edge from node n to node m as $(n, m)$ . If two nodes are linked by an edge they are called neighbours, and the set of all neighbours of node n is denoted by $\mathcal{N}(n)$

In addition to the graph structure, we usually also have observed data associated with the nodes. For each node n we can represent the corresponding node variables as a D-dimensional column vector ${\bf x}_{n}$ and we can group these into a data matrix X of dimensionality $N \times D$ in which row n is given by $\mathbf{x}_{n}^{\mathrm{{T}}}$ . There may also be data variables associated with the edges in the graph, although to start with we will focus just on node variables.

## 13.1.2 Adjacency matrix

A convenient way to specify the edges in a graph is to use an adjacency matrix denoted by A. To define the adjacency matrix we first have to choose an ordering for the nodes. If there are N nodes in the graph, we can index them using $n = 1, \ldots, N$ The adjacency matrix has dimensions $N \times N$ and contains a 1 in every location n, m for which there is an edge going from node n to node m, with all other entries being 0. For graphs with undirected edges, the adjacency matrix will be symmetric since the presence of an edge from node n to node m implies that there is also an edge from node m to node n, and therefore $A_{mn} = A_{nm}$ for all n and m. An example of an adjacency matrix is shown in Figure 13.2.

Since the adjacency matrix defines the structure of a graph, we could consider using it directly as the input to a neural network. To do this we could ‘flatten’ the matrix, for example by concatenating the columns into one long column vector. However, a major problem with this approach is that the adjacency matrix depends on the arbitrary choice of node ordering, as seen in Figure 13.2. Suppose for instance that we want to predict the solubility of a molecule. This clearly should not depend on the ordering assigned to the nodes when writing down an adjacency matrix. Because the number of permutations increases factorially with the number of nodes, it is impractical to try to learn permutation invariance by using large data sets or by data augmentation. Instead, we should treat this invariance property as an inductive bias when constructing a network architecture.

## 13.1.3 Permutation equivariance

We can express node label permutation mathematically by introducing the concept of a permutation matrix P, which has the same size as the adjacency matrix and which specifies a particular permutation of a node ordering. It contains a single 1 in each row and a single 1 in each column, with 0 in all the other elements, such that a 1 in position n, m indicates that node n will be relabelled as node m after the permutation. Consider, for example, the permutation from $( A , B , C , D , E ) $ $(C, \bar{E}, A, D, B)$ corresponding to the two choices of node ordering in Figure 13.2. The corresponding permutation matrix takes the form

$$
\begin{array}{r}{\mathbb{P} = \left(\begin{array}{lllll}{0} &{0} &{1} &{0} &{0} \\{0} &{0} &{0} &{0} &{1} \\{1} &{0} &{0} &{0} &{0} \\{0} &{0} &{0} &{1} &{0} \\{0} &{1} &{0} &{0} &{0} \end{array} \right).} \end{array}\tag{13.1}
$$

We can define the permutation matrix more formally as follows. First we introduce the standard unit vector $\mathbf{u}_{n}$ , for $n = 1, \ldots, N$ . This is a column vector in which all elements are 0 except element n, which equals 1. In this notation the identity matrix is given by

$$
\begin{array}{r}{{\bf I} = \left(\begin{array}{l}{{\bf u}_{1}^{\mathrm{T}}} \\{{\bf u}_{2}^{\mathrm{T}}} \\{\dots} \\{{\bf u}_{N}^{\mathrm{T}}} \end{array} \right).} \end{array}\tag{13.2}
$$

We can now introduce a permutation function $\pi(\cdot)$ that maps n to $m = \pi(n)$ . The associated permutation matrix is given by

$$
\mathbb{P} = \left(\begin{array}{c}{\mathbf{u}_{\pi(1)}^{\mathrm{T}}} \\{\mathbf{u}_{\pi(2)}^{\mathrm{T}}} \\{\ldots} \\{\mathbf{u}_{\pi(N)}^{\mathrm{T}}} \end{array} \right).\tag{13.3}
$$

When we reorder the labelling on the nodes of a graph, the effect on the corresponding node data matrix X is to permute the rows according to $\pi(\cdot)$ , which can be achieved by pre-multiplication by $\mathbb{P}$ to give

$$
\widetilde{\mathbf{X}} = \mathbb{P} \mathbf{X}.\tag{13.4}
$$

For the adjacency matrix, both the rows and the columns become permuted. Again the rows can be permuted using pre-multiplication by $\mathbb{P}$ whereas the columns are permuted using post-multiplication by $\mathbb{P}^{\mathrm{T}}$ , giving a new adjacency matrix:

$$
\widetilde{\mathbf{A}} = \mathbb{P} \mathbf{A} \mathbb{P}^{\mathrm{T}}.\tag{13.5}
$$

When applying deep learning to graph-structured data, we will need to represent the graph structure in numerical form so that it can be fed into a neural network, which requires that we assign an ordering to the nodes. However, the specific ordering we choose is arbitrary and so it will be important to ensure that any global property of the graph does not depend on this ordering. In other words, the network predictions must be invariant to node label reordering, so that

$$
y(\widetilde{\mathbf{X}}, \widetilde{\mathbf{A}}) = y(\mathbf{X}, \mathbf{A}) \qquad \mathsf{lnvariance}\tag{13.6}
$$

where $y(\cdot, \cdot)$ is the output of the network.

We may also want to make predictions that relate to individual nodes. In this case, if we reorder the node labelling then the corresponding predictions should show the same reordering so that a given prediction is always associated with the same node irrespective of the choice of order. In other words, node predictions should be equivariant with respect to node label reordering. This can be expressed as

$$
\mathbf{y}(\widetilde{\mathbf{X}}, \widetilde{\mathbf{A}}) = \mathbb{P} \mathbf{y}(\mathbf{X}, \mathbf{A})
$$

$$
\mathsf{Equivariance}\tag{13.7}
$$

where $\mathbf{y}(\cdot, \cdot)$ is a vector of network outputs, with one element per node.

## 13.2. Neural Message-Passing

Ensuring invariance or equivariance under node label permutations is a key design consideration when we apply deep neural networks to graph-structured data. Another consideration is that we want to exploit the representational capabilities of deep neural networks and so we retain the concept of a ‘layer’ as a computational transformation that can be applied repeatedly. If each layer of the network is equivariant under node reordering then multiple layers applied in succession will also exhibit equivariance, while allowing each layer of the network to be informed by the graph structure.

For networks whose outputs represent node-level predictions, the whole network will be equivariant as required. If the network is being used to predict a graphlevel property then a final layer can be included that is invariant to permutations of its inputs. We also want to ensure that each layer is a highly flexible nonlinear function and is differentiable with respect to its parameters so that it can be trained by stochastic gradient descent using gradients obtained by automatic differentiation.

Graphs come in various sizes. For example different molecules can have different numbers of atoms, so a fixed-length representation as used for standard neural networks is unsuitable. A further requirement is therefore that the network should be able to handle variable-length inputs, as we saw with transformer networks. Some graphs can be very large, for example a social network with many millions of participants, and so we also want to construct models that scale well. Not surprisingly, parameter sharing will play an important role, both to allow the invariance and equivariance properties to be built into the network architecture but also to facilitate scaling to large graphs.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/9a73cc6d469672586c0262c74cc39ff96bb9f6fa2adbc14027bc727f74966cfe.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/b434f2fddb48f9993ae704210c9a04b97e6c4d850daf8701a111909dacb5f59d.jpg)  
(b)  
Figure 13.3 A convolutional filter for images can be represented as a graph-structured computation. (a) A filter computed by node i in layer l + 1 of a deep convolutional network is a function of the activation values in layer l over a local patch of pixels. (b) The same computation structure expressed as a graph showing ‘messages flowing into node i from its neighbours.

## 13.2.1 Convolutional filters

To develop a framework that meets all of these requirements, we can seek inspiration from image processing using convolutional neural networks. First note that an image can be viewed as a specific instance of graph-structured data, in which the nodes are the pixels and the edges represent pairs of pixels that are adjacent in the image, where adjacency includes nodes that are diagonally adjacent as well as those that are horizontally or vertically adjacent.

In a convolutional network, we make successive transformations of the image domain such that a pixel at a particular layer computes a function of states of pixels in the previous layer through a local function called a filter. Consider a convolutional layer using 3 3 filters, as illustrated in Figure 13.3(a). The computation performed by a single filter at a single pixel in layer $l + 1$ can be expressed as

$$
z_{i}^{(l + 1)} = f \left(\sum_{j} w_{j} z_{j}^{(l)} + b \right)\tag{13.8}
$$

where $f(\cdot)$ is a differentiable nonlinear activation function such as ReLU, and the sum over j is taken over all nine pixels in a small patch in layer l. The same function is applied across multiple patches in the image, so that the weights $w_{j}$ and bias $b$ are shared across the patches (and therefore do not carry the index i).

As it stands, (13.8) is not equivariant under reordering of the nodes in layer l because the weight vector, with elements $w_{j}$ , is not invariant under permutation of its elements. However, we can achieve equivariance with some simple modifications as follows. We first view the filter as a graph, as shown in Figure 13.3(b), and separate out the contribution from node i. The other eight 8 nodes are its neighbours $\mathcal{N}(i)$ We then assume that a single weight parameter $w_{\mathrm{neigh}}$ is shared across the neighbours so that

$$
z_{i}^{(l + 1)} = f \left(w_{\mathrm{neigh}} \sum_{j \in \mathcal{N}(i)} z_{j}^{(l)} + w_{\mathrm{self}} z_{i}^{(l)} + b \right)\tag{13.9}
$$

where node i has its own weight parameter $w_{\mathrm{self}}$

We can interpret (13.9) as updating a local representation $z_{i}$ at node i by gathering information from the neighbouring nodes by passing messages from the neighbouring nodes into node i. In this case the messages are simply the activations of the other nodes. These messages are then combined with information from node $i,$ and the result is transformed using a nonlinear function. The information from the neighbouring nodes is aggregated through a simple summation in (13.9), and this is clearly invariant to any permutation of the labels associated with those nodes. Furthermore, the operation (13.9) is applied synchronously to every node in a graph, and so if the nodes are permuted then the resulting computations will be unchanged but their ordering will be likewise permuted, and hence, this calculation is equivariant under node reordering. Note that this depends on the parameters $w_{\mathrm{neigh}}, w_{\mathrm{self}}$ , and $b$ being shared across all nodes.

## 13.2.2 Graph convolutional networks

We now use the convolution example as a template to construct deep neural networks for graph-structured data. Our goal is to define a flexible, nonlinear transformation of the node embeddings that is differentiable with respect to a set of weight and bias parameters and which maps the variables in layer l into corresponding variables in layer $l + 1$ . For each node n in the graph and for each layer l in the network, we introduce a D-dimensional column vector $\mathbf{h}_{n}^{(l)}$ of node-embedding variables, where $n = 1, \ldots, N$ and $l = 1, \ldots, L$

We see that the transformation given by (13.9) first gathers and combines information from neighbouring nodes and then updates the node as a function of the current embedding of the node and the incoming messages. We can therefore view each layer of processing as having two successive stages. The first is the aggregation stage in which, for each node n, messages are passed to that node from its neighbours and combined to form a new vector $\mathbf{z}_{n}^{(l)}$ in a way that is permutation invariant. This is followed by an update step in which the aggregated information from neighbouring nodes is combined with local information from the node itself and used to calculate a revised embedding vector for that node.

Algorithm 13.1: Simple message-passing neural network   
Input: Undirected graph $\mathcal{G} =(\nu, \mathcal{E})$   
Initial node embeddings $\{\mathbf{h}_{n}^{(0)} = \mathbf{x}_{n}\}$   
Aggregate( ) function   
Update( , ) function   
Output: Final node embeddings $\{\mathbf{h}_{n}^{(L)}\}$   
// Iterative message-passing   
for $l \in \{0, \ldots, L - 1\}$ do   
$\mathbf{z}_{n}^{(l)} \gets \mathrm{A}$ ggregate $\left(\left\{\mathbf{h}_{m}^{(l)} : m \in \mathcal{N}(n) \right\} \right)$   
h<sup>(l+1)</sup><sub>n ←</sub> Update $\left(\mathbf{h}_{n}^{(l)}, \mathbf{z}_{n}^{(l)} \right)$   
end for   
return $\{\mathbf{h}_{n}^{(L)}\}$

Consider a specific node n in the graph. We first aggregate the node vectors from all the neighbours of node n:

$$
\mathbf{z}_{n}^{(l)} = \mathrm{Aggregate} \left(\left\{\mathbf{h}_{m}^{(l)} : m \in \mathcal{N}(n) \right\} \right).\tag{13.10}
$$

The form of this aggregation function is very flexible if it is well defined for a variable number of neighbouring nodes and does not depend on the ordering of those nodes. It can potentially contain learnable parameters as long as it is a differentiable function with respect to those parameters to facilitate gradient descent training.

We then use another operation to update the embedding vector at node n:

$$
\mathbf{h}_{n}^{(l + 1)} = \mathrm{Update} \left(\mathbf{h}_{n}^{(l)}, \mathbf{z}_{n}^{(l)} \right).\tag{13.11}
$$

Again, this can be a differentiable function of a set of learnable parameters. Application of the Aggregate operation followed by the Update operation in parallel for every node in the graph represents one layer of the network. The node embeddings are typically initialized using observed node data so that $\mathbf{h}_{n}^{(0)} = \mathbf{x}_{n}$ . Note that each layer generally has its own independent parameters, although the parameters can also be shared across layers. This framework is called a message-passing neural network (Gilmer et al., 2017) and is summarized in Algorithm 13.1.

## 13.2.3 Aggregation operators

There are many possible forms for the Aggregate function, but it must depend only on the set of inputs and not on their ordering. It must also be a differentiable function of any learnable parameters. The simplest such aggregation function, following from (13.9), is summation:

$$
\mathrm{Aggregate} \left(\left\{\mathbf{h}_{m}^{(l)} : m \in \mathcal{N}(n) \right\} \right) = \sum_{m \in \mathcal{N}(n)} \mathbf{h}_{m}^{(l)}.\tag{13.12}
$$

A simple summation is clearly independent of the ordering of the neighbouring nodes and is also well defined no matter how many nodes are in the neighbourhood set. Note that this has no learnable parameters.

A summation gives a stronger influence over nodes that have many neighbours compared to those with few neighbours, and this can lead to numerical issues, particularly in applications such as social networks where the size of the neighbourhood set can vary by several orders of magnitude. A variation of this approach is to define the Aggregation operation to be the average of the neighbouring embedding vectors so that

$$
\mathrm{Aggregate} \left(\left\{\mathbf{h}_{m}^{(l)} : m \in \mathcal{N}(n) \right\} \right) = \frac{1}{| \mathcal{N}(n) |} \sum_{m \in \mathcal{N}(n)} \mathbf{h}_{m}^{(l)}\tag{13.13}
$$

where $| \mathcal{N}(n) |$ denotes the number of nodes in the neighbourhood set $\mathcal{N}(n)$ . However, this normalization also discards information about the network structure and is provably less powerful than a simple summation (Hamilton, 2020), and so the choice of whether to use it depends on the relative importance of node features compared to graph structure.

Another variation of this approach (Kipf and Welling, 2016) takes account of the number of neighbours for each of the neighbouring nodes:

$$
\mathrm{Aggregate} \left(\left\{\mathbf{h}_{m}^{(l)} : m \in \mathcal{N}(n) \right\} \right) = \sum_{m \in \mathcal{N}(n)} \frac{\mathbf{h}_{m}^{(l)}}{\sqrt{| \mathcal{N}(n) | | \mathcal{N}(m) |}}.\tag{13.14}
$$

Yet another possibility is to take the element-wise maximum (or minimum) of the neighbouring embedding vectors, which also satisfies the desired properties of being well defined for a variable number of neighbours and of being independent of their order.

Since each node in a given layer of the network is updated by aggregating information from its neighbours in the previous layer, this defines a receptive field analogous to the receptive fields of filters used in CNNs. As information is processed through successive layers, the updates to a given node depend on a steadily increasing fraction of other nodes in earlier layers until the effective receptive field potentially spans the whole graph as illustrated in Figure 13.4. However, large, sparse graphs may require an excessive number of layers before each output is influenced by every input. Some architectures therefore introduce an additional ‘super-node that connects directly to every node in the original graph to ensure fast propagation of information.

Figure 13.4 Schematic illustration of information flow through successive layers of a graph neural network. In the third layer a single node is highlighted in red. It receives information from its two neighbours in the previous layer and those in turn receive information from their neighbours in the first layer. As with convolutional neural networks for images, we see that the effective receptive field, corresponding to the number of nodes shown in red, grows with the number of processing layers.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/51feccc979a94a71eaa526dbb193bb53a5716871ab78abe35ef58e9a917347c4.jpg)

The aggregation operators discussed so far have no learnable parameters. We can introduce such parameters if we first transform each of the embedding vectors from neighbouring nodes using a multilayer neural network, denoted by ${\mathrm{MLP}}_{\phi},$ before combining their outputs, where MLP denotes ‘multilayer perceptron’ and φ represents the parameters of the network. So long as the network has a structure and parameter values that are shared across nodes then this aggregation operator again be permutation invariant. We can also transform the combined vector with another neural network ${\mathrm{MLP}}_{\theta}$ , with parameters θ, to give an overall aggregation operator:

$$
\mathrm{Aggregate} \left(\left\{\mathbf{h}_{m}^{(l)} : m \in \mathcal{N}(n) \right\} \right) = \mathrm{MLP}_{\theta} \left(\sum_{m \in \mathcal{N}(n)} \mathrm{MLP}_{\phi}(\mathbf{h}_{m}^{(l)}) \right)\tag{13.15}
$$

in which $\mathrm{MLP}_{\phi}$ and ${\mathrm{MLP}}_{\theta}$ are shared across layer l. Due to the flexibility of MLPs, the transformation defined by (13.15) represents a universal approximator for any permutation-invariant function that maps a set of embeddings to a single embedding (Zaheer et al., 2017). Note that the summation can be replaced by other invariant functions such as averages or an element-wise maximum or minimum.

A special case of graph neural networks arises if we consider a graph having no edges, which corresponds simply to an unstructured set of nodes. In this case if we use (13.15) for each vector $\mathbf{h}_{n}^{(\hat{l})}$ in the set, in which the summation is taken over all other vectors except $\mathbf{h}_{n}^{(l)}$ , then we have a general framework for learning functions over unstructured sets of variables known as deep sets.

## 13.2.4 Update operators

Having chosen a suitable Aggregate operator, we similarly need to decide on the form of the Update operator. By analogy with (13.9) for the CNN, a simple form for this operator would be

$$
\mathrm{Update} \left(\mathbf{h}_{n}^{(l)}, \mathbf{z}_{n}^{(l)} \right) = f \left(\mathbf{W}_{\mathrm{self}} \mathbf{h}_{n}^{(l)} + \mathbf{W}_{\mathrm{neigh}} \mathbf{z}_{n}^{(l)} + \mathbf{b} \right)\tag{13.16}
$$

where $f(\cdot)$ is a nonlinear activation function such as ReLU applied element-wise to its vector argument, and where $\mathbf{W}_{\mathrm{self}}, \mathbf{W}_{\mathrm{neigh}}$ , and b are the learnable weights and biases and $\mathbf{z}_{n}^{(l)}$ is defined by the Aggregate operator (13.10).

If we choose a simple summation (13.12) as the aggregation function and if we also share the same weight matrix between nodes and their neighbours so that $\mathbf{W}_{\mathrm{self}} = \mathbf{W}_{\mathrm{neigh}}$ , we obtain a particularly simple form of Update operator given by

$$
\mathbf h_{n}^{(l + 1)} = \mathrm{Update} \left(\mathbf h_{n}^{(l)}, \mathbf z_{n}^{(l)} \right) = f \left(\mathbf W_{\mathrm{neigh}} \sum_{m \in \mathcal N(n), n} \mathbf h_{m}^{(l)} + \mathbf b \right).\tag{13.17}
$$

The message-passing algorithm is typically initialized by setting $\mathbf{h}_{n}^{(0)} = \mathbf{x}_{n}$ Sometimes, however, we may want to have an internal representation vector for each node that has a higher, or lower, dimensionality than that of ${\bf x}_{n}$ . Such a representation can be initialized by padding the node vectors ${\bf x}_{n}$ with additional zeros (to achieve a higher dimensionality) or simply by transforming the node vectors using a learnable linear transformation to a space of the desired number of dimensions. An alternative form of initialization, particularly when there are no data variables associated with the nodes, is to use a one-hot vector that labels the degree of each node (i.e., the number of neighbours).

Overall, we can represent a graph neural network as a sequence of layers that successively transform the node embeddings. If we group these embeddings into a matrix H whose nth row is the vector ${\mathbf h}_{n}^{\mathrm{T}}$ , which is initialized to the data matrix X, then we can write the successive transformations in the form

$$
\begin{array}{rl} &{\mathbf{H}^{(1)} = \mathbf{F} \left(\mathbf{X}, \mathbf{A}, \mathbf{W}^{(1)} \right)} \\ &{\mathbf{H}^{(2)} = \mathbf{F} \left(\mathbf{H}^{(1)}, \mathbf{A}, \mathbf{W}^{(2)} \right)} \\ &{\vdots \quad = \quad \vdots} \\ &{\mathbf{H}^{(L)} = \mathbf{F} \left(\mathbf{H}^{(L - 1)}, \mathbf{A}, \mathbf{W}^{(L)} \right)} \end{array}\tag{13.18}
$$

where A is the adjacency matrix, and $\mathbf{W}^{(l)}$ represents the complete set of weight and biases in layer l of the network. Under a node reordering defined by a permutation matrix $\mathbb{P}$ , the transformation of the node embeddings computed by layer l is equivariant:

$$
\mathbf{PH}^{(l)} = \mathbf{F} \left(\mathbf{PH}^{(l - 1)}, \mathbf{PAP}^{\mathrm{T}}, \mathbf{W}^{(l)} \right).\tag{13.19}
$$

As a consequence, the complete network computes an equivariant transformation.

## 13.2.5 Node classification

A graph neural network can be viewed as a series of layers each of which transforms a set of node-embedding vectors $\{\mathbf{h}_{n}^{(l)}\}$ into a new set $\{\mathbf{h}_{n}^{(l + 1)}\}$ of the same size and dimensionality. After the final convolutional layer of the network, we need to obtain predictions so that we can define a cost function for training and also for making predictions on new data using the trained network.

Consider first the task of classifying the nodes in a graph, which is one of the most common uses for graph neural networks. We can define an output layer, sometimes called a readout layer, which calculates a softmax function for each node corresponding to a classification over C classes, of the form

$$
y_{ni} = \frac{\exp(\mathbf{w}_{i}^{\mathrm{T}} \mathbf{h}_{n}^{(L)})}{\sum_{j} \exp(\mathbf{w}_{j}^{\mathrm{T}} \mathbf{h}_{n}^{(L)})}\tag{13.20}
$$

where $\{{\bf w}_{i}\}$ is a set of learnable weight vectors and $i = 1, \ldots, C$ . We can then define a loss function as the sum of the cross-entropy loss across all nodes and all classes:

$$
\mathcal{L} = - \sum_{n \in \mathcal{V}_{\mathrm{train}}} \sum_{i = 1}^{C} y_{ni}^{t_{ni}}\tag{13.21}
$$

where $\{t_{ni}\}$ are target values with a one-hot encoding for each value of $n.$ Because the weight vectors $\{{\bf w}_{i}\}$ are shared across the output nodes, the outputs $y_{ni}$ are equivariant to permutation of the node ordering, and hence the loss function (13.21) is invariant. If the goal is to predict continuous values at the outputs then a simple linear transformation can be combined with a sum-of-squares error to define a suitable loss function.

The sum over n in (13.21) is taken over the subset of the nodes denoted by $\mathcal{V}_{\mathrm{train}}$ and used for training. We can distinguish between three types of nodes as follows:

1. The nodes $\mathcal{V}_{\mathrm{train}}$ are labelled and included in the message-passing operations of the graph neural network and are also used to compute the loss function used for training.

2. There is potentially also a transductive subset of nodes denoted by $\mathcal{V}_{\mathrm{trans}}.$ which are unlabelled and which do not contribute to the evaluation of the loss function used for training. However, they still participate in the messagepassing operations during both training and inference, and their labels may be predicted as part of the inference process.

3. The remaining nodes, denoted $\mathcal{V}_{\mathrm{induct}}$ , are a set of inductive nodes that are not used to compute the loss function, and neither these nodes nor their associated edges participate in message-passing during the training phase. However, they do participate in message-passing during the inference phase and their labels are predicted as the outcome of inference.

If there are no transductive nodes, and hence the test nodes (and their associated edges) are not available during the training phase, then the training is generally referred to as inductive learning, which can be considered to be a form of supervised learning. However, if there are transductive nodes then it is called transductive learning, which may be viewed as a form of semi-supervised learning.

## 13.2.6 Edge classification

In some applications we wish to make predictions about the edges of the graph rather than the nodes. A common form of edge classification task is edge completion in which the goal is to determine whether an edge should be present between two nodes. Given a set of node embeddings, the dot product between pairs of embeddings can be used to define a probability $p(n, m)$ for the presence of an edge between nodes n and m by using the logistic sigmoid function:

$$
p(n, m) = \sigma \left(\mathbf{h}_{n}^{\mathrm{T}} \mathbf{h}_{m} \right).\tag{13.22}
$$

An example application would be predicting whether two people in a social network have shared interests and therefore might wish to connect.

## 13.2.7 Graph classification

In some applications of graph neural networks, the goal is to predict the properties of new graphs given a training set of labelled graphs $\mathcal{G}_{1}, \ldots, \mathcal{G}_{N}$ . This requires that we combine the final-layer embedding vectors in a way that does not depend on the arbitrary node ordering, thereby ensuring that the output predictions will be invariant to that ordering. The goal is somewhat like that of the Aggregate function except that all nodes in the graph are included, not just the neighbourhood sets of the individual nodes. The simplest approach is to take the sum of the node-embedding vectors:

$$
\mathbf{y} = \mathbf{f} \left(\sum_{n \in \mathcal{V}} \mathbf{h}_{n}^{(L)} \right)\tag{13.23}
$$

where the function f may contain learnable parameters such as a linear transformation or a neural network. Other invariant aggregation functions can be used such as averages or element-wise minimum or maximum.

A cross-entropy loss is typically used for classification problems, such as labelling a candidate drug molecule as toxic or safe, and a squared-error loss for regression problems, such as predicting the solubility of a candidate drug molecule. Graph-level predictions correspond to an inductive task since there must be separate sets of graphs for training and for inference.

## 13.3. General Graph Networks

There are many variations and extensions of the graph networks considered so far.   
Here we outline a few of the key concepts along with some practical considerations.

## 13.3.1 Graph attention networks

The attention mechanism is very powerful when used as the basis of a transformer architecture. It can be used in the context of graph neural networks to construct an aggregation function that combines messages from neighbouring nodes. The incoming messages are weighted by attention coefficients $A_{nm}$ to give

$$
\mathbf{z}_{n}^{(l)} = \mathrm{Aggregate} \left(\left\{\mathbf{h}_{m}^{(l)} : m \in \mathcal{N}(n) \right\} \right) = \sum_{m \in \mathcal{N}(n)} A_{nm} \mathbf{h}_{m}^{(l)}\tag{13.24}
$$

where the attention coefficients satisfy

$$
A_{nm} \geqslant 0\tag{13.25}
$$

$$
\sum_{m \in \mathcal{N}(n)} A_{nm} = 1.\tag{13.26}
$$

This is known as a graph attention network (Velickoviˇ c´ et al., 2017) and can capture an inductive bias that says some neighbouring nodes will be more important than others in determining the best update in a way that depends on the data itself.

There are multiple ways to construct the attention coefficients, and these generally employ a softmax function. For example, we can use a bilinear form:

$$
A_{nm} = \frac{\exp \left(\mathbf{h}_{n}^{\mathrm{T}} \mathbf{W} \mathbf{h}_{m} \right)}{\sum_{m^{\prime} \in \mathcal{N}(n)} \exp \left(\mathbf{h}_{n}^{\mathrm{T}} \mathbf{W} \mathbf{h}_{m^{\prime}} \right)}\tag{13.27}
$$

where W is a $D \times D$ matrix of learnable parameters. A more general option is to use a neural network to combine the embedding vectors from the nodes at each end of the edge:

$$
{\cal A}_{nm} = \frac{\exp \left\{\mathrm{MLP} \left(\mathbf{h}_{n}, \mathbf{h}_{m} \right) \right\}}{\sum_{m^{\prime} \in{\mathcal{N}}(n)} \exp \left\{\mathrm{MLP} \left(\mathbf{h}_{n}, \mathbf{h}_{m^{\prime}} \right) \right\}}\tag{13.28}
$$

where the MLP has a single continuous output variable whose value is invariant if the input vectors are exchanged. Provided the MLP is shared across all the nodes in the network, this aggregation function will be equivariant under node reordering.

A graph attention network can be extended by introducing multiple attention heads in which H distinct sets of attention weights $A_{nm}^{(h)}$ are defined, for $h \ =$ $1, \ldots, H$ , in which each head is evaluated using one of the mechanisms described above and with its own independent parameters. These are then combined in the aggregation step using concatenation and linear projection. Note that, for a fullyconnected network, a multi-head graph attention network becomes a standard transformer encoder.

## 13.3.2 Edge embeddings

The graph neural networks discussed above use embedding vectors that are associated with the nodes. We have seen that some networks also have data associated with the edges. Even when there are no observable values associated with the edges,

we can still maintain and update edge-based hidden variables and these can contribute to the internal representations learned by the graph neural network.

In addition to the node embeddings given by $\mathbf{h}_{n}^{(l)}$ , we therefore introduce edge embeddings $\mathbf{e}_{nm}^{(l)}$ . We can then define general message-passing equations in the form

$$
\mathbf{e}_{nm}^{(l + 1)} = \mathrm{Update}_{\mathrm{edge}} \left(\mathbf{e}_{nm}^{(l)}, \mathbf{h}_{n}^{(l)}, \mathbf{h}_{m}^{(l)} \right)\tag{13.29}
$$

$$
\mathbf{z}_{n}^{(l + 1)} = \mathrm{Aggregate}_{\mathrm{node}} \left(\left\{\mathbf{e}_{nm}^{(l + 1)} : m \in \mathcal{N}(n) \right\} \right)\tag{13.30}
$$

$$
\mathbf{h}_{n}^{(l + 1)} = \mathrm{Update}_{\mathrm{node}} \left(\mathbf{h}_{n}^{(l)}, \mathbf{z}_{n}^{(l + 1)} \right).\tag{13.31}
$$

The learned edge embeddings ${\bf e}_{nm}^{(L)}$ from the final layer can be used directly to make predictions associated with the edges.

## 13.3.3 Graph embeddings

In addition to node and edge embeddings we can also maintain and update an embedding vector $\mathbf{g}^{(l)}$ that relates to the graph as a whole. Bringing all these aspects together allows us to define a more general set of message-passing functions, and a richer set of learned representations, for graph-structured applications. Specifically, we can define general message-passing equations (Battaglia et al., 2018):

$$
\mathbf{e}_{nm}^{(l + 1)} = \mathrm{Update}_{\mathrm{edge}} \left(\mathbf{e}_{nm}^{(l)}, \mathbf{h}_{n}^{(l)}, \mathbf{h}_{m}^{(l)}, \mathbf{g}^{(l)} \right)\tag{13.32}
$$

$$
\mathbf{z}_{n}^{(l + 1)} = \mathrm{Aggregate}_{\mathrm{node}} \left(\left\{\mathbf{e}_{nm}^{(l + 1)} : m \in \mathcal{N}(n) \right\} \right)\tag{13.33}
$$

$$
\mathbf h_{n}^{(l + 1)} = \mathrm{Update}_{\mathrm{node}} \left(\mathbf h_{n}^{(l)}, \mathbf z_{n}^{(l + 1)}, \mathbf g^{(l)} \right)\tag{13.34}
$$

$$
\mathbf{g}^{(l + 1)} = \mathrm{Update}_{\mathrm{graph}} \left(\mathbf{g}^{(l)}, \{\mathbf{h}_{n}^{(l + 1)} : n \in \mathcal{V}\}, \{\mathbf{e}_{nm}^{(l + 1)} :(n, m) \in \mathcal{E}\} \right)\tag{13.35}
$$

These update equations start in (13.32) by updating the edge embedding vectors $\mathbf{e}_{nm}^{(l + 1)}$ based on the previous states of those vectors, on the node embeddings for the nodes connected by each edge, and on a graph-level embedding vector $\mathbf{g}^{(\breve{l})}$ . These updated edge embeddings are then aggregated across every edge connected to each node using (13.33) to give a set of aggregated vectors. These in turn then contribute to the update of the node-embedding vector $\{\mathbf{h}_{n}^{(l + 1)}.$ based on the current nodeembedding vectors and on the graph-level embedding vector using (13.34). Finally, the graph-level embedding vector is updated using (13.35) based on information from all the nodes and all the edges in the graph along with the graph-level embedding from the previous layer. These message-passing updates are illustrated in Figure 13.5 and are summarized in Algorithm 13.2.

## 13.3.4 Over-smoothing

One significant problem that can arise with some graph neural networks is called over-smoothing in which the node-embedding vectors tend to become very similar to each other after a number of iterations of message-passing, which effectively limits the depth of the network. One way to help alleviate this issue is to introduce residual connections. For example, we can modify the update operator (13.34):

$$
\mathbf{h}_{n}^{(l + 1)} = \mathrm{Update}_{\mathrm{node}} \left(\mathbf{h}_{n}^{(l)}, \mathbf{z}_{n}^{(l + 1)}, \mathbf{g}^{(l)} \right) + \mathbf{h}_{n}^{(l)}.\tag{13.36}
$$

![Figure 13.5](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/5d65c332fa064e505625daf7eaaf42280a014a1a667c41cf06dfdb2caf1741f6.jpg)  
Figure 13.5 Illustration of the general graph message-passing updates defined by (13.32) to (13.35), showing (a) edge updates, (b) node updates, and (c) global graph updates. In each case the variable being updated is shown in red and the variables that contribute to that update are those shown in red and blue.

Another approach for mitigating the effects of over-smoothing is to allow the output layer to take information from all previous layers of the network and not just the final convolutional layer. This can be done for example by concatenating the representations from previous layers:

$$
{\bf y}_{n} ={\bf f} \left({\bf h}_{n}^{\left(1 \right)} \oplus{\bf h}_{n}^{\left(2 \right)} \oplus \cdots \oplus{\bf h}_{n}^{\left(L \right)} \right)\tag{13.37}
$$

where a b denotes the concatenation of vectors a and b. A variant of this would be to combine the vectors using max pooling instead of concatenation. In this case each element of the output vector is given by the max of all the corresponding elements of the embedding vectors from the previous layers.

## 13.3.5 Regularization

Standard techniques for regularization can be used with graph neural networks, including the addition of penalty terms, such as the sum-of-squares of the parameter values, to the loss function. In addition, some regularization methods have been developed specifically for graph neural networks.

Graph neural networks already employ weight sharing to achieve permutation equivariance and invariance, but typically they have independent parameters in each layer. However, weights and biases can also be shared across layers to reduce the number of independent parameters.

Dropout in the context of graph neural networks involves omitting random subsets of the graph nodes during training, with a fresh random subset chosen for each forward pass. This can likewise be applied to the edges in the graph in which randomly selected subsets of entries in the adjacency matrix are removed, or masked, during training.

Algorithm 13.2: Graph neural network with node, edge, and graph embeddings   
Input: Undirected graph $\mathcal{G} =(\nu, \mathcal{E})$   
Initial node embeddings $\{\mathbf{h}_{n}^{(0)}\}$   
Initial edge embeddings $\{\mathbf{e}_{nm}^{(0)}\}$   
Initial graph embedding $\mathbf{g}^{(0)}$   
Output: Final node embeddings $\{\mathbf{h}_{n}^{(L)}\}$   
Final edge embeddings $\{\mathbf{e}_{nm}^{(L)}\}$   
Final graph embedding $\mathbf{g}^{(L)}$   
$/ /$ Iterative message-passing   
for $l \in \{0, \ldots, L - 1\}$ do   
$\mathbf{e}_{nm}^{(l + 1)} \gets \mathrm{Update}_{\mathrm{edge}} \left(\mathbf{e}_{nm}^{(l)}, \mathbf{h}_{n}^{(l)}, \mathbf{h}_{m}^{(l)}, \mathbf{g}^{(l)} \right)$   
$\mathbf{z}_{n}^{(l + 1)} \gets \mathrm{Aggregate}_{\mathrm{node}} \left(\left\{\mathbf{e}_{nm}^{(l + 1)} : m \in \mathcal{N}(n) \right\} \right)$   
$\mathbf{h}_{n}^{(l + 1)} \xleftarrow{} \mathrm{Update}_{\mathrm{node}} \left(\mathbf{h}_{n}^{(l)}, \mathbf{z}_{n}^{(l + 1)}, \mathbf{g}^{(l)} \right)$   
$\mathbf{g}^{(l + 1)} \gets \mathrm{Update}_{\mathrm{graph}} \left(\mathbf{g}^{(l)}, \{\mathbf{h}_{n}^{(l + 1)}\}, \{\mathbf{e}_{nm}^{(l + 1)}\} \right)$   
end for   
return $\{\mathbf{h}_{n}^{(L)}\}, \{\mathbf{e}_{nm}^{(L)}\}, \mathbf{g}^{(L)}$

## 13.3.6 Geometric deep learning

We have seen how permutation symmetry is a key consideration when designing deep learning models for graph-structured data. It acts as a form of inductive bias, dramatically reducing the data requirements while improving predictive performance. In applications of graph neural networks associated with spatial properties, such as graphics meshes, fluid flow simulations, or molecular structures, there are additional equivariance and invariance properties that can be built into the network architecture.

Consider the task of predicting the properties of a molecule, for example when exploring the space of candidate drugs. The molecule can be represented as a list of atoms of given types (carbon, hydrogen, nitrogen, etc.) along with the spatial coordinates of each atom expressed as a three-dimensional column vector. We can introduce an associated embedding vector for each atom n at each layer l, denoted by $\mathbf{r}_{n}^{(l)}$ , and these vectors can be initialized with the known atom coordinates. However, the values for the elements of these vectors depends on the arbitrary choice of coordinate system, whereas the properties of the molecule do not. For example, the solubility of the molecule is unchanged if it is rotated in space or translated to a new position relative to the origin of the coordinate system, or if the coordinate system itself is reflected to give the mirror image version of the molecule. The molecular properties should therefore be invariant under such transformations.

By making careful choices of the functional forms for the update and aggregation operations (Satorras, Hoogeboom, and Welling, 2021), the new embeddings $\mathbf{r}_{n}^{(l)}$ can be incorporated into the graph neural network update equations (13.29) to (13.31) to achieve the required symmetry properties:

$$
\mathbf{e}_{nm}^{(l + 1)} = \mathrm{Update}_{\mathrm{edge}} \left(\mathbf{e}_{nm}^{(l)}, \mathbf{h}_{n}^{(l)}, \mathbf{h}_{m}^{(l)}, \big \| \mathbf{r}_{n}^{(l)} - \mathbf{r}_{m}^{(l)} \big \|^{2} \right)\tag{13.38}
$$

$$
\mathbf{r}_{n}^{(l + 1)} = \mathbf{r}_{n}^{(l)} + C \sum_{(n, m) \in \mathcal{E}} \left(\mathbf{r}_{n}^{(l)} - \mathbf{r}_{m}^{(l)} \right) \phi \left(\mathbf{e}_{nm}^{(l + 1)} \right)\tag{13.39}
$$

$$
\mathbf{z}_{n}^{(l + 1)} = \mathrm{Aggregate}_{\mathrm{node}} \left(\{\mathbf{e}_{nm}^{(l + 1)} : m \in \mathcal{N}(n)\} \right)\tag{13.40}
$$

$$
\mathbf{h}_{n}^{(l + 1)} = \mathrm{Update}_{\mathrm{node}} \left(\mathbf{h}_{n}^{(l)}, \mathbf{z}_{n}^{(l + 1)} \right)\tag{13.41}
$$

Note that the quantity $\| \mathbf{r}_{n}^{(l)} - \mathbf{r}_{m}^{(l)} \|^{2}$ represents the squared distance between the coordinates $\mathbf{r}_{n}^{(l)}$ and $\mathbf{r}_{m}^{(l)}$ , and this does not depend on translations, rotations, or reflections. Also, the coordinates $\mathbf{r}_{n}^{(l)}$ are updated through a linear combination of the relative differences $\left(\mathbf{r}_{n}^{(l)} - \mathbf{r}_{m}^{(l)} \right)$ . Here $\phi \left(\mathbf{e}_{nm}^{(l + 1)} \right)$ is a general scalar function of the edge embeddings and is represented by a neural network, and the coefficient C is typically set equal to the reciprocal of the number of terms in the sum. It follows that under such transformations, the messages in (13.38), (13.40), and (13.41) are invariant and the coordinate embeddings given by (13.39) are equivariant.

Exercise 13.10

We have seen many examples of symmetries in structured data, from translations of objects within images and the permutation of node orderings on graphs, to rotations and translations of molecules in three-dimensional space. Capturing these symmetries in the structure of a deep neural network is a powerful form of inductive bias and forms the basis of a rich field of research known as geometric deep learning (Bronstein et al., 2017; Bronstein et al., 2021).

## Exercises

13.1 (?) Show that the permutation $(A, B, C, D, E) \to(C, E, A, D, B)$ corresponding to the two choices of node ordering in Figure 13.2 can be expressed in the form (13.5) with a permutation matrix given by (13.1).

13.2 (? ?) Show that the number of edges connected to each node of a graph is given by the corresponding diagonal element of the matrix ${\bf A}^{2}$ where A is the adjacency matrix.

13.3 (?) Draw the graph whose adjacency matrix is given by

$$
\mathbf{A} = \left(\begin{array}{lllll}{0} &{1} &{1} &{0} &{1} \\{1} &{0} &{1} &{1} &{1} \\{1} &{1} &{0} &{1} &{0} \\{0} &{1} &{1} &{0} &{0} \\{1} &{1} &{0} &{0} &{0} \end{array} \right).\tag{13.42}
$$

13.4 (? ?) Show that the effect of pre-multiplying a data matrix X using a permutation matrix P defined by (13.3) is to create a new data matrix $\widetilde{\mathbf{X}}$ given by (13.4) whose rows are permuted according to the permutation function $\pi(\cdot)$

13.5 (? ?) Show that the transformed adjacency matrix $\widetilde{\mathbf A}$ defined by (13.5), where P is defined by (13.3), is such that both the rows and the columns are permuted according to the permutation function $\pi(\cdot)$ relative to the original adjacency matrix A.

13.6 (? ?) In this exercise we write the update equations (13.16) as graph-level equations using matrices. To keep the notation uncluttered, we omit the layer index l. First, gather the node-embedding vectors $\left\{\mathbf{h}_{n} \right\}$ into an $N \times D$ matrix H in which row n is given by ${\mathbf h}_{n}^{\mathrm{T}}$ . Then show that the neighbourhood-aggregated vectors $\mathbf{z}_{n}$ given by

$$
\mathbf{z}_{n} = \sum_{m \in \mathcal{N}(n)} \mathbf{h}_{m}\tag{13.43}
$$

can be written in matrix form as $\mathbf{Z} = \mathbf{A} \mathbf{H}$ where Z is the $N \times D$ matrix in which row n is given by ${\mathbf z}_{n}^{\mathrm{T}}$ , and A is the adjacency matrix. Finally, show that the argument to the nonlinear activation function in (13.16) can be written in matrix form as

$$
\mathbf{AHW}_{\mathrm{neigh}} + \mathbf{HW}_{\mathrm{self}} + \mathbf{1}_{D} \mathbf{b}^{\mathrm{T}}\tag{13.44}
$$

where $\mathbf{1}_{D}$ is the D-dimensional column vector in which all elements are 1.

13.7 (? ?) By making use of the equivariance property (13.19) for layer l of a deep graph convolutional network along with the permutation property (13.4) for the node variables, show that a complete deep graph convolutional network defined by (13.18) is also equivariant.

13.8 (? ?) Explain why the aggregation function defined by (13.24), in which the attention weights are given by (13.28), is equivariant under a reordering of the nodes in the graph.

13.9 (?) Show that a graph attention network in which the graph is fully connected, so that there is an edge between every pair of nodes, is equivalent to a standard transformer architecture.

13.10 (? ?) When a coordinate system is translated, the location of an object defined by that coordinate system is transformed using

$$
\widetilde{\mathbf{r}} = \mathbf{r} + \mathbf{c}\tag{13.45}
$$

where c is a fixed vector describing the translation. Similarly, if the coordinate system is rotated and/or mirror reflected, the location vector of an object is transformed using

$$
\widetilde{\mathbf{r}} = \mathbb{R} \mathbf{r}\tag{13.46}
$$

where R is an orthogonal matrix whose inverse is given by its transpose so that

$$
{\bf R}{\bf R}^{\mathrm{T}} ={\bf R}^{\mathrm{T}}{\bf R} ={\bf I}.\tag{13.47}
$$

Using these properties, show that under translations, rotations, and reflections, the messages in (13.38), (13.40), and (13.41) are invariant, and that the coordinate embeddings given by (13.39) are equivariant.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-foundations-concepts/parts/401-600/images/904857bea5f51b5f7e719d1ef1e931240c17ce2b8d4888a494710a68ca29e79b.jpg)

There are many situations in deep learning where we need to create synthetic examples of a variable z from a probability distribution p(z). Here z might be a scalar and the distribution might be a univariate Gaussian, or z might be a high-resolution image and p(z) might be a generative model defined by a deep neural network. The process of creating such examples is known as sampling, also known as Monte Carlo sampling. For many simple distributions there are numerical techniques that generate suitable samples directly, whereas for more complex distributions, including ones that are defined implicitly, we may need more sophisticated approaches. We adopt the convention of referring to each instantiated value as a sample, in contrast to the convention used in classical statistics whereby ‘sample’ refers to a set of values.

In this chapter we focus on aspects of sampling that are most relevant to deep learning. Further information on Monte Carlo methods more generally can be found in Gilks, Richardson, and Spiegelhalter (1996) and Robert and Casella (1999).


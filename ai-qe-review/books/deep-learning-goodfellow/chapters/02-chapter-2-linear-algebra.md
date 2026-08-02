---
title: "Chapter 2 \u2014 Linear Algebra"
book: "Deep Learning"
book_slug: deep-learning-goodfellow
course: deep-learning
chapter_number: 2
citekey: goodfellow2016deep
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf"
source_transcript: "transcripts/mineru/deep-learning-goodfellow/reading.md"
source_line_start: 671
source_line_end: 1353
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 2
source_empty_image_alt: 2
non_semantic_image_alt: 1
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
  - deep-learning
  - official-syllabus
---

# Chapter 2 — Linear Algebra

> [[../README|本书目录]] · [[01-chapter-1-introduction|上一章]] · [[03-chapter-3-probability-and-information-theory|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Deep Learning（goodfellow2016deep）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/deep-learning-goodfellow/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/deep-learning-goodfellow/reading.md)，源行 671–1353。
> - 本章保留 2 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

# Linear Algebra

Linear algebra is a branch of mathematics that is widely used throughout science and engineering. Yet because linear algebra is a form of continuous rather than discrete mathematics, many computer scientists have little experience with it. A good understanding of linear algebra is essential for understanding and working with many machine learning algorithms, especially deep learning algorithms. We therefore precede our introduction to deep learning with a focused presentation of the key linear algebra prerequisites.

If you are already familiar with linear algebra, feel free to skip this chapter. If you have previous experience with these concepts but need a detailed reference sheet to review key formulas, we recommend The Matrix Cookbook (Petersen and Pedersen, 2006). If you have had no exposure at all to linear algebra, this chapter will teach you enough to read this book, but we highly recommend that you also consult another resource focused exclusively on teaching linear algebra, such as Shilov (1977). This chapter completely omits many important linear algebra topics that are not essential for understanding deep learning.

## 2.1 Scalars, Vectors, Matrices and Tensors

The study of linear algebra involves several types of mathematical objects:

\- Scalars: A scalar is just a single number. in contrast to most of the other objects studied in linear algebra, which are usually arrays of multiple numbers. We write scalars in italics. We usually give scalars lowercase variable names. When we introduce them, we specify what kind of number they are. For example, we might say “Let $s \in R$ be the slope of the line,” while defining a real-valued scalar, or “Let $n \in N$ be the number of units,” while defining a natural number scalar.

\- Vectors: A vector is an array of numbers. The numbers are arranged in order. We can identify each individual number by its index in that ordering. Typically we give vectors lowercase names in bold typeface, such as $\pmb{x}$ . The elements of the vector are identified by writing its name in italic typeface, with a subscript. The first element of $\pmb{x}$ is $x_{1}$ , the second element is $x_{2}$ , and so on. We also need to say what kind of numbers are stored in the vector. If each element is in $\mathbb{R}$ , and the vector has $n$ elements, then the vector lies in the set formed by taking the Cartesian product of $\mathbb{R}$ $n$ times, denoted as $\mathbb{R}^{n}$ . When we need to explicitly identify the elements of a vector, we write them as a column enclosed in square brackets:

$$
\boldsymbol{x} = \left[\begin{array}{c} x_{1} \\ x_{2} \\ \vdots \\ x_{n} \end{array} \right].\tag{2.1}
$$

We can think of vectors as identifying points in space, with each element giving the coordinate along a different axis.

Sometimes we need to index a set of elements of a vector. In this case, we define a set containing the indices and write the set as a subscript. For example, to access $x_{1}$ , $x_{3}$ and $x_{6}$ , we define the set $S = \{1, 3, 6\}$ and write $x_{S}$ . We use the - sign to index the complement of a set. For example $x_{-1}$ is the vector containing all elements of x except for $x_{1}$ , and $x_{-S}$ is the vector containing all elements of x except for $x_{1}$ , $x_{3}$ and $x_{6}$ .

\- Matrices: A matrix is a 2-D array of numbers, so each element is identified by two indices instead of just one. We usually give matrices uppercase variable names with bold typeface, such as $\mathbf{A}$ . If a real-valued matrix $\mathbf{A}$ has a height of $m$ and a width of $n$ , then we say that $\mathbf{A} \in \mathbb{R}^{m \times n}$ . We usually identify the elements of a matrix using its name in italic but not bold font, and the indices are listed with separating commas. For example, $A_{1,1}$ is the upper left entry of $\mathbf{A}$ and $A_{m,n}$ is the bottom right entry. We can identify all the numbers with vertical coordinate $i$ by writing a “:” for the horizontal coordinate. For example, $A_{i,:}$ denotes the horizontal cross section of $\mathbf{A}$ with vertical coordinate $i$ . This is known as the $i$ -th row of $\mathbf{A}$ . Likewise, $A_{:,i}$ is the i-th column of A. When we need to explicitly identify the elements of a matrix, we write them as an array enclosed in square brackets:

$$
\left[\begin{array}{cc} A_{1, 1} & A_{1, 2} \\ A_{2, 1} & A_{2, 2} \end{array} \right].\tag{2.2}
$$

Sometimes we may need to index matrix-valued expressions that are not just a single letter. In this case, we use subscripts after the expression but do not convert anything to lowercase. For example, $f(\boldsymbol{A})_{i,j}$ gives element $(i,j)$ of the matrix computed by applying the function f to A.

\- Tensors: In some cases we will need an array with more than two axes. In the general case, an array of numbers arranged on a regular grid with a variable number of axes is known as a tensor. We denote a tensor named “A” with this typeface: A. We identify the element of A at coordinates $(i,j,k)$ by writing $A_{i,j,k}$ .

One important operation on matrices is the transpose. The transpose of a matrix is the mirror image of the matrix across a diagonal line, called the main diagonal, running down and to the right, starting from its upper left corner. See figure 2.1 for a graphical depiction of this operation. We denote the transpose of a matrix A as $A^{\top}$ , and it is defined such that

$$
(\boldsymbol{A}^{\top})_{i, j} = \boldsymbol{A}_{j, i}.\tag{2.3}
$$

Vectors can be thought of as matrices that contain only one column. The transpose of a vector is therefore a matrix with only one row. Sometimes we define a vector by writing out its elements in the text inline as a row matrix, then using the transpose operator to turn it into a standard column vector, for example $x =[x_{1}, x_{2}, x_{3}]^{\top}$ .

A scalar can be thought of as a matrix with only a single entry. From this, we can see that a scalar is its own transpose: $a = a^{\top}$ .

$$
\boldsymbol{A} = \left[\begin{array}{cc} A_{1, 1} & A_{1, 2} \\ A_{2, 1} & A_{2, 3} \\ A_{3, 1} & A_{3, 2} \end{array} \right] \Rightarrow \boldsymbol{A}^{\top} \div \left[\begin{array}{ccc} A_{1, 1} & A_{2, 1} & A_{3, 1} \\ A_{1, 2} & A_{2, 2} & A_{3, 2} \end{array} \right]
$$

Figure 2.1: The transpose of the matrix can be thought of as a mirror image across the main diagonal.

We can add matrices to each other, as long as they have the same shape, just by adding their corresponding elements: $C = A + B$ where $C_{i,j} = A_{i,j} + B_{i,j}$ .

We can also add a scalar to a matrix or multiply a matrix by a scalar, just by performing that operation on each element of a matrix: $D = a \cdot B + c$ where $D_{i,j} = a \cdot B_{i,j} + c$ .

In the context of deep learning, we also use some less conventional notation. We allow the addition of matrix and a vector, yielding another matrix: $C = A + b$ , where $C_{i,j} = A_{i,j} + b_j$ . In other words, the vector b is added to each row of the matrix. This shorthand eliminates the need to define a matrix with b copied into each row before doing the addition. This implicit copying of b to many locations is called broadcasting.

## 2.2 Multiplying Matrices and Vectors

One of the most important operations involving matrices is multiplication of two matrices. The matrix product of matrices A and B is a third matrix C. In order for this product to be defined, A must have the same number of columns as B has rows. If A is of shape $m \times n$ and B is of shape $n \times p$ , then C is of shape $m \times p$ . We can write the matrix product just by placing two or more matrices together, for example,

$$
C = AB.\tag{2.4}
$$

The product operation is defined by

$$
C_{i, j} = \sum_{k} A_{i, k} B_{k, j}.\tag{2.5}
$$

Note that the standard product of two matrices is not just a matrix containing the product of the individual elements. Such an operation exists and is called the element-wise product, or Hadamard product, and is denoted as $A \odot B$ .

The dot product between two vectors x and y of the same dimensionality is the matrix product $x^{\top}y$ . We can think of the matrix product C = AB as computing $C_{i,j}$ as the dot product between row i of A and column j of B.

Matrix product operations have many useful properties that make mathematical analysis of matrices more convenient. For example, matrix multiplication is distributive:

$$
\boldsymbol{A}(\boldsymbol{B} + \boldsymbol{C}) = \boldsymbol{AB} + \boldsymbol{AC}.\tag{2.6}
$$

It is also associative:

$$
\boldsymbol{A}(\boldsymbol{BC}) =(\boldsymbol{AB}) \boldsymbol{C}.\tag{2.7}
$$

Matrix multiplication is not commutative (the condition AB = BA does not always hold), unlike scalar multiplication. However, the dot product between two vectors is commutative:

$$
\boldsymbol{x}^{\top} \boldsymbol{y} = \boldsymbol{y}^{\top} \boldsymbol{x}.\tag{2.8}
$$

The transpose of a matrix product has a simple form:

$$
\left(\boldsymbol{A} \boldsymbol{B}\right)^{\top} = \boldsymbol{B}^{\top} \boldsymbol{A}^{\top}.\tag{2.9}
$$

This enables us to demonstrate equation 2.8 by exploiting the fact that the value of such a product is a scalar and therefore equal to its own transpose:

$$
\boldsymbol{x}^{\top} \boldsymbol{y} = \left(\boldsymbol{x}^{\top} \boldsymbol{y}\right)^{\top} = \boldsymbol{y}^{\top} \boldsymbol{x}.\tag{2.10}
$$

Since the focus of this textbook is not linear algebra, we do not attempt to develop a comprehensive list of useful properties of the matrix product here, but the reader should be aware that many more exist.

We now know enough linear algebra notation to write down a system of linear equations:

$$
Ax = b\tag{2.11}
$$

where $A \in R^{m \times n}$ is a known matrix, $b \in \mathbb{R}^{m}$ is a known vector, and $x \in \mathbb{R}^{n}$ is a vector of unknown variables we would like to solve for. Each element $x_{i}$ of x is one of these unknown variables. Each row of A and each element of b provide another constraint. We can rewrite equation 2.11 as

$$
\boldsymbol{A}_{1,:} \boldsymbol{x} = b_{1}\tag{2.12}
$$

$$
\boldsymbol{A}_{2,:} \boldsymbol{x} = b_{2}\tag{2.13}
$$

(2.14)

$$
\boldsymbol{A}_{m,:} \boldsymbol{x} = b_{m}\tag{2.15}
$$

or even more explicitly as

$$
\boldsymbol{A}_{1, 1} x_{1} + \boldsymbol{A}_{1, 2} x_{2} + \dots + \boldsymbol{A}_{1, n} x_{n} = b_{1}\tag{2.16}
$$

$$
\boldsymbol{A}_{2, 1} x_{1} + \boldsymbol{A}_{2, 2} x_{2} + \dots + \boldsymbol{A}_{2, n} x_{n} = b_{2}\tag{2.17}
$$

(2.18)

$$
\boldsymbol{A}_{m, 1} x_{1} + \boldsymbol{A}_{m, 2} x_{2} + \dots + \boldsymbol{A}_{m, n} x_{n} = b_{m}.\tag{2.19}
$$

Matrix-vector product notation provides a more compact representation for equations of this form.

## 2.3 Identity and Inverse Matrices

Linear algebra offers a powerful tool called matrix inversion that enables us to analytically solve equation 2.11 for many values of A.

To describe matrix inversion, we first need to define the concept of an identity matrix. An identity matrix is a matrix that does not change any vector when we multiply that vector by that matrix. We denote the identity matrix that preserves n-dimensional vectors as $I_{n}$ . Formally, $I_{n} \in R^{n \times n}$ , and

$$
\forall \boldsymbol{x} \in \mathbb{R}^{n}, \boldsymbol{I}_{n} \boldsymbol{x} = \boldsymbol{x}.\tag{2.20}
$$

The structure of the identity matrix is simple: all the entries along the main diagonal are 1. while all the other entries are zero. See figure 2.2 for an example.

The matrix inverse of A is denoted as $A^{-1}$ , and it is defined as the matrix such that

$$
\boldsymbol{A}^{- 1} \boldsymbol{A} = \boldsymbol{I}_{n}.\tag{2.21}
$$

We can now solve equation 2.11 using the following steps:

$$
Ax = b\tag{2.22}
$$

$$
A^{- 1} Ax = A^{- 1} b\tag{2.23}
$$

$$
\pmb{I}_{n} \pmb{x} = \pmb{A}^{- 1} \pmb{b}\tag{2.24}
$$

$$
\boldsymbol{x} = \boldsymbol{A}^{- 1} \boldsymbol{b}.\tag{2.25}
$$

Of course, this process depends on it being possible to find $A^{-1}$ . We discuss the conditions for the existence of $A^{-1}$ in the following section.

When $A^{-1}$ exists, several different algorithms can find it in closed form. In theory, the same inverse matrix can then be used to solve the equation many times for different values of b. $A^{-1}$ is primarily useful as a theoretical tool, however, and should not actually be used in practice for most software applications. Because $A^{-1}$ can be represented with only limited precision on a digital computer, algorithms that make use of the value of b can usually obtain more accurate estimates of x.

$$
\left[\begin{array}{ccc} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{array} \right]
$$

Figure 2.2: Example identity matrix: This is $I_{3}$ .

## 2.4 Linear Dependence and Span

For $A^{-1}$ to exist, equation 2.11 must have exactly one solution for every value of b. It is also possible for the system of equations to have no solutions or infinitely many solutions for some values of b. It is not possible, however, to have more than one but less than infinitely many solutions for a particular b; if both x and y are solutions, then

$$
\boldsymbol{z} = \alpha \boldsymbol{x} +(1 - \alpha) \boldsymbol{y}\tag{2.26}
$$

is also a solution for any real $\alpha$ .

To analyze how many solutions the equation has, think of the columns of A as specifying different directions we can travel in from the origin (the point specified by the vector of all zeros), then determine how many ways there are of reaching b. In this view, each element of x specifies how far we should travel in each of these directions, with $x_{i}$ specifying how far to move in the direction of column i:

$$
\boldsymbol{A} \boldsymbol{x} = \sum_{i} x_{i} \boldsymbol{A}_{:, i}.\tag{2.27}
$$

In general, this kind of operation is called a linear combination. Formally, a linear combination of some set of vectors $\{\boldsymbol{v}^{(1)},\ldots,\boldsymbol{v}^{(n)}\}$ is given by multiplying each vector $\boldsymbol{v}^{(i)}$ by a corresponding scalar coefficient and adding the results:

$$
\sum_{i} c_{i} \boldsymbol{v}^{(i)}.\tag{2.28}
$$

The span of a set of vectors is the set of all points obtainable by linear combination of the original vectors.

Determining whether Ax = b has a solution thus amounts to testing whether b is in the span of the columns of A. This particular span is known as the column space, or the range, of A.

In order for the system Ax = b to have a solution for all values of $b \in \mathbb{R}^{m}$ , we therefore require that the column space of A be all of $\mathbb{R}^{m}$ . If any point in $\mathbb{R}^{m}$ is excluded from the column space, that point is a potential value of b that has no solution. The requirement that the column space of A be all of $\mathbb{R}^{m}$ implies immediately that A must have at least m columns, that is, $n \geq m$ . Otherwise, the dimensionality of the column space would be less than m. For example, consider a $3 \times 2$ matrix. The target b is 3-D, but x is only 2-D, so modifying the value of x at best enables us to trace out a 2-D plane within $\mathbb{R}^{3}$ . The equation has a solution if and only if b lies on that plane.

Having $n \geq m$ is only a necessary condition for every point to have a solution. It is not a sufficient condition, because it is possible for some of the columns to be redundant. Consider a $2 \times 2$ matrix where both of the columns are identical. This has the same column space as a $2 \times 1$ matrix containing only one copy of the replicated column. In other words, the column space is still just a line and fails to encompass all of $\mathbb{R}^{2}$ , even though there are two columns.

Formally, this kind of redundancy is known as linear dependence. A set of vectors is linearly independent if no vector in the set is a linear combination of the other vectors. If we add a vector to a set that is a linear combination of the other vectors in the set, the new vector does not add any points to the set's span. This means that for the column space of the matrix to encompass all of $\mathbb{R}^{m}$ , the matrix must contain at least one set of m linearly independent columns. This condition is both necessary and sufficient for equation 2.11 to have a solution for every value of b. Note that the requirement is for a set to have exactly m linear independent columns, not at least m. No set of m-dimensional vectors can have more than m mutually linearly independent columns, but a matrix with more than m columns may have more than one such set.

For the matrix to have an inverse, we additionally need to ensure that equation 2.11 has at most one solution for each value of b. To do so, we need to make certain that the matrix has at most m columns. Otherwise there is more than one way of parametrizing each solution.

Together, this means that the matrix must be square, that is, we require that m = n and that all the columns be linearly independent. A square matrix with linearly dependent columns is known as singular.

If A is not square or is square but singular, solving the equation is still possible, but we cannot use the method of matrix inversion to find the solution.

So far we have discussed matrix inverses as being multiplied on the left. It is also possible to define an inverse that is multiplied on the right:

$$
\boldsymbol{A} \boldsymbol{A}^{- 1} = \boldsymbol{I}.\tag{2.29}
$$

For square matrices, the left inverse and right inverse are equal.

## 2.5 Norms

Sometimes we need to measure the size of a vector. In machine learning, we usually measure the size of vectors using a function called a norm. Formally, the $L^{p}$ norm

is given by

$$
| | \boldsymbol{x} | |_{p} = \left(\sum_{i} | x_{i} |^{p}\right)^{\frac{1}{p}}\tag{2.30}
$$

for $p \in R, p \geq 1$ .

Norms, including the $L^{p}$ norm, are functions mapping vectors to non-negative values. On an intuitive level, the norm of a vector x measures the distance from the origin to the point x. More rigorously, a norm is any function f that satisfies the following properties:

\- $f(x) = 0 \Rightarrow x = 0$

\- $f(x + y) \leq f(x) + f(y)$ (the triangle inequality)

$$
\bullet \quad \forall \alpha \in \mathbb{R}, f(\alpha \boldsymbol{x}) = | \alpha | f(\boldsymbol{x})
$$

The $L^{2}$ norm with p=2, is known as the Euclidean norm, which is simply the Euclidean distance from the origin to the point identified by x. The $L^{2}$ norm is used so frequently in machine learning that it is often denoted simply as $||x||$ , with the subscript 2 omitted. It is also common to measure the size of a vector using the squared $L^{2}$ norm, which can be calculated simply as $x^{\top}x$ .

The squared $L^{2}$ norm is more convenient to work with mathematically and computationally than the $L^{2}$ norm itself. For example, each derivative of the squared $L^{2}$ norm with respect to each element of x depends only on the corresponding element of x, while all the derivatives of the $L^{2}$ norm depend on the entire vector. In many contexts, the squared $L^{2}$ norm may be undesirable because it increases very slowly near the origin. In several machine learning applications, it is important to discriminate between elements that are exactly zero and elements that are small but nonzero. In these cases, we turn to a function that grows at the same rate in all locations, but that retains mathematical simplicity: the $L^{1}$ norm. The $L^{1}$ norm may be simplified to

$$
\left| \left| \boldsymbol{x} \right| \right|_{1} = \sum_{i} \left| x_{i} \right|.\tag{2.31}
$$

The $L^{1}$ norm is commonly used in machine learning when the difference between zero and nonzero elements is very important. Every time an element of x moves away from 0 by $\epsilon$ , the $L^{1}$ norm increases by $\epsilon$ .

We sometimes measure the size of the vector by counting its number of nonzero elements. Some authors refer to this function as the “ $L^{0}$ norm,” but this is incorrect terminology. The number of nonzero entries in a vector is not a norm, because scaling the vector by $\alpha$ does not change the number of nonzero entries. The $L^{1}$ norm is often used as a substitute for the number of nonzero entries.

One other norm that commonly arises in machine learning is the $L^{\infty}$ norm, also known as the max norm. This norm simplifies to the absolute value of the element with the largest magnitude in the vector,

$$
\left| \left| \boldsymbol{x} \right| \right|_{\infty} = \max_{i} \left| x_{i} \right|.\tag{2.32}
$$

Sometimes we may also wish to measure the size of a matrix. In the context of deep learning, the most common way to do this is with the otherwise obscure Frobenius norm:

$$
\left| \left| A \right| \right|_{F} = \sqrt{\sum_{i, j} A_{i, j}^{2}},\tag{2.33}
$$

which is analogous to the $L^{2}$ norm of a vector.

The dot product of two vectors can be rewritten in terms of norms. Specifically,

$$
\boldsymbol{x}^{\top} \boldsymbol{y} = | | \boldsymbol{x} | |_{2} | | \boldsymbol{y} | |_{2} \cos \theta,\tag{2.34}
$$

where $\theta$ is the angle between x and y.

## 2.6 Special Kinds of Matrices and Vectors

Some special kinds of matrices and vectors are particularly useful.

Diagonal matrices consist mostly of zeros and have nonzero entries only along the main diagonal. Formally, a matrix D is diagonal if and only if $D_{i,j} = 0$ for all $i \neq j$ . We have already seen one example of a diagonal matrix: the identity matrix, where all the diagonal entries are 1. We write $\text{diag}(\boldsymbol{v})$ to denote a square diagonal matrix whose diagonal entries are given by the entries of the vector v. Diagonal matrices are of interest in part because multiplying by a diagonal matrix is computationally efficient. To compute $\text{diag}(\boldsymbol{v})\boldsymbol{x}$ , we only need to scale each element $x_i$ by $v_i$ . In other words, $\text{diag}(\boldsymbol{v})\boldsymbol{x} = \boldsymbol{v} \odot \boldsymbol{x}$ . Inverting a square diagonal matrix is also efficient. The inverse exists only if every diagonal entry is nonzero, and in that case, $\text{diag}(\boldsymbol{v})^{-1} = \text{diag}([1/v_1, \ldots, 1/v_n]^{\top})$ . In many cases, we may derive some general machine learning algorithm in terms of arbitrary matrices but obtain a less expensive (and less descriptive) algorithm by restricting some matrices to be diagonal.

Not all diagonal matrices need be square. It is possible to construct a rectangular diagonal matrix. Nonsquare diagonal matrices do not have inverses, but we can still multiply by them cheaply. For a nonsquare diagonal matrix D, the product Dx will involve scaling each element of x and either concatenating some zeros to the result, if D is taller than it is wide, or discarding some of the last elements of the vector, if D is wider than it is tall.

A symmetric matrix is any matrix that is equal to its own transpose:

$$
\boldsymbol{A} = \boldsymbol{A}^{\top}.\tag{2.35}
$$

Symmetric matrices often arise when the entries are generated by some function of two arguments that does not depend on the order of the arguments. For example, if A is a matrix of distance measurements, with $A_{i,j}$ giving the distance from point i to point j, then $A_{i,j} = A_{j,i}$ because distance functions are symmetric.

A unit vector is a vector with unit norm:

$$
\left| \left| \boldsymbol{x} \right| \right|_{2} = 1.\tag{2.36}
$$

A vector x and a vector y are orthogonal to each other if $x^{\top}y = 0$ . If both vectors have nonzero norm, this means that they are at a 90 degree angle to each other. In $\mathbb{R}^{n}$ , at most n vectors may be mutually orthogonal with nonzero norm. If the vectors not only are orthogonal but also have unit norm, we call them orthonormal.

An orthogonal matrix is a square matrix whose rows are mutually orthonormal and whose columns are mutually orthonormal:

$$
\boldsymbol{A}^{\top} \boldsymbol{A} = \boldsymbol{A} \boldsymbol{A}^{\top} = \boldsymbol{I}.\tag{2.37}
$$

This implies that

$$
\boldsymbol{A}^{- 1} = \boldsymbol{A}^{\top},\tag{2.38}
$$

so orthogonal matrices are of interest because their inverse is very cheap to compute. Pay careful attention to the definition of orthogonal matrices. Counterintuitively, their rows are not merely orthogonal but fully orthonormal. There is no special term for a matrix whose rows or columns are orthogonal but not orthonormal.

## 2.7 Eigendecomposition

Many mathematical objects can be understood better by breaking them into constituent parts, or finding some properties of them that are universal, not caused by the way we choose to represent them.

For example, integers can be decomposed into prime factors. The way we represent the number 12 will change depending on whether we write it in base ten or in binary, but it will always be true that $12 = 2 \times 2 \times 3$ . From this representation we can conclude useful properties, for example, that 12 is not divisible by 5, and that any integer multiple of 12 will be divisible by 3.

Much as we can discover something about the true nature of an integer by decomposing it into prime factors, we can also decompose matrices in ways that show us information about their functional properties that is not obvious from the representation of the matrix as an array of elements.

One of the most widely used kinds of matrix decomposition is called eigen-decomposition. in which we decompose a matrix into a set of eigenvectors and eigenvalues.

An eigenvector of a square matrix A is a nonzero vector v such that multiplication by A alters only the scale of v:

$$
Av = \lambda v.\tag{2.39}
$$

The scalar $\lambda$ is known as the eigenvalue corresponding to this eigenvector. (One can also find a left eigenvector such that $v^{\top}A = \lambda v^{\top}$ , but we are usually concerned with right eigenvectors.)

If v is an eigenvector of A, then so is any rescaled vector sv for $s \in R, s \neq 0$ . Moreover, sv still has the same eigenvalue. For this reason, we usually look only for unit eigenvectors.

Suppose that a matrix A has n linearly independent eigenvectors $\{\pmb{v}^{(1)},\ldots,\pmb{v}^{(n)}\}$ with corresponding eigenvalues $\{\lambda_{1},\ldots,\lambda_{n}\}$ . We may concatenate all the eigenvectors to form a matrix V with one eigenvector per column: $V=[\pmb{v}^{(1)},\ldots,\pmb{v}^{(n)}]$ . Likewise, we can concatenate the eigenvalues to form a vector $\lambda=[\lambda_{1},\ldots,\lambda_{n}]^{\top}$ . The eigendecomposition of A is then given by

$$
\boldsymbol{A} = \boldsymbol{V} \operatorname{diag}(\boldsymbol{\lambda}) \boldsymbol{V}^{- 1}.\tag{2.40}
$$

We have seen that constructing matrices with specific eigenvalues and eigenvectors enables us to stretch space in desired directions. Yet we often want to decompose matrices into their eigenvalues and eigenvectors. Doing so can help us analyze certain properties of the matrix, much as decomposing an integer into its prime factors can help us understand the behavior of that integer.

Not every matrix can be decomposed into eigenvalues and eigenvectors. In some cases, the decomposition exists but involves complex rather than real numbers.

Fortunately, in this book, we usually need to decompose only a specific class of matrices that have a simple decomposition. Specifically, every real symmetric matrix can be decomposed into an expression using only real-valued eigenvectors and eigenvalues:

$$
\boldsymbol{A} = \boldsymbol{Q} \boldsymbol{\Lambda} \boldsymbol{Q}^{\top},\tag{2.41}
$$

where Q is an orthogonal matrix composed of eigenvectors of A, and $\Lambda$ is a diagonal matrix. The eigenvalue $\Lambda_{i,i}$ is associated with the eigenvector in column i of Q, denoted as $Q_{\cdot,i}$ . Because Q is an orthogonal matrix, we can think of A as scaling space by $\lambda_{i}$ in direction $\boldsymbol{v}^{(i)}$ . See figure 2.3 for an example.

While any real symmetric matrix A is guaranteed to have an eigendecomposition, the eigendecomposition may not be unique. If any two or more eigenvectors share the same eigenvalue, then any set of orthogonal vectors lying in their span are also eigenvectors with that eigenvalue, and we could equivalently choose a Q using those eigenvectors instead. By convention, we usually sort the entries of $\Lambda$ in descending order. Under this convention, the eigendecomposition is unique only if all the eigenvalues are unique.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/8ab5c92cc75f6fe664f101985ddc31e283ea8564d7fe84071cc3f9fcb81687fe.jpg)

![Figure 2.3](../../../transcripts/mineru/deep-learning-goodfellow/parts/part-001-pages-001-200/images/93e70369f0cf0774e26f42d0581733fef8eec5fc24400685a49070e0e0a396b2.jpg)  
Figure 2.3: Effect of eigenvectors and eigenvalues. An example of the effect of eigenvectors and eigenvalues. Here, we have a matrix A with two orthonormal eigenvectors, $\boldsymbol{v}^{(1)}$ with eigenvalue $\lambda_{1}$ and $\boldsymbol{v}^{(2)}$ with eigenvalue $\lambda_{2}$ . (Left) We plot the set of all unit vectors $u \in \mathbb{R}^{2}$ as a unit circle. (Right) We plot the set of all points Au. By observing the way that A distorts the unit circle, we can see that it scales space in direction $\boldsymbol{v}^{(i)}$ by $\lambda_{i}$ .

The eigendecomposition of a matrix tells us many useful facts about the matrix. The matrix is singular if and only if any of the eigenvalues are zero. The eigendecomposition of a real symmetric matrix can also be used to optimize quadratic expressions of the form $f(\boldsymbol{x}) = \boldsymbol{x}^{\top} \boldsymbol{A} \boldsymbol{x}$ subject to $\|x\|_{2} = 1$ . Whenever x is equal to an eigenvector of A, f takes on the value of the corresponding eigenvalue. The maximum value of f within the constraint region is the maximum eigenvalue and its minimum value within the constraint region is the minimum eigenvalue.

A matrix whose eigenvalues are all positive is called positive definite. A matrix whose eigenvalues are all positive or zero valued is called positive semidefinite. Likewise, if all eigenvalues are negative, the matrix is negative definite, and if all eigenvalues are negative or zero valued, it is negative semidefinite. Positive semidefinite matrices are interesting because they guarantee that $\forall x, x^{\top}Ax \geq 0$ . Positive definite matrices additionally guarantee that $x^{\top}Ax = 0 \Rightarrow x = 0$ .

## 2.8 Singular Value Decomposition

In section 2.7, we saw how to decompose a matrix into eigenvectors and eigenvalues. The singular value decomposition (SVD) provides another way to factorize a matrix, into singular vectors and singular values. The SVD enables us to discover some of the same kind of information as the eigendecomposition reveals; however, the SVD is more generally applicable. Every real matrix has a singular value decomposition, but the same is not true of the eigenvalue decomposition. For example, if a matrix is not square, the eigendecomposition is not defined, and we must use a singular value decomposition instead.

Recall that the eigendecomposition involves analyzing a matrix A to discover a matrix V of eigenvectors and a vector of eigenvalues $\lambda$ such that we can rewrite A as

$$
\boldsymbol{A} = \boldsymbol{V} \operatorname{diag}(\boldsymbol{\lambda}) \boldsymbol{V}^{- 1}.\tag{2.42}
$$

The singular value decomposition is similar, except this time we will write A as a product of three matrices:

$$
\boldsymbol{A} = \boldsymbol{U} \boldsymbol{D} \boldsymbol{V}^{\top}.\tag{2.43}
$$

Suppose that A is an $m \times n$ matrix. Then U is defined to be an $m \times m$ matrix, D to be an $m \times n$ matrix, and V to be an $n \times n$ matrix.

Each of these matrices is defined to have a special structure. The matrices U and V are both defined to be orthogonal matrices. The matrix D is defined to be a diagonal matrix. Note that D is not necessarily square.

The elements along the diagonal of D are known as the singular values of the matrix A. The columns of U are known as the left-singular vectors. The columns of V are known as the right-singular vectors.

We can actually interpret the singular value decomposition of A in terms of the eigendecomposition of functions of A. The left-singular vectors of A are the eigenvectors of $AA^{\top}$ . The right-singular vectors of A are the eigenvectors of $A^{\top}A$ . The nonzero singular values of A are the square roots of the eigenvalues of $A^{\top}A$ . The same is true for $AA^{\top}$ .

Perhaps the most useful feature of the SVD is that we can use it to partially generalize matrix inversion to nonsquare matrices, as we will see in the next section.

## 2.9 The Moore-Penrose Pseudoinverse

Matrix inversion is not defined for matrices that are not square. Suppose we want to make a left-inverse B of a matrix A so that we can solve a linear equation

$$
Ax = y\tag{2.44}
$$

by left-multiplying each side to obtain

$$
x = By.\tag{2.45}
$$

Depending on the structure of the problem, it may not be possible to design a unique mapping from A to B.

If A is taller than it is wide, then it is possible for this equation to have no solution. If A is wider than it is tall, then there could be multiple possible solutions.

The Moore-Penrose pseudoinverse enables us to make some headway in these cases. The pseudoinverse of A is defined as a matrix

$$
\boldsymbol{A}^{+} = \lim_{\alpha \searrow 0}(\boldsymbol{A}^{\top} \boldsymbol{A} + \alpha \boldsymbol{I})^{- 1} \boldsymbol{A}^{\top}.\tag{2.46}
$$

Practical algorithms for computing the pseudoinverse are based not on this definition, but rather on the formula

$$
\boldsymbol{A}^{+} = \boldsymbol{V} \boldsymbol{D}^{+} \boldsymbol{U}^{\top},\tag{2.47}
$$

where U, D and V are the singular value decomposition of A, and the pseudoinverse $D^{+}$ of a diagonal matrix D is obtained by taking the reciprocal of its nonzero elements then taking the transpose of the resulting matrix.

When A has more columns than rows, then solving a linear equation using the pseudoinverse provides one of the many possible solutions. Specifically, it provides the solution $x = A^{+}y$ with minimal Euclidean norm $\|x\|_{2}$ among all possible solutions.

When A has more rows than columns, it is possible for there to be no solution. In this case, using the pseudoinverse gives us the x for which Ax is as close as possible to y in terms of Euclidean norm $\|Ax - y\|_{2}$ .

## 2.10 The Trace Operator

The trace operator gives the sum of all the diagonal entries of a matrix:

$$
\operatorname{Tr}(\boldsymbol{A}) = \sum_{i} \boldsymbol{A}_{i, i}.\tag{2.48}
$$

The trace operator is useful for a variety of reasons. Some operations that are difficult to specify without resorting to summation notation can be specified using matrix products and the trace operator. For example, the trace operator provides an alternative way of writing the Frobenius norm of a matrix:

$$
\left| \left| A \right| \right|_{F} = \sqrt{\operatorname{Tr} \left(\boldsymbol{A} \boldsymbol{A}^{\top}\right)}.\tag{2.49}
$$

Writing an expression in terms of the trace operator opens up opportunities to manipulate the expression using many useful identities. For example, the trace operator is invariant to the transpose operator:

$$
\operatorname{Tr}(\boldsymbol{A}) = \operatorname{Tr}(\boldsymbol{A}^{\top}).\tag{2.50}
$$

The trace of a square matrix composed of many factors is also invariant to moving the last factor into the first position, if the shapes of the corresponding matrices allow the resulting product to be defined:

$$
\operatorname{Tr}(ABC) = \operatorname{Tr}(CAB) = \operatorname{Tr}(BCA)\tag{2.51}
$$

or more generally,

$$
\operatorname{Tr} \left(\prod_{i = 1}^{n} \boldsymbol{F}^{(i)}\right) = \operatorname{Tr} \left(\boldsymbol{F}^{(n)} \prod_{i = 1}^{n - 1} \boldsymbol{F}^{(i)}\right).\tag{2.52}
$$

This invariance to cyclic permutation holds even if the resulting product has a different shape. For example, for $A \in R^{m \times n}$ and $B \in R^{n \times m}$ , we have

$$
\operatorname{Tr}(\boldsymbol{AB}) = \operatorname{Tr}(\boldsymbol{BA})\tag{2.53}
$$

even though $AB \in R^{m \times m}$ and $BA \in R^{n \times n}$ .

Another useful fact to keep in mind is that a scalar is its own trace: $a = \operatorname{Tr}(a)$ .

## 2.11 The Determinant

The determinant of a square matrix, denoted $\det(A)$ , is a function that maps matrices to real scalars. The determinant is equal to the product of all the eigenvalues of the matrix. The absolute value of the determinant can be thought of as a measure of how much multiplication by the matrix expands or contracts space. If the determinant is 0, then space is contracted completely along at least one dimension, causing it to lose all its volume. If the determinant is 1, then the transformation preserves volume.

## 2.12 Example: Principal Components Analysis

One simple machine learning algorithm, principal components analysis (PCA), can be derived using only knowledge of basic linear algebra.

Suppose we have a collection of m points $\{\boldsymbol{x}^{(1)},\ldots,\boldsymbol{x}^{(m)}\}$ in $\mathbb{R}^{n}$ and we want to apply lossy compression to these points. Lossy compression means storing the points in a way that requires less memory but may lose some precision. We want to lose as little precision as possible.

One way we can encode these points is to represent a lower-dimensional version of them. For each point $\boldsymbol{x}^{(i)} \in \mathbb{R}^{n}$ we will find a corresponding code vector $\boldsymbol{c}^{(i)} \in \mathbb{R}^{l}$ . If l is smaller than n, storing the code points will take less memory than storing the original data. We will want to find some encoding function that produces the code for an input, $f(\boldsymbol{x}) = \boldsymbol{c}$ , and a decoding function that produces the reconstructed input given its code, $\boldsymbol{x} \approx g(f(\boldsymbol{x}))$ .

PCA is defined by our choice of the decoding function. Specifically, to make the decoder very simple, we choose to use matrix multiplication to map the code back into $\mathbb{R}^{n}$ . Let $g(\boldsymbol{c}) = D\boldsymbol{c}$ , where $D \in R^{n \times l}$ is the matrix defining the decoding.

Computing the optimal code for this decoder could be a difficult problem. To keep the encoding problem easy, PCA constrains the columns of D to be orthogonal to each other. (Note that D is still not technically “an orthogonal matrix” unless l = n.)

With the problem as described so far, many solutions are possible, because we can increase the scale of $D_{:,i}$ if we decrease $c_{i}$ proportionally for all points. To give the problem a unique solution, we constrain all the columns of D to have unit norm.

In order to turn this basic idea into an algorithm we can implement, the first thing we need to do is figure out how to generate the optimal code point $c^{*}$ for each input point x. One way to do this is to minimize the distance between the input point x and its reconstruction, $g(\mathbf{c}^{*})$ . We can measure this distance using a norm. In the principal components algorithm, we use the $L^{2}$ norm:

$$
\boldsymbol{c}^{*} = \underset{\boldsymbol{c}}{\arg \min} | | \boldsymbol{x} - g(\boldsymbol{c}) | |_{2}.\tag{2.54}
$$

We can switch to the squared $L^{2}$ norm instead of using the $L^{2}$ norm itself because both are minimized by the same value of c. Both are minimized by the same value of c because the $L^{2}$ norm is non-negative and the squaring operation is monotonically increasing for non-negative arguments.

$$
\boldsymbol{c}^{*} = \underset{\boldsymbol{c}}{\arg \min} | | \boldsymbol{x} - g(\boldsymbol{c}) | |_{2}^{2}.\tag{2.55}
$$

The function being minimized simplifies to

$$
\left(\boldsymbol{x} - g(\boldsymbol{c})\right)^{\top} \left(\boldsymbol{x} - g(\boldsymbol{c})\right)\tag{2.56}
$$

(by the definition of the $L^{2}$ norm, equation 2.30)

$$
= \boldsymbol{x}^{\top} \boldsymbol{x} - \boldsymbol{x}^{\top} g(\boldsymbol{c}) - g(\boldsymbol{c})^{\top} \boldsymbol{x} + g(\boldsymbol{c})^{\top} g(\boldsymbol{c})\tag{2.57}
$$

(by the distributive property)

$$
= \boldsymbol{x}^{\top} \boldsymbol{x} - 2 \boldsymbol{x}^{\top} g(\boldsymbol{c}) + g(\boldsymbol{c})^{\top} g(\boldsymbol{c})\tag{2.58}
$$

(because the scalar $g(\boldsymbol{c})^{\top}\boldsymbol{x}$ is equal to the transpose of itself).

We can now change the function being minimized again, to omit the first term, since this term does not depend on c:

$$
\boldsymbol{c}^{*} = \underset{\boldsymbol{c}}{\arg \min} - 2 \boldsymbol{x}^{\top} g(\boldsymbol{c}) + g(\boldsymbol{c})^{\top} g(\boldsymbol{c}).\tag{2.59}
$$

To make further progress, we must substitute in the definition of $g(\pmb{c})$ :

$$
\boldsymbol{c}^{*} = \underset{\boldsymbol{c}}{\arg \min} - 2 \boldsymbol{x}^{\top} \boldsymbol{D} \boldsymbol{c} + \boldsymbol{c}^{\top} \boldsymbol{D}^{\top} \boldsymbol{D} \boldsymbol{c}\tag{2.60}
$$

$$
= \underset{\boldsymbol{c}}{\arg \min} - 2 \boldsymbol{x}^{\top} \boldsymbol{D} \boldsymbol{c} + \boldsymbol{c}^{\top} \boldsymbol{I}_{l} \boldsymbol{c}\tag{2.61}
$$

(by the orthogonality and unit norm constraints on D)

$$
= \underset{c}{\arg \min} - 2 \boldsymbol{x}^{\top} \boldsymbol{D} \boldsymbol{c} + \boldsymbol{c}^{\top} \boldsymbol{c}.\tag{2.62}
$$

We can solve this optimization problem using vector calculus (see section 4.3 if you do not know how to do this):

$$
\nabla_{\boldsymbol{c}}(- 2 \boldsymbol{x}^{\top} \boldsymbol{D} \boldsymbol{c} + \boldsymbol{c}^{\top} \boldsymbol{c}) = \boldsymbol{0}\tag{2.63}
$$

$$
- 2 \pmb{D}^{\top} \pmb{x} + 2 \pmb{c} = \mathbf{0}\tag{2.64}
$$

$$
\boldsymbol{c} = \boldsymbol{D}^{\top} \boldsymbol{x}.\tag{2.65}
$$

This makes the algorithm efficient: we can optimally encode x using just a matrix-vector operation. To encode a vector, we apply the encoder function

$$
f(\boldsymbol{x}) = \boldsymbol{D}^{\top} \boldsymbol{x}.\tag{2.66}
$$

Using a further matrix multiplication, we can also define the PCA reconstruction operation:

$$
r(\boldsymbol{x}) = g(f(\boldsymbol{x})) = \boldsymbol{D} \boldsymbol{D}^{\top} \boldsymbol{x}.\tag{2.67}
$$

Next, we need to choose the encoding matrix D. To do so, we revisit the idea of minimizing the $L^{2}$ distance between inputs and reconstructions. Since we will use the same matrix D to decode all the points, we can no longer consider the points in isolation. Instead, we must minimize the Frobenius norm of the matrix of errors computed over all dimensions and all points:

$$
\boldsymbol{D}^{*} = \underset{\boldsymbol{D}}{\arg \min} \sqrt{\sum_{i, j} \left(x_{j}^{(i)} - r(\boldsymbol{x}^{(i)})_{j}\right)^{2}} \text{subject to} \boldsymbol{D}^{\top} \boldsymbol{D} = \boldsymbol{I}_{l}.\tag{2.68}
$$

To derive the algorithm for finding $D^{*}$ , we start by considering the case where l = 1. In this case, D is just a single vector, d. Substituting equation 2.67 into equation 2.68 and simplifying D into d, the problem reduces to

$$
\boldsymbol{d}^{*} = \underset{\boldsymbol{d}}{\arg \min} \sum_{i} | | \boldsymbol{x}^{(i)} - \boldsymbol{d} \boldsymbol{d}^{\top} \boldsymbol{x}^{(i)} | |_{2}^{2} \text{subject to} | | \boldsymbol{d} | |_{2} = 1.\tag{2.69}
$$

The above formulation is the most direct way of performing the substitution but is not the most stylistically pleasing way to write the equation. It places the scalar value $\boldsymbol{d}^{\intercal}\boldsymbol{x}^{(i)}$ on the right of the vector d. Scalar coefficients are conventionally written on the left of vector they operate on. We therefore usually write such a formula as

$$
\boldsymbol{d}^{*} = \underset{\boldsymbol{d}}{\arg \min} \sum_{i} | | \boldsymbol{x}^{(i)} - \boldsymbol{d}^{\top} \boldsymbol{x}^{(i)} \boldsymbol{d} | |_{2}^{2} \text{subject to} | | \boldsymbol{d} | |_{2} = 1,\tag{2.70}
$$

or, exploiting the fact that a scalar is its own transpose, as

$$
\boldsymbol{d}^{*} = \underset{\boldsymbol{d}}{\arg \min} \sum_{i} | | \boldsymbol{x}^{(i)} - \boldsymbol{x}^{(i) \top} \boldsymbol{d} \boldsymbol{d} | |_{2}^{2} \text{subject to} | | \boldsymbol{d} | |_{2} = 1.\tag{2.71}
$$

The reader should aim to become familiar with such cosmetic rearrangements.

At this point, it can be helpful to rewrite the problem in terms of a single design matrix of examples, rather than as a sum over separate example vectors. This will enable us to use more compact notation. Let $X \in R^{m \times n}$ be the matrix defined by stacking all the vectors describing the points, such that $\boldsymbol{X}_{i,:} = \boldsymbol{x}^{(i)}^{\intercal}$ . We can now rewrite the problem as

$$
\boldsymbol{d}^{*} = \underset{\boldsymbol{d}}{\arg \min} | | \boldsymbol{X} - \boldsymbol{X} \boldsymbol{d} \boldsymbol{d}^{\top} | |_{F}^{2} \text{subject to} \boldsymbol{d}^{\top} \boldsymbol{d} = 1.\tag{2.72}
$$

Disregarding the constraint for the moment, we can simplify the Frobenius norm portion as follows:

$$
\underset{d}{\arg \min} | | \boldsymbol{X} - \boldsymbol{X} d \boldsymbol{d}^{\top} | |_{F}^{2}\tag{2.73}
$$

$$
= \underset{d}{\arg \min} \operatorname{Tr} \left(\left(\boldsymbol{X} - \boldsymbol{X} d \boldsymbol{d}^{\top}\right)^{\top} \left(\boldsymbol{X} - \boldsymbol{X} d \boldsymbol{d}^{\top}\right)\right)\tag{2.74}
$$

(by equation 2.49)

$$
= \underset{d}{\arg \min} \operatorname{Tr} \left(\boldsymbol{X}^{\top} \boldsymbol{X} - \boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top} - d \boldsymbol{d}^{\top} \boldsymbol{X}^{\top} \boldsymbol{X} + d \boldsymbol{d}^{\top} \boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top}\right)\tag{2.75}
$$

$$
= \underset{d}{\arg \min} \operatorname{Tr}(\boldsymbol{X}^{\top} \boldsymbol{X}) - \operatorname{Tr}(\boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top}) - \operatorname{Tr}(d \boldsymbol{d}^{\top} \boldsymbol{X}^{\top} \boldsymbol{X}) + \operatorname{Tr}(d \boldsymbol{d}^{\top} \boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top})\tag{2.76}
$$

$$
= \underset{d}{\arg \min} - \operatorname{Tr}(\boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top}) - \operatorname{Tr}(d \boldsymbol{d}^{\top} \boldsymbol{X}^{\top} \boldsymbol{X}) + \operatorname{Tr}(d \boldsymbol{d}^{\top} \boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top})\tag{2.77}
$$

(because terms not involving d do not affect the arg min)

$$
= \underset{d}{\arg \min} - 2 \operatorname{Tr} \left(\boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top}\right) + \operatorname{Tr} \left(d \boldsymbol{d}^{\top} \boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top}\right)\tag{2.78}
$$

(because we can cycle the order of the matrices inside a trace, equation 2.52)

$$
= \underset{d}{\arg \min} - 2 \operatorname{Tr}(\boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top}) + \operatorname{Tr}(\boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top} d \boldsymbol{d}^{\top})\tag{2.79}
$$

(using the same property again).

At this point, we reintroduce the constraint:

$$
\underset{d}{\arg \min} - 2 \operatorname{Tr}(\boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top}) + \operatorname{Tr}(\boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top} d \boldsymbol{d}^{\top}) \text{subject to} \boldsymbol{d}^{\top} \boldsymbol{d} = 1\tag{2.80}
$$

$$
= \underset{d}{\arg \min} - 2 \operatorname{Tr}(\boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top}) + \operatorname{Tr}(\boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top}) \text{subject to} \boldsymbol{d}^{\top} \boldsymbol{d} = 1\tag{2.81}
$$

(due to the constraint)

$$
= \underset{d}{\arg \min} - \operatorname{Tr}(\boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top}) \text{subject to} \boldsymbol{d}^{\top} \boldsymbol{d} = 1\tag{2.82}
$$

$$
= \underset{d}{\arg \max} \operatorname{Tr} \left(\boldsymbol{X}^{\top} \boldsymbol{X} d \boldsymbol{d}^{\top}\right) \text{subject to} \boldsymbol{d}^{\top} \boldsymbol{d} = 1\tag{2.83}
$$

$$
= \underset{d}{\arg \max} \operatorname{Tr}(\boldsymbol{d}^{\top} \dot{\boldsymbol{X}}^{\top} \boldsymbol{X} \boldsymbol{d}) \text{subject to} \boldsymbol{d}^{\top} \boldsymbol{d} = 1.\tag{2.84}
$$

This optimization problem may be solved using eigendecomposition. Specifically, the optimal d is given by the eigenvector of $X^{\top}X$ corresponding to the largest eigenvalue.

This derivation is specific to the case of l = 1 and recovers only the first principal component. More generally, when we wish to recover a basis of principal components, the matrix D is given by the l eigenvectors corresponding to the largest eigenvalues. This may be shown using proof by induction. We recommend writing this proof as an exercise.

Linear algebra is one of the fundamental mathematical disciplines necessary to understanding deep learning. Another key area of mathematics that is ubiquitous in machine learning is probability theory, presented next.

3


# 2012 Yau Mathematical Contest Final Interview individual

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/final-interview/yau-2012-final-interview-individual-applmath-individual.pdf).
> - Source: [official archive download page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2012-final-interview-individual-applmath-individual/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2012-final-interview-individual-applmath-individual-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

## INDIVIDUAL TEST / ORAL EXAM S.-T YAU COLLEGE MATH CONTESTS 2012

## Applied and Computational Mathematics

## Problem 1

^yau-2012-final-interview-individual-applmath-individual-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2012-final-interview-individual-applmath-individual-solutions.md#^yau-2012-final-interview-individual-applmath-individual-s1).

Let $f(x)$ defined on $[0, 1]$ be a smooth function with suficiently many derivatives. $x_{i} ~ = ~ ih$ , where $\begin{array}{r}{h \ = \ \frac{1}{N}} \end{array}$ and $i = 0, 1, \cdots, N$ are uniformly distributed points in $[0, 1]$ . What is the highest integer k such that the numerical integration formula

$$
I_{N} = \frac{1}{N} \left(a_{0}(f(x_{0}) + f(x_{N})) + a_{1}(f(x_{1}) + f(x_{N - 1})) + \sum_{i = 2}^{N - 2} f(x_{i})\right)\tag{1}
$$

is k-th order accurate, namely

$$
\left| I_{N} - \int_{0}^{1} f(x) dx \right| \leq Ch^{k}\tag{2}
$$

for a constant C independent of $h ?$ Please describe the procedure to obtain the two constants $a_{0}$ and $a_{1}$ for this k.

## Problem 2

^yau-2012-final-interview-individual-applmath-individual-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2012-final-interview-individual-applmath-individual-solutions.md#^yau-2012-final-interview-individual-applmath-individual-s2).

The classical Euclidean Algorithm to find the greatest common divisor $\operatorname{gcd}(m, n)$ of two positive integers $m < n$ requires only $O(\log n)$ arithmetic operation. However, it uses division with a reminder, which is a rather slow operation. Your task is to design and analyze a division-free algorithm.

More precisely, using that for non-zero integers k and l we have

$$
\begin{array}{l} \operatorname{gcd}(2k, 2l) = 2 \operatorname{gcd}(k, l), \\ \operatorname{gcd}(2k + 1, 2l) = \operatorname{gcd}(2k + 1, l), \\ \operatorname{gcd}(2k + 1, l) = \operatorname{gcd}(2k + 1 - l, l) \end{array}
$$

• design an eficient algorithm to compute $\operatorname{gcd}(m, n)$ that uses only subtraction and division by 2 (the latter is very fast as it is equivalent to a shift of the bit representation of the operand);

• give a motivated estimate on the complexity of your algorithm.

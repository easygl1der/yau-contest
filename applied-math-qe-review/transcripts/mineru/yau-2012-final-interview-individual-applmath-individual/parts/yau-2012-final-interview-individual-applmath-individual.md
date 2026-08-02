## INDIVIDUAL TEST / ORAL EXAM S.-T YAU COLLEGE MATH CONTESTS 2012

## Applied and Computational Mathematics

1. Let $f ( x )$ defined on $[ 0 , 1 ]$ be a smooth function with suficiently many derivatives. $x _ { i } ~ = ~ i h$ , where $\begin{array} { r } { h \ = \ \frac { 1 } { N } } \end{array}$ and $i = 0 , 1 , \cdots , N$ are uniformly distributed points in $[ 0 , 1 ]$ . What is the highest integer k such that the numerical integration formula

$$
I _ {N} = \frac {1}{N} \left(a _ {0} (f (x _ {0}) + f (x _ {N})) + a _ {1} (f (x _ {1}) + f (x _ {N - 1})) + \sum_ {i = 2} ^ {N - 2} f (x _ {i})\right)\tag{1}
$$

is k-th order accurate, namely

$$
\left| I _ {N} - \int_ {0} ^ {1} f (x) d x \right| \leq C h ^ {k}\tag{2}
$$

for a constant C independent of $h ?$ Please describe the procedure to obtain the two constants $a _ { 0 }$ and $a _ { 1 }$ for this k.

2. The classical Euclidean Algorithm to find the greatest common divisor $\operatorname* { g c d } ( m , n )$ of two positive integers $m < n$ requires only $O ( \log n )$ arithmetic operation. However, it uses division with a reminder, which is a rather slow operation. Your task is to design and analyze a division-free algorithm.

More precisely, using that for non-zero integers k and l we have

$$
\begin{array}{l} \operatorname * {g c d} (2 k, 2 l) = 2 \operatorname * {g c d} (k, l), \\ \operatorname * {g c d} (2 k + 1, 2 l) = \operatorname * {g c d} (2 k + 1, l), \\ \operatorname * {g c d} (2 k + 1, l) = \operatorname * {g c d} (2 k + 1 - l, l) \end{array}
$$

• design an eficient algorithm to compute $\operatorname* { g c d } ( m , n )$ that uses only subtraction and division by 2 (the latter is very fast as it is equivalent to a shift of the bit representation of the operand);

• give a motivated estimate on the complexity of your algorithm.
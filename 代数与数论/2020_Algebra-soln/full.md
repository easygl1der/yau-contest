# Algebra and Number Theory

Solve every problem.

Problem 1. Let $F$ be a field of characteristic zero. Consider the polynomial ring $F [ x _ { 1 } , \ldots , x _ { n } ]$ .

(a) Prove Newton’s identity over the field $F$

$$
p _ {k} - p _ {k - 1} e _ {1} + \dots + (- 1) ^ {k - 1} p _ {1} e _ {k - 1} + (- 1) ^ {k} k e _ {k} = 0,
$$

where

$$
e _ {k} \left(x _ {1}, \dots , x _ {n}\right) = \sum_ {1 \leq i _ {1} <   \dots <   \beta_ {k} \leq n} x _ {i _ {1}} \dots x _ {i _ {k}}
$$

for $1 \leq k \leq n$ , $e _ { 0 } = 1$ , $e _ { k } = 0$ when $k > n$ , and

$$
p _ {k} (x _ {1}, \dots , x _ {n}) = x _ {1} ^ {k} + \dots + x _ {n} ^ {k}.
$$

(b) Prove that over the field of $F$ of characteristic zero, an $n \times n$ matrix $A$ is nilpotent if and only if the trace of $A ^ { k }$ is equal to zero for all $k = 1 , 2 \ldots$

Hint: use Part (a).

(c) Prove that over the field of $F$ of characteristic zero, two $n \times n$ matrix $A$ and $B$ have the same characteristic polynomial if and only if the trace of $A ^ { k }$ and trace of $B ^ { k }$ are equal for all $k = 1 , 2 \dots$

Hint: use Part (a).

Solution: Part (a): Consider

$$
E (y) = \prod_ {i = 1} ^ {n} (1 - x _ {i} y) = 1 - e _ {1} y + e _ {2} y ^ {2} + \dots (- 1) ^ {n} e _ {n} y ^ {n}.
$$

Using $- \mathrm { l n } ( 1 - t ) = \sum _ { j = 1 } ^ { \infty } t ^ { j } / j$ , we obtain

$$
\ln (E (y)) = \sum_ {i = 1} ^ {n} \ln (1 - x _ {i} y) = - \sum_ {i = 1} ^ {n} \sum_ {j = 1} ^ {\infty} (x _ {i} y) ^ {j} / j = - \sum_ {j = 1} ^ {\infty} p _ {j} y ^ {j} / j.
$$

Apply $d / d y$ to the above, we have

$$
E ^ {\prime} (y) / E (y) = - \sum_ {j = 1} ^ {\infty} p _ {j} y ^ {j - 1}, \quad \text {o r} \quad - E ^ {\prime} (y) = E (y) \sum_ {j = 1} ^ {\infty} p _ {j} y ^ {j - 1}.
$$

By comparing the coefficients of $y ^ { k - 1 }$ of both sides, we obtain

$$
- (- 1) ^ {k} k e _ {k} = \sum_ {j = 0} ^ {k - 1} (- 1) ^ {j} e _ {j} p _ {k - j}.
$$

Part (b): Suppose $A$ is nilpotent. Then, the minimal polynomial of $A$ is $x ^ { r }$ for some integer $r$ . It follows that the characteristic of A is $f ( x ) = x ^ { n }$ . The trace of $A$ is equal to $a _ { n - 1 }$ where $- a _ { n - 1 }$ is the coefficient of $x ^ { n - 1 }$ of $f ( x )$ , hence is equal to 0. Similarly, $A ^ { k }$ is nilpotent, hence its trace is zero.

Conversely, assume trace of $A ^ { k }$ equals 0 for all $k \geq 1$ . If $\lambda$ is an eigenvalue of $A$ , then $\lambda ^ { k }$ is an eigenvalue of $A ^ { k }$ λ. Since the trace is the sum of eigenvalues, we see that (the sums of powers) $p _ { k } ( . . . , \lambda , . . . ) = 0$ . By Part (a), we see that $e _ { k } ( . . . , \lambda , . . . ) = 0$ . . . , . Since the coefficients of the characteristic polynomial $f ( t )$ . of $A$ are precisely $e _ { k } ( \dots , \lambda , \dots )$ . . .for $0 \leq k \leq n$ (possibly up to $\pm$ signs), we obtain $f ( t ) = t ^ { n }$ , hence $A ^ { n } = 0$ .

Part (c): Suppose that $A$ and $B$ have the same characteristic polynomials. Let $\lambda _ { A }$ (resp. $\lambda _ { B }$ ) be an eigenvalue of A (resp. B). Then, $e _ { k } ( . . . , \lambda _ { A } , . . . ) = e _ { k } ( . . . , \lambda _ { B } , . . . )$ for all $k \geq 0$ . By (a), $p _ { k } ( . . . , \lambda _ { A } , . . . ) = p _ { k } ( . . . , \lambda _ { B } , . . . )$ . Since the trace is the sum of eigenvalues, we obtain the trace of $A ^ { k }$ and trace of $B ^ { k }$ are equal. Conversely, if the trace of $A ^ { k }$ and trace of $B ^ { k }$ are equal for all $k$ , then $p _ { k } ( . . . , \lambda _ { A } , . . . ) \ = \ p _ { k } ( . . . , \lambda _ { B } , . . . )$ . Hence, $e _ { k } ( . . . , \lambda _ { A } , . . . ) = e _ { k } ( . . . , \lambda _ { B } , . . . )$ for all $k \geq 0$ . Thus, $A$ and $B$ have the same characteristic polynomials.

# Problem 2.

(a) Let $M$ be a finitely generated $R$ -module and ${ \mathfrak { a } } \subset R$ an ideal. Suppose $\phi : M \to M$ is an $R$ -module map such that $\phi ( M ) \subseteq \mathfrak { a } M$ φ. Prove that there is a monic polynomial $p ( t ) \subset R [ t ]$ φwith coefficients from a such that $p ( \phi ) = 0$ .

Hint: $p ( t )$ is basically just the characteristic polynomial.

(b) If $M$ is a finitely generated $R$ -module such that ${ \mathfrak { a } } M = M$ for some ideal ${ \mathfrak { a } } \subset R$ , then there exits $x \in R$ such that $1 - x \in { \mathfrak { a } }$ and $x M = 0$ .

Solution: Part (a): Let $x _ { 1 } , \ldots , x _ { m }$ be a generating set for $M$ as an $R$ -module. We have

$$
\phi (x _ {i}) = \sum a _ {i j} x _ {j}
$$

for some $a _ { i j } \in \mathfrak { a }$ . Let $A _ { i j }$ be the operator $\delta _ { i j } \phi - a _ { i j } \mathrm { I d _ { M } }$ where $\operatorname { I d } _ { \mathrm { M } } : M \to M$ is the identity hom and $\delta _ { i j }$ is the Kronecker’s symbol. Then we have $\begin{array} { r } { \sum _ { j } A _ { i j } x _ { j } = 0 } \end{array}$ for all $j$ . The matrix $A = ( A _ { i j } )$ δannihilates the column vector $\nu = ( x _ { j } ) _ { j = 1 } ^ { m }$ , Consider $M$ as an $R [ \phi ]$ -module, then $A _ { i j } \in R [ \phi ]$ . Thus, $A$ is a matrix with entries in $R [ \phi ]$ Its adjugate is well-defined. Multiplying $A \nu = 0$ φ on the left by the adjugate gives rise to detA $x _ { j } = 0$ for all $j$ . Let $p ( \phi ) = \operatorname* { d e t } A ( \phi )$ (recall $A = ( \delta _ { i j } \phi - a _ { i j } \mathrm { I d } _ { \mathrm { M } } ) )$ . Then, $p ( t )$ is a monic polynomial and $p ( \phi ) = 0$ on $M$ .

Part (b): By Part (a), $\operatorname { I d } _ { \mathrm { M } } : M \to M$ satisfies

$$
\mathrm {I d} _ {\mathrm {M}} ^ {r} + a _ {1} \mathrm {I d} _ {\mathrm {M}} ^ {r - 1} + \dots + a _ {r} \mathrm {I d} _ {\mathrm {M}} = 0
$$

for some $a _ { j } \in \mathfrak { a }$ . Let $x = 1 + a _ { 1 } + \cdots + a _ { r }$ , then $x - 1 \in { \mathfrak { a } }$ and $x M = 0$

Problem 3. Let $R = F [ x , y ] / ( y ^ { 2 } - x ^ { 2 } - x ^ { 3 } )$ for some field $F$ .

(a) Prove that $R$ is an integral domain.   
(b) Compute the normalization of $R$ (i.e., the integral closure of $R$ in its field of fraction).

Solution: Part (a): It suffices to prove that $y ^ { 2 } - x ^ { 2 } - x ^ { 3 }$ is irreducible in $F ( x ) [ y ]$ . It is reducible if it has a root $f ( x ) / g ( x ) \in F ( x )$ , where $f ( x )$ and $g ( x )$ are co-prime. But $( f ( x ) / g ( x ) ) ^ { 2 } - x ^ { 2 } - x ^ { 3 } = 0$ implies $f ( x ) ^ { 2 } = g ( x ) ^ { 2 } ( x ^ { 2 } + x ^ { 3 } ) = ( g ( x ) x ) ^ { 2 } ( x + 1 )$ . Thus, $( x + 1 )$ divides $f ( x )$ . Hence, $( x + 1 ) ^ { 2 }$ divides $f ( x ) ^ { 2 }$ . It follows that $( x + 1 )$ divides $g ( x )$ , a contradiction. This implies that $R$ is an integral domain.

Part (b): We have $0 = y ^ { 2 } - x ^ { 3 } - x ^ { 2 } = x ^ { 2 } ( y ^ { 2 } / x ^ { 2 } - x - 1 ) = x ^ { 2 } ( t ^ { 2 } - x - 1 )$ . As $K$ is an integral domain, $t ^ { 2 } - x - 1 = 0$ , that is, $x = t ^ { 2 } - 1$ . Then $y = x y / x = ( t ^ { 2 } - 1 ) t$ . It follows that any element of $R$ is a polynomial in $t$ , hence $R \subset F [ t ]$ . Therefore $K \subset F ( t )$ . Thus, $K = F ( t )$ .

Now let $s$ be the integral closure of $R$ in $K$ . We claim $S = F [ t ]$ . Let $f ( t ) \in F [ t ]$ . Let $s = 2 k$ be an even integer. Then

$$
t ^ {s} = (t ^ {2}) ^ {k} = ((t ^ {2} - 1) + 1) ^ {k} = \sum_ {i = 0} ^ {k} {\binom {k} {i}} (t ^ {2} - 1) ^ {i} = \sum_ {i = 0} ^ {k} {\binom {k} {i}} x ^ {i}.
$$

Let $s = 2 k + 1$ be an odd integer with $s > 3$ , using the above, we obtain

$$
t ^ {s} = t ^ {s} - t ^ {s - 2} + t ^ {s - 2} = t ^ {s - 3} (t ^ {2} - 1) t + t ^ {s - 2} = \left(\sum_ {i = 0} ^ {k - 1} \binom {k - 1} {i} x ^ {i}\right) y + t ^ {s - 2}.
$$

Repeat the above for the odd integer $s - 2$ , by induction, we see that $t ^ { s }$ is of the form $g ( x , y ) + a t$ . Combing all the above, we see that $f ( t )$ is of the form $h ( x , y ) + b t$ for some $b \in \mathbb { Z }$ and $h ( x , y ) \in R$ ,. Then, $f ( t )$ is a root of

$$
(X - h (x, y)) ^ {2} - b ^ {2} - b ^ {2} x \in R [ X ].
$$

it follows that $f ( t ) \in S$ . Hence, $F [ t ] \subset S$ . But, $R \subset F [ t ]$ and $F [ t ]$ is integrally closed in $F ( t )$ , hence $S \subset F [ t ]$ . Therefore $S = F [ t ]$ .

Problem 4. Let $p$ and $\ell$ be two prime numbers and $[ \ell _ { x } ]$ denote the $\ell$ -th cyclotomic polynomial $1 + x + \cdot \cdot \cdot + x ^ { \ell - 1 }$ .

(a) Prove that $[ \ell _ { x } ]$ is an irreducible element of $\mathbb { Q } [ x ]$ .   
(b) Show that $[ \ell _ { x } ]$ is divisible by $x - 1$ in $\mathbb { F } _ { p } [ x ]$ if $p = \ell$ . Here $\mathbb { F } _ { p }$ is the finite field $\mathbb { Z } / p \mathbb { Z }$ .   
(c) Suppose $p \neq \ell$ . let $a$ be the order of $p$ in $\mathbb { F } _ { \ell }$ . Show that $a$ is the first value of $m$ for which the group $\mathrm { G L } _ { m } ( \mathbb { F } _ { p } )$ of invertible $m \times m$ `matrices with entries from $\mathbb { F } _ { p }$ contains an element of order $\ell$ .

Hint: Derive and use the formula for the number of elements in $\mathrm { G L } _ { m } ( \mathbb { F } _ { p } )$

Solution: Part (a): $[ \ell _ { x } ]$ is irreducible over $\mathbb { Q }$ if and only if $\left[ \ell _ { x + 1 } \right]$ is irreducible $\mathbb { Q }$ .

$$
[ \ell_ {x + 1} ] = ((x + 1) ^ {\ell} - 1) / ((x + 1) - 1) = x ^ {\ell - 1} + \ell x ^ {\ell - 2} + \dots + \ell (\ell - 1) / 2 x + \ell .
$$

This is irreducible by Eisenstein’s criterion.

Part (b): $p = \ell$ . If $p = 2$ , then $[ 2 ] _ { x } = 1 + x = x - 1$ If $p > 2$ , then

$$
[ p ] _ {x} = (x ^ {p} - 1) / (x - 1) = (x - 1) ^ {p - 1}.
$$

Part (c): Let $e _ { 1 } , \ldots , e _ { m }$ be the standard basis of $\mathbb { F } _ { q } ^ { n }$ , where $q$ is a prime power. If $A \ \in \ { \mathrm { G L } } _ { m } ( \mathbb { F } _ { q } )$ , then the columns of $A$ . ., $\{ A e _ { 1 } , . . . , A e _ { n } \}$ , form a basis for $\mathbb { F } _ { q } ^ { n }$ . Conversely, any basis form columns of an element $A \ \in \ { \mathrm { G L } } _ { m } ( \mathbb { F } _ { q } )$ , . . . ,. Thus, it is equivalent to count the number of bases $\boldsymbol { \mathcal { B } } = ( f _ { 1 } , \ldots , f _ { n } )$ for $\mathbb { F } _ { q } ^ { n }$ . The first vector has $q ^ { m } - 1$ choices. The second, not a multiple of the first, has $q ^ { m } - q$ . . . ,choices. The third vector ${ f _ { 3 } } \in \mathbb { F } _ { q } ^ { n } \setminus \{ a { f _ { 1 } } + b { f _ { 2 } } \mid a , b \in \mathbb { F } _ { q } \}$ has $q ^ { m } - q ^ { 2 }$ choices. Inductively, $f _ { i }$ has $q ^ { m } - q ^ { i }$ choices. Therefore

$$
\left| \mathrm {G L} _ {m} (\mathbb {F} _ {q}) \right| = (q ^ {m} - 1) (q ^ {m} - q) \dots (q ^ {m} - q ^ {m - 1}).
$$

If $\mathrm { G L } _ { m } ( \mathbb { F } _ { p } )$ contains an element of order $\ell$ , then $\ell$ divides

$$
| \mathrm {G L} _ {m} (\mathbb {F} _ {p}) | = p ^ {\binom {m} {2}} \prod_ {i = 1} ^ {m} (p ^ {i} - 1).
$$

Sicne $\ell \neq p$ , the first value of $m$ such that $\ell$ divides the above is when $\ell$ divides the highest term $p ^ { m } - 1$ for the first time. This happens when $p ^ { a } - 1 = 0 { \bmod { \ell } } .$ .

Problem 5. Let $p \geq 3$ be a prime number and let $\mathbb { Z } _ { p }$ be the ring of $p$ -adic integers.

(a) Show that an element in $1 + p \mathbb { Z } _ { p }$ is a $p$ -th power in $\mathbb { Z } _ { p }$ if and only if it lives in $1 + p ^ { 2 } \mathbb { Z } _ { p }$   
(b) Let $\mathbb { Z } _ { p } ^ { \times }$ denote the group of units in $\mathbb { Z } _ { p }$ . Show that there exist $a , b , c \in \mathbb { Z } _ { p } ^ { \times }$ such that $a ^ { p } + b ^ { p } = c ^ { p }$ if and only if

$$
\sum_ {i = 1} ^ {p - 1} i ^ {p - 2} t ^ {i} \equiv 0 (\mathrm {m o d} p)
$$

for some integer $t \in \{ 2 , 3 , . . . , p - 1 \}$ . (In particular, this condition holds for $p = 7$ by taking $t = 3$ , , . . . ,. Therefore, Fermat’s Last Theorem does not hold for $\mathbb { Z } _ { 7 }$ .)

Solution: Part (a): If an element in $1 + p \mathbb { Z } _ { p }$ is a $p$ -th power, it must have form $( 1 + p \alpha ) ^ { p }$ for some $\alpha \in \mathbb { Z } _ { p }$ . A simple calculation yields

$$
(1 + p \alpha) ^ {p} = 1 + \binom {p} {1} p \alpha + \binom {p} {2} (p \alpha) ^ {2} + \dots \in 1 + p ^ {2} \mathbb {Z} _ {p}.
$$

To prove sufficiency, recall the two functions

$$
\exp : p \mathbb {Z} _ {p} \to 1 + p \mathbb {Z} _ {p}, \quad \log : 1 + p \mathbb {Z} _ {p} \to p \mathbb {Z} _ {p}
$$

which are inverses to each other. For any $a = 1 + p ^ { 2 } x \in 1 + p ^ { 2 } \mathbb { Z } _ { p }$ , consider

$$
a ^ {\frac {1}{p}} := \exp \left(\frac {1}{p} \log (a)\right).
$$

Notice that

$$
\frac {1}{p} \log (a) = \frac {1}{p} \log \left(1 + p ^ {2} x\right) = \frac {1}{p} \sum_ {i = 1} ^ {\infty} \frac {(- 1) ^ {i - 1}}{i} \left(p ^ {2} x\right) ^ {i} \in p \mathbb {Z} _ {p}
$$

and hence $a ^ { \frac { 1 } { p } }$ is well-defined. It is clear that $\left( a ^ { \frac { 1 } { p } } \right) ^ { p } = a$

Part (b): As an immediate corollary from Part (a), if we write an element $a \in \mathbb { Z } _ { p } ^ { \times }$ in terms of Witt coordinates $a = ( a _ { 0 } , a _ { 1 } , \ldots )$ , then $a$ is a $p$ -th power in $\mathbb { Z } _ { p }$ if and only if $a _ { 1 } = 0$ . In particular, whether an element in $\mathbb { Z } _ { p } ^ { \times }$ is a $p$ , , . . .-th power can be detected by its image under the projection $\mathbb { Z } _ { p } = W ( \mathbb { F } _ { p } )  W _ { 2 } ( \mathbb { F } _ { p } )$ .

Hence, there exist $a , b , c \in \mathbb { Z } _ { p } ^ { \times }$ such that $a ^ { p } + b ^ { p } = c ^ { p }$ if and only if there exist $a _ { 0 } , b _ { 0 } , c _ { 0 } \in \mathbb { F } _ { p } ^ { \times }$ such that $( a _ { 0 } , 0 ) + ( b _ { 0 } , 0 ) = ( c _ { 0 } , 0 )$ in $\dot { W } _ { 2 } ( \mathbb { F } _ { p } )$ , ,. Using the addition formula of Witt coordinates, the later equation , ,translates to $a _ { 0 } + b _ { 0 } = c _ { 0 }$ and

$$
\frac {1}{p} \left(a _ {0} ^ {p} + b _ {0} ^ {p} - (a _ {0} + b _ {0}) ^ {p}\right) = 0.
$$

Direct calculation gives

$$
\begin{array}{l} \frac {1}{p} (a _ {0} ^ {p} + b _ {0} ^ {p} - (a _ {0} + b _ {0}) ^ {p}) = - \sum_ {i = 1} ^ {p - 1} \frac {1}{p} \binom {p} {i} a _ {0} ^ {i} b _ {0} ^ {p - i} \\ = - \sum_ {i = 1} ^ {p - 1} \frac {1}{i} \frac {(p - 1) (p - 2) \cdots (p - i + 1)}{(i - 1) \cdots 1} a _ {0} ^ {i} b _ {0} ^ {p - i} \\ \equiv \sum_ {i = 1} ^ {p - 1} \frac {1}{i} (- 1) ^ {i} a _ {0} ^ {i} b _ {0} ^ {p - i} \equiv \sum_ {i = 1} ^ {p - 1} i ^ {p - 2} \left(- \frac {a _ {0}}{b _ {0}}\right) ^ {i} (\mathrm {m o d} p) \\ \end{array}
$$

Since $a _ { 0 } + b _ { 0 } = c _ { 0 } \neq 0$ , we have $- \frac { a _ { 0 } } { b _ { 0 } } \neq 1$ . Namely, there exists $t \in \{ 2 , 3 , \dotsc , p - 1 \}$ such that

$$
\sum_ {i = 1} ^ {p - 1} i ^ {p - 2} t ^ {i} \equiv 0 (\mathrm {m o d} p).
$$

All steps above are clearly reversible and hence cover both the “if” and “only if” parts. This completes the proof.

Problem 6. Recall that a metric space is called spherically complete if any decreasing sequence of closed balls has nonempty intersection.

Let $p$ be a prime number and let $\mathbb { Q } _ { p }$ be the field of $p$ -adic numbers. For every integer $n \geq 1$ , consider the finite extension $\mathbb { Q } _ { p } ( \mu _ { p ^ { n } } )$ of $\mathbb { Q } _ { p }$ generated by all $p ^ { n }$ -th roots of unity. Let $\mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } ) =$

$\cup _ { n \geq 1 } \mathbb { Q } _ { p } ( \mu _ { p ^ { n } } )$ . All of these algebraic extensions of $\mathbb { Q } _ { p }$ are equipped with the unique norm | · | µextending the usual $p$ -adic norm on $\mathbb { Q } _ { p }$ .

Question: Which of the following are spherically complete? Explain why.

(a) $\mathbb { Q } _ { p }$   
(b) $\mathbb { Q } _ { p } ( \mu _ { p ^ { n } } )$   
(c) $\mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } )$   
(d) $\overline { { \mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } ) } }$ , the completion of $\mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } )$ .

Hint: Show that there exists a sequence $a _ { 1 } , a _ { 2 } , . . . \in \widehat { \mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } ) }$ such that $| a _ { 1 } | > | a _ { 2 } | > \cdots$ and $\operatorname* { l i m } | a _ { i } | > 0$ , and such that the closed balls

$$
B _ {i} := \left\{x \in \overline {{\mathbb {Q} _ {p} \left(\mu_ {p ^ {\infty}}\right)}}: | x - a _ {1} - a _ {2} - \dots - a _ {i} | \leq | a _ {i} | \right\}
$$

have empty intersection.

Solution: (a) and (b) are spherically complete. In fact, every finite extension of $\mathbb { Q } _ { p }$ is spherically complete. Such a field is discretely valued and complete. In this case, a decreasing sequence of closed balls either eventually stabilizes, or has radius converging to 0. In both cases, the intersection is nonempty.

(c) is not spherically complete. Notice that spherical completeness implies completeness. (Why? From any Cauchy sequence, one can construct a decreasing sequence of closed balls whose intersection gives the limit of the Cauchy sequence.) However, it is well-known that $\mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } )$ is not complete, hence not spherically complete.   
(d) is not spherically complete. Assume that $\overline { { \mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } ) } }$ is spherically complete. Notice that

$$
\left| \overline {{\mathbb {Q} _ {p} \left(\mu_ {p ^ {\infty}}\right)}} \right| = 0 \cup \left\{p ^ {\frac {m}{p ^ {n} (p - 1)}}: m \in \mathbb {Z}, n \geq 0 \right\}.
$$

In particular, $\overline { { \mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } ) } }$ is not discretely valued. Choose and fix a sequence of negative rational numbers $r _ { 1 } > r _ { 2 } > \cdots$ µ such that

$$
r _ {i} \in \left\{- \frac {m}{p ^ {n} (p - 1)}: m \in \mathbb {Z} _ {> 0}, n \geq 0 \right\}
$$

and $r : = \operatorname* { l i m } _ { i } r _ { i }$ exists. We can find a sequence of elements $a _ { 1 } , a _ { 2 } , . . . \in \overline { { \mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } ) } }$ such that $| a _ { i } | = p ^ { r _ { i } }$ for all $i$ . In particular, we have $| a _ { 1 } | > | a _ { 2 } | > \cdots$ and lim $| a _ { i } | = p ^ { r } > 0$ , , . . . µ. Consider closed balls

$$
B _ {i} := \left\{x \in \overline {{\mathbb {Q} _ {p} \left(\mu_ {p ^ {\infty}}\right)}}: | x - a _ {1} - a _ {2} - \dots - a _ {i} | \leq | a _ {i} | \right\}.
$$

If $| x - a _ { 1 } - a _ { 2 } - \cdot \cdot \cdot - a _ { i + 1 } | \leq | a _ { i + 1 } |$ , then

$$
\left| x - a _ {1} - a _ {2} - \dots - a _ {i} \right| \leq \left| a _ {i + 1} \right| <   \left| a _ {i} \right|.
$$

This means $B _ { 1 }  B _ { 2 }  \cdots$ is a strictly decreasing sequence of closed balls. By assumption, $B : = \cap _ { i = 1 } ^ { \infty } B _ { i }$ is nonempty. It is necessarily an open subset of $\overline { { \mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } ) } }$ , and hence contains at least an element $q \in \mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } )$ .

Now, we vary $\boldsymbol { a } = ( a _ { 1 } , a _ { 2 } , \dots )$ and write “ $B _ { a }$ ,” $" q _ { a } \ : ^ { , }$ instead of “B,” “q.” Running through all possible $a$ ’s, we , , . . .obtain uncountably many disjoint $B _ { a }$ ’s. (Why? If two a’s have the same $a _ { 1 } , \dotsc , a _ { i - 1 }$ but $| a _ { i } - a _ { i } ^ { \prime } | > | a _ { i + 1 } |$ , then the two $B _ { i + 1 }$ ’s are disjoint.) On the other hand, from each of these $B _ { a }$ , . . . ,, we have an element

$$
q _ {a} \in B _ {a} \cap \mathbb {Q} _ {p} (\mu_ {p ^ {\infty}}).
$$

These $q _ { a }$ ’s map to distinct elements in $\mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } ) / ( s )$ where $s \in \mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } )$ has $0 < | s | \le p ^ { r }$ . However, $\mathbb { Q } _ { p } ( \mu _ { p ^ { \infty } } ) / ( s )$ is a countable set, a contradiction.
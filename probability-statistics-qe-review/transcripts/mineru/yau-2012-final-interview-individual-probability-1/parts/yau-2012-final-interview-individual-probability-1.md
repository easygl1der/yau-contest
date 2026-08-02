## 2012 S. T. Yau College Math Contests Oral Exam on Probability

## August 4, morning

Problem. Take two points ξ and η randomly and independently with respect to the uniform distribution from the unit interval [0, 1]. Then in general these two points divide the interval [0, 1] into three subintervals with lengths X, Y and Z, respectively.

(1) What is the probability that X, Y and Z constitute the lengths of three sides of a triangle in the plane?

(2) What are the probability distributions of X, Y and Z?

## 2012 S. T. Yau College Math Contests Oral Exam on Probability

August 4, afternoon

Problem. Suppose that $\{ \xi _ { k } \}$ are independent and identically distributed random variables with uniform distribution on the interval [0, 1]. Let

$$
Y = \max _ {1 \leq k \leq n} \xi_ {k}.
$$

(1) What is the joint distribution of $( \xi _ { 1 } , Y ) ?$

(2) Evaluate the probability $\mathrm { P } ( \xi _ { 1 } = Y )$ .

(3) Evaluate the conditional expectation $\mathrm { E } ( \xi _ { 1 } | Y )$

## 2012 S. T. Yau College Math Contests Oral Exam on Probability

## August 5, morning

Problem. Discuss the following issue by constructing an appropriate probability model. You may make some further reasonable assumptions.

Suppose that there are 1000 persons, and only one of them is your ideal friend. Suppose that when you meet a person which is your ideal friend, you can identify whether he/she is your ideal friend with a success probability 99/100, and when you meet a person who is not your ideal friend, you may wrongly identify him/her as your ideal friend with a probability 1/100. Now if you have already met a person that you regard as an ideal friend, what is the probability that this person REALLY is your ideal friend?

## 2012 S. T. Yau College Math Contests Oral Exam on Probability

August 5, afternoon

Problem. Let $\{ X _ { n } \}$ be independent and identically distributed random variables with expectation EX, variance DX < ∞ and characteristic function $\phi _ { X } ( t )$ , respectively. Let N be a non-negative integer valued random variable with expectation EN, variance $\ Ḋ \mathrm Ḋ N Ḍ Ḍ < \infty$ and characteristic function $\phi _ { N } ( t )$ , respectively. Furthermore, $\{ X _ { n } \}$ and N are independent. Let $\begin{array} { r } { Y = \sum _ { k = 1 } ^ { N } X _ { k } } \end{array}$

(1) What is the characteristic function of $Y ?$

(2) Evaluate the variance of Y.

## Solutions to 2012 S. T. Yau College Math Contests Oral Exam on Probability

## August 4, morning

Problem. Take two points ξ and η randomly and independently with respect to the uniform distribution from the unit interval [0, 1]. Then in general these two points divide the interval [0, 1] into three subintervals with lengths X, Y and Z, respectively.

(1) What is the probability that X, Y and Z constitute the lengths of three sides of a triangle in the plane?

(2) What are the probability distributions of X, Y and $Z ?$

## Solution

(1) If $0 \leq \xi < \eta .$ , then the lengths of the three subintervals are $\xi , \eta - \xi$ and $1 - \eta$ , respectively. These constitute the lengths of three sides of a triangle is equivalent to

$$
\begin{array}{r c l} \xi + (\eta - \xi) & > & 1 - \eta , \\ (\eta - \xi) + (1 - \eta) & > & \xi , \\ \xi + (1 - \eta) & > & \eta - \xi , \end{array}
$$

which are further equivalent to

$$
\xi <   \frac {1}{2}, \quad \eta - \xi <   \frac {1}{2}, \quad \eta > \frac {1}{2}.
$$

These constraints form a region with area $1 / 8 .$

By symmetry, the probability that X, Y and Z constitute the lengths of three sides of a triangle in the plane is $1 / 8 + 1 / 8 = 1 / 4$

(2) We have

$$
X = \min \{\xi , \eta \}, Y = | \xi - \eta |, Z = 1 - \max \{\xi , \eta \}.
$$

The distribution of X is

$$
\begin{array}{r c l} F _ {X} (x) & := & \mathrm{P} (\min \{\xi , \eta \} \leq x) \\ & = & 1 - \mathrm{P} (\min \{\xi , \eta \} > x) \\ & = & 1 - \mathrm{P} (\xi > x) \mathrm{P} (\eta > x) \\ & = & 1 - (1 - x) ^ {2}, \quad x \in [ 0, 1 ]. \end{array}
$$

The distribution of Y is

$$
\begin{array}{r c l} F _ {Y} (y) & := & \mathrm{P} (| \xi - \eta | \leq y) \\ & = & \int \int_ {- y \leq t - s \leq y} d t d s \\ & = & 1 - (1 - y) ^ {2}, \quad y \in [ 0, 1 ]. \end{array}
$$

The distribution of Z is

$$
\begin{array}{r c l} F _ {Z} (z) & := & \mathrm{P} (1 - \max \{\xi , \eta \} \leq z) \\ & = & \mathrm{P} (\max \{\xi , \eta \} \geq 1 - z) \\ & = & 1 - \mathrm{P} (\max \{\xi , \eta \} <   1 - z) \\ & = & 1 - \mathrm{P} (\xi <   1 - z) \mathrm{P} (\eta <   1 - z) \\ & = & 1 - (1 - z) ^ {2}, \quad z \in [ 0, 1 ]. \end{array}
$$

## August 4, afternoon

Problem. Suppose that $\{ \xi _ { k } \}$ are independent and identically distributed random variable with uniform distribution on the interval [0, 1]. Let

$$
Y = \max _ {1 \leq k \leq n} \xi_ {k}.
$$

(1) What is the joint distribution of $( \xi _ { 1 } , Y ) ?$

(2) Evaluate the probability $\mathrm { P } ( \xi _ { 1 } = Y )$ .

(3) Evaluate the conditional expectation $\operatorname { E } ( \xi _ { 1 } | Y )$

## Solution

(1) The joint distribution of $( \xi _ { 1 } , Y )$ is

$$
\begin{array}{r c l} F _ {\xi_ {1}, Y} (x, y) & := & \mathrm{P} (\xi_ {1} \leq x, \max _ {1 \leq k \leq n} \xi_ {k} \leq y) \\ & = & \mathrm{P} (\xi_ {1} \leq x, \xi_ {2} \leq y, \dots , \xi_ {n} \leq y) \\ & = & x y ^ {n - 1}, \qquad 0 \leq x \leq y \leq 1. \end{array}
$$

(2) By symmetry, we have $\operatorname { P } ( \xi _ { 1 } = Y ) = \operatorname { P } ( \xi _ { 2 } = Y ) = \dots = \operatorname { P } ( \xi _ { n } = Y )$ . But

$$
\sum_ {k = 1} ^ {n} \mathrm{P} (\xi_ {k} = Y) = 1.
$$

Therefore $\begin{array} { r } { \mathrm { P } ( \xi _ { 1 } = Y ) = \frac { 1 } { n } } \end{array}$

(3) The distribution of Y is $F _ { Y } ( y ) : = { \mathrm { P } } ( \operatorname* { m a x } _ { 1 \leq k \leq n } \xi _ { k } \leq y ) = y ^ { n } , \quad y \in [ 0 ,$ , 1]. The conditional distribution of $\xi _ { 1 }$ under Y is $\begin{array} { r } { F ( x | y ) = \frac { n - 1 } { n } \cdot \frac { x } { y } } \end{array}$ for $0 < x < y$ , and $F ( x | y ) = 1$ for $1 \geq x \geq y \geq 0$ Therefore

$$
\begin{array}{r c l} E (\xi_ {1} | Y = y) & = & \frac {1}{n} y + \int_ {0} ^ {y} x \cdot \frac {n - 1}{n} \cdot \frac {1}{y} d x \\ & = & \frac {1}{n} y + \frac {n - 1}{2 n} y \\ & = & \frac {n + 1}{2 n} y, \end{array}
$$

and $\begin{array} { r } { \operatorname { E } ( \xi _ { 1 } | Y ) = \frac { n + 1 } { 2 n } Y . } \end{array}$

## August 5, morning

Problem. Discuss the following issue by constructing an appropriate probability model. You may make some further reasonable assumptions.

Suppose that there are 1000 persons, and only one of them is your ideal friend. Suppose that when you meet a person which is your ideal friend, you can identify whether he/she is your ideal friend with a success probability 99/100, and when you meet a person who is not your ideal friend, you may wrongly identify him/her as your ideal friend with a probability 1/100. Now if you have already met a person that you regard as an ideal friend, what is the probability that this person REALLY is your ideal friend?

## Solution

Let P(+) denote the probability that you meet an ideal friend, P(−) the probability that the person you meet is not your ideal friend, then

$$
\mathrm{P} (+) = 1 / 1 0 0 0, \quad \mathrm{P} (-) = 9 9 9 / 1 0 0 0.
$$

Let $\mathrm { P } ( ^ { 6 6 } + ^ { 7 7 } )$ denote the probability that you meet a person and identify him/her as your ideal friend and $\mathrm { P } ( ^ { 6 6 } - { } ^ { 7 9 } )$ denote the probability that you meet a person and do not regard him/her as an ideal friend. Let $\mathrm { P } ( ^ { \ast } + { } ^ { \ast } | - )$ denote the conditional probability that you regard a person as your ideal friend while in fact he/she is not, and other conditional probabilities are defined similarly. Then

$$
\mathrm{P} \left(^ {\prime \prime} + ^ {\prime \prime} | +\right) = 9 9 / 1 0 0, \quad \mathrm{P} \left(^ {\prime \prime} - ^ {\prime \prime} | +\right) = 1 / 1 0 0.
$$

$$
\mathrm{P} \left(^ {\prime \prime} + ^ {\prime \prime} | -\right) = 1 / 1 0 0, \quad \mathrm{P} \left(^ {\prime \prime} - ^ {\prime \prime} | -\right) = 9 9 / 1 0 0.
$$

What we need to calculate is in fact the conditional probability $\mathrm { P } ( + | ^ { 6 6 } + ^ { 7 7 } )$ , that is, the probability that the person you identify as an ideal friend is really your ideal friend. This can be evaluated by the Bayesian formula as follows:

$$
\begin{array}{r c l} \mathrm{P} (+ | “ + ”) & = & \frac {\mathrm{P} (+ , “ + ”)}{\mathrm{P} (“ + ”)} \\ & = & \frac {\mathrm{P} (+) \mathrm{P} (“ + ” | +)}{\mathrm{P} (+) \mathrm{P} (“ + ” | +) + \mathrm{P} (-) \mathrm{P} (“ + ” | -)} \\ & = & \frac {\frac {1}{1 0 0 0} \times \frac {9 9}{1 0 0}}{\frac {1}{1 0 0 0} \times \frac {9 9}{1 0 0} + \frac {9 9 9}{1 0 0 0} \times \frac {1}{1 0 0}} \\ & = & 1 1 / 1 2 2 \approx 0. 0 9 0. \end{array}
$$

August $5 ,$ afternoon

Problem. Let $\{ X _ { n } \}$ be independent and identically distributed random variables with expectation EX, variance $\mathrm Ḋ X Ḍ < \infty Ḍ$ and characteristic function $\phi _ { X } ( t )$ , respectively. Let N be a non-negative integer valued random variable with expectation EN, variance $\ Ḋ \mathrm Ḋ N Ḍ Ḍ < \infty$ and characteristic function $\phi _ { N } ( t )$ , respectively. Furthermore, $\{ X _ { n } \}$ and N are independent. Let $\begin{array} { r } { Y = \sum _ { k = 1 } ^ { N } X _ { k } } \end{array}$

(1) What is the characteristic function of Y?

(2) Evaluate the variance of Y.

## Solution

(1) The characteristic function of Y is

$$
\begin{array}{r c l} \phi_ {Y} (t) & := & \mathrm{E} e ^ {i t \sum_ {k = 1} ^ {N} X _ {k}} \\ & = & \mathrm{E} (\mathrm{E} (e ^ {i t \sum_ {k = 1} ^ {N} X _ {k}} | N)) \\ & = & \mathrm{E} ((\phi_ {X} (t)) ^ {N}). \end{array}
$$

(2) We have

$$
\begin{array}{r} \phi_ {Y} ^ {\prime} (t) = \mathrm{E} \{N (\phi_ {X} (t)) ^ {N - 1} \phi_ {X} ^ {\prime} (t) \}, \\ \phi_ {Y} ^ {\prime \prime} (t) = \mathrm{E} \{N (N - 1) (\phi_ {X} (t)) ^ {N - 2} (\phi_ {X} ^ {\prime} (t)) ^ {2} + N (\phi_ {X} (t)) ^ {N - 1} \phi_ {X} ^ {\prime \prime} (t) \}. \end{array}
$$

Therefore, buy putting $t = 0$ , we have

$$
\mathrm{E} Y = \mathrm{E} N \cdot \mathrm{E} X,
$$

and

$$
\mathrm{E} Y ^ {2} = \mathrm{E} \{N (N - 1) (\mathrm{E} X) ^ {2} + N \mathrm{E} X ^ {2} \},
$$

from which we obtain

$$
\mathsf {D} Y = \mathsf {E} Y ^ {2} - (\mathsf {E} Y) ^ {2} = \mathsf {D} N \cdot (\mathsf {E} X) ^ {2} + \mathsf {E} N \cdot \mathsf {D} X.
$$
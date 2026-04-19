# S.-T. Yau College Student Mathematics Contests 2024

# Analysis and Differential Equations

Problem 1. Let $Q : \mathbb { R }  \mathbb { R }$ be a $C _ { c } ^ { \infty }$ function, i.e. it is smooth and has compact support. We assume $Q$ is even, i.e. $Q ( x ) = Q ( - x )$ . We assume $Q$ is non-trivial, (i.e. $Q$ does not equal to zero everywhere).

Let $T _ { 1 } ( x ) : = x Q ( x )$ , and let $T _ { 2 } ( x ) = x ^ { 2 } Q ( x )$ . Let $T _ { 3 } : = e ^ { - x ^ { 2 } } ( 1 + x ^ { 2 0 2 4 } )$

We also introduce the following notation. For any $f : \mathbb { R } \to \mathbb { R }$ , $\lambda > 0 , \alpha \in \mathbb { R }$ , we define

$$
f _ {\lambda , \alpha} (x) := \frac {1}{\lambda^ {1 / 2}} f \left(\frac {x - \alpha}{\lambda}\right) \tag {0.1}
$$

We claim: There exists $\delta > 0 , \epsilon > 0$ , so that for any $c \in \mathbb { R }$ with $| c | < \delta$ , one can find unique $\lambda , \alpha$ such that the followings hold

1. $| \lambda - 1 | + | \alpha | < \epsilon$ .   
2. ă Qλ,α ´ Q ´ cT3, T1 ą“ 0   
3. ă Qλ,α ´ Q ´ cT3, T2 ą“ 0

(Here, for any two functions $f _ { 1 } , f _ { 2 }$ , we define $< f _ { 1 } , f _ { 2 } > : = \int f _ { 1 } ( x ) f _ { 2 } ( x ) d x )$ .

Is the above claim correct? Prove your conclusion.

Problem 2 Recall for every $f \in L ^ { 2 } ( \mathbb { R } ^ { 3 } )$ , one has that $g ( x ) : = ( - \Delta + 1 ) ^ { - 1 } f$ is a well-defined $L ^ { 2 } ( \mathbb { R } ^ { 3 } )$ function. And one may compute $g$ by solving

$$
(- \Delta + 1) g = f \tag {0.2}
$$

(Recall $\Delta$ in $\mathbb { R } ^ { 3 }$ is defined as $\textstyle \Delta : = \sum _ { i = 1 } ^ { 3 } \hat { \sigma } _ { i } ^ { 2 }$ , also recall one may also define $( - \Delta + 1 ) ^ { - 1 }$ by Fourier theory.)

Now, let $V ( x ) : = e ^ { - | x | ^ { 2 } }$ , $x \in \mathbb { R } ^ { 3 }$ . Prove that the operator $T : = I + ( - \Delta + 1 ) ^ { - 1 } V$ is invertible in $L ^ { 2 }$ .

$$
\left(\text {H e r e}, T f := f + (- \Delta + 1) ^ {- 1} (V f).\right)
$$

Problem 3 Let $\psi ( \xi ) \in C _ { c } ^ { \infty } ( \mathbb { R } )$ be smooth and has compact support. Let $\psi ( \xi ) = 0 , \forall | \xi | \geqslant 1$ . Let $f _ { 1 } ( \xi ) , f _ { 2 } ( \xi ) \in C _ { c } ^ { \infty } ( \mathbb { R } )$ , i.e. $f _ { 1 } , f _ { 2 }$ are smooth and have compact support. Let $u _ { i } : \mathbb { R } \times \mathbb { R } \to \mathbb { C }$ , $i = 1 , 2$ , be defined as

$$
u _ {1} \left(x _ {1}, x _ {2}\right) := \int_ {\mathbb {R}} \psi (\xi) f _ {1} (\xi) e ^ {i \xi x _ {1}} e ^ {i \xi^ {2} x _ {2}} d \xi , \tag {0.3}
$$

$$
u _ {2} \left(x _ {1}, x _ {2}\right) := \int_ {\mathbb {R}} \psi (\eta - 1 0) f _ {2} (\eta) e ^ {i \eta x _ {1}} e ^ {i \eta^ {2} x _ {2}} d \eta
$$

Prove there exists a constant $C$ , which may depend on $\psi$ , but does not depend on $f _ { 1 } , f _ { 2 }$ , so that

$$
\left\| u _ {1} u _ {2} \right\| _ {L ^ {2} \left(\mathbb {R} ^ {2}\right)} \leqslant C \| f _ {1} \| _ {L ^ {2} (\mathbb {R})} \| f _ {2} \| _ {L ^ {2} (\mathbb {R})}. \tag {0.4}
$$

(Hint: One may try to use Plancherel Theorem. It may be useful to observe that if one let $H ( \xi , \eta ) = f _ { 1 } ( \xi ) f _ { 2 } ( \eta )$ , then $\| H \| _ { L ^ { 2 } ( \mathbb { R } ^ { 2 } ) }$ are also bounded by $\| f _ { 1 } \| _ { L ^ { 2 } ( \mathbb { R } ) } \| f _ { 2 } \| _ { L ^ { 2 } ( \mathbb { R } ) } )$

Problem 4 Consider the heat equation in $\mathbb { R } ^ { 2 }$ . Let $u = u ( t , x )$ is a solution to

$$
\left\{ \begin{array}{l} \frac {\partial u}{\partial t} - \Delta u = 0; \\ u | _ {t = 0} = u _ {0} \in L ^ {2}. \end{array} \right.
$$

Then there exists a universal constant $C$ such that

$$
\int_ {0} ^ {\infty} \| u (t) \| _ {L ^ {\infty}} ^ {2} d t \leqslant C \| u _ {0} \| _ {L ^ {2}} ^ {2}.
$$

Problem 5 . Consider the Fourier transform. Let

$$
Q (g, f) (x) := \int_ {\mathbb {R} ^ {N}} \int_ {\mathbf {S} ^ {N - 1}} B (| x - y |, \frac {x - y}{| x - y |} \cdot \sigma) g (y ^ {\prime}) f (x ^ {\prime}) d \sigma d y,
$$

where $B$ is a given two variable function, $\mathbf { S } ^ { N - 1 }$ stands for the unit sphere in $\mathbb { R } ^ { N }$ and

$$
x ^ {\prime} := \frac {x + y}{2} + \frac {| x - y | \sigma}{2}; \quad y ^ {\prime} := \frac {x + y}{2} - \frac {| x - y | \sigma}{2}. \tag {0.5}
$$

Then

$$
\widehat {Q (g , f)} (\xi) = (2 \pi) ^ {- N / 2} \int_ {\mathbb {R} ^ {N} \times \mathbf {S} ^ {N - 1}} \hat {B} (| \eta |, \frac {\xi}{| \xi |} \cdot \sigma) \hat {g} (\xi^ {-} + \eta) \hat {f} (\xi^ {+} - \eta) d \sigma d \eta ,
$$

where $\begin{array} { r } { \hat { B } ( | \eta | , t ) : = \int _ { \mathbb { R } ^ { N } } B ( | q | , t ) e ^ { - i q \cdot \eta } d q } \end{array}$ , $\begin{array} { r } { \xi ^ { \pm } : = \frac { \xi \pm | \xi | \sigma } { 2 } } \end{array}$
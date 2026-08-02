## Oral Exam for All Round: Applied and Computational Mathematics 2017

## 1. Consider a vector-valued ODE:

$$
m _ {t} = - a \times m,
$$

where $a = ( a _ { 1 } , a _ { 2 } , a _ { 3 } ) ^ { T }$ is a non-zero real constant vector, and $m ( t ) = ( m _ { 1 } ( t ) , m _ { 2 } ( t ) , m _ { 3 } ( t ) ) ^ { T }$ is the unknown vector-valued function.

Consider a uniform time sequence

$$
0 = t _ {0} <   t _ {1} <   \dots <   t _ {k} <   \dots ,
$$

with $t _ { k } = k \Delta t$ , and the explicit time marching scheme:

$$
\frac {m ^ {n + 1} - m ^ {n}}{\Delta t} = - a \times m ^ {n},
$$

(a) Analyse the stability of the scheme.

(b) Propose a numerical strategy to improve the scheme so that the new scheme has better stability.
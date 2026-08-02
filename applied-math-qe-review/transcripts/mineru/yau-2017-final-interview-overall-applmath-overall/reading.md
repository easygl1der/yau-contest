## Oral Exam for All Round: Applied and Computational Mathematics 2017

## 1. Consider a vector-valued ODE:

$$
m_{t} = - a \times m,
$$

where $a =(a_{1}, a_{2}, a_{3})^{T}$ is a non-zero real constant vector, and $m(t) =(m_{1}(t), m_{2}(t), m_{3}(t))^{T}$ is the unknown vector-valued function.

Consider a uniform time sequence

$$
0 = t_{0} < t_{1} < \dots < t_{k} < \dots,
$$

with $t_{k} = k \Delta t$ , and the explicit time marching scheme:

$$
\frac{m^{n + 1} - m^{n}}{\Delta t} = - a \times m^{n},
$$

(a) Analyse the stability of the scheme.

(b) Propose a numerical strategy to improve the scheme so that the new scheme has better stability.
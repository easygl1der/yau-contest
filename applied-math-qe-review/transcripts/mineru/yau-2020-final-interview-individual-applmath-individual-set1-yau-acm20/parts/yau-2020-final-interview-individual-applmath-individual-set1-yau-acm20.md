Question I

Let A be an $m \times n$ matrix and its singular value decomposition (SVD) be

$$
V ^ {T} A U = F = \left[ \begin{array}{c c c c c c} \mu_ {1} & 0 & \dots & 0 & \dots & 0 \\ 0 & \mu_ {2} & \dots & 0 & \dots & 0 \\ \vdots & \vdots & \ddots & \vdots & \vdots & \vdots \\ 0 & 0 & \dots & \mu_ {r} & \dots & 0 \\ 0 & 0 & \dots & 0 & \dots & 0 \\ \vdots & \vdots & \vdots & \vdots & \vdots & \vdots \\ 0 & 0 & \dots & 0 & \dots & 0 \end{array} \right],
$$

where the matrices U and V are orthogonal, and the singular values $\mu _ { i }$ satisfy

$$
\mu_ {1} \geq \mu_ {2} \geq \dots \geq \mu_ {r} > 0.
$$

Define the $n \times m$ matrix

$$
F ^ {+} = \left[ \begin{array}{c c c c c c} \mu_ {1} ^ {- 1} & 0 & \dots & 0 & \dots & 0 \\ 0 & \mu_ {2} ^ {- 1} & \dots & 0 & \dots & 0 \\ \vdots & \vdots & \ddots & \vdots & \vdots & \vdots \\ 0 & 0 & \dots & \mu_ {r} ^ {- 1} & \dots & 0 \\ 0 & 0 & \dots & 0 & \dots & 0 \\ \vdots & \vdots & \vdots & \vdots & \vdots & \vdots \\ 0 & 0 & \dots & 0 & \dots & 0 \end{array} \right]
$$

and

$$
A ^ {+} = U F ^ {+} V ^ {T}.
$$

The matrix $A ^ { + }$ is called as the generalized inverse of A.

1. Show that $x ^ { * } = A ^ { + } b$ is the least square solution of the linear system $A x = b $

2. Show that

$$
\lim _ {\alpha \to 0 ^ {+}} (\alpha I + A ^ {T} A) ^ {- 1} A ^ {T} = A ^ {+},
$$

where $\alpha > 0$

Question II

Consider the following finite diference scheme

$$
\frac {v _ {m} ^ {n + 1} - v _ {m} ^ {n - 1}}{2 \tau} + a \left(1 + \frac {h ^ {2}}{6} \delta^ {2}\right) ^ {- 1} \delta_ {0} v _ {m} ^ {n} = f _ {m} ^ {n}
$$

for the transport equation $u _ { t } + a u _ { x } = f$ , where a is a constant, $\tau > 0$ is the time step, $\delta _ { 0 }$ denotes the standard second order central diference operator for $u _ { x } .$ , and $\delta ^ { 2 }$ denotes the standard second order central diference operator for $u _ { x x }$ . Assume that $\lambda = \tau / h$ is a constant with h being the spatial mesh size. Show that the scheme is stable if and only if

$$
| a \lambda | <   \frac {1}{\sqrt {3}}.
$$

How do you modify the scheme when a is not a constant without afecting the accuracy of the scheme? Justify your answer.

## Question III

Show that the following system of ordinary diferential equations

$$
{\frac {d x}{d t}} = 0. 5 x + 2. 5 y - x (x ^ {2} + y ^ {2}),
$$

$$
{\frac {d y}{d t}} = - 0. 5 x + 1. 5 y - y (x ^ {2} + y ^ {2}).
$$

has at least one periodic solution.
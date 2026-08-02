# Overall Exam, Applied and Computational Mathematics part

## Question I

Consider the ordinary diferential equation (ODE) for $y ( t ) \in \mathbb { R }$ as

$$
\varepsilon^ {2} y ^ {\prime \prime} (t) + \left(\mu^ {2} + \frac {1}{\varepsilon^ {2}}\right) y (t) = f (t), \quad t > 0, y (0) = y _ {0},
$$

where $\mu > 0$ is a constant, $f ( t )$ is a given function, and $0 < \varepsilon \ll 1$ is a small parameter.

1. Use variation-of-constant formula to reformulate the ODE into an equivalent integral form.

2. Construct a second order numerical scheme for solving the ODE, whose accuracy is independent of ε.

3. Prove the convergence rates of the constructed numerical scheme above.

## Question II

Show that the finite diference method

$$
\frac {u _ {j} ^ {n + 1} - u _ {j} ^ {n}}{\Delta t} = \frac {u _ {j - 1} ^ {n} - 2 u _ {j} ^ {n} + u _ {j + 1} ^ {n}}{\Delta x ^ {2}} + u _ {j} ^ {n}
$$

for the equation $\begin{array} { r } { \frac { \partial u } { \partial t } = \frac { \partial ^ { 2 } u } { \partial x ^ { 2 } } + u ( - \infty < x < + \infty , t > 0 ) } \end{array}$ is stable if $\begin{array} { r } { \frac { \Delta t } { \Delta x ^ { 2 } } \leq \frac { 1 } { 2 } } \end{array}$
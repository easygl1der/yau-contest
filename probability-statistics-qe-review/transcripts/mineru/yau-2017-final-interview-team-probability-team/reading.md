## 2017 Oral Exam: Probability and Statistics Team

Problem 1. An ant randomly travels along edges on a unit cube. Each step, it travels from one vertex to an adjacent vertex. Starting from a vertex, what is the expected number of steps the ant is to travel to first reach the diagonal vertex?

Problem 2. An algorithm called MM to maximize a function $g(x)$ is as follows. We find another easy-to-compute function $Q(x, z)$ such that

$$
g(z) \geq Q(x, z), \quad g(x) = Q(x, x).
$$

Starting from an initial $x_{0}$ , let $x_{k + 1} = argmax_{z} Q(x_{k}, z)$ . Argue that $g(x_{k})$ is a nondecreasing sequence.

Let Y and X be two random vectors. Denote by $f_{Y}(\cdot; \theta), f_{X | Y}(\cdot, \cdot; \theta), f_{XY}(\cdot, \cdot; \theta)$ the marginal, conditional and joint densities that depend on parameter θ. We wish to maximize $l(\theta) : = \log f_{Y}(y; \theta)$ . Define

$$
Q(\theta, \tilde{\theta}) = \int \log f_{XY}(x, y; \tilde{\theta}) f_{X | Y}(x, y; \theta) dx
$$

Consider

$$
\theta_{k + 1} = \operatorname{argmax}_{\tilde{\theta}} Q(\theta_{k}, \tilde{\theta}).
$$

Argue that this algorithm, called EM, can be viewed as a special case of MM. As a result $l(\theta_{k + 1}) \geq l(\theta_{k})$
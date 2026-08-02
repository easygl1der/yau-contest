# 后置内容

> [!cite] 此文件保留最后一个自动识别章节之后的附录、书目、索引或未自动归类内容。来源：[reading.md](../../../transcripts/mineru/first-order-methods-optimization/reading.md)，源行 18105–19422。


Underlying Spaces: In this chapter all the underlying spaces are Euclidean <sup>Rn</sup> spaces endowed with the dot product and the $l_{2}{\mathrm{- norm}}.$

## 15.1 The Augmented Lagrangian Method

Consider the problem

$$
H_{\mathrm{opt}} = \min \{H(\mathbf{x}, \mathbf{z}) \equiv h_{1}(\mathbf{x}) + h_{2}(\mathbf{z}): \mathbf{Ax} + \mathbf{Bz} = \mathbf{c}\},\tag{15.1}
$$

where $\mathbf{A} \in \mathbb{R}^{m \times n}, \mathbf{B} \in \mathbb{R}^{m \times p}.$ , and $\mathbf{c} \in \mathbb{R}^{m}$ . For now, we will assume that $h_{1}$ and $h_{2}$ are proper closed and convex functions. Later on, we will specify exact conditions on the data $(h_{1}, h_{2}, \mathbf{A}, \mathbf{B}, \mathbf{c})$ that will guarantee the validity of some convergence results. To find a dual problem of (15.1), we begin by constructing a Lagrangian:

$$
L(\mathbf{x}, \mathbf{z}; \mathbf{y}) = h_{1}(\mathbf{x}) + h_{2}(\mathbf{z}) + \langle \mathbf{y}, \mathbf{Ax} + \mathbf{Bz} - \mathbf{c} \rangle.
$$

The dual objective function is therefore given by

$$
\begin{array}{l} q(\mathbf{y}) = \min_{\mathbf{x} \in \mathbb{R}^{n}, \mathbf{z} \in \mathbb{R}^{p}} \{h_{1}(\mathbf{x}) + h_{2}(\mathbf{z}) + \langle \mathbf{y}, \mathbf{Ax} + \mathbf{Bz} - \mathbf{c} \rangle\} \\ = - h_{1}^{*}(- \mathbf{A}^{T} \mathbf{y}) - h_{2}^{*}(- \mathbf{B}^{T} \mathbf{y}) - \langle \mathbf{c}, \mathbf{y} \rangle, \end{array}
$$

and the dual problem is given by

$$
q_{\text{opt}} = \max_{\mathbf{y} \in \mathbb{R}^{m}} \left\{- h_{1}^{*}(- \mathbf{A}^{T} \mathbf{y}) - h_{2}^{*}(- \mathbf{B}^{T} \mathbf{y}) - \langle \mathbf{c}, \mathbf{y} \rangle \right\}\tag{15.2}
$$

or, in minimization form, by

$$
\min_{\mathbf{y} \in \mathbb{R}^{m}} \left\{h_{1}^{*}(- \mathbf{A}^{T} \mathbf{y}) + h_{2}^{*}(- \mathbf{B}^{T} \mathbf{y}) + \langle \mathbf{c}, \mathbf{y} \rangle \right\}.\tag{15.3}
$$

The proximal point method was discussed in Section 10.5, where its convergence was established. The general update step of the proximal point method employed on problem (15.3) takes the form $(\rho > 0$ being a given constant)

$$
\mathbf{y}^{k + 1} = \operatorname{argmin}_{\mathbf{y} \in \mathbb{R}^{m}} \left\{h_{1}^{*}(- \mathbf{A}^{T} \mathbf{y}) + h_{2}^{*}(- \mathbf{B}^{T} \mathbf{y}) + \langle \mathbf{c}, \mathbf{y} \rangle + \frac{1}{2 \rho} \| \mathbf{y} - \mathbf{y}^{k} \|^{2} \right\}.\tag{15.4}
$$

Assuming that the sum and Affine rules of subdiferential calculus (Theorems 3.40 and 3.43) hold for the relevant functions, we can conclude by Fermat’s optimality condition (Theorem 3.63) that (15.4) holds if and only if

$$
\mathbf{0} \in - \mathbf{A} \partial h_{1}^{*}(- \mathbf{A}^{T} \mathbf{y}^{k + 1}) - \mathbf{B} \partial h_{2}^{*}(- \mathbf{B}^{T} \mathbf{y}^{k + 1}) + \mathbf{c} + \frac{1}{\rho}(\mathbf{y}^{k + 1} - \mathbf{y}^{k}).\tag{15.5}
$$

Using the conjugate subgradient theorem (Corollary 4.21), we obtain that $\mathbf{y}^{k + 1}$ satisfies (15.5) if and only if $\mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{A} \mathbf{x}^{k + 1} + \mathbf{B} \mathbf{z}^{k + 1} - \mathbf{c})$ , where $\mathbf{x}^{k + 1}$ and $\mathbf{z}^{k + 1}$ satisfy

$$
\begin{array}{r} \mathbf{x}^{k + 1} \in \operatorname{argmin}_{\mathbf{x} \in \mathbb{R}^{n}} \{\langle \mathbf{A}^{T} \mathbf{y}^{k + 1}, \mathbf{x} \rangle + h_{1}(\mathbf{x})\}, \\ \mathbf{z}^{k + 1} \in \operatorname{argmin}_{\mathbf{z} \in \mathbb{R}^{p}} \{\langle \mathbf{B}^{T} \mathbf{y}^{k + 1}, \mathbf{z} \rangle + h_{2}(\mathbf{z})\}.\end{array}
$$

Plugging the update equation for $\mathbf{y}^{k + 1}$ into the above, we conclude that $\mathbf{y}^{k + 1}$ satisfies (15.5) if and only if

$$
\begin{array}{l} \mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k + 1} - \mathbf{c}), \\ \mathbf{x}^{k + 1} \in \operatorname{argmin}_{\mathbf{x} \in \mathbb{R}^{n}} \{\langle \mathbf{A}^{T}(\mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k + 1} - \mathbf{c})), \mathbf{x} \rangle + h_{1}(\mathbf{x})\}, \\ \mathbf{z}^{k + 1} \in \operatorname{argmin}_{\mathbf{z} \in \mathbb{R}^{p}} \{\langle \mathbf{B}^{T}(\mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k + 1} - \mathbf{c})), \mathbf{z} \rangle + h_{2}(\mathbf{z})\}, \end{array}
$$

meaning if and only if (using the properness and convexity of $h_{1}$ and $h_{2}$ , as well as Fermat’s optimality condition)

$$
\mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k + 1} - \mathbf{c}),\tag{15.6}
$$

$$
\mathbf{0} \in \mathbf{A}^{T}(\mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k + 1} - \mathbf{c})) + \partial h_{1}(\mathbf{x}^{k + 1}),\tag{15.7}
$$

$$
\mathbf{0} \in \mathbf{B}^{T}(\mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k + 1} - \mathbf{c})) + \partial h_{2}(\mathbf{z}^{k + 1}).\tag{15.8}
$$

Conditions (15.7) and (15.8) are satisfied if and only if $(\mathbf{x}^{k + 1}, \mathbf{z}^{k + 1})$ is a coordinatewise minimum (see Definition 14.2) of the function

$$
\tilde{H}(\mathbf{x}, \mathbf{z}) \equiv h_{1}(\mathbf{x}) + h_{2}(\mathbf{z}) + \frac{\rho}{2} \left\| \mathbf{Ax} + \mathbf{Bz} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2}.
$$

By Lemma 14.7, coordinate-wise minima points of $\tilde{H}$ are exactly the minimizers of $\tilde{H}$ , and therefore the system (15.6), (15.7), (15.8) leads us to the following primal representation of the dual proximal point method, known as the augmented Lagrangian method.

Initialization: $\mathbf{y}^{0} \in \mathbb{R}^{m}, \rho > 0$ General step: for any $k = 0, 1, 2,...$ . execute the following steps:

$$
(\mathbf{x}^{k + 1}, \mathbf{z}^{k + 1}) \in \underset{\mathbf{x} \in \mathbb{R}^{n}, \mathbf{z} \in \mathbb{R}^{p}}{\operatorname{argmin}} \left\{h_{1}(\mathbf{x}) + h_{2}(\mathbf{z}) + \frac{\rho}{2} \left\| \mathbf{Ax} + \mathbf{Bz} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2} \right\}\tag{15.9}
$$

$$
\mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k + 1} - \mathbf{c}).\tag{15.10}
$$

Naturally, step (15.9) is called the primal update step, while (15.10) is the dual update step.

Remark 15.1 (augmented Lagrangian). The augmented Lagrangian associated with the main problem (15.1) is defined to be

$$
L_{\rho}(\mathbf{x}, \mathbf{z}; \mathbf{y}) = h_{1}(\mathbf{x}) + h_{2}(\mathbf{z}) + \langle \mathbf{y}, \mathbf{Ax} + \mathbf{Bz} - \mathbf{c} \rangle + \frac{\rho}{2} \| \mathbf{Ax} + \mathbf{Bz} - \mathbf{c} \|^{2}.
$$

Obviously, $L_{0} = L$ is the Lagrangian function, and $L_{\rho}$ for $\rho > 0$ can be considered as a penalized version of the Lagrangian. The primal update step (15.9) can be equivalently written as

$$
(\mathbf{x}^{k + 1}, \mathbf{z}^{k + 1}) \in \operatorname{argmin}_{\mathbf{x} \in \mathbb{R}^{n}, \mathbf{z} \in \mathbb{R}^{p}} L_{\rho}(\mathbf{x}, \mathbf{z}; \mathbf{y}^{k}).
$$

The above representation of the primal update step as the outcome of the minimization of the augmented Lagrangian function is the reason for the name of the method.

## 15.2 Alternating Direction Method of Multipliers (ADMM)

The augmented Lagrangian method is in general not an implementable method since the primal update step (15.9) can be as hard to solve as the original problem. One source of dificulty is the coupling term between the x and the z variables, which is of the form $\rho(\mathbf{x}^{T} \mathbf{A}^{T} \mathbf{B} \mathbf{z})$ . The approach used in the alternating direction method $of$ multipliers (ADMM) to tackle this dificulty is to replace the exact minimization in the primal update step (15.9) by one iteration of the alternating minimization method; that is, the objective function of (15.9) is first minimized w.r.t. x, and then w.r.t. z.

## ADMM

Initialization: $\begin{array}{r}{\mathbf{x}^{0} \in \mathbb{R}^{n}, \mathbf{z}^{0} \in \mathbb{R}^{p}, \mathbf{y}^{0} \in \mathbb{R}^{m}, \rho > 0.} \end{array}$ .

General step: for any $k = 0, 1, \ldots$ execute the following:

$$
\text{(a)} \mathbf{x}^{k + 1} \in \operatorname{argmin}_{\mathbf{x}} \left\{h_{1}(\mathbf{x}) + \frac{\rho}{2} \left\| \mathbf{Ax} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2} \right\};
$$

$$
\mathrm{(b)} \mathbf{z}^{k + 1} \in \operatorname{argmin}_{\mathbf{z}} \left\{h_{2}(\mathbf{z}) + \frac{\rho}{2} \left\| \mathbf{Ax}^{k + 1} + \mathbf{Bz} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2} \right\};
$$

$$
\mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k + 1} - \mathbf{c}).
$$

## 15.2.1 Alternating Direction Proximal Method of Multipliers (AD-PMM)

We will actually analyze a more general method than ADMM in which a quadratic proximity term is added to the objective in the minimization problems of steps (a) and (b). We will assume that we are given two positive semidefinite matrices $\dot{\mathbf{G}} \in \mathbb{S}_{+}^{n}, \dot{\mathbf{Q}} \in \mathbb{S}_{+}^{p}$ , and recall that $\| \mathbf{x} \|_{\mathbf{G}}^{2} = \breve{\mathbf{x}^{T}} \mathbf{G} \mathbf{x}, \| \mathbf{x} \|_{\mathbf{Q}}^{2} = \mathbf{x}^{T} \mathbf{Q} \mathbf{x}$

## AD-PMM

Initialization: $\begin{array}{r}{\mathbf{x}^{0} \in \mathbb{R}^{n}, \mathbf{z}^{0} \in \mathbb{R}^{p}, \mathbf{y}^{0} \in \mathbb{R}^{m}, \rho > 0.} \end{array}$

General step: for any $k = 0, 1, \ldots$ execute the following:

$$
\mathrm{(a)} \mathbf{x}^{k + 1} \in \operatorname{argmin}_{\mathbf{x} \in \mathbb{R}^{n}} \bigg \{h_{1}(\mathbf{x}) + \frac{\rho}{2} \left\| \mathbf{Ax} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2} + \frac{1}{2} \| \mathbf{x} - \mathbf{x}^{k} \|_{\mathbf{G}}^{2} \bigg\};
$$

$$
\mathrm{(b)} \mathbf{z}^{k + 1} \in \operatorname{argmin}_{\mathbf{z} \in \mathbb{R}^{p}} \Big \{h_{2}(\mathbf{z}) + \frac{\rho}{2} \left\| \mathbf{Ax}^{k + 1} + \mathbf{Bz} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k} \right\| + \frac{1}{2} \| \mathbf{z} - \mathbf{z}^{k} \|_{\mathbf{Q}}^{2} \Big\};
$$

$$
\mathbf{\Lambda}(c) \mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k + 1} - \mathbf{c}).
$$

One important motivation for considering AD-PMM is that by using the proximity terms, the minimization problems in steps (a) and (b) of ADMM can be simplified considerably by choosing $\mathbf{G} = \alpha \mathbf{I} - \rho \mathbf{A}^{T} \mathbf{A}$ with $\alpha \geq \rho \lambda_{\operatorname{max}}(\mathbf{A}^{T} \mathbf{A})$ and $\mathbf{Q} = \beta \mathbf{I} - \rho \mathbf{B}^{T} \mathbf{B}$ with $\beta \geq \rho \lambda_{\operatorname{max}}(\mathbf{B}^{T} \mathbf{B})$ . Then obviously $\mathbf{G}, \mathbf{Q} \in \mathbb{S}_{+}^{n}$ , and the function that needs to be minimized in the x-step can be simplified as follows:

$$
\begin{array}{c} h_{1}(\mathbf{x}) + \frac{\rho}{2} \left\| \mathbf{Ax} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2} + \frac{1}{2} \| \mathbf{x} - \mathbf{x}^{k} \|_{\mathbf{G}}^{2} \\ = h_{1}(\mathbf{x}) + \frac{\rho}{2} \left\| \mathbf{A}(\mathbf{x} - \mathbf{x}^{k}) + \mathbf{Ax}^{k} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2} + \frac{1}{2} \| \mathbf{x} - \mathbf{x}^{k} \|_{\mathbf{G}}^{2} \\ = h_{1}(\mathbf{x}) + \frac{\rho}{2} \| \mathbf{A}(\mathbf{x} - \mathbf{x}^{k}) \|^{2} + \left\langle \rho \mathbf{Ax}, \mathbf{Ax}^{k} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k} \right\rangle \\ + \frac{\alpha}{2} \| \mathbf{x} - \mathbf{x}^{k} \|^{2} - \frac{\rho}{2} \| \mathbf{A}(\mathbf{x} - \mathbf{x}^{k}) \|^{2} + \text{constant} \\ = h_{1}(\mathbf{x}) + \rho \left\langle \mathbf{Ax}, \mathbf{Ax}^{k} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k} \right\rangle + \frac{\alpha}{2} \| \mathbf{x} - \mathbf{x}^{k} \|^{2} + \text{constant}, \end{array}
$$

where by “constant” we mean a term that does not depend on x. We can therefore conclude that step (a) of AD-PMM amounts to

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in \mathbb{R}^{n}} \left\{h_{1}(\mathbf{x}) + \rho \left\langle \mathbf{Ax}, \mathbf{Ax}^{k} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k} \right\rangle + \frac{\alpha}{2} \| \mathbf{x} - \mathbf{x}^{k} \|^{2} \right\},\tag{15.11}
$$

and, similarly, step (b) of AD-PMM is the same as

$$
\mathbf{z}^{k + 1} = \operatorname{argmin}_{\mathbf{z} \in \mathbb{R}^{p}} \left\{h_{2}(\mathbf{z}) + \rho \left\langle \mathbf{Bz}, \mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k} \right\rangle + \frac{\beta}{2} \| \mathbf{z} - \mathbf{z}^{k} \|^{2} \right\}.\tag{15.12}
$$

The functions minimized in the update formulas (15.11) and (15.12) are actually constructed from the functions minimized in steps (a) and (b) of ADMM by linearizing the quadratic term and adding a proximity term. This is the reason why the resulting method will be called the alternating direction linearized proximal method of multipliers (AD-LPMM). We can also write the update formulas (15.11) and (15.12) in terms of proximal operators. Indeed, (15.11) can be rewritten equivalently as

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x}} \left\{\frac{1}{\alpha} h_{1}(\mathbf{x}) + \frac{1}{2} \left\| \mathbf{x} - \left(\mathbf{x}^{k} - \frac{\rho}{\alpha} \mathbf{A}^{T} \left(\mathbf{Ax}^{k} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k}\right)\right) \right\|^{2} \right\}.
$$

That is,

$$
\mathbf{x}^{k + 1} = \operatorname{prox}_{\frac{1}{\alpha} h_{1}} \left[\mathbf{x}^{k} - \frac{\rho}{\alpha} \mathbf{A}^{T} \left(\mathbf{Ax}^{k} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k}\right) \right].
$$

Similarly, the z-step can be rewritten as

$$
\mathbf{z}^{k + 1} = \operatorname{prox}_{\frac{1}{\beta} h_{2}} \left[\mathbf{z}^{k} - \frac{\rho}{\beta} \mathbf{B}^{T} \left(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k}\right) \right].
$$

We can now summarize and write explicitly the AD-LPMM method.

## AD-LPMM

$$
\mathbf{x}^{0} \in \mathbb{R}^{n}, \mathbf{z}^{0} \in \mathbb{R}^{p}, \mathbf{y}^{0} \in \mathbb{R}^{m}, \rho > 0, \alpha \geq \rho \lambda_{\max}(\mathbf{A}^{T} \mathbf{A}), \beta \geq
$$

$$
\rho \lambda_{\max}(\mathbf{B}^{T} \mathbf{B}).
$$

General step: for any $k = 0, 1, \ldots$ . execute the following:

$$
\text{(a)} \mathbf{x}^{k + 1} = \operatorname{prox}_{\frac{1}{\alpha} h_{1}} \left[\mathbf{x}^{k} - \frac{\rho}{\alpha} \mathbf{A}^{T} \left(\mathbf{Ax}^{k} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k}\right) \right];
$$

$$
\text{(b)} \mathbf{z}^{k + 1} = \operatorname{prox}_{\frac{1}{\beta} h_{2}} \left[\mathbf{z}^{k} - \frac{\rho}{\beta} \mathbf{B}^{T} \left(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k}\right) \right];
$$

$$
\mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k + 1} - \mathbf{c}).
$$

## 15.3 Convergence Analysis of AD-PMM

In this section we will develop a rate of convergence analysis of AD-PMM employed on problem (15.1). Note that both ADMM and AD-LPMM are special cases of AD-PMM. The following set of assumptions will be made.

Assumption 15.2.

(A) $h_{1} : \mathbb{R}^{n}(- \infty, \infty]$ and $h_{2} : \mathbb{R}^{p}(- \infty, \infty]$ are proper closed convex functions.

(B) $\mathbf{A} \in \mathbb{R}^{m \times n}, \mathbf{B} \in \mathbb{R}^{m \times p}, \mathbf{c} \in \mathbb{R}^{m}, \rho > 0.$

(C) $\mathbf{G} \in \mathbb{S}_{+}^{n}, \mathbf{Q} \in \mathbb{S}_{+}^{p}$

(D) For any $\mathbf{a} \in \mathbb{R}^{n}, \mathbf{b} \in \mathbb{R}^{p}$ the optimal sets of the problems

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}} \left\{h_{1}(\mathbf{x}) + \frac{\rho}{2} \| \mathbf{Ax} \|^{2} + \frac{1}{2} \| \mathbf{x} \|_{\mathbf{G}}^{2} + \langle \mathbf{a}, \mathbf{x} \rangle \right\}
$$

and

$$
\min_{\mathbf{z} \in \mathbb{R}^{p}} \left\{h_{2}(\mathbf{z}) + \frac{\rho}{2} \| \mathbf{Bz} \|^{2} + \frac{1}{2} \| \mathbf{z} \|_{\mathbf{Q}}^{2} + \langle \mathbf{b}, \mathbf{z} \rangle \right\}
$$

are nonempty.

(E) There exists $\hat{\mathbf{x}} \in \mathrm{ri}(\mathrm{dom}(h_{1}))$ and $\hat{\mathbf z} \in \mathrm{ri}(\mathrm{dom}(h_{2}))$ for which $\mathbf{A} \hat{\mathbf{x}} + \mathbf{B} \hat{\mathbf{z}} = \mathbf{c}$

(F) Problem (15.1) has a nonempty optimal set, denoted by $X^{\ast}$ , and the corresponding optimal value is $H_{\mathrm{opt}}$

Property (D) guarantees that the AD-PMM method is actually a well-defined method.

By the strong duality theorem for convex problems (see Theorem A.1), under Assumption 15.2, it follows that strong duality holds for the pair of problems (15.1) and (15.2).

Theorem 15.3 (strong duality for the pair of problems (15.1) and (15.2)). Suppose that Assumption 15.2 holds, and let $H_{\mathrm{opt}}, q_{\mathrm{opt}}$ be the optimal values of the primal and dual problems (15.1) and (15.2), respectively. Then $H_{\mathrm{opt}} = q_{\mathrm{opt}}$ , and the dual problem (15.2) possesses an optimal solution.

We will now prove an $O(1 / k)$ rate of convergence result of the sequence generated by AD-PMM.

Theorem 15.4 $(O(1 / k)$ rate of convergence of AD-PMM).<sup>87</sup> Suppose that Assumption 15.2 holds. Let $\{(\mathbf{x}^{k}, \mathbf{z}^{k})\}_{k \geq 0}$ be the sequence generated by AD-PMM for solving problem (15.1). Let $\left(\mathbf{x}^{*}, \mathbf{z}^{*} \right)$ be an optimal solution of problem (15.1) and $\mathbf{y}^{*}$ be an optimal solution of the dual problem (15.2). Suppose that $\gamma > 0$ is any constant satisfying $\gamma \geq 2 \| \mathbf{y}^{*} \|$ . Then for all $n \geq 0$ 2

$$
H(\mathbf{x}^{(n)}, \mathbf{z}^{(n)}) - H_{\mathrm{opt}} \leq \frac{\| \mathbf{x}^{*} - \mathbf{x}^{0} \|_{\mathbf{G}}^{2} + \| \mathbf{z}^{*} - \mathbf{z}^{0} \|_{\mathbf{C}}^{2} + \frac{1}{\rho}(\gamma + \| \mathbf{y}^{0} \|)^{2}}{2(n + 1)},\tag{15.13}
$$

$$
\| \mathbf{A} \mathbf{x}^{(n)} + \mathbf{B} \mathbf{z}^{(n)} - \mathbf{c} \| \leq \frac{\| \mathbf{x}^{*} - \mathbf{x}^{0} \|_{\mathbf{G}}^{2} + \| \mathbf{z}^{*} - \mathbf{z}^{0} \|_{\mathbf{C}}^{2} + \frac{1}{\rho}(\gamma + \| \mathbf{y}^{0} \|)^{2}}{\gamma(n + 1)},\tag{15.14}
$$

where $\mathbf{C} = \rho \mathbf{B}^{T} \mathbf{B} + \mathbf{Q}$ and

$$
\mathbf{x}^{(n)} = \frac{1}{n + 1} \sum_{k = 0}^{n} \mathbf{x}^{k + 1}, \mathbf{z}^{(n)} = \frac{1}{n + 1} \sum_{k = 0}^{n} \mathbf{z}^{k + 1}.
$$

Proof. By Fermat’s optimality condition (Theorem 3.63) and the update steps (a) and (b) of AD-PMM, it follows that $\mathbf{x}^{k + 1}$ and $\mathbf{z}^{k + 1}$ satisfy

$$
- \rho \mathbf{A}^{T} \left(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k}\right) - \mathbf{G}(\mathbf{x}^{k + 1} - \mathbf{x}^{k}) \in \partial h_{1}(\mathbf{x}^{k + 1}),\tag{15.15}
$$

$$
- \rho \mathbf{B}^{T} \left(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k + 1} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k}\right) - \mathbf{Q}(\mathbf{z}^{k + 1} - \mathbf{z}^{k}) \in \partial h_{2}(\mathbf{z}^{k + 1}).\tag{15.16}
$$

We will use the following notation:

$$
\begin{array}{l} \tilde{\mathbf{x}}^{k} = \mathbf{x}^{k + 1}, \\ \tilde{\mathbf{z}}^{k} = \mathbf{z}^{k + 1}, \\ \tilde{\mathbf{y}}^{k} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} + \mathbf{Bz}^{k} - \mathbf{c}).\end{array}
$$

Using (15.15), (15.16), the subgradient inequality, and the above notation, we obtain that for any $\mathbf{x} \in \mathrm{dom}(h_{1})$ and $\mathbf{z} \in \mathrm{dom}(h_{2})$ ,

$$
h_{1}(\mathbf{x}) - h_{1}(\tilde{\mathbf{x}}^{k}) + \left\langle \rho \mathbf{A}^{T} \left(\mathbf{A} \tilde{\mathbf{x}}^{k} + \mathbf{B} \mathbf{z}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k}\right) + \mathbf{G}(\tilde{\mathbf{x}}^{k} - \mathbf{x}^{k}), \mathbf{x} - \tilde{\mathbf{x}}^{k} \right\rangle \geq 0,
$$

$$
h_{2}(\mathbf{z}) - h_{2}(\tilde{\mathbf{z}}^{k}) + \left\langle \rho \mathbf{B}^{T} \left(\mathbf{A} \tilde{\mathbf{x}}^{k} + \mathbf{B} \tilde{\mathbf{z}}^{k} - \mathbf{c} + \frac{1}{\rho} \mathbf{y}^{k}\right) + \mathbf{Q}(\tilde{\mathbf{z}}^{k} - \mathbf{z}^{k}), \mathbf{z} - \tilde{\mathbf{z}}^{k} \right\rangle \geq 0.
$$

Using the definition of $\tilde{\mathbf{y}}^{k}$ , the above two inequalities can be rewritten as

$$
\begin{array}{r} h_{1}(\mathbf{x}) - h_{1}(\tilde{\mathbf{x}}^{k}) + \left\langle \mathbf{A}^{T} \tilde{\mathbf{y}}^{k} + \mathbf{G}(\tilde{\mathbf{x}}^{k} - \mathbf{x}^{k}), \mathbf{x} - \tilde{\mathbf{x}}^{k} \right\rangle \geq 0, \\ h_{2}(\mathbf{z}) - h_{2}(\tilde{\mathbf{z}}^{k}) + \left\langle \mathbf{B}^{T} \tilde{\mathbf{y}}^{k} +(\rho \mathbf{B}^{T} \mathbf{B} + \mathbf{Q})(\tilde{\mathbf{z}}^{k} - \mathbf{z}^{k}), \mathbf{z} - \tilde{\mathbf{z}}^{k} \right\rangle \geq 0.\end{array}
$$

Adding the above two inequalities and using the identity

$$
\mathbf{y}^{k + 1} - \mathbf{y}^{k} = \rho(\mathbf{A} \tilde{\mathbf{x}}^{k} + \mathbf{B} \tilde{\mathbf{z}}^{k} - \mathbf{c}),
$$

we can conclude that for any $\mathbf{x} \in \operatorname{dom}(h_{1}), \mathbf{z} \in \operatorname{dom}(h_{2})$ , and $\mathbf{y} \in \mathbb{R}^{m}$ ，

$$
H(\mathbf{x}, \mathbf{z}) - H(\tilde{\mathbf{x}}^{k}, \tilde{\mathbf{z}}^{k}) + \left\langle \left(\begin{array}{c} \mathbf{x} - \tilde{\mathbf{x}}^{k} \\ \mathbf{z} - \tilde{\mathbf{z}}^{k} \\ \mathbf{y} - \tilde{\mathbf{y}}^{k} \end{array} \right), \left(\begin{array}{c} \mathbf{A}^{T} \tilde{\mathbf{y}}^{k} \\ \mathbf{B}^{T} \tilde{\mathbf{y}}^{k} \\ - \mathbf{A} \tilde{\mathbf{x}}^{k} - \mathbf{B} \tilde{\mathbf{z}}^{k} + \mathbf{c} \end{array} \right) - \left(\begin{array}{c} \mathbf{G}(\mathbf{x}^{k} - \tilde{\mathbf{x}}^{k}) \\ \mathbf{C}(\mathbf{z}^{k} - \tilde{\mathbf{z}}^{k}) \\ \frac{1}{\rho}(\mathbf{y}^{k} - \mathbf{y}^{k + 1}) \end{array} \right) \right\rangle \geq 0,\tag{15.17}
$$

where $\mathbf{C} = \rho \mathbf{B}^{T} \mathbf{B} + \mathbf{Q}$ . We will use the following identity that holds for any positive semidefinite matrix P:

$$
(\mathbf{a} - \mathbf{b})^{T} \mathbb{P}(\mathbf{c} - \mathbf{d}) = \frac{1}{2} \left(\| \mathbf{a} - \mathbf{d} \|_{\mathbb{P}}^{2} - \| \mathbf{a} - \mathbf{c} \|_{\mathbb{P}}^{2} + \| \mathbf{b} - \mathbf{c} \|_{\mathbb{P}}^{2} - \| \mathbf{b} - \mathbf{d} \|_{\mathbb{P}}^{2}\right).
$$

Using the above identity, we can conclude that

$$
\begin{array}{rl} &{(\mathbf{x} - \tilde{\mathbf{x}}^{k})^{T} \mathbf{G}(\mathbf{x}^{k} - \tilde{\mathbf{x}}^{k}) = \frac{1}{2} \left(\| \mathbf{x} - \tilde{\mathbf{x}}^{k} \|_{\mathbf{G}}^{2} - \| \mathbf{x} - \mathbf{x}^{k} \|_{\mathbf{G}}^{2} + \| \tilde{\mathbf{x}}^{k} - \mathbf{x}^{k} \|_{\mathbf{G}}^{2}\right)} \\ &{\qquad \geq \frac{1}{2} \| \mathbf{x} - \tilde{\mathbf{x}}^{k} \|_{\mathbf{G}}^{2} - \frac{1}{2} \| \mathbf{x} - \mathbf{x}^{k} \|_{\mathbf{G}}^{2},} \end{array}\tag{15.18}
$$

as well as

$$
(\mathbf{z} - \tilde{\mathbf{z}}^{k})^{T} \mathbf{C}(\mathbf{z}^{k} - \tilde{\mathbf{z}}^{k}) = \frac{1}{2} \| \mathbf{z} - \tilde{\mathbf{z}}^{k} \|_{\mathbf{C}}^{2} - \frac{1}{2} \| \mathbf{z} - \mathbf{z}^{k} \|_{\mathbf{C}}^{2} + \frac{1}{2} \| \mathbf{z}^{k} - \tilde{\mathbf{z}}^{k} \|_{\mathbf{C}}^{2}\tag{15.19}
$$

and

$$
\begin{array}{rl} & 2(\mathbf{y} - \tilde{\mathbf{y}}^{k})^{T}(\mathbf{y}^{k} - \mathbf{y}^{k + 1}) \\ & = \| \mathbf{y} - \mathbf{y}^{k + 1} \|^{2} - \| \mathbf{y} - \mathbf{y}^{k} \|^{2} + \| \tilde{\mathbf{y}}^{k} - \mathbf{y}^{k} \|^{2} - \| \tilde{\mathbf{y}}^{k} - \mathbf{y}^{k + 1} \|^{2} \\ & = \| \mathbf{y} - \mathbf{y}^{k + 1} \|^{2} - \| \mathbf{y} - \mathbf{y}^{k} \|^{2} + \rho^{2} \| \mathbf{A} \tilde{\mathbf{x}}^{k} + \mathbf{B} \mathbf{z}^{k} - \mathbf{c} \|^{2} \\ & - \| \mathbf{y}^{k} + \rho(\mathbf{A} \tilde{\mathbf{x}}^{k} + \mathbf{B} \mathbf{z}^{k} - \mathbf{c}) - \mathbf{y}^{k} - \rho(\mathbf{A} \tilde{\mathbf{x}}^{k} + \mathbf{B} \tilde{\mathbf{z}}^{k} - \mathbf{c}) \|^{2} \\ & = \| \mathbf{y} - \mathbf{y}^{k + 1} \|^{2} - \| \mathbf{y} - \mathbf{y}^{k} \|^{2} + \rho^{2} \| \mathbf{A} \tilde{\mathbf{x}}^{k} + \mathbf{B} \mathbf{z}^{- k} - \mathbf{c} \|^{2} - \rho^{2} \| \mathbf{B}(\mathbf{z}^{- k} - \tilde{\mathbf{z}}^{- k}) \|^{2}.\end{array}
$$

Therefore,

$$
\frac{1}{\rho}(\mathbf{y} - \tilde{\mathbf{y}}^{k})^{T}(\mathbf{y}^{k} - \mathbf{y}^{k + 1}) \geq \frac{1}{2 \rho} \left(\| \mathbf{y} - \mathbf{y}^{k + 1} \|^{2} - \| \mathbf{y} - \mathbf{y}^{k} \|^{2}\right) - \frac{\rho}{2} \| \mathbf{B}(\mathbf{z}^{k} - \tilde{\mathbf{z}}^{k}) \|^{2}.\tag{15.20}
$$

Denoting

$$
\mathbf{H} = \left(\begin{array}{ccc} \mathbf{G} & \mathbf{0} & \mathbf{0} \\ \mathbf{0} & \mathbf{C} & \mathbf{0} \\ \mathbf{0} & \mathbf{0} & \frac{1}{\rho} \mathbf{I} \end{array} \right),
$$

as well as

$$
\mathbf{w} = \left(\begin{array}{c} \mathbf{x} \\ \mathbf{z} \\ \mathbf{y} \end{array} \right), \quad \mathbf{w}^{k} = \left(\begin{array}{c} \mathbf{x}^{k} \\ \mathbf{z}^{k} \\ \mathbf{y}^{k} \end{array} \right), \quad \tilde{\mathbf{w}}^{k} = \left(\begin{array}{c} \tilde{\mathbf{x}}^{k} \\ \tilde{\mathbf{z}}^{k} \\ \tilde{\mathbf{y}}^{k} \end{array} \right),
$$

we obtain by combining (15.18), (15.19), and (15.20) that

$$
\begin{array}{rl} \left\langle \left(\begin{array}{c} \mathbf{x} - \tilde{\mathbf{x}}^{k} \\ \mathbf{z} - \tilde{\mathbf{z}}^{k} \\ \mathbf{y} - \tilde{\mathbf{y}}^{k} \end{array} \right), \left(\begin{array}{c} \mathbf{G}(\mathbf{x}^{k} - \tilde{\mathbf{x}}^{k}) \\ \mathbf{C}(\mathbf{z}^{k} - \tilde{\mathbf{z}}^{k}) \\ \frac{1}{\rho}(\mathbf{y}^{k} - \mathbf{y}^{k + 1}) \end{array} \right) \right\rangle & \geq \frac{1}{2} \| \mathbf{w} - \mathbf{w}^{k + 1} \|_{\mathbf{H}}^{2} - \frac{1}{2} \| \mathbf{w} - \mathbf{w}^{k} \|_{\mathbf{H}}^{2} \\ & \quad + \frac{1}{2} \| \mathbf{z}^{k} - \tilde{\mathbf{z}}^{k} \|_{\mathbf{C}}^{2} - \frac{\rho}{2} \| \mathbf{B}(\mathbf{z}^{k} - \tilde{\mathbf{z}}^{k}) \|^{2} \\ & \geq \frac{1}{2} \| \mathbf{w} - \mathbf{w}^{k + 1} \|_{\mathbf{H}}^{2} - \frac{1}{2} \| \mathbf{w} - \mathbf{w}^{k} \|_{\mathbf{H}}^{2}.\end{array}
$$

Combining the last inequality with (15.17), we obtain that for any $\mathbf{x} \in \mathrm{dom}(h_{1})$ ， $\mathbf{z} \in \mathrm{dom}(h_{2})$ , and $\mathbf{y} \in \mathbb{R}^{m}$ 2

$$
H(\mathbf{x}, \mathbf{z}) - H(\tilde{\mathbf{x}}^{k}, \tilde{\mathbf{z}}^{k}) + \langle \mathbf{w} - \tilde{\mathbf{w}}^{k}, \mathbf{F} \tilde{\mathbf{w}}^{k} + \tilde{\mathbf{c}} \rangle \geq \frac{1}{2} \| \mathbf{w} - \mathbf{w}^{k + 1} \|_{\mathbf{H}}^{2} - \frac{1}{2} \| \mathbf{w} - \mathbf{w}^{k} \|_{\mathbf{H}}^{2},\tag{15.21}
$$

where

$$
\mathbf{F} = \left(\begin{array}{ccc} \mathbf{0} & \mathbf{0} & \mathbf{A}^{T} \\ \mathbf{0} & \mathbf{0} & \mathbf{B}^{T} \\ - \mathbf{A} & - \mathbf{B} & \mathbf{0} \end{array} \right), \qquad \tilde{\mathbf{c}} = \left(\begin{array}{c} \mathbf{0} \\ \mathbf{0} \\ \mathbf{c} \end{array} \right).
$$

Note that

$$
\begin{array}{c} \langle \mathbf{w} - \tilde{\mathbf{w}}^{k}, \mathbf{F} \tilde{\mathbf{w}}^{k} + \tilde{\mathbf{c}} \rangle = \langle \mathbf{w} - \tilde{\mathbf{w}}^{k}, \mathbf{F}(\tilde{\mathbf{w}}^{k} - \mathbf{w}) + \mathbf{F} \mathbf{w} + \tilde{\mathbf{c}} \rangle \\ = \langle \mathbf{w} - \tilde{\mathbf{w}}^{k}, \mathbf{F} \mathbf{w} + \tilde{\mathbf{c}} \rangle, \end{array}
$$

where the second equality follows from the fact that F is skew symmetric (meaning $\mathbf{F}^{T} = - \mathbf{F})$ . We can thus conclude that (15.21) can be rewritten as

$$
H(\mathbf{x}, \mathbf{z}) - H(\tilde{\mathbf{x}}^{k}, \tilde{\mathbf{z}}^{k}) + \langle \mathbf{w} - \tilde{\mathbf{w}}^{k}, \mathbf{F} \mathbf{w} + \tilde{\mathbf{c}} \rangle \geq \frac{1}{2} \| \mathbf{w} - \mathbf{w}^{k + 1} \|_{\mathbf{H}}^{2} - \frac{1}{2} \| \mathbf{w} - \mathbf{w}^{k} \|_{\mathbf{H}}^{2}.
$$

Summing the above inequality over $k = 0, 1, \ldots, n$ yields the inequality

$$
(n + 1) H(\mathbf{x}, \mathbf{z}) - \sum_{k = 0}^{n} H(\tilde{\mathbf{x}}^{k}, \tilde{\mathbf{z}}^{k}) + \left\langle(n + 1) \mathbf{w} - \sum_{k = 0}^{n} \tilde{\mathbf{w}}^{k}, \mathbf{F} \mathbf{w} + \tilde{\mathbf{c}} \right\rangle \geq - \frac{1}{2} \| \mathbf{w} - \mathbf{w}^{0} \|_{\mathbf{H}}^{2}.
$$

Defining

$$
\mathbf{w}^{(n)} = \frac{1}{n + 1} \sum_{k = 0}^{n} \tilde{\mathbf{w}}^{k}, \mathbf{x}^{(n)} = \frac{1}{n + 1} \sum_{k = 0}^{n} \mathbf{x}^{k + 1}, \mathbf{z}^{(n)} = \frac{1}{n + 1} \sum_{k = 0}^{n} \mathbf{z}^{k + 1}
$$

and using the convexity of H, we obtain that

$$
H(\mathbf{x}, \mathbf{z}) - H(\mathbf{x}^{(n)}, \mathbf{z}^{(n)}) + \langle \mathbf{w} - \mathbf{w}^{(n)}, \mathbf{Fw} + \tilde{\mathbf{c}} \rangle + \frac{1}{2(n + 1)} \| \mathbf{w} - \mathbf{w}^{0} \|_{\mathbf{H}}^{2} \geq 0.
$$

Using (again) the skew-symmetry of $\mathbf{F}_{:}$ , we can conclude that the above inequality is the same as

$$
H(\mathbf{x}, \mathbf{z}) - H(\mathbf{x}^{(n)}, \mathbf{z}^{(n)}) + \langle \mathbf{w} - \mathbf{w}^{(n)}, \mathbf{Fw}^{(n)} + \tilde{\mathbf{c}} \rangle + \frac{1}{2(n + 1)} \| \mathbf{w} - \mathbf{w}^{0} \|_{\mathbf{H}}^{2} \geq 0.
$$

In other words, for any $\mathbf{x} \in \mathrm{dom}(h_{1})$ and $\mathbf{z} \in \mathrm{dom}(h_{1})$

$$
H(\mathbf{x}^{(n)}, \mathbf{z}^{(n)}) - H(\mathbf{x}, \mathbf{z}) + \langle \mathbf{w}^{(n)} - \mathbf{w}, \mathbf{Fw}^{(n)} + \tilde{\mathbf{c}} \rangle \leq \frac{1}{2(n + 1)} \| \mathbf{w} - \mathbf{w}^{0} \|_{\mathbf{H}}^{2}.\tag{15.22}
$$

Let $\left(\mathbf{x}^{*}, \mathbf{z}^{*} \right)$ be an optimal solution of problem (15.1). Then $H(\mathbf{x}^{*}, \mathbf{z}^{*}) = H_{\mathrm{opt}}$ and $\mathbf{A} \mathbf{x}^{*} + \mathbf{B} \mathbf{z}^{*} = \mathbf{c}$ . Plugging $\mathbf{x} = \mathbf{x}^{*}, \mathbf{z} = \mathbf{z}^{*}$ , and the expressions for $\mathbf{w}^{(n)}, \mathbf{w}, \mathbf{w}^{0}, \mathbf{\bar{F}}, \mathbf{H}, \tilde{\mathbf{c}}$ into (15.22), we obtain (denoting $\begin{array}{r}{\mathbf{y}^{(n)} = \frac{1}{n + 1} \sum_{k = 0}^{n} \tilde{\mathbf{y}}^{k})} \end{array}$

$$
H(\mathbf{x}^{(n)}, \mathbf{z}^{(n)}) - H_{\mathrm{opt}} + \langle \mathbf{x}^{(n)} - \mathbf{x}^{*}, \mathbf{A}^{T} \mathbf{y}^{(n)} \rangle + \langle \mathbf{z}^{(n)} - \mathbf{z}^{*}, \mathbf{B}^{T} \mathbf{y}^{(n)} \rangle
$$

$$
+ \langle \mathbf{y}^{(n)} - \mathbf{y}, - \mathbf{Ax}^{(n)} - \mathbf{Bz}^{(n)} + \mathbf{c} \rangle
$$

$$
\leq \frac{1}{2(n + 1)} \left\{\| \mathbf{x}^{*} - \mathbf{x}^{0} \|_{\mathbf{G}}^{2} + \| \mathbf{z}^{*} - \mathbf{z}^{0} \|_{\mathbf{C}}^{2} + \frac{1}{\rho} \| \mathbf{y} - \mathbf{y}^{0} \|^{2} \right\}.
$$

Cancelling terms and using the fact that $\mathbf{A} \mathbf{x}^{*} + \mathbf{B} \mathbf{z}^{*} = \mathbf{c}.$ , we obtain that the last inequality is the same as

$$
H(\mathbf{x}^{(n)}, \mathbf{z}^{(n)}) - H_{\mathrm{opt}} + \langle \mathbf{y}, \mathbf{Ax}^{(n)} + \mathbf{Bz}^{(n)} - \mathbf{c} \rangle \leq \frac{\| \mathbf{x}^{*} - \mathbf{x}^{0} \|_{\mathbf{G}}^{2} + \| \mathbf{z}^{*} - \mathbf{z}^{0} \|_{\mathbf{C}}^{2} + \frac{1}{\rho} \| \mathbf{y} - \mathbf{y}^{0} \|^{2}}{2(n + 1)}.
$$

Since the above inequality holds for any $\mathbf{y} \in \mathbb{R}^{m}$ , we can take the maximum of both sides over all $\mathbf{y} \in B[\mathbf{0}, \gamma]$ and obtain the inequality

$$
H(\mathbf{x}^{(n)}, \mathbf{z}^{(n)}) - H_{\mathrm{opt}} + \gamma \| \mathbf{Ax}^{(n)} + \mathbf{Bz}^{(n)} - \mathbf{c} \| \leq \frac{\| \mathbf{x}^{*} - \mathbf{x}^{0} \|_{\mathbf{G}}^{2} + \| \mathbf{z}^{*} - \mathbf{z}^{0} \|_{\mathbf{C}}^{2} + \frac{1}{\rho}(\gamma + \| \mathbf{y}^{0} \|)^{2}}{2(n + 1)}.
$$

Since $\gamma \geq 2 \| \mathbf{y}^{*} \|$ for some optimal dual solution $\mathbf{y}^{*}$ and strong duality holds (Theorem 15.3), it follows by Theorem 3.60 that the two inequalities (15.13) and (15.14) hold.

## 15.4 Minimizing $f_{1}(\mathbf{x}) + f_{2}(\mathbf{Ax})$

In this section we consider the model

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}} \{f_{1}(\mathbf{x}) + f_{2}(\mathbf{Ax})\},\tag{15.23}
$$

where $f_{1}, f_{2}$ are proper closed convex functions and $\mathbf{A} \in \mathbb{R}^{m \times n}$ $\mathrm{As}$ usual, $\rho > 0$ is a given constant. An implicit assumption will be that $f_{1}$ and $f_{2}$ are “proximable,” which loosely speaking means that the prox operator of $\lambda f_{1}$ and $\lambda f_{2}$ can be eficiently computed for any $\lambda > 0$ . This is obviously a “virtual” assumption, and its importance is only in the fact that it dictates the development of algorithms that rely on prox computations of $\lambda f_{1}$ and $\lambda f_{2}$

Problem (15.23) can rewritten as

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}, \mathbf{z} \in \mathbb{R}^{m}} \{f_{1}(\mathbf{x}) + f_{2}(\mathbf{z}): \mathbf{Ax} - \mathbf{z} = \mathbf{0}\}.\tag{15.24}
$$

This fits the general model (15.1) with $h_{1} = f_{1}, h_{2} = f_{2}, \mathbf{B} = - \mathbf{I},$ and $\mathbf c = \mathbf 0$ . A direct implementation of ADMM leads to the following scheme $(\rho > 0$ is a given constant):

$$
\mathbf{x}^{k + 1} \in \operatorname{argmin}_{\mathbf{x} \in \mathbb{R}^{n}} \left[f_{1}(\mathbf{x}) + \frac{\rho}{2} \left\| \mathbf{Ax} - \mathbf{z}^{k} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2} \right],\tag{15.25}
$$

$$
\mathbf{z}^{k + 1} = \operatorname{argmin}_{\mathbf{z} \in \mathbb{R}^{m}} \left[f_{2}(\mathbf{z}) + \frac{\rho}{2} \left\| \mathbf{Ax}^{k + 1} - \mathbf{z} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2} \right],
$$

$$
\mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} - \mathbf{z}^{k + 1}).
$$

The z-step can be rewritten as a prox step, thus resulting in the following algorithm for solving problem (15.23).

Algorithm 1 [ADMM for solving (15.23)—version 1]

- Initialization: $\begin{array}{r}{\mathbf{x}^{0} \in \mathbb{R}^{n}, \mathbf{z}^{0}, \mathbf{y}^{0} \in \mathbb{R}^{m}, \rho > 0.} \end{array}$

- General step $(k \geq 0)$

$$
\text{(a)} \mathbf{x}^{k + 1} \in \operatorname{argmin}_{\mathbf{x} \in \mathbb{R}^{n}} \left[f_{1}(\mathbf{x}) + \frac{\rho}{2} \left\| \mathbf{Ax} - \mathbf{z}^{k} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2} \right];
$$

$$
\text{(b)} \mathbf{z}^{k + 1} = \operatorname{prox}_{\frac{1}{\rho} f_{2}} \left(\mathbf{Ax}^{k + 1} + \frac{1}{\rho} \mathbf{y}^{k}\right);
$$

$$
\mathbf{\Gamma}(c) \mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} - \mathbf{z}^{k + 1}).
$$

Step (a) of Algorithm 1 might be dificult to compute since the minimization in step (a) is more involved than a prox computation due to the quadratic term $\mathbf{\Omega}_{2}^{\varrho} \mathbf{x}^{T} \mathbf{A}^{T} \mathbf{A} \mathbf{\dot{x}}$ . We can actually employ ADMM in a different way that will refrain from the type of computation made in step (a). For that, we will rewrite problem (15.23) as

$$
\min_{\mathbf{x}, \mathbf{w} \in \mathbb{R}^{n}, \mathbf{z} \in \mathbb{R}^{m}} \left\{f_{1}(\mathbf{w}) + f_{2}(\mathbf{z}): \mathbf{Ax} - \mathbf{z} = \mathbf{0}, \mathbf{x} - \mathbf{w} = \mathbf{0} \right\}.
$$

The above problem fits model (15.1) with $h_{1} \equiv 0, h_{2}(\mathbf{z}, \mathbf{w}) = f_{1}(\mathbf{z}) + f_{2}(\mathbf{w})$ 2 $\mathbf{B} =$ $- \mathbf{I}.$ and $\binom{\mathbf{A}}{\mathbf{I}}$ taking the place of A. The dual vector $\mathbf{y} \in \mathbb{R}^{m + n}$ is of the form $\mathbf{y} =(\mathbf{y}_{1}^{T}, \mathbf{y}_{2}^{T})^{T}$ , where $\mathbf{y}_{1} \in \mathbb{R}^{m}$ and $\mathbf{y}_{2} \in \mathbb{R}^{n}$ . In the above reformulation we have two blocks of vectors: x and $(\mathbf{z}, \mathbf{w})$ . The x-step is given by

$$
\begin{array}{rl} &{\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in \mathbb{R}^{n}} \left[\left\| \mathbf{Ax} - \mathbf{z}^{k} + \frac{1}{\rho} \mathbf{y}_{1}^{k} \right\|^{2} + \left\| \mathbf{x} - \mathbf{w}^{k} + \frac{1}{\rho} \mathbf{y}_{2}^{k} \right\|^{2} \right]} \\ &{\qquad =(\mathbf{I} + \mathbf{A}^{T} \mathbf{A})^{- 1} \left(\mathbf{A}^{T} \left[\mathbf{z}^{k} - \frac{1}{\rho} \mathbf{y}_{1}^{k} \right] + \mathbf{w}^{k} - \frac{1}{\rho} \mathbf{y}_{2}^{k}\right).} \end{array}
$$

The $(\mathbf{z}, \mathbf{w})$ -step is

$$
\begin{array}{l} \mathbf{z}^{k + 1} = \operatorname{prox}_{\frac{1}{\rho} f_{2}} \left(\mathbf{Ax}^{k + 1} + \frac{1}{\rho} \mathbf{y}_{1}^{k}\right), \\ \mathbf{w}^{k + 1} = \operatorname{prox}_{\frac{1}{\rho} f_{1}} \left(\mathbf{x}^{k + 1} + \frac{1}{\rho} \mathbf{y}_{2}^{k}\right).\end{array}
$$

The method is summarized in the following.

Algorithm 2 [ADMM for solving (15.23)—version 2]

- Initialization: $\begin{array}{r}{\mathbf{x}^{0}, \mathbf{w}^{0}, \mathbf{y}_{2}^{0} \in \mathbb{R}^{n}, \mathbf{z}^{0}, \mathbf{y}_{1}^{0} \in \mathbb{R}^{m}, \rho > 0.} \end{array}$

- General step $(k \geq 0)$

$$
\mathbf{x}^{k + 1} =(\mathbf{I} + \mathbf{A}^{T} \mathbf{A})^{- 1} \left(\mathbf{A}^{T} \left[\mathbf{z}^{k} - \frac{1}{\rho} \mathbf{y}_{1}^{k} \right] + \mathbf{w}^{k} - \frac{1}{\rho} \mathbf{y}_{2}^{k}\right),
$$

$$
\mathbf{z}^{k + 1} = \mathrm{prox}_{\frac{1}{\rho} f_{2}} \left(\mathbf{Ax}^{k + 1} + \frac{1}{\rho} \mathbf{y}_{1}^{k}\right),
$$

$$
\mathbf{w}^{k + 1} = \mathrm{prox}_{\frac{1}{\rho} f_{1}} \left(\mathbf{x}^{k + 1} + \frac{1}{\rho} \mathbf{y}_{2}^{k}\right),
$$

$$
\mathbf{y}_{1}^{k + 1} = \mathbf{y}_{1}^{k} + \rho(\mathbf{Ax}^{k + 1} - \mathbf{z}^{k + 1}),
$$

$$
\mathbf{y}_{2}^{k + 1} = \mathbf{y}_{2}^{k} + \rho(\mathbf{x}^{k + 1} - \mathbf{w}^{k + 1}).
$$

Algorithm 2 might still be too computationally demanding since it involves the evaluation of the inverse of $\mathbf{I} + \mathbf{A}^{T} \mathbf{\bar{A}}$ (or at least the evaluation of ${\bf A}^{T}{\bf A}$ and a solution of a linear system at each iteration), which might be a dificult task in largescale problems. We can alternatively employ AD-LPMM on problem (15.24) and obtain the following scheme that does not involve any matrix inverse calculations.

Algorithm 3 [AD-LPMM for solving (15.23)]

- Initialization: $\mathbf{x}^{0} \in \mathbb{R}^{n}, \mathbf{z}^{0}, \mathbf{y}^{0} \in \mathbb{R}^{m},{\boldsymbol \rho} > 0,{\boldsymbol \alpha} \geq \rho \lambda_{\operatorname{max}}(\mathbf{A}^{T} \mathbf{A}),{\boldsymbol \beta} \geq \rho.$

- General step $(k \geq 0)$

$$
\mathbf{x}^{k + 1} = \operatorname{prox}_{\frac{1}{\alpha} f_{1}} \left[\mathbf{x}^{k} - \frac{\rho}{\alpha} \mathbf{A}^{T} \left(\mathbf{Ax}^{k} - \mathbf{z}^{k} + \frac{1}{\rho} \mathbf{y}^{k}\right) \right],
$$

$$
\mathbf{z}^{k + 1} = \mathrm{prox}_{\frac{1}{\beta} f_{2}} \left[\mathbf{z}^{k} + \frac{\rho}{\beta} \left(\mathbf{Ax}^{k + 1} - \mathbf{z}^{k} + \frac{1}{\rho} \mathbf{y}^{k}\right) \right],
$$

$$
\mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} - \mathbf{z}^{k + 1}).
$$

The above scheme has the advantage that it only requires simple linear algebra operations (no more than matrix/vector multiplications) and prox evaluations of $\lambda f_{1}$ and $\lambda f_{2}$ for different values of $\lambda > 0$

Example 15.5 (l<sub>1</sub>-regularized least squares). Consider the problem

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}} \left\{\frac{1}{2} \| \mathbf{Ax} - \mathbf{b} \|_{2}^{2} + \lambda \| \mathbf{x} \|_{1} \right\},\tag{15.26}
$$

where $\mathbf{A} \in \mathbb{R}^{m \times n}, \mathbf{b} \in \mathbb{R}^{m}$ and $\lambda > 0$ . Problem (15.26) fits the composite model (15.23) with $f_{1}(\mathbf{x}) = \lambda \| \mathbf{x} \|$ <sub>1</sub> and $\begin{array}{r}{f_{2}(\mathbf{y}) \equiv \frac{1}{2} \| \mathbf{y} - \mathbf{b} \|_{2}^{2}} \end{array}$ . For any $\gamma > 0, \mathrm{prox}_{\gamma f_{1}} = \mathcal{T}_{\gamma \lambda}$ (by Example 6.8) and prox $\textstyle \gamma f_{2}(\mathbf{y}) ={\frac{\mathbf{y} + \gamma \mathbf{b}}{\gamma + 1}}$ (by Section 6.2.3). Step (a) of Algorithm 1 (first version of ADMM) has the form

$$
\mathbf{x}^{k + 1} \in \operatorname{argmin}_{\mathbf{x} \in \mathbb{R}^{n}} \left[\lambda \| \mathbf{x} \|_{1} + \frac{\rho}{2} \left\| \mathbf{Ax} - \mathbf{z}^{k} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2} \right],
$$

which actually means that this version of ADMM is completely useless since it suggests to solve an $l_{1}{\mathrm{- regularized}}$ least squares problem by a sequence of $l_{1}{\mathrm{- regularized}}$ least squares problems.

Algorithm 2 (second version of ADMM) has the following form.

ADMM, version 2 (Algorithm 2):

$$
\mathbf{x}^{k + 1} =(\mathbf{I} + \mathbf{A}^{T} \mathbf{A})^{- 1} \left(\mathbf{A}^{T} \left[\mathbf{z}^{k} - \frac{1}{\rho} \mathbf{y}_{1}^{k} \right] + \mathbf{w}^{k} - \frac{1}{\rho} \mathbf{y}_{2}^{k}\right),
$$

$$
\mathbf{z}^{k + 1} = \frac{\rho \mathbf{Ax}^{k + 1} + \mathbf{y}_{1}^{k} + \mathbf{b}}{\rho + 1},
$$

$$
\mathbf{w}^{k + 1} = \mathcal{T}_{\frac{\lambda}{\rho}} \left(\mathbf{x}^{k + 1} + \frac{1}{\rho} \mathbf{y}_{2}^{k}\right),
$$

$$
\mathbf{y}_{1}^{k + 1} = \mathbf{y}_{1}^{k} + \rho(\mathbf{Ax}^{k + 1} - \mathbf{z}^{k + 1}),
$$

$$
\mathbf{y}_{2}^{k + 1} = \mathbf{y}_{2}^{k} + \rho(\mathbf{x}^{k + 1} - \mathbf{w}^{k + 1}).
$$

An implementation of the above ADMM variant will require to compute the matrix ${\bf A}^{T}{\bf A}$ in a preprocess and to solve at each iteration an $n \times n$ linear system (or, alternatively, compute the inverse of $\mathbf{I} + \mathbf{A}^{T} \mathbf{A}$ in a preprocess). These operations might be dificult to execute in large-scale problems.

![Figure 15.1](../../../transcripts/mineru/first-order-methods-optimization/parts/p401-476/images/983260d9aa9a6bc71a8da7e37f463c86725d1552862c1d47bae7d63d3e3a65f9.jpg)  
Figure 15.1. Results of 100 iterations of ISTA, FISTA, ADMM (Algorithm 2) and AD-LPMM (Algorithm 3) on an l<sub>1</sub>-regularized least squares problem.

The general step of Algorithm 3 (which is essentially AD-LPMM) with $\alpha =$ $\lambda_{\operatorname{max}}(\mathbf{A}^{T} \mathbf{A}) \rho$ and $\beta = \rho$ takes the following form (denoting $L = \lambda_{\operatorname{max}}(\mathbf{A}^{T} \mathbf{A}))$ .

AD-LPMM (Algorithm 3):

$$
\mathbf{x}^{k + 1} = \mathcal{T}_{\frac{\lambda}{L \rho}} \left[\mathbf{x}^{k} - \frac{1}{L} \mathbf{A}^{T} \left(\mathbf{Ax}^{k} - \mathbf{z}^{k} + \frac{1}{\rho} \mathbf{y}^{k}\right) \right],
$$

$$
\mathbf{z}^{k + 1} = \frac{\rho \mathbf{Ax}^{k + 1} + \mathbf{y}^{k} + \mathbf{b}}{\rho + 1},
$$

$$
\mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} - \mathbf{z}^{k + 1}).
$$

The dominant computations in AD-LPMM are matrix/vector multiplications.

To illustrate the performance of the above two methods, we repeat the experiment described in Example 10.38 on the $l_{1}{\mathrm{- regularized}}$ least squares problem. We ran ADMM and AD-LPMM on the exact same instance, and the decay of the function values as a function of the iteration index k for the first 100 iterations is described in Figure 15.1. Clearly, ISTA and AD-LPMM exhibit the same performance, while ADMM seems to outperform both of them. This is actually not surprising since the computations carried out at each iteration of ADMM (solution of linear systems) are much heavier than the computations per iteration of AD-LPMM and ISTA (matrix/vector multiplications). In that respect, the comparison is in fact not fair and biased in favor of ADMM. What is definitely interesting is that FISTA significantly outperforms ADMM starting from approximately 50 iterations despite the fact that it is a simpler algorithm that requires substantially less computational efort per iteration. One possible reason is that FISTA is a method with a provably

$O(1 / k^{2})$ rate of convergence in function values, while ADMM is only guaranteed to converge at a rate of $O(1 / k)$ ■

Example 15.6 (robust regression). Consider the problem

$$
\min_{\mathbf{x}} \left\| \mathbf{A} \mathbf{x} - \mathbf{b} \right\|_{1},\tag{15.27}
$$

where $\mathbf{A} \in \mathbb{R}^{m \times n}$ and b $\in \mathbb{R}^{m}$ . Problem (15.27) fits the composite model (15.23) with $f_{1} \equiv 0$ and $f_{2}(\mathbf{y}) = \| \mathbf{y} - \mathbf{b} \|_{1}$ . Let $\rho > 0$ . For any $\gamma > 0, \operatorname{prox}_{\gamma f_{1}}(\mathbf{y}) = \mathbf{y}$ and $\mathrm{prox}_{\gamma f_{2}}(\mathbf{y}) = \mathcal{T}_{\gamma}(\mathbf{y} - \mathbf{b}) + \mathbf{b}$ <sup>1</sup>(by Example 6.8 and Theorem 6.11). Therefore, the <sup>2</sup>general step of Algorithm 1 (first version of ADMM) takes the following form.

ADMM, version 1 (Algorithm 1):

$$
\mathbf{x}^{k + 1} = \operatorname{argmin}_{\mathbf{x} \in \mathbb{R}^{m}} \left\| \mathbf{Ax} - \mathbf{z}^{k} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2},
$$

$$
\mathbf{z}^{k + 1} = \mathcal{T}_{\frac{1}{\rho}} \left(\mathbf{Ax}^{k + 1} + \frac{1}{\rho} \mathbf{y}^{k} - \mathbf{b}\right) + \mathbf{b},
$$

$$
\mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} - \mathbf{z}^{k + 1}).
$$

The general step of Algorithm 2 (second version of ADMM) reads as follows:

$$
\mathbf{x}^{k + 1} =(\mathbf{I} + \mathbf{A}^{T} \mathbf{A})^{- 1} \left(\mathbf{A}^{T} \left[\mathbf{z}^{k} - \frac{1}{\rho} \mathbf{y}_{1}^{k} \right] + \mathbf{w}^{k} - \frac{1}{\rho} \mathbf{y}_{2}^{k}\right),
$$

$$
\mathbf{z}^{k + 1} = \mathcal{T}_{\frac{1}{\rho}} \left(\mathbf{Ax}^{k + 1} + \frac{1}{\rho} \mathbf{y}_{1}^{k} - \mathbf{b}\right) + \mathbf{b},
$$

$$
\mathbf{w}^{k + 1} = \mathbf{x}^{k + 1} + \frac{1}{\rho} \mathbf{y}_{2}^{k},
$$

$$
\begin{array}{r} \mathbf{y}_{1}^{k + 1} = \mathbf{y}_{1}^{k} + \rho(\mathbf{Ax}^{k + 1} - \mathbf{z}^{k + 1}), \\ \mathbf{y}_{2}^{k + 1} = \mathbf{y}_{2}^{k} + \rho(\mathbf{x}^{k + 1} - \mathbf{w}^{k + 1}).\end{array}
$$

Plugging the expression for $\mathbf{w}^{k + 1}$ into the update formula of $\mathbf{y}_{2}^{k + 1}$ , we obtain that $\mathbf{y}_{2}^{k + \bar{1}} = \mathbf{0}$ . Thus, if we start with $\mathbf{y}_{2}^{0} = 0$ , then $\mathbf{y}_{2}^{k} = \mathbf{0}$ for all $k \geq 0$ , and consequently $\mathbf{w}^{k} = \mathbf{x}^{k}$ for all k. The algorithm thus reduces to the following.

ADMM, version 2 (Algorithm 2):

$$
\mathbf{x}^{k + 1} =(\mathbf{I} + \mathbf{A}^{T} \mathbf{A})^{- 1} \left(\mathbf{A}^{T} \left[\mathbf{z}^{k} - \frac{1}{\rho} \mathbf{y}_{1}^{k} \right] + \mathbf{x}^{k}\right),
$$

$$
\mathbf{z}^{k + 1} = \mathcal{T}_{\frac{1}{\rho}} \left(\mathbf{Ax}^{k + 1} + \frac{1}{\rho} \mathbf{y}_{1}^{k} - \mathbf{b}\right) + \mathbf{b},
$$

$$
\mathbf{y}_{1}^{k + 1} = \mathbf{y}_{1}^{k} + \rho(\mathbf{Ax}^{k + 1} - \mathbf{z}^{k + 1}).
$$

Algorithm 3 (which is essentially AD-LPMM) with $\alpha = \lambda_{\mathrm{max}}(\mathbf{A}^{T} \mathbf{A}) \rho$ and $\beta = \rho$ takes the following form (denoting $L = \lambda_{\operatorname{max}}(\mathbf{A}^{T} \mathbf{A}))$ .

AD-LPMM (Algorithm 3):

$$
\mathbf{x}^{k + 1} = \mathbf{x}^{k} - \frac{1}{L} \mathbf{A}^{T} \left(\mathbf{Ax}^{k} - \mathbf{z}^{k} + \frac{1}{\rho} \mathbf{y}^{k}\right),
$$

$$
\begin{array}{l} \mathbf{z}^{k + 1} = \mathcal{T}_{\frac{1}{\rho}} \left[\left(\mathbf{Ax}^{k + 1} - \mathbf{b} + \frac{1}{\rho} \mathbf{y}^{k}\right) \right] + \mathbf{b}, \\ \mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} - \mathbf{z}^{k + 1}).\end{array}
$$

Example 15.7 (basis pursuit). Consider the problem

$$
\begin{array}{ll} \min & \| \mathbf{x} \|_{1} \\ \text{s.t.} & \mathbf{Ax} = \mathbf{b}, \end{array}\tag{15.28}
$$

where $\mathbf{A} \in \mathbb{R}^{m \times n}$ and b $\in \mathbb{R}^{m}$ . Problem (15.28) fits the composite model (15.23) with $f_{1}(\mathbf{x}) = \| \mathbf{x} \|_{1}$ and $f_{2} = \delta_{\{{\bf b}\}}$ . Let $\rho > 0$ . For any $\gamma > 0$ , $\mathrm{prox}_{\gamma f_{1}} = \mathcal{T}_{\gamma}$ (by Example 6.8) and $\operatorname{prox}_{\gamma_{2} f_{2}} \equiv \mathbf{b}$ <sup>1</sup>. Algorithm 1 is actually not particularly imple-<sup>2 2</sup>mentable since its first update step is

$$
\mathbf{x}^{k + 1} \in \operatorname{argmin}_{\mathbf{x} \in \mathbb{R}^{n}} \left\{\| \mathbf{x} \|_{1} + \frac{\rho}{2} \left\| \mathbf{Ax} - \mathbf{z}^{k} + \frac{1}{\rho} \mathbf{y}^{k} \right\|^{2} \right\},
$$

which does not seem to be simpler to solve than the original problem (15.28).

Algorithm 2 takes the following form (assuming that ${\bf z}^{0} ={\bf b})$

ADMM, version 2 (Algorithm 2):

$$
\mathbf{x}^{k + 1} = \left(\mathbf{I} + \mathbf{A}^{T} \mathbf{A}\right)^{- 1} \left(\mathbf{A}^{T} \left[\mathbf{b} - \frac{1}{\rho} \mathbf{y}_{1}^{k} \right] + \mathbf{w}^{k} - \frac{1}{\rho} \mathbf{y}_{2}^{k}\right),
$$

$$
\mathbf{w}^{k + 1} = \mathcal{T}_{\frac{1}{\rho}} \left(\mathbf{x}^{k + 1} + \frac{1}{\rho} \mathbf{y}_{2}^{k}\right),
$$

$$
\begin{array}{l} \mathbf{y}_{1}^{k + 1} = \mathbf{y}_{1}^{k} + \rho(\mathbf{Ax}^{k + 1} - \mathbf{b}), \\ \mathbf{y}_{2}^{k + 1} = \mathbf{y}_{2}^{k} + \rho(\mathbf{x}^{k + 1} - \mathbf{w}^{k + 1}).\end{array}
$$

Finally, assuming that ${\bf z}^{0} ={\bf b}$ , Algorithm 3 with $\alpha = \lambda_{\mathrm{max}}(\mathbf{A}^{T} \mathbf{A}) \rho$ and $\beta = \rho$ reduces to the following simple update steps (denoting $L = \lambda_{\operatorname{max}}(\mathbf{A}^{T} \mathbf{A}))$ .

AD-LPMM (Algorithm 3):

$$
\begin{array}{l} \mathbf{x}^{k + 1} = \mathcal{T}_{\frac{1}{\rho L}} \left[\mathbf{x}^{k} - \frac{1}{L} \mathbf{A}^{T} \left(\mathbf{Ax}^{k} - \mathbf{b} + \frac{1}{\rho} \mathbf{y}^{k}\right) \right], \\ \mathbf{y}^{k + 1} = \mathbf{y}^{k} + \rho(\mathbf{Ax}^{k + 1} - \mathbf{b}).\end{array}
$$

Example 15.8 (minimizing $\textstyle \sum_{i = 1}^{p} g_{i}(\mathbf{A}_{i} \mathbf{x}))$ . Consider now the problem

$$
\min_{\mathbf{x} \in \mathbb{R}^{n}} \sum_{i = 1}^{p} g_{i}(\mathbf{A}_{i} \mathbf{x}),\tag{15.29}
$$

where $g_{1}, g_{2}, \dotsc, g_{p}$ are proper closed and convex functions and $\mathbf{A}_{i} \in \mathbb{R}^{m_{i} \times n}$ for all $i = 1, 2, \dotsc, p.$ Problem (15.29) fits the composite model (15.23) with

$f_{1} \equiv 0;$

$\begin{array}{r}{f_{2}(\mathbf{y}) = \sum_{i = 1}^{p} g_{i}(\mathbf{y}_{i})} \end{array}$ , where we assume that $\mathbf{y} \in \mathbb{R}^{m_{1} + m_{2} + \cdots + m_{p}}$ is of the form $\mathbf{y} =(\mathbf{y}_{1}^{T}, \mathbf{\overline{{y}}}_{2}^{\bar{T}}, \cdot \cdot \cdot, \mathbf{y}_{p}^{\bar{T}})^{T}$ , where $\mathbf{y}_{i} \in \mathbb{R}^{m_{i}}$ ;

- the matrix $\mathbf{A} \in \mathbb{R}^{(m_{1} + m_{2} + \ldots + m_{p})}$ <sup>×n</sup> given by $\mathbf{A} =(\mathbf{A}_{1}^{T}, \mathbf{A}_{2}^{T}, \ldots, \mathbf{A}_{p}^{T})^{T}$

For any $\gamma > 0$ , pro $\mathfrak{c}_{\gamma f_{1}}(\mathbf{x}) = \mathbf{x}$ and prox ${}_{\gamma f_{2}}(\mathbf{y})_{i} = \operatorname{prox}_{\gamma g_{i}}(\mathbf{y}_{i}), i = 1, 2, \ldots, p$ (by <sup>1 2</sup>Theorem 6.6). The general update step of the first version of ADMM (Algorithm 1) has the form

$$
\begin{array}{rl} &{\mathbf{x}^{k + 1} \in \operatorname{argmin}_{\mathbf{x} \in \mathbb{R}^{n}} \sum_{i = 1}^{p} \left\| \mathbf{A}_{i} \mathbf{x} - \mathbf{z}_{i}^{k} + \frac{1}{\rho} \mathbf{y}_{i}^{k} \right\|^{2},} \\ &{\mathbf{z}_{i}^{k + 1} = \mathrm{prox}_{\frac{1}{\rho} g_{i}} \left(\mathbf{A}_{i} \mathbf{x}^{k + 1} + \frac{1}{\rho} \mathbf{y}_{i}^{k}\right), \quad i = 1, 2, \ldots, p,} \\ &{\mathbf{y}_{i}^{k + 1} = \mathbf{y}_{i}^{k} + \rho(\mathbf{A}_{i} \mathbf{x}^{k + 1} - \mathbf{z}_{i}^{k + 1}), \quad i = 1, 2, \ldots, p.} \end{array}\tag{15.30}
$$

In the case where A has full column rank, step (15.30) can be written more explicitly, leading to the following representation.

ADMM, version 1 (Algorithm 1):

$$
\mathbf{x}^{k + 1} = \left(\sum_{i = 1}^{p} \mathbf{A}_{i}^{T} \mathbf{A}_{i}\right)^{- 1} \sum_{i = 1}^{p} \mathbf{A}_{i}^{T} \left(\mathbf{z}_{i}^{k} - \frac{1}{\rho} \mathbf{y}_{i}^{k}\right),
$$

$$
\mathbf{z}_{i}^{k + 1} = \mathrm{prox}_{\frac{1}{\rho} g_{i}} \left(\mathbf{A}_{i} \mathbf{x}^{k + 1} + \frac{1}{\rho} \mathbf{y}_{i}^{k}\right), \quad i = 1, 2, \ldots, p,
$$

$$
\mathbf{y}_{i}^{k + 1} = \mathbf{y}_{i}^{k} + \rho(\mathbf{A}_{i} \mathbf{x}^{k + 1} - \mathbf{z}_{i}^{k + 1}), i = 1, 2, \ldots, p.
$$

The second version of ADMM (Algorithm 2) is not simpler than the first version, and we will therefore not write it explicitly. AD-LPMM (Algorithm 3) invoked with the constants $\begin{array}{r}{\alpha = \lambda_{\operatorname{max}}(\sum_{i = 1}^{p} \mathbf{A}_{i}^{\bar{T}} \mathbf{A}_{i}) \rho} \end{array}$ and $\beta = \rho$ reads as follows (denoting $\begin{array}{r}{L = \lambda_{\operatorname{max}}(\sum_{i = 1}^{p} \mathbf{A}_{i}^{T} \mathbf{A}_{i}))} \end{array}$ ).

AD-LPMM (Algorithm 3):

$$
\mathbf{x}^{k + 1} = \mathbf{x}^{k} - \frac{1}{L} \sum_{i = 1}^{p} \mathbf{A}_{i}^{T} \left(\mathbf{A}_{i} \mathbf{x}^{k} - \mathbf{z}_{i}^{k} + \frac{1}{\rho} \mathbf{y}_{i}^{k}\right),
$$

$$
\mathbf{z}_{i}^{k + 1} = \mathrm{prox}_{\frac{1}{\rho} g_{i}} \left(\mathbf{A}_{i} \mathbf{x}^{k + 1} + \frac{1}{\rho} \mathbf{y}_{i}^{k}\right), i = 1, 2, \ldots, p,
$$

$$
\mathbf{y}_{i}^{k + 1} = \mathbf{y}_{i}^{k} + \rho(\mathbf{A}_{i} \mathbf{x}^{k + 1} - \mathbf{z}_{i}^{k + 1}), i = 1, 2, \ldots, p.
$$

Appendix A

# Strong Duality and Optimality Conditions

The following strong duality theorem is taken from [29, Proposition 6.4.4].

Theorem A.1 (strong duality theorem). Consider the optimization problem

$$
\begin{array}{lll} f_{\mathrm{opt}} = & \min & f(\mathbf{x}) \\ & s.t.& g_{i}(\mathbf{x}) \leq 0, \quad i = 1, 2, \ldots, m, \\ & & h_{j}(\mathbf{x}) \leq 0, \quad j = 1, 2, \ldots, p, \\ & & s_{k}(\mathbf{x}) = 0, \quad k = 1, 2, \ldots, q, \\ & & \mathbf{x} \in X, \end{array}\tag{A.1}
$$

where $X = P \cap C$ with $P \subseteq \mathbb{E}$ being a convex polyhedral set and $C \subseteq \mathbb{E}$ convex. The functions $f, g_{i}, i = 1, 2, \ldots, m : \mathbb{E}(- \infty, \infty]$ are convex, and their domains satisfy $X \ \subseteq \ \operatorname{dom}(f), X \ \subseteq \ \operatorname{dom}(g_{i}), \i \ = \1, 2, \ldots, m$ . The functions $h_{j}, s_{k}, j \ =$ $1, 2, \ldots, p, k = 1, 2, \ldots, q.$ , are Affine functions. Suppose there exist

(i) a feasible solution x¯ satisfying $g_{i}(\bar{\bf x}) < 0$ for all $i = 1, 2, \dots, m,$

(ii) a vector satisfying all the Affine constraints $h_{j}(\mathbf{x}) \leq 0, j = 1, 2, \ldots, p, s_{k}(\mathbf{x}) =$ $0, k = 1, 2, \ldots, q$ , and that is in $P \cap{\mathrm{ri}}(C)$

Then if problem (A.1) has a finite optimal value, then the optimal value of the dual problem

$$
q_{\text{opt}} = \max \{q(\boldsymbol{\lambda}, \boldsymbol{\eta}, \boldsymbol{\mu}):(\boldsymbol{\lambda}, \boldsymbol{\eta}, \boldsymbol{\mu}) \in \operatorname{dom}(- q)\},
$$

where $q : \mathbb{R}_{+}^{m} \times \mathbb{R}_{+}^{p} \times \mathbb{R}^{q} \to \mathbb{R} \cup \{- \infty\}$ is given by

$$
\begin{array}{l} q(\boldsymbol{\lambda}, \boldsymbol{\eta}, \boldsymbol{\mu}) = \underset{\mathbf{x} \in X}{\min} L(\mathbf{x}, \boldsymbol{\lambda}, \boldsymbol{\eta}, \boldsymbol{\mu}) \\ = \underset{\mathbf{x} \in X}{\min} \left[f(\mathbf{x}) + \sum_{i = 1}^{m} \lambda_{i} g_{i}(\mathbf{x}) + \sum_{j = 1}^{p} \eta_{j} h_{j}(\mathbf{x}) + \sum_{k = 1}^{q} \mu_{k} s_{k}(\mathbf{x}) \right], \end{array}
$$

is attained, and the optimal values of the primal and dual problems are the same:

$$
f_{\mathrm{opt}} = q_{\mathrm{opt}}.
$$

We also recall some well-known optimality conditions expressed in terms of the Lagrangian function in cases where strong duality holds.

Theorem A.2 (optimality conditions under strong duality). Consider the problem

$$
\begin{array}{ll} \min & f(\mathbf{x}) \\ s.t.& g_{i}(\mathbf{x}) \leq 0, i = 1, 2, \ldots, m, \\ & h_{j}(\mathbf{x}) = 0, j = 1, 2, \ldots, p, \\ & \mathbf{x} \in X, \end{array}\tag{P}
$$

where $f, g_{1}, g_{2}, \ldots, g_{m}, h_{1}, h_{2}, \ldots, h_{p} : \mathbb{E} \to(- \infty, \infty]$ , and $X \subseteq \mathbb{E}$ . Assume that $X \subseteq$ dom(f), X ⊆ dom $\left(g_{i} \right)$ , and $X ~ \subseteq ~ \operatorname{dom}(h_{j})$ for all $i = 1, 2, \ldots, m, \j =$ $1, 2, \ldots, p.\Let \(\mathrm{D})$ be the following dual problem:

$$
\begin{array}{ll} \max & q(\boldsymbol{\lambda}, \boldsymbol{\mu}) \\ s.t.&(\boldsymbol{\lambda}, \boldsymbol{\mu}) \in \operatorname{dom}(- q), \end{array}\tag{D}
$$

where

$$
\begin{array}{c} q(\boldsymbol{\lambda}, \boldsymbol{\mu}) = \min_{\mathbf{x} \in X} \left\{L(\mathbf{x}; \boldsymbol{\lambda}, \boldsymbol{\mu}) \equiv f(\mathbf{x}) + \sum_{i = 1}^{m} \lambda_{i} g_{i}(\mathbf{x}) + \sum_{j = 1}^{p} \mu_{j} h_{j}(\mathbf{x}) \right\}, \\ \operatorname{dom}(- q) = \{(\boldsymbol{\lambda}, \boldsymbol{\mu}) \in \mathbb{R}_{+}^{m} \times \mathbb{R}^{p}: q(\boldsymbol{\lambda}, \boldsymbol{\mu}) > - \infty\}.\end{array}
$$

Suppose that the optimal value of problem (P) is finite and equal to the optimal value of problem (D). Then $\mathbf{x}^{*},(\lambda^{*}, \mu^{*})$ are optimal solutions of problems (P) and (D), respectively, if and only if

(i) $\mathbf{x}^{*}$ is a feasible solution of (P);

(ii) ${\boldsymbol{\lambda}}^{*} \geq \mathbf{0},$

(iii) $\lambda_{i}^{*} g_{i}(\mathbf{x}^{*}) = 0, i = 1, 2, \ldots, m;$

(iv) $\mathbf{x}^{*} \in \operatorname{argmin}_{\mathbf{x} \in X} L(\mathbf{x}; \pmb{\lambda}^{*}, \pmb{\mu}^{*})$

Proof. Denote the optimal values of problem (P) and (D) by $f_{\mathrm{opt}}$ and $q_{\mathrm{opt}}$ , respectively. An underlying assumption of the theorem is that $f_{\mathrm{opt}} = q_{\mathrm{opt}}$ . If $\mathbf{x}^{*}$ and $(\lambda^{*}, \mu^{*})$ are the optimal solutions of problems (P) and (D), then obviously (i) and

(ii) are satisfied. In addition,

$$
\begin{array}{l} f_{\mathrm{opt}} = q_{\mathrm{opt}} = q(\boldsymbol{\lambda}^{*}, \boldsymbol{\mu}^{*}) \\ \quad = \min_{\mathbf{x} \in X} L(\mathbf{x}, \boldsymbol{\lambda}^{*}, \boldsymbol{\mu}^{*}) \\ \quad \leq L(\mathbf{x}^{*}, \boldsymbol{\lambda}^{*}, \boldsymbol{\mu}^{*}) \\ \quad = f(\mathbf{x}^{*}) + \sum_{i = 1}^{m} \lambda_{i}^{*} g_{i}(\mathbf{x}^{*}) + \sum_{j = 1}^{p} \mu_{j}^{*} h_{j}(\mathbf{x}^{*}) \\ \quad \leq f(\mathbf{x}^{*}), \end{array}
$$

where the last inequality follows by the facts that $h_{j}(\mathbf{x}^{*}) ~ = ~ 0, ~ \lambda_{i}^{*} ~ \ge ~ 0.$ , and $g_{i}(\mathbf{x}^{*}) ~ \leq ~ 0$ . Since $f_{\mathrm{opt}} ~ = ~ f(\mathbf{x}^{*})$ , all of the inequalities in the above chain of equalities and inequalities are actually equalities. This implies in particular that $\mathbf{x}^{*} \in \operatorname{argmin}_{\mathbf{x} \in X} L(\mathbf{x}, \pmb{\lambda}^{*}, \pmb{\mu}^{*})$ , meaning property (iv), and that $\begin{array}{r}{\sum_{i = 1}^{m} \lambda_{i}^{*} g_{i}(\mathbf{x}^{*}) = 0} \end{array}$ 2 which by the fact that $\lambda_{i}^{*} g_{i}(\mathbf{x}^{*}) \leq 0$ for any i, implies that $\lambda_{i}^{*} g_{i}(\mathbf{x}^{*}) = 0$ for any i, showing the validity of property (iii).

To prove the reverse direction, assume that properties (i)–(iv) are satisfied. Then

$$
\begin{array}{lll} q(\boldsymbol{\lambda}^{*}, \boldsymbol{\mu}^{*}) & = \min_{\mathbf{x} \in X} L(\mathbf{x}, \boldsymbol{\lambda}^{*}, \boldsymbol{\mu}^{*}) &[\text{definition of} q] \\ & = L(\mathbf{x}^{*}, \boldsymbol{\lambda}^{*}, \boldsymbol{\mu}^{*}) &[\text{property (iv)}] \\ & = f(\mathbf{x}^{*}) + \sum_{i = 1}^{m} \lambda_{i}^{*} g_{i}(\mathbf{x}^{*}) + \sum_{j = 1}^{p} \mu_{j}^{*} h_{j}(\mathbf{x}^{*}) \\ & = f(\mathbf{x}^{*}).&[\text{property (iii)}] \end{array}
$$

By the weak duality theorem, since $\mathbf{x}^{*}$ and $(\lambda^{*}, \mu^{*})$ are primal and dual feasible solutions with equal primal and dual objective functions, it follows that they are the optimal solutions of their corresponding problems.

Appendix B Tables

Support Functions

<table><tr><td>C</td><td> $\sigma_{C}(\mathbf{y})$ </td><td>Assumptions</td><td>Reference</td></tr><tr><td> $\{\mathbf{b}_{1},\mathbf{b}_{2},\ldots,\mathbf{b}_{n}\}$ </td><td> $\max_{i=1,2,\ldots,n}\langle\mathbf{b}_{i},\mathbf{y}\rangle$ </td><td> $\mathbf{b}_{i}\in\mathbb{E}$ </td><td>Example 2.25</td></tr><tr><td>K</td><td> $\delta_{K^{\circ}}(\mathbf{y})$ </td><td>K - cone</td><td>Example 2.26</td></tr><tr><td> $\mathbb{R}_{+}^{n}$ </td><td> $\delta_{\mathbb{R}_{-}^{n}}(\mathbf{y})$ </td><td> $\mathbb{E}=\mathbb{R}^{n}$ </td><td>Example 2.27</td></tr><tr><td> $\Delta_{n}$ </td><td> $\max\{y_{1},y_{2},\ldots,y_{n}\}$ </td><td> $\mathbb{E}=\mathbb{R}^{n}$ </td><td>Example 2.36</td></tr><tr><td> $\{\mathbf{x}\in\mathbb{R}^{n}:\mathbf{A}\mathbf{x}\leq\mathbf{0}\}$ </td><td> $\delta_{\{\mathbf{A}^{T}\boldsymbol{\lambda}:\boldsymbol{\lambda}\in\mathbb{R}_{+}^{m}\}}(\mathbf{y})$ </td><td> $\mathbb{E}=\mathbb{R}^{n},\mathbf{A}\in\mathbb{R}^{m\times n}$ </td><td>Example 2.29</td></tr><tr><td> $\{\mathbf{x}\in\mathbb{R}^{n}:\mathbf{B}\mathbf{x}=\mathbf{b}\}$ </td><td> $\langle\mathbf{y},\mathbf{x}_{0}\rangle+\delta_{\text{Range}(\mathbf{B}^{T})}(\mathbf{y})$ </td><td> $\mathbb{E}=\mathbb{R}^{n},\mathbf{B}\in\mathbb{R}^{m\times n},\mathbf{b}\in\mathbb{R}^{m},\mathbf{B}\mathbf{x}_{0}=\mathbf{b}$ </td><td>Example 2.30</td></tr><tr><td> $B_{\|\cdot\|}[0,1]$ </td><td> $\| \mathbf{y}\|_{*}$ </td><td>-</td><td>Example 2.31</td></tr></table>

Weak Subdiferential Results

<table><tr><td>Function</td><td>Weak result</td><td>Setting</td><td>Reference</td></tr><tr><td> $-q = \text{negative dual function}$ </td><td> $-\mathbf{g}(\mathbf{x}_{0}) \in \partial(-q)(\boldsymbol{\lambda}_{0})$ </td><td> $q(\boldsymbol{\lambda}) = \min_{\mathbf{x} \in X} f(\mathbf{x}) + \boldsymbol{\lambda}^{T} \mathbf{g}(\mathbf{x}), f : \mathbb{E} \to \mathbb{R}, \mathbf{g} : \mathbb{E} \to \mathbb{R}^{m}, \mathbf{x}_{0} = \text{a minimizer of} f(\mathbf{x}) + \boldsymbol{\lambda}_{0}^{T} \mathbf{g}(\mathbf{x}) \text{over} X$ </td><td>Example 3.7</td></tr><tr><td> $f(\mathbf{X}) = \lambda_{\max}(\mathbf{X})$ </td><td> $\mathbf{v}\mathbf{v}^{T} \in \partial f(\mathbf{X})$ </td><td> $f : \mathbb{S}^{n} \to \mathbb{R}, \mathbf{v} = \text{normalized maximum eigenvector of} X \in \mathbb{S}^{n}$ </td><td>Example 3.8</td></tr><tr><td> $f(\mathbf{x}) = \| \mathbf{x} \|_{1}$ </td><td> $\text{sgn}(\mathbf{x}) \in \partial f(\mathbf{x})$ </td><td> $\mathbb{E} = \mathbb{R}^{n}$ </td><td>Example 3.42</td></tr><tr><td> $f(\mathbf{x}) = \lambda_{\max}(\mathbf{A}_{0} + \sum_{i=1}^{m} x_{i} \mathbf{A}_{i})$ </td><td> $(\tilde{\mathbf{y}}^{T} \mathbf{A}_{i} \tilde{\mathbf{y}})^{m}_{i=1} \in \partial f(\mathbf{x})$ </td><td> $\tilde{\mathbf{y}} = \text{normalized maximum eigenvector of} \mathbf{A}_{0} + \sum_{i=1}^{m} x_{i} \mathbf{A}_{i}$ </td><td>Example 3.56</td></tr></table>

Strong Subdiferential Results

<table><tr><td>f(x)</td><td> $\partial f(x)$ </td><td>Assumptions</td><td>Reference</td></tr><tr><td> $\|x\|$ </td><td> $B_{\|\cdot\|*}[0,1]$ </td><td>x=0</td><td>Example 3.3</td></tr><tr><td> $\|x\|_1$ </td><td> $\left\{\sum_{i\in I_\neq(\mathbf{x})}\text{sgn}(x_i)\mathbf{e}_i+\sum_{i\in I_0(\mathbf{x})}[-\mathbf{e}_i,\mathbf{e}_i]\right\}$ </td><td> $\mathbb{E}=\mathbb{R}^n,I_\neq(\mathbf{x})=\{i:x_i\neq 0\},I_0(\mathbf{x})=\{i:x_i=0\}.$ </td><td>Example 3.41</td></tr><tr><td> $\|x\|_2$ </td><td> $\left\{\begin{array}{l}\left\{\frac{\mathbf{x}}{\|\mathbf{x}\|_2}\right\},\quad\mathbf{x}\neq\mathbf{0},\\B_{\|\cdot\|_2}[0,1],\quad\mathbf{x}=\mathbf{0}.\end{array}\right.$ </td><td> $\mathbb{E}=\mathbb{R}^n$ </td><td>Example 3.34</td></tr><tr><td> $\|x\|_\infty$ </td><td> $\left\{\sum_{i\in I(\mathbf{x})}\lambda_isgn(x_i)\mathbf{e}_i:\sum_{i\in I(\mathbf{x})}\lambda_i=1\atop \lambda_i\geq 0\right\}$ </td><td> $\mathbb{E}=\mathbb{R}^n,I(\mathbf{x})=\{i:||\mathbf{x}\|_\infty=|x_i|\},\mathbf{x}\neq\mathbf{0}$ </td><td>Example 3.52</td></tr><tr><td> $\max(\mathbf{x})$ </td><td> $\left\{\sum_{i\in I(\mathbf{x})}\lambda_i\mathbf{e}_i:\sum_{i\in I(\mathbf{x})}\lambda_i=1,\lambda_i\geq 0\right\}$ </td><td> $\mathbb{E}=\mathbb{R}^n,I(\mathbf{x})=\{i:\max(\mathbf{x})=x_i\}$ </td><td>Example 3.51</td></tr><tr><td> $\max(\mathbf{x})$ </td><td> $\Delta_n$ </td><td> $\mathbb{E}=\mathbb{R}^n,\mathbf{x}=\alpha\mathbf{e}$  for some  $\alpha\in\mathbb{R}$ </td><td>Example 3.51</td></tr><tr><td> $\delta_S(\mathbf{x})$ </td><td> $N_S(\mathbf{x})$ </td><td> $\emptyset\neq S\subseteq\mathbb{E}$ </td><td>Example 3.5</td></tr><tr><td> $\delta_{B[0,1]}(\mathbf{x})$ </td><td> $\left\{\begin{array}{ll}\{\mathbf{y}\in\mathbb{E}^*:||\mathbf{y}\|_*\leq\langle\mathbf{y},\mathbf{x}\rangle\},&||\mathbf{x}\|\leq 1,\\ \emptyset,&||\mathbf{x}\|>1.\end{array}\right.$ </td><td></td><td>Example 3.6</td></tr><tr><td> $\|Ax+b\|_1$ </td><td> $\sum_{i\in I_\neq(\mathbf{x})}\text{sgn}(\mathbf{a}_i^T\mathbf{x}+b_i)\mathbf{a}_i+\sum_{i\in I_0(\mathbf{x})}[-\mathbf{a}_i,\mathbf{a}_i]$ </td><td> $\mathbb{E}=\mathbb{R}^n,\mathbf{A}\in\mathbb{R}^{m\times n},\mathbf{b}\in\mathbb{R}^m,I_\neq(\mathbf{x})=\{i:\mathbf{a}_i^T\mathbf{x}+b_i\neq 0\},I_0(\mathbf{x})=\{i:\mathbf{a}_i^Tx+b_i=0\}$ </td><td>Example 3.44</td></tr><tr><td> $\|Ax+b\|_2$ </td><td> $\left\{\begin{array}{ll}\frac{\mathbf{A}^T(\mathbf{A}\mathbf{x}+\mathbf{b})}{||\mathbf{A}\mathbf{x}+\mathbf{b}\|_2},&\mathbf{A}\mathbf{x}+\mathbf{b}\neq\mathbf{0},\\ \mathbf{A}^TB_{\|\cdot\|_2}[0,1],&\mathbf{A}\mathbf{x}+\mathbf{b}=\mathbf{0}.\end{array}\right.$ </td><td> $\mathbb{E}=\mathbb{R}^n,\mathbf{A}\in\mathbb{R}^{m\times n},\mathbf{b}\in\mathbb{R}^m$ </td><td>Example 3.45</td></tr><tr><td> $\|Ax+b\|_\infty$ </td><td> $\left\{\sum_{i\in I_x}\lambda_isgn(\mathbf{a}_i^T\mathbf{x}+b_i)\mathbf{a}_i:\sum_{i\in I_x}\lambda_i=1\atop \lambda_i\geq 0\right\}$ </td><td> $\mathbb{E}=\mathbb{R}^n,\mathbf{A}\in\mathbb{R}^{m\times n},\mathbf{b}\in\mathbb{R}^m,I_x=\{i:||\mathbf{A}\mathbf{x}+\mathbf{b}\|_\infty=|\mathbf{a}_i^Tx+b_i|\},\mathbf{A}\mathbf{x}+\mathbf{b}\neq\mathbf{0}$ </td><td>Example 3.54</td></tr><tr><td> $\|Ax+b\|_\infty$ </td><td> $\mathbf{A}^TB_{\|\cdot\|_1}[0,1]$ </td><td>same as above but with  $\mathbf{A}\mathbf{x}+\mathbf{b}=\mathbf{0}$ </td><td>Example 3.54</td></tr><tr><td> $\max_i\{\mathbf{a}_i^Tx+\mathbf{b}\}$ </td><td> $\left\{\sum_{i\in I(\mathbf{x})}\lambda_i\mathbf{a}_i:\sum_{i\in I(\mathbf{x})}\lambda_i=1,\lambda_i\geq 0\right\}$ </td><td> $\mathbb{E}=\mathbb{R}^n,\mathbf{a}_i\in\mathbb{R}^n,b_i\in\mathbb{R},I(\mathbf{x})=\{i:f(\mathbf{x})=\mathbf{a}_i^Tx+b_i\}$ </td><td>Example 3.53</td></tr><tr><td> $\frac{1}{2}d_C(\mathbf{x})^2$ </td><td> $\{\mathbf{x}-P_C(\mathbf{x})\}$ </td><td>C=nonempty closed and convex, E=Euclidean</td><td>Example 3.31</td></tr><tr><td> $d_C(\mathbf{x})$ </td><td> $\left\{\begin{array}{ll}\left\{\frac{\mathbf{x}-P_C(\mathbf{x})}{d_C(\mathbf{x})}\right\},&\mathbf{x}\notin C,\\N_C(\mathbf{x})\cap B[\mathbf{0},1] &\mathbf{x}\in C.\end{array}\right.$ </td><td>C=nonempty closed and convex, E=Euclidean</td><td>Example 3.49</td></tr></table>

Conjugate Calculus Rules

<table><tr><td>g(x)</td><td> $g^{*}(\mathbf{y})$ </td><td>Reference</td></tr><tr><td> $\sum_{i=1}^{m} f_{i}(\mathbf{x}_{i})$ </td><td> $\sum_{i=1}^{m} f_{i}^{*}(\mathbf{y}_{i})$ </td><td>Theorem 4.12</td></tr><tr><td> $\alpha f(\mathbf{x})(\alpha >0)$ </td><td> $\alpha f^{*}(\mathbf{y}/\alpha)$ </td><td>Theorem 4.14</td></tr><tr><td> $\alpha f(\mathbf{x}/\alpha)(\alpha >0)$ </td><td> $\alpha f^{*}(\mathbf{y})$ </td><td>Theorem 4.14</td></tr><tr><td> $f(\mathcal{A}(\mathbf{x}-\mathbf{a})) + \langle \mathbf{b},\mathbf{x}\rangle + c$ </td><td> $f^{*}\left((\mathcal{A}^{T})^{-1}(\mathbf{y}-\mathbf{b})\right) + \langle \mathbf{a},\mathbf{y}\rangle - c - \langle \mathbf{a},\mathbf{b}\rangle$ </td><td>Theorem 4.13</td></tr></table>

Conjugate Functions

<table><tr><td>f</td><td>dom(f)</td><td> $f^*$ </td><td>Assumptions</td><td>Reference</td></tr><tr><td> $e^x$ </td><td> $\mathbb{R}$ </td><td> $y\log y - y$  (dom( $f^*$ ) =  $\mathbb{R}_+$ )</td><td>-</td><td>Section 4.4.1</td></tr><tr><td> $-\log x$ </td><td> $\mathbb{R}_{++}$ </td><td> $-1 - \log(-y)$  (dom( $f^*$ ) =  $\mathbb{R}_{--}$ )</td><td>-</td><td>Section 4.4.2</td></tr><tr><td> $\max\{1 - x,0\}$ </td><td> $\mathbb{R}$ </td><td> $y + \delta_{[-1,0]}(y)$ </td><td>-</td><td>Section 4.4.3</td></tr><tr><td> $\frac{1}{p}|x|^p$ </td><td> $\mathbb{R}$ </td><td> $\frac{1}{q}|y|^q$ </td><td> $p > 1, \frac{1}{p} + \frac{1}{q} = 1$ </td><td>Section 4.4.4</td></tr><tr><td> $-\frac{x^p}{p}$ </td><td> $\mathbb{R}_+$ </td><td> $-\frac{(-y)^q}{q}$  (dom( $f^*$ ) =  $\mathbb{R}_{--}$ )</td><td> $0 < p < 1, \frac{1}{p} + \frac{1}{q} = 1$ </td><td>Section 4.4.5</td></tr><tr><td> $\frac{1}{2}\mathbf{x}^T\mathbf{A}\mathbf{x} + \mathbf{b}^T\mathbf{x} + c$ </td><td> $\mathbb{R}^n$ </td><td> $\frac{1}{2}(\mathbf{y} - \mathbf{b})^T\mathbf{A}^{-1}(\mathbf{y} - \mathbf{b}) - c$ </td><td> $\mathbf{A} \in \mathbb{S}_{++}^n, \mathbf{b} \in \mathbb{R}^n, c \in \mathbb{R}$ </td><td>Section 4.4.6</td></tr><tr><td> $\frac{1}{2}\mathbf{x}^T\mathbf{A}\mathbf{x} + \mathbf{b}^T\mathbf{x} + c$ </td><td> $\mathbb{R}^n$ </td><td> $\frac{1}{2}(\mathbf{y} - \mathbf{b})^T\mathbf{A}^\dagger(\mathbf{y} - \mathbf{b}) - c$  (dom( $f^*$ ) =  $\mathbf{b} + \text{Range}(\mathbf{A})$ )</td><td> $\mathbf{A} \in \mathbb{S}_+^n, \mathbf{b} \in \mathbb{R}^n, c \in \mathbb{R}$ </td><td>Section 4.4.7</td></tr><tr><td> $\sum_{i=1}^{n} x_i \log x_i$ </td><td> $\mathbb{R}_+^n$ </td><td> $\sum_{i=1}^{n} e^{y_i - 1}$ </td><td>-</td><td>Section 4.4.8</td></tr><tr><td> $\sum_{i=1}^{n} x_i \log x_i$ </td><td> $\Delta_n$ </td><td> $\log\left(\sum_{i=1}^{n} e^{y_i}\right)$ </td><td>-</td><td>Section 4.4.10</td></tr><tr><td> $-\sum_{i=1}^{n} \log x_i$ </td><td> $\mathbb{R}_{++}^n$ </td><td> $-n - \sum_{i=1}^{n} \log(-y_i)$  (dom( $f^*$ ) =  $\mathbb{R}_{--}^n$ )</td><td>-</td><td>Section 4.4.9</td></tr><tr><td> $\log\left(\sum_{i=1}^{n} e^{x_i}\right)$ </td><td> $\mathbb{R}^n$ </td><td> $\sum_{i=1}^{n} y_i \log y_i$  (dom( $f^*$ ) =  $\Delta_n$ )</td><td>-</td><td>Section 4.4.11</td></tr><tr><td> $\max_i\{x_i\}$ </td><td> $\mathbb{R}^n$ </td><td> $\delta_{\Delta_n}(\mathbf{y})$ </td><td>-</td><td>Example 4.10</td></tr><tr><td> $\delta_C(\mathbf{x})$ </td><td>C</td><td> $\sigma_C(\mathbf{y})$ </td><td> $\emptyset \neq C \subseteq \mathbb{E}$ </td><td>Example 4.2</td></tr><tr><td> $\sigma_C(\mathbf{x})$ </td><td> $\text{dom}(\sigma_C)$ </td><td> $\delta_{\text{cl}(\text{conv}(C))}(\mathbf{y})$ </td><td> $\emptyset \neq C \subseteq \mathbb{E}$ </td><td>Example 4.9</td></tr><tr><td> $\| \mathbf{x} \|$ </td><td> $\mathbb{E}$ </td><td> $\delta_{B_{\|\cdot\|_*}[0,1]}(\mathbf{y})$ </td><td>-</td><td>Section 4.4.12</td></tr><tr><td> $-\sqrt{\alpha^2 - \| \mathbf{x} \|^2}$ </td><td> $B[\mathbf{0},\alpha]$ </td><td> $\alpha\sqrt{\|\mathbf{y}\|_*^2 + 1}$ </td><td> $\alpha > 0$ </td><td>Section 4.4.13</td></tr><tr><td> $\sqrt{\alpha^2 + \| \mathbf{x} \|^2}$ </td><td> $\mathbb{E}$ </td><td> $-\alpha\sqrt{1 - \| \mathbf{y}\|_*^2}$  (dom $f^* = B_{\|\cdot\|_*}[0,1]$ )</td><td> $\alpha > 0$ </td><td>Section 4.4.14</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|^2$ </td><td> $\mathbb{E}$ </td><td> $\frac{1}{2}\|\mathbf{y}\|^2$ </td><td>-</td><td>Section 4.4.15</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|^2 + \delta_C(\mathbf{x})$ </td><td>C</td><td> $\frac{1}{2}\|\mathbf{y}\|^2 - \frac{1}{2}d_C^2(\mathbf{y})$ </td><td> $\emptyset \neq C \subseteq \mathbb{E}, \mathbb{E}$  Euclidean</td><td>Example 4.4</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|^2 - \frac{1}{2}d_C^2(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $\frac{1}{2}\|\mathbf{y}\|^2 + \delta_C(\mathbf{y})$ </td><td> $\emptyset \neq C \subseteq \mathbb{E}$  closed convex.  $\mathbb{E}$  Euclidean</td><td>Example 4.11</td></tr></table>

Conjugates of Symmetric Spectral Functions over $\mathbb{S}^{n}$ (from Example 7.16)

<table><tr><td>g(X)</td><td>dom(g)</td><td>g*(Y)</td><td>dom(g*)</td></tr><tr><td> $\lambda_{\max}(\mathbf{X})$ </td><td> $\mathbb{S}^n$ </td><td> $\delta_{\Upsilon_n}(\mathbf{Y})$ </td><td> $\Upsilon_n$ </td></tr><tr><td> $\alpha\|\mathbf{X}\|_F(\alpha>0)$ </td><td> $\mathbb{S}^n$ </td><td> $\delta_{B_{\|\cdot\|_F}[\mathbf{0},\alpha]}(\mathbf{Y})$ </td><td> $B_{\|\cdot\|_F}[\mathbf{0},\alpha]$ </td></tr><tr><td> $\alpha\|\mathbf{X}\|_F^2(\alpha>0)$ </td><td> $\mathbb{S}^n$ </td><td> $\frac{1}{4\alpha}\|\mathbf{Y}\|_F^2$ </td><td> $\mathbb{S}^n$ </td></tr><tr><td> $\alpha\|\mathbf{X}\|_{2,2}(\alpha>0)$ </td><td> $\mathbb{S}^n$ </td><td> $\delta_{B_{\|\cdot\|_{S_1}}[\mathbf{0},\alpha]}(\mathbf{Y})$ </td><td> $B_{\|\cdot\|_{S_1}}[\mathbf{0},\alpha]$ </td></tr><tr><td> $\alpha\|\mathbf{X}\|_{S_1}(\alpha>0)$ </td><td> $\mathbb{S}^n$ </td><td> $\delta_{B_{\|\cdot\|_{2,2}}[\mathbf{0},\alpha]}(\mathbf{Y})$ </td><td> $B_{\|\cdot\|_{2,2}}[\mathbf{0},\alpha]$ </td></tr><tr><td> $-\log \det(\mathbf{X})$ </td><td> $\mathbb{S}_{++}^n$ </td><td> $-n-\log \det(-\mathbf{Y})$ </td><td> $\mathbb{S}_{- -}^n$ </td></tr><tr><td> $\sum_{i=1}^{n}\lambda_i(\mathbf{X})\log(\lambda_i(\mathbf{X}))$ </td><td> $\mathbb{S}_+^n$ </td><td> $\sum_{i=1}^{n}e^{\lambda_i(\mathbf{Y})-1}$ </td><td> $\mathbb{S}^n$ </td></tr><tr><td> $\sum_{i=1}^{n}\lambda_i(\mathbf{X})\log(\lambda_i(\mathbf{X}))$ </td><td> $\Upsilon_n$ </td><td> $\log\left(\sum_{i=1}^{n}e^{\lambda_i(\mathbf{Y})}\right)$ </td><td> $\mathbb{S}^n$ </td></tr></table>

Conjugates of Symmetric Spectral Functions over $\mathbb{R}^{m \times n}$ (from Example 7.27)

<table><tr><td> $g(\mathbf{X})$ </td><td> $\text{dom}(g)$ </td><td> $g^{*}(\mathbf{Y})$ </td><td> $\text{dom}(g^{*})$ </td></tr><tr><td> $\alpha\sigma_{1}(\mathbf{X})(\alpha >0)$ </td><td> $\mathbb{R}^{m\times n}$ </td><td> $\delta_{B_{\|\cdot\|_{S_{1}}[\mathbf{0},\alpha]}(\mathbf{Y})}$ </td><td> $B_{\|\cdot\|_{S_{1}}[\mathbf{0},\alpha]}$ </td></tr><tr><td> $\alpha\|\mathbf{X}\|_{F}(\alpha >0)$ </td><td> $\mathbb{R}^{m\times n}$ </td><td> $\delta_{B_{\|\cdot\|_{F}[\mathbf{0},\alpha]}(\mathbf{Y})}$ </td><td> $B_{\|\cdot\|_{F}[\mathbf{0},\alpha]}$ </td></tr><tr><td> $\alpha\|\mathbf{X}\|_{F}^{2}(\alpha >0)$ </td><td> $\mathbb{R}^{m\times n}$ </td><td> $\frac{1}{4\alpha}\|\mathbf{Y}\|_{F}^{2}$ </td><td> $\mathbb{R}^{m\times n}$ </td></tr><tr><td> $\alpha\|\mathbf{X}\|_{S_{1}}(\alpha >0)$ </td><td> $\mathbb{R}^{m\times n}$ </td><td> $\delta_{B_{\|\cdot\|_{S_{\infty}}[\mathbf{0},\alpha]}(\mathbf{Y})}$ </td><td> $B_{\|\cdot\|_{S_{\infty}}[\mathbf{0},\alpha]}$ </td></tr></table>

Smooth Functions

<table><tr><td> $f(\mathbf{x})$ </td><td> $\text{dom}(f)$ </td><td>Parameter</td><td>Norm</td><td>Reference</td></tr><tr><td> $\frac{1}{2}\mathbf{x}^{T}\mathbf{A}\mathbf{x} + \mathbf{b}^{T}\mathbf{x} + c$  $(\mathbf{A} \in \mathbb{S}^{n}, \mathbf{b} \in \mathbb{R}^{n}, c \in \mathbb{R})$ </td><td> $\mathbb{R}^{n}$ </td><td> $\| \mathbf{A} \|_{p,q}$ </td><td> $l_{p}$ </td><td>Example 5.2</td></tr><tr><td> $\langle \mathbf{b}, \mathbf{x} \rangle + c$  $(\mathbf{b} \in \mathbb{E}^{*}, c \in \mathbb{R})$ </td><td> $\mathbb{E}$ </td><td>0</td><td>any norm</td><td>Example 5.3</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|_{p}^{2}, p \in[2, \infty)$ </td><td> $\mathbb{R}^{n}$ </td><td> $p - 1$ </td><td> $l_{p}$ </td><td>Example 5.11</td></tr><tr><td> $\sqrt{1 + \|\mathbf{x}\|_{2}^{2}}$ </td><td> $\mathbb{R}^{n}$ </td><td>1</td><td> $l_{2}$ </td><td>Example 5.14</td></tr><tr><td> $\log(\sum_{i=1}^{n} e^{x_{i}})$ </td><td> $\mathbb{R}^{n}$ </td><td>1</td><td> $l_{2}, l_{\infty}$ </td><td>Example 5.15</td></tr><tr><td> $\frac{1}{2}d_{C}^{2}(\mathbf{x})$  $(\emptyset \neq C \subseteq \mathbb{E} \text{closed convex})$ </td><td> $\mathbb{E}$ </td><td>1</td><td>Euclidean</td><td>Example 5.5</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|^{2} - \frac{1}{2}d_{C}^{2}(\mathbf{x})$  $(\emptyset \neq C \subseteq \mathbb{E} \text{closed convex})$ </td><td> $\mathbb{E}$ </td><td>1</td><td>Euclidean</td><td>Example 5.6</td></tr><tr><td> $H_{\mu}(\mathbf{x})(\mu > 0)$ </td><td> $\mathbb{E}$ </td><td> $\frac{1}{\mu}$ </td><td>Euclidean</td><td>Example 6.62</td></tr></table>

Strongly Convex Functions

<table><tr><td> $f(\mathbf{x})$ </td><td> $\text{dom}(f)$ </td><td>Strongly convex parameter</td><td>Norm</td><td>Reference</td></tr><tr><td> $\frac{1}{2}\mathbf{x}^{T}\mathbf{A}\mathbf{x} + 2\mathbf{b}^{T}\mathbf{x} + c$  $(\mathbf{A} \in \mathbb{S}_{++}^{n}, \mathbf{b} \in \mathbb{R}^{n}, c \in \mathbb{R})$ </td><td> $\mathbb{R}^{n}$ </td><td> $\lambda_{\min}(\mathbf{A})$ </td><td> $l_{2}$ </td><td>Example 5.19</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|^{2} + \delta_{C}(\mathbf{x})$  $(\emptyset \neq C \subseteq \mathbb{E} \text{convex})$ </td><td> $C$ </td><td>1</td><td>Euclidean</td><td>Example 5.21</td></tr><tr><td> $-\sqrt{1 - \|\mathbf{x}\|_{2}^{2}}$ </td><td> $B_{\|\cdot\|_{2}}[\mathbf{0}, 1]$ </td><td>1</td><td> $l_{2}$ </td><td>Example 5.29</td></tr><tr><td> $\frac{1}{2}\|\mathbf{x}\|_{p}^{2}(p \in(1, 2])$ </td><td> $\mathbb{R}^{n}$ </td><td> $p - 1$ </td><td> $l_{p}$ </td><td>Example 5.28</td></tr><tr><td> $\sum_{i=1}^{n} x_{i} \log x_{i}$ </td><td> $\Delta_{n}$ </td><td>1</td><td> $l_{2} \text{or} l_{1}$ </td><td>Example 5.27</td></tr></table>

Orthogonal Projections

<table><tr><td>Set (C)</td><td> $P_C(\mathbf{x})$ </td><td>Assumptions</td><td>Reference</td></tr><tr><td> $\mathbb{R}_+^n$ </td><td> $[\mathbf{x}]_+$ </td><td>-</td><td>Lemma 6.26</td></tr><tr><td>Box[ $\ell, \mathbf{u}$ ]</td><td> $P_C(\mathbf{x})_i = \min\{\max\{x_i, \ell_i\}, u_i\}$ </td><td> $\ell_i \leq u_i$ </td><td>Lemma 6.26</td></tr><tr><td> $B_{\| \cdot \|_2}[\mathbf{c}, r]$ </td><td> $\mathbf{c} + \frac{r}{\max\{\| \mathbf{x} - \mathbf{c} \|_2, r\}}(\mathbf{x} - \mathbf{c})$ </td><td> $\mathbf{c} \in \mathbb{R}^n, r > 0$ </td><td>Lemma 6.26</td></tr><tr><td> $\{\mathbf{x} : \mathbf{A}\mathbf{x} = \mathbf{b}\}$ </td><td> $\mathbf{x} - \mathbf{A}^T(\mathbf{A}\mathbf{A}^T)^{-1}(\mathbf{A}\mathbf{x} - \mathbf{b})$ </td><td> $\mathbf{A} \in \mathbb{R}^{m \times n}, \mathbf{b} \in \mathbb{R}^m, \mathbf{A} \text{full row rank}$ </td><td>Lemma 6.26</td></tr><tr><td> $\{\mathbf{x} : \mathbf{a}^T \mathbf{x} \leq b\}$ </td><td> $\mathbf{x} - \frac{[\mathbf{a}^T \mathbf{x} - b]_+}{\|\mathbf{a}\|^2} \mathbf{a}$ </td><td> $\mathbf{0} \neq \mathbf{a} \in \mathbb{R}^n, b \in \mathbb{R}$ </td><td>Lemma 6.26</td></tr><tr><td> $\Delta_n$ </td><td> $[\mathbf{x} - \mu^*\mathbf{e}]_+ \text{where} \mu^* \in \mathbb{R} \text{satisfies} \mathbf{e}^T[\mathbf{x} - \mu^*\mathbf{e}]_+ = 1$ </td><td></td><td>Corollary 6.29</td></tr><tr><td> $H_{\mathbf{a},b} \cap \text{Box}[\ell, \mathbf{u}]$ </td><td> $P_{\text{Box}[\ell,\mathbf{u}]}(\mathbf{x} - \mu^*\mathbf{a}) \text{where} \mu^* \in \mathbb{R} \text{satisfies} \mathbf{a}^TP_{\text{Box}[\ell,\mathbf{u}]}(\mathbf{x} - \mu^*\mathbf{a}) = b$ </td><td> $\mathbf{a} \in \mathbb{R}^n \setminus \{\mathbf{0}\}, b \in \mathbb{R}$ </td><td>Theorem 6.27</td></tr><tr><td> $H_{\mathbf{a},b}^- \cap \text{Box}[\ell, \mathbf{u}]$ </td><td> $\begin{cases} P_{\text{Box}[\ell,\mathbf{u}]}(\mathbf{x}), & \mathbf{a}^T \mathbf{v}_{\mathbf{x}} \leq b, \\ P_{\text{Box}[\ell,\mathbf{u}]}(\mathbf{x} - \lambda^*\mathbf{a}), & \mathbf{a}^T \mathbf{v}_{\mathbf{x}} > b, \\ \mathbf{v}_{\mathbf{x}} = P_{\text{Box}[\ell,\mathbf{u}]}(\mathbf{x}), & \mathbf{a}^TP_{\text{Box}[\ell,\mathbf{u}]}(\mathbf{x} - \lambda^*\mathbf{a}) = b, \lambda^* > 0 \end{cases}$ </td><td> $\mathbf{a} \in \mathbb{R}^n \setminus \{\mathbf{0}\}, b \in \mathbb{R}$ </td><td>Example 6.32</td></tr><tr><td> $B_{\| \cdot \|_1}[\mathbf{0}, \alpha]$ </td><td> $\begin{cases} \mathbf{x}, & \| \mathbf{x} \|_1 \leq \alpha, \\ \mathcal{T}_{\lambda^*}(\mathbf{x}), & \| \mathbf{x} \|_1 > \alpha, \\ \| \mathcal{T}_{\lambda^*}(\mathbf{x}) \|_1 = \alpha, & \lambda^* > 0 \end{cases}$ </td><td> $\alpha > 0$ </td><td>Example 6.33</td></tr><tr><td> $\{\mathbf{x} : \boldsymbol{\omega}^T |\mathbf{x}| \leq \beta, -\boldsymbol{\alpha} \leq \mathbf{x} \leq \boldsymbol{\alpha}\}$ </td><td> $\begin{cases} \mathbf{v}_{\mathbf{x}}, & \boldsymbol{\omega}^T |\mathbf{v}_{\mathbf{x}}| \leq \beta, \\ \mathcal{S}_{\lambda^* \boldsymbol{\omega},\boldsymbol{\alpha}}(\mathbf{x}), & \boldsymbol{\omega}^T |\mathbf{v}_{\mathbf{x}}| > \beta, \\ \mathbf{v}_{\mathbf{x}} = P_{\text{Box}[-\boldsymbol{\alpha},\boldsymbol{\alpha}]}(\mathbf{x}), \\ \boldsymbol{\omega}^T | \mathcal{S}_{\lambda^* \boldsymbol{\omega},\boldsymbol{\alpha}}(\mathbf{x})| = \beta, \lambda^* > 0 \end{cases}$ </td><td> $\boldsymbol{\omega} \in \mathbb{R}_+^n, \boldsymbol{\alpha} \in[0, \infty]^n, \beta \in \mathbb{R}_{++}$ </td><td>Example 6.34</td></tr><tr><td> $\{\mathbf{x} > \mathbf{0} : \Pi x_i \geq \alpha\}$ </td><td> $\begin{cases} \mathbf{x}, & \mathbf{x} \in C, \\ \left(\frac{x_j + \sqrt{x_j^2 + 4\lambda^*}}{2} \right)^n, & \mathbf{x} \notin C, \\ \Pi_{j=1}^n \left((x_j + \sqrt{x_j^2 + 4\lambda^*})/2 \right) = \alpha, \lambda^* > 0 \end{cases}$ </td><td> $\alpha > 0$ </td><td>Example 6.35</td></tr><tr><td> $\{(\mathbf{x}, s) : \| \mathbf{x} \|_2 \leq s\}$ </td><td> $\left(\frac{\|\mathbf{x}\|_2 + s}{2\|\mathbf{x}\|_2} \mathbf{x}, \frac{\|\mathbf{x}\|_2 + s}{2} \right) \text{if} \| \mathbf{x} \|_2 \geq |s|(0,0) \text{if} s < \| \mathbf{x} \|_2 < -s, \\(\mathbf{x}, s) \text{if} \| \mathbf{x} \|_2 \leq s.$ </td><td>-</td><td>Example 6.37</td></tr><tr><td> $\{(\mathbf{x}, s) : \| \mathbf{x} \|_1 \leq s\}$ </td><td> $\begin{cases}(\mathbf{x}, s), & \| \mathbf{x} \|_1 \leq s, \\(\mathcal{T}_{\lambda^*}(\mathbf{x}), s + \lambda^*), & \| \mathbf{x} \|_1 > s, \\ \| \mathcal{T}_{\lambda^*}(\mathbf{x}) \|_1 - \lambda^* - s = 0, \lambda^* > 0 \end{cases}$ </td><td>-</td><td>Example 6.38</td></tr></table>

Orthogonal Projections onto Symmetric Spectral Sets in $\mathbb{S}^{n}$

<table><tr><td>set (T)</td><td> $P_{T}(\mathbf{X})$ </td><td>Assumptions</td></tr><tr><td> $\mathbb{S}_{+}^{n}$ </td><td> $\textbf{Udiag}([\boldsymbol{\lambda}(\mathbf{X})]_{+})\mathbf{U}^{T}$ </td><td>-</td></tr><tr><td> $\{\mathbf{X}:\ell\mathbf{I}\preceq\mathbf{X}\preceq u\mathbf{I}\}$ </td><td> $\textbf{Udiag}(\mathbf{v})\mathbf{U}^{T},$  $v_{i}=\min\{\max\{\lambda_{i}(\mathbf{X}),\ell\},u\}$ </td><td> $\ell\leq u$ </td></tr><tr><td> $B_{\|\cdot\|_{F}}[\mathbf{0},r]$ </td><td> $\frac{r}{\max\{\| \mathbf{X}\|_{F},r\}}\mathbf{X}$ </td><td> $r>0$ </td></tr><tr><td> $\{\mathbf{X}:\text{Tr}(\mathbf{X})\leq b\}$ </td><td> $\textbf{Udiag}(\mathbf{v})\mathbf{U}^{T},\mathbf{v}=\boldsymbol{\lambda}(\mathbf{X})-\frac{[\mathbf{e}^{T}\boldsymbol{\lambda}(\mathbf{X})-b]_{+}}{n}\mathbf{e}$ </td><td> $b\in\mathbb{R}$ </td></tr><tr><td> $\Upsilon_{n}$ </td><td> $\textbf{Udiag}(\mathbf{v})\mathbf{U}^{T},\mathbf{v}=[\boldsymbol{\lambda}(\mathbf{X})-\mu^{*}\mathbf{e}]_{+}$  where  $\mu^{*}\in\mathbb{R}$  satisfies  $\mathbf{e}^{T}[\boldsymbol{\lambda}(\mathbf{X})-\mu^{*}\mathbf{e}]_{+}=1$ </td><td>-</td></tr><tr><td> $B_{\|\cdot\|_{S_{1}}}[0,\alpha]$ </td><td> $\left\{\begin{array}{ll}\mathbf{X},&\|\mathbf{X}\|_{S_{1}}\leq\alpha,\\\textbf{Udiag}(\mathcal{T}_{\beta^{*}}(\boldsymbol{\lambda}(\mathbf{X})))\mathbf{U}^{T},&\|\mathbf{X}\|_{S_{1}}> \alpha,\\ \|\mathcal{T}_{\beta^{*}}(\boldsymbol{\lambda}(\mathbf{X}))\|_{1}=\alpha,\beta^{*}>0\end{array}\right.$ </td><td> $\alpha>0$ </td></tr></table>

Orthogonal Projections onto Symmetric Spectral Sets in $\mathbb{R}^{m \times n}$ (from Example 7.31)

<table><tr><td>set (T)</td><td> $P_{T}(\mathbf{X})$ </td><td>Assumptions</td></tr><tr><td> $B_{\|\cdot\|_{S_{\infty}}}[0,\alpha]$ </td><td> $\textbf{Udiag}(\mathbf{v})\mathbf{V}^{T}, v_{i} = \min\{\sigma_{i}(\mathbf{X}),\alpha\}$ </td><td> $\alpha > 0$ </td></tr><tr><td> $B_{\|\cdot\|_{F}}[0,r]$ </td><td> $\frac{r}{\max\{\| \mathbf{X}\|_{F},r\}}\mathbf{X}$ </td><td> $r > 0$ </td></tr><tr><td> $B_{\|\cdot\|_{S_{1}}}[0,\alpha]$ </td><td> $\left\{\begin{array}{ll}\mathbf{X}, & \| \mathbf{X}\|_{S_{1}} \leq \alpha, \\ \textbf{Udiag}(\mathcal{T}_{\beta^{*}}(\sigma(\mathbf{X})))\mathbf{V}^{T}, & \| \mathbf{X}\|_{S_{1}} > \alpha, \\ \| \mathcal{T}_{\beta^{*}}(\boldsymbol{igma}(\mathbf{X}))\|_{1} = \alpha, \beta^{*} > 0 \end{array} \right.$ </td><td> $\alpha > 0$ </td></tr></table>

Prox Calculus Rules

<table><tr><td> $f(\mathbf{x})$ </td><td> $\text{prox}_{f}(\mathbf{x})$ </td><td>Assumptions</td><td>Reference</td></tr><tr><td> $\sum_{i=1}^{m} f_{i}(\mathbf{x}_{i})$ </td><td> $\text{prox}_{f_{1}}(\mathbf{x}_{1}) \times \cdots \times \text{prox}_{f_{m}}(\mathbf{x}_{m})$ </td><td>-</td><td>Theorem 6.6</td></tr><tr><td> $g(\lambda\mathbf{x} + \mathbf{a})$ </td><td> $\frac{1}{\lambda} \left[\text{prox}_{\lambda^{2}g}(\lambda\mathbf{x} + \mathbf{a}) - \mathbf{a} \right]$ </td><td> $\lambda \neq 0, \mathbf{a} \in \mathbb{E}, g \text{proper}$ </td><td>Theorem 6.11</td></tr><tr><td> $\lambda g(\mathbf{x}/\lambda)$ </td><td> $\lambda \text{prox}_{g/\lambda}(\mathbf{x}/\lambda)$ </td><td> $\lambda \neq 0, g \text{proper}$ </td><td>Theorem 6.12</td></tr><tr><td> $g(\mathbf{x}) + \frac{c}{2} \| \mathbf{x} \|^{2} + \langle \mathbf{a}, \mathbf{x} \rangle + \gamma$ </td><td> $\text{prox}_{\frac{1}{c+1}g}(\frac{\mathbf{x}-\mathbf{a}}{c+1})$ </td><td> $\mathbf{a} \in \mathbb{E}, c > 0, \gamma \in \mathbb{R}, g \text{proper}$ </td><td>Theorem 6.13</td></tr><tr><td> $g(\mathcal{A}(\mathbf{x}) + \mathbf{b})$ </td><td> $\mathbf{x} + \frac{1}{\alpha} \mathcal{A}^{T}(\text{prox}_{\alpha g}(\mathcal{A}(\mathbf{x}) + \mathbf{b}) - \mathcal{A}(\mathbf{x}) - \mathbf{b})$ </td><td> $\mathbf{b} \in \mathbb{R}^{m}, \mathcal{A} : \mathbb{V} \to \mathbb{R}^{m}, g \text{proper closed convex}, \mathcal{A} \circ \mathcal{A}^{T} = \alpha I, \alpha > 0$ </td><td>Theorem 6.15</td></tr><tr><td> $g(\| \mathbf{x}\|)$ </td><td> $\text{prox}_{g}(\| \mathbf{x}\|) \frac{\mathbf{x}}{\|\mathbf{x}\|}, \quad \mathbf{x} \neq \mathbf{0}$  $\{\mathbf{u} : \| \mathbf{u}\| = \text{prox}_{g}(0)\}, \quad \mathbf{x} = \mathbf{0}$ </td><td> $g \text{proper closed convex,} \text{dom}(g) \subseteq[0, \infty)$ </td><td>Theorem 6.18</td></tr></table>

Prox Computations

<table><tr><td>f(x)</td><td>dom(f)</td><td>prox $_{f}$ (x)</td><td>Assumptions</td><td>Reference</td></tr><tr><td> $\frac{1}{2}\mathbf{x}^{T}\mathbf{A}\mathbf{x}+\mathbf{b}^{T}\mathbf{x}+c$ </td><td> $\mathbb{R}^{n}$ </td><td> $(\mathbf{A}+\mathbf{I})^{-1}(\mathbf{x}-\mathbf{b})$ </td><td> $\mathbf{A}\in\mathbb{S}_{+}^{n},\mathbf{b}\in\mathbb{R}^{n},c\in\mathbb{R}$ </td><td>Section 6.2.3</td></tr><tr><td> $\lambda x^{3}$ </td><td> $\mathbb{R}_{+}$ </td><td> $\frac{-1+\sqrt{1+12\lambda[x]_{+}}}{6\lambda}$ </td><td> $\lambda>0$ </td><td>Lemma 6.5</td></tr><tr><td> $\mu x$ </td><td> $[0,\alpha]\cap\mathbb{R}$ </td><td> $\min\{\max\{x-\mu,0\},\alpha\}$ </td><td> $\mu\in\mathbb{R},\alpha\in[0,\infty]$ </td><td>Example 6.14</td></tr><tr><td> $\lambda\|\mathbf{x}\|$ </td><td> $\mathbb{E}$ </td><td> $\left(1-\frac{\lambda}{\max\{\|\mathbf{x}\|,\lambda\}}\right)\mathbf{x}$ </td><td> $\|\cdot\|—Euclideannorm,\lambda>0$ </td><td>Example 6.19</td></tr><tr><td> $-\lambda\|\mathbf{x}\|$ </td><td> $\mathbb{E}$ </td><td> $\left(1+\frac{\lambda}{\|\mathbf{x}\|}\right)\mathbf{x},\quad\mathbf{x}\neq\mathbf{0},\quad\{\mathbf{u}:\|\mathbf{u}\|=\lambda\},\quad\mathbf{x}=0.$ </td><td> $\|\cdot\|—Euclideannorm,\lambda>0$ </td><td>Example 6.21</td></tr><tr><td> $\lambda\|\mathbf{x}\|_{1}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathcal{T}_{\lambda}(\mathbf{x})=[|\mathbf{x}|-\lambda\mathbf{e}]_{+}\odot\operatorname{sgn}(\mathbf{x})$ </td><td> $\lambda>0$ </td><td>Example 6.8</td></tr><tr><td> $\|\boldsymbol{\omega}\odot\mathbf{x}\|_{1}$ </td><td> $\text{Box}[-\boldsymbol{\alpha},\boldsymbol{\alpha}]$ </td><td> $\mathcal{S}_{\boldsymbol{\omega},\boldsymbol{\alpha}}(\mathbf{x})$ </td><td> $\boldsymbol{\alpha}\in[0,\infty]^{n},\boldsymbol{\omega}\in\mathbb{R}_{+}^{n}$ </td><td>Example 6.23</td></tr><tr><td> $\lambda\|\mathbf{x}\|_{\infty}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathbf{x}-\lambda P_{B_{\|\cdot\|_{1}}[\mathbf{0},1]}(\mathbf{x}/\lambda)$ </td><td> $\lambda>0$ </td><td>Example 6.48</td></tr><tr><td> $\lambda\|\mathbf{x}\|_{a}$ </td><td> $\mathbb{E}$ </td><td> $\mathbf{x}-\lambda P_{B_{\|\cdot\|_{a,*}}[\mathbf{0},1]}(\mathbf{x}/\lambda)$ </td><td> $\|\mathbf{x}\|_{a}\text{-norm},\lambda>0$ </td><td>Example 6.47</td></tr><tr><td> $\lambda\|\mathbf{x}\|_{0}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathcal{H}_{\sqrt{2\lambda}}(x_{1})\times\cdots\times\mathcal{H}_{\sqrt{2\lambda}}(x_{n})$ </td><td> $\lambda>0$ </td><td>Example 6.10</td></tr><tr><td> $\lambda\|\mathbf{x}\|^{3}$ </td><td> $\mathbb{E}$ </td><td> $\frac{2}{1+\sqrt{1+12\lambda\|\mathbf{x}\|}}\mathbf{x}$ </td><td> $\|\cdot\|—Euclideannorm,\lambda>0,$ </td><td>Example 6.20</td></tr><tr><td> $-\lambda\sum_{j=1}^{n}\log x_{j}$ </td><td> $\mathbb{R}_{++}^{n}$ </td><td> $\left(\frac{x_{j}+\sqrt{x_{j}^{2}+4\lambda}}{2}\right)^{n}_{j=1}$ </td><td> $\lambda>0$ </td><td>Example 6.9</td></tr><tr><td> $\delta_{C}(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $P_{C}(\mathbf{x})$ </td><td> $\emptyset\neq C\subseteq\mathbb{E}$ </td><td>Theorem 6.24</td></tr><tr><td> $\lambda\sigma_{C}(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $\mathbf{x}-\lambda P_{C}(\mathbf{x}/\lambda)$ </td><td> $\lambda>0,C\neq\emptyset$ closed convex</td><td>Theorem 6.46</td></tr><tr><td> $\lambda\max\{x_{i}\}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathbf{x}-P_{\Delta_{n}}(\mathbf{x}/\lambda)$ </td><td> $\lambda>0$ </td><td>Example 6.49</td></tr><tr><td> $\lambda\sum_{i=1}^{k}x_{[i]}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathbf{x}-\lambda P_{C}(\mathbf{x}/\lambda),\quad C=H_{\mathbf{e},k}\cap\text{Box}[\mathbf{0},\mathbf{e}]$ </td><td> $\lambda>0$ </td><td>Example 6.50</td></tr><tr><td> $\lambda\sum_{i=1}^{k}|x_{\langle i\rangle}|$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathbf{x}-\lambda P_{C}(\mathbf{x}/\lambda),\quad C=B_{\|\cdot\|_{1}}[\mathbf{0},k]\cap\text{Box}[-\mathbf{e},\mathbf{e}]$ </td><td> $\lambda>0$ </td><td>Example 6.51</td></tr><tr><td> $\lambda M_{f}^{\mu}(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $\mathbf{x}+\frac{\lambda}{\mu+\lambda}\left(\text{prox}_{(\mu+\lambda)f}(\mathbf{x})-\mathbf{x}\right)$ </td><td> $\lambda,\mu>0,f$ proper closed convex</td><td>Corollary 6.64</td></tr><tr><td> $\lambda d_{C}(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $\mathbf{x}+\min\left\{\frac{\lambda}{d_{C}(\mathbf{x})},1\right\}(P_{C}(\mathbf{x})-\mathbf{x})$ </td><td> $\emptyset\neq C$ closed convex,  $\lambda>0$ </td><td>Lemma 6.43</td></tr><tr><td> $\frac{\lambda}{2}d_{C}^{2}(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $\frac{\lambda}{\lambda+1}P_{C}(\mathbf{x})+\frac{1}{\lambda+1}\mathbf{x}$ </td><td> $\emptyset\neq C$ closed convex,  $\lambda>0$ </td><td>Example 6.65</td></tr><tr><td> $\lambda H_{\mu}(\mathbf{x})$ </td><td> $\mathbb{E}$ </td><td> $\left(1-\frac{\lambda}{\max\{\|\mathbf{x}\|,\mu+\lambda\}}\right)\mathbf{x}$ </td><td> $\lambda,\mu>0$ </td><td>Example 6.66</td></tr><tr><td> $\rho\|\mathbf{x}\|_{1}^{2}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\left(\frac{v_{i}x_{i}}{v_{i}+2\rho}\right)_{i=1}^{n},\mathbf{v}=\left[\sqrt{\frac{\rho}{\mu}}|\mathbf{x}|-2\rho\right]_{+},\mathbf{e}^{T}\mathbf{v}=1(\mathbf{0} \text{when} \mathbf{x}=\mathbf{0})$ </td><td> $\rho>0$ </td><td>Lemma 6.70</td></tr><tr><td> $\lambda\|\mathbf{A}\mathbf{x}\|_{2}$ </td><td> $\mathbb{R}^{n}$ </td><td> $\mathbf{x}-\mathbf{A}^{T}(\mathbf{A}\mathbf{A}^{T}+\alpha^{*}\mathbf{I})^{-1}\mathbf{A}\mathbf{x},\alpha^{*}=0 \text{if}\|\mathbf{v}_{0}\|_{2}\leq\lambda;\text{otherwise,}\|\mathbf{v}_{\alpha^{*}}\|_{2}=\lambda;\mathbf{v}_{\alpha}\equiv(\mathbf{A}\mathbf{A}^{T}+\alpha\mathbf{I})^{-1}\mathbf{A}\mathbf{x}$ </td><td> $\mathbf{A}\in\mathbb{R}^{m\times n}$ with full row rank,  $\lambda>0$ </td><td>Lemma 6.68</td></tr></table>

Prox of Symmetric Spectral Functions over $\mathbb{S}^{n}$ (from Example 7.19)

<table><tr><td> $F(\mathbf{X})$ </td><td> $\text{dom}(F)$ </td><td> $\text{prox}_F(\mathbf{X})$ </td><td>Reference</td></tr><tr><td> $\alpha\|\mathbf{X}\|_F^2$ </td><td> $\mathbb{S}^n$ </td><td> $\frac{1}{1+2\alpha}\mathbf{X}$ </td><td>Section 6.2.3</td></tr><tr><td> $\alpha\|\mathbf{X}\|_F$ </td><td> $\mathbb{S}^n$ </td><td> $\left(1-\frac{\alpha}{\max\{\|\mathbf{X}\|_F,\alpha\}}\right)\mathbf{X}$ </td><td>Example 6.19</td></tr><tr><td> $\alpha\|\mathbf{X}\|_{S_1}$ </td><td> $\mathbb{S}^n$ </td><td> $\mathbf{Udiag}(\mathcal{T}_{\alpha}(\boldsymbol{\lambda}(\mathbf{X})))\mathbf{U}^T$ </td><td>Example 6.8</td></tr><tr><td> $\alpha\|\mathbf{X}\|_{2,2}$ </td><td> $\mathbb{S}^n$ </td><td> $\mathbf{Udiag}(\boldsymbol{\lambda}(\mathbf{X})-\alpha P_{B_{\parallel\cdot\parallel_1}[0,1]}(\boldsymbol{\lambda}(\mathbf{X})/\alpha))\mathbf{U}^T$ </td><td>Example 6.48</td></tr><tr><td> $-\alpha\log\det(\mathbf{X})$ </td><td> $\mathbb{S}_{++}^n$ </td><td> $\mathbf{Udiag}\left(\frac{\lambda_j(\mathbf{X})+\sqrt{\lambda_j(\mathbf{X})^2+4\alpha}}{2}\right)\mathbf{U}^T$ </td><td>Example 6.9</td></tr><tr><td> $\alpha\lambda_1(\mathbf{X})$ </td><td> $\mathbb{S}^n$ </td><td> $\mathbf{Udiag}(\boldsymbol{\lambda}(\mathbf{X})-\alpha P_{\Delta_n}(\boldsymbol{\lambda}(\mathbf{X})/\alpha))\mathbf{U}^T$ </td><td>Example 6.49</td></tr><tr><td> $\alpha\sum_{i=1}^{k}\lambda_i(\mathbf{X})$ </td><td> $\mathbb{S}^n$ </td><td> $\mathbf{X}-\alpha\mathbf{Udiag}(P_C(\boldsymbol{\lambda}(\mathbf{X})/\alpha))\mathbf{U}^T,$  $C = H_{\mathbf{e},k} \cap \text{Box}[\mathbf{0},\mathbf{e}]$ </td><td>Example 6.50</td></tr></table>

Prox of Symmetric Spectral Functions over $\mathbb{R}^{m \times n}$ (from Example 7.30)

<table><tr><td> $F(\mathbf{X})$ </td><td> $\text{prox}_{F}(\mathbf{X})$ </td></tr><tr><td> $\alpha\|\mathbf{X}\|_{F}^{2}$ </td><td> $\frac{1}{1+2\alpha}\mathbf{X}$ </td></tr><tr><td> $\alpha\|\mathbf{X}\|_{F}$ </td><td> $\left(1-\frac{\alpha}{\max\{\|\mathbf{X}\|_{F},\alpha\}}\right)\mathbf{X}$ </td></tr><tr><td> $\alpha\|\mathbf{X}\|_{S_{1}}$ </td><td> $\mathbf{U}\text{dg}(\mathcal{T}_{\alpha}(\boldsymbol{igma}(\mathbf{X})))\mathbf{V}^{T}$ </td></tr><tr><td> $\alpha\|\mathbf{X}\|_{S_{\infty}}$ </td><td> $\mathbf{X}-\alpha\text{U}\text{dg}(P_{B_{\|\cdot\|_{1}}[\mathbf{0},1]}(\boldsymbol{igma}(\mathbf{X})/\alpha))\mathbf{V}^{T}$ </td></tr><tr><td> $\alpha\|\mathbf{X}\|_{\langle k\rangle}$ </td><td> $\mathbf{X}-\alpha\text{U}\text{dg}(P_{C}(\boldsymbol{igma}(\mathbf{X})/\alpha))\mathbf{V}^{T},$  $C=B_{\|\cdot\|_{1}}[\mathbf{0},k]\cap B_{\|\cdot\|_{\infty}}[\mathbf{0},1]$ </td></tr></table>

## Appendix C Symbols and Notation

<table><tr><td>E, V</td><td></td><td>underlying vector spaces</td></tr><tr><td>E*</td><td>p. 9</td><td>dual space of E</td></tr><tr><td>||·||*</td><td>p. 9</td><td>dual norm</td></tr><tr><td>dim(V)</td><td>p. 2</td><td>dimension of a vector space V</td></tr><tr><td>aff(S)</td><td>p. 3</td><td>affine hull of a set S</td></tr><tr><td>||·||</td><td>p. 2</td><td>norm</td></tr><tr><td>||·||E</td><td>p. 2</td><td>norm of a vector space E</td></tr><tr><td>&lt; x, y&gt;</td><td>p. 2</td><td>inner product of x and y</td></tr><tr><td>Rn</td><td>p. 4</td><td>space of n-dimensional real column vectors</td></tr><tr><td>[x, y]</td><td>p. 3</td><td>closed line segment between x and y</td></tr><tr><td>(x, y)</td><td>p. 3</td><td>open line segment between x and y</td></tr><tr><td>B(c, r), B||·||(c, r)</td><td>p. 2</td><td>open ball with center c and radius r</td></tr><tr><td>B[c, r], B||·||[c, r]</td><td>p. 2</td><td>closed ball with center c and radius r</td></tr><tr><td>Rm×n</td><td>p. 6</td><td>space of m × n real-valued matrices</td></tr><tr><td>AT</td><td>p. 11</td><td>adjoint of the linear transformation A</td></tr><tr><td>I</td><td>p. 8</td><td>identity transformation</td></tr><tr><td colspan="3">The Space  $\mathbb{R}^{n}$ </td></tr><tr><td> $\mathbf{e}_{i}$ </td><td>p. 4</td><td>ith vector in the standard basis of  $\mathbb{R}^{n}$ </td></tr><tr><td> $\mathbf{e}$ </td><td>p. 4</td><td>vector of all ones</td></tr><tr><td> $\mathbf{0}$ </td><td>p. 4</td><td>vector of all zeros</td></tr><tr><td> $\| \cdot \|_{p}$ </td><td>p. 5</td><td> $l_{p}$ -norm</td></tr><tr><td> $\Delta_{n}$ </td><td>p. 5</td><td>unit simplex</td></tr><tr><td>Box $[\ell,\mathbf{u}]$ </td><td>pp. 5, 147</td><td>box with lower bounds  $\ell$  and upper bounds</td></tr><tr><td> $\mathbb{R}_{+}^{n}$ </td><td>p. 5</td><td>nonnegative orthant</td></tr><tr><td> $\mathbb{R}_{++}^{n}$ </td><td>p. 5</td><td>positive orthant</td></tr><tr><td> $H_{\mathbf{a},b}$ </td><td>p. 3</td><td>the hyperplane  $\{\mathbf{x} : \langle \mathbf{a},\mathbf{x}\rangle = b\}$ </td></tr><tr><td> $H_{\mathbf{a},b}^{-}$ </td><td>p. 3</td><td>the half-space  $\{\mathbf{x} : \langle \mathbf{a},\mathbf{x}\rangle \leq b\}$ </td></tr><tr><td> $[\mathbf{x}]_{+}$ </td><td>p. 5</td><td>nonnegative part of  $\mathbf{x}$ </td></tr><tr><td> $|\mathbf{x}|$ </td><td>p. 5</td><td>absolute values vector of  $\mathbf{x}$ </td></tr><tr><td> $\text{sgn}(\mathbf{x})$ </td><td>p. 5</td><td>sign vector of  $\mathbf{x}$ </td></tr><tr><td> $\mathbf{a} \odot \mathbf{b}$ </td><td>p. 5</td><td>Hadamard product</td></tr><tr><td> $\mathbf{x}^{\downarrow}$ </td><td>p. 180</td><td> $\mathbf{x}$  reordered nonincreasingly</td></tr><tr><td colspan="3">The Space  $\mathbb{R}^{m \times n}$ </td></tr><tr><td> $\mathbb{S}^n$ </td><td>p. 6</td><td>set of all  $n \times n$  symmetric matrices</td></tr><tr><td> $\mathbb{S}_+^n$ </td><td>p. 6</td><td>set of all  $n \times n$  positive semidefinite matrices</td></tr><tr><td> $\mathbb{S}_{++}^n$ </td><td>p. 6</td><td>set of all  $n \times n$  positive definite matrices</td></tr><tr><td> $\mathbb{S}_-^n$ </td><td>p. 6</td><td>set of all  $n \times n$  negative semidefinite matrices</td></tr><tr><td> $\mathbb{S}_{--}^n$ </td><td>p. 6</td><td>set of all  $n \times n$  negative definite matrices</td></tr><tr><td> $\mathbb{O}_n$ </td><td>p. 6</td><td>set of all  $n \times n$  orthogonal matrices</td></tr><tr><td> $\Upsilon_n$ </td><td>p. 183</td><td>spectahedron</td></tr><tr><td> $\| \mathbf{A} \|_F$ </td><td>p. 6</td><td>Frobenius norm of  $\mathbf{A}$ </td></tr><tr><td> $\| \mathbf{A} \|_{S_p}$ </td><td>p. 189</td><td>Schatten p-norm of  $\mathbf{A}$ </td></tr><tr><td> $\| \mathbf{A} \|_{\langle k\rangle}$ </td><td>p. 190</td><td>Ky Fan k-norm of  $\mathbf{A}$ </td></tr><tr><td> $\| \mathbf{A} \|_{ab}$ </td><td>p. 7</td><td>induced norm of  $\mathbf{A} \in \mathbb{R}^{m \times n}$  when  $\mathbb{R}^n$  and  $\mathbb{R}^m$  the norms  $\| \cdot \|_a$  and  $\| \cdot \|_b$  respectively</td></tr><tr><td> $\| \mathbf{A} \|_2$ </td><td>p. 7</td><td>spectral norm of  $\mathbf{A}$ </td></tr><tr><td> $\lambda_{\max}(\mathbf{A})$ </td><td></td><td>maximum eigenvalue of a symmetric matrix  $\mathbf{A}$ </td></tr><tr><td> $\lambda_{\min}(\mathbf{A})$ </td><td></td><td>maximum eigenvalue of a symmetric matrix  $\mathbf{A}$ </td></tr><tr><td colspan="3">Sets</td></tr><tr><td>int(S)</td><td></td><td>interior of S</td></tr><tr><td>cl(S)</td><td></td><td>closure of S</td></tr><tr><td>conv(S)</td><td></td><td>convex hull of S</td></tr><tr><td>A + B</td><td>p. 26</td><td>Minkowski sum of A and B</td></tr><tr><td>K°</td><td>p. 27</td><td>polar cone of K</td></tr><tr><td>NS(x)</td><td>p. 36</td><td>normal cone of S at x</td></tr><tr><td>ri(S)</td><td>p. 43</td><td>relative interior of S</td></tr><tr><td>#A</td><td></td><td>number of elements in A</td></tr><tr><td> $\Lambda_n$ </td><td>p. 180</td><td>n × n permutation matrices</td></tr><tr><td> $\Lambda_n^G$ </td><td>p. 180</td><td>n × n generalized permutation matrices</td></tr></table>

## Functions and Operators

<table><tr><td>log x</td><td></td><td>natural logarithm of x</td></tr><tr><td>dom(f)</td><td>p. 14</td><td>(effective) domain of f</td></tr><tr><td>δC</td><td>p. 14</td><td>indicator function of the set C</td></tr><tr><td>epi(f)</td><td>p. 14</td><td>epigraph of f</td></tr><tr><td>Lev(f,α)</td><td>p. 15</td><td>α-level set of f</td></tr><tr><td>dC</td><td>p. 22</td><td>distance function to C</td></tr><tr><td>σC</td><td>p. 26</td><td>support function of C</td></tr><tr><td>h1□h2</td><td>p. 24</td><td>infimal convolution of h1 and h2</td></tr><tr><td>∂f(x)</td><td>p. 35</td><td>subdifferential set of f at x</td></tr><tr><td>f&#x27;(x)</td><td>p. 202</td><td>subgradient of f at x</td></tr><tr><td>dom(∂f)</td><td>p. 40</td><td>set of points of differentiability</td></tr><tr><td>f&#x27;(x;d)</td><td>p. 44</td><td>directional derivative of f at x in the direction d</td></tr><tr><td>∇f(x)</td><td>p. 48</td><td>gradient of f at x</td></tr><tr><td>∇2f(x)</td><td></td><td>Hessian of a function over Rn at x</td></tr><tr><td>PC</td><td>p. 49</td><td>orthogonal projection on C</td></tr><tr><td>f∘g</td><td></td><td>f composed with g</td></tr><tr><td>f*</td><td>p. 87</td><td>conjugate of f</td></tr><tr><td>CL1,1(D)</td><td>p. 107</td><td>class of L-smooth functions over D</td></tr><tr><td>proxf(x)</td><td>p. 129</td><td>proximal mapping of f evaluated at x</td></tr><tr><td>Tλ(x)</td><td>p. 136</td><td>soft thresholding with level λ evaluated at x</td></tr><tr><td>Sa,b</td><td>p. 151</td><td>two-sided soft thresholding</td></tr><tr><td>Hμ</td><td>p. 163</td><td>Huber function with smoothing parameter μ</td></tr><tr><td>TLf,g(x), TL(x)</td><td>p. 271</td><td>prox-grad mapping evaluated at x</td></tr><tr><td>GLf,g(x), GL(x)</td><td>p. 273</td><td>gradient mapping evaluated at x</td></tr></table>

## Matrices

<table><tr><td> $\mathbf{A}^{\dagger}$ </td><td>Moore–Penrose pseudoinverse</td></tr><tr><td> $\lambda_{\text{max}}(\mathbf{A})$ </td><td>maximum eigenvalue of  $\mathbf{A}$ </td></tr><tr><td> $\lambda_{\text{min}}(\mathbf{A})$ </td><td>minimum eigenvalue of  $\mathbf{A}$ </td></tr><tr><td> $\sigma_{\text{max}}(\mathbf{A})$ </td><td>maximum singular of  $\mathbf{A}$ </td></tr><tr><td>Range( $\mathbf{A}$ )</td><td>range of  $\mathbf{A}$ —all linear combinations of the columns of  $\mathbf{A}$ </td></tr><tr><td>Null( $\mathbf{A}$ )</td><td>null space/kernel of  $\mathbf{A}$ </td></tr><tr><td>diag( $\mathbf{x}$ )</td><td>diagonal matrix with diagonal  $\mathbf{x}$ </td></tr><tr><td> $\text{dg}(\mathbf{x})$  p. 188</td><td>generalized diagonal matrix with diagonal  $\mathbf{x}$ </td></tr></table>

# Appendix D Bibliographic Notes

Chapter 1. For a comprehensive treatment of finite-dimensional vector spaces and advanced linear algebra topics, the reader can refer to the classical book of Halmos [64], as well as to the textbooks of Meyer [86] and Strang [117].

Chapters 2, 3, 4. Most of the material in these chapters is classical. Additional materials and extensions can be found, for example, in Bauschke and Combettes [8], Bertsekas [29], Borwein and Lewis [32], Hiriart-Urruty and Lemar´echal [67], Nesterov [94] and Rockafellar [108]. Example 2.17 is taken from the book of Hiriart-Urruty and Lemar´echal [67, Example 2.1.4]. Example 2.32 is from Rockafellar [108, p. 83]. The proof in Example 3.31 follows Beck and Teboulle [20, Theorem 4.1]. Section 3.5, excluding Theorem 3.60, follows Hiriart-Urruty and Lemar´echal [67, Section VII.3.3]. Theorem 3.60 is a slight extension of Lemma 6 from Lan [78]. The optimality conditions derived in Example 3.66 are rather old and can be traced back to Sturm, who proved them in his work from 1884 [118]. Actually, (re)proving these conditions was the main motivation for Weiszfeld to devise the (now-called) Weiszfeld’s method in 1937 [124]. For more information on the Fermat–Weber problem and Weiszfeld’s method, see the review paper of Beck and Sabach [14] and references therein.

Chapter 5. The proof of the descent lemma can be found in Bertsekas [28]. The proof of Theorem 5.8 follows the proof of Nesterov in [94, Theorem 2.1.5]. The equivalence between claims (i) and (iv) in Theorem 5.8 is also known as the Baillon-Haddad theorem [5]. The analysis in Example 5.11 of the smoothness parameter of the squared $l_{p}{\mathrm{- norm}}$ follows the derivation in the work of Ben-Tal, Margalit, and Nemirovski [24, Appendix 1]. The conjugate correspondence theorem can be deduced from the work of Zalinescu [128, Theorem 2.2] and can also be found in the paper of Az´e and Penot [3] as well as Zalinescu’s book [129, Corollary 3.5.11]. In its Euclidean form, the result can be found in the book of Rockafellar and Wets [111, Proposition 12.60]. Further characterizations appear in the paper of Bauschke and Combettes [7]. The proof of Theorem 5.30 follows Beck and Teboulle [20, Theorem 4.1].

Chapter 6. The seminal 1965 paper of Moreau [87] already contains much of the properties of the proximal mapping discussed in the chapter. Excellent references for the subject are the book of Bauschke and Combettes [8], the paper of Combettes and Wajs [44], and the review paper of Parikh and Boyd [102]. The computation of the prox of the squared $l_{\mathrm{1 - norm}}$ in Section 6.8.2 is due to Evgeniou, Pontil, Spinellis, and Nassuphis [54].

Chapter 7. The notion of symmetry w.r.t. a given set of orthogonal matrices was studied by Rockafellar [108, Chapter 12]. A variant of the symmetric conjugate theorem (Theorem 7.9) can be found in Rockafellar [108, Corollary 12.3.1]. Fan’s inequality can be found in Theobald [119]. Von Neumann’s trace inequality [123], as well as Fan’s inequality, are often formulated over the complex field, but the adaptation to the real field is straightforward. Sections 7.2 and 7.3, excluding the spectral proximal theorem, are based on the seminal papers of Lewis [80, 81] on unitarily invariant functions. See also Borwein and Lewis [32, Section 1.2], as well as Borwein and Vanderwerf [33, Section 3.2]. The equivalence between the convexity of spectral functions and their associated functions was first established by Davis in [47]. The spectral proximal formulas can be found in Parikh and Boyd [102].

Chapter 8. Example 8.3 is taken from Vandenberghe’s lecture notes [122]. Wolfe’s example with $\begin{array}{r}{\gamma = \frac{\bar{16}}{9}} \end{array}$ originates from his work [125]. The version with general $\gamma > 1$ along with the support form of the function, can be found in the set of exercises [35]. Studies of subgradient methods and extensions can be found in many books; to name a few, the books of Nemirovsky and Yudin [92], Shor [116] and Polyak [104] are classical; modern accounts of the subject can be found, for example, in Bertsekas [28, 29, 30], Nesterov [94], and Ruszczy´nski [113]. The analysis of the stochastic and deterministic projected subgradient method in the strongly convex case is based on the work of Lacoste-Julien, Schmidt, and Bach [77]. The fundamental inequality for the incremental projected subgradient is taken from Nedi´c and Bertsekas [89], where many additional results on incremental methods are derived. Theorem 8.42 and Lemma 8.47 are Lemmas 1 and 3 from the work of from Nedi´c and Ozdaglar [90]. The latter work also contains additional results on the dual projected subgradient method with constant stepsize. The presentation of the network utility maximization problem, as well as the distributed subgradient method for solving it, originates from Nedi´c and Ozdaglar [91].

Chapter 9. The mirror descent method was introduced by Nemirovsky and Yudin in [92]. The interpretation of the method as a non-Euclidean projected subgradient method was presented by Beck and Teboulle in [15]. The rate of convergence analysis of the mirror descent method is based on [15]. The three-points lemma was proven by Chen and Teboulle in [43]. The analysis of the mirror-C method is based on the work of Duchi, Shalev-Shwartz, Singer, and Tewari [49], where the algorithm is introduced in an online and stochastic setting.

Chapter 10. The proximal gradient method can be traced back to the forwardbackward algorithm introduced by Bruck [36], Pasty [103], and Lions and Mercier [83]. More modern accounts of the topic can be found, for example, in Bauschke and Combettes [8, Chapter 27], Combettes and Wajs [44], and Facchinei and Pang [55, Chapter 12]. The proximal gradient method is a generalization of the gradient method, which goes back to Cauchy [38] and was extensively studied and generalized by many authors; see, for example, the books of Bertsekas [28], Nesterov [94], Polyak [104], and Nocedal and Wright [99], as well as the many references therein. ISTA and its variations was studied in the literature in several contexts; see, for example, the works of Daubechies, Defrise, and De Mol [46]; Hale, Yin, and Zhang [63]; Wright, Nowak, and Figueiredo [127]; and Elad [52]. The analysis of the proximal gradient method in Sections 10.3 and 10.4 mostly follows the presentation of Beck and Teboulle in [18] and [19]. Lemma 10.11 was stated and proved for the case where g is an indicator of a nonempty closed and convex set in [9]; see also [13, Lemma 2.3]. Theorem 10.9 on the monotonicity of the gradient mapping is a simple generalization of [10, Lemma 9.12]. The first part of the monotonicity result was shown in the case where g is an indicator of a nonempty closed and convex set in Bertsekas [28, Lemma 2.3.1]. Lemma 10.12 is a minor variation of Lemma 2.4 from Necoara and Patrascu [88]. Theorem 10.26 is an extension of a result of Nesterov from [97] on the convergence of the gradient method for convex functions. The proximal point method was studied by Rockafellar in [110], as well as by many other authors; see, for example, the book of Bauschke and Combettes [8] and its extensive list of references. FISTA was developed by Beck and Teboulle in [18]; see also the book chapter [19]; the convergence analysis presented in Section 10.7 is taken from these sources. When the nonsmooth part is an indicator function of a closed and convex set, the method reduces to the optimal gradient method of Nesterov from 1983 [93]. Other accelerated proximal gradient methods can be found in the works of Nesterov [98] and Tseng [121]—the latter also describes a generalization to the non-Euclidean setting, which is an extension of the work of Auslender and Teboulle [2]. MFISTA and its convergence analysis are from the work of Beck and Teboulle [17]. The idea of using restarting in order to gain an improved rate of convergence in the strongly convex case can be found in Nesterov’s work [98] in the context of a different accelerated proximal gradient method, but the idea works for any method that gains an $O(1 / \bar{k}^{2})$ rate in the (not necessarily strongly) convex case. The proof of Theorem 10.42 follows the proof of Theorem 4.10 from the review paper of Chambolle and Pock [42]. The idea of solving nonsmooth problems through a smooth approximation was studied by many authors; see, for example, the works of Ben-Tal and Teboulle [25], Bertsekas [26], Moreau [87], and the more recent book of Auslender and Teboulle [1] and references therein. Lemma 10.70 can be found in Levitin and Polyak [79]. The idea of producing an $O(1 / \varepsilon)$ complexity result for nonsmooth problems by employing an accelerated gradient method was first presented and developed by Nesterov in [95]. The extension to the three-part composite model and to the setting of more general smooth ap proximations was studied by Beck and Teboulle [20], where additional results and extensions can also be found. The non-Euclidean gradient method was proposed by Nutini, Schmidt, Laradji, Friendlander, and Koepke [100], where its rate of convergence in the strongly convex case was analyzed; the work [100] also contains a comparison between two coordinate selection strategies: Gauss–Southwell (which is the one considered in the chapter) and randomized selection. The non-Euclidean proximal gradient method was presented in the work of Tseng [121], where an accelerated non-Euclidean version was also analyzed.

Chapter 11. The version of the block proximal gradient method in which the nonsmooth functions $g_{i}$ are indicators was studied by Luo and Tseng in [84], where some error bounds on the model were assumed. It was shown that under the model assumptions, the CBPG method with each block consisting of a single variable has a linear rate of convergence. Nesterov studied in [96] a randomized version of the method (again, in the setting where the nonsmooth functions are indicators) in which the selection of the block on which a gradient projection step is performed at each iteration is done randomly via a pre-described distribution. For the first time, Nesterov was able to establish global nonasymptotic rates of convergence in the convex case without any strict convexity, strong convexity, uniqueness, or error bound assumptions. Specifically, it was shown that the rate of convergence to the optimal value of the expectation sequence of the function values of the sequence generated by the randomized method is sublinear under the assumption of Lipschitz continuity of the gradient and linear under a strong convexity assumption. In addition, an accelerated $O(1 / k^{2})$ was devised in the unconstrained setting. Probabilistic results on the convergence of the function values were also provided. In [107] Richtarik and Takac generalized Nesterovs results to the composite model. The derivation of the randomized complexity result in Section 11.5 mostly follows the presentation in the work of Lin, Lu, and Xiao [82]. The type of analysis in the deterministic convex case (Section 11.4.2) originates from Beck and Tetruashvili [22], who studied the case in which the nonsmooth functions are indicators. The extension to the general composite model can be found in Shefi and Teboulle [115] as well as in Hong, Wang, Razaviyayn, and Luo [69]. Lemma 11.17 is Lemma 3.8 from [11]. Theorem 11.20 is a specialization of Lemma 2 from Nesterov [96]. Additional related methods and discussions can be found in the extensive survey of Wright [126].

Chapter 12. The idea of using a proximal gradient method on the dual of the main model (12.1) was originally developed by Tseng in [120], where the algorithm was named “alternating minimization.” The primal representations of the DPG and FDPG methods, convergence analysis, as well as the primal-dual relation are from Beck and Teboulle [21]. The DPG method for solving the total variation problem was initially devised by Chambolle in [39], and the accelerated version was considered by Beck and Teboulle [17]. The one-dimensional total variation denoising problem is presented as an illustration for the DPG and FDPG methods; however, more direct and efficient methods exist for tackling the problem; see Hochbaum [68], Condat [45], Johnson [73], and Barbero and Sra [6]. The dual block proximal gradient method was discussed in Beck, Tetruashvili, Vaisbourd, and Shemtov [23], from which the specific decomposition of the isotropic two-dimensional total variation function is taken. The accelerated method ADBPG is a different representation of the accelerated method proposed by Chambolle and Pock in [41]. The latter work also discusses dual block proximal gradient methods and contains many other suggestions for decompositions of total variation functions.

Chapter 13. The conditional gradient algorithm was presented by Frank and Wolfe [56] in 1956 for minimizing a convex quadratic function over a compact polyhedral set. The original paper of Frank and Wolfe also contained a proof of an $O(1 / k)$ rate of convergence in function values. Levitin and Polyak [79] showed that this $O(1 / k)$ rate can also be extended to the case where the feasible set is a general compact convex set and the objective function is L-smooth and convex. Dunn and Harshbarger [50] were probably the first to suggest a diminishing stepsize rule for the conditional gradient method and to establish a sublinear rate under such a strategy. The generalized conditional gradient method was introduced and analyzed by Bach in [4], where it was shown that under a certain setting, it can be viewed as a dual mirror descent method. Lemma 13.7 (fundamental inequality for generalized conditional gradient) can be found in the setting of the conditional gradient method in Levitin and Polyak [79]. The interpretation of the power method as the conditional gradient method was described in the work of Luss and Teboulle [85], where many other connections between the conditional gradient method and the sparse PCA problem are explored. Lemma 13.13 is an extension of Lemma 4.4 from Bach’s work [4], and the proof is almost identical. Similar results on sequences of nonnegative numbers can be found in the book of Polyak [104, p. 45]. Section 13.3.1 originates from the work of Canon and Cullum [37]. Polyak in [104, p. 214, Exercise 10] seems to be the first to mention the linear rate of convergence of the conditional gradient method under a strong convexity assumption on the feasible set. Theorem 13.23 is from Journ´ee, Nesterov, Richt´arik, and Sepulchre [74, Theorem 12]. Lemma 13.26 and Theorem 13.27 are from Levitin and Polyak [79], and the exact form of the proof is due to Edouard Pauwels. Another situation, which was not discussed in the chapter, in which linear rate of converge can be established, is when the objective function is strongly convex and the optimal solution resides in the interior of the feasible set (Gu´elat and Marcotte [62]). Epelman and Freund [53], as well as Beck and Teboulle [16], showed a linear rate of convergence of the conditional gradient method with a special stepsize choice in the context of finding a point in the intersection of an Affine space and a closed and convex set under a Slater-type assumption. The randomized generalized block conditional gradient method presented in Section 13.4 is a simple generalization of the randomized block conditional gradient method introduced and analyzed by Lacoste-Julien, Jaggi, Schmidt, and Pletscher in [76]. A deterministic version was analyzed by Beck, Pauwels, and Sabach in [12]. An excellent overview of the conditional gradient method, including many more theoretical results and applications, can be found in the thesis of Jaggi [72].

Chapter 14. The alternating minimization method is a rather old and fundamental algorithm. It appears in the literature under various names such as the blocknonlinear Gauss-Seidel method or the block coordinate descent method. Powell’s example appears in [106]. Theorem 14.3 and its proof originate from Bertsekas [28, Proposition 2.7.1]. Theorem 14.9 and its proof are an extension of Proposition 6 from Grippo and Sciandrone [61] to the composite model. The proof of Theorem 14.11 follows the proof of Theorem 3.1 from the work of Hong, Wang, Razaviyayn, and Luo [69], where more general schemes than alternating minimization are also considered. Section 14.5.2 follows [11].

Chapter 15 The augmented Lagrangian method can be traced back to Hestenes [66] and Powell [105]. The method and its many variants was studied extensively in the literature, see, for example, the books of Bertsekas [27] and Bertsekas and Tsitsiklis [31] and references therein. Rockafellar [109] was first to establish the duality between the proximal point and the augmented Lagrangian methods; see also additional discussions in the work of Iusem [71]. ADMM is equivalent to an operator splitting method called Douglas–Rachford splitting, which was introduced in the 1950s for the numerical solution of partial diferential equations [48]. ADMM, as presented in the chapter, was first introduced by Gabay and Mercier [57] and Glowinski and Marrocco [59]. An extremely extensive survey on ADMM method can be found in the work of Boyd, Parikh, Chu, Peleato, and Eckstein [34]. AD-PMM was suggested by Eckstein [51]. The proof of Theorem 15.4 on the rate of convergence of AD-PMM is based on a combination of the proof techniques of He and Yuan [65] and Gao and Zhang [58]. Shefi and Teboulle provided in [114] a unified analysis for general classes of algorithm that include AD-PMM as a special instance. Shefi and Teboulle also showed the relation between AD-LPMM and the Chambolle–Pock algorithm [40].

## Bibliography

[1] <sup>A.</sup> <sup>Auslender</sup> <sup>and</sup> <sup>M.</sup> <sup>Teboulle</sup>, Asymptotic cones and functions in optimization and variational inequalities, Springer Monographs in Mathematics, Springer-Verlag, New York, 2003. (Cited on p. 459)

[2] , Interior gradient and proximal methods for convex and conic optimization, SIAM J. Optim., 16 (2006), pp. 697–725, https://doi.org/10.1137/ S1052623403427823. (Cited on p. 459)

[3] <sup>D.</sup> <sup>Az´e</sup> <sup>and</sup> <sup>J.</sup> <sup>Penot</sup>, Uniformly convex and uniformly smooth convex functions, Ann. Fac. Sci. Toulouse Math. (6), 4 (1995), pp. 705–730. (Cited on p. 457)

[4] <sup>F.</sup> <sup>Bach</sup>, Duality between subgradient and conditional gradient methods, SIAM J. Optim., 25 (2015), pp. 115–129, https://doi.org/10.1137/ 130941961. (Cited on pp. 387, 461)

[5] <sup>J.</sup> <sup>B.</sup> <sup>Baillon</sup> <sup>and</sup> <sup>G.</sup> <sup>Haddad</sup>, Quelques propri´et´es des op´erateurs angleborn´es et n-cycliquement monotones, Israel J. Math., 26 (1977), pp. 137–150. (Cited on p. 457)

[6] <sup>A.</sup> <sup>Barbero</sup> <sup>and</sup> <sup>S.</sup> <sup>Sra</sup>, Modular proximal optimization for multidimensional total-variation regularization. Available at https://arxiv.org/abs/ 1411.0589. (Cited on p. 460)

[7] H. H. Bauschke and P. L. Combettes, The Baillon-Haddad theorem revisited, J. Convex Anal., 17 (2010), pp. 781–787. (Cited on p. 457)

[8] , Convex analysis and monotone operator theory in Hilbert spaces, CMS Books in Mathematics/Ouvrages de Math´ematiques de la SMC, Springer, New York, 2011. With a foreword by H´edy Attouch. (Cited on pp. 457, 458, 459)

[9] <sup>A.</sup> <sup>Beck</sup>, Convergence Rate Analysis of Gradient Based Algorithms, Ph.D. thesis, School of Mathematical Sciences, Tel-Aviv University, 2003. (Cited on p. 459)

[10] , Introduction to Nonlinear Optimization: Theory, Algorithms, and Applications with MATLAB, MOS-SIAM Series on Optimization, SIAM, Philadelphia, PA, 2014, https://doi.org/10.1137/1.9781611973655. (Cited on pp. 24, 28, 31, 45, 49, 63, 108, 112, 147, 195, 256, 386, 459)

[11] , On the convergence of alternating minimization for convex programming with applications to iteratively reweighted least squares and decomposition schemes, SIAM J. Optim., 25 (2015), pp. 185–209, https://doi.org/ 10.1137/13094829X. (Cited on pp. 460, 461)

[12] <sup>A.</sup> <sup>Beck,</sup> <sup>E.</sup> <sup>Pauwels,</sup> <sup>and</sup> <sup>S.</sup> <sup>Sabach</sup>, The cyclic block conditional gradient method for convex optimization problems, SIAM J. Optim., 25 (2015), pp. 2024–2049, https://doi.org/10.1137/15M1008397. (Cited on p. 461)

[13] <sup>A.</sup> <sup>Beck</sup> <sup>and</sup> <sup>S.</sup> <sup>Sabach</sup>, A first order method for finding minimal normlike solutions of convex optimization problems, Math. Program., 147 (2014), pp. 25–46. (Cited on p. 459)

[14] , Weiszfeld’s method: Old and new results, J. Optim. Theory Appl., 164 (2015), pp. 1–40. (Cited on p. 457)

[15] <sup>A.</sup> <sup>Beck</sup> <sup>and</sup> <sup>M.</sup> <sup>Teboulle</sup>, Mirror descent and nonlinear projected subgradient methods for convex optimization, Oper. Res. Lett., 31 (2003), pp. 167– 175. (Cited on p. 458)

[16] , A conditional gradient method with linear rate of convergence for solving convex linear systems, Math. Methods Oper. Res., 59 (2004), pp. 235–247. (Cited on p. 461)

[17] , Fast gradient-based algorithms for constrained total variation image denoising and deblurring problems, IEEE Trans. Image Process., 18 (2009), pp. 2419–2434. (Cited on pp. 296, 459, 460)

[18] , A fast iterative shrinkage-thresholding algorithm for linear inverse problems, SIAM J. Imaging Sci., 2 (2009), pp. 183–202, https://doi.org/10. 1137/080716542. (Cited on pp. 272, 290, 459)

[19] , Gradient-based algorithms with applications to signal-recovery problems, in Convex Optimization in Signal Processing and Communications, Cambridge University Press, Cambridge, 2010, pp. 42–88. (Cited on pp. 272, 459)

[20] , Smoothing and first order methods: A unified framework, SIAM J. Optim., 22 (2012), pp. 557–580, https://doi.org/10.1137/100818327. (Cited on pp. 49, 304, 457, 459)

[21] , A fast dual proximal gradient algorithm for convex minimization and applications, Oper. Res. Lett., 42 (2014), pp. 1–6. (Cited on pp. 355, 460)

[22] <sup>A. Beck and L. Tetruashvili</sup>, On the convergence of block coordinate descent type methods, SIAM J. Optim., 23 (2013), pp. 2037–2060, https:// doi.org/10.1137/120887679. (Cited on pp. 342, 460)

<sub>[23]</sub> A. Beck, L. Tetruashvili, Y. Vaisbourd, and A. Shemtov<sub>,</sub> <sub>Rate</sub> of convergence analysis of dual-based variables decomposition methods for strongly convex problems, Oper. Res. Lett., 44 (2016), pp. 61–66. (Cited on pp. 377, 460)

<sub>[24]</sub> A. Ben-Tal, T. Margalit, and A. Nemirovski<sub>,</sub> <sub>The</sub> <sub>ordered</sub> <sub>sub-</sub> sets mirror descent optimization method with applications to tomography, SIAM J. Optim., 12 (2001), pp. 79–108, https://doi.org/10.1137/ S1052623499354564. (Cited on pp. 112, 457)

[25] <sup>A. Ben-Tal and M. Teboulle</sup>, A smoothing technique for nondiferentiable optimization problems, in Optimization (Varetz, 1988), vol. 1405 of Lecture Notes in Math., Springer, Berlin, 1989, pp. 1–11. (Cited on p. 459)

[26] <sup>D.</sup> <sup>P.</sup> <sup>Bertsekas</sup>, Nondiferentiable optimization via approximation: Nondifferentiable optimization, Math. Programming Stud., (1975), pp. 1–25. (Cited on p. 459)

[27] , Constrained optimization and Lagrange multiplier methods, Computer Science and Applied Mathematics, Academic Press. [Harcourt Brace Jovanovich], New York, London, 1982. (Cited on p. 461)

[28] , Nonlinear Programming, Athena Scientific, Belmont, MA, second ed., 1999. (Cited on pp. 407, 457, 458, 459, 461)

[29] , Convex Analysis and Optimization, Athena Scientific, Belmont, MA, 2003. With Angelia Nedi´c and Asuman E. Ozdaglar. (Cited on pp. 41, 439, 457, 458)

[30] , Convex Optimization Algorithms, Athena Scientific, Belmont, MA, 2015. (Cited on p. 458)

[31] <sup>D.</sup> <sup>P.</sup> <sup>Bertsekas</sup> <sup>and</sup> <sup>J.</sup> <sup>N.</sup> <sup>Tsitsiklis</sup>, Parallel and Distributed Computation: Numerical Methods, Prentice-Hall, Upper Saddle River, NJ, 1989. (Cited on p. 461)

[32] <sup>J.</sup> <sup>M.</sup> <sup>Borwein</sup> <sup>and</sup> <sup>A.</sup> <sup>S.</sup> <sup>Lewis</sup>, Convex Analysis and Nonlinear Optimization: Theory and Examples, CMS Books in Mathematics/Ouvrages de Math´ematiques de la SMC, 3, Springer, New York, second ed., 2006. (Cited on pp. 183, 457, 458)

[33] <sup>J.</sup> <sup>M.</sup> <sup>Borwein</sup> <sup>and</sup> <sup>J.</sup> <sup>D.</sup> <sup>Vanderwerff</sup>, Convex Functions: Constructions, Characterizations and Counterexamples, vol. 109 of Encyclopedia of Mathematics and Its Applications, Cambridge University Press, Cambridge, 2010. (Cited on p. 458)

<sub>[34]</sub> S. Boyd, N. Parikh, E. Chu, B. Peleato, and J. Eckstein<sub>, Distributed</sub> optimization and statistical learning via the alternating direction method of multipliers, Found. Trends Mach. Learn., 3 (2011), pp. 1–122. (Cited on p. 462)

[35] <sup>S.</sup> <sup>Boyd</sup> <sup>and</sup> <sup>L.</sup> <sup>Vandenberghe</sup>, Additional exercises for convex optimization. Available at http://www.stanford.edu/ boyd/cvxbook/bv\_cvxbook. (Cited on p. 458)

[36] <sup>R.</sup> <sup>E.</sup> <sup>Bruck</sup>, On the weak convergence of an ergodic iteration for the solution of variational inequalities for monotone operators in Hilbert space, J. Math. Anal. Appl., 61 (1977), pp. 159–164. (Cited on p. 458)

[37] <sup>M.</sup> <sup>D.</sup> <sup>Canon</sup> <sup>and</sup> <sup>C.</sup> <sup>D.</sup> <sup>Cullum</sup>, A tight upper bound on the rate of convergence of the Frank-Wolfe algorithm, SIAM J. Control, 6 (1968), pp. 509–516, https://doi.org/10.1137/0306032. (Cited on pp. 391, 461)

[38] <sup>A.</sup> <sup>L.</sup> <sup>Cauchy</sup>, M´ethode generales pour la r´esolution des syst\`emes d’equations simultan´ees, Comptes Rendues Acad. Sci. Paris, 25 (1847), pp. 536–538. (Cited on p. 459)

[39] <sup>A. Chambolle</sup>, An algorithm for total variation minimization and applications, J. Math. Imaging Vision, 20 (2004), pp. 89–97. Special issue on mathematics and image analysis. (Cited on p. 460)

[40] <sup>A.</sup> <sup>Chambolle</sup> <sup>and</sup> <sup>T.</sup> <sup>Pock</sup>, A first-order primal-dual algorithm for convex problems with applications to imaging, J. Math. Imaging Vision, 40 (2011), pp. 120–145. (Cited on p. 462)

[41] , A remark on accelerated block coordinate descent for computing the proximity operators of a sum of convex functions, SMAI J. Comput. Math., 1 (2015), pp. 29–54. (Cited on pp. 373, 460)

[42] , An introduction to continuous optimization for imaging, Acta Numerica, 25 (2016), 161–319. (Cited on pp. 302, 459)

[43] <sup>G.</sup> <sup>Chen</sup> <sup>and</sup> <sup>M.</sup> <sup>Teboulle</sup>, Convergence analysis of a proximal-like minimization algorithm using Bregman functions, SIAM J. Optim., 3 (1993), pp. 538–543, https://doi.org/10.1137/0803026. (Cited on pp. 252, 458)

[44] <sup>P.</sup> <sup>L.</sup> <sup>Combettes</sup> <sup>and</sup> <sup>V.</sup> <sup>R.</sup> <sup>Wajs</sup>, Signal recovery by proximal forwardbackward splitting, Multiscale Model. Simul., 4 (2005), pp. 1168–1200, https://doi.org/10.1137/050626090. (Cited on p. 458)

[45] <sup>L.</sup> <sup>Condat</sup>, A direct algorithm for 1-d total variation denoising, IEEE Signal Process. Lett., 20 (2013), pp. 1054–1057. (Cited on p. 460)

<sub>[46]</sub> I. Daubechies, M. Defrise, and C. De Mol<sub>,</sub> <sub>An</sub> <sub>iterative</sub> <sub>thresholding</sub> algorithm for linear inverse problems with a sparsity constraint, Comm. Pure Appl. Math., 57 (2004), pp. 1413–1457. (Cited on p. 459)

[47] <sup>C.</sup> <sup>Davis</sup>, All convex invariant functions of hermitian matrices, Arch. Math., 8 (1957), pp. 276–278. (Cited on p. 458)

[48] <sup>J.</sup> <sup>Douglas</sup> <sup>and</sup> <sup>H.</sup> <sup>H.</sup> <sup>Rachford</sup>, On the numerical solution of heat conduction problems in two and three space variables, Trans. Amer. Math. Soc., 82 (1956), pp. 421–439. (Cited on p. 462)

<sub>[49]</sub> J. C. Duchi, S. Shalev-Shwartz, Y. Singer, and A. Tewari<sub>, Composite</sub> objective mirror descent, in COLT 2010—The 23rd Conference on Learning Theory, 2010, pp. 14–26. (Cited on pp. 260, 458)

[50] <sup>J.</sup> <sup>C.</sup> <sup>Dunn</sup> <sup>and</sup> <sup>S.</sup> <sup>Harshbarger</sup>, Conditional gradient algorithms with open loop step size rules, J. Math. Anal. Appl., 62 (1978), pp. 432–444. (Cited on p. 461)

[51] <sup>J.</sup> <sup>Eckstein</sup>, Some saddle-function splitting methods for convex programming, Optim. Methods Softw., 4 (1994), pp. 75–83. (Cited on p. 462)

[52] <sup>M.</sup> <sup>Elad</sup>, Why simple shrinkage is still relevant for redundant representations?, IEEE Trans. Inform. Theory, 52 (2006), pp. 5559–5569. (Cited on p. 459)

[53] <sup>M.</sup> <sup>Epelman</sup> <sup>and</sup> <sup>R.</sup> <sup>M.</sup> <sup>Freund</sup>, Condition number complexity of an elementary algorithm for computing a reliable solution of a conic linear system, Math. Program., 88 (2000), pp. 451–485. (Cited on p. 461)

<sub>[54]</sub> T. Evgeniou, M. Pontil, D. Spinellis, and N. Nassuphis<sub>,</sub> <sub>Regular-</sub> ized robust portfolio estimation, in Regularization, Optimization, Kernels, and Support Vector Machines, CRC Press, Boca Raton, FL, 2015. (Cited on pp. 173, 458)

[55] <sup>F.</sup> <sup>Facchinei</sup> <sup>and</sup> <sup>J.</sup> <sup>S.</sup> <sup>Pang</sup>, Finite-dimensional variational inequalities and complementarity problems. Vol. II, Springer Series in Operations Research, Springer-Verlag, New York, 2003. (Cited on p. 459)

[56] <sup>M.</sup> <sup>Frank</sup> <sup>and</sup> <sup>P.</sup> <sup>Wolfe</sup>, An algorithm for quadratic programming, Naval Res. Logist. Quart., 3 (1956), pp. 95–110. (Cited on p. 460)

[57] <sup>D.</sup> <sup>Gabay</sup> <sup>and</sup> <sup>B.</sup> <sup>Mercier</sup>, A dual algorithm for the solution of nonlinear variational problems via finite element approximations, Comp. Math. Appl., 2 (1976), pp. 17–40. (Cited on p. 462)

[58] <sup>X.</sup> <sup>Gao</sup> <sup>and</sup> <sup>S.-Z.</sup> <sup>Zhang</sup>, First-order algorithms for convex optimization with nonseparable objective and coupled constraints, J. Oper. Res. Soc. China, 5 (2017), pp. 131–159. (Cited on pp. 428, 462)

[59] <sup>R.</sup> <sup>Glowinski</sup> <sup>and</sup> <sup>A.</sup> <sup>Marroco</sup>, Sur l’approximation, par ´el´ements finis d’ordre un, et la r´esolution, par p´enalisation-dualit´e d’une classe de probl\`emes de dirichlet non lin´eaires, ESAIM: Mathematical Modelling and Numerical Analysis—Mod´elisation Math´ematique et Analyse Num´erique, 9 (1975), pp. 41–76. (Cited on p. 462)

[60] <sup>G.</sup> <sup>H.</sup> <sup>Golub</sup> <sup>and</sup> <sup>C.</sup> <sup>F.</sup> <sup>Van</sup> <sup>Loan</sup>, Matrix Computations, Johns Hopkins Studies in the Mathematical Sciences, Johns Hopkins University Press, Baltimore, MD, third ed., 1996. (Cited on p. 188)

[61] <sup>L.</sup> <sup>Grippo</sup> <sup>and</sup> <sup>M.</sup> <sup>Sciandrone</sup>, On the convergence of the block nonlinear Gauss-Seidel method under convex constraints, Oper. Res. Lett., 26 (2000), pp. 127–136. (Cited on pp. 413, 461)

[62] <sup>J.</sup> <sup>Gu´elat</sup> <sup>and</sup> <sup>P.</sup> <sup>Marcotte</sup>, Some comments on Wolfe’s “away step,” Math. Program., 35 (1986), pp. 110–119. (Cited on p. 461)

[63] <sup>E.</sup> <sup>T.</sup> <sup>Hale,</sup> <sup>W.</sup> <sup>Yin,</sup> <sup>and</sup> <sup>Y.</sup> <sup>Zhang</sup>, Fixed-point continuation for $\ell_{1} -$ minimization: Methodology and convergence, SIAM J. Optim., 19 (2008), pp. 1107–1130, https://doi.org/10.1137/070698920. (Cited on p. 459)

[64] <sup>P.</sup> <sup>R.</sup> <sup>Halmos</sup>, Finite-Dimensional Vector Spaces, Undergraduate Texts in Mathematics, Springer-Verlag, New York, Heidelberg, second ed., 1974. (Cited on p. 457)

<sub>[65]</sub> B. He and X. Yuan<sub>, On</sub> <sub>the</sub> $O(1 / n)$ convergence rate of the Douglas– Rachford alternating direction method, SIAM J. Numer. Anal., 50 (2012), pp. 700–709, https://doi.org/10.1137/110836936. (Cited on pp. 428, 462)

[66] <sup>M.</sup> <sup>R.</sup> <sup>Hestenes</sup>, Multiplier and gradient methods, J. Optimization Theory Appl., 4 (1969), pp. 303–320. (Cited on p. 461)

<sub>[67]</sub> J. B. Hiriart-Urruty and C. Lemar´echal<sub>, Convex analysis and min-</sub> imization algorithms. I, vol. 305 of Grundlehren der Mathematischen Wissenschaften [Fundamental Principles of Mathematical Sciences], Springer-Verlag, Berlin, 1996. Second Printing. (Cited on pp. 22, 67, 119, 457)

[68] <sup>D.</sup> <sup>S.</sup> <sup>Hochbaum</sup>, An efficient algorithm for image segmentation, Markov random fields and related problems, J. ACM, 48 (2001), pp. 686–701. (Cited on p. 460)

<sub>[69]</sub> M. Hong, X. Wang, M. Razaviyayn, and Z. Q. Luo<sub>, Iteration complexity</sub> analysis of block coordinate descent methods. Available at http://arxiv.org/ abs/1310.6957. (Cited on pp. 342, 416, 460, 461)

[70] <sup>R.</sup> <sup>A.</sup> <sup>Horn</sup> <sup>and</sup> <sup>C.</sup> <sup>R.</sup> <sup>Johnson</sup>, Matrix Analysis, Cambridge University Press, Cambridge, second ed., 2013. (Cited on p. 189)

[71] <sup>A.</sup> <sup>N.</sup> <sup>Iusem</sup>, Augmented Lagrangian methods and proximal point methods for convex optimization, Investigacion Operativa, 8 (1999), pp. 11–49. (Cited on p. 461)

[72] <sup>M.</sup> <sup>Jaggi</sup>, Sparse Convex Optimization Methods for Machine Learning, Ph.D. thesis, ETH Zurich, 2011. (Cited on p. 461)

[73] <sup>N.</sup> <sup>A.</sup> <sup>Johnson</sup>, A dynamic programming algorithm for the fused lasso and L<sub>0</sub>-segmentation, J. Comput. Graph. Statist., 22 (2013), pp. 246–260. (Cited on p. 460)

<sub>[74]</sub> M. Journ´ee, Y. Nesterov, P. Richtarik, and R. Sepulchre ´ <sub>,</sub> <sub>Gener-</sub> alized power method for sparse principal component analysis, J. Mach. Learn. Res., 11 (2010), pp. 517–553. (Cited on pp. 397, 461)

[75] <sup>K.</sup> <sup>Knopp</sup>, Theory and Application of Infinite Series, Blackie & Son Limited, 1951. (Cited on p. 392)

<sub>[76]</sub> S. Lacoste-Julien, M. Jaggi, M. Schmidt, and P. Pletscher<sub>, Block-</sub> coordinate Frank-Wolfe optimization for structural SVMs, in Proceedings of the 30th International Conference on Machine Learning (ICML-13), vol. 28, 2013, pp. 53–61. (Cited on pp. 400, 461)

<sub>[77]</sub> S. Lacoste-Julien, M. Schmidt, and F. Bach<sub>,</sub> <sub>A</sub> <sub>simpler</sub> <sub>approach</sub> <sub>to</sub> obtaining an $O(1 / t)$ convergence rate for the projected stochastic subgradient method, ArXiv e-prints, 2012. (Cited on pp. 219, 458)

[78] <sup>G.</sup> <sup>Lan</sup>, An optimal method for stochastic composite optimization, Math. Program., 133 (2011), pp. 365–397. (Cited on pp. 70, 457)

[79] <sup>E.</sup> <sup>S.</sup> <sup>Levitin</sup> <sup>and</sup> <sup>B.</sup> <sup>T.</sup> <sup>Polyak</sup>, Constrained minimization methods, U.S.S.R. Comput. Math. Math. Phys., 6 (1966), pp. 787–823. (Cited on pp. 459, 460, 461)

[80] <sup>A.</sup> <sup>S.</sup> <sup>Lewis</sup>, The convex analysis of unitarily invariant matrix functions, J. Convex Anal., 2 (1995), pp. 173–183. (Cited on pp. 182, 458)

[81] , Convex analysis on the Hermitian matrices, SIAM J. Optim., 6 (1996), pp. 164–177 https://doi.org/10.1137/0806009. (Cited on pp. 182, 458)

[82] <sup>Q.</sup> <sup>Lin,</sup> <sup>Z.</sup> <sup>Lu,</sup> <sup>and</sup> <sup>L.</sup> <sup>Xiao</sup>, An accelerated randomized proximal coordinate gradient method and its application to regularized empirical risk minimization, SIAM J. Optim., 25 (2015), pp. 2244–2273, https://doi.org/10. 1137/141000270. (Cited on pp. 347, 460)

[83] <sup>P.</sup> <sup>L.</sup> <sup>Lions</sup> <sup>and</sup> <sup>B.</sup> <sup>Mercier</sup>, Splitting algorithms for the sum of two nonlinear operators, SIAM J. Numer. Anal., 16 (1979), pp. 964–979, https:// doi.org/10.1137/0716071. (Cited on p. 458)

[84] <sup>Z.</sup> <sup>Q.</sup> <sup>Luo</sup> <sup>and</sup> <sup>P.</sup> <sup>Tseng</sup>, On the convergence of the coordinate descent method for convex diferentiable minimization, J. Optim. Theory Appl., 72 (1992), pp. 7–35. (Cited on p. 460)

[85] <sup>R.</sup> <sup>Luss</sup> <sup>and</sup> <sup>M.</sup> <sup>Teboulle</sup>, Conditional gradient algorithms for rank-one matrix approximations with a sparsity constraint, SIAM Rev., 55 (2013), pp. 65–98, https://doi.org/10.1137/110839072. (Cited on pp. 386, 461)

[86] <sup>C.</sup> <sup>D.</sup> <sup>Meyer</sup>, Matrix Analysis and Applied Linear Algebra, SIAM, Philadelphia, PA, 2000. (Cited on p. 457)

[87] <sup>J.</sup> <sup>J.</sup> <sup>Moreau</sup>, Proximit´e et dualit´e dans un espace hilbertien, Bull. Soc. Math. France, 93 (1965), pp. 273–299. (Cited on pp. 458, 459)

[88] <sup>I. Necoara and A. Patrascu</sup>, Iteration complexity analysis of dual firstorder methods for conic convex programming, Optim. Methods Softw., 31 (2016), pp. 645–678. (Cited on pp. 277, 459)

[89] <sup>A. Nedic and D. Bertsekas´</sup> , Convergence rate of incremental subgradient algorithms, in Stochastic Optimization: Algorithms and Applications, Springer, Boston, MA, 2001, pp. 223–264. (Cited on pp. 230, 458)

[90] <sup>A.</sup> <sup>Nedic</sup> <sup>and</sup> <sup>A.</sup> <sup>Ozdaglar</sup> <sup>´</sup> , Approximate primal solutions and rate analysis for dual subgradient methods, SIAM J. Optim., 19 (2009), pp. 1757–1780, https://doi.org/10.1137/070708111. (Cited on pp. 233, 238, 458)

[91] <sup>A.</sup> <sup>Nedic</sup> <sup>and</sup> <sup>A.</sup> <sup>Ozdaglar</sup> <sup>´</sup> , Distributed multi-agent optimization, in Convex Optimization in Signal Processing and Communications, D. Palomar and Y. Eldar, eds., Cambridge University Press, Cambridge, 2009, pp. 340–386. (Cited on p. 458)

[92] <sup>A.</sup> <sup>S.</sup> <sup>Nemirovsky</sup> <sup>and</sup> <sup>D.</sup> <sup>B.</sup> <sup>Yudin</sup>, Problem Complexity and Method Efficiency in Optimization, A Wiley-Interscience Publication, New York, 1983. (Cited on p. 458)

[93] <sup>Y.</sup> <sup>Nesterov</sup>, A method for solving the convex programming problem with convergence rate $O(1 / k^{2})$ , Dokl. Akad. Nauk SSSR, 269 (1983), pp. 543–547. (Cited on p. 459)

[94] , Introductory Lectures on Convex Optimization: A Basic Course, vol. 87 of Applied Optimization, Kluwer Academic Publishers, Boston, MA, 2004. (Cited on pp. 457, 458, 459)

[95] , Smooth minimization of non-smooth functions, Math. Program., 103 (2005), pp. 127–152. (Cited on pp. 304, 459)

[96] , Eficiency of coordinate descent methods on huge-scale optimization problems, SIAM J. Optim., 22 (2012), pp. 341–362, https://doi.org/10. 1137/100802001. (Cited on pp. 346, 460)

[97] , How to make the gradients small, Optima, 88 (2012), pp. 10–11. (Cited on p. 459)

[98] , Gradient methods for minimizing composite functions, Math. Program., 140 (2013), pp. 125–161. (Cited on p. 459)

[99] <sup>J. Nocedal and S. J. Wright</sup>, Numerical Optimization, Springer Series in Operations Research and Financial Engineering, Springer, New York, second ed., 2006. (Cited on p. 459)

<sub>[100]</sub> J. Nutini, M. Schmidt, I. H. Laradji, M. Friendlander, and <sup>H.</sup> <sup>Koepke</sup>, Coordinate descent converges faster with the Gauss-Southwell rule than random selection, in Proceedings of the 32nd International Conference on Machine Learning, Lille, France, 2015. (Cited on p. 459)

[101] <sup>J.</sup> <sup>M.</sup> <sup>Ortega</sup> <sup>and</sup> <sup>W.</sup> <sup>C.</sup> <sup>Rheinboldt</sup>, Iterative Solution of Nonlinear Equations in Several Variables, vol. 30 of Classics in Applied Mathematics, SIAM, Philadelphia, PA, 2000. Reprint of the 1970 original, https://doi. org/10.1137/1.9780898719468. (Cited on p. 112)

[102] <sup>N.</sup> <sup>Parikh</sup> <sup>and</sup> <sup>S.</sup> <sup>Boyd</sup>, Proximal algorithms, Found. Trends Optim., 1 (2014), pp. 123–231. (Cited on pp. 182, 458)

[103] <sup>G.</sup> <sup>B.</sup> <sup>Passty</sup>, Ergodic convergence to a zero of the sum of monotone operators in Hilbert space, J. Math. Anal. Appl., 72 (1979), pp. 383–390. (Cited on p. 458)

[104] <sup>B.</sup> <sup>T.</sup> <sup>Polyak</sup>, Introduction to Optimization, Translations Series in Mathematics and Engineering, Optimization Software Inc., New York, 1987. (Cited on pp. 204, 458, 459, 461)

[105] <sup>M.</sup> <sup>J.</sup> <sup>D.</sup> <sup>Powell</sup>, A method for nonlinear constraints in minimization problems, in Optimization (Sympos., Univ. Keele, Keele, 1968), Academic Press, London, 1969, pp. 283–298. (Cited on p. 461)

[106] , On search directions for minimization algorithms, Math. Program., 4 (1973), pp. 193–201. (Cited on pp. 408, 461)

[107] <sup>P.</sup> <sup>Richtarik</sup> <sup>and</sup> <sup>M.</sup> <sup>Tak´</sup> <sup>a´cˇ</sup>, Iteration complexity of randomized blockcoordinate descent methods for minimizing a composite function, Math. Program., 144 (2014), pp. 1–38. (Cited on p. 460)

[108] <sup>R.</sup> <sup>T.</sup> <sup>Rockafellar</sup>, Convex Analysis, vol. 28 of Princeton Mathematical Series, Princeton University Press, Princeton, NJ, 1970. (Cited on pp. 30, 43, 44, 45, 56, 102, 119, 181, 457, 458)

[109] , A dual approach to solving nonlinear programming problems by unconstrained optimization, Math. Program., 5 (1973), pp. 354–373. (Cited on p. 461)

[110] , Monotone operators and the proximal point algorithm, SIAM J. Control Optim., 14 (1976), pp. 877–898, https://doi.org/10.1137/0314056. (Cited on p. 459)

[111] <sup>R.</sup> <sup>T.</sup> <sup>Rockafellar</sup> <sup>and</sup> <sup>R.</sup> <sup>J.</sup> <sup>B.</sup> <sup>Wets</sup>, Variational Analysis, vol. 317 of Grundlehren der Mathematischen Wissenschaften [Fundamental Principles of Mathematical Sciences], Springer-Verlag, Berlin, 1998. (Cited on p. 457)

[112] <sup>W.</sup> <sup>Rudin</sup>, Principles of Mathematical Analysis, International Series in Pure and Applied Mathematics, McGraw-Hill, New York, Auckland, D¨usseldorf, third ed., 1976. (Cited on pp. 59, 113)

[113] <sup>A.</sup> <sup>Ruszczynski</sup> <sup>´</sup> , Nonlinear Optimization, Princeton University Press, Princeton, NJ, 2006. (Cited on p. 458)

[114] <sup>R.</sup> <sup>Shefi</sup> <sup>and</sup> <sup>M.</sup> <sup>Teboulle</sup>, Rate of convergence analysis of decomposition methods based on the proximal method of multipliers for convex minimization, SIAM J. Optim., 24 (2014), pp. 269–297, https://doi.org/10.1137/ 130910774. (Cited on p. 462)

[115] , On the rate of convergence of the proximal alternating linearized minimization algorithm for convex problems, EURO J. Comput. Optim., 4 (2016), pp. 27–46. (Cited on pp. 342, 460)

[116] <sup>N.</sup> <sup>Z.</sup> <sup>Shor</sup>, Minimization Methods for Nondiferentiable Functions, vol. 3 of Springer Series in Computational Mathematics, Springer-Verlag, Berlin, 1985. Translated from the Russian by K. C. Kiwiel and A. Ruszczy´nski. (Cited on p. 458)

[117] <sup>G.</sup> <sup>Strang</sup>, Introduction to Linear Algebra, Wellesley-Cambridge Press, fourth ed., 2009. (Cited on p. 457)

[118] <sup>R.</sup> <sup>Sturm</sup>, Ueber den Punkt kleinster Entfernungssumme von gegebenen Punkten, J. Reine Angew. Math., 97 (1884), pp. 49–61. (Cited on p. 457)

[119] <sup>C.</sup> <sup>M.</sup> <sup>Theobald</sup>, An inequality for the trace of the product of two symmetric matrices, Math. Proc. Cambridge Philos. Soc., 77 (1975), pp. 265–267. (Cited on pp. 183, 458)

[120] <sup>P.</sup> <sup>Tseng</sup>, Applications of a splitting algorithm to decomposition in convex programming and variational inequalities, SIAM J. Control Optim., 29 (1991), pp. 119–138, https://doi.org/10.1137/0329006. (Cited on p. 460)

[121] , Approximation accuracy, gradient methods, and error bound for structured convex optimization, Math. Program., 125 (2010), pp. 263–295. (Cited on pp. 326, 459)

[122] <sup>L.</sup> <sup>Vandenberghe</sup>. Optimization Methods for Large-Scale Systems, EE236C lecture notes, UCLA, 2016. (Cited on pp. 196, 458)

[123] <sup>J.</sup> <sup>Von</sup> <sup>Neumann</sup>, Some matrix inequalities and metrization of matric space, Tomsk. Univ. Rev., 1 (1937), pp. 286–300. (Cited on pp. 190, 458)

[124] <sup>E.</sup> <sup>V.</sup> <sup>Weiszfeld</sup>, Sur le point pour lequel la somme des distances de n points donn´es est minimum, Tˆohoku Math. J., 43 (1937), pp. 355–386. (Cited on p. 457)

[125] <sup>P.</sup> <sup>Wolfe</sup>, Note on a method of conjugate subgradients for minimizing nondiferentiable functions, Math. Program., 7 (1974), pp. 380–383. (Cited on p. 458)

[126] <sup>S.</sup> <sup>J.</sup> <sup>Wright</sup>, Coordinate descent algorithms, Math. Program., 151 (2015), pp. 3–34. (Cited on p. 460)

<sub>[127]</sub> S. J. Wright, R. D. Nowak, and M. A. T. Figueiredo<sub>, Sparse recon-</sub> struction by separable approximation, IEEE Trans. Signal Process., 57 (2009), pp. 2479–2493. (Cited on p. 459)

[128] <sup>C. Zalinescu</sup>, On uniformly convex functions, J. Math. Anal. Appl., 95 (1983), pp. 344 – 374. (Cited on p. 457)

[129] <sup>C.</sup> <sup>Zalinescu</sup>, Convex Analysis in General Vector Spaces, World Scientific, River Edge, NJ, 2002. (Cited on p. 457)

## Index

-optimal and feasible solution, 241 -optimal solution, 206

absolutely permutation symmetric function, 181 absolutely symmetric function, 179 accelerated dual block proximal gradient method, 373 AD-LPMM, see alternating direction linearized prox method of multipliers AD-PMM, see alternating direction proximal method of multipliers ADBPG, see accelerated dual block proximal gradient adjoint transformation, 11 ADMM, see alternating direction method of multipliers Affine hull, 3 Affine set, 3 alternating direction linearized prox method of multipliers, 426 alternating direction method of multipliers, 425 alternating direction proximal method of multipliers, 425 alternating minimization, 405 alternating projection method, 211 augmented Lagrangian, 425 augmented Lagrangian method, 423

ball-pen function, 99, 125 basis, 2 biconjugate function, 89 bidual space, 10 block descent lemma, 336 block Lipschitz constant, 333 block proximal gradient method, 338 block sufficient decrease lemma, 337 box, 5

Bregman distance, 248

Cartesian product, 7 CBPG, see cyclic block proximal gradient method chain rule, 59 closed ball, 2 closed function, 14 closed line segment, 3 coercive, 20 compact set, 20, 42 complexity, 206 composite model, 78 conditional gradient method, 379 conditional gradient norm, 381 cone, 27 conjugate correspondence theorem, 123 conjugate function, 87 conjugate subgradient theorem, 104 convex feasibility problem, 208 convex function, 21 convex set, 3 coordinate descent, 323 coordinate-wise minimum, 407 cyclic block proximal gradient method, 338 cyclic shufle, 346

DBPG, see dual block proximal gradient decomposition method, 331 denoising, 364 descent direction, 195 descent lemma, 109 diferentiable function, 48 dimension, 2 directional derivative, 44 distance function, 22 distributed optimization, 245 domain, 14

dot product, 4, 6 DPG, 355 dual block proximal gradient, 370 method, 369 dual norm, 9 dual projected subgradient method, 232 dual proximal gradient, 355 dual space, 9

efective domain, 14 eigenvalues, 182 epigraph, 14 ergodic convergence, 215 Euclidean norm, 3 Euclidean space, 3 even function, 179 exact line search, 196 extended Moreau decomposition, 160 extended real-valued functions, 13

Farkas lemma, 28 fast dual proximal gradient, 358 fast proximal gradient method, 290 FDPG, see fast dual proximal gradient Fej´er monotonicity, 205 Fenchel’s dual, 102 Fenchel’s duality theorem, 102 Fenchel’s inequality, 88 Fermat’s optimality condition, 73 Fermat–Weber problem, 75 finite-dimensional vector space, 2 first projection theorem, 147 first prox theorem, 130 FISTA, 290 Fr´echet Differentiability, 48 Frank Wolfe method, 379 Fritz-John conditions, 81 Frobenius norm, 6, 189 functional decomposition method, 331

generalized Cauchy–Schwarz, 9 generalized conditional gradient method, 380 generalized diagonal matrix, 188 generalized permutation matrix, 180 geometric median, 75 global Lipschitz constant, 333 gradient, 48 gradient mapping, 272 gradient method, 195 greedy projection algorithm, 210

Hadamard product, 5 half-space, 3 hard thresholding, 137 hinge loss, 94 Huber function, 163, 167, 169, 309 hyperplane, 3

identity transformation, 8 incremental projected subgradient, 229 indicator function, 14 induced matrix norm, 7 infimal convolution, 24, 102 inner product, 2 inner product space, 3 ISTA, 271 iterative shrinkage-thresholding algorithm, 271

Jensen’s inequality, 21

KKT conditions, 81 Kullback–Leibler divergence, 252 Ky Fan norms, 190 -norm, 19 <sub>p</sub>-norm, 5 -norm, 5 -regularized least squares, 295, 434 <sup>l</sup> -smooth function, 107 <sup>L</sup>Lagrangian dual, 38 level set, 15, 149 line segment principle, 119 linear approximation theorem, 112 linear functional, 9 linear programming, 212 linear rate, 288 linear transformation, 8 linearly independent, 2 log-sum-exp function, 98 Lorentz cone, 154 lower semicontinuous function, 15

max formula, 47 median, 73 Minkowski sum, 26 mirror descent, 247 mirror-C method, 262 Moore–Penrose pseudoinverse, 96 Moreau decomposition, 160 Moreau envelope, 163

negative entropy, 96, 124 negative sum of logs, 136, 152 network utility maximization, 243 non-Euclidean gradient method, 317 non-Euclidean proximal gradient, 327 non-Euclidean second prox theorem, 253 nonnegative orthant, 5 nonnegative part, 5 norm, 2 norm-dependent function, 180 normal cone, 36 nuclear norm, 189 open ball, 2 open line segment, 3 orthogonal matrix, 6 orthogonal projection, 49, 146 partial conditional gradient norm, 402 partial gradient mapping, 333 partial prox grad mapping, 333 permutation matrix, 180 permutation symmetric function, 180 polar cone, 27 Polyak’s stepsize, 204 positive orthant, 5 power method, 386 primal counterpart, 316 projected subgradient method, 201 projected subgradient method, 202 proper function, 14 prox-grad operator, 271 proximable, 432 proximal gradient method, 269, 271 proximal mapping, 129 proximal point method, 288 proximal subgradient method, 262 Q-inner product, 4 Q-norm, 4 randomized block conditional gradient method, 402 randomized block proximal gradient method, 348 RBCG, see randomized block conditional gradient method RBPG, see randomized block proximal gradient method real vector space, 1 relative interior, 43 restarted FISTA, 299 restarting, 299 robust regression, 436 S-FISTA, 310 -sparse vector, 174 scalar, 1

scalar multiplication, 1 Schatten norm, 189 second projection theorem, 157 second prox theorem, 157 singleton, 51 singular value decomposition, 188 Slater’s condition, 82 smoothness parameter, 107 soft thresholding, 136, 142 span, 2 spectahdron, 183 spectral conjugate formula, 184, 190 spectral decomposition, 182 spectral function, 182, 189 spectral norm, 7, 189 standard basis, 4 stationarity, 80 steepest descent, 195 stochastic projected subgradient method, 221 strict separation theorem, 31 strong convexity, 117 strong duality theorem, 439 strong subdiferential result, 39 strongly convex set, 396 subdiferentiable, 39 subdiferential, 35 subgradient, 35 subgradient inequality, 35 sublinear rate, 284 sufficient decrease lemma, 272 support function, 26, 161 supporting hyperplane theorem, 41 symmetric conjugate theorem, 181 symmetric function, 179 symmetric spectral function, 183, 189 symmetric spectral set, 187, 194 three-points lemma, 252 total variation, 364 trace norm, 189 triangle inequality, 2 two-sided soft thresholding, 151 unbiased estimator, 222 unit simplex, 5 value function, 67 variables decomposition method, 332 vector space, 1 von Neumann’s trace inequality, 190 weak subdiferential result, 39 Wolfe’s example, 197

The primary goal of this book is to provide a self-contained, comprehensive study of the main first-order methods that are frequently used in solving large-scale problems. First-order methods exploit information on values and gradients/subgradients (but not Hessians) of the functions composing the model under consideration. With the increase in the number of applications that can be modeled as large or even huge-scale optimization problems, there has been a revived interest in using simple methods that require low iteration cost as well as low memory storage.

The author has gathered, reorganized, and synthesized (in a unifi ed manner) many results that are currently scattered throughout the literature, many of which cannot be typically found in optimization books.

First-Order Methods in Optimization

- offers comprehensive study of fi rst-order methods with the theoretical foundations;

- provides plentiful examples and illustrations;

- emphasizes rates of convergence and complexity analysis of the main fi rst-order methods used to solve large-scale problems; and

- covers both variables and functional decomposition methods.

This book is intended primarily for researchers and graduate students in mathematics, computer science, and electrical and other engineering departments. Readers with a background in advanced calculus and linear algebra, as well as prior knowledge in the fundamentals of optimization (some convex analysis, optimality conditions, and duality), will be best prepared for the material.

Amir Beck is a Professor at the School of Mathematical Sciences, Tel-Aviv University. His

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/first-order-methods-optimization/parts/p401-476/images/5516c506f772e59a9a27c464d7872164d1843c3ba1a11d52ec2e64e87365e036.jpg)

research interests are in continuous optimization, including theory, algorithmic analysis, and its applications. He has published numerous papers and has given invited lectures at international conferences. He serves on the editorial board of several journals. His research has been supported by various funding agencies, including the Israel Science Foundation, the German-Israeli Foundation, the United States–Israel Binational Science Foundation, the Israeli Science and Energy ministries, and the European Community.

For more information about MOS and SIAM books, journals, conferences, memberships, or activities, contact:

siaum

Society for Industrial

and Applied Mathematics

3600 Market Street, 6th Floor

Philadelphia, PA 19104-2688 USA

+1-215-382-9800 • Fax +1-215-386-7999

siam@siam.org • www.siam.org

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/first-order-methods-optimization/parts/p401-476/images/26c8e343899d08f079d277095f0821d8a6751cbd15b472706bf81fa538e1fb1f.jpg)

Mathematical Optimization Society

Mathematical Optimization Society 3600 Market Street, 6th Floor Philadelphia, PA 19104-2688 USA

+1-215-382-9800 x319

Fax +1-215-386-7999

service@mathopt.org • www.mathopt.org


# 2017 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2017-final-interview-individual-applmath-individual.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2017-final-interview-individual-applmath-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2017-final-interview-individual-applmath-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。


## 题 1

^yau-2017-final-interview-individual-applmath-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2017-final-interview-individual-applmath-individual-solutions.md#^yau-2017-final-interview-individual-applmath-individual-s1)。

Consider the following Burgers’ equation:

$$
\left\{\begin{array}{l} u_{t} + uu_{x} = \nu u_{xx}, \quad x \in R, \quad t > 0 \\ u(x, 0) = u_{0}(x), \quad x \in R, \end{array} \right.\tag{1}
$$

which can be used to model the motion of a viscous compressible gas, where $u(x, t)$ is the speed of the gas, $\nu > 0$ is the kinematic viscosity, x is the spatial coordinate, and t is the time. As it is shown below, we can apply the Hopf-Cole transformation to solve the strongly nonlinear Burgers equation (1).

(a) Let $U_{x} = u$ and introduce the Hopf-Cole transformation $U(x, t) = - 2 \nu \log(\phi(x, t))$ . Derive the equation for $\phi(x, t)$

(b) Solve the equation for $\phi(x, t)$ , and then obtain the solution to the Burgers equation (1).

(c) When $\nu = 0$ the Burgers’ equation (1) becomes the inviscid Burgers’ equation. Show that if we solve the inviscid Burgers’ equation with smooth initial data $u_{0}(x)$ , for which $u_{0}^{\prime}(x)$ is negative and bounded from below, then the solution will break at time $\begin{array}{r}{T_{b} = \frac{- 1}{\operatorname{min} u_{0}^{\prime}(x)}} \end{array}$ . The term “break” here means the solution $u(x, t)$ has an infinite slope and a shock form.

2. (a) Consider the following Rudin-Osher-Fatemi model for image regularization

$$
\min_{u} \int_{\Omega} \| \nabla u \| + \lambda(F - u)^{2}\tag{2}
$$

for some given function F in a boundary rectangular domain $\Omega,$ where $\| \cdot \|$ is the usual 2-norm. Show that the Euler-Lagrange equation corresponding to the variational problem (2) is given by

$$
u - \frac{1}{2 \lambda} \nabla \cdot \left(\frac{\nabla u}{\| \nabla u \|}\right) = F.
$$

(b) Consider the following variational problem for the cartoon-texture decomposition in image processing

$$
\min_{u, g, h} \int_{\Omega} \| \nabla u \| + \lambda \left(f - \frac{\partial g}{\partial x} - \frac{\partial h}{\partial y} - u\right)^{2} + \mu \sqrt{g^{2} + h^{2}},\tag{3}
$$

where $f$ is the given image, λ and $\mu$ are two positive constants, and $f, u, g, h : \Omega \mathbb{R}$ . With appropriate boundary conditions, derive the system of Euler-Lagrangian equations for (3) that the minimizers $u, g$ and h should satisfy.

(c) Let $\begin{array}{r}{\kappa(\boldsymbol{u}) = \nabla \cdot \left(\frac{\nabla \boldsymbol{u}}{\| \nabla \boldsymbol{u} \|} \right)} \end{array}$ be the curvature operator. If u solves the variational problem (3), show that $\lVert \nabla \kappa(\dot{u}) \rVert = \ ' \mu$

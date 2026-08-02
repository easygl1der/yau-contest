1. Consider the following Burgers’ equation:

$$
\left\{ \begin{array}{l} u _ {t} + u u _ {x} = \nu u _ {x x}, \quad x \in R, \quad t > 0 \\ u (x, 0) = u _ {0} (x), \quad x \in R, \end{array} \right.\tag{1}
$$

which can be used to model the motion of a viscous compressible gas, where $u ( x , t )$ is the speed of the gas, $\nu > 0$ is the kinematic viscosity, x is the spatial coordinate, and t is the time. As it is shown below, we can apply the Hopf-Cole transformation to solve the strongly nonlinear Burgers equation (1).

(a) Let $U _ { x } = u$ and introduce the Hopf-Cole transformation $U ( x , t ) = - 2 \nu \log ( \phi ( x , t ) )$ . Derive the equation for $\phi ( x , t )$

(b) Solve the equation for $\phi ( x , t )$ , and then obtain the solution to the Burgers equation (1).

(c) When $\nu = 0$ the Burgers’ equation (1) becomes the inviscid Burgers’ equation. Show that if we solve the inviscid Burgers’ equation with smooth initial data $u _ { 0 } ( x )$ , for which $u _ { 0 } ^ { \prime } ( x )$ is negative and bounded from below, then the solution will break at time $\begin{array} { r } { T _ { b } = \frac { - 1 } { \operatorname* { m i n } u _ { 0 } ^ { \prime } ( x ) } } \end{array}$ . The term “break” here means the solution $u ( x , t )$ has an infinite slope and a shock form.

2. (a) Consider the following Rudin-Osher-Fatemi model for image regularization

$$
\min _ {u} \int_ {\Omega} \| \nabla u \| + \lambda (F - u) ^ {2}\tag{2}
$$

for some given function F in a boundary rectangular domain $\Omega ,$ where $\| \cdot \|$ is the usual 2-norm. Show that the Euler-Lagrange equation corresponding to the variational problem (2) is given by

$$
u - \frac {1}{2 \lambda} \nabla \cdot \left(\frac {\nabla u}{\| \nabla u \|}\right) = F.
$$

(b) Consider the following variational problem for the cartoon-texture decomposition in image processing

$$
\min _ {u, g, h} \int_ {\Omega} \| \nabla u \| + \lambda \left(f - \frac {\partial g}{\partial x} - \frac {\partial h}{\partial y} - u\right) ^ {2} + \mu \sqrt {g ^ {2} + h ^ {2}},\tag{3}
$$

where $f$ is the given image, λ and $\mu$ are two positive constants, and $f , u , g , h : \Omega  \mathbb { R }$ . With appropriate boundary conditions, derive the system of Euler-Lagrangian equations for (3) that the minimizers $u , g$ and h should satisfy.

(c) Let $\begin{array} { r } { \kappa ( \boldsymbol { u } ) = \nabla \cdot \left( \frac { \nabla \boldsymbol { u } } { \| \nabla \boldsymbol { u } \| } \right) } \end{array}$ be the curvature operator. If u solves the variational problem (3), show that $\lVert \nabla \kappa ( \dot { u } ) \rVert = \ ' \mu$
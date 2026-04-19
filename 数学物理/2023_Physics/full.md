# S.-T. Yau College Student Mathematics Contests 2023

# Mathematical Physics

Solve every problem.

1. Consider the Lagrangian

$$
L (x, y, \dot {x}, \dot {y}) = \frac {1}{2} \frac {\dot {x} ^ {2} + \dot {y} ^ {2} + 2 (x \dot {y} - y \dot {x})}{x ^ {2} + y ^ {2}} \tag {1}
$$

(a) Compute the Hamiltonian $H ( x , y , p _ { z } , p _ { y } )$ , and show the final form can be written as

$$
\frac {1}{2} f (x, y) \left[ \left(p _ {x} - A _ {x} (x, y)\right) ^ {2} + \left(p _ {y} - A _ {y} (x, y)\right) ^ {2} \right] \tag {2}
$$

for some $f , A _ { x } , A _ { y }$ . Find the vector potential $\vec { A }$ and then compute the corresponding magnetic field away from the origin. (Hint: recall that $\vec { B } = \mathrm { c u r l } \vec { A } = \nabla \times \vec { A }$ ).

(b) Prove that the Lagrangian $L ( x , y , \dot { x } , \dot { y } )$ is invariant under two symmetries: rotations and scale transformations.   
(c) Derive the conserved quantities for both symmetries.   
(d) Rewrite the Lagrangian in polar coordinates, write down the Euler-Lagrange equations and solve them.

2. A particle of mass $m$ in 2 dimensions is confined by an isotropic harmonic oscillator potential of frequency $\omega$ , while subject to a weak and anisotropic perturbation of strength $\alpha \ll 1$ . The total Hamiltonian of the particle is

$$
H = H _ {0} + V = \frac {p _ {x} ^ {2}}{2 m} + \frac {p _ {y} ^ {2}}{2 m} + \frac {1}{2} m \omega^ {2} \left(x ^ {2} + y ^ {2}\right) + \alpha m \omega^ {2} x y \tag {3}
$$

(a) When $\alpha = 0$ , what are the energies and degeneracies of the three lowest-lying unperturbed states?   
(b) Use perturbation theory to correct the energies of the above three states to the first order in $\alpha$ .   
(c) Find the exact spectrum of $H$ . (Hint: you may want to rotate $x$ and $y$ into a new coordinates)   
(d) Check that the perturbative results in part b. are recovered from the exact spectrum.

3. One can express the electric fields $\vec { E }$ and magnetic fields $\vec { B }$ in terms of the scalar and vector potentials, $A ^ { \mu } = \left( \phi , { \vec { A } } \right)$ .

(a) Write down the expression of $\vec { E }$ and $\vec { B }$ in terms of $( \phi , { \vec { A } } )$ and show that the result is unchanged under gauge transformation

$$
\phi \rightarrow \phi + \frac {\partial}{\partial t} f, \quad \vec {A} \rightarrow \vec {A} - \nabla f, \tag {4}
$$

where $f = f ( \vec { x } , t )$ is a scalar function.

(b) Show that two of the 4 Maxwell equations of $\vec { E }$ and $\vec { B }$ are satisfied automatically in terms of $A ^ { \mu } = \left( \phi , { \vec { A } } \right)$ .   
(c) Derive the equations for the scalar and vector potentials from the remaining Maxwell equations in Lorentz gauge.

$$
\frac {1}{c} \partial_ {t} \phi + \nabla \cdot \vec {A} = 0, \tag {5}
$$

(d) Recall that the Green’s function of the wave equation

$$
\left(\frac {1}{c ^ {2}} \partial_ {t} ^ {2} - \nabla^ {2}\right) G (t, \vec {r}) = \delta (t) \delta^ {3} (\vec {r}) \tag {6}
$$

is

$$
G (t - t _ {0}, \vec {r} - \vec {r} _ {0}) = \frac {\theta (t - t _ {0})}{4 \pi | \vec {r} - \vec {r} _ {0} |} \delta \left(t - t _ {0} - \frac {| \vec {r} - \vec {r} _ {0} |}{c}\right). \tag {7}
$$

Assume a particle of electric charge $e$ moves with trajectory $\vec { R } ( t )$ with ${ \vec { v } } ( t ) =$ $d \vec { R } ( t ) / d t$ . Use the Green’s function to derive the potential $\phi ( \vec { r } , t )$ and $\vec { A } ( \vec { r } , t )$ of this particle at $( \vec { r } , t )$ . You may assume that $| \vec { R } ( t ) | \ll | \vec { r } |$ , $| \vec { R } ( t ) | \ll c t$ and $| \vec { v } ( t ) | \ll c$ and expand your result up to the order $\mathcal { O } ( 1 / | \vec { r } | )$ and $\mathcal { O } ( | \vec { v } ( t ) | / c )$ . This is also called non-relativistic and far-field approximations.

4. Consider a one-dimensional system of free massless bosons with one polarization, and the dispersion relation $E _ { k } = \hbar v | k |$ , where $\boldsymbol { v }$ is the particle velocity, $k$ wavevector, $E _ { k }$ energy. The particles are not interacting either among themselves or with external scattering potentials. If the system is in equilibrium at temperature $T$ ,

(a) Assume that the chemical potential $\mu$ is $0$ , calculate the heat capacity $C$ per unit length.   
(b) Repeat the calculations for massive fermions, for which $E _ { k } = \hbar ^ { 2 } k ^ { 2 } / 2 m$ and the chemical potential $\mu$ is far above the bottom of the energy spectrum: $\mu \gg k _ { B } T$ . (Consider one spin direction for the fermions, and you may make reasonable approximations.)

Hint: you might find the following formulae useful to evaluate some integrals needed

$$
\sum_ {k = 1} ^ {\infty} \frac {1}{k ^ {2}} = \frac {\pi^ {2}}{6}, \quad \sum_ {k = 1} ^ {\infty} \frac {(- 1) ^ {k + 1}}{k ^ {2}} = \frac {\pi^ {2}}{1 2}. \tag {8}
$$

5. Consider the vacuum Einstein’s equation in four dimensional spacetime with a cosmological constant

$$
R _ {\mu \nu} - \frac {1}{2} g _ {\mu \nu} R + g _ {\mu \nu} \Lambda = 0. \tag {9}
$$

(a) Proof that $R _ { \mu \nu } = k g _ { \mu \nu }$ and find out the value of $k$ .   
(b) Now start with an ansatz of a metric in the following form

$$
d s ^ {2} = - f (r) d t ^ {2} + \frac {1}{f (r)} d r ^ {2} + r ^ {2} \left(d \theta^ {2} + \sin^ {2} \theta d \phi^ {2}\right), \tag {10}
$$

where $f ( r )$ is a polynomial in $r$ . Compute non zero components of the Ricci tensor $R _ { \mu \nu }$ and scalar curvature $R$ of this metric.

(c) Assuming that the above ansatz is a solution of the vacuum Einstein equation with cosmological constant $\Lambda$ , solve $f ( r )$ .   
(d) Prove that $\partial _ { t }$ and $\partial _ { \phi }$ are Killing vector fields.

6. Consider the $\phi ^ { 3 }$ model with a real scalar field $\phi ( x )$ in $3 + 1$ dimensional Minkowski spacetime with metric $( - , + , + , + )$ . Its Lagrangian density is

$$
\mathcal {L} = - \frac {1}{2} \partial_ {\mu} \phi \partial^ {\mu} \phi - \frac {1}{2} m ^ {2} \phi^ {2} - \frac {1}{6} g \phi^ {3}, \tag {11}
$$

where $g$ is a coupling with dimensions of mass.

(a) Write down the propagator and the interaction vertex for this model in momentum space.   
(b) Compute the one-loop self-energy graph using dimensional regularization.   
(c) Introducing $m ^ { 2 } = m _ { R } ^ { 2 } + \delta m ^ { 2 }$ . What is the value of $\delta m ^ { 2 }$ if we want to write the one-loop self-energy graph as a finite function of $m _ { R }$ ?

You may find the following formula useful

$$
(A B) ^ {- 1} = \int_ {0} ^ {1} d x [ x A + (1 - x) B ] ^ {- 2}, \tag {12}
$$

$$
\int d ^ {d} k \frac {1}{(- k ^ {2} - 2 p \cdot k - M ^ {2} + i \epsilon) ^ {s}} = (- 1) ^ {s} i \pi^ {d / 2} \frac {\Gamma (s - d / 2)}{\Gamma (s)} (- p ^ {2} + M ^ {2} - i \epsilon) ^ {d / 2 - s}, \tag {13}
$$

where $\Gamma ( z )$ is the Gamma function which has a simple pole at the origin.

$$
\Gamma (z) = \frac {1}{z} - \gamma + \mathcal {O} (z), \tag {14}
$$

where $\gamma$ is the Euler constant.
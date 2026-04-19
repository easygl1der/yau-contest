# S.-T. Yau College Student Mathematics Contests

# 2022

# Mathematical Physics

说明：Solve every problem

# 1 Problems

1. (a) A symmetry transformation in quantum mechanics is represented by a unitary or anti-unitary operator acting on a Hilbert space. The time reversal transformation $\Theta$ relates the wave function at time $t$ to time $- t$ . Prove: $\Theta$ is an anti-unitary operator.

(b) Consider state vector $| \psi \rangle$ for a quantum system. A time reversal transformation is represented by an anti-unitary operator $\Theta$ . We now consider position space wavefunction $\psi ( x ) = \langle x | \psi \rangle$ , and $\Theta | x \rangle = | x \rangle$ . Prove: the position space wave function for $\Theta | \psi \rangle$ is

$$
\psi (x) ^ {*}
$$

(c) A one dimensional quantum system is invariant under time reversal transformation, and so its Hamiltonian satisfies $\Theta H = H \Theta$ . If an energy eigenstate $| \psi \rangle$ has no degeneracy, Prove: it is possible to take the position space energy eigenfunction to be real:

$$
\psi (x) ^ {*} = \psi (x)
$$

2. Consider following quantum Hamiltonian:

$$
H _ {0} = \frac {p _ {1} ^ {2}}{2 m} + \frac {1}{2} m \omega^ {2} x _ {1} ^ {2} + \frac {p _ {2} ^ {2}}{2 m} + \frac {1}{2} m \omega^ {2} x _ {2} ^ {2}
$$

This is the Hamiltonian for two decoupled harmonic oscillators.

(a) Calculate the eigenstates and eigenvalues for $H _ { 0 }$ (an energy eigenstate could be labeled as $| n _ { 1 } , n _ { 2 } \rangle$ ).   
(b) Assume the creation and annihilation operators for two harmonic oscillators are $a _ { i } ^ { \dagger } , a _ { i } , i = 1 , 2$ . Define following operators

$$
J _ {+} = a _ {1} ^ {\dagger} a _ {2}, \quad J _ {-} = a _ {2} ^ {\dagger} a _ {1}, \quad J _ {z} = \frac {1}{2} (a _ {1} ^ {\dagger} a _ {1} - a _ {2} ^ {\dagger} a _ {2})
$$

i. Prove that: $[ J _ { z } , J _ { \pm } ] = \pm J _ { \pm } , \quad [ J _ { + } , J _ { - } ] = 2 J _ { z } .$   
ii. Consider one eigenvalue $E _ { n }$ of $H _ { 0 }$ , (here $n _ { 1 } + n _ { 2 } = n$ ). Prove that: all eigenstates of $E _ { n }$ form an irreducible representation of $s u ( 2 )$ Lie algebra, and compute the spin.

(c) Consider following perturbed Hamiltonian ( $\lambda$ is small)

$$
H = H _ {0} + \lambda x _ {1} ^ {2} p _ {2} ^ {2}
$$

Compute the first order correction to the energy for the energy level $n _ { 1 } + n _ { 2 } = 2$ .

3. A Killing vector field $k ^ { \mu } \frac { \partial } { \partial x ^ { \mu } }$ satisfies the equation $k ^ { \lambda } \partial _ { \lambda } g _ { \mu \nu } + \partial _ { \mu } k ^ { \lambda } g _ { \lambda \nu } +$ $\partial _ { \nu } k ^ { \lambda } g _ { \lambda \mu } = 0$ .

(a) Prove: $D _ { \mu } k _ { \nu } + D _ { \nu } k _ { \mu } = 0$ , here $D _ { \mu }$ is the covariant derivative.   
(b) For a moving particle in gravitational background with a Killing vector field, Prove: $k ^ { \mu } P _ { \mu }$ is a conserved quantity, Here $\begin{array} { r } { P _ { \mu } = m \frac { d x ^ { \nu } } { d \tau } g _ { \mu \nu } } \end{array}$ dxν is the momentum for the free falling particle with trajectory $x ^ { \nu } ( \tau )$ .

4. Consider following metric

$$
d s ^ {2} = - (1 - \frac {2 M}{r}) d v ^ {2} + d r d v + r ^ {2} d \Omega^ {2}
$$

Here $d \Omega ^ { 2 }$ is the standard metric on two sphere. Consider the hypersurface defined by $S = r - 2 M = 0$ , and a vector field $\begin{array} { r } { l = \tilde { f } ( x ) ( g ^ { \mu \nu } \partial _ { \nu } S ) \frac { \partial } { \partial x ^ { \mu } } } \end{array}$ , here ${ \ddot { f } } ( x )$ is a non-zero function. Prove:

(a) $\it { \Delta } l$ is normal to the surface $S$ .   
(b) $l ^ { 2 } = 0$ on the surface $S$   
(c) $\frac { \partial } { \partial v }$ is a Killing vector field.

5. The energy momentum tensor for a relativistic quantum field theory is denoted as $\theta ^ { \mu \nu }$ , which is symmetric and conserved.

(a) Define new current $s ^ { \mu } = x _ { \nu } \theta ^ { \mu \nu }$ and $K ^ { \lambda \mu } = x ^ { 2 } \theta ^ { \lambda \mu } - 2 x ^ { \lambda } x _ { \rho } \theta ^ { \rho \mu }$ . Compute $\partial ^ { \mu } s _ { \mu }$ and $\partial _ { \mu } K ^ { \lambda \mu }$ , and explain the condition on $\theta ^ { \mu \nu }$ so that these new currents are conserved.   
(b) Consider a scalar field $\sigma ( x )$ which transforms under a scale transformation as

$$
\delta \sigma = x ^ {\lambda} \partial_ {\lambda} \sigma + f ^ {- 1}
$$

we have following Lagrangian

$$
{\cal L} = {\cal L} _ {s} - \frac {\mu_ {0} ^ {2}}{2} \phi^ {2} e ^ {2 f \sigma} + \frac {1}{2 f ^ {2}} \partial_ {\mu} e ^ {f \sigma} \partial^ {\mu} e ^ {f \sigma}
$$

The infinitesimal scale transformation on scalar field $\phi$ is $\delta \phi = ( 1 +$ $x _ { \lambda } \partial ^ { \lambda } ) _ { \phi }$ . Here $L _ { s }$ is scale invariant part of the Lagrangian. Prove that: the above Lagrangian is scale invariant.

(c) Explain why a classically scale invariant Lagrangian for a quantum field theory may fail to be scale invariant quantum mechanically.

6. Consider following Lagrangian for $N$ scalar fields $\phi ^ { a } , a = 1 , \ldots , N$ :

$$
L = \frac {1}{2} \partial_ {\mu} \phi^ {a} \partial^ {\mu} \phi^ {a} - \frac {1}{2} \mu_ {0} ^ {2} \phi^ {a} \phi^ {a} - \frac {1}{8} \lambda_ {0} (\phi^ {a} \phi^ {a}) ^ {2}
$$

Here the repeated index implies the summation over the index.

(a) Write down the propagator and interaction vertex for this model, and write down four point Feynman diagrams up to one loop level.   
(b) Define $g _ { 0 } = \lambda _ { 0 } N$ , and compute the order in $g _ { 0 }$ and $N$ for all the diagrams listed in last question. If we fix the coupling $g _ { 0 }$ , and let $N$ go to infinity, list the leading order Feynman diagrams in $\textstyle { \frac { 1 } { N } }$ .
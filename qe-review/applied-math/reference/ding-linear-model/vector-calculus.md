# Ding Appendix A — vector calculus (working excerpt)

Source: Peng Ding, *Linear Model and Extensions*, arXiv:2401.00649.
TeX span: `chapters/chapterA1_linear.tex`, section **Vector calculus** (Proposition on linear / quadratic forms, then chain rule and Hessian).
OLS span: `chapters/chapter03_ordinary.tex`, first-order condition / normal equation; homework “OLS via vector and matrix calculus”.

Notation below is Ding’s, with \(^{\mathsf T}\) for transpose. Gradients are column vectors of the same shape as \(x\).

## Identities

If \(f:\mathbb{R}^p\to\mathbb{R}\),

\[
\frac{\partial f(x)}{\partial x}
=
\Bigl(\frac{\partial f}{\partial x_1},\ldots,\frac{\partial f}{\partial x_p}\Bigr)^{\mathsf T}.
\]

**Linear.** For \(a,x\in\mathbb{R}^p\),

\[
\frac{\partial}{\partial x}(a^{\mathsf T}x)=a.
\]

**Quadratic.** For symmetric \(A\in\mathbb{R}^{p\times p}\),

\[
\frac{\partial}{\partial x}(x^{\mathsf T}Ax)=2Ax.
\]

(Homework in the same appendix: if \(A\) is not symmetric, replace \(A\) by \(\frac12(A+A^{\mathsf T})\).)

**Matrix times vector.** For \(B\in\mathbb{R}^{p\times q}\),

\[
\frac{\partial}{\partial x}(B^{\mathsf T}x)=B.
\]

**Chain rule.** If \(h:\mathbb{R}\to\mathbb{R}\),

\[
\frac{\partial}{\partial x}h(a^{\mathsf T}x)=h'(a^{\mathsf T}x)\,a,
\qquad
\frac{\partial}{\partial x}h(x^{\mathsf T}Ax)=2h'(x^{\mathsf T}Ax)\,Ax.
\]

If \(h:\mathbb{R}^q\to\mathbb{R}\) and \(z=B^{\mathsf T}x\),

\[
\frac{\partial}{\partial x}h(B^{\mathsf T}x)
=
B\,\frac{\partial h}{\partial z}.
\]

**Hessian.**

\[
\frac{\partial^2 f}{\partial x\,\partial x^{\mathsf T}}
=
\Bigl(\frac{\partial^2 f}{\partial x_i\partial x_j}\Bigr)_{1\le i,j\le p}.
\]

## OLS (Chapter 3)

\[
\hat\beta
=
\arg\min_b\|Y-Xb\|_2^2.
\]

Expand, or apply the two identities to \(\frac12 b^{\mathsf T}(X^{\mathsf T}X)b-(X^{\mathsf T}Y)^{\mathsf T}b\):

\[
\frac{\partial}{\partial b}\Bigl(\tfrac12\|Y-Xb\|_2^2\Bigr)
=
X^{\mathsf T}(Xb-Y).
\]

Critical points: \(X^{\mathsf T}(Y-X\hat\beta)=0\) (normal equation). Unique iff \(X^{\mathsf T}X\) is nondegenerate iff the columns of \(X\) are linearly independent.

## Lift to \(\|AXB-C\|_F\)

This identity is **not** in Ding; it is the standard vec/Kronecker dictionary applied to Ding’s OLS formula.

\[
\mathrm{vec}(P MQ)=(Q^{\mathsf T}\otimes P)\,\mathrm{vec}(M),
\qquad
\|M\|_F=\|\mathrm{vec}(M)\|_2.
\]

Hence \(\|AXB-C\|_F=\|Kx-c\|_2\) with \(K=B^{\mathsf T}\otimes A\), \(x=\mathrm{vec}(X)\), \(c=\mathrm{vec}(C)\). Ding’s OLS gradient is

\[
\nabla_x\bigl(\tfrac12\|Kx-c\|_2^2\bigr)
=
K^{\mathsf T}(Kx-c)
=
(B\otimes A^{\mathsf T})\,\mathrm{vec}(AXB-C)
=
\mathrm{vec}\bigl(A^{\mathsf T}(AXB-C)B^{\mathsf T}\bigr).
\]

Reshape: \(\nabla_X(\frac12\|AXB-C\|_F^2)=A^{\mathsf T}(AXB-C)B^{\mathsf T}\). Hessian quadratic form \(\|AHB\|_F^2\); positive definite iff \(K\) has full column rank iff \(\mathrm{rank}(A)=m\) and \(\mathrm{rank}(B)=n\).

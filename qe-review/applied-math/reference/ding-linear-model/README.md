# Peng Ding — *Linear Model and Extensions* (应用回归分析)

Support for QE CAM 2026 Spring Problem 3: gradient of \(\|AXB-C\|_F^2\).

Ding’s Appendix A is **vector calculus**, not a Magnus–Neudecker matrix cookbook. The two identities that matter:

\[
\frac{\partial}{\partial x}(a^{\mathsf T}x)=a,
\qquad
\frac{\partial}{\partial x}(x^{\mathsf T}Gx)=2Gx
\quad\text{(\(G\) symmetric).}
\]

Chapter 3 then treats OLS \(\min_b\|Y-Xb\|_2^2\) by those formulas: the gradient is \(-2X^{\mathsf T}(Y-Xb)\), hence the normal equation \(X^{\mathsf T}(Y-Xb)=0\).

Matrix least squares is the same problem after stacking. With \(x=\mathrm{vec}(X)\) and \(K=B^{\mathsf T}\otimes A\),

\[
\|AXB-C\|_F=\|Kx-\mathrm{vec}(C)\|_2,
\]

so the Frobenius gradient is the OLS gradient, reshaped:

\[
\nabla_X\bigl(\tfrac12\|AXB-C\|_F^2\bigr)=A^{\mathsf T}(AXB-C)B^{\mathsf T}.
\]

Exam notes: `qe-review/applied-math/transcribed_exams/2026-spring/qzc-qe-cam-2026-spring.tex` (`lem:ding-vec-calc`, `lem:frob-grad`).

## How to read

1. [`vector-calculus.md`](./vector-calculus.md) — the identities and the OLS lift, with source spans.
2. Full book only if needed: arXiv `2401.00649`, Appendix A § Vector calculus, Chapter 3 § The OLS formula. Paths in [`SOURCE.md`](./SOURCE.md).

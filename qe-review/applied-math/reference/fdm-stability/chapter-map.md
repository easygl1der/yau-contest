# Chapter map: FDM books → 2026 Spring P4–P5

Page numbers below are **chapter-level**, not PDF-page slices (no local PDF on this machine yet). After a licensed PDF is dropped into this folder, add a 1-based page table the same way as `qingshu-interpolation/README.md`.

## LeVeque, *Finite Difference Methods for ODEs and PDEs* (SIAM, 2007)

Best first reading if the background is weak.

| Ch. | Title (approx.) | Use |
| ---: | --- | --- |
| 1 | Finite difference approximations | Forward / backward / centered quotients, Taylor remainder. P4–P5 setup. |
| 2 | IVPs for ODEs | Forward Euler, **backward Euler**, absolute stability region, A-stability. The ODE picture behind von Neumann. |
| 5 | BVP / elliptic 1D | Three-point Laplacian, discrete maximum principle. Warm-up for 2024 Spring P5 and 2026 P5. |
| 6 | Diffusion equations | Explicit / implicit heat schemes, \(\mu=\tau/h^2\). |
| 8–10 | Advection, stability theory | CFL, upwind vs centered, von Neumann, Lax equivalence. **Primary for 2026 P4.** |
| 10+ | Wave / dissipativity | 2025 Fall P5 flavour. |

## Strikwerda, *Finite Difference Schemes and PDEs* (SIAM, 2004)

| Ch. | Use |
| ---: | --- |
| 1 | Grid, truncation error, consistency. |
| 2 | Elliptic schemes, **discrete maximum principle**, M-matrix comparison. **Primary for 2026 P5.** |
| 5–6 | Hyperbolic Fourier analysis, dissipation / dispersion. Backup for P4. |
| 10 | Parabolic schemes, backward Euler. Second half of 2026 P5. |

## Gustafsson–Kreiss–Oliger (syllabus #5)

| Topic | Use |
| --- | --- |
| Fourier multipliers for difference operators | The “serious” version of von Neumann; \(1+K\tau\) growth allowed. |
| Dissipative schemes | Why implicit centered advection damps high modes. |
| GKS / boundary stability | 2025 Spring P5(b) numerical boundary condition; not needed for 2026 P4 Cauchy analysis. |

## Brenner–Scott (syllabus #8)

Finite **element** theory: weak form, Céa, interpolation in Sobolev spaces. Irrelevant to 2026 P4–P5 unless a later paper asks FEM. Do not start P4 from this book.

## Worked calculations already in the exam notes

The exam TeX does not quote the books. It redoes the QE calculations:

- explicit upwind (CFL \(r\le 1\));
- explicit centered advection (unconditionally unstable);
- backward Euler on \(y'=\lambda y\);
- the three 2026 implicit schemes;
- 2D five-point stencil with mesh Péclet condition.

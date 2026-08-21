# Finite-difference stability (CAM PDE slot)

Support for QE CAM **2026 Spring Problems 4–5**, and the same slot in 2023–2025.

- Problem 4: von Neumann stability of three **implicit** schemes for \(u_t+u_x=0\).
- Problem 5: discrete maximum principle for a centered 2D convection–diffusion stencil, then \(\ell_\infty\) stability of **backward Euler**.

Do **not** confuse this with finite elements. Brenner–Scott is the syllabus FEM book; 2026 P4–P5 are finite **differences**.

## How to read

1. Start from the exam notes (definitions + worked past-paper calculations + solutions):
   `qe-review/applied-math/transcribed_exams/2026-spring/qzc-qe-cam-2026-spring.tex`
   (Problems 4–5 are in that file).
2. Use [chapter-map.md](./chapter-map.md) to jump in LeVeque / Strikwerda / GKO once a local PDF is on the shelf.
3. Provenance and “where to drop PDFs”: [SOURCE.md](./SOURCE.md).

## Package layout

| Path | Role |
| --- | --- |
| [SOURCE.md](./SOURCE.md) | Why there is no full-book PDF here yet |
| [chapter-map.md](./chapter-map.md) | Syllabus book → chapter → QE problem |
| Exam TeX | Original notes; this is the study text |

## Exam pattern (PDE numerics, 2023–2026)

Almost every CAM paper has a 15-point finite-difference question in the Problem 4/5 slot:

| Paper | Ask | Tool |
| --- | --- | --- |
| 2023 Fall P5 | Lax–Friedrichs for \(u_t+a u_{xxx}=0\) | truncation + von Neumann |
| 2024 Spring P4 | \(\theta\)-method for heat | truncation + von Neumann |
| 2024 Spring P5 | 1D monotone three-point operator | discrete max principle |
| 2024 Fall P4 | Lax–Friedrichs-type first-order system | truncation + von Neumann |
| 2024 Fall P5 | 2D centered convection–diffusion, \(f<0\) | discrete max principle |
| 2025 Spring P5 | Lax–Wendroff for advection | energy identity in \(\ell_2\) |
| 2025 Fall P4 | Du Fort–Frankel, 2D heat | consistency + von Neumann |
| 2025 Fall P5 | implicit multistep wave scheme | von Neumann / Jury |
| 2026 Spring P4 | three implicit advection schemes | von Neumann |
| 2026 Spring P5 | 2024 Fall P5 + backward Euler parabolic | max principle \(\Rightarrow\) \(\ell_\infty\) stability |

Two analysis languages cover almost all of them:

- **Fourier / von Neumann** (constant-coefficient Cauchy or periodic): Problem 4 style.
- **Monotone stencil / discrete maximum principle** (Dirichlet, \(\ell_\infty\)): Problem 5 style.

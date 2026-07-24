# Agent E Geometry 2019--2026 Risk Audit

Scope:

- `latex-project/content/split_geometry/geometry_2019.tex`
- `latex-project/content/split_geometry/geometry_2020.tex`
- `latex-project/content/split_geometry/geometry_2021.tex`
- `latex-project/content/split_geometry/geometry_2022.tex`
- `latex-project/content/split_geometry/geometry_2023.tex`
- `latex-project/content/split_geometry/geometry_2024.tex`
- `latex-project/content/split_geometry/geometry_2025.tex`
- `latex-project/content/split_geometry/geometry_2026.tex`

Required inputs read:

- `latex-project/audit/solution_risk_audit.csv`
- `latex-project/audit/solution_risk_audit.md`

Source alignment checks:

- Checked local source PDFs/text for 2023, 2024, 2025, and 2026 geometry.
- For 2023 problem 2, `pdftotext` flattened exponents, so page image inspection was used. The source confirms `Z_3 \oplus Z^2` and `Z_6 \oplus Z^3`, matching the LaTeX file.
- 2026 problem statements were checked against `latex-project/sources/2026-text/2026_geo_topology.txt`.

## Files Modified

- `geometry_2019.tex`
  - Expanded 2019:5 beyond a bare Uniformization invocation: added sign obstruction for `E`, normalized curvature-one metric, and explicit Mobius conformal factor family.
  - Strengthened 2019:6 by replacing the informal self-intersection comparison with the Euler number of the normal bundle of the core `S^2`.

- `geometry_2023.tex`
  - Expanded 2023:6 Ricci soliton scalar-curvature identity with the trace, divergence, commutation, and weighted Laplacian derivation.

- `geometry_2024.tex`
  - Expanded 2024:5(iii) from a periodic-cohomology assertion to the relevant Borel--Smith fixed point formula special case excluding a free `Z_p x Z_p` action.

- `geometry_2025.tex`
  - Repaired 2025:1 statement-risk area: source statement is aligned, but the previous explanation overstated the role of odd spheres. Replaced it with a stable-parallelizability bundle calculation using one nowhere-zero field on the odd sphere.

- `geometry_2026.tex`
  - Expanded 2026:4 James construction dependency by stating the James weak equivalence `J(X) ~= Omega Sigma X` and the loop-space cell consequences.
  - Expanded 2026:5 Smith fixed point dependency by stating the applicable finite-dimensional mod-`p` acyclic manifold version.
  - Expanded 2026:6 index-form proof by spelling out the Hardy constant `1/4` change of variables and the sharp warped-product examples.

## Risk Classification By Audit Row

| Row | Classification | Notes |
| --- | --- | --- |
| 2019:1 | THEOREM_DEP_ACCEPTABLE | de Rham/integration criterion is standard prerequisite; solution has explicit loop integral and Arnold relation calculation. |
| 2019:2 | OK | Direct intersection-form computation. |
| 2019:3 | OK | Direct group abelianization. |
| 2019:4 | THEOREM_DEP_ACCEPTABLE | Chern--Weil/Bianchi/transgression is standard; solution gives the transgression formula. |
| 2019:5 | THEOREM_DEP_EXPANDED | Uniformization dependency expanded to explicit solution family and sign condition. |
| 2019:6 | THEOREM_DEP_EXPANDED | Poincare--Hopf/self-intersection dependency made invariant via Euler number. |
| 2019:7 | THEOREM_DEP_ACCEPTABLE | de Rham/retraction computation is standard and explicit. |
| 2019:8 | THEOREM_DEP_ACCEPTABLE | Lefschetz fixed point theorem is a standard allowed tool; trace argument is explicit. |
| 2019:9 | THEOREM_DEP_ACCEPTABLE | Standard Lie group fibrations/homotopy sequence; no new gap found. |
| 2019:10 | THEOREM_DEP_EXPANDED | Killing-field Hessian/curvature identity already expanded in file; retained as acceptable detailed proof. |
| 2020:1 | RESIDUAL_RISK | Hopf invariant evenness still depends on Adams/Whitehead-product theory; too heavy to fully expand in this pass. |
| 2020:2 | THEOREM_DEP_ACCEPTABLE | Maximum principle/Ahlfors comparison is a standard PDE input; no statement fix needed. |
| 2020:3 | THEOREM_DEP_ACCEPTABLE | Jacobi/normal-coordinate expansion is local and explicit enough. |
| 2020:4 | THEOREM_DEP_ACCEPTABLE | Compactness and `SO(3) ~= RP^3`/stable `pi_1(SO(n))` are standard topology inputs. |
| 2020:5 | STATEMENT_RISK_FIXED | Existing solution already includes the counterexample for the weaker assumption using the open Mobius strip. |
| 2020:6 | OK | Free-group graph/covering facts are standard and correctly applied. |
| 2021:1 | THEOREM_DEP_ACCEPTABLE | Thom/Stiefel--Whitney cobordism criterion is heavy but is the intended tool; retained as acceptable dependency. |
| 2021:2 | THEOREM_DEP_ACCEPTABLE | Bishop--Gromov rigidity is a standard geometric theorem; no local expansion attempted. |
| 2021:3 | THEOREM_DEP_ACCEPTABLE | Universal cover of torus gives all higher homotopy groups. |
| 2021:4 | THEOREM_DEP_ACCEPTABLE | Conformal mean-curvature formula used directly. |
| 2021:5 | THEOREM_DEP_ACCEPTABLE | Frankel/index-form proof is explicit enough. |
| 2021:6 | THEOREM_DEP_ACCEPTABLE | Jordan--Brouwer separation is a standard topology prerequisite. |
| 2022:1 | THEOREM_DEP_ACCEPTABLE | Poincare duality/link obstruction used; adequate for this topological obstruction. |
| 2022:2 | THEOREM_DEP_ACCEPTABLE | Gauss--Bonnet and Gauss equation are standard and explicitly applied. |
| 2022:3 | THEOREM_DEP_ACCEPTABLE | Fundamental theorem of algebra/root-coefficient homeomorphism is explicit. |
| 2022:4 | THEOREM_DEP_ACCEPTABLE | Arzela--Ascoli/geodesic limiting argument is standard; no gap found. |
| 2022:5 | THEOREM_DEP_ACCEPTABLE | Eckmann--Hilton and cohomology obstruction are standard; proof is explicit. |
| 2022:6 | THEOREM_DEP_ACCEPTABLE | Maximum-principle shrinker argument is explicit. |
| 2023:1 | SOURCE_ALIGN_REVIEWED | Source PDF matches; Maurer--Cartan computation is explicit. |
| 2023:2 | SOURCE_ALIGN_REVIEWED | Source image confirms exponents `Z^2`, `Z^3`; group obstruction for 3-manifolds retained. |
| 2023:3 | SOURCE_ALIGN_REVIEWED | Source wording is awkward but matches current statement; construction retained. |
| 2023:4 | SOURCE_ALIGN_REVIEWED | Source matches; Leray--Hirsch dependency acceptable. |
| 2023:5 | SOURCE_ALIGN_REVIEWED | Source matches; noncompact Stokes proof by cutoff is explicit. |
| 2023:6 | THEOREM_DEP_EXPANDED | Ricci soliton identity derivation expanded. Source matches. |
| 2024:1 | THEOREM_DEP_ACCEPTABLE | Cohomology ring/CW quotient argument is standard. |
| 2024:2 | THEOREM_DEP_ACCEPTABLE | Maximum principle via harmonic coordinate functions is standard. |
| 2024:3 | THEOREM_DEP_ACCEPTABLE | Poincare duality and skew middle pairing are explicit. |
| 2024:4 | OK | Direct sphere-average linear algebra. |
| 2024:5 | THEOREM_DEP_EXPANDED | Smith/Borel fixed point dependency expanded to the rank-two elementary abelian case. |
| 2024:6 | OK | Eigenvalue variation/naturality proof is direct. |
| 2025:1 | STATEMENT_RISK_FIXED | Source statement aligned; proof repaired with a valid stable-parallelizability calculation. |
| 2025:2 | THEOREM_DEP_ACCEPTABLE | Lie algebra/Koszul/scalar curvature computation acceptable. |
| 2025:3 | OK | Standard unitary fibration computation. |
| 2025:4 | OK | Pontryagin/Euler class obstruction is explicit. |
| 2025:5 | THEOREM_DEP_ACCEPTABLE | Conformal curvature law, Fredholm solvability, and Gauss--Bonnet are explicitly connected. |
| 2025:6 | OK | Lefschetz/cohomology-ring argument; no gap found. |
| 2026:1 | THEOREM_DEP_ACCEPTABLE | Area formula/change-of-variables dependency acceptable. |
| 2026:2 | OK | Gauss--Bonnet equality case plus flat disk identification. |
| 2026:3 | OK | Bi-invariant metric curvature and Lie algebra splitting proof. |
| 2026:4 | THEOREM_DEP_EXPANDED | James/Morse dependencies clarified; Morse index and loop-space series retained with explicit formulas. |
| 2026:5 | THEOREM_DEP_EXPANDED | Smith fixed point theorem stated in the precise needed form. |
| 2026:6 | THEOREM_DEP_EXPANDED | Index form and Hardy sharpness fully expanded, including examples at the threshold. |

## Residual Risks

- 2020:1(d): Hopf invariant evenness for maps `S^11 -> S^6` still uses deep unstable homotopy theory. This is marked `RESIDUAL_RISK`, not silently accepted.
- 2021:1: Thom cobordism criterion is heavy. I classify it as `THEOREM_DEP_ACCEPTABLE` because the problem is naturally about cobordism/Stiefel--Whitney numbers and a full proof would be out of scope.
- 2024:5 and 2026:5 still rely on Smith theory, but the applied statements are now explicit. Full Smith theory proof is not expanded.

## Structure Checks

- Exercise/solution environment counts match for every file in scope:
  - 2019: 10 exercises, 10 solutions.
  - 2020--2026: 6 exercises and 6 solutions each.
- `git diff --check` passed for modified in-scope files.
- Full project compile command `./compile.sh` from `latex-project/` completed successfully with three `xelatex` passes.

Note: the working tree had many pre-existing modified and untracked files from other agents. This pass did not revert or normalize any out-of-scope edits.

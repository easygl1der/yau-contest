# Agent B Analysis Audit Report: 2010--2016

Scope: `latex-project/content/split_analysis/analysis_2010.tex` through `analysis_2016.tex`.

## Inputs Read

- `latex-project/audit/solution_risk_audit.csv`
- `latex-project/audit/solution_risk_audit.md`
- `latex-project/audit/source_alignment_inventory.md`
- Source PDFs checked for targeted source alignment:
  - `analysis_2011`: `analysis_2011` source PDF
  - `analysis_2013`: individual and team source PDFs
  - `analysis_2014`: team source PDF
  - `analysis_2015`: individual and team source PDFs
  - `analysis_2016`: individual and team source PDFs

## Files Modified In This Pass

- `latex-project/content/split_analysis/analysis_2010.tex`
- `latex-project/content/split_analysis/analysis_2013.tex`
- `latex-project/content/split_analysis/analysis_2015.tex`
- `latex-project/audit/agent_analysis_2010_2016_report.md`

Reviewed without further modification in this pass:

- `latex-project/content/split_analysis/analysis_2011.tex`
- `latex-project/content/split_analysis/analysis_2012.tex`
- `latex-project/content/split_analysis/analysis_2014.tex`
- `latex-project/content/split_analysis/analysis_2016.tex`

Note: `analysis_2012.tex`, `analysis_2014.tex`, `analysis_2015.tex`, and `analysis_2016.tex` already had dirty worktree changes when this pass began. I did not revert them. For `analysis_2014:9`, `analysis_2015:11`, `analysis_2016:10`, and `analysis_2016:11`, the existing corrected content was reviewed and kept.

## Main Risk Resolutions

- `analysis_2010:5`: changed from an invalid proof of an arbitrary `L1` kernel mapping into `C0` to an explicit counterexample, the true compactness statement into `L1`, and a corrected `C0` version under continuous-kernel hypotheses. Status: `STATEMENT_RISK_FIXED`.
- `analysis_2010:12`: replaced the sign-only integral proof with a comparison lemma using the maximum principle/Hopf lemma framework. The printed bounded-domain statement still lacks boundary regularity assumptions, so this row remains residual. Status: `RESIDUAL_RISK`.
- `analysis_2013:1` and `analysis_2013:5`: fixed OCR/source notation errors `alpha0` and missing inequality signs after source review. Status: `SOURCE_ALIGN_REVIEWED`.
- `analysis_2013:11`: expanded the compact self-adjoint spectral theorem dependency into the core special-case proof structure: existence of nonzero eigenvalue, orthogonality, finite multiplicity, decomposition, and eigenvalue decay. Status: `THEOREM_DEP_EXPANDED`.
- `analysis_2013:12`: identified the literal Legendre-transform `max` statement as false without a growth condition; added a counterexample and a corrected superlinear version, while retaining the valid convex-continuity and nondifferentiability arguments. Status: `STATEMENT_RISK_FIXED`.
- `analysis_2014:9`: source confirms the printed annulus factorization statement is false. Existing solution keeps the statement and gives `exp(1/z)` as counterexample plus corrected punctured-disk/meromorphic variants. Status: `STATEMENT_RISK_FIXED`.
- `analysis_2015:5`: source mismatch fixed to the individual Fredholm-parametrix statement. Added proof of finite kernel, closed range, and finite cokernel from compact remainders. Status: `THEOREM_DEP_EXPANDED`.
- `analysis_2015:11`: source confirms the printed team Fredholm statement is false. Existing solution gives `T=0, S=0` counterexample and proves the corrected `I+S` compact-perturbation case. Status: `STATEMENT_RISK_FIXED`.
- `analysis_2015:12`: part (b) full-domain compactness of bounded harmonic functions in `L2(Omega)` is false. Added explicit orthonormal harmonic sequence on the disk and the corrected local compactness statement. Status: `STATEMENT_RISK_FIXED`.
- `analysis_2016:10`: source confirms the printed holomorphic automorphism claim is false. Existing solution distinguishes the real mapping-class group from the holomorphic automorphism group and gives the corrected semidirect-product answer. Status: `STATEMENT_RISK_FIXED`.
- `analysis_2016:11`: source confirms the printed "no eigenvectors" claim is false because `Ae_1=0`. Existing solution proves compactness, no nonzero eigenvalues, and spectrum `{0}`. Status: `STATEMENT_RISK_FIXED`.
- `analysis_2016:12`: source alignment reviewed; existing solution notes the literal logarithm limit is `-infinity` and the actual exponential rate requires the missing `1/t` factor. Status: `SOURCE_ALIGN_REVIEWED`.

## Residual Risks

- `analysis_2010:12`: the intended uniqueness theorem needs classical boundary regularity and Hopf/quotient boundary behavior, or a weak maximum-principle formulation. The current solution states this explicitly instead of pretending the printed bounded-domain hypothesis is sufficient.
- `analysis_2011:4`: proof depends on endpoint/interval handling for image intervals of a continuous function; acceptable as a sketch but not fully expanded.
- `analysis_2011:5`: proof uses a positive-functional/extension-style argument whose majorization details are not fully written.
- Several theorem dependencies are left as acceptable prerequisites rather than expanded: residue theorem, Riemann mapping/conformal classification, Poincare recurrence, Sobolev embedding, Montel theorem, Borel-Cantelli, and Hermite-Lindemann. These were not the marked false-statement risks in this pass.

## Classification Matrix

| Year | Problem | Audit risk | Final status | Notes |
|---|---:|---|---|---|
| 2010 | 1 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Residue/contour method accepted as standard prerequisite. |
| 2010 | 2 | OK | OK | No new issue found. |
| 2010 | 3 | OK | OK | No new issue found. |
| 2010 | 4 | OK | OK | No new issue found. |
| 2010 | 5 | OK | STATEMENT_RISK_FIXED | Audit missed false `L1 -> C0` claim; fixed with counterexample and corrected versions. |
| 2010 | 6 | OK | OK | No new issue found. |
| 2010 | 7 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Standard Hilbert/orthogonality tools accepted. |
| 2010 | 8 | OK | OK | No new issue found. |
| 2010 | 9 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Standard measure/functional analysis dependency accepted. |
| 2010 | 10 | OK | OK | No new issue found. |
| 2010 | 11 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Standard compactness/functional-analysis dependency accepted. |
| 2010 | 12 | THEOREM_DEP | RESIDUAL_RISK | Comparison proof expanded, but printed bounded-domain hypothesis lacks boundary regularity. |
| 2011 | 1 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Standard theorem dependency accepted. |
| 2011 | 2 | OK | OK | No new issue found. |
| 2011 | 3 | OK | OK | No new issue found. |
| 2011 | 4 | THEOREM_DEP | RESIDUAL_RISK | Endpoint/interval details remain sketch-level. |
| 2011 | 5 | THEOREM_DEP | RESIDUAL_RISK | Positive-functional extension details remain underexpanded. |
| 2011 | 6 | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source checked; no rewrite needed in this pass. |
| 2011 | 7 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Montel/Hardy-space compactness dependency accepted. |
| 2011 | 8 | OK | OK | No new issue found. |
| 2011 | 9 | OK | OK | No new issue found. |
| 2011 | 10 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Borel-Cantelli dependency accepted. |
| 2011 | 11 | STATEMENT_RISK+THEOREM_DEP | STATEMENT_RISK_FIXED | Existing counterexample for `n=2` reviewed. |
| 2011 | 12 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Hermite-Lindemann cited as high-level accepted dependency. |
| 2012 | 1 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Residue theorem accepted. |
| 2012 | 2 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Explicit conformal map avoids Riemann mapping dependency. |
| 2012 | 3 | OK | OK | No new issue found. |
| 2012 | 4 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Measurable projection theorem accepted. |
| 2012 | 5 | OK | OK | No new issue found. |
| 2012 | 6 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Standard analysis dependency accepted. |
| 2012 | 7 | OK | OK | No new issue found. |
| 2012 | 8 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Riemann mapping/conformal classification accepted as theorem dependency. |
| 2012 | 9 | OK | OK | No new issue found. |
| 2012 | 10 | THEOREM_DEP | THEOREM_DEP_EXPANDED | Existing solution gives constructive/special-case detail beyond a bare citation. |
| 2012 | 11 | THEOREM_DEP | THEOREM_DEP_EXPANDED | Existing solution gives a local special-case argument. |
| 2012 | 12 | OK | OK | No new issue found. |
| 2013 | 1 | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source/OCR notation fixed. |
| 2013 | 2 | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed; theorem dependency not expanded. |
| 2013 | 3 | SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed. |
| 2013 | 4 | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed; theorem dependency acceptable for this pass. |
| 2013 | 5 | SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source/OCR notation fixed. |
| 2013 | 6 | SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed. |
| 2013 | 7 | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed; theorem dependency acceptable for this pass. |
| 2013 | 8 | SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed. |
| 2013 | 9 | SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed. |
| 2013 | 10 | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed; Helmholtz/Poisson details not expanded. |
| 2013 | 11 | THEOREM_DEP+SOURCE_ALIGN_RISK | THEOREM_DEP_EXPANDED | Compact self-adjoint spectral argument expanded. |
| 2013 | 12 | SOURCE_ALIGN_RISK | STATEMENT_RISK_FIXED | Literal Legendre-transform `max` statement fixed with counterexample and corrected theorem. |
| 2014 | 1 | OK | OK | No new issue found. |
| 2014 | 2 | OK | OK | No new issue found. |
| 2014 | 3 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Standard complex-analysis dependency accepted. |
| 2014 | 4 | OK | OK | No new issue found. |
| 2014 | 5 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Standard theorem dependency accepted. |
| 2014 | 6 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Standard theorem dependency accepted. |
| 2014 | 7 | OK | OK | No new issue found. |
| 2014 | 8 | OK | OK | No new issue found. |
| 2014 | 9 | STATEMENT_RISK+THEOREM_DEP | STATEMENT_RISK_FIXED | False annulus factorization handled with counterexample and corrected versions. |
| 2014 | 10 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Poincare recurrence dependency accepted, though proof remains sketchy. |
| 2014 | 11 | THEOREM_DEP | THEOREM_DEP_EXPANDED | Mean-value/maximum-principle proof present. |
| 2014 | 12 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Approximate identity theorem accepted. |
| 2015 | 1 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Standard Hilbert-space argument accepted. |
| 2015 | 2 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Weierstrass/density argument accepted. |
| 2015 | 3 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Standard complex-analysis dependency accepted. |
| 2015 | 4 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Maximum-principle dependency accepted. |
| 2015 | 5 | THEOREM_DEP+SOURCE_ALIGN_RISK | THEOREM_DEP_EXPANDED | Source fixed to individual problem; Fredholm-parametrix proof expanded. |
| 2015 | 6 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Sobolev embedding/Fourier-series estimate accepted. |
| 2015 | 7 | STATEMENT_RISK+THEOREM_DEP | OK | Audit false positive; printed variational lemma is true and proof is direct. |
| 2015 | 8 | OK | OK | No new issue found. |
| 2015 | 9 | THEOREM_DEP | THEOREM_DEP_ACCEPTABLE | Standard analysis dependency accepted. |
| 2015 | 10 | OK | OK | No new issue found. |
| 2015 | 11 | STATEMENT_RISK+THEOREM_DEP | STATEMENT_RISK_FIXED | False Fredholm statement handled with counterexample and corrected `I+S` proof. |
| 2015 | 12 | THEOREM_DEP | STATEMENT_RISK_FIXED | Audit missed false full-domain harmonic compactness; fixed with disk counterexample and local version. |
| 2016 | 1 | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed; integrability convention remains as printed. |
| 2016 | 2 | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed. |
| 2016 | 3 | SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed. |
| 2016 | 4 | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed. |
| 2016 | 5 | SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed. |
| 2016 | 6 | SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed. |
| 2016 | 7 | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed. |
| 2016 | 8 | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed; Borel-Cantelli argument present. |
| 2016 | 9 | THEOREM_DEP+SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed; complex-analysis proof present. |
| 2016 | 10 | SOURCE_ALIGN_RISK | STATEMENT_RISK_FIXED | Source confirms printed torus automorphism claim is false; corrected. |
| 2016 | 11 | STATEMENT_RISK+THEOREM_DEP+SOURCE_ALIGN_RISK | STATEMENT_RISK_FIXED | Source confirms printed eigenvector claim is false; corrected. |
| 2016 | 12 | SOURCE_ALIGN_RISK | SOURCE_ALIGN_REVIEWED | Source reviewed; existing solution records literal-limit issue and corrected rate. |

## Structural Checks

- `git diff --check` on `analysis_2010.tex` through `analysis_2016.tex`: passed.
- Exercise/solution/label counts for each file `analysis_2010.tex` through `analysis_2016.tex`: `12` exercises, `12` solutions, `12` analysis labels.
- One-pass `xelatex` smoke test with output directory `/tmp/yau-contest-latex-check`: passed and produced `/tmp/yau-contest-latex-check/main.pdf`.
- Compile warnings observed were non-fatal existing document-wide warnings such as overfull boxes, font substitutions, footnote range warnings, and changed labels requiring rerun; no blocking LaTeX error was introduced by this pass.

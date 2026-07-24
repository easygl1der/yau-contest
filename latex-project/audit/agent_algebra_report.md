# Agent A Algebra Risk Report

Scope: `latex-project/content/split_algebra/*.tex` and this report. Baseline read from `latex-project/audit/solution_risk_audit.csv` and `latex-project/audit/solution_risk_audit.md`.

## Summary

- Algebra audit rows reviewed: 147.
- Classification counts:
  - `OK`: 41
  - `THEOREM_DEP_ACCEPTABLE`: 49
  - `THEOREM_DEP_EXPANDED`: 10
  - `STATEMENT_RISK_FIXED`: 4
  - `SOURCE_ALIGN_REVIEWED`: 40
  - `RESIDUAL_RISK`: 3
- Source alignment boundary: local PDFs and `latex-project/audit/source_alignment_inventory.md` confirm the relevant high-risk year/source structure and exercise counts for 2013, 2016, 2017, 2018, and 2023. This is not a full official-solution proofread; rows marked `SOURCE_ALIGN_REVIEWED` mean structure/source routing was reviewed and no statement-level edit was made.

## Modified Files

- `latex-project/content/split_algebra/algebra_2010.tex`
  - Expanded Mason-Stothers use in 2010:8 with a short Wronskian proof and pairwise-coprime check.
  - Added a statement audit note and tightened Sylow/conjugation-action proof for 2010:11.
  - Made one existing inline `\text{}` expression safer for LaTeX.
- `latex-project/content/split_algebra/algebra_2015.tex`
  - Fixed an unflagged statement risk in 2015:3: the printed condition with `(31/p)=-1` is false; added the counterexample `p=7` and proved the corrected `(-31/p)=-1` version.
- `latex-project/content/split_algebra/algebra_2016.tex`
  - Expanded 2016:1 by proving the needed Stieltjes/M-matrix inverse-positivity special case.
  - Expanded 2016:2 by spelling out the finite abelian decomposition used for multiplicativity.
- `latex-project/content/split_algebra/algebra_2018.tex`
  - Replaced black-box Kummer use in 2018:7 with a Legendre-formula proof of the valuation bound needed for Chebyshev.
- `latex-project/content/split_algebra/algebra_2019.tex`
  - Added a short character/Galois-conjugacy lemma for 2019:1.
- `latex-project/content/split_algebra/algebra_2021.tex`
  - Expanded 2021:4 by proving the multiquadratic sign-change automorphism lemma.
- `latex-project/content/split_algebra/algebra_2023.tex`
  - Expanded 2023:4 commutative algebra solution around finite presentation, local projectivity, flatness of `S/I`, and non-projectivity.
- `latex-project/content/split_algebra/algebra_2024.tex`
  - Expanded 2024:1 finite abelian structure theorem and character-separation step.
  - Expanded 2024:2 Smith normal form/minor criterion and dominance-order translation.
- `latex-project/content/split_algebra/algebra_2025.tex`
  - Expanded 2025:1 quadratic Kummer/V4 conditions.
  - Expanded 2025:2 semidirect product and Frobenius representation conditions.
- `latex-project/content/split_algebra/algebra_2026.tex`
  - Expanded 2026:5 tame local Kummer applicability and valuation/residue decomposition. This file was already untracked before this report pass.

## Statement-Risk Review

- 2010:11: `STATEMENT_RISK_FIXED`. The terse statement "Group of order 150 is not simple" is kept, with explicit intended reading "every group of order 150 is not simple" and a tightened Sylow proof.
- 2016:1: `STATEMENT_RISK_FIXED`. The solution already contained a reverse-implication counterexample; the proof of the forward implication no longer relies on an unexplained deep inverse-positivity theorem.
- 2021:4: `STATEMENT_RISK_FIXED`. The audit's false-risk label is addressed by proving the required sign-change automorphisms for distinct prime square roots.
- 2015:3: `STATEMENT_RISK_FIXED`. Not flagged as statement-risk in the baseline, but the literal final claim using `(31/p)=-1` is false. The solution now gives `p=7` as counterexample and proves the corrected `(-31/p)=-1` version.

## Residual Risks

- 2014:5: `RESIDUAL_RISK`. Baseline marks `THEOREM_DEP+SOURCE_ALIGN_RISK` with `individual`; no focused edit made because this row needs manual source/solution alignment beyond structural source inventory.
- 2021:5: `RESIDUAL_RISK`. Baseline marks `THEOREM_DEP+SOURCE_ALIGN_RISK` with `individual`; class-number/ideal-factorization solution still needs a separate number-theory proofread.
- 2022:1: `RESIDUAL_RISK`. Baseline marks `THEOREM_DEP+SOURCE_ALIGN_RISK` with `individual`; no full source-solution alignment performed in this pass.

## Structure Checks

- Exercise/solution counts checked for all algebra split files:
  - 2010: 12/12
  - 2011: 12/12
  - 2012: 12/12
  - 2013: 8/8
  - 2014: 12/12
  - 2015: 11/11
  - 2016: 10/10
  - 2017: 10/10
  - 2018: 10/10
  - 2019: 10/10
  - 2020: 6/6
  - 2021: 6/6
  - 2022: 6/6
  - 2023: 6/6
  - 2024: 6/6
  - 2025: 5/5
  - 2026: 5/5
- `exercise`, `solution`, `enumerate`, and `itemize` begin/end counts are balanced in `split_algebra`.
- `git diff --check -- latex-project/content/split_algebra latex-project/audit/agent_algebra_report.md` passes.
- Full LaTeX verification passed with the project-local class path and an isolated job name:
  `TEXINPUTS=".:./texmf/tex/latex/kaobook//:" xelatex -interaction=nonstopmode -halt-on-error -jobname=agent_algebra_verify main.tex`.
  The temporary `agent_algebra_verify.*` build artifacts were removed after the check.
- Patch edits were limited to the declared algebra split/report scope. The surrounding worktree already contains unrelated edits and build artifacts from other work.

## Per-Row Classification

| Year | Problem | Baseline risk | Dependency | Classification |
|---:|---:|---|---|---|
| 2010 | 1 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2010 | 2 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2010 | 3 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2010 | 4 | `THEOREM_DEP` | Eisenstein, Galois | `THEOREM_DEP_ACCEPTABLE` |
| 2010 | 5 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2010 | 6 | `THEOREM_DEP` | representation theory | `THEOREM_DEP_ACCEPTABLE` |
| 2010 | 7 | `OK` | - | `OK` |
| 2010 | 8 | `THEOREM_DEP` | Mason-Stothers | `THEOREM_DEP_EXPANDED` |
| 2010 | 9 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2010 | 10 | `THEOREM_DEP` | Eisenstein, Galois | `THEOREM_DEP_ACCEPTABLE` |
| 2010 | 11 | `STATEMENT_RISK+THEOREM_DEP` | Sylow, false | `STATEMENT_RISK_FIXED` |
| 2010 | 12 | `OK` | - | `OK` |
| 2011 | 1 | `THEOREM_DEP` | Galois | `THEOREM_DEP_ACCEPTABLE` |
| 2011 | 2 | `OK` | - | `OK` |
| 2011 | 3 | `OK` | - | `OK` |
| 2011 | 4 | `OK` | - | `OK` |
| 2011 | 5 | `OK` | - | `OK` |
| 2011 | 6 | `THEOREM_DEP` | Sylow | `THEOREM_DEP_ACCEPTABLE` |
| 2011 | 7 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2011 | 8 | `OK` | - | `OK` |
| 2011 | 9 | `OK` | - | `OK` |
| 2011 | 10 | `OK` | - | `OK` |
| 2011 | 11 | `THEOREM_DEP` | Sylow | `THEOREM_DEP_ACCEPTABLE` |
| 2011 | 12 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2012 | 1 | `THEOREM_DEP` | Eisenstein | `THEOREM_DEP_ACCEPTABLE` |
| 2012 | 2 | `THEOREM_DEP` | Sylow | `THEOREM_DEP_ACCEPTABLE` |
| 2012 | 3 | `THEOREM_DEP` | representation theory | `THEOREM_DEP_ACCEPTABLE` |
| 2012 | 4 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2012 | 5 | `OK` | - | `OK` |
| 2012 | 6 | `OK` | - | `OK` |
| 2012 | 7 | `OK` | - | `OK` |
| 2012 | 8 | `THEOREM_DEP` | Sylow | `THEOREM_DEP_ACCEPTABLE` |
| 2012 | 9 | `OK` | - | `OK` |
| 2012 | 10 | `OK` | - | `OK` |
| 2012 | 11 | `OK` | - | `OK` |
| 2012 | 12 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2013 | 1 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Sylow | `SOURCE_ALIGN_REVIEWED` |
| 2013 | 2 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2013 | 3 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2013 | 4 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2013 | 5 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2013 | 6 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2013 | 7 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2013 | 8 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Galois | `SOURCE_ALIGN_REVIEWED` |
| 2014 | 1 | `OK` | - | `OK` |
| 2014 | 2 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2014 | 3 | `OK` | - | `OK` |
| 2014 | 4 | `OK` | - | `OK` |
| 2014 | 5 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | individual | `RESIDUAL_RISK` |
| 2014 | 6 | `OK` | - | `OK` |
| 2014 | 7 | `OK` | - | `OK` |
| 2014 | 8 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2014 | 9 | `OK` | - | `OK` |
| 2014 | 10 | `OK` | - | `OK` |
| 2014 | 11 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2014 | 12 | `OK` | - | `OK` |
| 2015 | 1 | `OK` | - | `OK` |
| 2015 | 2 | `OK` | - | `OK` |
| 2015 | 3 | `THEOREM_DEP` | Frobenius, Galois | `STATEMENT_RISK_FIXED` |
| 2015 | 4 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2015 | 5 | `OK` | - | `OK` |
| 2015 | 6 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2015 | 7 | `THEOREM_DEP` | Sylow | `THEOREM_DEP_ACCEPTABLE` |
| 2015 | 8 | `THEOREM_DEP` | Galois | `THEOREM_DEP_ACCEPTABLE` |
| 2015 | 9 | `THEOREM_DEP` | representation theory | `THEOREM_DEP_ACCEPTABLE` |
| 2015 | 10 | `THEOREM_DEP` | spectral theorem | `THEOREM_DEP_ACCEPTABLE` |
| 2015 | 11 | `THEOREM_DEP` | Eisenstein, Galois, Sylow | `THEOREM_DEP_ACCEPTABLE` |
| 2016 | 1 | `STATEMENT_RISK+THEOREM_DEP+SOURCE_ALIGN_RISK` | counterexample, does not hold | `STATEMENT_RISK_FIXED` |
| 2016 | 2 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | structure theorem | `THEOREM_DEP_EXPANDED` |
| 2016 | 3 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2016 | 4 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | individual | `SOURCE_ALIGN_REVIEWED` |
| 2016 | 5 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Sylow | `SOURCE_ALIGN_REVIEWED` |
| 2016 | 6 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2016 | 7 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2016 | 8 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Galois | `SOURCE_ALIGN_REVIEWED` |
| 2016 | 9 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2016 | 10 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2017 | 1 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | individual | `SOURCE_ALIGN_REVIEWED` |
| 2017 | 2 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2017 | 3 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Galois | `SOURCE_ALIGN_REVIEWED` |
| 2017 | 4 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2017 | 5 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Frobenius | `SOURCE_ALIGN_REVIEWED` |
| 2017 | 6 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | source | `SOURCE_ALIGN_REVIEWED` |
| 2017 | 7 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2017 | 8 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2017 | 9 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Eisenstein, Galois | `SOURCE_ALIGN_REVIEWED` |
| 2017 | 10 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Frobenius | `SOURCE_ALIGN_REVIEWED` |
| 2018 | 1 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2018 | 2 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Eisenstein, Galois | `SOURCE_ALIGN_REVIEWED` |
| 2018 | 3 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Sylow | `SOURCE_ALIGN_REVIEWED` |
| 2018 | 4 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2018 | 5 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2018 | 6 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2018 | 7 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Kummer | `THEOREM_DEP_EXPANDED` |
| 2018 | 8 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Frobenius | `SOURCE_ALIGN_REVIEWED` |
| 2018 | 9 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Galois | `SOURCE_ALIGN_REVIEWED` |
| 2018 | 10 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2019 | 1 | `THEOREM_DEP` | representation theory | `THEOREM_DEP_EXPANDED` |
| 2019 | 2 | `THEOREM_DEP` | Galois | `THEOREM_DEP_ACCEPTABLE` |
| 2019 | 3 | `OK` | - | `OK` |
| 2019 | 4 | `THEOREM_DEP` | Jordan normal form | `THEOREM_DEP_ACCEPTABLE` |
| 2019 | 5 | `THEOREM_DEP` | Frobenius | `THEOREM_DEP_ACCEPTABLE` |
| 2019 | 6 | `OK` | - | `OK` |
| 2019 | 7 | `THEOREM_DEP` | representation theory | `THEOREM_DEP_ACCEPTABLE` |
| 2019 | 8 | `OK` | - | `OK` |
| 2019 | 9 | `THEOREM_DEP` | Galois | `THEOREM_DEP_ACCEPTABLE` |
| 2019 | 10 | `THEOREM_DEP` | Galois | `THEOREM_DEP_ACCEPTABLE` |
| 2020 | 1 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2020 | 2 | `OK` | - | `OK` |
| 2020 | 3 | `OK` | - | `OK` |
| 2020 | 4 | `THEOREM_DEP` | Eisenstein | `THEOREM_DEP_ACCEPTABLE` |
| 2020 | 5 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2020 | 6 | `OK` | - | `OK` |
| 2021 | 1 | `THEOREM_DEP` | Frobenius, Galois | `THEOREM_DEP_ACCEPTABLE` |
| 2021 | 2 | `THEOREM_DEP` | Galois | `THEOREM_DEP_ACCEPTABLE` |
| 2021 | 3 | `OK` | - | `OK` |
| 2021 | 4 | `STATEMENT_RISK+THEOREM_DEP` | Galois, false | `STATEMENT_RISK_FIXED` |
| 2021 | 5 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | individual | `RESIDUAL_RISK` |
| 2021 | 6 | `OK` | - | `OK` |
| 2022 | 1 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | individual | `RESIDUAL_RISK` |
| 2022 | 2 | `OK` | - | `OK` |
| 2022 | 3 | `OK` | - | `OK` |
| 2022 | 4 | `OK` | - | `OK` |
| 2022 | 5 | `THEOREM_DEP` | Eisenstein | `THEOREM_DEP_ACCEPTABLE` |
| 2022 | 6 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2023 | 1 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2023 | 2 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2023 | 3 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Galois | `SOURCE_ALIGN_REVIEWED` |
| 2023 | 4 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | commutative algebra | `THEOREM_DEP_EXPANDED` |
| 2023 | 5 | `THEOREM_DEP+SOURCE_ALIGN_RISK` | Jordan normal form | `SOURCE_ALIGN_REVIEWED` |
| 2023 | 6 | `SOURCE_ALIGN_RISK` | - | `SOURCE_ALIGN_REVIEWED` |
| 2024 | 1 | `THEOREM_DEP` | structure theorem | `THEOREM_DEP_EXPANDED` |
| 2024 | 2 | `THEOREM_DEP` | Smith, Smith Normal Form | `THEOREM_DEP_EXPANDED` |
| 2024 | 3 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2024 | 4 | `OK` | - | `OK` |
| 2024 | 5 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2024 | 6 | `THEOREM_DEP` | Frobenius | `THEOREM_DEP_ACCEPTABLE` |
| 2025 | 1 | `THEOREM_DEP` | Galois, Kummer | `THEOREM_DEP_EXPANDED` |
| 2025 | 2 | `THEOREM_DEP` | Frobenius, representation theory | `THEOREM_DEP_EXPANDED` |
| 2025 | 3 | `OK` | - | `OK` |
| 2025 | 4 | `THEOREM_DEP` | Galois | `THEOREM_DEP_ACCEPTABLE` |
| 2025 | 5 | `THEOREM_DEP` | Galois | `THEOREM_DEP_ACCEPTABLE` |
| 2026 | 1 | `THEOREM_DEP` | - | `THEOREM_DEP_ACCEPTABLE` |
| 2026 | 2 | `OK` | - | `OK` |
| 2026 | 3 | `OK` | - | `OK` |
| 2026 | 4 | `THEOREM_DEP` | Eisenstein | `THEOREM_DEP_ACCEPTABLE` |
| 2026 | 5 | `THEOREM_DEP` | Eisenstein, Galois, Kummer | `THEOREM_DEP_EXPANDED` |

# 2025 Fall AI QE review: verification report

Date: 2026-08-10

## Scope

This run checks the expanded Fall 2025 study guide against the transcribed paper and the zero-background, past-paper-driven writing requirements used for Spring 2025.

## Source coverage

- Original problem nodes: 30 total, counted from the 13 questions in Part A, 3 in Part B, 9 in Part C, and 5 in Part D.
- Study-guide nodes: 30 total, with 13 A guides, 3 B guides, 9 C guides, and 5 D guides.
- Every original prompt is immediately followed by its corresponding guide in the main source; no Part has a separate, end-of-section solution block.
- Each Part retains one short Study map before its first problem, so the dependency structure remains visible without interrupting the problem-by-problem flow.
- A source-order check confirms 30 strict original-problem to same-number guide pairs.

## Pedagogical checks

- Every Part starts with a learning map or answer pattern.
- Each question has a stated core idea, notation or assumptions where needed, a derivation/reasoning route, and an exam-ready compression or marking note.
- The high-mark derivations are explicit: signed-interval VC dimension, strong convexity, concentric-circle PAC learning, projected SGD, universal approximation, diffusion ELBO/posterior, policy gradients, expected smoothness, MLN MAP scoring, topic-ontology LDA, and text-to-image diffusion.
- Ambiguities are surfaced rather than silently guessed: the policy-gradient occupancy normalization and the unspecified MLN world `x_1` are both called out in the guide.
- The universal-approximation construction explicitly clips the output to the requested codomain when the soft indicators do not already guarantee it.

## Source and style checks

- No `TODO`, `TBD`, `FIXME`, `PLACEHOLDER`, or `not implemented` markers in the Fall study-guide sources.
- No use of the disallowed `\bm{...}` or `\I` shortcuts in the added study-guide content.
- Display mathematics is separated from surrounding prose and the source compiles with the existing XeLaTeX/article style.
- No long-form solution was duplicated into the structure vault; the vault remains a navigation/scaffold layer.

## Build evidence

Build command: the repository LaTeX compile helper with TeX Live/XeLaTeX, output directory `build-qzc-qe-ai-2025-fall`.

- Exit code: 0.
- Output: 18-page A4 PDF.
- PDF size: 158,369 bytes.
- Log scan: no `Overfull`, `Underfull`, undefined-control-sequence, fatal-error, undefined-reference, or undefined-citation diagnostics.
- Text extraction contains all four study-guide headings and the added diffusion, policy-gradient, MLN, and posterior-mean anchors.
- Visual spot checks: pages 2, 10, and 17 rendered successfully without clipping or overlap. Page 2 confirms the intended immediate problem-to-guide sequence.

## Environment note

The standalone LaTeX doctor probe timed out after 120 seconds, while the actual XeLaTeX build and log checks completed successfully. Invoking `latexmk` from the repository root fails because the existing source intentionally resolves common TeX inputs relative to its own directory; use the compile helper or run from the Fall source directory.

## Remaining boundary

This is a complete Fall 2025 scaffold and worked study guide, not a substitute for solving under timed conditions. The structure vaults for all three exam terms remain separate and are not expanded with duplicated long derivations.

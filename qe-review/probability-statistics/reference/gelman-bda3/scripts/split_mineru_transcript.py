#!/usr/bin/env python3
"""Split the MinerU dump of Gelman et al., Bayesian Data Analysis 3rd ed."""

from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "mineru-md" / "_full.md"
OUT = ROOT / "mineru-md"

CHAPTER_SLUGS = {
    1: ("01-probability-and-inference", "Probability and Inference"),
    2: ("02-single-parameter-models", "Single-Parameter Models"),
    3: ("03-multiparameter-models", "Introduction to Multiparameter Models"),
    4: ("04-asymptotics-and-nonbayesian", "Asymptotics and Connections to Non-Bayesian Approaches"),
    5: ("05-hierarchical-models", "Hierarchical Models"),
    6: ("06-model-checking", "Model Checking"),
    7: ("07-evaluating-comparing-expanding", "Evaluating, Comparing, and Expanding Models"),
    8: ("08-modeling-data-collection", "Modeling Accounting for Data Collection"),
    9: ("09-decision-analysis", "Decision Analysis"),
    10: ("10-introduction-to-bayesian-computation", "Introduction to Bayesian Computation"),
    11: ("11-basics-of-markov-chain-simulation", "Basics of Markov Chain Simulation"),
    12: ("12-efficient-markov-chain-simulation", "Computationally Efficient Markov Chain Simulation"),
    13: ("13-modal-and-distributional-approximations", "Modal and Distributional Approximations"),
    14: ("14-introduction-to-regression-models", "Introduction to Regression Models"),
    15: ("15-hierarchical-linear-models", "Hierarchical Linear Models"),
    16: ("16-generalized-linear-models", "Generalized Linear Models"),
    17: ("17-models-for-robust-inference", "Models for Robust Inference"),
    18: ("18-models-for-missing-data", "Models for Missing Data"),
    19: ("19-parametric-nonlinear-models", "Parametric Nonlinear Models"),
    20: ("20-basis-function-models", "Basis Function Models"),
    21: ("21-gaussian-process-models", "Gaussian Process Models"),
    22: ("22-finite-mixture-models", "Finite Mixture Models"),
    23: ("23-dirichlet-process-models", "Dirichlet Process Models"),
}

APPENDIX_SLUGS = {
    "A": ("a-standard-probability-distributions", "Appendix A — Standard Probability Distributions"),
    "B": ("b-outline-of-proofs", "Appendix B — Outline of Proofs from Chapter 4"),
    "C": ("c-computation-in-r-and-stan", "Appendix C — Computation in R and Stan"),
}

CHAPTER_RE = re.compile(r"^# Chapter (\d+)\s*$")
SECTION_START_RE = re.compile(r"^# (\d+)\.1\b")
APPENDIX_RE = re.compile(r"^# Appendix ([A-C])\s*$")
REFERENCES_RE = re.compile(r"^# References\s*$")


def parse_segments(lines: list[str]) -> list[tuple[str, str, str, int, int]]:
    markers: list[tuple[int, str, str, str]] = []
    seen_chapters: set[int] = set()
    state = "front"

    for i, raw in enumerate(lines):
        line = raw.rstrip("\n")
        if state == "front":
            if line == "# Chapter 1":
                markers.append((0, "front", "00-frontmatter", "Front matter (title, contents, preface)"))
                markers.append((i, "chapter", *CHAPTER_SLUGS[1]))
                seen_chapters.add(1)
                state = "body"
            continue

        if state == "body":
            m = CHAPTER_RE.match(line)
            if m:
                n = int(m.group(1))
                if n in CHAPTER_SLUGS and n not in seen_chapters:
                    markers.append((i, "chapter", *CHAPTER_SLUGS[n]))
                    seen_chapters.add(n)
                continue
            m = SECTION_START_RE.match(line)
            if m:
                n = int(m.group(1))
                if n in CHAPTER_SLUGS and n not in seen_chapters:
                    markers.append((i, "chapter", *CHAPTER_SLUGS[n]))
                    seen_chapters.add(n)
                continue
            m = APPENDIX_RE.match(line)
            if m and m.group(1) == "A":
                markers.append((i, "appendix", *APPENDIX_SLUGS["A"]))
                state = "appendix"
            continue

        if state == "appendix":
            m = APPENDIX_RE.match(line)
            if m and m.group(1) in APPENDIX_SLUGS:
                markers.append((i, "appendix", *APPENDIX_SLUGS[m.group(1)]))
                continue
            if REFERENCES_RE.match(line):
                markers.append((i, "references", "z-references", "References"))
                state = "references"

    segments: list[tuple[str, str, str, int, int]] = []
    for j, (start, key, slug, title) in enumerate(markers):
        end = markers[j + 1][0] if j + 1 < len(markers) else len(lines)
        segments.append((key, slug, title, start, end))
    return segments


NAV_ORDER = [
    ("00-frontmatter", "Front matter"),
    ("01-probability-and-inference", "Ch. 1 Probability and Inference"),
    ("02-single-parameter-models", "Ch. 2 Single-Parameter Models"),
    ("03-multiparameter-models", "Ch. 3 Multiparameter Models"),
    ("04-asymptotics-and-nonbayesian", "Ch. 4 Asymptotics"),
    ("05-hierarchical-models", "Ch. 5 Hierarchical Models"),
    ("06-model-checking", "Ch. 6 Model Checking"),
    ("07-evaluating-comparing-expanding", "Ch. 7 Evaluating Models"),
    ("08-modeling-data-collection", "Ch. 8 Data Collection"),
    ("09-decision-analysis", "Ch. 9 Decision Analysis"),
    ("10-introduction-to-bayesian-computation", "Ch. 10 Computation"),
    ("11-basics-of-markov-chain-simulation", "Ch. 11 MCMC Basics"),
    ("12-efficient-markov-chain-simulation", "Ch. 12 Efficient MCMC"),
    ("13-modal-and-distributional-approximations", "Ch. 13 Approximations"),
    ("14-introduction-to-regression-models", "Ch. 14 Regression"),
    ("15-hierarchical-linear-models", "Ch. 15 Hierarchical Linear Models"),
    ("16-generalized-linear-models", "Ch. 16 GLMs"),
    ("17-models-for-robust-inference", "Ch. 17 Robust Inference"),
    ("18-models-for-missing-data", "Ch. 18 Missing Data"),
    ("19-parametric-nonlinear-models", "Ch. 19 Nonlinear Models"),
    ("20-basis-function-models", "Ch. 20 Basis Functions"),
    ("21-gaussian-process-models", "Ch. 21 Gaussian Processes"),
    ("22-finite-mixture-models", "Ch. 22 Finite Mixtures"),
    ("23-dirichlet-process-models", "Ch. 23 Dirichlet Processes"),
    ("a-standard-probability-distributions", "App. A Distributions"),
    ("b-outline-of-proofs", "App. B Proofs"),
    ("c-computation-in-r-and-stan", "App. C R and Stan"),
    ("z-references", "References"),
]


def nav_links(slug: str) -> str:
    slugs = [item[0] for item in NAV_ORDER]
    idx = slugs.index(slug)
    prev_link = f"[← {NAV_ORDER[idx - 1][1]}](./{NAV_ORDER[idx - 1][0]}.md)" if idx > 0 else "—"
    next_link = f"[{NAV_ORDER[idx + 1][1]} →](./{NAV_ORDER[idx + 1][0]}.md)" if idx + 1 < len(NAV_ORDER) else "—"
    return (
        f"[Package map](../structure.md) · [Unsplit OCR dump](./_full.md)\n\n"
        f"{prev_link} · {next_link}"
    )


def write_chapter(slug: str, title: str, kind: str, body: str) -> None:
    header = (
        "---\n"
        f'title: "{title}"\n'
        "source: Gelman, Carlin, Stern, Dunson, Vehtari, Rubin, Bayesian Data Analysis, 3rd ed., CRC 2013\n"
        "kind: mineru-transcript-chapter\n"
        f"part: {kind}\n"
        "canonical_pdf: ../Bayesian-Data-Analysis-3rd.pdf\n"
        "---\n\n"
        f"# {title}\n\n"
        f"{nav_links(slug)}\n\n"
        "> MinerU OCR dump. If a formula, table, or numbering disagrees with the PDF, the PDF is authoritative.\n\n"
        "---\n\n"
    )
    (OUT / f"{slug}.md").write_text(header + body, encoding="utf-8")


def main() -> None:
    text = SRC.read_text(encoding="utf-8")
    lines = text.splitlines(keepends=True)
    segments = parse_segments(lines)
    if not segments:
        raise SystemExit("no chapter markers found")

    written = []
    for kind, slug, title, start, end in segments:
        body = "".join(lines[start:end]).lstrip("\n")
        write_chapter(slug, title, kind, body)
        written.append((slug, start + 1, end, end - start))

    print("wrote", len(written), "files")
    for slug, start, end, nlines in written:
        print(f"  {slug:48} lines {start:>6}-{end:<6} ({nlines} lines)")


if __name__ == "__main__":
    main()

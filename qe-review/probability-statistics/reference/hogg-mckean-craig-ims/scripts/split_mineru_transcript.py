#!/usr/bin/env python3
"""Split the MinerU dump of Hogg–McKean–Craig (8th ed.) into chapter files."""

from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "mineru-md" / "_full.md"
OUT = ROOT / "mineru-md"

CHAPTER_SLUGS = {
    1: ("01-probability-and-distributions", "Probability and Distributions"),
    2: ("02-multivariate-distributions", "Multivariate Distributions"),
    3: ("03-some-special-distributions", "Some Special Distributions"),
    4: ("04-some-elementary-statistical-inferences", "Some Elementary Statistical Inferences"),
    5: ("05-consistency-and-limiting-distributions", "Consistency and Limiting Distributions"),
    6: ("06-maximum-likelihood-methods", "Maximum Likelihood Methods"),
    7: ("07-sufficiency", "Sufficiency"),
    8: ("08-optimal-tests-of-hypotheses", "Optimal Tests of Hypotheses"),
    9: ("09-inferences-about-normal-linear-models", "Inferences About Normal Linear Models"),
    10: ("10-nonparametric-and-robust-statistics", "Nonparametric and Robust Statistics"),
    11: ("11-bayesian-statistics", "Bayesian Statistics"),
}

APPENDIX_SLUGS = {
    "A": ("a-mathematical-comments", "Appendix A — Mathematical Comments"),
    "B": ("b-r-primer", "Appendix B — R Primer"),
    "C": ("c-lists-of-common-distributions", "Appendix C — Lists of Common Distributions"),
    "D": ("d-tables-of-distributions", "Appendix D — Tables of Distributions"),
    "E": ("e-references", "Appendix E — References"),
}

CHAPTER_RE = re.compile(r"^# Chapter (\d+)\s*$")
APPENDIX_RE = re.compile(r"^# Appendix ([A-F])\s*$")


def parse_segments(lines: list[str]) -> list[tuple[str, str, str, int, int]]:
    """Return (key, slug, title, start, end) with end exclusive, 0-based."""
    markers: list[tuple[int, str, str, str]] = []
    state = "front"

    for i, raw in enumerate(lines):
        line = raw.rstrip("\n")
        if state == "front":
            if line == "# Chapter 1":
                markers.append((0, "front", "00-frontmatter", "Front matter (title, contents, preface)"))
                markers.append((i, "chapter", *CHAPTER_SLUGS[1]))
                state = "body"
            continue

        if state == "body":
            m = CHAPTER_RE.match(line)
            if m:
                n = int(m.group(1))
                if n in CHAPTER_SLUGS:
                    markers.append((i, "chapter", *CHAPTER_SLUGS[n]))
                continue
            m = APPENDIX_RE.match(line)
            if m and m.group(1) == "A":
                markers.append((i, "appendix", *APPENDIX_SLUGS["A"]))
                state = "appendix"
            continue

        if state == "appendix":
            m = APPENDIX_RE.match(line)
            if m:
                letter = m.group(1)
                if letter == "F":
                    markers.append(
                        (i, "answers", "f-answers-to-selected-exercises", "Appendix F — Answers to Selected Exercises")
                    )
                    state = "answers"
                elif letter in APPENDIX_SLUGS:
                    markers.append((i, "appendix", *APPENDIX_SLUGS[letter]))
            continue

        if state == "answers" and line == "# Index":
            markers.append((i, "index", "z-index", "Index"))
            state = "index"

    segments: list[tuple[str, str, str, int, int]] = []
    for j, (start, key, slug, title) in enumerate(markers):
        end = markers[j + 1][0] if j + 1 < len(markers) else len(lines)
        segments.append((key, slug, title, start, end))
    return segments


NAV_ORDER = [
    ("00-frontmatter", "Front matter"),
    ("01-probability-and-distributions", "Ch. 1 Probability and Distributions"),
    ("02-multivariate-distributions", "Ch. 2 Multivariate Distributions"),
    ("03-some-special-distributions", "Ch. 3 Some Special Distributions"),
    ("04-some-elementary-statistical-inferences", "Ch. 4 Elementary Statistical Inferences"),
    ("05-consistency-and-limiting-distributions", "Ch. 5 Consistency and Limiting Distributions"),
    ("06-maximum-likelihood-methods", "Ch. 6 Maximum Likelihood Methods"),
    ("07-sufficiency", "Ch. 7 Sufficiency"),
    ("08-optimal-tests-of-hypotheses", "Ch. 8 Optimal Tests of Hypotheses"),
    ("09-inferences-about-normal-linear-models", "Ch. 9 Normal Linear Models"),
    ("10-nonparametric-and-robust-statistics", "Ch. 10 Nonparametric and Robust Statistics"),
    ("11-bayesian-statistics", "Ch. 11 Bayesian Statistics"),
    ("a-mathematical-comments", "App. A Mathematical Comments"),
    ("b-r-primer", "App. B R Primer"),
    ("c-lists-of-common-distributions", "App. C Common Distributions"),
    ("d-tables-of-distributions", "App. D Tables"),
    ("e-references", "App. E References"),
    ("f-answers-to-selected-exercises", "App. F Selected Answers"),
    ("z-index", "Index"),
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
        "source: Hogg, McKean, Craig, Introduction to Mathematical Statistics, 8th ed., Pearson 2019\n"
        "kind: mineru-transcript-chapter\n"
        f"part: {kind}\n"
        "canonical_pdf: ../Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics.pdf\n"
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
        print(f"  {slug:44} lines {start:>6}-{end:<6} ({nlines} lines)")


if __name__ == "__main__":
    main()

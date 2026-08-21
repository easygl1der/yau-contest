# Provenance

Copied 2026-08-15 from Mac Mini `aca-workflow` (aca-reader) into this QE reference shelf.

## Remote originals

Host: `macmini` (`yueyhs-Mac-mini-2.local`)

| Artifact | Remote path |
| --- | --- |
| PDF | `~/Projects/aca-workflow/PDFs/statistic/Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics.pdf` |
| MinerU dump | `~/Projects/aca-workflow/PDFs/statistic/transcript/Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics/hybrid_ocr/Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics.md` |
| MinerU images (2876 files on disk; 65 referenced) | `.../hybrid_ocr/images/` |
| Exam checklist | `~/Projects/aca-workflow/PDFs/statistic/备考指南.md` |
| Lecture notes | `~/Projects/aca-workflow/notes/mathematical-statistics/` |

## Bibliographic record (from the PDF / MinerU title pages)

- Hogg, Robert V.; McKean, Joseph W.; Craig, Allen T.
- *Introduction to Mathematical Statistics*, Eighth Edition
- Pearson, 2019
- ISBN 978-0-13-468699-8
- LCCN 2017033015
- 762 pages

## What was not copied

Large MinerU intermediates stay on the Mac Mini: `_layout.pdf` (~80 MB), `_origin.pdf` (~63 MB), `*_middle.json` / `*_model.json` / `*_content_list*.json`, and the 28 MB unused image dump. Only the 65 images actually referenced by the Markdown were copied.

## Regeneration

To re-split the MinerU dump after replacing `mineru-md/_full.md`:

```bash
python3 scripts/split_mineru_transcript.py
```

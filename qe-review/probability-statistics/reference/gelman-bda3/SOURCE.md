# Provenance

Copied 2026-08-15 from Mac Mini `aca-workflow` (aca-reader) into this QE reference shelf.

## Remote originals

Host: `macmini` (`yueyhs-Mac-mini-2.local`)

| Artifact | Remote path |
| --- | --- |
| PDF | `~/Projects/aca-workflow/PDFs/bayesian/textbook/Bayesian_Data_Analysis_Carlin,_John_B_Dunson,_David_B_Gelman_etc.pdf` |
| MinerU dump | `~/Projects/aca-workflow/PDFs/bayesian/textbook/transcript/Bayesian_Data_Analysis_Carlin,_John_B_Dunson,_David_B_Gelman_etc/hybrid_ocr/Bayesian_Data_Analysis_Carlin,_John_B_Dunson,_David_B_Gelman_etc.md` |
| MinerU images (1253 files on disk; 287 referenced) | `.../hybrid_ocr/images/` |
| Lecture notes | `~/Projects/aca-workflow/notes/bayesian/` |

## Bibliographic record

- Gelman, Andrew; Carlin, John B.; Stern, Hal S.; Dunson, David B.; Vehtari, Aki; Rubin, Donald B.
- *Bayesian Data Analysis*, Third Edition
- CRC Press / Chapman & Hall, 2013
- 656 pages

This is the core Bayesian textbook on the Mac Mini `PDFs/bayesian/textbook/` shelf. Congdon, Gilks *MCMC in Practice*, and Robert–Casella *Monte Carlo Statistical Methods* were left on the Mini; they are computational companions, not the QE core.

## What was not copied

Large MinerU intermediates stay on the Mac Mini: `_layout.pdf` (~66 MB), `_origin.pdf` (~48 MB), `*_middle.json` / `*_model.json` / `*_content_list*.json`, and unused images. Only the 287 images actually referenced by the Markdown were copied.

## Regeneration

To re-split the MinerU dump after replacing `mineru-md/_full.md`:

```bash
python3 scripts/split_mineru_transcript.py
```

MinerU missed a few `# Chapter N` headings (Ch. 6, 11, 15, 20, 22, 23). The splitter also starts those chapters at the first `# N.1` section heading.

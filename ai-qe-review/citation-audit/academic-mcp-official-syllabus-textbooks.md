# Official Syllabus Textbook Citation Audit

Date: 2026-07-20

## Scope and Method

This audit covers the ten textbooks named in the Qiuzhen College AI qualifying-exam syllabus. It used Academic MCP searches across Crossref and OpenAlex, followed by DOI-detail lookups when a canonical DOI was available. Results were compared with the publisher or author URLs already stored in `refs.bib` and with local title pages where a local PDF exists.

Academic-index records for books are sometimes incomplete or represent a review, a chapter, or a later reprint rather than the cited edition. A field was changed only when the title, authorship, edition, or DOI matched the intended textbook.

## Verified and Updated

- `shalev2014uml`: Academic MCP resolved the 2014 Cambridge book by Shai Shalev-Shwartz and Shai Ben-David and confirmed DOI `10.1017/CBO9781107298019`.
- `bishop2023deep`: Academic MCP resolved the Bishop and Bishop Springer record as a 2024 book with DOI `10.1007/978-3-031-45468-4`. The prior 2023 value reflected release timing, while the formal book record uses 2024.
- `szeliski2022vision`: Academic MCP resolved the 2022 second edition and DOI `10.1007/978-3-030-34372-9`.
- `nesterov2018convex`: the authoritative Springer record identifies the 2018 book as edition 2 and uses DOI `10.1007/978-3-319-91578-4`.
- `beck2017first`: Academic MCP resolved the 2017 SIAM book and DOI `10.1137/1.9781611974997`.
- `jurafsky2026slp`: the locally stored title page identifies the source as the third-edition draft dated January 6, 2026, with the full subtitle now preserved in the citation.

## Retained Without Metadata Substitution

- `mohri2018foundations`: retained as the 2018 second edition by Mohri, Rostamizadeh, and Talwalkar. Search results included a 2019 review rather than a more authoritative book record.
- `goodfellow2016deep`: retained as the 2016 MIT Press book. Search results primarily returned reviews and related papers, not a superior bibliographic record.
- `bishop2006prml`: retained as the 2006 Springer book by Christopher M. Bishop. Academic MCP did not return a complete book-level record for this title, so no speculative DOI was added.
- `goldberg2017nnnlp`: retained as the 2017 Morgan & Claypool edition with DOI `10.2200/S00762ED1V01Y201703HLT037`. Academic MCP also returned a 2023 Springer reprint; that is not substituted for the syllabus-era original edition.

## Result

`refs.bib` now contains DOI fields where the intended edition was confirmed, preserves the original 2017 Goldberg edition, and distinguishes the Jurafsky--Martin online draft from a fixed publisher edition.

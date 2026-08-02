# Purpose and Use

This package supports the Artificial Intelligence doctoral qualifying examination (QE-AI) at Qiuzhen College, Tsinghua University. It is organized around publicly released examination papers, the official syllabus, and the designated textbooks; consult [[references]] for the underlying sources.

Questions are organized by question number, topic, and essential assumptions rather than reproducing the papers verbatim. When interpreting a question, defer to the version published by the College.

## Study Method

Each of the four sections is worth 33 points. Candidates ordinarily choose three of the four sections; one additional point concerns identification information. A three-pass study plan is recommended:

1. Read [[01-syllabus|Examination Syllabus and Topic Map]] and [[02-primer|Theoretical Foundations]] first, establishing a shared notation for the four core courses.

2. Work through [[03-2025-spring|Spring 2025 QE-AI Past-Exam Solutions]]--[[05-2026-spring|Spring 2026 QE-AI Past-Exam Solutions]] chronologically. Attempt each solution independently before comparing it with the derivation.

3. Use the [[90-checklists|Pre-Exam Checklist and Incremental Study Plan]] to identify gaps, with particular attention to PAC/VC theory, proximal SGD, diffusion models, policy gradients, Transformers, and RAG/MLN.

## Solution Style

Each solution follows the same discipline:

- state the mathematical content of the question without relying on the original PDF layout;
- present the central formula or construction;
- provide a self-contained derivation when a proof is required; and
- distinguish a strict conclusion from a conventional examination-context answer when the question is ambiguous.

These notes complement rather than replace the textbooks. For the machine-learning-theory core, consult [@shalev2014uml; @mohri2018foundations]; for deep learning and generative models, consult [@goodfellow2016deep; @bishop2023deep; @bishop2006prml]; for optimization, consult [@nesterov2018convex; @beck2017first]; and for NLP, consult [@jurafsky2026slp; @goldberg2017nnnlp].

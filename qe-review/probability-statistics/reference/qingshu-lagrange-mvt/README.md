# 清疏第 11 届讲义切片：Lagrange-MVT / Euler \(\gamma\) / 奇调和和

Support for QE Prob-Stat 2026 Spring Problem 3:

\[
E_n=\sum_{k=1}^n\frac{1}{2k-1}=H_{2n}-\tfrac12 H_n=\tfrac12\ln n+\ln 2+\tfrac12\gamma+o(1).
\]

Do **not** send the full 1028-page book to MinerU. Slices were cut with pypdf (1-based original pages).

| Slice PDF | Original pages | MinerU Markdown | Key objects |
|---|---|---|---|
| `qingshu-ch7-mvt-sums.pdf` | 22–41 | [`mineru-md/qingshu-ch7-mvt-sums.md`](mineru-md/qingshu-ch7-mvt-sums.md) | Ex 7.5: \(\gamma:=\lim(H_n-\ln n)\); MVT / Stolz / \(\sum k^\alpha\ln^\beta k\) |
| `qingshu-ch7-ex717-mvt.pdf` | 68–77 | [`mineru-md/qingshu-ch7-ex717-mvt.md`](mineru-md/qingshu-ch7-ex717-mvt.md) | Ex 7.17: slogan “拉格朗日中值定理保持阶不变” |
| `qingshu-ch8-ex824-odd-harmonic.pdf` | 108–117 | [`mineru-md/qingshu-ch8-ex824-odd-harmonic.md`](mineru-md/qingshu-ch8-ex824-odd-harmonic.md) | Ex 8.24: \(\sum_{k=1}^n 2/(2k-1)=2H_{2n}-H_n=\ln n+2\ln 2+\gamma+o(1)\) |

Divide the last identity by 2 to get the QE expansion of \(E_n\).

Full book (common shelf): [`qe-review/common/reference/qingshu-11th-contest-notes/`](../../../common/reference/qingshu-11th-contest-notes/README.md).
Exam remark already pointing here: `qe-review/probability-statistics/transcribed_exams/2026-spring/qzc-qe-probstat-2026-spring.tex` (`rem:p3-qingshu-mvt`).

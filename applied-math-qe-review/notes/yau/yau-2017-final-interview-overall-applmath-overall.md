# 2017 丘赛 总决赛面试 overall

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2017-final-interview-overall-applmath-overall.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2017-final-interview-overall-applmath-overall/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2017-final-interview-overall-applmath-overall-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## Oral Exam for All Round: Applied and Computational Mathematics 2017

## 1. Consider a vector-valued ODE:

$$
m_{t} = - a \times m,
$$

where $a =(a_{1}, a_{2}, a_{3})^{T}$ is a non-zero real constant vector, and $m(t) =(m_{1}(t), m_{2}(t), m_{3}(t))^{T}$ is the unknown vector-valued function.

Consider a uniform time sequence

$$
0 = t_{0} < t_{1} < \dots < t_{k} < \dots,
$$

with $t_{k} = k \Delta t$ , and the explicit time marching scheme:

$$
\frac{m^{n + 1} - m^{n}}{\Delta t} = - a \times m^{n},
$$

(a) Analyse the stability of the scheme.

(b) Propose a numerical strategy to improve the scheme so that the new scheme has better stability.

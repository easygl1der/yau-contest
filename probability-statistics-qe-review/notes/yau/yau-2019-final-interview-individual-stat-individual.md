# 2019 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2019-final-interview-individual-stat-individual.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2019-final-interview-individual-stat-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2019-final-interview-individual-stat-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## May 2019

## 题 1

^yau-2019-final-interview-individual-stat-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2019-final-interview-individual-stat-individual-solutions.md#^yau-2019-final-interview-individual-stat-individual-s1)。

Suppose we have n pairs of observations $(X_{i}, Y_{i}), \i = 1, \dots, n$ . Suppose we fit a simple linear regression with $Y$ as the response variable and the value of the regression coeficient estimator is 1. What happens if the role of X and Y are switched, i.e., we fit a simple regression with X as the response variable?

## 题 2

^yau-2019-final-interview-individual-stat-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2019-final-interview-individual-stat-individual-solutions.md#^yau-2019-final-interview-individual-stat-individual-s2)。

A math test consists of 10 questions. For each question, one either answers it correctly $(Y = 1)$ or incorrectly $(Y = 0)$ . Thus for a test taker, his/her answers consist of $Y_{1}, \ldots, Y_{10}$ , where $Y_{i}$ is the answer to the ith question and takes value 1 or 0. Suppose a reasonable statistical model is that for each student, his/her responses to the 10 questions are independent Bernoulli variables with the following specification:

$$
P(Y_{i} = 1) = 1 - P(Y_{i} = 0) = \frac{e^{\theta - b_{i}}}{1 + e^{\theta - b_{i}}}, \quad i = 1, \ldots, 10,
$$

where θ is his/her math ability (diferent students have diferent θ values) and $b_{i}$ is the dificult level for the ith question. The test is designed, of course, to find out the test taker’s θ value. This model implies that a person with higher θ value has a larger probability to answer a question correctly, while a more dificult question (larger b value) make the probability of a correct answer smaller. The teacher allocates 10 points equally to each of the 10 questions for the total of 100 points for the test.

Suppose that student A answered two easiest questions (2 smallest $b_{i}$ values) incorrectly thus scoring 80 out of 100 and that student B answered two most dificult questions (2 largest $b_{i}$ values) incorrectly thus also scoring 80 out of 100. Student A claims that it is unfair to him (in comparison to student B) because his 8 correct answers are on the more dificult questions. And more dificult questions should worth more points. Do you think student A has a valid point? Do you think the teacher’s scoring system is fair? Explain your thinking from the statistical perspective.

## 题 3

^yau-2019-final-interview-individual-stat-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2019-final-interview-individual-stat-individual-solutions.md#^yau-2019-final-interview-individual-stat-individual-s3)。

Two research centers, A and B, collected two separate data sets to study relationship between two variables X and Y . Center A looked at its data, denoted by $(X_{1}, Y_{1}), \dots,(X_{m}, Y_{m})$ , and found a positive correlation. Center B also looked at its own data, denoted by $(X_{m + 1}, Y_{m + 1}), \dots,(X_{m + n}, Y_{m + n})$ and also found a positive correlation. Now a new researcher pooled the two data set together into a larger one, $(X_{1}, Y_{1}), \dots,(X_{m + n}, Y_{m + n})$ . He claims that for the pooled data set, X and $Y$ are negatively correlated. Do you think this is possible? Explain your answer.

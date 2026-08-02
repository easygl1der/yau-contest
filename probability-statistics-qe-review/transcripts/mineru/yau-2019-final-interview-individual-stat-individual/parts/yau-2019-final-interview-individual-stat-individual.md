# Statistics problems: individual contest

## May 2019

1. Suppose we have n pairs of observations $( X _ { i } , Y _ { i } ) , \ i = 1 , \dots , n$ . Suppose we fit a simple linear regression with $Y$ as the response variable and the value of the regression coeficient estimator is 1. What happens if the role of X and Y are switched, i.e., we fit a simple regression with X as the response variable?

2. A math test consists of 10 questions. For each question, one either answers it correctly $( Y = 1 )$ or incorrectly $( Y = 0 )$ . Thus for a test taker, his/her answers consist of $Y _ { 1 } , \ldots , Y _ { 1 0 }$ , where $Y _ { i }$ is the answer to the ith question and takes value 1 or 0. Suppose a reasonable statistical model is that for each student, his/her responses to the 10 questions are independent Bernoulli variables with the following specification:

$$
P (Y _ {i} = 1) = 1 - P (Y _ {i} = 0) = \frac {e ^ {\theta - b _ {i}}}{1 + e ^ {\theta - b _ {i}}}, \quad i = 1, \ldots , 1 0,
$$

where θ is his/her math ability (diferent students have diferent θ values) and $b _ { i }$ is the dificult level for the ith question. The test is designed, of course, to find out the test taker’s θ value. This model implies that a person with higher θ value has a larger probability to answer a question correctly, while a more dificult question (larger b value) make the probability of a correct answer smaller. The teacher allocates 10 points equally to each of the 10 questions for the total of 100 points for the test.

Suppose that student A answered two easiest questions (2 smallest $b _ { i }$ values) incorrectly thus scoring 80 out of 100 and that student B answered two most dificult questions (2 largest $b _ { i }$ values) incorrectly thus also scoring 80 out of 100. Student A claims that it is unfair to him (in comparison to student B) because his 8 correct answers are on the more dificult questions. And more dificult questions should worth more points. Do you think student A has a valid point? Do you think the teacher’s scoring system is fair? Explain your thinking from the statistical perspective.

3. Two research centers, A and B, collected two separate data sets to study relationship between two variables X and Y . Center A looked at its data, denoted by $( X _ { 1 } , Y _ { 1 } ) , \dots , ( X _ { m } , Y _ { m } )$ , and found a positive correlation. Center B also looked at its own data, denoted by $( X _ { m + 1 } , Y _ { m + 1 } ) , \dots , ( X _ { m + n } , Y _ { m + n } )$ and also found a positive correlation. Now a new researcher pooled the two data set together into a larger one, $( X _ { 1 } , Y _ { 1 } ) , \dots , ( X _ { m + n } , Y _ { m + n } )$ . He claims that for the pooled data set, X and $Y$ are negatively correlated. Do you think this is possible? Explain your answer.
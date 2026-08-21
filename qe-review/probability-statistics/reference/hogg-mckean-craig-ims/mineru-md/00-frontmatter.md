---
title: "Front matter (title, contents, preface)"
source: Hogg, McKean, Craig, Introduction to Mathematical Statistics, 8th ed., Pearson 2019
kind: mineru-transcript-chapter
part: front
canonical_pdf: ../Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics.pdf
---

# Front matter (title, contents, preface)

[Package map](../structure.md) · [Unsplit OCR dump](./_full.md)

— · [Ch. 1 Probability and Distributions →](./01-probability-and-distributions.md)

> MinerU OCR dump. If a formula, table, or numbering disagrees with the PDF, the PDF is authoritative.

---

# Introduction toz# Mathematical Statistics

Eighth Edition

Hogg

McKean

Craig

This page intentionally left blank

# Introduction to Mathematical Statistics

Eighth Edition

Robert V. Hogg

University of Iowa

Joseph W. McKean  
Western Michigan University

Allen T. Craig  
Late Professor of Statistics  
University of Iowa

Director, Portfolio Management: Deirdre Lynch  
Courseware Portfolio Manager: Patrick Barbera  
Portfolio Management Assistant: Morgan Danna  
Content Producer: Lauren Morse  
Managing Producer: Scott Disanno  
Product Marketing Manager: Yvonne Vannatta  
Field Marketing Manager: Evan St. Cyr  
Marketing Assistant: Jon Bryant  
Senior Author Support/Technology Specialist: Jo  
Manager, Rights and Permissions: Gina Cheselka  
Manufacturing Buyer: Carol Melville, LSC Comm  
Art Director: Barbara Atkinson  
Production Coordination and Illustrations: Integ  
Cover Design: Studio Montage  
Cover Image: Aleksandarvelasevic/Digital Vision

Copyright ©2019, 2013, 2005 by Pearson Education, Inc. All Rights Reserved. Printed in the United States of America. This publication is protected by copyright, and permission should be obtained from the publisher prior to any prohibited reproduction, storage in a retrieval system, or transmission in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise. For information regarding permissions, request forms and the appropriate contacts within the Pearson Education Global Rights & Permissions department, please visit www.pearsoned.com/permissions/.

PEARSON and ALWAYS LEARNING are exclusive trademarks owned by Pearson Education, Inc. or its affiliates in the U.S. and/or other countries. Unless otherwise indicated herein, any third-party trademarks that may appear in this work are the property of their respective owners and any references to third-party trademarks, logos or other trade dress are for demonstrative or descriptive purposes only. Such references are not intended to imply any sponsorship, endorsement, authorization, or promotion of Pearson's products by the owners of such marks, or any relationship between the owner and Pearson Education, Inc. or its affiliates, authors, licensees or distributors.

# Library of Congress Cataloging-in-Publications Data

Names: Hogg, Robert V., author. | McKean, Joseph W., 1944- author. | Craig, Allen T. (Allen Thornton), 1905- author.

Title: Introduction to mathematical statistics / Robert V. Hogg, Late Professor of Statistics, University of Iowa, Joseph W. McKean, Western Michigan University, Allen T. Craig, Late Professor of Statistics, University of Iowa.

Description: Eighth edition. | Boston : Pearson, [2019] | Includes bibliographical references and index.

Identifiers: LCCN 2017033015| ISBN 9780134686998 | ISBN 0134686993

Subjects: LCSH: Mathematical statistics.

Classification: LCC QA276 .H59 2019 | DDC 519.5-dc23 LC record available at

https://lccn.loc.gov/2017033015

ISBN 13:978-0-13-468699-8

Dedicated to my wife Marge and to the memory of Bob Hogg

This page intentionally left blank

# Contents

# Preface xi

# 1 Probability and Distributions 1

1.1 Introduction 1   
1.2 Sets 3

1.2.1 Review of Set Theory 4   
1.2.2 Set Functions 7

1.3 The Probability Set Function 12

1.3.1 Counting Rules 16   
1.3.2 Additional Properties of Probability 18

1.4 Conditional Probability and Independence 23

1.4.1 Independence 28   
1.4.2 Simulations 31

1.5 Random Variables 37   
1.6 Discrete Random Variables 45

1.6.1 Transformations 47

1.7 Continuous Random Variables 49

1.7.1 Quantiles 51   
1.7.2 Transformations 53   
1.7.3 Mixtures of Discrete and Continuous Type Distributions 56

1.8 Expectation of a Random Variable 60   
1.8.1 R Computation for an Estimation of the Expected Gain 65

1.9 Some Special Expectations 68   
1.10 Important Inequalities 78

# 2 Multivariate Distributions 85

2.1Distributions of Two Random Variables 85

2.1.1 Marginal Distributions 89   
2.1.2 Expectation 93

2.2 Transformations: Bivariate Random Variables 100   
2.3 Conditional Distributions and Expectations 109   
2.4 Independent Random Variables 117   
2.5 The Correlation Coefficient 125   
2.6 Extension to Several Random Variables 134

2.6.1 *Multivariate Variance-Covariance Matrix 140

2.7 Transformations for Several Random Variables 143   
2.8 Linear Combinations of Random Variables 151

# 3 Some Special Distributions 155

3.1 The Binomial and Related Distributions 155

3.1.1 Negative Binomial and Geometric Distributions 159   
3.1.2 Multinomial Distribution 160   
3.1.3 Hypergeometric Distribution 162

3.2 The Poisson Distribution 167   
3.3 The $\Gamma, \chi^2$ , and $\beta$ Distributions 173

3.3.1 The $\chi^2$ -Distribution 178   
3.3.2 The $\beta$ -Distribution 180

3.4 The Normal Distribution 186

3.4.1 \*Contaminated Normals 193

3.5 The Multivariate Normal Distribution 198

3.5.1 Bivariate Normal Distribution 198   
3.5.2 *Multivariate Normal Distribution, General Case 199   
3.5.3 \*Applications 206

3.6 $t$ - and $F$ -Distributions 210

3.6.1 The $t$ -distribution 210   
3.6.2 The $F$ -distribution 212   
3.6.3 Student's Theorem 214

3.7 *Mixture Distributions 218

# 4 Some Elementary Statistical Inferences 225

4.1 Sampling and Statistics 225

4.1.1 Point Estimators 226   
4.1.2 Histogram Estimates of pmfs and pdfs 230

4.2 Confidence Intervals 238

4.2.1 Confidence Intervals for Difference in Means 241   
4.2.2 Confidence Interval for Difference in Proportions 243

4.3 \*Confidence Intervals for Parameters of Discrete Distributions 248   
4.4 Order Statistics 253

4.4.1 Quantiles 257   
4.4.2 Confidence Intervals for Quantiles 261

4.5 Introduction to Hypothesis Testing 267   
4.6 Additional Comments About Statistical Tests 275

4.6.1 Observed Significance Level, $p$ -value 279

4.7 Chi-Square Tests 283   
4.8 The Method of Monte Carlo 292

4.8.1 Accept-Reject Generation Algorithm 298

4.9 Bootstrap Procedures 303

4.9.1 Percentile Bootstrap Confidence Intervals 303   
4.9.2 Bootstrap Testing Procedures 308

4.10 \*Tolerance Limits for Distributions 315

# 5 Consistency and Limiting Distributions 321

5.1 Convergence in Probability 321   
5.1.1 Sampling and Statistics 324   
5.2 Convergence in Distribution 327   
5.2.1 Bounded in Probability 333   
5.2.2 $\Delta$ -Method 334   
5.2.3 Moment Generating Function Technique 336   
5.3 Central Limit Theorem 341   
5.4 *Extensions to Multivariate Distributions 348

# 6 Maximum Likelihood Methods 355

6.1 Maximum Likelihood Estimation 355   
6.2 Rao-Cramér Lower Bound and Efficiency 362   
6.3 Maximum Likelihood Tests 376   
6.4 Multiparameter Case: Estimation 386   
6.5 Multiparameter Case: Testing 395   
6.6 The EM Algorithm 404

# 7 Sufficiency 413

7.1 Measures of Quality of Estimators 413   
7.2 A Sufficient Statistic for a Parameter 419   
7.3 Properties of a Sufficient Statistic 426   
7.4 Completeness and Uniqueness 430   
7.5 The Exponential Class of Distributions 435   
7.6 Functions of a Parameter 440

7.6.1 Bootstrap Standard Errors 444

7.7 The Case of Several Parameters 447   
7.8 Minimal Sufficiency and Ancillary Statistics 454   
7.9 Sufficiency, Completeness, and Independence 461

# 8 Optimal Tests of Hypotheses 469

8.1 Most Powerful Tests 469   
8.2 Uniformly Most Powerful Tests 479   
8.3 Likelihood Ratio Tests 487

8.3.1 Likelihood Ratio Tests for Testing Means of Normal Distributions 488   
8.3.2 Likelihood Ratio Tests for Testing Variances of Normal Distributions 495

8.4 \*The Sequential Probability Ratio Test 500   
8.5 \*Minimax and Classification Procedures 507

8.5.1 Minimax Procedures 507   
8.5.2 Classification 510

# 9 Inferences About Normal Linear Models 515

9.1 Introduction 515   
9.2 One-Way ANOVA 516   
9.3 Noncentral $\chi^2$ and $F$ -Distributions 522   
9.4 Multiple Comparisons 525   
9.5 Two-Way ANOVA 531

9.5.1 Interaction between Factors 534

9.6 A Regression Problem 539

9.6.1 Maximum Likelihood Estimates 540   
9.6.2 \*Geometry of the Least Squares Fit 546

9.7 A Test of Independence 551   
9.8 The Distributions of Certain Quadratic Forms 555   
9.9 The Independence of Certain Quadratic Forms 562

# 10 Nonparametric and Robust Statistics 569

10.1 Location Models 569   
10.2 Sample Median and the Sign Test 572

10.2.1 Asymptotic Relative Efficiency 577   
10.2.2 Estimating Equations Based on the Sign Test 582   
10.2.3 Confidence Interval for the Median 584

10.3 Signed-Rank Wilcoxon 586

10.3.1 Asymptotic Relative Efficiency 591   
10.3.2 Estimating Equations Based on Signed-Rank Wilcoxon 593   
10.3.3 Confidence Interval for the Median 594   
10.3.4 Monte Carlo Investigation 595

10.4 Mann-Whitney-Wilcoxon Procedure 598

10.4.1 Asymptotic Relative Efficiency 602   
10.4.2 Estimating Equations Based on the Mann-Whitney-Wilcoxon 604   
10.4.3 Confidence Interval for the Shift Parameter $\Delta$ 604   
10.4.4 Monte Carlo Investigation of Power 605

10.5 *General Rank Scores 607

10.5.1 Efficacy 610   
10.5.2 Estimating Equations Based on General Scores 612   
10.5.3 Optimization: Best Estimates 612

10.6 \*Adaptive Procedures 619   
10.7 Simple Linear Model 625

10.8 Measures of Association 631

10.8.1 Kendall's $\tau$ 631   
10.8.2 Spearman's Rho 634

10.9 Robust Concepts 638

10.9.1 Location Model 638   
10.9.2 Linear Model 645

# 11 Bayesian Statistics 655

11.1 Bayesian Procedures 655

11.1.1 Prior and Posterior Distributions 656    make worker-start
11.1.2 Bayesian Point Estimation 658   
11.1.3 Bayesian Interval Estimation 662   
11.1.4 Bayesian Testing Procedures 663   
11.1.5 Bayesian Sequential Procedures 664

11.2 More Bayesian Terminology and Ideas 666   
11.3 Gibbs Sampler 672   
11.4 Modern Bayesian Methods 679

11.4.1 Empirical Bayes 682

# A Mathematical Comments 687

A.1 Regularity Conditions 687   
A.2 Sequences 688

# B R Primer 693

B.1 Basics 693   
B.2 Probability Distributions 696   
B.3 R Functions 698   
B.4 Loops 699   
B.5 Input and Output 700   
B.6 Packages 700

# C Lists of Common Distributions 703

# D Tables of Distributions 707

# E References 715

# F Answers to Selected Exercises 721

# Index 733

This page intentionally left blank

# Preface

We have made substantial changes in this edition of Introduction to Mathematical Statistics. Some of these changes help students appreciate the connection between statistical theory and statistical practice while other changes enhance the development and discussion of the statistical theory presented in this book.

Many of the changes in this edition reflect comments made by our readers. One of these comments concerned the small number of real data sets in the previous editions. In this edition, we have included more real data sets, using them to illustrate statistical methods or to compare methods. Further, we have made these data sets accessible to students by including them in the free R package hmcpkg. They can also be individually downloaded in an R session at the url listed below. In general, the R code for the analyses on these data sets is given in the text.

We have also expanded the use of the statistical software R. We selected R because it is a powerful statistical language that is free and runs on all three main platforms (Windows, Mac, and Linux). Instructors, though, can select another statistical package. We have also expanded our use of R functions to compute analyses and simulation studies, including several games. We have kept the level of coding for these functions straightforward. Our goal is to show students that with a few simple lines of code they can perform significant computations. Appendix B contains a brief R primer, which suffices for the understanding of the R used in the text. As with the data sets, these R functions can be sourced individually at the cited url; however, they are also included in the package hmcpkgg.

We have supplemented the mathematical review material in Appendix A, placing it in the document Mathematical Primer for Introduction to Mathematical Statistics. It is freely available for students to download at the listed url. Besides sequences, this supplement reviews the topics of infinite series, differentiation, and integration (univariate and bivariate). We have also expanded the discussion of iterated integrals in the text. We have added figures to clarify discussion.

We have retained the order of elementary statistical inferences (Chapter 4) and asymptotic theory (Chapter 5). In Chapters 5 and 6, we have written brief reviews of the material in Chapter 4, so that Chapters 4 and 5 are essentially independent of one another and, hence, can be interchanged. In Chapter 3, we now begin the section on the multivariate normal distribution with a subsection on the bivariate normal distribution. Several important topics have been added. This includes Tukey's multiple comparison procedure in Chapter 9 and confidence intervals for the correlation coefficients found in Chapters 9 and 10. Chapter 7 now contains a

discussion on standard errors for estimates obtained by bootstrapping the sample. Several topics that were discussed in the Exercises are now discussed in the text. Examples include quantiles, Section 1.7.1, and hazard functions, Section 3.3. In general, we have made more use of subsections to break up some of the discussion. Also, several more sections are now indicated by * as being optional.

# Content and Course Planning

Chapters 1 and 2 develop probability models for univariate and multivariate variables while Chapter 3 discusses many of the most widely used probability models. Chapter 4 discusses statistical theory for much of the inference found in a standard statistical methods course. Chapter 5 presents asymptotic theory, concluding with the Central Limit Theorem. Chapter 6 provides a complete inference (estimation and testing) based on maximum likelihood theory. The EM algorithm is also discussed. Chapters 7-8 contain optimal estimation procedures and tests of statistical hypotheses. The final three chapters provide theory for three important topics in statistics. Chapter 9 contains inference for normal theory methods for basic analysis of variance, univariate regression, and correlation models. Chapter 10 presents nonparametric methods (estimation and testing) for location and univariate regression models. It also includes discussion on the robust concepts of efficiency, influence, and breakdown. Chapter 11 offers an introduction to Bayesian methods. This includes traditional Bayesian procedures as well as Markov Chain Monte Carlo techniques.

Several courses can be designed using our book. The basic two-semester course in mathematical statistics covers most of the material in Chapters 1-8 with topics selected from the remaining chapters. For such a course, the instructor would have the option of interchanging the order of Chapters 4 and 5, thus beginning the second semester with an introduction to statistical theory (Chapter 4). A one-semester course could consist of Chapters 1-4 with a selection of topics from Chapter 5. Under this option, the student sees much of the statistical theory for the methods discussed in a non-theoretical course in methods. On the other hand, as with the two-semester sequence, after covering Chapters 1-3, the instructor can elect to cover Chapter 5 and finish the course with a selection of topics from Chapter 4.

The data sets and R functions used in this book and the R package hmcpkg can be downloaded at the site:

https://media.pearsoncmg.com/cmg/pmmg_mml_shared/mathstatsresources/home/index.html

# Acknowledgements

Bob Hogg passed away in 2014, so he did not work on this edition of the book. Often, though, when I was trying to decide whether or not to make a change in the manuscript, I found myself thinking of what Bob would do. In his memory, I have retained the order of the authors for this edition.

As with earlier editions, comments from readers are always welcomed and appreciated. We would like to thank these reviewers of the previous edition: James Baldone, Virginia College; Steven Culpepper, University of Illinois at Urbana-Champaign; Yuichiro Kakihara, California State University; Jaechoul Lee, Boise State University; Michael Levine, Purdue University; Tingni Sun, University of Maryland, College Park; and Daniel Weiner, Boston University. We appreciated and took into consideration their comments for this revision. We appreciate the helpful comments of Thomas Hettmansperger of Penn State University, Ash Abebe of Auburn University, and Professor Ioannis Kalogridis of the University of Leuven. A special thanks to Patrick Barbera (Portfolio Manager, Statistics), Lauren Morse (Content Producer, Math/Stats), Yvonne Vannatta (Product Marketing Manager), and the rest of the staff at Pearson for their help in putting this edition together. Thanks also to Richard Ponticelli, North Shore Community College, who accuracy checked the page proofs. Also, a special thanks to my wife Marge for her unwavering support and encouragement of my efforts in writing this edition.

Joe McKean

This page intentionally left blank


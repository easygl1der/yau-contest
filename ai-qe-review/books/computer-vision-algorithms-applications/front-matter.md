# 前置内容

> [!cite] 此文件保留第一章之前的封面、目录、前言或未自动归类内容。来源：[reading.md](../../../transcripts/mineru/computer-vision-algorithms-applications/reading.md)，源行 1–557。

# Computer Vision: Algorithms and Applications, 2nd Edition


<!-- MinerU source pages 1-200 -->

# Computer Vision: Algorithms and Applications 2nd Edition Richard Szeliski

Final draft, September 30, 2021

© 2022 Springer

This electronic draft was downloaded Jul\_20,\_2026 for the personal use of Yihua\_Yue yueyh@mail2.sysu.edu.cn and may not be posted or re-distributed in any form.

Please refer interested readers to the book’s Web site at https://szeliski.org/Book, where you can also provide feedback.

This book is dedicated to my parents,   
Zdzisław and Jadwiga,   
and my family,   
Lyn, Anne, and Stephen.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/46decf697b07aeb65c60c4e8be79cb899d3cda2f111fb435a7f1196a0d2246a1.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/67bbc1e4b20b37667e33c8e13b2a25a9007824cbea4c1a94e2b889dc9ec762bd.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/793b9bf6b941614bede38e58753e9dc8bd0f055211f486d11dbfea3d0716cf6c.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/7794023391d64f5946e10d8da5164099378eee12d681e30ac3756c444baf77c9.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/9c584dc9fdd20e3180b7ebfe786bbdc761a13114016e55f756a550e0c230f8a0.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/60cca73ab01b88aa77d32c171ddbf77cc386e9b39b90f2c25bc0e8cc27213a6e.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/b70543eb8692c0040e94d8362d3dfe1f89006bbded3ccea4ab298084f03b5f71.jpg)

1 Introduction 1   
What is computer vision? A brief history   
Book overview Sample syllabus Notation   
2 Image formation 33   
Geometric primitives and transformations   
Photometric image formation The digital camera   
3 Image processing 107   
Point operators <sub>•</sub> Linear filtering   
Non-linear filtering Fourier transforms   
Pyramids and wavelets Geometric transformations   
4 Model fitting and optimization 191   
Scattered data interpolation   
Variational methods and regularization   
Markov random fields   
5 Deep learning 235   
Supervised learning Unsupervised learning   
Deep neural networks Convolutional networks   
More complex models   
6 Recognition 343   
Instance recognition Image classification   
Object detection Semantic segmentation   
Video understanding  Vision and language   
7 Feature detection and matching 417   
Points and patches Edges and contours   
Contour tracking Lines and vanishing points   
Segmentation   
8 Image alignment and stitching 501   
Pairwise alignment  Image stitching   
Global alignment Compositing   
9 Motion estimation 555   
Translational alignment Parametric motion   
Optical flow Layered motion   
10 Computational photography 607   
Photometric calibration  High dynamic range imaging   
Super-resolution, denoising, and blur removal   
Image matting and compositing   
Texture analysis and synthesis   
11 Structure from motion and SLAM 681   
Geometric intrinsic calibration Pose estimation   
Two-frame structure from motion   
Multi-frame structure from motion   
Simultaneous localization and mapping (SLAM)   
12 Depth estimation 749   
Epipolar geometry Sparse correspondence   
Dense correspondence Local methods   
Global optimization Deep neural networks   
Multi-view stereo Monocular depth estimation   
13 3D reconstruction 805   
Shape from X 3D scanning   
Surface representations Point-based representations   
Volumetric representations Model-based reconstruction   
Recovering texture maps and albedos   
14 Image-based rendering 861   
View interpolation Layered depth images   
Light fields and Lumigraphs  Environment mattes   
Video-based rendering Neural rendering

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/1cf4a203749569e41cb11823bcbae648ad7acf0bd230b1baee3ca1246f22557a.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/cf926c42307689e39d0bca640f28c89f73a60fb40ed126b3426d72b69e131e82.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/9564acb2a7e7249ad67ad6e870583f38403e6acf1326e16e9f6ed3dea8b75e7c.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/1225490fd426363d0cdd0aa9f8f7cf32e9ec843f89b91d7f1157b9e336b5f2be.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/ca35aa92c540eb5c8444d981e3dafbfaa4508c552189115acda15cbdf3945105.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/d01ee7dfe96fe7658c01ea972d83f09022207280e65d8693c5229af1156b4f83.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/59a4f07c9fd192f6270799c886fde6f92bb5717b5c96458f551ac41fe96de623.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/44e1a0ae152cd23b8abc05133fea4bb6ddfa19b9672953b757526a0bb3865fc1.jpg)

## Preface

The seeds for this book were first planted in 2001 when Steve Seitz at the University of Washington invited me to co-teach a course called “Computer Vision for Computer Graphics”. At that time, computer vision techniques were increasingly being used in computer graphics to create image-based models of real-world objects, to create visual effects, and to merge realworld imagery using computational photography techniques. Our decision to focus on the applications of computer vision to fun problems such as image stitching and photo-based 3D modeling from personal photos seemed to resonate well with our students.

That initial course evolved into a more complete computer vision syllabus and projectoriented course structure that I used to co-teach general computer vision courses both at the University of Washington and at Stanford. (The latter was a course I co-taught with David Fleet in 2003.) Similar curricula were then adopted at a number of other universities and also incorporated into more specialized courses on computational photography. (For ideas on how to use this book in your own course, please see Table 1.1 in Section 1.4.)

This book also reflects my 40 years’ experience doing computer vision research in corporate research labs, mostly at Digital Equipment Corporation’s Cambridge Research Lab, Microsoft Research, and Facebook. In pursuing my work, I have mostly focused on problems and solution techniques (algorithms) that have practical real-world applications and that work well in practice. Thus, this book has more emphasis on basic techniques that work under realworld conditions and less on more esoteric mathematics that has intrinsic elegance but less practical applicability.

This book is suitable for teaching a senior-level undergraduate course in computer vision to students in both computer science and electrical engineering. I prefer students to have either an image processing or a computer graphics course as a prerequisite, so that they can spend less time learning general background mathematics and more time studying computer vision techniques. The book is also suitable for teaching graduate-level courses in computer vision, e.g., by delving into more specialized topics, and as a general reference to fundamental techniques and the recent research literature. To this end, I have attempted wherever possible to at least cite the newest research in each sub-field, even if the technical details are too complex to cover in the book itself.

In teaching our courses, we have found it useful for the students to attempt a number of small implementation projects, which often build on one another, in order to get them used to working with real-world images and the challenges that these present. The students are then asked to choose an individual topic for each of their small-group, final projects. (Sometimes these projects even turn into conference papers!) The exercises at the end of each chapter contain numerous suggestions for smaller mid-term projects, as well as more open-ended problems whose solutions are still active research topics. Wherever possible, I encourage students to try their algorithms on their own personal photographs, since this better motivates them, often leads to creative variants on the problems, and better acquaints them with the variety and complexity of real-world imagery.

In formulating and solving computer vision problems, I have often found it useful to draw inspiration from four high-level approaches:

- Scientific: build detailed models of the image formation process and develop mathematical techniques to invert these in order to recover the quantities of interest (where necessary, making simplifying assumptions to make the mathematics more tractable).

- Statistical: use probabilistic models to quantify the prior likelihood of your unknowns and the noisy measurement processes that produce the input images, then infer the best possible estimates of your desired quantities and analyze their resulting uncertainties. The inference algorithms used are often closely related to the optimization techniques used to invert the (scientific) image formation processes.

- Engineering: develop techniques that are simple to describe and implement but that are also known to work well in practice. Test these techniques to understand their limitation and failure modes, as well as their expected computational costs (run-time performance).

- Data-driven: collect a representative set of test data (ideally, with labels or groundtruth answers) and use these data to either tune or learn your model parameters, or at least to validate and quantify its performance.

These four approaches build on each other and are used throughout the book.

My personal research and development philosophy (and hence the exercises in the book) have a strong emphasis on testing algorithms. It’s too easy in computer vision to develop an algorithm that does something plausible on a few images rather than something correct. The best way to validate your algorithms is to use a three-part strategy.

First, test your algorithm on clean synthetic data, for which the exact results are known. Second, add noise to the data and evaluate how the performance degrades as a function of noise level. Finally, test the algorithm on real-world data, preferably drawn from a wide variety of sources, such as photos found on the web. Only then can you truly know if your algorithm can deal with real-world complexity, i.e., images that do not fit some simplified model or assumptions.

In order to help students in this process, Appendix C includes pointers to commonly used datasets and software libraries that contain implementations of a wide variety of computer vision algorithms, which can enable you to tackle more ambitious projects (with your instructor’s consent).

## Notes on the Second Edition

The last decade has seen a truly dramatic explosion in the performance and applicability of computer vision algorithms, much of it engendered by the application of machine learning algorithms to large amounts of visual training data (Su and Crandall 2021).

Deep neural networks now play an essential role in so many vision algorithms that the new edition of this book introduces them early on as a fundamental technique that gets used extensively in subsequent chapters.

The most notable changes in the second edition include:

- Machine learning, deep learning, and deep neural networks are introduced early on in Chapter 5, as they play just as fundamental a role in vision algorithms as more classical techniques, such as image processing, graphical/probabilistic models, and energy minimization, which are introduced in the preceding two chapters.

- The recognition chapter has been moved earlier in the book to Chapter 6, since end-toend deep learning systems no longer require the development of building blocks such as feature detection, matching, and segmentation. Many of the students taking vision classes are primarily interested in visual recognition, so presenting this material earlier in the course makes it easier for students to base their final project on these topics. This chapter also includes sections on semantic segmentation, video understanding, and vision and language.

- The application of neural networks and deep learning to myriad computer vision algorithms and applications, including flow and stereo, 3D shape modeling, and newly

emerging fields such as neural rendering.

- New technologies such as SLAM (simultaneous localization and mapping) and VIO (visual inertial odometry) that now run reliably and are used in real-time applications such as augmented reality and autonomous navigation.

In addition to these larger changes, the book has been updated to reflect the latest state-ofthe-art techniques such as internet-scale image search and phone-based computational photography. The new edition includes over 1500 new citations (papers) and has over 200 new figures.

## Acknowledgements

I would like to gratefully acknowledge all of the people whose passion for research and inquiry as well as encouragement have helped me write this book.

Steve Zucker at McGill University first introduced me to computer vision, taught all of his students to question and debate research results and techniques, and encouraged me to pursue a graduate career in this area.

Takeo Kanade and Geoff Hinton, my PhD thesis advisors at Carnegie Mellon University, taught me the fundamentals of good research, writing, and presentation and mentored several generations of outstanding students and researchers. They fired up my interest in visual processing, 3D modeling, and statistical methods, while Larry Matthies introduced me to Kalman filtering and stereo matching. Geoff continues to inspire so many of us with this undiminished passion for trying to figure out “what makes the brain work”. It’s been a delight to see his pursuit of connectionist ideas bear so much fruit in this past decade.

Demetri Terzopoulos was my mentor at my first industrial research job and taught me the ropes of successful publishing. Yvan Leclerc and Pascal Fua, colleagues from my brief interlude at SRI International, gave me new perspectives on alternative approaches to computer vision.

During my six years of research at Digital Equipment Corporation’s Cambridge Research Lab, I was fortunate to work with a great set of colleagues, including Ingrid Carlbom, Gudrun Klinker, Keith Waters, William Hsu, Richard Weiss, Stephane Lavall ´ ee, and Sing Bing Kang,´ as well as to supervise the first of a long string of outstanding summer interns, including David Tonnesen, Sing Bing Kang, James Coughlan, and Harry Shum. This is also where I began my long-term collaboration with Daniel Scharstein.

At Microsoft Research, I had the outstanding fortune to work with some of the world’s best researchers in computer vision and computer graphics, including Michael Cohen, Matt

Uyttendaele, Sing Bing Kang, Harry Shum, Larry Zitnick, Sudipta Sinha, Drew Steedly, Simon Baker, Johannes Kopf, Neel Joshi, Krishnan Ramnath, Anandan, Phil Torr, Antonio Criminisi, Simon Winder, Matthew Brown, Michael Goesele, Richard Hartley, Hugues Hoppe, Stephen Gortler, Steve Shafer, Matthew Turk, Georg Petschnigg, Kentaro Toyama, Ramin Zabih, Shai Avidan, Patrice Simard, Chris Pal, Nebojsa Jojic, Patrick Baudisch, Dani Lischinski, Raanan Fattal, Eric Stollnitz, David Nister, Blaise Aguera y Arcas, Andrew Fitzgibbon,´ Jamie Shotton, Wolf Kienzle, Piotr Dollar, and Ross Girshick. I was also lucky to have as interns such great students as Polina Golland, Simon Baker, Mei Han, Arno Schodl, Ron Dror,¨ Ashley Eden, Jonathan Shade, Jinxiang Chai, Rahul Swaminathan, Yanghai Tsin, Sam Hasinoff, Anat Levin, Matthew Brown, Eric Bennett, Vaibhav Vaish, Jan-Michael Frahm, James Diebel, Ce Liu, Josef Sivic, Grant Schindler, Colin Zheng, Neel Joshi, Sudipta Sinha, Zeev Farbman, Rahul Garg, Tim Cho, Yekeun Jeong, Richard Roberts, Varsha Hedau, Dilip Krishnan, Adarsh Kowdle, Edward Hsiao, Yong Seok Heo, Fabian Langguth, Andrew Owens, and Tianfan Xue. Working with such outstanding students also gave me the opportunity to collaborate with some of their amazing advisors, including Bill Freeman, Irfan Essa, Marc Pollefeys, Michael Black, Marc Levoy, and Andrew Zisserman.

Since moving to Facebook, I’ve had the pleasure to continue my collaborations with Michael Cohen, Matt Uyttendaele, Johannes Kopf, Wolf Kienzle, and Krishnan Ramnath, and also new colleagues including Kevin Matzen, Bryce Evans, Suhib Alsisan, Changil Kim, David Geraghty, Jan Herling, Nils Plath, Jan-Michael Frahm, True Price, Richard Newcombe, Thomas Whelan, Michael Goesele, Steven Lovegrove, Julian Straub, Simon Green, Brian Cabral, Michael Toksvig, Albert Para Pozzo, Laura Sevilla-Lara, Georgia Gkioxari, Justin Johnson, Chris Sweeney, and Vassileios Balntas. I’ve also had the pleasure to collaborate with some outstanding summer interns, including Tianfan Xue, Scott Wehrwein, Peter Hedman, Joel Janai, Aleksander Hołynski, Xuan Luo, Rui Wang, Olivia Wiles, and Yulun Tian.´ I’d like to thank in particular Michael Cohen, my mentor, colleague, and friend for the last 25 years for his unwavering support of my sprint to complete this second edition.

While working at Microsoft and Facebook, I’ve also had the opportunity to collaborate with wonderful colleagues at the University of Washington, where I hold an Affiliate Professor appointment. I’m indebted to Tony DeRose and David Salesin, who first encouraged me to get involved with the research going on at UW, my long-time collaborators Brian Curless, Steve Seitz, Maneesh Agrawala, Sameer Agarwal, and Yasu Furukawa, as well as the students I have had the privilege to supervise and interact with, including Frederic Pighin, Yung-Yu´ Chuang, Doug Zongker, Colin Zheng, Aseem Agarwala, Dan Goldman, Noah Snavely, Ian Simon, Rahul Garg, Ryan Kaminsky, Juliet Fiss, Aleksander Hołynski, and Yifan Wang. As´ I mentioned at the beginning of this preface, this book owes its inception to the vision course that Steve Seitz invited me to co-teach, as well as to Steve’s encouragement, course notes, and editorial input.

I’m also grateful to the many other computer vision researchers who have given me so many constructive suggestions about the book, including Sing Bing Kang, who was my informal book editor, Vladimir Kolmogorov, Daniel Scharstein, Richard Hartley, Simon Baker, Noah Snavely, Bill Freeman, Svetlana Lazebnik, Matthew Turk, Jitendra Malik, Alyosha Efros, Michael Black, Brian Curless, Sameer Agarwal, Li Zhang, Deva Ramanan, Olga Veksler, Yuri Boykov, Carsten Rother, Phil Torr, Bill Triggs, Bruce Maxwell, Rico Malvar, Jana Koseck ˇ a, Eero Simoncelli, Aaron Hertzmann, Antonio Torralba, Tomaso Poggio, ´ Theo Pavlidis, Baba Vemuri, Nando de Freitas, Chuck Dyer, Song Yi, Falk Schubert, Roman Pflugfelder, Marshall Tappen, James Coughlan, Sammy Rogmans, Klaus Strobel, Shanmuganathan, Andreas Siebert, Yongjun Wu, Fred Pighin, Juan Cockburn, Ronald Mallet, Tim Soper, Georgios Evangelidis, Dwight Fowler, Itzik Bayaz, Daniel O’Connor, Srikrishna Bhat, and Toru Tamaki, who wrote the Japanese translation and provided many useful errata.

For the second edition, I received significant help and advice from three key contributors. Daniel Scharstein helped me update the chapter on stereo, Matt Deitke contributed descriptions of the newest papers in deep learning, including the sections on transformers, variational autoencoders, and text-to-image synthesis, along with the exercises in Chapters 5 and 6 and some illustrations. Sing Bing Kang reviewed multiple drafts and provided useful suggestions. I’d also like to thank Andrew Glassner, whose book (Glassner 2018) and figures were a tremendous help, Justin Johnson, Sean Bell, Ishan Misra, David Fouhey, Michael Brown, Abdelrahman Abdelhamed, Frank Dellaert, Xinlei Chen, Ross Girshick, Andreas Geiger, Dmytro Mishkin, Aleksander Hołynski, Joel Janai, Christoph Feichtenhofer, Yuandong Tian,´ Alyosha Efros, Pascal Fua, Torsten Sattler, Laura Leal-Taixe, Aljosa Osep, Qunjie Zhou,´ Jiˇr´ı Matas, Eddy Ilg, Yann LeCun, Larry Jackel, Vasileios Balntas, Daniel DeTone, Zachary Teed, Junhwa Hur, Jun-Yan Zhu, Filip Radenovic, Michael Zollh´ ofer, Matthias Nießner, An-¨ drew Owens, Herve J´ egou, Luowei Zhou, Ricardo Martin Brualla, Pratul Srinivasan, Matteo´ Poggi, Fabio Tosi, Ahmed Osman, Dave Howell, Holger Heidrich, Howard Yen, Anton Papst, Syamprasad K. Rajagopalan, Abhishek Nagar, Vladimir Kuznetsov, Raphael Fouque, Marian ¨ Ciobanu, Darko Simonovic, and Guilherme Schlinker.

In preparing the second edition, I taught some of the new material in two courses that I helped co-teach in 2020 at Facebook and UW. I’d like to thank my co-instructors Jan-Michael Frahm, Michael Goesele, Georgia Gkioxari, Ross Girshick, Jakob Julian Engel, Daniel Scharstein, Fernando de la Torre, Steve Seitz, and Harpreet Sawhney, from whom I learned a lot about the latest techniques that are included in the new edition. I’d also like to thank the TAs, including David Geraghty, True Price, Kevin Matzen, Akash Bapat, Aleksander Hołynski, Keunhong Park, and Svetoslav Kolev, for the wonderful job they did in cre-´ ating and grading the assignments. I’d like to give a special thanks to Justin Johnson, whose excellent class slides (Johnson 2020), based on earlier slides from Stanford (Li, Johnson, and Yeung 2019), taught me the fundamentals of deep learning and which I used extensively in my own class and in preparing the new chapter on deep learning.

Shena Deuchers and Ian Kingston did a fantastic job copy-editing the first and second editions, respectively and suggesting many useful improvements, and Wayne Wheeler and Simon Rees at Springer were most helpful throughout the whole book publishing process. Keith Price’s Annotated Computer Vision Bibliography was invaluable in tracking down references and related work.

If you have any suggestions for improving the book, please send me an e-mail, as I would like to keep the book as accurate, informative, and timely as possible.

The last year of writing this second edition took place during the worldwide COVID-19 pandemic. I would like to thank all of the first responders, medical and front-line workers, and everyone else who helped get us through these difficult and challenging times and to acknowledge the impact that this and other recent tragedies have had on all of us.

Lastly, this book would not have been possible or worthwhile without the incredible support and encouragement of my family. I dedicate this book to my parents, Zdzisław and Jadwiga, whose love, generosity, and accomplishments always inspired me; to my sister Basia for her lifelong friendship; and especially to Lyn, Anne, and Stephen, whose love and support in all matters (including my book projects) makes it all worthwhile.

Lake Wenatchee

May 2021

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/001-200/images/62a88746aed0fe00fa60a8537fe8488e532aa99e8ec28a1023215ff2fab2ef8a.jpg)

## Contents

Preface vii   
Contents xv   
1 Introduction 1   
1.1 What is computer vision? . 3   
1.2 A brief history 10   
1.3 Book overview 22   
1.4 Sample syllabus 30   
1.5 A note on notation 31   
1.6 Additional reading 31   
2 Image formation 33   
2.1 Geometric primitives and transformations 36   
2.1.1 2D transformations 40   
2.1.2 3D transformations 43   
2.1.3 3D rotations 45   
2.1.4 3D to 2D projections 51   
2.1.5 Lens distortions . 63   
2.2 Photometric image formation 66   
2.2.1 Lighting . 66   
2.2.2 Reflectance and shading 67   
2.2.3 Optics . 74   
2.3 The digital camera 79   
2.3.1 Sampling and aliasing 84   
2.3.2 Color 87   
2.3.3 Compression 98   
2.4 Additional reading 101   
2.5 Exercises 102   
Image processing 107   
3.1 Point operators 109   
3.1.1 Pixel transforms 111   
3.1.2 Color transforms 112   
3.1.3 Compositing and matting 113   
3.1.4 Histogram equalization . 115   
3.1.5 Application: Tonal adjustment 119   
3.2 Linear filtering 119   
3.2.1 Separable filtering 124   
3.2.2 Examples of linear filtering . 125   
3.2.3 Band-pass and steerable filters 127   
3.3 More neighborhood operators . 131   
3.3.1 Non-linear filtering 132   
3.3.2 Bilateral filtering 133   
3.3.3 Binary image processing 138   
3.4 Fourier transforms 142   
3.4.1 Two-dimensional Fourier transforms . 146   
3.4.2 Application: Sharpening, blur, and noise removal . 148   
3.5 Pyramids and wavelets 149   
3.5.1 Interpolation 150   
3.5.2 Decimation 153   
3.5.3 Multi-resolution representations 154   
3.5.4 Wavelets 159   
3.5.5 Application: Image blending 165   
3.6 Geometric transformations 168   
3.6.1 Parametric transformations 168   
3.6.2 Mesh-based warping 175   
3.6.3 Application: Feature-based morphing 177   
3.7 Additional reading 178   
3.8 Exercises 180   
Model fitting and optimization 191   
4.1 Scattered data interpolation . 194   
4.1.1 Radial basis functions 196   
4.1.2 Overfitting and underfitting . 199   
4.1.3 Robust data fitting 202   
4.2 Variational methods and regularization 204   
4.2.1 Discrete energy minimization 206   
4.2.2 Total variation 210   
4.2.3 Bilateral solver 210   
4.2.4 Application: Interactive colorization . 211   
4.3 Markov random fields 212   
4.3.1 Conditional random fields 222   
4.3.2 Application: Interactive segmentation 227   
4.4 Additional reading 230   
4.5 Exercises 232   
Deep Learning 235   
5.1 Supervised learning 239   
5.1.1 Nearest neighbors . 241   
5.1.2 Bayesian classification 243   
5.1.3 Logistic regression 248   
5.1.4 Support vector machines 250   
5.1.5 Decision trees and forests 254   
5.2 Unsupervised learning 257   
5.2.1 Clustering . 257   
5.2.2 K-means and Gaussians mixture models . 259   
5.2.3 Principal component analysis 262   
5.2.4 Manifold learning . 265   
5.2.5 Semi-supervised learning 266   
5.3 Deep neural networks 268   
5.3.1 Weights and layers 270   
5.3.2 Activation functions 272   
5.3.3 Regularization and normalization 274   
5.3.4 Loss functions 280   
5.3.5 Backpropagation 284   
5.3.6 Training and optimization 287   
5.4 Convolutional neural networks 291   
5.4.1 Pooling and unpooling 295   
5.4.2 Application: Digit classification 298   
5.4.3 Network architectures 299   
5.4.4 Model zoos 304   
5.4.5 Visualizing weights and activations 307   
5.4.6 Adversarial examples . 311   
5.4.7 Self-supervised learning 312   
5.5 More complex models 317   
5.5.1 Three-dimensional CNNs 317   
5.5.2 Recurrent neural networks 321   
5.5.3 Transformers 322   
5.5.4 Generative models 328   
5.6 Additional reading 336   
5.7 Exercises 337   
Recognition 343   
6.1 Instance recognition 346   
6.2 Image classification 349   
6.2.1 Feature-based methods . 350   
6.2.2 Deep networks 358   
6.2.3 Application: Visual similarity search . . . 360   
6.2.4 Face recognition 363   
6.3 Object detection 370   
6.3.1 Face detection 371   
6.3.2 Pedestrian detection 376   
6.3.3 General object detection . 379   
6.4 Semantic segmentation 387   
6.4.1 Application: Medical image segmentation . . . 390   
6.4.2 Instance segmentation 391   
6.4.3 Panoptic segmentation 392   
6.4.4 Application: Intelligent photo editing 394   
6.4.5 Pose estimation 395   
6.5 Video understanding 396   
6.6 Vision and language 400   
6.7 Additional reading 409   
6.8 Exercises 413   
7 Feature detection and matching 417   
7.1 Points and patches . 419   
7.1.1 Feature detectors 422   
7.1.2 Feature descriptors 434   
7.1.3 Feature matching 441   
7.1.4 Large-scale matching and retrieval . 448   
7.1.5 Feature tracking 452   
7.1.6 Application: Performance-driven animation . 454   
7.2 Edges and contours 455   
7.2.1 Edge detection 456   
7.2.2 Contour detection 461   
7.2.3 Application: Edge editing and enhancement . 465   
7.3 Contour tracking 466   
7.3.1 Snakes and scissors 467   
7.3.2 Level Sets 474   
7.3.3 Application: Contour tracking and rotoscoping 476   
7.4 Lines and vanishing points 477   
7.4.1 Successive approximation 477   
7.4.2 Hough transforms 477   
7.4.3 Vanishing points 481   
7.5 Segmentation 483   
7.5.1 Graph-based segmentation 486   
7.5.2 Mean shift 487   
7.5.3 Normalized cuts 489   
7.6 Additional reading 491   
7.7 Exercises 495   
8 Image alignment and stitching 501   
8.1 Pairwise alignment 503   
8.1.1 2D alignment using least squares 504   
8.1.2 Application: Panography 506   
8.1.3 Iterative algorithms 507   
8.1.4 Robust least squares and RANSAC . 510   
8.1.5 3D alignment 513   
8.2 Image stitching 514   
8.2.1 Parametric motion models 516   
8.2.2 Application: Whiteboard and document scanning 517   
8.2.3 Rotational panoramas . 519   
8.2.4 Gap closing 520   
8.2.5 Application: Video summarization and compression 522   
8.2.6 Cylindrical and spherical coordinates 523   
8.3 Global alignment 526   
8.3.1 Bundle adjustment 527   
8.3.2 Parallax removal 531   
8.3.3 Recognizing panoramas 533   
8.4 Compositing 536   
8.4.1 Choosing a compositing surface . 536   
8.4.2 Pixel selection and weighting (deghosting) 538   
8.4.3 Application: Photomontage 544   
8.4.4 Blending 544   
8.5 Additional reading 547   
8.6 Exercises 549   
Motion estimation 555   
9.1 Translational alignment 558   
9.1.1 Hierarchical motion estimation . 562   
9.1.2 Fourier-based alignment 563   
9.1.3 Incremental refinement 566   
9.2 Parametric motion 570   
9.2.1 Application: Video stabilization 573   
9.2.2 Spline-based motion 575   
9.2.3 Application: Medical image registration 577   
9.3 Optical flow 578   
9.3.1 Deep learning approaches 584   
9.3.2 Application: Rolling shutter wobble removal . 587   
9.3.3 Multi-frame motion estimation 587   
9.3.4 Application: Video denoising 589   
9.4 Layered motion 589   
9.4.1 Application: Frame interpolation 593   
9.4.2 Transparent layers and reflections 594   
9.4.3 Video object segmentation 597   
9.4.4 Video object tracking 598   
9.5 Additional reading 600   
9.6 Exercises 602   
10 Computational photography 607   
10.1 Photometric calibration 610   
10.1.1 Radiometric response function 611   
10.1.2 Noise level estimation 614   
10.1.3 Vignetting . 615   
10.1.4 Optical blur (spatial response) estimation 616   
10.2 High dynamic range imaging 620   
10.2.1 Tone mapping . 627   
10.2.2 Application: Flash photography 634   
10.3 Super-resolution, denoising, and blur removal . 637   
10.3.1 Color image demosaicing 646   
10.3.2 Lens blur (bokeh) . 648   
10.4 Image matting and compositing 650   
10.4.1 Blue screen matting . 651   
10.4.2 Natural image matting 653   
10.4.3 Optimization-based matting 656   
10.4.4 Smoke, shadow, and flash matting 661   
10.4.5 Video matting . 662   
10.5 Texture analysis and synthesis 663   
10.5.1 Application: Hole filling and inpainting 665   
10.5.2 Application: Non-photorealistic rendering 667   
10.5.3 Neural style transfer and semantic image synthesis 669   
10.6 Additional reading 671   
10.7 Exercises 674   
11 Structure from motion and SLAM 681   
11.1 Geometric intrinsic calibration 685   
11.1.1 Vanishing points 687   
11.1.2 Application: Single view metrology 688   
11.1.3 Rotational motion 689   
11.1.4 Radial distortion 691   
11.2 Pose estimation 693   
11.2.1 Linear algorithms . 693   
11.2.2 Iterative non-linear algorithms 695   
11.2.3 Application: Location recognition 698   
11.2.4 Triangulation 701   
11.3 Two-frame structure from motion 703   
11.3.1 Eight, seven, and five-point algorithms . 703   
11.3.2 Special motions and structures 708   
11.3.3 Projective (uncalibrated) reconstruction 710   
11.3.4 Self-calibration 712   
11.3.5 Application: View morphing 714   
11.4 Multi-frame structure from motion 715   
11.4.1 Factorization 715   
11.4.2 Bundle adjustment 717   
11.4.3 Exploiting sparsity 719   
11.4.4 Application: Match move 723   
11.4.5 Uncertainty and ambiguities 723   
11.4.6 Application: Reconstruction from internet photos . 725   
11.4.7 Global structure from motion . 728   
11.4.8 Constrained structure and motion 731   
11.5 Simultaneous localization and mapping (SLAM) 734   
11.5.1 Application: Autonomous navigation 737   
11.5.2 Application: Smartphone augmented reality 739   
11.6 Additional reading 740   
11.7 Exercises 743   
Depth estimation 749   
12.1 Epipolar geometry 753   
12.1.1 Rectification 755   
12.1.2 Plane sweep 757   
12.2 Sparse correspondence 760   
12.2.1 3D curves and profiles 760   
12.3 Dense correspondence 762   
12.3.1 Similarity measures 764   
12.4 Local methods 766   
12.4.1 Sub-pixel estimation and uncertainty . 768   
12.4.2 Application: Stereo-based head tracking . 769   
12.5 Global optimization 771   
12.5.1 Dynamic programming . 774   
12.5.2 Segmentation-based techniques 775   
12.5.3 Application: Z-keying and background replacement . 777   
12.6 Deep neural networks 778   
12.7 Multi-view stereo 781   
12.7.1 Scene flow 785   
12.7.2 Volumetric and 3D surface reconstruction . 786   
12.7.3 Shape from silhouettes 794   
12.8 Monocular depth estimation 796   
12.9 Additional reading 799   
12.10Exercises 800   
3D reconstruction 805   
13.1 Shape from X 809   
13.1.1 Shape from shading and photometric stereo 809   
13.1.2 Shape from texture 814   
13.1.3 Shape from focus 814   
13.2 3D scanning 816   
13.2.1 Range data merging 820   
13.2.2 Application: Digital heritage 824   
13.3 Surface representations 825   
13.3.1 Surface interpolation 826   
13.3.2 Surface simplification 827   
13.3.3 Geometry images 828   
13.4 Point-based representations 829   
13.5 Volumetric representations 830   
13.5.1 Implicit surfaces and level sets 831   
13.6 Model-based reconstruction . 833   
13.6.1 Architecture 833   
13.6.2 Facial modeling and tracking . 838   
13.6.3 Application: Facial animation 839   
13.6.4 Human body modeling and tracking 843   
13.7 Recovering texture maps and albedos 850   
13.7.1 Estimating BRDFs 852   
13.7.2 Application: 3D model capture . 854   
13.8 Additional reading 855   
13.9 Exercises 857   
14 Image-based rendering 861   
14.1 View interpolation . 863   
14.1.1 View-dependent texture maps 865   
14.1.2 Application: Photo Tourism 867   
14.2 Layered depth images . 868   
14.2.1 Impostors, sprites, and layers 869   
14.2.2 Application: 3D photography 872   
14.3 Light fields and Lumigraphs 875   
14.3.1 Unstructured Lumigraph 879   
14.3.2 Surface light fields 880   
14.3.3 Application: Concentric mosaics . 882   
14.3.4 Application: Synthetic re-focusing 883   
14.4 Environment mattes . 883   
14.4.1 Higher-dimensional light fields . 885   
14.4.2 The modeling to rendering continuum 886   
14.5 Video-based rendering 887   
14.5.1 Video-based animation 888   
14.5.2 Video textures 889   
14.5.3 Application: Animating pictures 892   
14.5.4 3D and free-viewpoint Video . 893   
14.5.5 Application: Video-based walkthroughs 896   
14.6 Neural rendering 899   
14.7 Additional reading 908   
14.8 Exercises 910   
15 Conclusion 915   
A Linear algebra and numerical techniques 919   
A.1 Matrix decompositions 920   
A.1.1 Singular value decomposition 921   
A.1.2 Eigenvalue decomposition 922   
A.1.3 QR factorization 925   
A.1.4 Cholesky factorization 925   
A.2 Linear least squares 927   
A.2.1 Total least squares 929   
A.3 Non-linear least squares . 930   
A.4 Direct sparse matrix techniques . 932   
A.4.1 Variable reordering 932   
A.5 Iterative techniques 934   
A.5.1 Conjugate gradient 934   
A.5.2 Preconditioning 936   
A.5.3 Multigrid 937   
B Bayesian modeling and inference 939   
B.1 Estimation theory . 941   
B.2 Maximum likelihood estimation and least squares 943   
B.3 Robust statistics . 945   
B.4 Prior models and Bayesian inference 948   
B.5 Markov random fields . . 949   
B.6 Uncertainty estimation (error analysis) 952   
C Supplementary material 953   
C.1 Datasets and benchmarks . 954   
C.2 Software 961   
C.3 Slides and lectures 970   
References 973   
Index 1179

## Chapter 1


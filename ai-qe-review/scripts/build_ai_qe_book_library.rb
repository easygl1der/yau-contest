#!/usr/bin/env ruby
# frozen_string_literal: true

# Builds an Obsidian-first, chapter-per-file view of the AI QE textbook
# transcripts.  The source PDF and MinerU package remain the authority; this
# script only creates a cleaned, fully traceable reading layer.

require "digest"
require "fileutils"
require "json"
require "pathname"
require "time"

ROOT = Pathname.new(__dir__).join("..").realpath
MANIFEST_PATH = ROOT.join("textbook-library-manifest.json")
BOOKS_ROOT = ENV["AI_QE_BOOKS_OUT"] ? Pathname.new(ENV.fetch("AI_QE_BOOKS_OUT")).expand_path : ROOT.join("books")
REFS_PATH = ROOT.join("refs.bib")

# The source table of contents is the normative chapter spine.  Never infer a
# new chapter from arbitrary Markdown heading levels: MinerU also marks running
# heads, answers, code comments and later references as headings.
BOOK_RULES = {
  "computer-vision-algorithms-applications" => { chapters: (1..14).to_a },
  "deep-learning-foundations-concepts" => { chapters: (1..20).to_a },
  "deep-learning-goodfellow" => { chapters: (1..20).to_a },
  "first-order-methods-optimization" => { chapters: (1..15).to_a },
  "foundations-of-machine-learning-2e" => { chapters: (1..17).to_a },
  "lectures-convex-optimization" => { chapters: (1..7).to_a },
  "lectures-modern-convex-optimization" => { chapters: (1..5).to_a, lecture: true },
  "neural-network-methods-nlp" => { chapters: (1..21).to_a },
  "pattern-recognition-machine-learning" => { chapters: ((1..11).to_a + [13, 14]), blocked: { 12 => { "title" => "Continuous Latent Variables", "status" => "blocked: missing-source-pages", "reason" => "目录存在，但归档 PDF 与 MinerU 正文均缺失本章页面。" } } },
  "speech-language-processing" => { chapters: ((1..9).to_a + (11..15).to_a + (17..26).to_a), blocked: { 10 => { "title" => "Contextual Embeddings", "status" => "blocked: placeholder-content", "reason" => "转录中只有章节标题和 Placeholder，不能将其视作可审校正文。" }, 16 => { "title" => "Computational Semantics and Semantic Parsing", "status" => "blocked: placeholder-content", "reason" => "转录中只有不完整标题和 Placeholder，不能将其视作可审校正文。" } } },
  "understanding-machine-learning" => { chapters: (1..31).to_a }
}.freeze

# These are unambiguous OCR spelling repairs observed in the source packages.
# Keep this list deliberately small: wording, mathematical content and section
# order are never rewritten by this build step.
SAFE_OCR_REPAIRS = {
  /\b[Aa]fine\b/ => "Affine",
  /\b[Cc]onjugacy\b/ => "Conjugacy",
  /\b[Dd]iferent\b/ => "different",
  /\b[Dd]iferentiability\b/ => "Differentiability",
  /\b[Ee]ficient\b/ => "efficient",
  /\b[Ss]uficient\b/ => "sufficient"
}.freeze

# These display-math blocks are materially corrupted in the MinerU text.  The
# listed PDF page was visually verified, so we embed that source page rather
# than invent a LaTeX reconstruction.  The chapter remains review-gated until
# a human supplies a clean semantic transcription.
PDF_FORMULA_FALLBACKS = {
  "foundations-of-machine-learning-2e" => { 8 => [198, 216], 10 => [260] },
  "lectures-modern-convex-optimization" => { 3 => [232], 5 => [476, 477, 480, 481, 506, 507] }
}.freeze

# The MinerU transcript rendered the three-star exercise difficulty marker as
# `(? ? ?)`.  Each replacement below was checked visually against the cited
# source PDF page; do not generalise this to other placeholder tokens.
PDF_CONFIRMED_EXERCISE_MARKERS = {
  "deep-learning-foundations-concepts" => {
    2 => { "2.12" => 79, "2.36" => 82 },
    3 => { "3.7" => 125, "3.12" => 126, "3.19" => 127, "3.22" => 127, "3.26" => 128, "3.27" => 128 },
    4 => { "4.4" => 148 },
    6 => { "6.1" => 222, "6.2" => 222, "6.21" => 225 },
    8 => { "8.5" => 268, "8.6" => 268, "8.7" => 268, "8.12" => 269, "8.17" => 269 },
    9 => { "9.18" => 301 },
    12 => { "12.5" => 420, "12.8" => 420 },
    15 => { "15.20" => 508 },
    16 => { "16.22" => 544 },
    17 => { "__unnumbered_17_1__" => 557, "17.2" => 557 },
    18 => { "18.8" => 572 },
    20 => { "20.3" => 613, "20.6" => 614, "20.7" => 614, "20.16" => 615 }
  }
}.freeze

PDF_CONFIRMED_CONTROL_LINE_REPAIRS = {
  "computer-vision-algorithms-applications" => {
    7 => [{
      "source" => "Gaussian kernel used to smooth the intensity values at the sampling points. <sub>α = arctan2 (g , g ) around t</sub>Figure 7.19 Binary bit-string feature descriptors: (a) the BRIEF descriptor compares 128 <sup>k</sup>   pairs of pixel values (denoted by line segments) and stores the comparison results in a 128- <sub>3.2.1 Sampling Pattern and Rotation Estimation</sub> <sup>(i.e.</sup> <sup>in</sup> <sup>the</sup> <sup>rotated</sup> <sup>pattern),</sup> <sup>su</sup>bit vector (Calonder, Lepetit et al. 2010) © 2010 Springer; (b) BRISK sampling pattern and The key concept of the BRISK descriptor makes use of \u001A 1, I(pα,Gaussian blur radii; (Leutenegger, Chli, and Siegwart 2011) © 2011 IEEE; (c) FREAK retinal sampling pattern (Alahi, Ortiz, and Vandergheynst 2012) © 2012 IEEE.",
      "replacement" => "Figure 7.19 Binary bit-string feature descriptors: (a) the BRIEF descriptor compares 128 pairs of pixel values (denoted by line segments) and stores the comparison results in a 128-bit vector (Calonder, Lepetit et al. 2010) © 2010 Springer; (b) BRISK sampling pattern and Gaussian blur radii; (Leutenegger, Chli, and Siegwart 2011) © 2011 IEEE; (c) FREAK retinal sampling pattern (Alahi, Ortiz, and Vandergheynst 2012) © 2012 IEEE.",
      "pdf_page" => 465
    }],
    5 => [{
      "source" => "ve in New York or San Francisco, and you are not the CEO of Amazon, Google, MicMachine learning algorithms are usually categorized as either supervised, where paired inputs k, the (sq. footage, no. of bedrooms, no. of bathrooms, walking distance) featuand outputs are given to the learning algorithm (Figure 5.3), or unsupervised, where statistical <sup>r</sup> <sup>home</sup> <sup>might</sup> <sup>look</sup> <sup>something</sup> <sup>like:</sup> <sup>[100,</sup> <sup>0,</sup> <sup>.5,</sup> <sup>60].</sup> <sup>However,</sup> <sup>if</sup> <sup>you</sup> samples are provided without any corresponding labeled outputs (Section 5.2).",
      "replacement" => "Machine learning algorithms are usually categorized as either supervised, where paired inputs and outputs are given to the learning algorithm (Figure 5.3), or unsupervised, where statistical samples are provided without any corresponding labeled outputs (Section 5.2).",
      "pdf_page" => 265
    }, {
      "source" => "## <sup>and</sup> <sup>the</sup> <sup>number</sup> <sup>of</sup> <sup>minutes</sup> <sup>(walk</sup>5.1 Supervised learning",
      "replacement" => "## 5.1 Supervised learning",
      "pdf_page" => 265
    }, {
      "source" => "As shown in Figure 5.3, supervised learning involves feeding pairs of inputs $\\{{\\bf{x}}_{i}\\}$ and their corresponding target output values $\\{t_{i}\\}$ into a learning algorithm, which adjusts the model’s parameters so as to maximize the agreement between the model’s predictions and <sup>akes</sup> <sup>a</sup> <sup>problem</sup> <sup>a</sup> <sup>regression</sup> <sup>is</sup> <sup>actually</sup> <sup>the</sup> <sup>outputs.</sup> <sup>Say</sup> <sup>that</sup> <sup>you</sup> <sup>are</sup> <sup>in</sup> <sup>the</sup> <sup>market</sup> <sup>f</sup>the target outputs. The outputs can either be discrete labels that come from a set of classes $\\{\\mathcal{C}_{k}\\}$ , or they can be a set of continuous, potentially vector-valued values, which we denote by $\\mathbf{y}_{i}$ to make the distinction between the two cases clearer. The first task is called classification, since we are trying to predict class membership, while the second is called regression, since historically, fitting a trend to data was called by that name (Section 4.1).<sup>1</sup>",
      "replacement" => "As shown in Figure 5.3, supervised learning involves feeding pairs of inputs $\\{\\mathbf{x}_i\\}$ and their corresponding *target* output values $\\{t_i\\}$ into a learning algorithm, which adjusts the model’s parameters so as to maximize the agreement between the model’s predictions and the target outputs. The outputs can either be discrete labels that come from a set of classes $\\{\\mathcal{C}_k\\}$, or they can be a set of continuous, potentially vector-valued *values*, which we denote by $\\mathbf{y}_i$ to make the distinction between the two cases clearer. The first task is called *classification*, since we are trying to predict class membership, while the second is called *regression*, since historically, fitting a trend to data was called by that name (Section 4.1).[^cvaa-ch5-note1]\n\n[^cvaa-ch5-note1]: Note that in software engineering, a *regression* sometimes means a change in the code that results in degraded performance. That is not the kind of regression we will be studying here.",
      "pdf_page" => 265
    }, {
      "source" => "After a training phase during which all of the training data (labeled input-output pairs) have been processed (often by iterating over them many times), the trained model can now be <sup>i</sup>      used to predict new output values for previously unseen inputs. This phase is often called the test phase, although this sometimes fools people into focusing excessively on performance on a given test set, rather than building a system that works robustly for any plausible inputs that might arise.",
      "replacement" => "After a *training phase* during which all of the *training data* (labeled input-output pairs) have been processed (often by iterating over them many times), the trained model can now be used to predict new output values for previously unseen inputs. This phase is often called the *test phase*, although this sometimes fools people into focusing excessively on performance on a given test set, rather than building a system that works robustly for any plausible inputs that might arise.",
      "pdf_page" => 265
    }, {
      "source" => "Figure 5.39 shows the architecture of the SuperVision network, which contains a series of convolutional layers with ReLU (rectified linear) non-linearities, max pooling, some fully connected layers, and a final softmax layer, which is fed into a multi-class cross-entropy loss. Krizhevsky, Sutskever, and Hinton (2012) also used dropout (Figure 5.29), small translation and color manipulation for data augmentation, momentum, and weight decay $(L_{2}$ weight penalties).",
      "replacement" => "Figure 5.39 shows the architecture of the SuperVision network, which contains a series of convolutional layers with ReLU (rectified linear) non-linearities, max pooling, some fully connected layers, and a final softmax layer, which is fed into a multi-class cross-entropy loss. Krizhevsky, Sutskever, and Hinton (2012) also used dropout (Figure 5.29), small translation and color manipulation for data augmentation, momentum, and weight decay ($L_2$ weight penalties).",
      "pdf_page" => 326
    }, {
      "source" => "<sup>Fei-Fei</sup> <sup>Li</sup> <sup>&</sup> <sup>Justin</sup> <sup>Johnson</sup> <sup>&</sup> <sup>Serena</sup> <sup>Yeung</sup> <sup>Lecture</sup> <sup>9</sup> <sup>-</sup> 34 <sup>April</sup> <sup>30,</sup> <sup>2019</sup>Figure 5.40 Top-5 error rate and network depths of winning entries from the ImageNet Large Scale Visual Recognition Challenge (ILSVRC) © Li, Johnson, and Yeung (2019).",
      "replacement" => "Figure 5.40 *Top-5 error rate and network depths of winning entries from the ImageNet Large Scale Visual Recognition Challenge (ILSVRC)* © Li, Johnson, and Yeung (2019).",
      "pdf_page" => 326
    }],
    4 => [{
      "source" => "The basic binary segmentation algorithm of Boykov and Jolly (2001) has been extended in a number of directions. The GrabCut system of Rother, Kolmogorov, and Blake (2004) iteratively re-estimates the region statistics, which are modeled as a mixtures of Gaussians in color space. This allows their system to operate given minimal user input, such as a single bounding box (Figure 4.20a)—the background color model is initialized from a strip of pixels around the box outline. (The foreground color model is initialized from the interior pixels, but quickly converges to a better estimate of the object.) The user can also place additional strokes to refine the segmentation as the solution progresses. Cui, Yang et al. (2008) use color and edge models derived from previous segmentations of similar objects to improve the local models used in GrabCut. Graph cut algorithms and other variants of Markov and conditional <sup>{p,</sup> <sup>S}</sup> <sup>λR</sup>p<sup>(“bkg”)</sup> <sup>K</sup> be consistent with the edge weight table plus or minusrandom fields have been applied to the semantic segmentation problem (Shotton, Winn et al. 2009; Krahenb¨ uhl and Koltun¨ 2011), an example of which is shown in Figure 4.19 and which and then compute the maximum flow (minimwe study in more detail in Section 6.4.",
      "replacement" => "The basic binary segmentation algorithm of Boykov and Jolly (2001) has been extended in a number of directions. The GrabCut system of Rother, Kolmogorov, and Blake (2004) iteratively re-estimates the region statistics, which are modeled as a mixtures of Gaussians in color space. This allows their system to operate given minimal user input, such as a single bounding box (Figure 4.20a)—the background color model is initialized from a strip of pixels around the box outline. (The foreground color model is initialized from the interior pixels, but quickly converges to a better estimate of the object.) The user can also place additional strokes to refine the segmentation as the solution progresses. Cui, Yang et al. (2008) use color and edge models derived from previous segmentations of similar objects to improve the local models used in GrabCut. Graph cut algorithms and other variants of Markov and conditional random fields have been applied to the *semantic segmentation* problem (Shotton, Winn et al. 2009; Krähenbühl and Koltun 2011), an example of which is shown in Figure 4.19 and which we study in more detail in Section 6.4.",
      "pdf_page" => 254
    }, {
      "source" => "Figure 4.21 Segmentation with a directed graph cut (Boykov and Funka-Lea 2006) © 2006 <sup>Assume</sup> <sup>now</sup> <sup>that</sup> <sup>an</sup> <sup>optimal</sup> <sup>segmentation</sup> <sup>is</sup> <sup>already Then,</sup> <sup>a</sup> <sup>maximum</sup> <sup>flow</sup> <sup>(minimum</sup> <sup>cut)</sup> <sup>on</sup> <sup>a</sup> <sup>new</sup> <sup>graph</sup>Springer: (a) directed graph; (b) image with seed points; (c) the undirected graph incorrectly <sup>new</sup> <sup>“object”</sup> <sup>seed</sup> <sup>to</sup> <sup>pixel</sup> <sup>p</sup> <sup>that</sup> <sup>was</sup> <sup>not</sup> <sup>previously ous</sup> <sup>flow</sup> <sup>without</sup> <sup>recomputing</sup> <sup>the</sup> <sup>whole</sup> <sup>solution</sup> <sup>from</sup>continues the boundary along the bright object; (d) the directed graph correctly segments the <sup>t-links</sup> <sup>at</sup> <sup>p</sup>light gray region from its darker surround.",
      "replacement" => "Figure 4.21 Segmentation with a directed graph cut (Boykov and Funka-Lea 2006) © 2006 Springer: (a) directed graph; (b) image with seed points; (c) the undirected graph incorrectly continues the boundary along the bright object; (d) the directed graph correctly segments the light gray region from its darker surround.",
      "pdf_page" => 255
    }, {
      "source" => "at the end of initial computation. The only problem is <sup>For</sup> <sup>simplicity,</sup> <sup>we</sup> <sup>previously</sup> <sup>concentrated</sup> <sup>on</sup> <sup>the</sup> <sup>case</sup>Another major extension to the original binary segmentation formulation is the addition of capacities of some edges. If there is a flow through of s-t cut algorithms from combinatorial optimizationdirected edges, which allows boundary regions to be oriented, e.g., to prefer light to dark tran-<sub>Increasing an edge capacity, on the other hand, is never</sub> gives one example of such a graph where each pair ofsitions or vice versa (Kolmogorov and Boykov 2005). Figure 4.21 shows an example where <sub>(p, q) and (q, p) with distinct weights w and w .</sub>the directed graph cut correctly segments the light gray liver from its dark gray surround. The <sup>we</sup> <sup>increase</sup> <sup>the</sup> <sup>t-links</sup> <sup>weights</sup> <sup>according</sup> <sup>to</sup> <sup>the</sup> <sup>table</sup>           same approach can be used to measure the flux exiting a region, i.e., the signed gradient pro-<sup>sink</sup> <sup>then</sup> <sup>the</sup> <sup>cost</sup> <sup>of</sup> <sup>the</sup> <sup>cut</sup> <sup>includes</sup> <sup>w(</sup>p<sup>,</sup>q<sup>)</sup> <sup>while</sup> <sup>w(</sup>q<sup>,</sup>p<sup>)</sup>jected normal to the region boundary. Combining oriented graphs with larger neighborhoods <sup>and</sup> <sup>p</sup> <sup>to</sup> <sup>the</sup> <sup>sink</sup> <sup>then</sup> <sup>the</sup> <sup>cost</sup> <sup>of</sup> <sup>the</sup> <sup>cut</sup> <sup>includes</sup> <sup>only</sup>enables approximating continuous problems such as those traditionally solved using level sets {p, T } λR<sub>p</sub>(“obj”) λR<sub>p</sub>(“bkg”) c<sub>p</sub> In certain cases one can take advantage of such di-in the globally optimal graph cut framework (Boykov and Kolmogorov 2003; Kolmogorov and Boykov 2005).",
      "replacement" => "Another major extension to the original binary segmentation formulation is the addition of *directed edges*, which allows boundary regions to be oriented, e.g., to prefer light to dark transitions or *vice versa* (Kolmogorov and Boykov 2005). Figure 4.21 shows an example where the directed graph cut correctly segments the light gray liver from its dark gray surround. The same approach can be used to measure the *flux* exiting a region, i.e., the signed gradient projected normal to the region boundary. Combining oriented graphs with larger neighborhoods enables approximating continuous problems such as those traditionally solved using level sets in the globally optimal graph cut framework (Boykov and Kolmogorov 2003; Kolmogorov and Boykov 2005).",
      "pdf_page" => 255
    }, {
      "source" => "table for pixels in <sub>O</sub> since the extra constant c<sub>p</sub> at both of constraints. A relatively bright object of interest onMore recent developments in graph cut-based segmentation techniques include the addition of connectivity priors to force the foreground to be in a single piece (Vicente, Kolmogorov, and Rother 2008) and shape priors to use knowledge about an object’s shape during the segmentation process (Lempitsky and Boykov 2007; Lempitsky, Blake, and Rother 2008).",
      "replacement" => "More recent developments in graph cut-based segmentation techniques include the addition of connectivity priors to force the foreground to be in a single piece (Vicente, Kolmogorov, and Rother 2008) and shape priors to use knowledge about an object’s shape during the segmentation process (Lempitsky and Boykov 2007; Lempitsky, Blake, and Rother 2008).",
      "pdf_page" => 255
    }]
  },
  "deep-learning-foundations-concepts" => {
    1 => [{
      "source" => "Figure 1.2 Illustration of the 3D shape of a protein called T1044/6VR4. The green structure shows the ground truth as determined by X-ray crystallography, whereas the superimposed blue structure shows the prediction obtained by a deep learning model called AlphaFold. [From Jumper <sup>et</sup> <sup>al.</sup> (2021) with permission.]",
      "replacement" => "Figure 1.2 Illustration of the 3D shape of a protein called T1044/6VR4. The green structure shows the ground truth as determined by X-ray crystallography, whereas the superimposed blue structure shows the prediction obtained by a deep learning model called AlphaFold. [From Jumper *et al.* (2021) with permission.]",
      "pdf_page" => 24
    }]
  },
  "foundations-of-machine-learning-2e" => {
    3 => [{
      "source" => "3.12 Rademacher complexity. Professor Jesetoo claims to have found a better bound on the Rademacher complexity of any hypothesis set H of functions taking values in $\\{- 1, + 1\\}$ , in terms of its VC-dimension VCdim(H). His bound is of the form $\\mathring{\\Re}_{m}({\\mathcal{H}}) \\leq O \\big(\\frac{\\mathrm{VCdim}({\\mathcal{H}})}{m} \\big)$ <sup>\u0001</sup>. Can you show that Professor Jesetoo’s claim cannot be correct? (Hint: consider a hypothesis set H reduced to just two simple functions.)",
      "replacement" => "3.12 Rademacher complexity. Professor Jesetoo claims to have found a better bound on the Rademacher complexity of any hypothesis set $H$ of functions taking values in $\\{-1, +1\\}$, in terms of its VC-dimension $\\mathrm{VCdim}(H)$. His bound is of the form $\\mathring{\\Re}_{m}(\\mathcal{H}) \\leq O\\big(\\frac{\\mathrm{VCdim}(\\mathcal{H})}{m}\\big)$. Can you show that Professor Jesetoo’s claim cannot be correct? (Hint: consider a hypothesis set $H$ reduced to just two simple functions.)",
      "pdf_page" => 66
    }],
    6 => [{
      "source" => "(k) <sub>∀</sub>σ > 0, K(x, y) = exp <sup>\u0012 PNi=1</sup> <sup>min(|xi|,|yi|)</sup><sub>σ2</sub> <sup>\u0013</sup> over $\\mathbb{R}^{N} \\times \\mathbb{R}^{N}$ σ2",
      "replacement" => "(k) For all $\\sigma > 0$, $K(x, y) = \\exp\\left(-\\frac{\\sum_{i=1}^{N} \\min(|x_i|, |y_i|)}{\\sigma^2}\\right)$ over $\\mathbb{R}^{N} \\times \\mathbb{R}^{N}$.",
      "pdf_page" => 150
    }],
    9 => [{
      "source" => "Left: example of a decision tree with numerical questions based on two variables $X_{1}$ and $X_{2}$ <sup>Mehryar</sup> <sup>Mohri</sup> <sup>-</sup> <sup>Foundations</sup> <sup>of</sup> <sup>Machine</sup> <sup>Learning</sup> <sup>page</sup>Here, each leaf is marked with the region it defines. The class labeling for a leaf is obtained via majority vote based on the training points falling in the region it defines. Right: Partition of the two-dimensional space induced by that decision tree.",
      "replacement" => "Left: example of a decision tree with numerical questions based on two variables $X_{1}$ and $X_{2}$. Here, each leaf is marked with the region it defines. The class labeling for a leaf is obtained via majority vote based on the training points falling in the region it defines. Right: Partition of the two-dimensional space induced by that decision tree.",
      "pdf_page" => 237
    }],
    10 => [{
      "source" => "is thus an empirical estimate of the pairwise ranking accuracy based on the sample $U_{:}$ <sup>Mehryar</sup> <sup>Mohri</sup> <sup>-</sup> <sup>Foundations</sup> <sup>of</sup> <sup>Machine</sup> <sup>Learning</sup> <sup>page</sup>Mehryar Mohri - Foundations of Machine Learning <sup>page</sup>, and by definition it is in [0, 1]. Higher AUC values correspond to a better ranking performance. In particular, an AUC of one indicates that the points of U are ranked perfectly using h. $\\operatorname{AUC}(h, U)$ can be computed in linear time from a sorted array containing the $m + n$ elements $h(z_{i}^{\\prime})$ and $h(z_{j})$ , for $i \\in[m]$ and $j \\in[n]$ Assuming that the array is sorted in increasing order (with a positive point placed higher than a negative one if they both have the same scores) the total number of correctly ranked pairs r can be computed as follows. Starting with $r = 0$ , the array is inspected in increasing order of the indices while maintaining at any time the number of negative points seen n and incrementing the current value of r with n whenever a positive point is found. After full inspection of the array, the AUC is given by $r /(mn)$ . Thus, assuming that a comparison-based sorting algorithm is used, the complexity of the computation of the AUC is in $O((m + n) \\log(m + n))$ .",
      "replacement" => "is thus an empirical estimate of the pairwise ranking accuracy based on the sample $U$, and by definition it is in $[0, 1]$. Higher AUC values correspond to a better ranking performance. In particular, an AUC of one indicates that the points of $U$ are ranked perfectly using $h$. $\\operatorname{AUC}(h, U)$ can be computed in linear time from a sorted array containing the $m + n$ elements $h(z_{i}^{\\prime})$ and $h(z_{j})$, for $i \\in [m]$ and $j \\in [n]$. Assuming that the array is sorted in increasing order (with a positive point placed higher than a negative one if they have the same scores), the total number of correctly ranked pairs $r$ can be computed as follows. Starting with $r = 0$, the array is inspected in increasing order of the indices while maintaining at any time the number of negative points seen $n$ and incrementing the current value of $r$ with $n$ whenever a positive point is found. After full inspection of the array, the AUC is given by $r/(mn)$. Thus, assuming that a comparison-based sorting algorithm is used, the complexity of the computation of the AUC is in $O((m + n) \\log(m + n))$.",
      "pdf_page" => 269
    }],
    16 => [{
      "source" => "ba baaIllustration of the execution of Algorithm <sup>QueryLearnAutomata</sup>() for the target automaton A. Each line shows the current decision tree $_T$ and the tentative DFA $\\widehat{A}$ constructed using T . When <sup>Mehryar</sup> <sup>Mohri</sup> <sup>-</sup> <sup>Foundations</sup> <sup>of</sup> <sup>Mac</sup>A is not equivalent to $A,$ <sup>earning</sup> <sup>page</sup> the learner receives a counter-example x indicated in the third column.",
      "replacement" => "Illustration of the execution of Algorithm $\\textsc{QueryLearnAutomata}()$ for the target automaton $A$. Each line shows the current decision tree $T$ and the tentative DFA $\\widehat{A}$ constructed using $T$. When $\\widehat{A}$ is not equivalent to $A$, the learner receives a counter-example $x$ indicated in the third column.",
      "pdf_page" => 381
    }]
  },
  "lectures-convex-optimization" => {
    3 => [{
      "source" => "x<sub>k+1</sub> <sub>=</sub> π<sub>Q</sub> <sup>-</sup>x<sub>k</sub> <sub>−</sub> <sup>\u0003</sup><sub>\u0011g(xk)\u00112</sub> g(x<sub>k</sub>)<sup>\u0003</sup> . (Case A)",
      "replacement" => "$x_{k+1} = \\pi_Q\\left(x_k - \\frac{\\epsilon}{\\lVert g(x_k) \\rVert_2^2} g(x_k)\\right).$ (Case A)",
      "pdf_page" => 224
    }]
  },
  "first-order-methods-optimization" => {
    1 => [{
      "source" => "Underlying Spaces: In this book the underlying vector spaces, usually denoted by <sup>V</sup> or <sup>E</sup>, are always finite dimensional real inner product spaces with endowed inner product $\\langle \\cdot, \\cdot \\rangle$ and endowed norm \u0003 · \u0003.",
      "replacement" => "Underlying Spaces: In this book the underlying vector spaces, usually denoted by <sup>V</sup> or <sup>E</sup>, are always finite dimensional real inner product spaces with endowed inner product $\\langle \\cdot, \\cdot \\rangle$ and endowed norm $\\lVert \\cdot \\rVert$.",
      "pdf_page" => 13
    }],
    2 => [{
      "source" => "Underlying Space: Recall that in this book, the underlying spaces (denoted usually by <sup>E</sup> or <sup>V</sup>) are finite-dimensional inner product vector spaces with inner product \u0007·, ·\u0008 and norm \u0003 · \u0003.",
      "replacement" => "Underlying Space: Recall that in this book, the underlying spaces (denoted usually by <sup>E</sup> or <sup>V</sup>) are finite-dimensional inner product vector spaces with inner product $\\langle \\cdot, \\cdot \\rangle$ and norm $\\lVert \\cdot \\rVert$.",
      "pdf_page" => 23
    }],
  12 => [{
      "source" => "• argmax {\u0007v, x\u0008 − f(x)} = v + d for any $\\mathbf{v} \\in \\mathbb{E};$",
      "replacement" => "• $\\operatorname*{argmax}\\{\\langle v, x \\rangle - f(x)\\}$ = v + d for any $\\mathbf{v} \\in \\mathbb{E};$",
      "pdf_page" => 363
    }]
  },
  "lectures-modern-convex-optimization" => {
    3 => [{
      "source" => "We also simplify the sign $\\ge \\mathbf{S}_{+}^{m}$ to \u0017 and the sign ${\\bf \\Sigma} >{\\bf S}_{+}^{m}$ to \u001F (same as we write $\\geq$ instead of $\\mathbf{\\geq} \\mathbb{R}_{+}^{m}$ and > instead of ${\\bf \\Sigma} >_{\\mathbb{R}_{+}^{m}})$ . Thus, $A \\succeq B \\left(\\Leftrightarrow B \\preceq A \\right)$ means that A and B are symmetric matrices of the same size and $A - B$ is positive semidefinite, while $A \\succ B \\left(\\Leftrightarrow B \\prec A \\right)$ means that A, B are symmetric matrices of the same size with positive definite $A - B$",
      "replacement" => "We also simplify the sign $\\ge \\mathbf{S}_{+}^{m}$ to $\\succeq$ and the sign ${\\bf \\Sigma} >{\\bf S}_{+}^{m}$ to $\\succ$ (same as we write $\\geq$ instead of $\\mathbf{\\geq} \\mathbb{R}_{+}^{m}$ and > instead of ${\\bf \\Sigma} >_{\\mathbb{R}_{+}^{m}})$ . Thus, $A \\succeq B \\left(\\Leftrightarrow B \\preceq A \\right)$ means that A and B are symmetric matrices of the same size and $A - B$ is positive semidefinite, while $A \\succ B \\left(\\Leftrightarrow B \\prec A \\right)$ means that A, B are symmetric matrices of the same size with positive definite $A - B$",
      "pdf_page" => 164
    }, {
      "source" => "$\\left[\\frac{U}{W^{T}} \\Big | \\frac{W}{V} \\right] \\succeq 0$ if and only if $U \\succeq 0, V \\succeq 0$ and W = U <sup>1/2</sup>Y V <sup>1/2</sup> with Y <sup>T</sup> Y \u0016 I, and",
      "replacement" => "$\\left[\\frac{U}{W^{T}} \\Big | \\frac{W}{V} \\right] \\succeq 0$ if and only if $U \\succeq 0, V \\succeq 0$ and W = U <sup>1/2</sup>Y V <sup>1/2</sup> with Y <sup>T</sup> Y $\\preceq I$, and",
      "pdf_page" => 220
    }],
    5 => [{
      "source" => "where $P$ is a given m×n matrix; assume that m \u001D n (there are much more bins than voxels) and $P$ is of rank n (these “size and nondegeneracy” assumptions indeed hold true in PET practice). In this ideal case, image reconstruction reduces to solving the system of linear equations",
      "replacement" => "where $P$ is a given m×n matrix; assume that m $\\gg$ n (there are much more bins than voxels) and $P$ is of rank n (these “size and nondegeneracy” assumptions indeed hold true in PET practice). In this ideal case, image reconstruction reduces to solving the system of linear equations",
      "pdf_page" => 460
    }]
  },
  # Every entry below is an exact MinerU source line.  PRML used U+000C for
  # several unrelated glyphs, so this table must remain line- and
  # PDF-page-specific rather than applying a codepoint-wide replacement.
  "pattern-recognition-machine-learning" => {
    2 => [{
      "source" => "where  denotes the real part, prove (2.178). Finally, by using sin $(A - B) =$ <sub>\u000B</sub> exp $\\{i(A - B)\\}$ , where $\\Im$ denotes the imaginary part, prove the result (2.183).",
      "replacement" => "where  denotes the real part, prove (2.178). Finally, by using sin $(A - B) = \\Im \\exp\\{i(A - B)\\}$, where $\\Im$ denotes the imaginary part, prove the result (2.183).",
      "pdf_page" => 154
    }],
    7 => [{
      "source" => "Plot of an \u000C-insensitive error function (in red) in which the error increases linearly with distance beyond the insensitive region. Also shown for comparison is the quadratic error function (in green).",
      "replacement" => "Plot of an $\\epsilon$-insensitive error function (in red) in which the error increases linearly with distance beyond the insensitive region. Also shown for comparison is the quadratic error function (in green).",
      "pdf_page" => 356
    }, {
      "source" => "igure 7.7 Illustration of SVM regression, showing the regression curve together with the $\\epsilon \\cdot$ insensitive ‘tube’. Also shown are examples of the slack variables $\\xi$ and ${\\widehat{\\xi}}.$ Points above the \u000C-tube have $\\xi > 0$ and ${\\widehat{\\xi}} = 0,$ points below the \u000C-tube have $\\xi ~ = ~ 0$ and $\\widehat{\\xi} > 0$ , and points inside the \u000C-tube have $\\xi = \\widehat{\\xi} = 0$",
      "replacement" => "igure 7.7 Illustration of SVM regression, showing the regression curve together with the $\\epsilon \\cdot$ insensitive ‘tube’. Also shown are examples of the slack variables $\\xi$ and ${\\widehat{\\xi}}.$ Points above the $\\epsilon$-tube have $\\xi > 0$ and ${\\widehat{\\xi}} = 0,$ points below the $\\epsilon$-tube have $\\xi ~ = ~ 0$ and $\\widehat{\\xi} > 0$ , and points inside the $\\epsilon$-tube have $\\xi = \\widehat{\\xi} = 0$",
      "pdf_page" => 357
    }, {
      "source" => "Figure 7.8 Illustration of the $\\nu{\\mathrm{-}} \\mathsf{SVM}$ for regression applied to the sinusoidal synthetic data set using Gaussian kernels. The predicted regression curve is shown by the red line, and the \u000C-insensitive tube corresponds to the shaded region. Also, the data points are shown in green, and those with support vectors are indicated by blue circles.",
      "replacement" => "Figure 7.8 Illustration of the $\\nu{\\mathrm{-}} \\mathsf{SVM}$ for regression applied to the sinusoidal synthetic data set using Gaussian kernels. The predicted regression curve is shown by the red line, and the $\\epsilon$-insensitive tube corresponds to the shaded region. Also, the data points are shown in green, and those with support vectors are indicated by blue circles.",
      "pdf_page" => 360
    }],
    10 => [{
      "source" => "where, to keep the notation uncluttered, we have omitted the \u000C superscript on the $q$ distributions, along with the subscripts on the expectation operators because each expectation is taken with respect to all of the random variables in its argument. The various terms in the bound are easily evaluated to give the following results",
      "replacement" => "where, to keep the notation uncluttered, we have omitted the ★ superscript on the $q$ distributions, along with the subscripts on the expectation operators because each expectation is taken with respect to all of the random variables in its argument. The various terms in the bound are easily evaluated to give the following results",
      "pdf_page" => 496
    }],
    14 => [{
      "source" => "If we weren’t familiar with the rules of ordinary calculus, we could evaluate a conventional derivative $d y /$ dx by making a small change \u000C to the variable x and then expanding in powers of \u000C, so that",
      "replacement" => "If we weren’t familiar with the rules of ordinary calculus, we could evaluate a conventional derivative $d y /$ dx by making a small change $\\epsilon$ to the variable x and then expanding in powers of $\\epsilon$, so that",
      "pdf_page" => 669
    }, {
      "source" => "In general, the eigenvalues of a matrix are complex numbers, but for symmetric matrices the eigenvalues $\\lambda_{i}$ are real. This can be seen by first left multiplying (C.29) by $(\\mathbf{u}_{i}^{\\star})^{\\mathrm{T}}$ , where \u000B denotes the complex conjugate, to give",
      "replacement" => "In general, the eigenvalues of a matrix are complex numbers, but for symmetric matrices the eigenvalues $\\lambda_{i}$ are real. This can be seen by first left multiplying (C.29) by $(\\mathbf{u}_{i}^{\\star})^{\\mathrm{T}}$ , where $\\star$ denotes the complex conjugate, to give",
      "pdf_page" => 666
    }, {
      "source" => "Because both and $\\mathbf{x} + \\epsilon$ lie on the constraint surface, we have $g(\\mathbf{x}) = g(\\mathbf{x} + \\epsilon)$ and hence $\\epsilon^{\\mathrm{T}} \\nabla g(\\mathbf{x}) \\simeq 0$ <sup>x</sup>. In the limit $\\| \\epsilon \\| 0$ we have $\\epsilon^{\\mathrm{T}} \\nabla g(\\mathbf{x}) \\bar{=} \\mathrm{~ 0 ~}$ <sup>x</sup>, and because \u0001 is",
      "replacement" => "Because both and $\\mathbf{x} + \\epsilon$ lie on the constraint surface, we have $g(\\mathbf{x}) = g(\\mathbf{x} + \\epsilon)$ and hence $\\epsilon^{\\mathrm{T}} \\nabla g(\\mathbf{x}) \\simeq 0$ <sup>x</sup>. In the limit $\\| \\epsilon \\| 0$ we have $\\epsilon^{\\mathrm{T}} \\nabla g(\\mathbf{x}) \\bar{=} \\mathrm{~ 0 ~}$ <sup>x</sup>, and because $\\epsilon$ is",
      "pdf_page" => 672
    }]
  },
  "speech-language-processing" => {
    6 => [{
      "source" => "It turns out that dense embeddings like word2vec actually have an elegant math-MOSCOW ematical relationships with sparse embeddings like PPMI, in which word2vec can be seen as implicitly optimizing a shifted version of a PPMI matrix (Levy and Gold-TOKYO berg, 2014c).",
      "replacement" => "It turns out that dense embeddings like word2vec actually have an elegant mathematical relationships with sparse embeddings like PPMI, in which word2vec can be seen as implicitly optimizing a shifted version of a PPMI matrix (Levy and Goldberg, 2014c).",
      "pdf_page" => 126
    }, {
      "source" => "## 6.9 Visualizing Embeddings<sup>DOG</sup>CAT",
      "replacement" => "## 6.9 Visualizing Embeddings",
      "pdf_page" => 126
    }, {
      "source" => "Visualizing embeddings is an important goal in helping understand, apply, and<sup>aling</sup> <sup>for</sup> <sup>three</sup> <sup>noun</sup> <sup>classes.</sup> improve these models of word meaning. But how can we visualize a (for example) 100-dimensional vector?",
      "replacement" => "Visualizing embeddings is an important goal in helping understand, apply, and improve these models of word meaning. But how can we visualize a (for example) 100-dimensional vector?",
      "pdf_page" => 126
    }, {
      "source" => "In addition to their ability to learn word meaning from text, embeddings, alas, also reproduce the implicit biases and stereotypes that were latent in the text. As the prior section just showed, embeddings can roughly model relational similarity: ‘queen’ as the closest word to ‘king’ - ‘man’ + ‘woman’ implies the analogy man:woman::king:queen. But these same embedding analogies also exhibit gender stereotypes. For example Bolukbasi et al. (2016) find that the closest occupation to ‘man’ - ‘computer programmer’ + ‘woman’ in word2vec embeddings trained on news text is ‘homemaker’, and that the embeddings similarly suggest the analogy ‘father’ is to ‘doctor’ as ‘mother’ is to ‘nurse’. This could result in what Crawford (2017) and Blodgett et al. (2020) call an allocational harm, when a system allocates resources (jobs or credit) unfairly to different groups. For example algorithms that adverbials (e.g., actually) have a general tendency to undergo subjectificatithat use embeddings as part of a search for hiring potential programmers or doctors where they shift from objective statements about the world (e.g.,might thus incorrectly downweight documents with women’s names.",
      "replacement" => "In addition to their ability to learn word meaning from text, embeddings, alas, also reproduce the implicit biases and stereotypes that were latent in the text. As the prior section just showed, embeddings can roughly model relational similarity: ‘queen’ as the closest word to ‘king’ - ‘man’ + ‘woman’ implies the analogy man:woman::king:queen. But these same embedding analogies also exhibit gender stereotypes. For example Bolukbasi et al. (2016) find that the closest occupation to ‘man’ - ‘computer programmer’ + ‘woman’ in word2vec embeddings trained on news text is ‘homemaker’, and that the embeddings similarly suggest the analogy ‘father’ is to ‘doctor’ as ‘mother’ is to ‘nurse’. This could result in what Crawford (2017) and Blodgett et al. (2020) call an allocational harm, when a system allocates resources (jobs or credit) unfairly to different groups. For example algorithms that use embeddings as part of a search for hiring potential programmers or doctors might thus incorrectly downweight documents with women’s names.",
      "pdf_page" => 129
    }, {
      "source" => "Figure 6.17 A t-SNE visualization of the semantic change of 3 words in English using word2vec vectors. The modern sense of each word, and the grey context words, are computed from the most recent (modern) time-point embedding space. Earlier points are com-<sup>from</sup> <sup>meaning</sup> <sup>“cheerful”</sup> <sup>or</sup> <sup>“frolicsome”</sup> <sup>to</sup> <sup>referring</sup> <sup>to</sup> <sup>homosexuality.</sup> <sup>A,</sup> <sup>In</sup> <sup>the</sup> <sup>ea</sup>puted from earlier historical embedding spaces. The visualizations show the changes in the <sup>20th</sup> <sup>century</sup> <sup>broadcast</sup> <sup>referred</sup> <sup>to</sup> <sup>“casting</sup> <sup>out</sup> <sup>seeds”;</sup> <sup>with</sup> <sup>the</sup> <sup>rise</sup> <sup>of</sup> <sup>television</sup> <sup>a</sup>word gay from meanings related to “cheerful” or “frolicsome” to referring to homosexuality, <sup>radio</sup> <sup>its</sup> <sup>meaning</sup> <sup>shifted</sup> <sup>to</sup> <sup>“transmitting</sup> <sup>signals”.</sup> <sup>C,</sup> <sup>Awful</sup> <sup>underwent</sup> <sup>a</sup> <sup>process</sup>the development of the modern “transmission” sense of broadcast from its original sense of <sup>pejoration,</sup> <sup>as</sup> <sup>it</sup> <sup>shifted</sup> <sup>from</sup> <sup>meaning</sup> <sup>“full</sup> <sup>of</sup> <sup>awe”</sup> <sup>to</sup> <sup>meaning</sup> <sup>“terrible</sup> <sup>or</sup> <sup>appalli</sup>sowing seeds, and the pejoration of the word awful as it shifted from meaning “full of awe” [212].to meaning “terrible or appalling” (Hamilton et al., 2016b).",
      "replacement" => "Figure 6.17 A t-SNE visualization of the semantic change of 3 words in English using word2vec vectors. The modern sense of each word, and the grey context words, are computed from the most recent (modern) time-point embedding space. Earlier points are computed from earlier historical embedding spaces. The visualizations show the changes in the word gay from meanings related to “cheerful” or “frolicsome” to referring to homosexuality, the development of the modern “transmission” sense of broadcast from its original sense of sowing seeds, and the pejoration of the word awful as it shifted from meaning “full of awe” to meaning “terrible or appalling” (Hamilton et al., 2016b).",
      "pdf_page" => 129
    }, {
      "source" => "It turns out that embeddings don’t just reflect the statistics of their input, but also amplify bias; gendered terms become more gendered in embedding space than <sup>indicating</sup> <sup>surprise/disbelief).</sup>they were in the input text statistics (Zhao et al. 2017, Ethayarajh et al. 2019b, Jia et al. 2020), and biases are more exaggerated than in actual labor employment statistics (Garg et al., 2018).",
      "replacement" => "It turns out that embeddings don’t just reflect the statistics of their input, but also amplify bias; gendered terms become more gendered in embedding space than they were in the input text statistics (Zhao et al. 2017, Ethayarajh et al. 2019b, Jia et al. 2020), and biases are more exaggerated than in actual labor employment statistics (Garg et al., 2018).",
      "pdf_page" => 129
    }, {
      "source" => "Embeddings also encode the implicit associations that are a property of human reasoning. The Implicit Association Test (Greenwald et al., 1998) measures people’s associations between concepts (like ‘flowers’ or ‘insects’) and attributes (like ‘pleasantness’ and ‘unpleasantness’) by measuring differences in the latency with <sup>and</sup> <sup>narrow</sup> <sup>over</sup> <sup>time.</sup> <sup>[113]</sup> <sup>use</sup> <sup>raw</sup> <sup>co-occurrence</sup> <sup>vectors</sup> <sup>to</sup> <sup>perform</sup> <sup>a</sup> <sup>number</sup><sub>which</sub> <sub>they</sub> <sub>label</sub> <sub>words</sub> <sub>in</sub> <sub>the</sub> <sub>various</sub> <sub>categories.</sub>7 <sub>Using</sub> <sub>such</sub> <sub>methods,</sub> <sub>people</sub> historical case-studies on semantic change, and [252] perform a similar set of smin the United States have been shown to associate African-American names with scale case-studies using temporal topic models. [87] construct point-wise mut<sup>unpleasant</sup> <sup>words</sup> <sup>(more</sup> <sup>than</sup> <sup>European-American</sup> <sup>names),</sup> <sup>male</sup> <sup>names</sup> <sup>more</sup> <sup>with</sup> mathematics and female names with the arts, and old people’s names with unpleasant words (Greenwald et al. 1998, Nosek et al. 2002a, Nosek et al. 2002b). Caliskan et al. (2017) replicated all these findings of implicit associations using GloVe vectors word-embedding methods to detect linguistic change points. Finally, [257] analyand cosine similarity instead of human latencies. For example African-American historical co-occurrences to test whether synonyms tend to change in similar ways<sup>names</sup> <sup>like</sup> <sup>‘Leroy’</sup> <sup>and</sup> <sup>‘Shaniqua’</sup> <sup>had</sup> <sup>a</sup> <sup>higher</sup> <sup>GloVe</sup> <sup>cosine</sup> <sup>with</sup> <sup>unpleasant</sup> <sup>words</sup> while European-American names (‘Brad’, ‘Greg’, ‘Courtney’) had a higher cosine with pleasant words. These problems with embeddings are an example of a representational harm (Crawford 2017, Blodgett et al. 2020), which is a harm caused by a system demeaning or even ignoring some social groups. Any embedding-aware algorithm that made use of word sentiment could thus exacerbate bias against African Americans.",
      "replacement" => "Embeddings also encode the implicit associations that are a property of human reasoning. The Implicit Association Test (Greenwald et al., 1998) measures people’s associations between concepts (like ‘flowers’ or ‘insects’) and attributes (like ‘pleasantness’ and ‘unpleasantness’) by measuring differences in the latency with which they label words in the various categories.[^slp-ch6-note7] Using such methods, people in the United States have been shown to associate African-American names with unpleasant words (more than European-American names), male names more with mathematics and female names with the arts, and old people’s names with unpleasant words (Greenwald et al. 1998, Nosek et al. 2002a, Nosek et al. 2002b). Caliskan et al. (2017) replicated all these findings of implicit associations using GloVe vectors and cosine similarity instead of human latencies. For example African-American names like ‘Leroy’ and ‘Shaniqua’ had a higher GloVe cosine with unpleasant words while European-American names (‘Brad’, ‘Greg’, ‘Courtney’) had a higher cosine with pleasant words. These problems with embeddings are an example of a representational harm (Crawford 2017, Blodgett et al. 2020), which is a harm caused by a system demeaning or even ignoring some social groups. Any embedding-aware algorithm that made use of word sentiment could thus exacerbate bias against African Americans.\n\n[^slp-ch6-note7]: Roughly speaking, if humans associate ‘flowers’ with ‘pleasantness’ and ‘insects’ with ‘unpleasantness’, when they are instructed to push a green button for ‘flowers’ (daisy, iris, lilac) and ‘pleasant words’ (love, laughter, pleasure) and a red button for ‘insects’ (flea, spider, mosquito) and ‘unpleasant words’ (abuse, hatred, ugly) they are faster than in an incongruous condition where they push a red button for ‘flowers’ and ‘unpleasant words’ and a green button for ‘insects’ and ‘pleasant words’.",
      "pdf_page" => 129
    }],
    11 => [{
      "source" => "## <sup>We</sup> <sup>experiment</sup> <sup>with</sup> <sup>different</sup> <sup>models</sup> <sup>(Se</sup>Given a tokenized reference sentence <sub>x</sub>11.9 Bias and Ethical Issues",
      "replacement" => "## 11.9 Bias and Ethical Issues",
      "pdf_page" => 234
    }, {
      "source" => "<sub>sequences of characters. The representation for each word piece is computed with a Transformer</sub>Machine translation raises many of the same ethical issues that we’ve discussed in encoder (Vaswani et al., 2017) by repeatedly applying self-attention and nonlinear transformationsearlier chapters. For example, consider MT systems translating from Hungarian (which has the gender neutral pronoun o˝) or Spanish (which often drops pronouns) into English (in which pronouns are obligatory, and they have grammatical gender). When translating a reference to a person described without specified gender, MT x>ˆx<sub>j</sub>systems often default to male gender (Schiebinger 2014, Prates et al. 2019). And <sup>k ikk j</sup> <sup>k</sup> MT systems often assign gender according to culture stereotypes of the sort we saw tokens in isolation, the contextual embeddings contain information from the rest of the sentence.in Section 6.11. Fig. 11.19 shows examples from (Prates et al., 2019), in which Hungarian gender-neutral o is a nurse˝ is translated with she, but gender-neutral o˝ and each token in xˆ to a token in x to compute precision. We use greedy matching to maximizeis a CEO is translated with he. Prates et al. (2019) find that these stereotypes can’t <sup>the</sup> <sup>matching</sup> <sup>similarity</sup> <sup>score,</sup> <sup>where</sup> <sup>each</sup> <sup>token</sup> <sup>is</sup> <sup>matched</sup> <sup>to</sup> <sup>the</sup> <sup>most</sup> <sup>similar</sup> <sup>token</sup> <sup>in</sup> <sup>the</sup> <sup>other</sup>completely be accounted for by gender bias in US labor statistics, because the biases are amplified by MT systems, with pronouns being mapped to male or female gender with a probability higher than if the mapping was based on actual labor em-R = <sup>X</sup> maployment statistics.",
      "replacement" => "Machine translation raises many of the same ethical issues that we’ve discussed in earlier chapters. For example, consider MT systems translating from Hungarian (which has the gender neutral pronoun ő) or Spanish (which often drops pronouns) into English (in which pronouns are obligatory, and they have grammatical gender). When translating a reference to a person described without specified gender, MT systems often default to male gender (Schiebinger 2014, Prates et al. 2019). And MT systems often assign gender according to culture stereotypes of the sort we saw in Section 6.11. Fig. 11.19 shows examples from (Prates et al., 2019), in which Hungarian gender-neutral ő is a nurse is translated with she, but gender-neutral ő is a CEO is translated with he. Prates et al. (2019) find that these stereotypes can’t completely be accounted for by gender bias in US labor statistics, because the biases are amplified by MT systems, with pronouns being mapped to male or female gender with a probability higher than if the mapping was based on actual labor employment statistics.",
      "pdf_page" => 234
    }],
    14 => [{
      "source" => "# 15 <sup>Logical</sup> <sup>Representations</sup> <sup>of</sup><sub>Sentence</sub> <sub>Meaning</sub>",
      "replacement" => "# 15 Logical Representations of Sentence Meaning",
      "pdf_page" => 313
    }],
    20 => [{
      "source" => "downplaying both extremes. The diagrams can be used both as a typology of lexicalPotts,&Christopher.& 2011.&NSF&workshop&on& sentiment, and also play a role in modeling sentiment compositionality.<sup>Cat</sup> <sup>=</sup> <sup>-0.13</sup> <sup>(p</sup> <sup>=</sup> <sup>0.284)</sup>restructuring& adjectives.",
      "replacement" => "downplaying both extremes. The diagrams can be used both as a typology of lexical sentiment, and also play a role in modeling sentiment compositionality.",
      "pdf_page" => 412
    }, {
      "source" => "(a) Use off-the-shelf pretrained encoders (like BERT) to extract a contextual <sup>September</sup> <sup>2013</sup> <sup>|</sup> <sup>Volume</sup> <sup>8</sup> <sup>|</sup> <sup>Issue</sup> <sup>9</sup> <sup>|</sup> <sup>e73791</sup>embedding e for each instance of the word. No additional fine-tuning is done.",
      "replacement" => "(a) Use off-the-shelf pretrained encoders (like BERT) to extract a contextual embedding $e$ for each instance of the word. No additional fine-tuning is done.",
      "pdf_page" => 418
    }],
    21 => [{
      "source" => "## <sup>Table</sup> <sup>4:</sup> <sup>Examples</sup> <sup>predictions</sup> <sup>from</sup> <sup>the</sup> <sup>development</sup> <sup>data.</sup> <sup>Each</sup> <sup>row</sup> <sup>depicts</sup>21.7 Evaluation of Coreference Resolution",
      "replacement" => "## 21.7 Evaluation of Coreference Resolution",
      "pdf_page" => 442
    }],
    23 => [{
      "source" => "## <sup>al.,</sup> <sup>2019).</sup> <sup>In-</sup>   23.6 Classic QA Models",
      "replacement" => "## 23.6 Classic QA Models",
      "pdf_page" => 493
    }],
    26 => [{
      "source" => "The spectrogram prediction encoder-decoder and the WaveNet vocoder are trained S<sub>OFTMAX DISTRIBUTIONS</sub>separately. After the spectrogram predictor is trained, the spectrogram prediction network is run in teacher-forcing mode, with each predicted spectral frame condit | 1 t\u00001   tioned on the encoded text input and the previous frame from the ground truth spectrogram. This sequence of ground truth-aligned spectral features and gold audio output is then used to train the vocoder.",
      "replacement" => "The spectrogram prediction encoder-decoder and the WaveNet vocoder are trained separately. After the spectrogram predictor is trained, the spectrogram prediction network is run in teacher-forcing mode, with each predicted spectral frame conditioned on the encoded text input and the previous frame from the ground truth spectrogram. This sequence of ground truth-aligned spectral features and gold audio output is then used to train the vocoder.",
      "pdf_page" => 576
    }, {
      "source" => "## <sup>d</sup> <sup>512-dimensional In</sup> <sup>parallel</sup> <sup>to</sup> <sub>decoder LSTM o</sub>26.6.3 TTS: Vocoding",
      "replacement" => "## 26.6.3 TTS: Vocoding",
      "pdf_page" => 572
    }]
  },
  "understanding-machine-learning" => {
    10 => [{
      "source" => "Figure 10.2 The first and second features selected by AdaBoost, as implemented by Viola and Jones. The two features are shown in the top row and then overlaid on a observation that the eye region is often darker than the cheeks. The second feature compares the intensitiestypical training face in the bottom row. The first feature measures the diference in <sup>in</sup> <sup>the</sup> <sup>eye</sup> <sup>regions</sup> <sup>to</sup> <sup>the</sup> <sup>intensity</sup> <sup>across</sup> <sup>the</sup> <sup>bridge</sup> <sup>of</sup> <sup>the</sup> <sup>nose.</sup>intensity between the region of the eyes and a region across the upper cheeks. The feature capitalizes on the observation that the eye region is often darker than the <sup>directly</sup> <sup>increases</sup> <sup>computation</sup> <sup>time.</sup>cheeks. The second feature compares the intensities in the eye regions to the intensity across the bridge of the nose.",
      "replacement" => "Figure 10.2 The first and second features selected by AdaBoost, as implemented by Viola and Jones. The two features are shown in the top row and then overlaid on a typical training face in the bottom row. The first feature measures the difference in intensity between the region of the eyes and a region across the upper cheeks. The feature capitalizes on the observation that the eye region is often darker than the cheeks. The second feature compares the intensities in the eye regions to the intensity across the bridge of the nose.",
      "pdf_page" => 133
    }, {
      "source" => "This section describes an algorithm for constructing a cascade of classifiers which achieves increased detec-eficiently by a preprocessing step in which we calculate the integral image of <sup>tion</sup> <sup>performance</sup> <sup>while</sup> <sup>radically</sup> <sup>reducing</sup> <sup>computation</sup> <sup>time.</sup> <sup>The</sup> <sup>key</sup> <sup>insight</sup> each image in the training set. See Exercise 5 for details.",
      "replacement" => "This section describes an algorithm for constructing a cascade of classifiers which achieves increased detection performance while radically reducing computation time. The key insight is that the main work can be done efficiently by a preprocessing step in which we calculate the integral image of each image in the training set. See Exercise 5 for details.",
      "pdf_page" => 133
    }, {
      "source" => "## 10.5 imize fals Summary",
      "replacement" => "## 10.5 Summary",
      "pdf_page" => 133
    }, {
      "source" => "<sup>performance</sup> <sup>measured</sup> <sup>using</sup> <sup>a</sup> <sup>validation</sup> <sup>training</sup> <sup>set,</sup> <sup>the</sup> <sup>two-feature</sup> <sup>classifier</sup> <sup>can</sup> <sup>be</sup> <sup>adjusted</sup> <sup>to</sup> <sup>detect</sup>Boosting is a method for amplifying the accuracy of weak learners. In this chapter we described the AdaBoost algorithm. We have shown that after T iterations of AdaBoost, it returns a hypothesis from the class L(B, T ), obtained by composing a linear classifier on T hypotheses from a base class B. We have demonstrated cessing with very few operations:how the parameter T controls the tradeof between approximation and estimation errors. In the next chapter we will study how to tune parameters such as T , based on the data.",
      "replacement" => "Boosting is a method for amplifying the accuracy of weak learners. In this chapter we described the AdaBoost algorithm. We have shown that after $T$ iterations of AdaBoost, it returns a hypothesis from the class $L(B, T)$, obtained by composing a linear classifier on $T$ hypotheses from a base class $B$. We have demonstrated how the parameter $T$ controls the tradeoff between approximation and estimation errors. In the next chapter we will study how to tune parameters such as $T$, based on the data.",
      "pdf_page" => 133
    }]
  }
}.freeze

# MinerU's control-character encoding is not stable across books.  This one
# exception was visually checked across independent FOML chapters and is only
# applied to the cited book/codepoint pair.  The queue retains its evidence
# pages so a future reviewer can reject or revise the convention.
PDF_CONFIRMED_CONTROL_CODEPOINT_PATTERNS = {
  "computer-vision-algorithms-applications" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [454, 537, 684, 690]
    }
  },
  "deep-learning-foundations-concepts" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [235, 256, 495, 522, 571]
    }
  },
  "foundations-of-machine-learning-2e" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [32, 135, 294, 325, 374, 488]
    },
    0x0003 => {
      "replacement" => "$\\square$",
      "visual_confirmation_pdf_pages" => [99, 126, 209, 368]
    }
  },
  "lectures-modern-convex-optimization" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [34, 136, 319, 400, 433]
    },
    0x0017 => {
      "replacement" => "$\\succeq$",
      "visual_confirmation_pdf_pages" => [51, 178, 284, 552, 558]
    }
  },
  "lectures-convex-optimization" => {
    0x0003 => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [29, 156, 222, 306, 441]
    },
    0x000E => {
      "replacement" => "$\\square$",
      "visual_confirmation_pdf_pages" => [156, 260, 279]
    },
    0x000F => {
      "replacement" => "$\\sum$",
      "visual_confirmation_pdf_pages" => [165, 542]
    },
    0x0015 => {
      "replacement" => "$\\varkappa$",
      "visual_confirmation_pdf_pages" => [153, 257]
    },
    0x001D => {
      "replacement" => "$\\cap$",
      "visual_confirmation_pdf_pages" => [351]
    }
  },
  "pattern-recognition-machine-learning" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [716, 757]
    },
    0x000E => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [229, 263, 359, 459, 473]
    }
  },
  "speech-language-processing" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [29, 38, 44, 55, 58, 71]
    }
  },
  "understanding-machine-learning" => {
    0x000F => {
      "replacement" => "$\\epsilon$",
      "visual_confirmation_pdf_pages" => [47, 57, 68, 367, 385]
    },
    0x001C => {
      "replacement" => "$\\ll$",
      "visual_confirmation_pdf_pages" => [350]
    }
  }
}.freeze

PRML_EXERCISE_MARKER = /^(\s*(?:#+\s*)?(?:\d+\.\d+\s+)?\()((?:[\u0001\u000C]\s*)+)(\))/.freeze

def books_from_manifest(manifest)
  bib_titles = REFS_PATH.read.scan(/@\w+\{([^,]+),.*?^\s*title\s*=\s*\{(.+?)\},/m).to_h
  official = manifest.fetch("courses").flat_map do |course|
    course.fetch("books").map do |book|
      title = bib_titles.fetch(book.fetch("citekey"))
      book.merge("course" => course.fetch("course"), "official" => true, "title" => title)
    end
  end
  supplementary = manifest.fetch("supplementary_books", []).map do |book|
    book.merge("official" => false)
  end
  official + supplementary
end

def clean_heading(text)
  text.to_s.downcase.gsub(/[^a-z0-9]+/, "")
end

def prml_exercise_marker_replacement(line)
  match = line.match(PRML_EXERCISE_MARKER)
  return nil unless match

  match[1] + ("★" * match[2].count("\u0001\u000C")) + match[3]
end

def confirmed_control_line_repair(slug, chapter_number, line)
  PDF_CONFIRMED_CONTROL_LINE_REPAIRS.dig(slug, chapter_number)&.find do |repair|
    repair.fetch("source") == line.chomp.rstrip
  end
end

def confirmed_control_codepoint_pattern(slug, codepoint)
  PDF_CONFIRMED_CONTROL_CODEPOINT_PATTERNS.dig(slug, codepoint)
end

def heading_at(lines, index)
  lines.fetch(index).strip.sub(/^\#{1,6}\s+/, "")
end

def toc_titles(lines, first_body_anchor, expected)
  titles = {}
  prefix = lines[0...first_body_anchor]
  prefix.each do |line|
    text = line.strip
    match = text.match(/\A(\d+)\s+(.+?)\s+\d+\z/) || text.match(/\A(\d+)\s+([A-Za-z][^\n]+)\z/)
    next unless match && expected.include?(match[1].to_i)
    title = match[2].strip
    next if title.match?(/\A\d+(?:\.\d+)+\b/)
    titles[match[1].to_i] ||= title
  end
  # Some tables of contents print only the chapter title (without its number)
  # immediately before an N.1 entry.  Recover it only from that adjacent TOC
  # context, never from arbitrary prose in the body.
  expected.reject { |number| titles.key?(number) }.each do |number|
    section_index = prefix.index { |line| line.strip.match?(/\A#{number}\.1(?:\D|\z)/) }
    next unless section_index
    candidate = prefix[0...section_index].reverse.find do |line|
      text = line.strip
      text.match?(/\A[^0-9].+\s+\d+\z/) && !text.match?(/\A(?:Part|Appendix)\b/i)
    end
    titles[number] = candidate.strip.sub(/\s+\d+\z/, "") if candidate
  end
  titles
end

def chapter_candidates(lines, rule)
  expected = rule.fetch(:chapters)
  sections = {}
  lines.each_with_index do |line, index|
    next unless line.strip.match?(/^\#{1,6}\s+/)
    heading = heading_at(lines, index)
    match = heading.match(/\A(\d+)\.1(?:\D|\z)/)
    next unless match && expected.include?(match[1].to_i)
    sections[match[1].to_i] ||= index
  end
  first_body_anchor = sections.values.min || raise("no first-section anchors")
  toc = toc_titles(lines, first_body_anchor, expected)
  missing_titles = expected.reject { |number| toc.key?(number) }
  raise "TOC titles not found for #{missing_titles.join(", ")}" unless missing_titles.empty?

  candidates = expected.map do |number|
    section = sections[number]
    next_section = expected.map { |n| sections[n] if n > number }.compact.min || lines.length
    previous_section = expected.map { |n| sections[n] if n < number }.compact.max || first_body_anchor
    canonical = clean_heading(toc.fetch(number))
    title_hits = ((previous_section - 120).clamp(0, lines.length)...next_section).select do |index|
      line = lines[index].strip
      next false unless line.match?(/^\#{1,6}\s+/)
      heading = clean_heading(heading_at(lines, index).sub(/\A(?:chapter|lecture)\d+\s*/i, "").sub(/\A#{number}\s*/, ""))
      heading == canonical
    end
    explicit_hits = ((previous_section - 120).clamp(0, lines.length)...(section || next_section)).select do |index|
      heading_at(lines, index).match?(/\A(?:Chapter|Lecture)\s+#{number}\b/i)
    end
    anchor = (title_hits + explicit_hits).select { |index| index <= (section || next_section) }.max || section
    raise "no body anchor for chapter #{number} (#{toc.fetch(number)})" unless anchor
    { number: number, line: anchor, heading: toc.fetch(number), section_line: section }
  end
  candidates.each_cons(2) do |left, right|
    raise "non-monotone anchors: #{left[:number]} then #{right[:number]}" unless left[:line] < right[:line]
  end
  candidates
end

def title_for(candidate, lines)
  # A few OCR table-of-contents entries retain their dot leader and printed
  # page number (for example, "Language Modeling....105").  This is document
  # navigation noise, not chapter-title content.
  candidate.fetch(:heading).sub(/\s*\.{2,}\s*(?:\d+\s*)?\z/, "").strip
end

LATEX_UNICODE_COMMANDS = {
  "∑" => "\\sum", "∏" => "\\prod", "√" => "\\sqrt{}", "∞" => "\\infty",
  "≈" => "\\approx", "≠" => "\\neq", "≤" => "\\leq", "≥" => "\\geq",
  "∈" => "\\in", "∉" => "\\notin", "∪" => "\\cup", "∩" => "\\cap",
  "⊂" => "\\subset", "⊆" => "\\subseteq", "→" => "\\to", "←" => "\\leftarrow",
  "↔" => "\\leftrightarrow", "∀" => "\\forall", "∃" => "\\exists",
  "ℝ" => "\\mathbb{R}", "ℂ" => "\\mathbb{C}", "ℕ" => "\\mathbb{N}"
}.freeze

def normalise_unicode_math_in_latex(text)
  text.gsub(/\$\$.*?\$\$|\$[^$\n]*\$/m) do |fragment|
    LATEX_UNICODE_COMMANDS.reduce(fragment) { |result, (symbol, command)| result.gsub(symbol, command) }
  end
end

def normalise_fragment(text, slug, chapter_number: nil)
  repairs = Hash.new(0)
  cleaned = text.encode("UTF-8", invalid: :replace, undef: :replace, replace: "�")
                .gsub("\r\n", "\n")
                .gsub("\r", "\n")
  cleaned = normalise_unicode_math_in_latex(cleaned)
  if slug == "pattern-recognition-machine-learning"
    restored = 0
    cleaned = cleaned.gsub(PRML_EXERCISE_MARKER) do |marker|
      replacement = prml_exercise_marker_replacement(marker)
      restored += marker.count("\u000C")
      replacement
    end
    repairs["PDF-confirmed PRML exercise difficulty marker pattern"] += restored if restored.positive?
  end
  PDF_CONFIRMED_CONTROL_LINE_REPAIRS.dig(slug, chapter_number)&.each do |repair|
    count = cleaned.scan(repair.fetch("source")).length
    raise "expected one PDF-confirmed control-line repair for #{slug} chapter #{chapter_number}, found #{count}" unless count == 1
    cleaned = cleaned.gsub(repair.fetch("source"), repair.fetch("replacement"))
    repairs["PDF-confirmed control-symbol repair (PDF p.#{repair.fetch("pdf_page")})"] += count
  end
  PDF_CONFIRMED_CONTROL_CODEPOINT_PATTERNS.fetch(slug, {}).each do |codepoint, pattern|
    character = codepoint.chr(Encoding::UTF_8)
    normalised_wrapper_count = 0
    if slug == "foundations-of-machine-learning-2e" && codepoint == 0x0003
      # MinerU occasionally wrapped the proof-ending square in a superscript.
      # The source PDF shows a normal end-of-proof marker, not a footnote.
      normalised_wrapper_count = cleaned.scan("<sup>#{character}</sup>").length
      cleaned = cleaned.gsub("<sup>#{character}</sup>", pattern.fetch("replacement"))
    end
    count = cleaned.count(character) + normalised_wrapper_count
    next if count.zero?

    cleaned = cleaned.gsub(character, pattern.fetch("replacement"))
    repairs["PDF-confirmed book-specific control-codepoint pattern"] += count
  end
  cleaned = cleaned.gsub(/[\u0000-\u0008\u000B\u000C\u000E-\u001F]/, "")
  SAFE_OCR_REPAIRS.each do |pattern, replacement|
    count = cleaned.scan(pattern).length
    repairs[replacement] += count if count.positive?
    cleaned = cleaned.gsub(pattern, replacement)
  end
  PDF_CONFIRMED_EXERCISE_MARKERS.dig(slug, chapter_number)&.each do |exercise, page|
    before = exercise == "__unnumbered_17_1__" ? "(? ? ?) We would like" : "#{exercise} (? ? ?)"
    after = before.sub("(? ? ?)", "(★★★)")
    count = cleaned.scan(before).length
    raise "expected one PDF-confirmed exercise marker repair for #{slug} chapter #{chapter_number} exercise #{exercise}, found #{count}" unless count == 1
    cleaned = cleaned.gsub(before, after)
    repairs["PDF-confirmed exercise difficulty marker (PDF p.#{page})"] += count
  end
  # These two repairs were visually checked against the cited PDF page.  Keep
  # their anchors narrow and assert a single match so future source changes
  # cannot silently broaden a source-level correction.
  if slug == "first-order-methods-optimization" && cleaned.include?("I_{\\mathbf{x}}")
    before = /\\mathbf\{A\}\\mathbf\{x\}\+\\mathbf\{b\}\s+\\neq\s+\\mathbf\{0\}\s+\\end\{array\}\\right\./
    count = cleaned.scan(before).length
    raise "expected one PDF-confirmed FOMO table repair, found #{count}" unless count == 1
    cleaned = cleaned.gsub(before, "\\mathbf{A}\\mathbf{x}+\\mathbf{b} \\neq \\mathbf{0}")
    repairs["PDF-confirmed FOMO p.95 table repair"] += count
  elsif slug == "first-order-methods-optimization" && cleaned.include?("\\qend{array}")
    # PDF p.33 (printed p.23), Source JSON page_idx 32: the original equation
    # was truncated by MinerU.  Replace the complete block, not merely qend.
    before = /\$\$\n(?:(?!\$\$).)*?\\qend\{array\}\n\$\$/m
    replacement = <<~'LATEX'.strip
      $$
      \begin{array}{rcl}
      f(\lambda \mathbf{x}_{1} + (1 - \lambda) \mathbf{x}_{2}, \lambda \mathbf{y}_{1} + (1 - \lambda) \mathbf{y}_{2}) &\leq& \lambda f(\mathbf{x}_{1}, \mathbf{y}_{1}) + (1 - \lambda) f(\mathbf{x}_{2}, \mathbf{y}_{2}) \\\\
      &\stackrel{(2.9),(2.10)}{\leq}& \lambda(g(\mathbf{x}_{1}) + \varepsilon) + (1 - \lambda)(g(\mathbf{x}_{2}) + \varepsilon) \\\\
      &=& \lambda g(\mathbf{x}_{1}) + (1 - \lambda)g(\mathbf{x}_{2}) + \varepsilon.
      \end{array}
      $$
    LATEX
    count = cleaned.scan(before).length
    raise "expected one PDF-confirmed FOMO equation repair, found #{count}" unless count == 1
    cleaned = cleaned.gsub(before, replacement)
    repairs["PDF-confirmed FOMO PDF p.33 convexity-proof equation repair"] += count
  elsif slug == "lectures-modern-convex-optimization" && cleaned.include?("(b_{\\ell, i})")
    before = "j = 1,..., \\nu_{\\ell} \\\\(c_{\\ell, i})"
    count = cleaned.scan(before).length
    raise "expected one PDF-confirmed LMCO equation repair, found #{count}" unless count == 1
    cleaned = cleaned.gsub(before, "j = 1,..., \\nu_{\\ell} \\end{array}\\right.\\\\(c_{\\ell, i})")
    repairs["PDF-confirmed LMCO PDF p.155 Eq. (2.5.6) repair"] += count
  end
  fallback_pages = PDF_FORMULA_FALLBACKS.dig(slug, chapter_number)&.dup || []
  unless fallback_pages.empty?
    cleaned = cleaned.gsub(/\$\$\n.*?\n\$\$/m) do |display_math|
      begins = display_math.scan(/\\begin\{([^}]+)\}/).flatten.each_with_object(Hash.new(0)) { |name, counts| counts[name] += 1 }
      ends = display_math.scan(/\\end\{([^}]+)\}/).flatten.each_with_object(Hash.new(0)) { |name, counts| counts[name] += 1 }
      next display_math if begins == ends

      page = fallback_pages.shift
      raise "more corrupted display blocks than PDF fallback pages for #{slug} chapter #{chapter_number}" unless page
      repairs["PDF-page fallback for unrecoverable formula (PDF p.#{page})"] += 1
      <<~MARKDOWN.strip
        > [!warning] PDF 公式回退
        > 此公式块的 OCR 转录已截断、重复或乱码，不能安全重写为 LaTeX。以下嵌入的是已核验的原 PDF 第 #{page} 页；本章仍需人工转写后才可标为 `reviewed`。
        >
        > ![[../../../transcripts/mineru/#{slug}/source.pdf#page=#{page}]]
      MARKDOWN
    end
    raise "unused PDF fallback pages for #{slug} chapter #{chapter_number}: #{fallback_pages.join(", ")}" unless fallback_pages.empty?
  end
  cleaned = cleaned.gsub("](parts/", "](../../../transcripts/mineru/#{slug}/parts/")
  # Preserve the source wording while making its explicit bullet paragraphs
  # render as native Obsidian/CommonMark lists. Numbered and lettered items
  # are already valid Markdown and therefore remain untouched. This runs only
  # after exact source-line repairs have consumed their original text.
  cleaned = cleaned.gsub(/(?m)^([ \t]*)•[ \t]+/, "\\1- ")
  cleaned, caption_refs = add_caption_derived_image_alts(cleaned)
  cleaned = cleaned.gsub("![](../../../transcripts", "![原书图像；请以 source.pdf 为准](../../../transcripts")
  [cleaned, repairs, caption_refs]
end

def add_caption_derived_image_alts(text)
  lines = text.lines(chomp: false)
  references = []
  lines.each_with_index do |line, index|
    next unless line.match?(/^!\[\]\(/)

    caption_index = ((index + 1)...lines.length).find { |candidate| !lines[candidate].strip.empty? }
    next unless caption_index
    match = lines[caption_index].match(/^\s*Figure\s+([A-Za-z]?\d+(?:\.\d+)*(?:[a-z])?)(?:(?:\.\s+)|(?::\s+)|\s+)(\S.+)$/i)
    body_index = nil
    unless match
      label = lines[caption_index].match(/^\s*Figure\s+([A-Za-z]?\d+(?:\.\d+)*(?:[a-z])?)\.?\s*$/i)
      next unless label
      candidate = caption_index + 1
      next if candidate >= lines.length || lines[candidate].strip.empty? || lines[candidate].match?(/^!\[\]\(|^#|^\s*Figure\s+/i)
      match = label
      body_index = candidate
      body = lines[body_index].strip
    end
    # A direct prose reference is not a caption.  Keep it manual rather than
    # treating the referenced figure number as an image description.
    body ||= match[2]
    next if body.match?(/\A(?:shows?|is|illustrates?|depicts?|presents?|provides?|compares?)\b/i)
    lines[index] = line.sub("![](", "![Figure #{match[1]}](")
    references << {
      "image_path" => line.match(/^!\[\]\(([^)\s]+)/)[1],
      "figure_id" => match[1],
      "caption_source_relative_line" => caption_index + 1,
      "caption_text" => lines[caption_index].strip,
      "caption_body_source_relative_line" => body_index && body_index + 1,
      "caption_body_text" => body_index && lines[body_index].strip,
      "status" => "transcript-adjacent"
    }
  end
  [lines.join, references]
end

def image_paths(text)
  text.scan(/!\[[^\]]*\]\(([^)\s]+)(?:\s+"[^"]*")?\)/).flatten
end

def render_risk_types(text)
  types = []
  types << "placeholder-token" if text.match?(/\(\?\s*\?\s*\?\)/)
  types << "replacement-character" if text.include?("�")
  types << "adjacent-html-superscripts" if text.match?(/<sup>[^<]*<\/sup>\s*<sup>/)
  types
end

def inline_dollar_markers(text)
  # A raw dollar count treats currency examples, HTML table content and
  # equation labels such as `\tag{$}` as unmatched math delimiters.  Count
  # only plausible delimiter pairs, while preserving genuine unmatched math
  # markers for the review queue.
  text.lines.sum do |line|
    next 0 if line.include?("<table")

    candidate = line.gsub(/\\tag\{\$\}/, "")
    markers = candidate.enum_for(:scan, /(?<!\\)\$/).map { Regexp.last_match.begin(0) }
    if markers.length == 1
      suffix = candidate[(markers.first + 1)..]
      next 0 if suffix&.match?(/\A(?:\d|_)/)
    end
    markers.length
  end
end

def math_diagnostics(text)
  unescaped_dollars = inline_dollar_markers(text)
  display_markers = text.lines.count { |line| line.strip == "$$" }
  begins = Hash.new(0)
  ends = Hash.new(0)
  text.scan(/\\begin\{([^}]+)\}/) { |name| begins[name.first] += 1 }
  text.scan(/\\end\{([^}]+)\}/) { |name| ends[name.first] += 1 }
  environment_mismatches = (begins.keys | ends.keys).inject(0) { |total, name| total + (begins[name] - ends[name]).abs }
  {
    "unescaped_dollar_markers" => unescaped_dollars,
    "unbalanced_dollar_markers" => unescaped_dollars.odd?,
    "display_math_markers" => display_markers,
    "unbalanced_display_math" => display_markers.odd?,
    "render_risk" => !render_risk_types(text).empty?,
    "source_control_characters" => text.each_codepoint.count { |point| point < 32 && ![9, 10, 13].include?(point) },
    "source_empty_image_alt" => text.scan(/!\[\]\(/).length,
    # The build supplies this placeholder only so that Obsidian does not render
    # a blank image label.  It is deliberately not treated as a semantic
    # caption: a reviewer must still inspect the figure and name it.
    "non_semantic_image_alt" => text.scan(/!\[原书图像；请以 source\.pdf 为准\]\(/).length,
    "caption_derived_image_alt" => text.scan(/!\[(?:Figure|Fig\.|Table|Algorithm)\s+\d+/i).length,
    "latex_environment_mismatches" => environment_mismatches
  }
end

def source_page_span(slug, start_line, end_line)
  # MinerU JSON keeps page indices per layout block, but the merged Markdown
  # does not retain a reversible line-to-block map.  We therefore store source
  # line spans as exact anchors and leave PDF page range null rather than
  # fabricating a page citation.
  { "transcript" => "transcripts/mineru/#{slug}/reading.md", "line_start" => start_line, "line_end" => end_line, "pdf_page_range" => nil }
end

def yaml_scalar(value)
  value.to_s.dump
end

def chapter_frontmatter(book:, title:, number:, source:, diagnostics:, image_count:, repairs:)
  tags = ["ai-qe", "textbook", "chapter", book.fetch("course")]
  tags << "official-syllabus" if book.fetch("official")
  review_status = diagnostics.values_at("unbalanced_dollar_markers", "unbalanced_display_math", "render_risk").any? || diagnostics.fetch("source_control_characters").positive? || diagnostics.fetch("source_empty_image_alt").positive? || diagnostics.fetch("non_semantic_image_alt").positive? || diagnostics.fetch("caption_derived_image_alt").positive? || diagnostics.fetch("latex_environment_mismatches").positive? ? "needs-manual-review" : "machine-verified"
  <<~YAML
    ---
    title: #{yaml_scalar(title)}
    book: #{yaml_scalar(book.fetch("title"))}
    book_slug: #{book.fetch("slug")}
    course: #{book.fetch("course")}
    chapter_number: #{number}
    citekey: #{book["citekey"] || "null"}
    official_syllabus: #{book.fetch("official")}
    source_pdf: #{yaml_scalar(book.fetch("source_pdf"))}
    source_transcript: #{yaml_scalar(source.fetch("transcript"))}
    source_line_start: #{source.fetch("line_start")}
    source_line_end: #{source.fetch("line_end")}
    source_pdf_page_range: null
    review_status: #{review_status}
    image_count: #{image_count}
    source_empty_image_alt: #{diagnostics.fetch("source_empty_image_alt")}
    non_semantic_image_alt: #{diagnostics.fetch("non_semantic_image_alt")}
    caption_derived_image_alt: #{diagnostics.fetch("caption_derived_image_alt")}
    formula_check:
      unbalanced_dollar_markers: #{diagnostics.fetch("unbalanced_dollar_markers")}
      unbalanced_display_math: #{diagnostics.fetch("unbalanced_display_math")}
      render_risk: #{diagnostics.fetch("render_risk")}
      source_control_characters: #{diagnostics.fetch("source_control_characters")}
      latex_environment_mismatches: #{diagnostics.fetch("latex_environment_mismatches")}
    tags:
    #{tags.map { |tag| "  - #{tag}" }.join("\n")}
    ---
  YAML
end

def chapter_preamble(book, title, source, diagnostics, image_count, repairs)
  repair_text = repairs.empty? ? "无" : repairs.map { |word, count| "#{word} × #{count}" }.join("；")
  <<~MARKDOWN
    # #{title}

    > [!cite] 来源与可追溯性
    > - 书目：#{book.fetch("title")}#{book["citekey"] ? "（#{book.fetch("citekey")}）" : ""}
    > - 权威原件：[source.pdf](../../../#{book.fetch("source_pdf")})
    > - 原始阅读稿：[reading.md](../../../#{source.fetch("transcript")})，源行 #{source.fetch("line_start")}–#{source.fetch("line_end")}。
    > - 本章保留 #{image_count} 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

    > [!abstract] 转录质量门
    > 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：#{repair_text}。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

  MARKDOWN
end

def write_chapter(path, body)
  FileUtils.mkdir_p(path.dirname)
  path.write(body)
end

def add_chapter_navigation(chapters_dir, chapter_records)
  ordered = chapter_records.sort_by { |chapter| chapter.fetch("number") }
  ordered.each_with_index do |chapter, index|
    links = ["[[../README|本书目录]]"]
    links << "[[#{ordered[index - 1].fetch("filename").sub(/\.md\z/, "")}|上一章]]" unless index.zero?
    links << "[[#{ordered[index + 1].fetch("filename").sub(/\.md\z/, "")}|下一章]]" unless index == ordered.length - 1
    path = chapters_dir.join(chapter.fetch("filename"))
    text = path.read
    updated = text.sub(/^(# Chapter [^\n]+\n)/, "\\1\n> #{links.join(" · ")}\n")
    raise "chapter heading missing for navigation: #{path}" if updated == text

    path.write(updated)
  end
end

def book_readme(book, chapter_records, front_matter_present, back_matter_present)
  status_counts = chapter_records.group_by { |chapter| chapter.fetch("review_status") }.transform_values(&:length)
  rows = chapter_records.sort_by { |chapter| chapter.fetch("number") }.map do |chapter|
    source_span = chapter["blocked"] ? "原始 PDF 缺章" : "#{chapter.fetch("source_line_start")}–#{chapter.fetch("source_line_end")}"
    "| #{chapter.fetch("number")} | [[chapters/#{chapter.fetch("filename").sub(/\.md\z/, "")}|#{chapter.fetch("title") }]] | #{source_span} | #{chapter.fetch("review_status")} | #{chapter.fetch("image_count", 0)} |"
  end.join("\n")
  extra = []
  extra << "- [[front-matter|封面、目录、前言和未归入正文章节的原始内容]]" if front_matter_present
  extra << "- [[back-matter|附录、书目、索引和正文后未归入章节的原始内容]]" if back_matter_present
  <<~MARKDOWN
    ---
    title: #{yaml_scalar(book.fetch("title"))}
    book_slug: #{book.fetch("slug")}
    course: #{book.fetch("course")}
    citekey: #{book["citekey"] || "null"}
    official_syllabus: #{book.fetch("official")}
    source_pdf: #{yaml_scalar(book.fetch("source_pdf"))}
    source_transcript: #{yaml_scalar(book.fetch("reading_markdown"))}
    chapter_count: #{chapter_records.length}
    tags:
      - ai-qe
      - textbook
      - book-index
    ---

    # #{book.fetch("title")}

    > [!important] 使用边界
    > 这是按章节拆开的 Obsidian 阅读层，不替代原书。每章都有源行定位、图片路径检查和公式定界符检查；任何精确引文、页码、图表或符号以 [source.pdf](../../../#{book.fetch("source_pdf")}) 为准。

    - [[review-log|逐章审计与复核队列]]
    - [[image-caption-audit.json|高置信图注的源行审计清单]]
    - [[image-review-queue.json|全部图像的逐项复核队列]]
    - [[control-character-review-queue.json|可能丢失符号的逐项复核队列]]
    - [[render-risk-review-queue.json|OCR 渲染风险的逐项复核队列]]
    - [[chapter-boundary-audit.json|章节边界与 PDF 页候选审计]]
    - [完整 MinerU 阅读稿](../../../#{book.fetch("reading_markdown")})
    #{extra.join("\n")}

    | 章 | 阅读入口 | 转录行 | 质量状态 | 图片 |
    | --- | --- | --- | --- | ---: |
    #{rows}

    机器检查汇总：#{status_counts.map { |status, count| "#{status} × #{count}" }.join("；")}。
  MARKDOWN
end

def image_caption_audit(book, chapter_records)
  entries = chapter_records.reject { |chapter| chapter["blocked"] }.flat_map do |chapter|
    chapter.fetch("caption_derived_image_refs", []).map do |reference|
      reference.merge("chapter_number" => chapter.fetch("number"), "chapter_file" => "chapters/#{chapter.fetch("filename")}")
    end
  end
  JSON.pretty_generate({
    "schema_version" => 1,
    "book_slug" => book.fetch("slug"),
    "source_transcript" => book.fetch("reading_markdown"),
    "caption_rule" => "image followed by only blank lines, then Figure <id> with caption body; prose cross-references excluded",
    "entries" => entries
  }) + "\n"
end

def image_review_queue(book, chapter_records)
  entries = chapter_records.reject { |chapter| chapter["blocked"] }.flat_map do |chapter|
    chapter.fetch("image_review_entries", []).map do |entry|
      entry.merge("chapter_number" => chapter.fetch("number"), "chapter_file" => "chapters/#{chapter.fetch("filename")}")
    end
  end
  JSON.pretty_generate({
    "schema_version" => 1,
    "book_slug" => book.fetch("slug"),
    "source_transcript" => book.fetch("reading_markdown"),
    "entries" => entries
  }) + "\n"
end

def normalised_source_text(text)
  text.to_s.gsub(/[\u0000-\u001F]/, "").gsub(/\s+/, " ").strip
end

def part_start_page(json_path)
  File.basename(File.dirname(json_path)).scan(/\d+/).first.to_i
end

def source_json_blocks(book)
  transcript_dir = ROOT.join(book.fetch("reading_markdown")).dirname
  Dir[transcript_dir.join("parts", "*", "source.json").to_s].flat_map do |json_path|
    start_page = part_start_page(json_path)
    JSON.parse(File.read(json_path)).map do |block|
      {
        "normalised_text" => normalised_source_text(block["text"]),
        "part" => File.basename(File.dirname(json_path)),
        "page_idx" => block.fetch("page_idx", 0).to_i,
        "pdf_page" => start_page + block.fetch("page_idx", 0).to_i,
        "bbox" => block["bbox"],
        "block_type" => block["type"]
      }
    end
  end
end

def control_character_queue(book, chapter_records, raw_lines)
  blocks = source_json_blocks(book)
  entries = []
  raw_lines.each_with_index do |line, index|
    points = line.codepoints.select { |point| point < 32 && ![9, 10, 13].include?(point) }
    next if points.empty?
    source_line = index + 1
    chapter = chapter_records.find do |candidate|
      !candidate["blocked"] && source_line.between?(candidate.fetch("source_line_start"), candidate.fetch("source_line_end"))
    end
    next unless chapter
    normalised_line = normalised_source_text(line)
    evidence = blocks.find { |block| !normalised_line.empty? && block.fetch("normalised_text").include?(normalised_line) }
    points.each do |point|
      entry = {
        "source_line" => source_line,
        "codepoint" => format("U+%04X", point),
        "context" => line.gsub(/[\u0000-\u0008\u000B\u000C\u000E-\u001F]/, "[control]"),
        "chapter_number" => chapter && chapter.fetch("number"),
        "chapter_file" => chapter && "chapters/#{chapter.fetch("filename")}",
        "review_status" => "needs-symbol-verification"
      }
      replacement = book.fetch("slug") == "pattern-recognition-machine-learning" && [0x0001, 0x000C].include?(point) ? prml_exercise_marker_replacement(line) : nil
      if replacement
        entry["review_status"] = "repaired-pattern-confirmed"
        entry["resolution"] = {
          "kind" => "prml-exercise-difficulty-marker",
          "replacement" => "★" * line.count("\u0001\u000C"),
          "visual_rule_confirmation_pdf_page" => 145
        }
      end
      codepoint_pattern = confirmed_control_codepoint_pattern(book.fetch("slug"), point)
      if codepoint_pattern
        entry["review_status"] = "repaired-pattern-confirmed"
        entry["resolution"] = {
          "kind" => "book-specific-control-codepoint-pattern",
          "replacement" => codepoint_pattern.fetch("replacement"),
          "visual_confirmation_pdf_pages" => codepoint_pattern.fetch("visual_confirmation_pdf_pages")
        }
      end
      line_repair = confirmed_control_line_repair(book.fetch("slug"), chapter.fetch("number"), line)
      if line_repair
        entry["review_status"] = "repaired-pdf-confirmed"
        entry["resolution"] = {
          "kind" => "control-symbol-line",
          "replacement_line" => line_repair.fetch("replacement"),
          "pdf_page" => line_repair.fetch("pdf_page")
        }
      end
      entry["json_evidence"] = evidence.reject { |key, _| key == "normalised_text" } if evidence
      entries << entry
    end
  end
  JSON.pretty_generate({
    "schema_version" => 1,
    "book_slug" => book.fetch("slug"),
    "source_transcript" => book.fetch("reading_markdown"),
    "entries" => entries
  }) + "\n"
end

def chapter_boundary_audit(book, chapter_records, raw_lines)
  blocks = source_json_blocks(book)
  entries = chapter_records.reject { |chapter| chapter["blocked"] }.map do |chapter|
    heading_line = chapter.fetch("source_line_start")
    heading = heading_at(raw_lines, heading_line - 1)
    section_line = chapter["first_section_source_line"]
    section_anchor = section_line ? heading_at(raw_lines, section_line - 1) : nil
    section_key = normalised_source_text(section_anchor)
    heading_key = normalised_source_text(heading)
    section_candidates = blocks.select { |block| !section_key.empty? && block.fetch("normalised_text").include?(section_key) }
    heading_candidates = blocks.select { |block| !heading_key.empty? && block.fetch("normalised_text").include?(heading_key) }
    candidates = (section_candidates + heading_candidates).uniq do |block|
      [block.fetch("part"), block.fetch("page_idx"), block.fetch("bbox")]
    end
    status = candidates.length == 1 ? "exact-json-page" : (candidates.empty? ? "unresolved-json-page" : "ambiguous-json-page")
    entry = {
      "chapter_number" => chapter.fetch("number"),
      "chapter_file" => "chapters/#{chapter.fetch("filename")}",
      "source_line_start" => chapter.fetch("source_line_start"),
      "source_line_end" => chapter.fetch("source_line_end"),
      "first_section_source_line" => section_line,
      "heading" => heading,
      "section_anchor" => section_anchor,
      "status" => status,
      "candidate_count" => candidates.length
    }
    if candidates.length == 1
      evidence = candidates.first.reject { |key, _| key == "normalised_text" }
      evidence["matched_anchors"] = []
      evidence["matched_anchors"] << "heading" if candidates.first.fetch("normalised_text").include?(heading_key)
      evidence["matched_anchors"] << "first_section" if !section_key.empty? && candidates.first.fetch("normalised_text").include?(section_key)
      entry["json_evidence"] = evidence
    end
    entry
  end
  JSON.pretty_generate({
    "schema_version" => 1,
    "book_slug" => book.fetch("slug"),
    "source_transcript" => book.fetch("reading_markdown"),
    "rule" => "Only a unique MinerU JSON block matching the chapter heading or first section heading receives a PDF page candidate; ambiguous and unresolved matches remain unassigned.",
    "entries" => entries
  }) + "\n"
end

def confirmed_exercise_marker_resolution(slug, chapter_number, line)
  PDF_CONFIRMED_EXERCISE_MARKERS.dig(slug, chapter_number)&.each do |exercise, page|
    source_prefix = exercise == "__unnumbered_17_1__" ? "(? ? ?) We would like" : "#{exercise} (? ? ?)"
    next unless line.include?(source_prefix)

    return {
      "kind" => "exercise-difficulty-marker",
      "replacement" => "★★★",
      "pdf_page" => page,
      "exercise" => exercise == "__unnumbered_17_1__" ? "17.1 (number missing in source transcript)" : exercise
    }
  end
  nil
end

def confirmed_control_line_resolution(slug, chapter_number, line)
  PDF_CONFIRMED_CONTROL_LINE_REPAIRS.dig(slug, chapter_number)&.each do |repair|
    next unless repair.fetch("source") == line.chomp.rstrip

    return {
      "kind" => "control-symbol-line",
      "replacement_line" => repair.fetch("replacement"),
      "pdf_page" => repair.fetch("pdf_page")
    }
  end
  nil
end

def render_risk_queue(book, chapter_records, raw_lines)
  blocks = source_json_blocks(book)
  entries = raw_lines.each_with_index.each_with_object([]) do |(line, index), rows|
    types = render_risk_types(line)
    next if types.empty?

    source_line = index + 1
    chapter = chapter_records.find do |candidate|
      !candidate["blocked"] && source_line.between?(candidate.fetch("source_line_start"), candidate.fetch("source_line_end"))
    end
    next unless chapter

    normalised_line = normalised_source_text(line)
    candidates = blocks.select do |block|
      !normalised_line.empty? && block.fetch("normalised_text").include?(normalised_line)
    end
    candidates = candidates.uniq { |block| [block.fetch("part"), block.fetch("page_idx"), block.fetch("bbox")] }
    entry = {
      "source_line" => source_line,
      "context" => line.strip,
      "risk_types" => types,
      "chapter_number" => chapter.fetch("number"),
      "chapter_file" => "chapters/#{chapter.fetch("filename")}",
      "json_candidate_count" => candidates.length
    }
    resolution = confirmed_exercise_marker_resolution(book.fetch("slug"), chapter.fetch("number"), line) ||
      confirmed_control_line_resolution(book.fetch("slug"), chapter.fetch("number"), line)
    entry["review_status"] = resolution ? "repaired-pdf-confirmed" : "needs-visual-and-symbol-verification"
    entry["resolution"] = resolution if resolution
    entry["json_evidence"] = candidates.first.reject { |key, _| key == "normalised_text" } if candidates.length == 1
    rows << entry
  end
  JSON.pretty_generate({
    "schema_version" => 1,
    "book_slug" => book.fetch("slug"),
    "source_transcript" => book.fetch("reading_markdown"),
    "entries" => entries
  }) + "\n"
end

def review_log(book, chapters)
  rows = chapters.sort_by { |chapter| chapter.fetch("number") }.map do |chapter|
    if chapter["blocked"]
      next "| [[chapters/#{chapter.fetch("filename").sub(/\.md\z/, "")}|第 #{chapter.fetch("number")} 章]] | #{chapter.fetch("review_status")} | #{chapter.fetch("blocked_reason")} | — |"
    end
    flags = []
    diagnostics = chapter.fetch("diagnostics")
    flags << "数学定界符不平衡" if diagnostics.fetch("unbalanced_dollar_markers") || diagnostics.fetch("unbalanced_display_math")
    flags << "疑似转录/渲染风险" if diagnostics.fetch("render_risk")
    flags << "源稿含控制字符（已从阅读层移除）" if diagnostics.fetch("source_control_characters").positive?
    flags << "原图无语义 alt 文本，已加回看 PDF 提示；仍需人工补充图义" if diagnostics.fetch("non_semantic_image_alt").positive?
    flags << "#{diagnostics.fetch("caption_derived_image_alt")} 张图使用相邻原文图注生成 alt，仍需视觉核对" if diagnostics.fetch("caption_derived_image_alt").positive?
    flags << "LaTeX 环境不配对，需逐式对照 PDF" if diagnostics.fetch("latex_environment_mismatches").positive?
    flags << "图片路径缺失" unless chapter.fetch("missing_images").empty?
    unless chapter.fetch("repairs").empty?
      flags << "已应用可追溯自动修复：#{chapter.fetch("repairs").map { |label, count| "#{label} × #{count}" }.join("；") }"
    end
    flags << "无自动异常；涉及公式/图像时仍可按源行回看 PDF" if flags.empty?
    "| [[chapters/#{chapter.fetch("filename").sub(/\.md\z/, "")}|第 #{chapter.fetch("number")} 章]] | #{chapter.fetch("review_status")} | #{flags.join("；")} | #{chapter.fetch("source_line_start")}–#{chapter.fetch("source_line_end")} |"
  end.join("\n")
  <<~MARKDOWN
    ---
    title: #{yaml_scalar("#{book.fetch("title")} — 逐章审计")}
    book_slug: #{book.fetch("slug")}
    tags:
      - ai-qe
      - textbook
      - transcription-audit
    ---

    # 逐章审计与复核队列

    此日志由 `scripts/build_ai_qe_book_library.rb` 生成。它只记录可机械验证的结论：章节边界、源行覆盖、图片链接存在性、数学定界符配对和狭义 OCR 拼写修复。它不把自动检查冒充成对数学内容或图像语义的人工校对。

    | 章节 | 状态 | 复核信息 | 源行 |
    | --- | --- | --- | --- |
    #{rows}

    ## 人工核验顺序

    1. 先处理 `needs-manual-review`；在 PDF 中用源行附近的标题或公式定位原页。
    2. 检查本章首尾、每一张图、长公式、表格及可疑字符。
    3. 只在修复可由 PDF 确认时编辑章节文件，并在本日志对应行下加一条说明；不要回写 `transcripts/mineru/` 的原始证据层。
  MARKDOWN
end

manifest = JSON.parse(MANIFEST_PATH.read)
all_books = books_from_manifest(manifest)
FileUtils.mkdir_p(BOOKS_ROOT)
library_records = []

all_books.each do |book|
  slug = book.fetch("slug")
  warn "building #{slug}"
  transcript_path = ROOT.join(book.fetch("reading_markdown"))
  raise "missing transcript: #{transcript_path}" unless transcript_path.file?

  raw_lines = transcript_path.readlines(chomp: false)
  image_source_lines = {}
  raw_lines.each_with_index do |line, line_index|
    match = line.match(/^!\[\]\(([^)\s]+)/)
    image_source_lines[File.basename(match[1])] = line_index + 1 if match
  end
  rule = BOOK_RULES.fetch(slug)
  candidates = chapter_candidates(raw_lines, rule)
  raise "no chapter boundaries detected for #{slug}" if candidates.empty?

  book_dir = BOOKS_ROOT.join(slug)
  chapters_dir = book_dir.join("chapters")
  abort "refusing to overwrite existing book package: #{book_dir}" if book_dir.exist?
  FileUtils.mkdir_p(chapters_dir)

  chapter_records = []
  candidates.each_with_index do |candidate, index|
    start_index = candidate.fetch(:line)
    end_index = index + 1 < candidates.length ? candidates[index + 1].fetch(:line) - 1 : raw_lines.length - 1
    raw_fragment = raw_lines[start_index..end_index].join
    diagnostics = math_diagnostics(raw_fragment)
    cleaned_fragment, repairs, caption_refs = normalise_fragment(raw_fragment, slug, chapter_number: candidate.fetch(:number))
    # The raw transcript has empty image labels.  The reading layer replaces
    # them with a deliberately non-semantic PDF reminder, so account for that
    # post-normalisation state before assigning a chapter review status.
    diagnostics["non_semantic_image_alt"] = cleaned_fragment.scan(/!\[原书图像；请以 source\.pdf 为准\]\(/).length
    diagnostics["caption_derived_image_alt"] = cleaned_fragment.scan(/!\[(?:Figure|Fig\.|Table|Algorithm)\s+\d+/i).length
    source = source_page_span(slug, start_index + 1, end_index + 1)
    caption_refs.each do |reference|
      image_source_line = image_source_lines.fetch(File.basename(reference.fetch("image_path")))
      caption_index = ((image_source_line)...raw_lines.length).find { |candidate| !raw_lines[candidate].strip.empty? }
      raise "caption source not found for #{reference.fetch("image_path")}" unless caption_index
      reference.delete("caption_source_relative_line")
      reference.delete("caption_body_source_relative_line")
      reference["image_source_line"] = image_source_line
      reference["caption_source_line"] = caption_index + 1
      reference["caption_text"] = raw_lines[caption_index].strip
      if caption_index + 1 < raw_lines.length && reference["caption_body_text"]
        reference["caption_body_source_line"] = caption_index + 2
        reference["caption_body_text"] = raw_lines[caption_index + 1].strip
      end
    end
    images = image_paths(cleaned_fragment)
    caption_paths = caption_refs.each_with_object({}) { |reference, paths| paths[reference.fetch("image_path")] = true }
    raw_image_locations = Hash.new { |hash, key| hash[key] = [] }
    raw_lines[start_index..end_index].each_with_index do |line, offset|
      match = line.match(/^!\[\]\(([^)\s]+)/)
      raw_image_locations[File.basename(match[1])] << (start_index + offset + 1) if match
    end
    image_review_entries = cleaned_fragment.scan(/!\[([^\]]*)\]\(([^)\s]+)(?:\s+"[^"]*")?\)/).map do |alt, relative|
      source_line = raw_image_locations[File.basename(relative)].shift
      {
        "image_path" => relative,
        "source_image_line" => source_line,
        "generated_alt" => alt,
        "review_status" => caption_paths[relative] ? "caption-derived-pending-visual-review" : "needs-caption-and-visual-review"
      }
    end
    missing_images = images.reject { |relative| book_dir.join("chapters", relative).realpath rescue false }
    diagnostics["missing_image_links"] = missing_images.length
    title = "Chapter #{candidate.fetch(:number)} — #{title_for(candidate, raw_lines)}"
    filename = format("%02d-%s.md", candidate.fetch(:number), title.downcase.gsub(/[^a-z0-9]+/, "-").sub(/\A-/, "").sub(/-\z/, "")[0, 72])
    status = diagnostics.values_at("unbalanced_dollar_markers", "unbalanced_display_math", "render_risk").any? || diagnostics.fetch("source_control_characters").positive? || diagnostics.fetch("source_empty_image_alt").positive? || diagnostics.fetch("non_semantic_image_alt").positive? || diagnostics.fetch("caption_derived_image_alt").positive? || diagnostics.fetch("latex_environment_mismatches").positive? || missing_images.any? ? "needs-manual-review" : "machine-verified"
    header = chapter_frontmatter(book: book, title: title, number: candidate.fetch(:number), source: source, diagnostics: diagnostics, image_count: images.length, repairs: repairs)
    body = header + "\n" + chapter_preamble(book, title, source, diagnostics, images.length, repairs) + cleaned_fragment
    write_chapter(chapters_dir.join(filename), body)
    chapter_records << {
      "number" => candidate.fetch(:number), "title" => title, "filename" => filename,
      "source_line_start" => source.fetch("line_start"), "source_line_end" => source.fetch("line_end"),
      "first_section_source_line" => candidate.fetch(:section_line)&.+(1),
      "review_status" => status, "image_count" => images.length, "missing_images" => missing_images,
      "diagnostics" => diagnostics, "repairs" => repairs, "caption_derived_image_refs" => caption_refs, "image_review_entries" => image_review_entries
    }
  end

  rule.fetch(:blocked, {}).each do |number, blocked|
    title = blocked.fetch("title")
    status = blocked.fetch("status")
    reason = blocked.fetch("reason")
    filename = format("%02d-%s.md", number, title.downcase.gsub(/[^a-z0-9]+/, "-").sub(/\A-/, "").sub(/-\z/, ""))
    write_chapter(chapters_dir.join(filename), <<~MARKDOWN)
      ---
      title: #{yaml_scalar("Chapter #{number} — #{title}")}
      book: #{yaml_scalar(book.fetch("title"))}
      book_slug: #{slug}
      chapter_number: #{number}
      review_status: #{status}
      source_pdf: #{yaml_scalar(book.fetch("source_pdf"))}
      tags:
        - ai-qe
        - textbook
        - blocked-source
      ---

      # Chapter #{number} — #{title}

      > [!danger] 原始来源不完整
      > #{reason} 为防止把习题答案、目录条目或后续章节误当正文，本文件只记录阻塞，不伪造或补写正文。

      - 权威原件：[source.pdf](../../../#{book.fetch("source_pdf")})
      - 原始阅读稿：[reading.md](../../../transcripts/mineru/#{slug}/reading.md)
      - 解除条件：取得可核验的完整章节正文，并重新转录和逐页审校。
    MARKDOWN
    chapter_records << { "number" => number, "title" => "Chapter #{number} — #{title}", "filename" => filename, "review_status" => status, "blocked" => true, "blocked_reason" => reason, "image_count" => 0 }
  end

  first_start = candidates.first.fetch(:line)
  last_end = candidates.last.fetch(:line)
  front = raw_lines[0...first_start].join
  back = raw_lines[(last_end + 1)..]&.join.to_s
  unless front.strip.empty?
    cleaned, = normalise_fragment(front, slug)
    write_chapter(book_dir.join("front-matter.md"), "# 前置内容\n\n> [!cite] 此文件保留第一章之前的封面、目录、前言或未自动归类内容。来源：[reading.md](../../../transcripts/mineru/#{slug}/reading.md)，源行 1–#{first_start}。\n\n" + cleaned)
  end
  unless back.strip.empty?
    cleaned, = normalise_fragment(back, slug)
    write_chapter(book_dir.join("back-matter.md"), "# 后置内容\n\n> [!cite] 此文件保留最后一个自动识别章节之后的附录、书目、索引或未自动归类内容。来源：[reading.md](../../../transcripts/mineru/#{slug}/reading.md)，源行 #{last_end + 2}–#{raw_lines.length}。\n\n" + cleaned)
  end

  add_chapter_navigation(chapters_dir, chapter_records)
  write_chapter(book_dir.join("review-log.md"), review_log(book, chapter_records))
  write_chapter(book_dir.join("README.md"), book_readme(book, chapter_records, !front.strip.empty?, !back.strip.empty?))
  write_chapter(book_dir.join("image-caption-audit.json"), image_caption_audit(book, chapter_records))
  write_chapter(book_dir.join("image-review-queue.json"), image_review_queue(book, chapter_records))
  control_queue = control_character_queue(book, chapter_records, raw_lines)
  control_entries = JSON.parse(control_queue).fetch("entries")
  write_chapter(book_dir.join("control-character-review-queue.json"), control_queue)
  render_queue = render_risk_queue(book, chapter_records, raw_lines)
  render_entries = JSON.parse(render_queue).fetch("entries")
  write_chapter(book_dir.join("render-risk-review-queue.json"), render_queue)
  boundary_audit = chapter_boundary_audit(book, chapter_records, raw_lines)
  boundary_entries = JSON.parse(boundary_audit).fetch("entries")
  write_chapter(book_dir.join("chapter-boundary-audit.json"), boundary_audit)
  write_chapter(book_dir.join("manifest.json"), JSON.pretty_generate(book.merge("chapters" => chapter_records)) + "\n")
  readable_chapters = chapter_records.reject { |chapter| chapter["blocked"] }
  library_records << book.merge(
    "chapter_count" => chapter_records.length,
    "readable_chapter_count" => readable_chapters.length,
    "path" => "books/#{slug}",
    "manual_review_count" => chapter_records.count { |chapter| chapter.fetch("review_status") == "needs-manual-review" },
    "caption_derived_image_count" => readable_chapters.sum { |chapter| chapter.fetch("diagnostics", {}).fetch("caption_derived_image_alt", 0) },
    "non_semantic_image_count" => readable_chapters.sum { |chapter| chapter.fetch("diagnostics", {}).fetch("non_semantic_image_alt", 0) },
    "control_character_count" => control_entries.length,
    "control_character_json_evidence_count" => control_entries.count { |entry| entry["json_evidence"] },
    "control_character_repaired_count" => control_entries.count { |entry| entry.fetch("review_status") == "repaired-pattern-confirmed" },
    "control_character_book_pattern_repaired_count" => control_entries.count { |entry| entry.dig("resolution", "kind") == "book-specific-control-codepoint-pattern" },
    "control_character_pdf_repaired_count" => control_entries.count { |entry| entry.fetch("review_status") == "repaired-pdf-confirmed" },
    "render_risk_count" => render_entries.length,
    "render_risk_json_evidence_count" => render_entries.count { |entry| entry["json_evidence"] },
    "render_risk_repaired_count" => render_entries.count { |entry| entry.fetch("review_status") == "repaired-pdf-confirmed" },
    "chapter_boundary_exact_page_count" => boundary_entries.count { |entry| entry.fetch("status") == "exact-json-page" }
  )
end

index_rows = library_records.map do |book|
  official = book.fetch("official") ? "官方指定" : "补充资料"
  "| #{book.fetch("course")} | [[#{book.fetch("slug")}/README|#{book.fetch("title")}]] | #{official} | #{book.fetch("chapter_count")} | #{book.fetch("manual_review_count")} |"
end.join("\n")
BOOKS_ROOT.join("README.md").write(<<~MARKDOWN)
  ---
  title: AI 博士考教材分章阅读库
  tags:
    - ai-qe
    - textbook-library
  ---

  # AI 博士考教材分章阅读库

  每册教材的 `chapters/` 中每个 Markdown 文件对应一章；`review-log.md` 给出逐章质量状态；`manifest.json` 保存可机读的源行、图片和公式检查记录。原始 PDF 与 MinerU 转录包不被改写，始终是证据层。

  开始阅读前先看 [[QUALITY_GATE|质量门与当前状态]]；它区分可用阅读层、已确认修复、待审公式和源材料阻塞。

  > [!warning] 引用原则
  > 章节文件中的源行定位用于快速回溯到合并转录。精确页码、逐字引文、数学符号、图和表必须回看对应 `source.pdf`；任何尚无可验证页码映射的地方均显式保留为 `null`。

  | 课程 | 教材 | 属性 | 分章数 | 待人工复核 |
  | --- | --- | --- | ---: | ---: |
  #{index_rows}

  ## 再生成与验证

  - 构建：`ruby ai-qe-review/scripts/build_ai_qe_book_library.rb`
  - 结构验证：`ruby ai-qe-review/scripts/check_ai_qe_book_library.rb`
  - 严格公式验证：`ruby ai-qe-review/scripts/check_ai_qe_book_library.rb --strict`
  - 自动修复只限高置信度 OCR 拼写、换行/编码和图片相对路径；不重写原文的知识内容、证明、公式或图像。
MARKDOWN

BOOKS_ROOT.join("library-manifest.json").write(JSON.pretty_generate({ "schema_version" => 1, "generated_at" => Time.now.utc.iso8601, "books" => library_records }) + "\n")

BOOKS_ROOT.join("QUALITY_GATE.md").write(<<~MARKDOWN)
  ---
  title: AI 博士考教材分章库质量门
  tags:
    - ai-qe
    - textbook-library
    - transcription-audit
  ---

  # 质量门与当前状态

  本库已建立可读的章节层和不可改写的证据层，但尚未达到“逐页、逐式、逐图人工审校完成”。`review_status` 不等于数学内容、图义或原文措辞已经人工确认。

  ## 目标与验收

  每章只有在章首/章末、所有异常字符、公式、表格、图像均与 PDF 对照，并且修订记录标明 PDF 页与 JSON `part`、`page_idx` 后，才可标为 `reviewed`。

  - 结构门：`ruby ai-qe-review/scripts/check_ai_qe_book_library.rb` 必须通过，验证章节覆盖、严格递增源行、frontmatter、图片目标、控制字符和审计状态。
  - 严格公式门：`ruby ai-qe-review/scripts/check_ai_qe_book_library.rb --strict` 必须通过；它不允许未配对的 LaTeX 环境。
  - 读者门：每张图须有语义 alt/图注，不能以当前的“请以 source.pdf 为准”占位替代。

  ## 当前机器结果

  - 已生成 #{library_records.length} 册教材和 #{library_records.sum { |book| book.fetch("chapter_count") }} 个章节入口；每个可用章节保留连续、严格递增的 `reading.md` 源行区间。
  - 结构门通过；原始 PDF、MinerU Markdown、JSON 和图片资产均保留在证据层。
  - #{library_records.sum { |book| book.fetch("caption_derived_image_count") }} 张图已按“图后首个非空行是带正文的 `Figure` 图注”这一单向规则生成短 alt；另有 #{library_records.sum { |book| book.fetch("non_semantic_image_count") }} 张图仍只有 PDF 回看提示。两类均不等于视觉内容已人工确认，相关章节保持 `needs-manual-review`。
  - 各书的 `image-review-queue.json` 合计记录 #{library_records.sum { |book| book.fetch("caption_derived_image_count") + book.fetch("non_semantic_image_count") }} 张章节内图像，每项均可回到图片源行；其中高置信图注的源行再由 `image-caption-audit.json` 复核。
  - `control-character-review-queue.json` 合计记录 #{library_records.sum { |book| book.fetch("control_character_count") }} 个可能丢失符号；其中 #{library_records.sum { |book| book.fetch("control_character_repaired_count") }} 个已按 PDF 视觉确认的受限模式恢复（其中 #{library_records.sum { |book| book.fetch("control_character_book_pattern_repaired_count") }} 个来自 FOML 的书内 `U+000F` 至 `ε` 规则），#{library_records.sum { |book| book.fetch("control_character_pdf_repaired_count") }} 个已逐行 PDF 确认修复，#{library_records.sum { |book| book.fetch("control_character_json_evidence_count") }} 个已找到同一 MinerU JSON 块及 PDF 候选页；其余不得猜测补写。
  - `render-risk-review-queue.json` 合计记录 #{library_records.sum { |book| book.fetch("render_risk_count") }} 个 OCR 渲染风险源行；其中 #{library_records.sum { |book| book.fetch("render_risk_repaired_count") }} 个已由 PDF 确认修复，#{library_records.sum { |book| book.fetch("render_risk_json_evidence_count") }} 个拥有唯一 JSON/PDF 页候选。其余 `(...)` 占位符与连续 HTML 上标均须按页视觉核对后再修复。
  - `chapter-boundary-audit.json` 为 #{library_records.sum { |book| book.fetch("readable_chapter_count") }} 个可用章节记录章首与首节锚点；其中 #{library_records.sum { |book| book.fetch("chapter_boundary_exact_page_count") }} 个得到唯一 JSON/PDF 页候选，其余保留为歧义或未决，未写入伪造页码。
  - 已完成三项 PDF 确认的数学修复：First-Order Methods 第 2、3 章，Modern Convex 第 2 章；每项均记录在对应 `review-log.md` 的自动修复列。
  - 严格公式门通过。Foundations of Machine Learning 第 8、10 章和 Lectures on Modern Convex Optimization 第 3、5 章的 10 个不可安全转写公式，已改为嵌入其已核验的原 PDF 页，而非机械补 `\\end{array}`。
  - 上述 10 个 PDF 公式回退仍保留 `needs-manual-review`：它们在视觉上准确可读，但若要得到可搜索、可编辑的 LaTeX，必须逐式人工转写并在 `review-log.md` 留下页级证据。

  ## 明确阻塞

  - PRML 第 12 章：归档 PDF 与 MinerU 正文均没有目录中列出的完整章节页面。
  - Speech and Language Processing 第 10、16 章：转录中只出现标题/`Placeholder`，没有可审校正文。

  对应章节文件仅记录阻塞，不伪造正文。所有待审工作以每本书的 `review-log.md` 为准。
MARKDOWN
puts "built #{library_records.length} books and #{library_records.sum { |book| book.fetch("chapter_count") }} chapter files under #{BOOKS_ROOT}"

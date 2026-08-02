---
title: "Chapter 10 \u2014 Computational photography"
book: "Computer Vision: Algorithms and Applications"
book_slug: computer-vision-algorithms-applications
course: deep-learning
chapter_number: 10
citekey: szeliski2022vision
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/computer-vision-algorithms-applications/source.pdf"
source_transcript: "transcripts/mineru/computer-vision-algorithms-applications/reading.md"
source_line_start: 11779
source_line_end: 13174
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 174
source_empty_image_alt: 174
non_semantic_image_alt: 144
caption_derived_image_alt: 30
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 3
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 10 — Computational photography

> [[../README|本书目录]] · [[09-chapter-9-motion-estimation|上一章]] · [[11-chapter-11-structure-from-motion-and-slam|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Computer Vision: Algorithms and Applications（szeliski2022vision）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/computer-vision-algorithms-applications/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/computer-vision-algorithms-applications/reading.md)，源行 11779–13174。
> - 本章保留 174 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 3。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## Computational photography

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
10.3.2 Lens blur (bokeh) 648   
10.4 Image matting and compositing 650   
10.4.1 Blue screen matting 651   
10.4.2 Natural image matting 653   
10.4.3 Optimization-based matting 656   
10.4.4 Smoke, shadow, and flash matting 661   
10.4.5 Video matting . 662   
10.5 Texture analysis and synthesis 663   
10.5.1 Application: Hole filling and inpainting 665   
10.5.2 Application: Non-photorealistic rendering 667   
10.5.3 Neural style transfer and semantic image synthesis . 669   
10.6 Additional reading 671   
10.7 Exercises 674

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/e3b2eac249c6e2a39c2b5b2f1c8e4a06b8d0ea46505749a5a2e4ef278e974fe9.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/63211c8bbdb691ff9ed14818bd72f8bcbdc5b4e74a2dcbe1d38b2e18307691cc.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/4ea3c52ca0d57881ca660d5584c093c75f1c6adc25112c199d4633720f21a9aa.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/4643051b8360e4bd768bb9e9e8d368a11442fae39d75096c688d2cef19d22b6d.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/6f7f126f03d046f28096a47716ca3980b5860903bebdc099a96543e1d10fdfe5.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/e91ef9b971b0853d55465e3e4557781f17d50b5e6582ef1c842a5ae803d01036.jpg)  
Orig. (top) Detail Transfer (bottom)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/a7c91f48f3ca7c6e625eb7104bb7658c1bce3d8fac1c28ea9f987f809580b359.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/967c7b8d88c08d7e2932f48d4ebf71ce0b01d3bbafbd7147aa11dd1aa572c4d4.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/ab6885231722914f702236d30428bb43fc36c7f981ef7de2aec4e96b9d950ff2.jpg)  
Detail Transfer with Denoising

(b)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/d372e370bbda26c62bf5d128be218f6fd7febc4b887beb90e12b1b76482dd301.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/260ec4f6c99168e5ad19721c7d617a10e7f4896c17aa77fbefd8de3dca4dbaf8.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/b9624110302ccd7dcd6fed22942807a92d30548e477c545f8b0b577c117929ce.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/af134e06c72e36130197e1bace82c6631361ea07693411390a52bdffe4622343.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/8c034eec878052fd5efb06679fb982b465ac60fc53484251d0db7644259723a4.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/34aeee9ce9440f34a7ac8739f75ea3660fa7c26fbe1b96227bc7c61c35b0048a.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/3e9d5190c09d94227ff8a1bf00a618b9cf60ec260b1a708f2ccac634eb210f7e.jpg)  
(d)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/69c6b0f4cd2c1dacb2bd19e5621013a0312be0e605234226bcb3966905c5ed8f.jpg)

![Figure 10.1](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/5a44839f86915f0565fe6fd7e6b184f7712aa08942d81f39e0d5dd45e3fe0b65.jpg)  
Figure 10.1 Computational photography: (a) merging multiple exposures to create high dynamic range images (Debevec and Malik 1997) © 1997 ACM; (b) merging flash and nonflash photographs; (Petschnigg, Agrawala et al. 2004) © 2004 ACM; (c) image matting and compositing; (Chuang, Curless et al. 2001) © 2001 IEEE; (d) hole filling with inpainting (Criminisi, Perez, and Toyama´ 2004) © 2004 IEEE.

Of all the advances in computer vision in the last decade, computational photography has arguably had the most widespread commercial impact. In 2010, the seminal Frankencamera paper by Adams, Talvala et al. (2010) had just been released, as had one of the first widely used in-camera panoramic image stitching apps.<sup>1</sup> Fast forward to 2020, and every smartphone now has built-in panoramic stitching, high dynamic range (HDR) exposure merging, and multi-image denoising and super-resolution (Hasinoff, Sharlet et al. 2016; Wronski, Garcia-Dorado et al. 2019; Liba, Murthy et al. 2019), and the newest phones are also simulating shallow depth of field (bokeh) with multiple lenses or dual pixels (Barron, Adams et al. 2015; Wadhwa, Garg et al. 2018; Garg, Wadhwa et al. 2019; Zhang, Wadhwa et al. 2020).

In Section 8.2, we described how to stitch multiple images into wide field of view panoramas, allowing us to create photographs that could not be captured with a regular camera. This is just one instance of computational photography, where image analysis and processing algorithms are applied to one or more photographs to create images that go beyond the capabilities of traditional imaging systems.

In this chapter, we cover a number of additional computational photography algorithms. We begin with a review of photometric image calibration (Section 10.1), i.e., the measurement of camera and lens responses, which is a prerequisite for many of the algorithms we describe later. We then discuss high dynamic range imaging (Section 10.2), which captures the full range of brightness in a scene through the use of multiple exposures (Figure 10.1a). We also discuss tone mapping operators, which map wide-gamut images back into regular display devices such as screens and printers, as well as algorithms that merge flash and regular images to obtain better exposures (Figure 10.1b).

Next, we discuss how the resolution and visual quality of images can be improved either by merging multiple photographs together or using sophisticated image priors or deep networks (Section 10.3). This includes algorithms for extracting full-color images from the patterned Bayer mosaics present in most cameras.

In Section 10.4, we discuss algorithms for cutting pieces of images from one photograph and pasting them into others (Figure 10.1c). In Section 10.5, we describe how to generate novel textures from real-world samples for applications such as filling holes in images (Figure 10.1d). We close with a brief overview of non-photorealistic rendering (Section 10.5.2), which can turn regular photographs into artistic renderings that resemble traditional drawings and paintings, and a discussion of neural network approaches to style transfer and semantic image synthesis (Section 10.5.3.

One topic that we do not cover extensively in this book is novel computational sensors, optics, and cameras. A nice survey can be found in an article by Nayar (2006), the book by

Raskar and Tumblin (2010), and research papers such as Levin, Fergus et al. (2007). Some related discussion can also be found in Sections 10.2 and 14.3.

A good general-audience introduction to computational photography can be found in the article by Hayes (2008) as well as survey papers by Nayar (2006), Cohen and Szeliski (2006), Levoy (2006), and Debevec (2006).<sup>2</sup> Raskar and Tumblin (2010) give extensive coverage of topics in this area, with particular emphasis on computational cameras and sensors. The sub-field of high dynamic range imaging has its own book discussing research in this area (Reinhard, Heidrich et al. 2010), as well as a wonderful book aimed more at professional photographers (Freeman 2008).<sup>3</sup> A good survey of image matting is provided by Wang and Cohen (2009).

There are also several courses on computational photography where the instructors have provided extensive online materials, e.g., Yannis Gkioulekas’ class at Carnegie Mellon,<sup>4</sup> Alyosha Efros’ class at Berkeley,<sup>5</sup> Fredo Durand’s Computation Photography course at MIT, ´ <sup>6</sup> Marc Levoy’s class at Stanford,<sup>7</sup> and a series of SIGGRAPH courses on Computational Photography.<sup>8</sup>

## 10.1 Photometric calibration

Before we can successfully merge multiple photographs, we need to characterize the functions that map incoming irradiance into pixel values and also the amount of noise present in each image. In this section, we examine three components of the imaging pipeline (Figure 10.2) that affect this mapping. For a more comprehensive, tunable model of modern digital camera processing pipelines, see the recent paper by Tseng, Yu et al. (2019).

The first is the radiometric response function (Mitsunaga and Nayar 1999), which maps photons arriving at the lens into digital values stored in the image file (Section 10.1.1). The second is vignetting, which darkens pixel values near the periphery of images, especially at large apertures (Section 10.1.3). The third is the point spread function, which characterizes the blur induced by the lens, anti-aliasing filters, and finite sensor areas (Section 10.1.4).<sup>9</sup> The material in this section builds on the image formation processes described in Sections 2.2.3 and 2.3.3, so if it has been a while since you looked at those sections, please go back and review them.

## 10.1.1 Radiometric response function

As we can see in Figure 10.2, a number of factors affect how the intensity of light arriving at the lens ends up being mapped into stored digital values. Let us ignore for now any nonuniform attenuation that may occur inside the lens, which we cover in Section 10.1.3.

The first factors to affect this mapping are the aperture and shutter speed (Section 2.3), which can be modeled as global multipliers on the incoming light, most conveniently measured in exposure values $(\log_{2}$ brightness ratios). Next, the analog to digital (A/D) converter on the sensing chip applies an electronic gain, usually controlled by the ISO setting on your camera. While in theory this gain is linear, as with any electronics non-linearities may be present (either unintentionally or by design). Ignoring, for now, photon noise, on-chip noise, amplifier noise, and quantization noise, which we discuss shortly, you can often assume that the mapping between incoming light and the values stored in a RAW camera file (if your camera supports this) is roughly linear.

If images are being stored in the more common JPEG format, the camera’s image signal processor (ISP) next performs Bayer pattern demosaicing (Sections 2.3.2 and 10.3.1), which is a mostly linear (but often non-stationary) process. Some sharpening is also often applied at this stage. Next, the color values are multiplied by different constants (or sometimes a $3 \times$ 3 color twist matrix) to perform color balancing, i.e., to move the white point closer to pure white. Finally, a standard gamma is applied to the intensities in each color channel and the colors are converted into YCbCr format before being transformed by a DCT, quantized, and then compressed into the JPEG format (Section 2.3.3). Figure 10.2 shows all of these steps in pictorial form.

Given the complexity of all of this processing, it is difficult to model the camera response function (Figure 10.3a), i.e., the mapping between incoming irradiance and digital RGB values, from first principles. A more practical approach is to calibrate the camera by measuring correspondences between incoming light and final values.

The most accurate, but most expensive, approach is to use an integrating sphere, which is a large (typically 1m diameter) sphere carefully painted on the inside with white matte paint. An accurately calibrated light at the top controls the amount of radiance inside the sphere (which is constant everywhere because of the sphere’s radiometry) and a small opening at the side allows for a camera/lens combination to be mounted. By slowly varying the current going into the light, an accurate correspondence can be established between incoming radiance and measured pixel values. The vignetting and noise characteristics of the camera can also be

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/4052eacf65396455219f4b86b9a1811a8159e55dec6276cd9f0447529e417506.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/daf6a4fd21d8e4a2faed88592944f4f4c530a440824651aba3b98cee771bbbb9.jpg)  
(b)  
Figure 10.2 Image sensing pipeline: (a) block diagram showing the various sources of noise as well as the typical digital post-processing steps; (b) equivalent signal transforms, including convolution, gain, and noise injection. The abbreviations are: RD = radial distortion, AA = anti-aliasing filter, CFA = color filter array, Q1 and Q2 = quantization noise.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/2856ae996ea97afaa4337f498e443863e15207997fd18bab3dedff0cec5ea066.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/d980f7e46504a7de933c5c7abbb5af4d4c0e9f05c8a3c87891013ae41fb50a85.jpg)  
(b)  
Figure 10.3 Radiometric response calibration: (a) typical camera response function, showing the mapping between incoming log irradiance (exposure) and output eight-bit pixel values, for one color channel (Debevec and Malik 1997) © 1997 ACM; (b) color checker chart.

simultaneously determined.

A more practical alternative is to use a calibration chart (Figure 10.3b) such as the Macbeth or Munsell ColorChecker Chart.<sup>10</sup> The biggest problem with this approach is to ensure uniform lighting. One approach is to use a large dark room with a high-quality light source far away from (and perpendicular to) the chart. Another is to place the chart outdoors away from any shadows. (The results will differ under these two conditions, because the color of the illuminant will be different.)

The easiest approach is probably to take multiple exposures of the same scene while the camera is on a tripod and to recover the response function by simultaneously estimating the incoming irradiance at each pixel and the response curve (Mann and Picard 1995; Debevec and Malik 1997; Mitsunaga and Nayar 1999). This approach is discussed in more detail in Section 10.2 on high dynamic range imaging.

If all else fails, i.e., you just have one or more unrelated photos, you can use an International Color Consortium (ICC) profile for the camera (Fairchild 2013).<sup>11</sup> Even more simply, you can just assume that the response is linear if they are RAW files and that the images have a γ = 2.2 non-linearity (plus clipping) applied to each RGB channel if they are JPEG images.

![Figure 10.4](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/29e157353e084cc0cc16e825c44d5645a2dde2f147e587b5633eea5af0c77900.jpg)  
Figure 10.4 Noise level function estimates obtained from a single color photograph (Liu, Szeliski et al. 2008) © 2008 IEEE. The colored curves are the estimated NLF fit as the probabilistic lower envelope of the measured deviations between the noisy piecewise-smooth images. The ground truth NLFs obtained by averaging 29 images are shown in gray.

## 10.1.2 Noise level estimation

In addition to knowing the camera response function, it is also often important to know the amount of noise being injected under a particular camera setting (e.g., ISO/gain level). The simplest characterization of noise is a single standard deviation, usually measured in gray levels, independent of pixel value. A more accurate model can be obtained by estimating the noise level as a function of pixel value (Figure 10.4), which is known as the noise level function (Liu, Szeliski et al. 2008).

As with the camera response function, the simplest way to estimate these quantities is in the lab, using either an integrating sphere or a calibration chart. The noise can be estimated either at each pixel independently, by taking repeated exposures and computing the temporal variance in the measurements (Healey and Kondepudy 1994), or over regions, by assuming that pixel values should all be the same within some region (e.g., inside a color checker square) and computing a spatial variance.

This approach can be generalized to photos where there are regions of constant or slowly varying intensity (Liu, Szeliski et al. 2008). First, segment the image into such regions and fit a constant or linear function inside each region. Next, measure the (spatial) standard deviation of the differences between the noisy input pixels and the smooth fitted function away from large gradients and region boundaries. Plot these as a function of output level for each color channel, as shown in Figure 10.4. Finally, fit a lower envelope to this distribution to ignore pixels or deviations that are outliers. A fully Bayesian approach to this problem that models the statistical distribution of each quantity is presented by Liu, Szeliski et al. (2008). A simpler approach, which should produce useful results in most cases, is to fit a low-dimensional function (e.g., positive valued B-spline) to the lower envelope (see Exercise 10.2).

![Figure 10.5](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/4c99907b864d2c171944a59778569f0cf4640d4256f13b69059f11d5be6b1e57.jpg)  
Figure 10.5 Single image vignetting correction (Zheng, Yu et al. 2008) © 2008 IEEE: (a) original image with strong visible vignetting; (b) vignetting compensation as described by Zheng, Zhou et al. (2006); (c–d) vignetting compensation as described by Zheng, Yu et al. (2008).

Matsushita and Lin (2007b) present a technique for simultaneously estimating a camera’s response and noise level functions based on skew (asymmetries) in level-dependent noise distributions. Their paper also contains extensive references to previous work in these areas.

## 10.1.3 Vignetting

A common problem with using wide-angle and wide-aperture lenses is that the image tends to darken in the corners (Figure 10.5a). This problem is generally known as vignetting and comes in several different forms, including natural, optical, and mechanical vignetting (Section 2.2.3) (Ray 2002). As with radiometric response function calibration, the most accurate way to calibrate vignetting is to use an integrating sphere or a picture of a uniformly colored and illuminated blank wall.

An alternative approach is to stitch a panoramic scene and to assume that the true radiance at each pixel comes from the central portion of each input image. This is easier to do if the radiometric response function is already known (e.g., by shooting in RAW mode) and if the exposure is kept constant. If the response function, image exposures, and vignetting function are unknown, they can still be recovered by optimizing a large least squares fitting problem (Litvinov and Schechner 2005; Goldman 2010). Figure 10.6 shows an example of simultaneously estimating the vignetting, exposure, and radiometric response function from a set of overlapping photographs (Goldman 2010). Note that unless vignetting is modeled and compensated, regular gradient-domain image blending (Section 8.4.4) will not create an attractive image.

If only a single image is available, vignetting can be estimated by looking for slow consistent intensity variations in the radial direction. The original algorithm proposed by Zheng, Lin, and Kang (2006) first pre-segmented the image into smoothly varying regions and then performed an analysis inside each region. Instead of pre-segmenting the image, Zheng, Yu et al. (2008) compute the radial gradients at all the pixels and use the asymmetry in this distribution (because gradients away from the center are, on average, slightly negative) to estimate the vignetting. Figure 10.5 shows the results of applying each of these algorithms to an image with a large amount of vignetting. Exercise 10.3 has you implement some of the above techniques.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/dd30c6913eb2d6ab08d838ea3329c93d28442fc52ac1a9d3302f79844793fbe1.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/5d967b4c578090a028704dc932e82c5b126098fcc53742e8f83631310399b7f0.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/e1393fa694758ade46a84db31135bcde82e77ad769524e7e61da94e65a630cb2.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/2198e0a70052ffc71e289750a9467beba8661c2e2e9d63214fe2e330b847dc05.jpg)  
(d)  
Figure 10.6 Simultaneous estimation of vignetting, exposure, and radiometric response (Goldman 2010) © 2011 IEEE: (a) original average of the input images; (b) after compensating for vignetting; (c) using gradient domain blending only (note the remaining mottled look); (d) after both vignetting compensation and blending.

## 10.1.4 Optical blur (spatial response) estimation

One final characteristic of imaging systems that you should calibrate is the spatial response function, which encodes the optical blur that gets convolved with the incoming image to produce the point-sampled image. The shape of the convolution kernel, which is also known as the point spread function (PSF) or optical transfer function, depends on several factors, including lens blur and radial distortion (Section 2.2.3), anti-aliasing filters in front of the sensor, and the shape and extent of each active pixel area (Section 2.3) (Figure 10.2). A good estimate of this function is required for applications such as multi-image super-resolution and deblurring (Section 10.3).

In theory, one could estimate the PSF by simply observing an infinitely small point light source everywhere in the image. Creating an array of samples by drilling through a dark plate and backlighting with a very bright light source is difficult in practice.

A more practical approach is to observe an image composed of long straight lines or bars, as these can be fitted to arbitrary precision. Because the location of a horizontal or vertical edge can be aliased during acquisition, slightly slanted edges are preferred. The profile and locations of such edges can be estimated to sub-pixel precision, which makes it possible to estimate the PSF at sub-pixel resolutions (Reichenbach, Park, and Narayanswamy 1991; Burns and Williams 1999; Williams and Burns 2001; Goesele, Fuchs, and Seidel 2003). The thesis by Murphy (2005) contains a nice survey of all aspects of camera calibration, including the spatial frequency response (SFR), spatial uniformity, tone reproduction, color reproduction, noise, dynamic range, color channel registration, and depth of field. It also includes a description of a slant-edge calibration algorithm called sfrmat2.

![Figure 10.7](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/0c8833ad9f8dc6c6e57775d37cb30246074ce98cb0bf54a19227b1380691bf28.jpg)  
Figure 10.7 Calibration pattern with edges equally distributed at all orientations that can be used for PSF and radial distortion estimation (Joshi, Szeliski, and Kriegman 2008) © 2008 IEEE. A portion of an actual sensed image is shown in the middle and a close-up of the ideal pattern is on the right.

The slant-edge technique can be used to recover a 1D projection of the 2D PSF, e.g., slightly vertical edges are used to recover the horizontal line spread function (LSF) (Williams 1999). The LSF is then often converted into the Fourier domain and its magnitude plotted as a one-dimensional modulation transfer function (MTF), which indicates which image frequencies are lost (blurred) and aliased during the acquisition process (Section 2.3.1). For most computational photography applications, it is preferable to directly estimate the full 2D PSF, as it can be hard to recover from its projections (Williams 1999).

Figure 10.7 shows a pattern containing edges at all orientations, which can be used to directly recover a two-dimensional PSF. First, corners in the pattern are located by extracting edges in the sensed image, linking them, and finding the intersections of the circular arcs. Next, the ideal pattern, whose analytic form is known, is warped (using a homography) to fit the central portion of the input image and its intensities are adjusted to fit the ones in the sensed image. If desired, the pattern can be rendered at a higher resolution than the input image, which enables the estimation of the PSF to sub-pixel resolution (Figure 10.8a). Finally a large linear least squares system is solved to recover the unknown PSF kernel K,

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/ced19fa247544a9d467bea8f7ca12ae99f7769ae11774f5d7a37a3a347887279.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/37edef5c44c7303df3af98bd2cb1839106ac372c5023860c7907a83a9a511eeb.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/5c48d35e7cc7ce37d1fc92ac3e19e6d445b19f492723be831e97519608527e38.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/b5fc6b0205dc435fc0a7a49821d3a26d24b0fe8be8448ed90bbd125d1c5e100b.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/0599bf29811dd0ddcc2d1aefc48cccd2944d1d2dde68646d035858ea4ffb01a1.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/65bf5ebd83f0fec536c025b158975e977bc10a58ecc2f6aa9b67410975537967.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/48e58a9b6f96aee2435d57bf92493a5adff5cf470bb848ee2a80040a2b581f87.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/edbdd90748961da50651df3fcb80c7dc2a7a95f8fd8b7861875c51ab2923fa0a.jpg)  
(c)  
Figure 10.8 Point spread function estimation using a calibration target (Joshi, Szeliski, and Kriegman 2008) © 2008 IEEE. (a) Sub-pixel PSFs at successively higher resolutions (note the interaction between the square sensing area and the circular lens blur). (b) The radial distortion and chromatic aberration can also be estimated and removed. (c) PSF for a misfocused (blurred) lens showing some diffraction and vignetting effects in the corners.

$$
K = \arg \operatorname{min}_{K} \| B - D(I * K) \|^{2},\tag{10.1}
$$

where B is the sensed (blurred) image, I is the predicted (sharp) image, and D is an optional downsampling operator that matches the resolution of the ideal and sensed images (Joshi, Szeliski, and Kriegman 2008). An alternative solution technique is to estimate 1D PSF profiles first and to then combine them using a Radon transform (Cho, Paris et al. 2011).

If the process of estimating the PSF is done locally in overlapping patches of the image, it can also be used to estimate the radial distortion and chromatic aberration induced by the lens (Figure 10.8b). Because the homography mapping the ideal target to the sensed image is estimated in the central (undistorted) part of the image, any (per-channel) shifts induced by the optics manifest themselves as a displacement in the PSF centers.<sup>12</sup> Compensating for these shifts eliminates both the achromatic radial distortion and the inter-channel shifts that result in visible chromatic aberration. The color-dependent blurring caused by chromatic aberration (Figure 2.21) can also be removed using the deblurring techniques discussed in

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/c05322d589b333f75064e1562bf5df99935860842626b72ecadef377aeeb9e81.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/066c79ca62aa8154391cb1cffbdff399264d89daece32e1767dd9fe8f21aafae.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/39c19c59421cd841e63c7d5aefb4a21bcc8567e28c43debfb779dfc6ae6763c2.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/a2b598b824dd4ce47750285fa92e18bf947bfdd8cf12670e529bd5d925341725.jpg)  
(d)  
Figure 10.9 Estimating the PSF without using a calibration pattern (Joshi, Szeliski, and Kriegman 2008) © 2008 IEEE: (a) Input image with blue cross-section (profile) location, (b) Profile of sensed and predicted step edges, (c–d) Locations and values of the predicted colors near the edge locations.

Section 10.3. Figure 10.8b shows how the radial distortion and chromatic aberration manifest themselves as elongated and displaced PSFs, along with the result of removing these effects in a region of the calibration target.

The local 2D PSF estimation technique can also be used to estimate vignetting. Figure 10.8c shows how the mechanical vignetting manifests itself as clipping of the PSF in the corners of the image. For the overall dimming associated with vignetting to be properly captured, the modified intensities of the ideal pattern need to be extrapolated from the center, which is best done with a uniformly illuminated target.

When working with RAW Bayer-pattern images, the correct way to estimate the PSF is to only evaluate the least squares terms in (10.1) at sensed pixel values, while interpolating the ideal image to all values. For JPEG images, you should linearize your intensities first, e.g., remove the gamma and any other non-linearities in your estimated radiometric response function.

What if you have an image that was taken with an uncalibrated camera? Can you still recover the PSF an use it to correct the image? In fact, with a slight modification, the previous

![Figure 10.10](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/7a996efcd1d0fb5a8a87bec5614be58a25e57fe883e52c64bf29b569c7fbf483.jpg)  
Figure 10.10 Sample indoor image where the areas outside the window are overexposed and inside the room are too dark.

algorithms still work.

Instead of assuming a known calibration image, you can detect strong elongated edges and fit ideal step edges in such regions (Figure 10.9b), resulting in the sharp image shown in Figure 10.9d. For every pixel that is surrounded by a complete set of valid estimated neighbors (green pixels in Figure 10.9c), apply the least squares formula (10.1) to estimate the kernel K. The resulting locally estimated PSFs can be used to correct for chromatic aberration (because the relative displacements between per-channel PSFs can be computed), as shown by Joshi, Szeliski, and Kriegman (2008).

Exercise 10.4 provides some more detailed instructions for implementing and testing edge-based PSF estimation algorithms. An alternative approach, which does not require the explicit detection of edges but uses image statistics (gradient distributions) instead, is presented by Fergus, Singh et al. (2006).

## 10.2 High dynamic range imaging

As we mentioned earlier in this chapter, registered images taken at different exposures can be used to calibrate the radiometric response function of a camera. More importantly, they can help you create well-exposed photographs under challenging conditions, such as brightly lit scenes where any single exposure contains saturated (overexposed) and dark (underexposed) regions (Figure 10.10). This problem is quite common, because the natural world contains a range of radiance values that is far greater than can be captured with any photographic sensor or film (Figure 10.11). Taking a set of bracketed exposures (exposures taken by a camera in automatic exposure bracketing (AEB) mode to deliberately under- and over-expose the image) gives you the material from which to create a properly exposed photograph, as shown in Figure 10.12 (Freeman 2008; Gulbins and Gulbins 2009; Hasinoff, Durand, and Freeman

![Figure 10.11](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/c9bc257e0c1afd82d49aece38aea06e4d334422092eb5d1aac5e6192d054effe.jpg)

Figure 10.11 Relative brightness of different scenes, ranging from 1 inside a dark room lit by a monitor to 2,000,000 looking at the Sun. Photos courtesy of Paul Debevec.  
![Figure 10.12](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/3f1483c2290dcb8d6b1aac6483b3e8b5bd15688b9d71d53a8066feef66885719.jpg)  
Figure 10.12 A bracketed set of shots (using the camera’s automatic exposure bracketing (AEB) mode) and the resulting high dynamic range (HDR) composite.

2010; Reinhard, Heidrich et al. 2010).

While it is possible to combine pixels from different exposures directly into a final composite (Burt and Kolczynski 1993; Mertens, Kautz, and Reeth 2007), this approach runs the risk of creating contrast reversals and halos. Instead, the more common approach is to proceed in three stages:

1. Estimate the radiometric response function from the aligned images.

2. Estimate a radiance map by selecting or blending pixels from different exposures.

3. Tone map the resulting high dynamic range (HDR) image back into a displayable gamut.

The idea behind estimating the radiometric response function is relatively straightforward (Mann and Picard 1995; Debevec and Malik 1997; Mitsunaga and Nayar 1999; Reinhard, Heidrich et al. 2010). Suppose you take three sets of images at different exposures (shutter speeds), say at 2 exposure values.<sup>13</sup> If we were able to determine the irradiance (exposure) $E_{i}$ at each pixel (2.102), we could plot it against the measured pixel value $z_{ij}$ for each exposure time $t_{j}$ , as shown in Figure 10.13.

![Figure 10.13](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/3ebe5f6339ca17b046d90ad119ca6e5674271decc63a27a2e99584fc38568ac8.jpg)  
Figure 10.13 Radiometric calibration using multiple exposures (Debevec and Malik 1997). Corresponding pixel values are plotted as functions of log exposures (irradiance). The curves on the left are shifted to account for each pixel’s unknown radiance until they all line up into a single smooth curve.

Unfortunately, we do not know the irradiance values $E_{i}$ , so these have to be estimated at the same time as the radiometric response function $f,$ , which can be written (Debevec and Malik 1997) as

$$
z_{ij} = f(E_{i} \ : t_{j}),\tag{10.2}
$$

where $t_{j}$ is the exposure time for the jth image. The inverse response curve $f^{- 1}$ is given by

$$
f^{- 1}(z_{ij}) = E_{i} t_{j}.\tag{10.3}
$$

Taking logarithms of both sides (base 2 is convenient, as we can now measure quantities in EVs), we obtain

$$
g(z_{ij}) = \log f^{- 1}(z_{ij}) = \log E_{i} + \log t_{j},\tag{10.4}
$$

where $g = \log f^{- 1}$ (which maps pixel values $z_{ij}$ into log irradiance) is the curve we are estimating (Figure 10.13 turned on its side).

Debevec and Malik (1997) assume that the exposure times $t_{j}$ are known. (Recall that these can be obtained from a camera’s EXIF tags, but that they actually follow a power of 2 progression $\dots, \1_{/ 128, \1 / 64, \1 / 32, \1 / 16, \1 / 8, \.\.}$ . instead of the marked $..., 1 \big /_{125}, 1 \big /_{60}, 1 \big /_{30}.$ $^1 /_{15}, \{^1 /}_{8}, \...$ . values—see Exercise 2.5.) The unknowns are therefore the per-pixel exposures $E_{i}$ and the response values $g_{k} \ = \g(k)$ , where $g$ can be discretized according to the 256 pixel values commonly observed in eight-bit images. (The response curves are calibrated separately for each color channel.)

In order to make the response curve smooth, Debevec and Malik (1997) add a secondorder smoothness constraint

$$
\lambda \sum_{k} g^{\prime \prime}(k)^{2} = \lambda \sum[g(k - 1) - 2g(k) + g(k + 1)]^{2},\tag{10.5}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/dfe7e00b5e791714d7cfae8f9d7edbf226705df3922dccfb4aaa654512e54e2f.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/cda488316303e03c3641e0d37942ecb8e95a07f7e4fa81b6b9cdfd654d64efed.jpg)  
(b)  
Figure 10.14 Recovered response function and radiance image for a real digital camera (DCS460) (Debevec and Malik 1997) © 1997 ACM.

which is similar to the one used in snakes (7.27). Because pixel values are more reliable in the middle of their range (and the g function becomes singular near saturation values), they also add a weighting (hat) function $w(k)$ that decays to zero at both ends of the pixel value range,

$$
w(z) = \left\{\begin{array}{cc}{z - z_{\operatorname{min}}} &{z \leq(z_{\operatorname{min}} + z_{\operatorname{max}}) / 2} \\{z_{\operatorname{max}} - z} &{z >(z_{\operatorname{min}} + z_{\operatorname{max}}) / 2.} \end{array} \right.\tag{10.6}
$$

Putting all of these terms together, they obtain a least squares problem in the unknowns $\left\{g_{k} \right\}$ and $\{E_{i}\}$

$$
E = \sum_{i} \sum_{j} w(z_{i, j})[g(z_{i, j}) - \log E_{i} - \log t_{j}]^{2} + \lambda \sum_{k} w(k) g^{\prime \prime}(k)^{2}.\tag{10.7}
$$

(To remove the overall shift ambiguity in the response curve and irradiance values, the middle of the response curve is set to 0.) Debevec and Malik (1997) show how this can be implemented in 21 lines of MATLAB code, which partially accounts for the popularity of their technique.

While Debevec and Malik (1997) assume that the exposure times $t_{j}$ are known exactly, there is no reason why these additional variables cannot be thrown into the least squares problem, constraining their final estimated values to lie close to their nominal values $\hat{t}_{j}$ with an extra term $\begin{array}{rl}{\eta \sum_{j}(t_{j} - \hat{t}_{j})^{2}} &{{}} \end{array}$

Figure 10.14 shows the recovered radiometric response function for a digital camera along with select (relative) radiance values in the overall radiance map. Figure 10.15 shows the bracketed input images captured on color film and the corresponding radiance map. Note that while most research on high dynamic range imaging assumes that the radiometric (or camera) response function is independent of exposure, this is not actually the case. Rodr´ıguez,

![Figure 10.15](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/7ce1c61d5968d482839b7a4d9bde56b828f6d6c74458671c3ebd3bd57ffe4345.jpg)  
Figure 10.15 Bracketed set of exposures captured with a film camera and the resulting radiance image displayed in pseudocolor (Debevec and Malik 1997) © 1997 ACM.

Vazquez-Corral, and Bertalm´ıo (2019) describe how to take this into account to get improved results.

While Debevec and Malik (1997) use a general second-order smooth curve g to parameterize their response curve, Mann and Picard (1995) use a three-parameter function

$$
f(E) = \alpha + \beta E^{\gamma},\tag{10.8}
$$

while Mitsunaga and Nayar (1999) use a low-order $(N \leq 10)$ polynomial for the inverse response function g. Pal, Szeliski et al. (2004) derive a Bayesian model that estimates an independent smooth response function for each image, which can better model the more sophisticated (and hence less predictable) automatic contrast and tone adjustment performed in today’s digital cameras.

Once the response function has been estimated, the second step in creating high dynamic range photographs is to merge the input images into a composite radiance map. If the response function and images were known exactly, i.e., if they were noise free, you could use any non-saturated pixel value to estimate the corresponding radiance by mapping it through the inverse response curve $E = g(z)$

Unfortunately, pixels are noisy, especially under low-light conditions when fewer photons arrive at the sensor. To compensate for this, Mann and Picard (1995) use the derivative of the response function as a weight in determining the final radiance estimate, because “flatter” regions of the curve tell us less about the incoming irradiance. Debevec and Malik (1997) use a hat function (10.6) which accentuates mid-tone pixels while avoiding saturated values. Mitsunaga and Nayar (1999) show that to maximize the signal-to-noise ratio (SNR), the weighting function must emphasize both higher pixel values and larger gradients in the transfer function, i.e.,

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/0dc06512b624ddc19fef312c17a181786e675a73821bdc947143536cb59b74d0.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/898c935d16a96e80bb16f8731431e3d5a279bf48cee82a47b0a78e48c545fb40.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/3d00470f32c362e759d464970791c139fe92ba109a302c5f8315ea14ef742bea.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/5b22cb3696b314b7177f5c7b90369a6a267850b873353882e424d3f256f826a9.jpg)  
(d)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/3503831a45d8a602be07056a65e2a942f955195bf2baefabac403796545e6944.jpg)  
(e)  
Figure 10.16 Merging multiple exposures to create a high dynamic range composite (Kang, Uyttendaele et al. 2003): (a–c) three different exposures; (d) merging the exposures using classic algorithms (note the ghosting due to the horse’s head movement); (e) merging the exposures with motion compensation.

$$
w(z) = g(z) / g^{\prime}(z),\tag{10.9}
$$

where the weights w are used to form the final irradiance estimate

$$
\log E_{i} = \frac{\sum_{j} w(z_{ij})[g(z_{ij}) - \log t_{j}]}{\sum_{j} w(z_{ij})}.\tag{10.10}
$$

Exercise 10.1 has you implement one of the radiometric response function calibration techniques and then use it to create radiance maps.

Under real-world conditions, casually acquired images may not be perfectly registered and may contain moving objects. Ward (2003) uses a global (parametric) transform to align the input images, while Kang, Uyttendaele et al. (2003) present an algorithm that combines global registration with local motion estimation (optical flow) to accurately align the images before blending their radiance estimates (Figure 10.16). Because the images may have widely different exposures, care must be taken when estimating the motions, which must themselves be checked for consistency to avoid the creation of ghosts and object fragments.

Even this approach, however, may not work when the camera is simultaneously undergoing large panning motions and exposure changes, which is a common occurrence in casually acquired panoramas. Under such conditions, different parts of the image may be seen at one or more exposures. Devising a method to blend all of these different sources while avoiding sharp transitions and dealing with scene motion is a challenging problem. One approach is to first find a consensus mosaic and to then selectively compute radiances in under- and over-exposed regions (Eden, Uyttendaele, and Szeliski 2006), as shown in Figure 10.17. Additional techniques for constructing and displaying high dynamic range video are discussed in Myszkowski, Mantiuk, and Krawczyk (2008), Tocci, Kiser et al. (2011), Sen, Kalantari et al. (2012), Dufaux, Le Callet et al. (2016), Banterle, Artusi et al. (2017), and Kalantari and Ramamoorthi (2017). Another approach is to use deep learning techniques to infer the high dynamic range radiance image from a single low dynamic range image (Liu, Lai et al. 2020b).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/2d78cd9af3620c9adaaf4fb29c413878df17b78c7437a494a5d7271a2987dc24.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/ea6f021b91a26efc3c48732f7f610ab069c6526b72b7eb98d3c16d77fe1c3e98.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/86bae01b922ab8610a721d86b07521db3aa3631de262c68b642ddbc80532c9e0.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/1566a85e575800b12a683b050df533b00255332bd36be5111c4b17efc19a40c4.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/0909076e28a8e90c53e8fa97a0ca463116c39d00bc2e9e375e55d02bde190b9e.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/e592e38d95b83c4d84d7963e9eefa097ab36158fbf76ad846346dd2d15211226.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/ab6db77692d4d744fbce9cf3e5cab2de7efffe92fb4b9a583d98d9d7453aa325.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/3377f9ce2cba6488353d12302eeb184e0f56f8bc0dff41000118f07e5d848355.jpg)  
(c)

![Figure 10.17](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/48bac3d5e6d2d92f3529583fda1896d32fd9a878700a1617bf51e0072f90de64.jpg)  
Figure 10.17 HDR merging with large amounts of motion (Eden, Uyttendaele, and Szeliski 2006) © 2006 IEEE: (a) registered bracketed input images; (b) results after the first pass of image selection: reference labels, image, and tone-mapped image; (c) results after the second pass of image selection: final labels, compressed HDR image, and tone-mapped image

Some cameras, such as the Sony α550 and Pentax K-7, have started integrating multiple exposure merging and tone mapping directly into the camera body. In the future, the need to compute high dynamic range images from multiple exposures may be eliminated by advances in camera sensor technology (Yang, El Gamal et al. 1999; Nayar and Mitsunaga 2000; Nayar and Branzoi 2003; Kang, Uyttendaele et al. 2003; Narasimhan and Nayar 2005; Tumblin, Agrawal, and Raskar 2005). However, the need to blend such images and to tone map them to lower-gamut displays is likely to remain.

HDR image formats. Before we discuss techniques for mapping HDR images back to a displayable gamut, we should discuss the commonly used formats for storing HDR images.

If storage space is not an issue, storing each of the R, G, and B values as a 32-bit IEEE float is the best solution. The commonly used Portable PixMap (.ppm) format, which supports both uncompressed ASCII and raw binary encodings of values, can be extended to a Portable FloatMap (.pfm) format by modifying the header. TIFF also supports full floating point values.

A more compact representation is the Radiance format (.pic, .hdr) (Ward 1994), which uses a single common exponent and per-channel mantissas. An intermediate encoding, OpenEXR from ILM,<sup>14</sup> uses 16-bit floats for each channel, which is a format supported natively on most modern GPUs. Ward (2004) describes these and other data formats such as LogLuv (Larson 1998) in more detail, as do the books by Freeman (2008) and Reinhard, Heidrich et al. (2010). An even more recent HDR image format is the JPEG XR standard.

## 10.2.1 Tone mapping

Once a radiance map has been computed, it is usually necessary to display it on a lower gamut (i.e., eight-bit) screen or printer. A variety of tone mapping techniques has been developed for this purpose, which involve either computing spatially varying transfer functions or reducing image gradients to fit the available dynamic range (Reinhard, Heidrich et al. 2010).

The simplest way to compress a high dynamic range radiance image into a low dynamic range gamut is to use a global transfer curve (Larson, Rushmeier, and Piatko 1997). Figure 10.18 shows one such example, where a gamma curve is used to map an HDR image back into a displayable gamut. If gamma is applied separately to each channel (Figure 10.18b), the colors become muted (less saturated), as higher-valued color channels contribute less (proportionately) to the final color. Extracting the luminance channel from the color image using (2.104), applying the global mapping to the luminance channel, and then reconstituting the color image using (10.19) works better (Figure 10.18c).

Unfortunately, when the image has a really wide range of exposures, this global approach still fails to preserve details in regions with widely varying exposures. What is needed, instead, is something akin to the dodging and burning performed by photographers in the darkroom. Mathematically, this is similar to dividing each pixel by the average brightness in a region around that pixel.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/b1bfca0e1f90715e5620ea503d015012246eea03afe477fefa01ca1c2c3e2e40.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/dceee027322e7913d81014d8ff23daac512bb70b5cec32dde9e16868563ea412.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/e8eaa82e0c13ac5fef6ae257c09cf0ab1716d564aeda0ffbb38aa63ca269df7d.jpg)  
(c)  
Figure 10.18 Global tone mapping: (a) input HDR image, linearly mapped; (b) gamma applied to each color channel independently; (c) gamma applied to intensity (colors are less washed out). Original HDR image courtesy of Paul Debevec, https://www.pauldebevec.com/ Research/HDR. Processed images courtesy of Fredo Durand, MIT 6.815/6.865 course on´ Computational Photography.

Figure 10.19 shows how this process works. As before, the image is split into its luminance and chrominance channels. The log luminance image

$$
H(x, y) = \log L(x, y)\tag{10.11}
$$

is then low-pass filtered to produce a base layer

$$
H_{\mathrm{L}}(x, y) = B(x, y) * H(x, y),\tag{10.12}
$$

and a high-pass detail layer

$$
H_{\mathrm{H}}(x, y) = H(x, y) - H_{\mathrm{L}}(x, y).\tag{10.13}
$$

The base layer is then contrast reduced by scaling to the desired log-luminance range,

$$
H_{\mathrm{H}}^{\prime}(x, y) = sH_{\mathrm{H}}(x, y)\tag{10.14}
$$

and added to the detail layer to produce the new log-luminance image

$$
I(x, y) = H_{\mathrm{H}}^{\prime}(x, y) + H_{\mathrm{L}}(x, y),\tag{10.15}
$$

which can then be exponentiated to produce the tone-mapped (compressed) luminance image. Note that this process is equivalent to dividing each luminance value by (a monotonic mapping of) the average log-luminance value in a region around that pixel.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/3864f076eaa5d8181d0b5ae1f3e49c8a7ad44efd3e7361ca9080bd65791e635b.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/a6ebe83065483c53de7d52234eb9aa15171da6a0d2a59615ad7c232e2e98efc8.jpg)  
(b)

Figure 10.19 Local tone mapping using linear filters: (a) low-pass and high-pass filtered log luminance images and color (chrominance) image; (b) resulting tone-mapped image (after attenuating the low-pass log luminance image) shows visible halos around the trees. Processed images courtesy of Fredo Durand, MIT 6.815/6.865 course on Computational Pho-´ tography.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/ba628cbcebd7d19f98309ae54461b214ce9adcd11ab2473a92cd5b1b2230381e.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/deecdf30dc6bb872af2e61d41a884914718b7725cb0ae7e98e8223d946592440.jpg)  
(b)  
Figure 10.20 Local tone mapping using a bilateral filter (Durand and Dorsey 2002): (a) low-pass and high-pass bilateral filtered log luminance images and color (chrominance) image; (b) resulting tone-mapped image (after attenuating the low-pass log luminance image) shows no halos. Processed images courtesy of Fredo Durand, MIT 6.815/6.865 course on´ Computational Photography.

![Figure 10.21](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/0b9eb097ca0ce7fc18b50d3ba8fe31942080a8fe650d75b1dd43d773ef250262.jpg)  
Figure 10.21 Gaussian vs. bilateral filtering (Petschnigg, Agrawala et al. 2004) © 2004 ACM: A Gaussian low-pass filter blurs across all edges and therefore creates strong peaks and valleys in the detail image that cause halos. The bilateral filter does not smooth across strong edges and thereby reduces halos while still capturing detail.

Figure 10.19 shows the low-pass and high-pass log luminance image and the resulting tone-mapped color image. Note how the detail layer has visible halos around the highcontrast edges, which are visible in the final tone-mapped image. This is because linear filtering, which is not edge preserving, produces halos in the detail layer (Figure 10.21).

The solution to this problem is to use an edge-preserving filter to create the base layer. Durand and Dorsey (2002) study a number of such edge-preserving filters, including anisotropic and robust anisotropic diffusion, and select bilateral filtering (Section 3.3.1) as their edgepreserving filter. (The paper by Farbman, Fattal et al. (2008) argues in favor of using a weighted least squares (WLF) filter as an alternative to the bilateral filter and Paris, Kornprobst et al. (2008) reviews bilateral filtering and its applications in computer vision and computational photography.) Figure 10.20 shows how replacing the linear low-pass filter with a bilateral filter produces tone-mapped images with no visible halos. Figure 10.22 summarizes the complete information flow in this process, starting with the decomposition into log luminance and chrominance images, bilateral filtering, contrast reduction, and re-composition into the final output image.

An alternative to compressing the base layer is to compress its derivatives, i.e., the gradient of the log-luminance image (Fattal, Lischinski, and Werman 2002). Figure 10.23 illustrates this process. The log-luminance image is differentiated to obtain a gradient image

$$
H^{\prime}(x, y) = \nabla H(x, y).\tag{10.16}
$$

This gradient image is then attenuated by a spatially varying attenuation function $\Phi(x, y)$

$$
G(x, y) = H^{\prime}(x, y) \Phi(x, y).\tag{10.17}
$$

The attenuation function $I(x, y)$ is designed to attenuate large-scale brightness changes (Figure 10.24a) and is designed to take into account gradients at different spatial scales (Fattal,

![Figure 10.22](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/a4f4c25ed95b06d12634e24bc6c9c366975c74a95d39c5b750642d5192782e44.jpg)  
Figure 10.22 Local tone mapping using a bilateral filter (Durand and Dorsey 2002): summary of algorithm workflow. Images courtesy of Fredo Durand, MIT 6.815/6.865 course on´ Computational Photography.

Lischinski, and Werman 2002).

After attenuation, the resulting gradient field is re-integrated by solving a first-order variational (least squares) problem,

$$
\operatorname{min} \int \int \| \nabla I(x, y) - G(x, y) \|^{2} dxdy\tag{10.18}
$$

to obtain the compressed log-luminance image $I(x, y)$ . This least squares problem is the same that was used for Poisson blending (Section 8.4.4) and was first introduced in our study of regularization (Section 4.2, 4.24). It can efficiently be solved using techniques such as multigrid and hierarchical basis preconditioning (Fattal, Lischinski, and Werman 2002; Szeliski 2006b; Farbman, Fattal et al. 2008; Krishnan and Szeliski 2011; Krishnan, Fattal, and Szeliski 2013). Once the new luminance image has been computed, it is combined with the original color image using

$$
C_{\mathrm{out}} = \left({\frac{C_{\mathrm{in}}}{L_{\mathrm{in}}}} \right)^{s} L_{\mathrm{out}},\tag{10.19}
$$

where $C =(R, G, B)$ and $L_{\mathrm{in}}$ and $L_{\mathrm{out}}$ are the original and compressed luminance images. The exponent s controls the saturation of the colors and is typically in the range $s \in[0.4, 0.6]$ (Fattal, Lischinski, and Werman 2002). Figure 10.24b shows the final tone-mapped color image, which shows no visible halos despite the extremely large variation in input radiance values.

![Figure 10.23](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/2cc605ab6c5dbb781e83a432a3ce6559a11084c6c2a2a1ca7d1963d1be4fb936.jpg)  
Figure 10.23 Gradient domain tone mapping (Fattal, Lischinski, and Werman 2002) © 2002 ACM. The original image with a dynamic range of 2415:1 is first converted into the log domain, H(x), and its gradients are computed, H0(x). These are attenuated (compressed) based on local contrast, G(x), and integrated to produce the new logarithmic exposure image I(x), which is exponentiated to produce the final intensity image, whose dynamic range is 7.5:1.

Yet another alternative to these two approaches is to perform the local dodging and burning using a locally scale-selective operator (Reinhard, Stark et al. 2002). Figure 10.25 shows how such a scale selection operator can determine a radius (scale) that only includes similar color values within the inner circle while avoiding much brighter values in the surrounding circle. In practice, a difference of Gaussians normalized by the inner Gaussian response is evaluated over a range of scales, and the largest scale whose metric is below a threshold is selected (Reinhard, Stark et al. 2002).

Another recently developed approach to tone mapping based on multi-resolution decomposition is the Local Laplacian Filter (Paris, Hasinoff, and Kautz 2011), which we introduced in Section 3.5.3. Coefficients in a Laplacian pyramid are constructed from locally contrastadjusted patches, which enables the technique to not only tone map HDR images, but also to enhance local details and do style transfer (Aubry, Paris et al. 2014).

What all of these techniques have in common is that they adaptively attenuate or brighten different regions of the image so that they can be displayed in a limited gamut without loss of contrast. Lischinski, Farbman et al. (2006) introduce an interactive technique that performs this operation by interpolating a set of sparse user-drawn adjustments (strokes and associated exposure value corrections) to a piecewise-continuous exposure correction map (Figure 10.26). The interpolation is performed by minimizing a locally weighted least squares (WLS) variational problem,

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/2f8afb1803b950c7f90b1d485f83e277ac2978ff74b1f03e15b505ef88476ba2.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/85dbf72456a1a071c2abf548a338425c12b390e85cf55b8c4fb82be06a6e54ba.jpg)  
(b)

Figure 10.24 Gradient domain tone mapping (Fattal, Lischinski, and Werman 2002) © 2002 ACM: (a) attenuation map, with darker values corresponding to more attenuation; (b) final tone-mapped image.  
![Figure 10.25](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/67dbabb335f7014edc2033e4c41259195fbd8007137902d8ce83ebce22680184.jpg)  
Figure 10.25 Scale selection for tone mapping (Reinhard, Stark et al. 2002) © 2002 ACM.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/0828e202e01353a57af1a090df96a0dde76b0eb49915be78882bd1f3811f283e.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/b5e8b82342a5ba77a1b93a19c6803bda4141f404c39879876d7f0e62f3e17b63.jpg)  
(b)  
Figure 10.26 Interactive local tone mapping (Lischinski, Farbman et al. 2006) © 2006 ACM: (a) user-drawn strokes with associated exposure values g(x, y); (b) corresponding piecewise-smooth exposure adjustment map f(x, y).

$$
\operatorname{min} \int \int w_{d}(x, y) \| f(x, y) - g(x, y) \|^{2} dxdy + \lambda \int \int w_{s}(x, y) \| \nabla f(x, y) \|^{2} dxdy,\tag{10.20}
$$

where $g(x, y)$ and $f(x, y)$ are the input and output log exposure (attenuation) maps (Figure 10.26). The data weighting term $w_{d}(x, y)$ is 1 at stroke locations and 0 elsewhere. The smoothness weighting term $w_{s}(x, y)$ is inversely proportional to the log-luminance gradient,

$$
w_{s} ={\frac{1}{\| \nabla H \|^{\alpha} + \epsilon}}\tag{10.21}
$$

and hence encourages the $f(x, y)$ map to be smoother in low-gradient areas than along highgradient discontinuities.<sup>15</sup> The same approach can also be used for fully automated tone mapping by setting target exposure values at each pixel and allowing the weighted least squares to convert these into piecewise smooth adjustment maps.

The weighted least squares algorithm, which was originally developed for image colorization applications (Levin, Lischinski, and Weiss 2004), has since been applied to general edge-preserving smoothing in applications such as contrast enhancement (Bae, Paris, and Durand 2006) and tone mapping (Farbman, Fattal et al. 2008) where the bilateral filtering was previously used. It can also be used to perform HDR merging and tone mapping simultaneously (Raman and Chaudhuri 2007, 2009).

Given the wide range of locally adaptive tone mapping algorithms that have been developed, which ones should be used in practice? Freeman (2008) provides a great discussion of commercially available algorithms, their artifacts, and the parameters that can be used to control them. He also has a wealth of tips for HDR photography and workflow. I highly recommend his book for anyone contemplating additional research (or personal photography) in this area.

## 10.2.2 Application: Flash photography

While high dynamic range imaging combines images of a scene taken at different exposures, it is also possible to combine flash and non-flash images to achieve better exposure and color balance and to reduce noise (Eisemann and Durand 2004; Petschnigg, Agrawala et al. 2004).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/4eebcdaf2284c34d2e2d28d94cfd7ed1e51510970b9f384d10e0b0e08b3f003c.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/485c4fd25f0a8b1963a74723bb5daeb6e26741be4d61079642fbce664bc6e430.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/fb47dd5b14c337044546e91d76f01b9c3f62f1633dded1e3f3bc2c60443afcad.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/fcc59491905224c7820737a4fad56561c1f24085d54751f2a342017a9dac30d0.jpg)  
(d)  
Figure 10.27 Detail transfer in flash/no-flash photography (Petschnigg, Agrawala et al. 2004) © 2004 ACM: (a) details of input ambient A and flash F images; (b) joint bilaterally filtered no-flash image $A^{NR}$ ; (c) detail layer $F^{Detail}$ computed from the flash image F ; (d) final merged image $A^{Final}$

The problem with flash images is that the color is often unnatural (it fails to capture the ambient illumination), there may be strong shadows or specularities, and there is a radial falloff in brightness away from the camera (Figures 10.1b and 10.27a). Non-flash photos taken under low light conditions often suffer from excessive noise (because of the high ISO gains and low photon counts) and blur (due to longer exposures). Is there some way to combine a non-flash photo taken just before the flash goes off with the flash photo to produce an image with good color values, sharpness, and low noise? In fact, the discontinued FujiFilm FinePix F40fd camera takes a pair of flash and no flash images in quick succession; however, it only lets you decide to keep one of them.

Petschnigg, Agrawala et al. (2004) approach this problem by first filtering the no-flash (ambient) image A with a variant of the bilateral filter called the joint bilateral $\mathit{flter}^{16}$ in which the range kernel (3.36)

$$
r(i, j, k, l) = \exp \left(- \frac{\| f(i, j) - f(k, l) \|^{2}}{2 \sigma_{r}^{2}} \right)\tag{10.22}
$$

is evaluated on the flash image F instead of the ambient image A, as the flash image is less noisy and hence has more reliable edges (Figure 10.27b). Because the contents of the flash image can be unreliable inside and at the boundaries of shadows and specularities, these are detected and a regular bilaterally filtered image $A^{Base}$ is used instead (Figure 10.28).

The second stage of their algorithm computes a flash detail image

$$
F^{Detail} = \frac{F + \epsilon}{F^{\mathrm{Base}} + \epsilon},\tag{10.23}
$$

![Figure 10.28](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/63cfb16403e6ae9608800a2331c71226ad5ddddd64fb6219727f0e0e41b8b681.jpg)  
Figure 10.28 Flash/no-flash photography algorithm (Petschnigg, Agrawala et al. 2004) © 2004 ACM. The ambient (no-flash) image A is filtered with a regular bilateral filter to produce $A^{Base}$ , which is used in shadow and specularity regions, and a joint bilaterally filtered noise reduced image $A^{NR}$ . The flash image F is bilaterally filtered to produce a base image F <sup>Base</sup> and a detail (ratio) image $F^{Detail}$ , which is used to modulate the denoised ambient image. The shadow/specularity mask M is computed by comparing linearized versions of the flash and no-flash images.

where $F^{Base}$ is a bilaterally filtered version of the flash image F and $\epsilon = 0.02$ . This detail image (Figure 10.27c) encodes details that may have been filtered away from the noise-reduced no-flash image $A^{NR}$ , as well as additional details created by the flash camera, which often add crispness. The detail image is used to modulate the noise-reduced ambient image $A^{NR}$ to produce the final results

$$
A^{Final} =(1 - M) A^{NR} F^{Detail} + MA^{Base}\tag{10.24}
$$

shown in Figures 10.1b and 10.27d.

Eisemann and Durand (2004) present an alternative algorithm that shares some of the same basic concepts. Both papers are well worth reading and contrasting (Exercise 10.6).

Flash images can also be used for a variety of additional applications such as extracting more reliable foreground mattes of objects (Raskar, Tan et al. 2004; Sun, Li et al. 2006). Given a large enough training set, it is also possible to decompose single flash images into their ambient and flash illumination components, which can be used to adjust their appearance (Aksoy, Kim et al. 2018). Flash photography is just one instance of the more general topic of active illumination, which is discussed in more detail by Raskar and Tumblin (2010) and Ikeuchi, Matsushita et al. (2020).

## 10.3 Super-resolution, denoising, and blur removal

While high dynamic range imaging enables us to obtain an image with a larger dynamic range than a single regular image, super-resolution enables us to create images with higher spatial resolution and less noise than regular camera images (Chaudhuri 2001; Park, Park, and Kang 2003; Capel and Zisserman 2003; Capel 2004; van Ouwerkerk 2006; Anwar, Khan, and Barnes 2020). Most commonly, super-resolution refers to the process of aligning and combining several input images to produce such high-resolution composites (Irani and Peleg 1991; Cheeseman, Kanefsky et al. 1993; Pickup, Capel et al. 2009; Wronski, Garcia-Dorado et al. 2019). However, some techniques can super-resolve a single image (Freeman, Jones, and Pasztor 2002; Baker and Kanade 2002; Fattal 2007; Anwar, Khan, and Barnes 2020) and are hence closely related to techniques for removing blur (Sections 3.4.1 and 3.4.2). Anwar, Khan, and Barnes (2020) provide a comprehensive review of single image super-resolution techniques with a particular focus on recent deep learning-based approaches.

A traditional way to formulate the super-resolution problem is to write down the stochastic image formation equations and image priors and to then use Bayesian inference to recover the super-resolved (original) sharp image. We can do this by generalizing the image formation equations used for image deblurring (Section 3.4.1), which we also used for blur kernel (PSF) estimation (Section 10.1.4). In this case, we have several observed images $\{o_{k}({\bf x})\}$ , as well as an image warping function $\hat{\mathbf{h}}_{k}(\mathbf{x})$ for each observed image (Figure 3.46). Combining all of these elements, we get the (noisy) observation equations<sup>1</sup>

$$
o_{k}({\bf x}) = D \{b({\bf x}) * s(\hat{\bf h}_{k}({\bf x}))\} + n_{k}({\bf x}),\tag{10.25}
$$

where D is the downsampling operator, which operates after the super-resolved (sharp) warped image $s(\hat{\mathbf{h}}_{k}(\mathbf{x}))$ has been convolved with the blur kernel $b(\mathbf{x})$ . The above image formation equations lead to the following least squares problem,

$$
\sum_{k} \| o_{k}(\mathbf{x}) - D \{b_{k}(\mathbf{x}) * s(\hat{\mathbf{h}}_{k}(\mathbf{x}))\} \|^{2}.\tag{10.26}
$$

In most super-resolution algorithms, the alignment (warping) $\hat{\mathbf{h}}_{k}$ is estimated using one of the input frames as the reference frame; either feature-based (Section 8.1.3) or direct (imagebased) (Section 9.2) parametric alignment techniques can be used. (A few algorithms, such as those described by Schultz and Stevenson (1996), Capel (2004), and Wronski, Garcia-Dorado et al. (2019) use dense (per-pixel flow) estimates.) A better approach is to re-compute the alignment by directly minimizing (10.26) once an initial estimate of $s(\mathbf{x})$ has been computed (Hardie, Barnard, and Armstrong 1997) or to marginalize out the motion parameters altogether (Pickup, Capel et al. 2007).

The point spread function (blur kernel) $b_{k}$ is either inferred from knowledge of the image formation process (e.g., the amount of motion or defocus blur and the camera sensor optics) or calibrated from a test image or the observed images $\left\{o_{k} \right\}$ using one of the techniques described in Section 10.1.4. The problem of simultaneously inferring the blur kernel and the sharp image is known as blind image deconvolution (Kundur and Hatzinakos 1996; Levin 2006; Levin, Weiss et al. 2011; Campisi and Egiazarian 2017).<sup>18</sup>

Given an estimate of $\hat{\mathbf{h}}_{k}$ and $b_{k}({\bf x})$ , (10.26) can be re-written using matrix/vector notation as a large sparse least squares problem in the unknown values of the super-resolved pixels s,

$$
\sum_{k} \| \mathbf{o}_{k} - \mathbf{D} \mathbf{B}_{k} \mathbf{W}_{k} \mathbf{s} \|^{2}.\tag{10.27}
$$

(Recall from (3.75) that once the warping function $\hat{\mathbf{h}}_{k}$ is known, values of $s(\hat{\mathbf{h}}_{k}(\mathbf{x}))$ depend linearly on those in $s(\mathbf{x}).)$ An efficient way to solve this least squares problem is to use preconditioned conjugate gradient descent (Capel 2004), although some earlier algorithms, such as the one developed by Irani and Peleg (1991), used regular gradient descent (also known as iterative back projection (IBP) in the computed tomography literature).

The above formulation assumes that warping can be expressed as a simple (sinc or bicubic) interpolated resampling of the super-resolved sharp image, followed by a stationary (spatially invariant) blurring (PSF) and area integration process. However, if the surface is severely foreshortened, we have to take into account the spatially varying filtering that occurs during the image warping (Section 3.6.1), before we can then model the PSF induced by the optics and camera sensor (Wang, Kang et al. 2001; Capel 2004).

How well does this least squares (MLE) approach to super-resolution work? In practice, this depends a lot on the amount of blur and aliasing in the camera optics, as well as the accuracy in the motion and PSF estimates (Baker and Kanade 2002; Jiang, Wong, and Bao 2003; Capel 2004). Less blurring and more aliasing means that there is more (aliased) high frequency information available to be recovered. However, because the least squares (maximum likelihood) formulation uses no image prior, a lot of high-frequency noise can be introduced into the solution (Figure 10.29c).

For this reason, classic super-resolution algorithms assume some form of image prior. The simplest of these is to place a penalty on the image derivatives similar to Equations (4.29) and

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/4bd77cc74380c7915f0db304ef7171b1f5ab2c27a6570b231b4e7dd9fffb6570.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/80e05063ed3f98d022d6282db4089176c4f62d34ab876282bb694904522daaae.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/8cc0072505689dd8423c1f758b6971388b519051179aad6f831afa59e96903da.jpg)  
(c)

(b)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/0fbf461b60a3cbbfe1c798242f54634627bcfea3f5a5b605e6d70bb9f8bd466b.jpg)  
(d)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/a9e793cf6fb423373f9b734166b0928b85ac080f0ef46db40c604a21af693f9e.jpg)  
(e)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/88e1c4930db836ac0b07ca836d64f64ec08719954dafab29a393cdcd7c9cc2fb.jpg)  
(f)  
Figure 10.29 Super-resolution results using a variety of image priors (Capel 2001): (a) Low-res ROI (bicubic $3 \times zoom)_{\cdot}$ ; (b) average image; (c) MLE @ 1.25 pixel-zoom; (d) simple $\| x \|^{2}$ prior $(\lambda = 0.004)$ ; (e) GMRF $(\lambda = 0.003)$ ; (f) HMRF $(\lambda = 0.01$ $\alpha = 0.04)$ . 10 images are used as input and a $3 \times$ super-resolved image is produced in each case, except for the MLE result in (c).

(4.42), e.g.,

$$
\sum_{(i, j)} \rho_{p}(s(i, j) - s(i + 1, j)) + \rho_{p}(s(i, j) - s(i, j + 1)).\tag{10.28}
$$

As discussed in Section 4.3, when $\rho_{p}$ is quadratic, this is a form of Tikhonov regularization (Section 4.2), and the overall problem is still linear least squares. The resulting prior image model is a Gaussian Markov random field (GMRF), which can be extended to other (e.g., diagonal) differences, as in Capel (2004) and Figure 10.29.

Unfortunately, GMRFs tend to produce solutions with visible ripples, which can also be interpreted as increased noise sensitivity in middle frequencies. A better image prior is a robust prior that encourages piecewise continuous solutions (Black and Rangarajan 1996), see Appendix B.3. Examples of such priors include the Huber potential (Schultz and Stevenson 1996; Capel and Zisserman 2003), which is a blend of a Gaussian with a longer-tailed Laplacian, and the even sparser (heavier-tailed) hyper-Laplacians used by Levin, Fergus et al. (2007) and Krishnan and Fergus (2009). It is also possible to learn the parameters for such priors using cross-validation (Capel 2004; Pickup 2007).

While sparse (robust) derivative priors can reduce rippling effects and increase edge sharpness, they cannot hallucinate higher-frequency texture or details. To do this, a training set of sample images can be used to find plausible mappings between low-frequency originals and the missing higher frequencies. Inspired by some of the example-based texture synthesis algorithms we discuss in Section 10.5, the example-based super-resolution algorithm developed by Freeman, Jones, and Pasztor (2002) uses training images to learn the mapping between local texture patches and missing higher-frequency details. To ensure that overlapping patches are similar in appearance, a Markov random field is used and optimized using either belief propagation (Freeman, Pasztor, and Carmichael 2000) or a raster-scan deterministic variant (Freeman, Jones, and Pasztor 2002). Figure 10.30 shows the results of hallucinating missing details using this approach and compares these results to a more recent algorithm by Fattal (2007). This latter algorithm learns to predict oriented gradient magnitudes in the finer resolution image based on a pixel’s location relative to the nearest detected edge along with the corresponding edge statistics (magnitude and width). It is also possible to combine sparse (robust) derivative priors with example-based super-resolution, as shown by Tappen, Russell, and Freeman (2003).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/f3f752fb6c2556bca87ea386a39c322c22bd5b3588d9cde70f5a06aa201c2b00.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/66879c028fd45cd84c0de6e12ffaa70721f5d1843093264f89688a6f1eb2be7b.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/923908cd177abbb447fcdb2073525c4cabe721be8ce7a1c115d66e40c156c3f7.jpg)  
(c)  
Figure 10.30 Example-based super-resolution: (a) original 32 32 low-resolution image; (b) example-based super-resolved 256 256 image (Freeman, Jones, and Pasztor 2002) © 2002 IEEE; (c) upsampling via imposed edge statistics (Fattal 2007) © 2007 ACM.

An alternative (but closely related) form of hallucination is to recognize the parts of a training database of images to which a low-resolution pixel might correspond. In their work, Baker and Kanade (2002) use local derivative-of-Gaussian filter responses as features and then match parent structure vectors in a manner similar to De Bonet (1997).<sup>19</sup> The highfrequency gradient at each recognized training image location is then used as a constraint on the super-resolved image, along with the usual reconstruction (prediction) Equation (10.26).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/214f905d272da3cf0862f615263bed8e4f8072c600320365362ff99b372fe402.jpg)  
(a) Input 24 × 32

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/71f3d98ffa6306b094a2f003022c7e85c05b64b31ce0b7d68604755aaf1a70dd.jpg)  
(b) Hallucinated

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/371ce6a865ec35bd9e3aea6f128529e5e168b47d477a562be30c93e3b4571017.jpg)  
(c) Hardie et al.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/3d8cd7620da5c8ff70f28356af80d44eb2fe543ee9152570717752bf47d66f4d.jpg)  
(d) Original

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/15e741064a93634c078f175eb2934859b2da4bdc69de56de27ebbcaf6abf3d90.jpg)  
(e) Cubic B-spline

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/1e89fdd1b01f3ff95d848584453db154568918596b0d39660cfc37fb95c15f6b.jpg)  
(f) Input 24 × 32

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/3fa1fca9f6a75f596ab2ad62e3594b16b2e71ed7c1ef81402437d1c9c98ce90b.jpg)  
(g) Hallucinated

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/d18929ecdc13fcb42e665c48921674542c19b391bf2d71b33232d7c1444afbce.jpg)  
(h) Hardie et al.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/42b6c8c6c5831c46982aea0c436b2cce33253f8554c81fc700d1fc2d271f8186.jpg)  
(i) Original

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/dad414449e5d6bbc86e1048a7df059fdc9874e1fa4a8e4ca0d9305f5bd9724cd.jpg)  
(j) Cubic B-spline

Figure 10.31 Recognition-based super-resolution (Baker and Kanade 2002) © 2002 IEEE. The Hallucinated column shows the results of the recognition-based algorithm compared to the regularization-based approach of Hardie, Barnard, and Armstrong (1997).

Figure 10.31 shows the result of hallucinating higher-resolution faces from lower-resolution inputs; Baker and Kanade (2002) also show examples of super-resolving known-font text. Exercise 10.7 gives more details on how to implement and test one or more of these superresolution techniques.

The latest trend in super-resolution has been the use of deep neural networks to directly predict super-resolved images. This approach, which began with the seminal work of Dong, Loy et al. (2016), has generated dozens of different DNNs and architectures, including the Deep Learning Super Sampling hardware embedded in the latest NVIDIA graphics cards (Burnes 2020). The recent survey on single-image super-resolution by Anwar, Khan, and Barnes (2020) categorizes these algorithms into a taxonomy (Figure 10.32a), provides a pictorial summary network architectures (Figure 10.32b), and compares the super-resolution results both numerically and visually on noise-free known bicubic-kernel decimation image datasets. While the results shown in Figure 10.33 show dramatic differences between algorithms, it is not clear how well these algorithms generalize to real-world noisy input with unknown blur kernels. The RealSR real-world super-resolution dataset developed by (Cai, Zeng et al. 2019), shot using a zoom lens on a digital camera, provides a means to test (and train) algorithms on real imaging degradations. This dataset forms the basis for the NTIRE challenges on real image super-resolution (Cai, Gu et al. 2019),<sup>20</sup> which provide empirical comparisons of recent deep network-based algorithms.

![Figure 10.32](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/9c7e1bf27a336d7b8ea69ac133d6d22584ca9df06ed5dbde47dbb99417099777.jpg)  
Figure 10.32 Recent deep neural network algorithms for single image super-resolution (Anwar, Khan, and Barnes 2020) © 2020 ACM: (a) a taxonomy of the algorithms based on their general approach; (b) schematic architectures for a subset of the algorithms.

![Figure 10.33](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/6d84e0cafc4a6eaa02aa0d53e509de0837de161f62b950fd1afbab176a8f0cf9.jpg)  
Figure 10.33 Visual comparison of some super-resolution algorithms (Anwar, Khan, and Barnes 2020) © 2020 ACM.  
Not Learning-based Method Generative Learning-based Method Discriminative Learning-based Method

![Figure 10.34](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/c4e6ef8ca4d5486bbb0bccb745880df5c2c931feee8f72d87efd25499ecc8be4.jpg)  
Figure 10.34 Timeline of denoising algorithms from Gu and Timofte (2019) © 2019 Springer.

While single-image super-resolution is interesting, much more impressive (and practical) results can be obtained by building a multi-frame super-resolution algorithm directly into a smartphone camera, where the processing can be done jointly with the image demosaicing. We discuss recent work by Wronski, Garcia-Dorado et al. (2019) in Section 10.3.1 and Figure 10.38 on color image demosaicing. It is also possible to upsample videos temporally using frame interpolation (Section 9.4.1), spatially using video super-resolution (Liu and Sun 2013; Kappeler, Yoo et al. 2016; Shi, Caballero et al. 2016; Tao, Gao et al. 2017; Nah, Timofte et al. 2019; Isobe, Jia et al. 2020; Li, Tao et al. 2020), or simultaneously in both the spatial and temporal dimensions (Kang, Jo et al. 2020).

## Single and multi-frame denoising

Image denoising is one of the classic problems in image processing and computer vision (Perona and Malik 1990b; Rudin, Osher, and Fatemi 1992; Buades, Coll, and Morel 2005b). Over the last four decades, hundreds of algorithms have been developed, and the field continues to be actively studied, with recent algorithms all being based on deep neural networks.

The latest benchmark for comparing image denoising algorithms, the NTIRE 2020 Challenge on Real Image Denoising (Abdelhamed, Afifi et al. 2020), is based on a smartphone image denoising dataset (SIDD) (Abdelhamed, Lin, and Brown 2018), where the noise-free ground truth images were obtained by averaging sets of 150 noisy images. This provides much more realistic and varied real-world noise and image processing models than the synthetically noised images used in most previous benchmarks (with the exception of (Plotz and¨ Roth 2017)).

A recent (brief) survey on image denoising by Gu and Timofte (2019) includes the following seminal denoising papers<sup>21</sup> (see Figure 10.34 for a timeline):

- total variation (TV) (Rudin, Osher, and Fatemi 1992; Chan, Osher, and Shen 2001; Chambolle 2004; Chan and Shen 2005),

- Gaussian scale mixtures (GSMs) (Lyu and Simoncelli 2009),

- Field of Experts (FoE) (Roth and Black 2009),

- non-local means (NLM) (Buades, Coll, and Morel 2005a,b),

- BM3D (Dabov, Foi et al. 2007),

- sparse overcomplete dictionaries (K-SVD) (Aharon, Elad, and Bruckstein 2006),

- expected patch log likelihood (EPLL) (Zoran and Weiss 2011),

- an MLP denoiser (Burger, Schuler, and Harmeling 2012),

- weighted nuclear norm minimization (WNNM) (Gu, Zhang et al. 2014),

- shrinkage fields (CSF) (Schmidt and Roth 2014),

- Trainable Nonlinear Reaction Diffusion (TNRD) (Chen and Pock 2016),

- a cross-channel noise model for color images (Nam, Hwang et al. 2016), • a denoising residual CNN (DnCNN) (Zhang, Zuo et al. 2017), which is now considered the baseline for DNN denoising, and

- learning to see in the dark (Chen, Chen et al. 2018).

While these results show dramatic improvement over time, today’s imaging sensors for the most part produce relatively clean images, except in low-light situations, where the ISO camera gain must be increased and the read and photon noise become comparable to the signal strength. In this regime, it is preferable, if possible, to take a rapid burst of images at low ISO (gain) and then combine these to obtain a denoised image (Hasinoff, Kutulakos et al. 2009; Hasinoff, Durand, and Freeman 2010; Liu, Yuan et al. 2014). This approach was generalized and applied to low-light photography in the HDR+ system of Hasinoff, Sharlet et al. (2016). More recent work along these lines, some of which combines low-light photography, demosaicing, and in some cases super-resolution, includes papers by Godard, Matzen, and Uyttendaele (2018), Chen, Chen et al. (2018), Mildenhall, Barron et al. (2018), Wronski, Garcia-Dorado et al. (2019), and (Rong, Demandolx et al. 2020). Liba, Murthy et al. (2019) describe the technology that underlies Google’s Night Sight feature, which not only robustly aligns and merges different moving regions together under noisy conditions, but also introduces the concept of “motion metering” to determine the optimal number of frames and exposure times.

## Blur removal

Under favorable conditions, super-resolution and related upsampling techniques can increase the resolution of a well-photographed image or image collection. When the input images are blurry to start with, the best one can often hope for is to reduce the amount of blur. This problem is closely related to super-resolution, with the biggest differences being that the blur kernel b is usually much larger (and unknown) and the downsampling factor D is unity.

A large literature on image deblurring exists; some publications with nice literature reviews include those by Fergus, Singh et al. (2006), Yuan, Sun et al. (2008), and Joshi, Zitnick et al. (2009). It is also possible to reduce blur by combining sharp (but noisy) images with blurrier (but cleaner) images (Yuan, Sun et al. 2007), take lots of quick exposures (Hasinoff and Kutulakos 2011; Hasinoff, Kutulakos et al. 2009; Hasinoff, Durand, and Freeman 2010), or use coded aperture techniques to simultaneously estimate depth and reduce blur (Levin, Fergus et al. 2007; Zhou, Lin, and Nayar 2009). When available, data from on-board IMUs (inertial measurement units) can be used for blur kernel determination (Joshi, Kang et al. 2010). It is also possible to use information from dual-pixel sensors to aid the deblurring of misfocused images (Abuolaim and Brown 2020).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/02ef20e52427d4aa981903ae55edc61381b8d4027ce6cb4a19f8081d7cee0b4c.jpg)  
(a)

<table><tr><td rowspan=1 colspan=1>rGb</td><td rowspan=1 colspan=1>Rgb</td><td rowspan=1 colspan=1>rGb</td><td rowspan=1 colspan=1>Rgb</td></tr><tr><td rowspan=1 colspan=1>rgB</td><td rowspan=1 colspan=1>rGb</td><td rowspan=1 colspan=1>rgB</td><td rowspan=1 colspan=1>rGb</td></tr><tr><td rowspan=1 colspan=1>rGb</td><td rowspan=1 colspan=1>Rgb</td><td rowspan=1 colspan=1>rGb</td><td rowspan=1 colspan=1>Rgb</td></tr><tr><td rowspan=1 colspan=1>rgB</td><td rowspan=1 colspan=1>rGb</td><td rowspan=1 colspan=1>rgB</td><td rowspan=1 colspan=1>rGb</td></tr></table>

(b)  
Figure 10.35 Bayer RGB pattern: (a) color filter array layout; (b) interpolated pixel values, with unknown (guessed) values shown as lower case.

The past decade has seen the introductions of a large number of new learning-based deblurring algorithms (Sun, Cao et al. 2015; Schuler, Hirsch et al. 2016; Nah, Hyun Kim, and Mu Lee 2017; Kupyn, Budzan et al. 2018; Tao, Gao et al. 2018; Zhang, Dai et al. 2019; Kupyn, Martyniuk et al. 2019). There has also been some work on artificially re-introducing texture in deblurred images to better match the expected image statistics (Cho, Joshi et al. 2012), i.e., what is now commonly called perceptual loss (Section 5.3.4).

## 10.3.1 Color image demosaicing

A special case of super-resolution, which is used daily in most digital still cameras, is the process of demosaicing samples from a color filter array (CFA) into a full-color RGB image. Figure 10.35 shows the most commonly used CFA known as the Bayer pattern, which has twice as many green (G) sensors as red and blue sensors.

The process of going from the known CFA pixels values to the full RGB image is quite challenging. Unlike regular super-resolution, where small errors in guessing unknown values usually show up as blur or aliasing, demosaicing artifacts often produce spurious colors or high-frequency patterned zippering, which are quite visible to the eye (Figure 10.36b).

Over the years, a variety of techniques have been developed for image demosaicing (Kimmel 1999). Longere, Delahunt et al. (2002), Tappen, Russell, and Freeman (2003), and Li, Gunturk, and Zhang (2008) provide surveys of the field as well as comparisons of previously developed techniques using perceptually motivated metrics. To reduce the zippering effect, most techniques use the edge or gradient information from the green channel, which is more reliable because it is sampled more densely, to infer plausible values for the red and blue channels, which are more sparsely sampled.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/d114118ce912be13d1182e5793a6fd9220413f95d8ea5ce7f4254970316966ff.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/90c74ddd15e40289ecd1473521ffa7941373fdc1221524708edf473596164ea7.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/ffe93f883bf4005a5e32d2b3acfe9658863c13c4a36d9ef40a8b3c9c71ef85b2.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/57ad7c842c6be5791797592a2fd61913dc6b7a5e775fd247da86748f32b4932d.jpg)  
(d)  
Figure 10.36 CFA demosaicing results (Bennett, Uyttendaele et al. 2006) © 2006 Springer: (a) original full-resolution image (a color subsampled version is used as the input to the algorithms); (b) bilinear interpolation results, showing color fringing near the tip of the blue crayon and zippering near its left (vertical) edge; (c) the high-quality linear interpolation results of Malvar, He, and Cutler (2004) (note the strong halo/checkerboard artifacts on the yellow crayon); (d) using the local two-color prior of Bennett, Uyttendaele et al. (2006).

To reduce color fringing, some techniques perform a color space analysis, e.g., using median filtering on color opponent channels (Longere, Delahunt et al. 2002). The approach of Bennett, Uyttendaele et al. (2006) computes local two-color models from an initial demosaicing result, using a moving 5 5 window to find the two dominant colors (Figure 10.37).<sup>22</sup>

Once the local color model has been estimated at each pixel, a Bayesian approach is then used to encourage pixel values to lie along each color line and to cluster around the dominant color values, which reduces halos (Figure 10.36d). The Bayesian approach also supports the simultaneous application of demosaicing, denoising, and super-resolution, i.e., multiple CFA inputs can be merged into a higher-quality full-color image. More recent work that combines demosaicing and denoising includes papers by Chatterjee, Joshi et al. (2011) and Gharbi, Chaurasia et al. (2016). The NTIRE 2020 Challenge on Real Image Denoising (Abdelhamed, Afifi et al. 2020) includes a track on denoising RAW (i.e., color filter array) images. There’s also an interesting paper by Jin, Facciolo, and Morel (2020) studying whether denoising should be applied before or after demosaicing.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/05f5b9e032a5f78e5bff29cd183b92ed6e1034ae2b5087b8e351894036fa1c4f.jpg)

![Figure 10.37](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/a66a8ff6927a7076fdac2b9736a3aa6ba632fd00f3abce185664c168487a046f.jpg)  
Figure 10.37 Two-color model computed from a collection of local $5 \times 5$ neighborhoods (Bennett, Uyttendaele et al. 2006) © 2006 Springer. After two-means clustering and reprojection along the line joining the two dominant colors (red dots), the majority of the pixels fall near the fitted line. The distribution along the line, projected along the RGB axes, is peaked at 0 and 1, the two dominant colors.

As we mentioned before, burst photography (Cohen and Szeliski 2006; Hasinoff, Kutulakos et al. 2009; Hasinoff and Kutulakos 2011), i.e., the combination of rapidly acquired sequences of images, is becoming ubiquitous in smartphone cameras. A wonderful example of a recent system that performs joint demosaicing and multi-frame super-resolutions, based on locally adapted kernel functions (Figure 10.38), is the paper by Wronski, Garcia-Dorado et al. (2019), which underlies the Super Res Zoom feature in Google’s Pixel smartphones.

## 10.3.2 Lens blur (bokeh)

The ability to create a shallow depth-of-field photograph using a large aperture (Section 2.2.3) has always been one of the advantages of large-format, e.g., single lens reflex (SLR), cameras. The desire to artificially simulate refocusable, shallow depth-of-field cameras was one of the driving impetuses behind computational photography (Levoy 2006) and led to the development of lightfield cameras (Ng, Levoy et al. 2005), which we discuss in Section 14.3.4. Although some commercial models, such as the Lytro, were produced, the ability to create such images with smartphone cameras has only recently become widespread.<sup>23</sup>

The Apple iPhone 7 Plus with its dual (wide/telephoto) lens was the first smartphone to introduce this feature, which they called the Portrait mode. Although the technical details behind this feature have never been published, the algorithm that estimates the depth image (which can be read out of the metadata in the portrait images) probably uses some combi nation of stereo matching and deep learning. A little later, Google released its own Portrait Mode, which uses the dual pixels, originally designed for focusing the camera optics, along with person segmentation to compute a depth map, as described in the paper by Wadhwa, Garg et al. (2018). Once the depth map has been estimated, a fast approximation to a backto-front blurred over compositing operator is used to correctly blur the background without including foreground colors. More recently Garg, Wadhwa et al. (2019) have improved the quality of the depth estimation using a deep network, and also used two lenses (along with dual pixels) to produce even higher-quality depth maps (Zhang, Wadhwa et al. 2020).

![Figure 10.38](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/d96008020a5372acdc48c49fd9288fd9659a341adbeb227c3fff5bba3c427748.jpg)  
Figure 10.38 Hand-held multi-frame super-resolution (Wronski, Garcia-Dorado et al. 2019) © 2019 ACM. Processing pipeline, showing: (a) the captured burst of raw (Bayer CFA) images; (b) local gradients used to compute oriented kernels (c); (d) motion estimates, combined with local statistics (e) to compute blend weights (f). Results from (i) the previous method of Hasinoff, Sharlet et al. (2016) and (j) Wronski, Garcia-Dorado et al. (2019).

One final word on bokeh, which is the term photographers use to describe the shape of the glints or highlights that appear in an image. This shape is determined by the configuration of the aperture blades that control how much light enters the lens (on larger-format cameras). Traditionally, these were made with straight metal leaves, which resulted in polygonal apertures, but they were then mostly replaced by curved leaves to produce a more circular shape. When using computational photography, we can use whatever shape is pleasing to the photographer, but preferably not a Gaussian blur, which does not correspond to any real aperture and produces indistinct highlights. The paper by Wadhwa, Garg et al. (2018) uses a circular bokeh for their depth-of-field effect and a more recent version performs the computations in the HDR (radiance) space to produce more accurate highlights.<sup>24</sup>

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/c03e4ada9b3fb919e838fe2ca214504f9703746d54cc2a551db407a051269a6b.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/9c3e1e9d5834c1aa21e9452856b8c35dcf80b8d7f5561912ecb3126034dd31f3.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/deddcd9f723eafe8f42f87dbb680fb692aa0f358bd24a37a1a183ed8650eb72d.jpg)  
(c)  
Figure 10.39 Softening a hard segmentation boundary (border matting) (Rother, Kolmogorov, and Blake 2004) © 2004 ACM: (a) the region surrounding a segmentation boundary where pixels of mixed foreground and background colors are visible; (b) pixel values along the boundary are used to compute a soft alpha matte; (c) at each point along the curve t, a displacement $\Delta$ and a width σ are estimated.

## 10.4 Image matting and compositing

Image matting and compositing is the process of cutting a foreground object out of one image and pasting it against a new background (Smith and Blinn 1996; Wang and Cohen 2009). It is commonly used in television and film production to composite a live actor in front of computer-generated imagery such as weather maps or 3D virtual characters and scenery (Wright 2006; Brinkmann 2008), and it has recently become a popular feature in video conferencing systems.

We have already seen a number of tools for interactively segmenting objects in an image, including snakes (Section 7.3.1), scissors (Section 7.3.1), and GrabCut segmentation (Section 4.3.2). While these techniques can generate reasonable pixel-accurate segmentations, they fail to capture the subtle interplay of foreground and background colors at mixed pixels along the boundary (Szeliski and Golland 1999) (Figure 10.39a).

To successfully copy a foreground object from one image to another without visible discretization artifacts, we need to pull a matte, i.e., to estimate a soft opacity channel α and the uncontaminated foreground colors F from the input composite image C. Recall from Section 3.1.3 (Figure 3.4) that the compositing equation (3.8) can be written as

$$
C =(1 - \alpha) B + \alpha F.\tag{10.29}
$$

This operator attenuates the influence of the background image B by a factor $(1 - \alpha)$ and then adds in the (partial) color values corresponding to the foreground element F .

While the compositing operation is easy to implement, the reverse matting operation of estimating F , α, and B given an input image C is much more challenging (Figure 10.40). To see why, observe that while the composite pixel color C provides three measurements, the F , α, and B unknowns have a total of seven degrees of freedom. Devising techniques to estimate these unknowns despite the underconstrained nature of the problem is the essence of image matting.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/48d6254b4cb085e83ec20c6f1b3e3c6911d83b459e05b27f09e2e9bdc5fd7fa7.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/1839f1beb7ac376ec938815854227b88db0f61fd19572ec3ab6db21b701161d9.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/2b59902ec4d5d89b200e8e74faeb866fa9aeca984d028d17fe13aadf96c35e48.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/051b6985f72615845469ec412420d2a1a46189601bb81f2f3df138b029c51cf2.jpg)  
(d)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/d3d5c4a96a791812626bea82befc5897685a5b256b4829523e2cde6cadf09da3.jpg)  
(e)  
Figure 10.40 Natural image matting (Chuang, Curless et al. 2001) © 2001 IEEE: (a) input image with a “natural” (non-constant) background; (b) hand-drawn trimap—gray indicates unknown regions; (c) extracted alpha map; (d) extracted (premultiplied) foreground colors; (e) composite over a new background.

In this section, we review a number of image matting techniques. We begin with blue screen matting, which assumes that the background is a constant known color, and discuss its variants, two-screen matting (when multiple backgrounds can be used) and difference matting (where the known background is arbitrary). We then discuss local variants of natural image matting, where both the foreground and background are unknown. In these applications, it is usual to first specify a trimap, i.e., a three-way labeling of the image into foreground, background, and unknown regions (Figure 10.40b). Next, we present some global optimization approaches to natural image matting. Finally, we discuss variants on the matting problem, including shadow matting, flash matting, and environment matting.

## 10.4.1 Blue screen matting

Blue screen matting involves filming an actor (or object) in front of a constant colored background. While originally bright blue was the preferred color, bright green is now more commonly used (Wright 2006; Brinkmann 2008). Smith and Blinn (1996) discuss a number of techniques for blue screen matting, which are mostly described in patents rather than in the open research literature. Early techniques used linear combinations of object color channels with user-tuned parameters to estimate the opacity α.

Chuang, Curless et al. (2001) describe a newer technique called Mishima’s algorithm, which involves fitting two polyhedral surfaces (centered at the mean background color), separating the foreground and background color distributions, and then measuring the relative distance of a novel color to these surfaces to estimate α (Figure 10.41e). While this technique works well in many studio settings, it can still suffer from blue spill, where translucent pixels around the edges of an object acquire some of the background blue coloration.

Two-screen matting. In their paper, Smith and Blinn (1996) also introduce an algorithm called triangulation matting that uses more than one known background color to over-constrain the equations required to estimate the opacity α and foreground color F .

For example, consider in the compositing equation (10.29) setting the background color to black, i.e., B = 0. The resulting composite image C is therefore equal to αF . Replacing the background color with a different known non-zero value B now results in

$$
C - \alpha F =(1 - \alpha) B,\tag{10.30}
$$

which is an overconstrained set of (color) equations for estimating α. In practice, B should be chosen so as not to saturate C and, for best accuracy, several values of B should be used. It is also important that colors be linearized before processing, which is the case for all image matting algorithms. Papers that generate ground truth alpha mattes for evaluation purposes normally use these techniques to obtain accurate matte estimates (Chuang, Curless et al. 2001; Wang and Cohen 2007a; Levin, Acha, and Lischinski 2008; Rhemann, Rother et al. 2008, 2009).<sup>25</sup> Exercise 10.8 has you do this as well.

Difference matting. A related approach when the background is irregular but known is called difference matting (Wright 2006; Brinkmann 2008). It is most commonly used when the actor or object is filmed against a static background, e.g., for office video conferencing, person tracking applications (Toyama, Krumm et al. 1999), or to produce silhouettes for volumetric 3D reconstruction techniques (Section 12.7.3) (Szeliski 1993; Seitz and Dyer 1997; Seitz, Curless et al. 2006). It can also be used with a panning camera where the background is composited from frames where the foreground has been removed using a garbage matte (Section 10.4.5) (Chuang, Agarwala et al. 2002). Another application is the detection of visual continuity errors in films, i.e., differences in the background when a shot is re-taken at a later time (Pickup and Zisserman 2009).

In the case where the foreground and background motions can both be specified with parametric transforms, high-quality mattes can be extracted using a generalization of triangulation matting (Wexler, Fitzgibbon, and Zisserman 2002). When frames need to be processed independently, however, the results are often of poor quality (Figure 10.42). In such cases, using a pair of stereo cameras as input can dramatically improve the quality of the results (Criminisi, Cross et al. 2006; Yin, Criminisi et al. 2007).

## 10.4.2 Natural image matting

The most general version of image matting is when nothing is known about the background except, perhaps, for a rough segmentation of the scene into foreground, background, and unknown regions, which is known as the trimap (Figure 10.40b). Some techniques, however, relax this requirement and allow the user to just draw a few strokes or scribbles in the image: see Figures 10.45 and 10.46 (Wang and Cohen 2005; Wang, Agrawala, and Cohen 2007; Levin, Lischinski, and Weiss 2008; Rhemann, Rother et al. 2008; Rhemann, Rother, and Gelautz 2008). Fully automated single image matting results have also been reported (Levin, Acha, and Lischinski 2008; Singaraju, Rother, and Rhemann 2009). The survey paper by Wang and Cohen (2009) has detailed descriptions and comparisons of all of these techniques, a selection of which are described briefly below, while the website http://alphamatting.com has up-to-date lists and numerical comparisons of the most recent algorithms.

A relatively simple algorithm for performing natural image matting is Knockout, as described by Chuang, Curless et al. (2001) and illustrated in Figure 10.41f. In this algorithm, the nearest known foreground and background pixels (in image space) are determined and then blended with neighboring known pixels to produce a per-pixel foreground F and background B color estimate. The background color is then adjusted so that the measured color C lies on the line between F and B. Finally, opacity α is estimated on a per-channel basis, and the three estimates are combined based on per-channel color differences. (This is an approximation to the least squares solution for α.) Figure 10.42 shows that Knockout has problems when the background consists of more than one dominant local color.

More accurate matting results can be obtained if we treat the foreground and background colors as distributions sampled over some region (Figure 10.41g–h). Ruzon and Tomasi (2000) model local color distributions as mixtures of (uncorrelated) Gaussians and compute these models in strips. They then find the pairing of mixture components F and B that best describes the observed color C, compute the α as the relative distance between these means, and adjust the estimates of F and B so that they are collinear with C.

![Figure 10.41](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/b33fd679df708e072a789becacf0e486005d5fff43c94c24337e0a170225e00d.jpg)  
Figure 10.41 Image matting algorithms (Chuang, Curless et al. 2001) © 2001 IEEE. Mishima’s algorithm models global foreground and background color distribution as polyhedral surfaces centered around the mean background (blue) color. Knockout uses a local color estimate of foreground and background for each pixel and computes α along each color axis. Ruzon and Tomasi’s algorithm locally models foreground and background colors and variances. Chuang et al.’s Bayesian matting approach computes a MAP estimate of (fractional) foreground color and opacity given the local foreground and background distributions.

Chuang, Curless et al. (2001) and Hillman, Hannah, and Renshaw (2001) use full $3 \times 3$ color covariance matrices to model mixtures of correlated Gaussians, and compute estimates independently for each pixel. Matte extraction proceeds in strips starting from known color values growing into the unknown regions, so that recently computed F and B colors can be used in later stages.

To estimate the most likely value of an unknown pixel’s opacity and (unmixed) foreground and background colors, Chuang et al. use a fully Bayesian formulation that maximizes

$$
P(F, B, \alpha | C) = P(C | F, B, \alpha) P(F) P(B) P(\alpha) / P(C).\tag{10.31}
$$

This is equivalent to minimizing the negative log likelihood

$$
L(F, B, \alpha | C) = L(C | F, B, \alpha) + L(F) + L(B) + L(\alpha)\tag{10.32}
$$

(dropping the $L(C)$ term because it is constant).

Let us examine each of these terms in turn. The first, $L(C | F, B, \alpha)$ , is the likelihood that pixel color $C$ was observed given values for the unknowns $(F, B, \alpha)$ . If we assume Gaussian

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/346a512c2fb24f985da75ff7b7b3d86e2d4c18e51adb75cae718a992f1b8d6c5.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/f6dcbd2e29781ad8e5a72c6cf7ade8bc578a259055a8e5a19401f44cdbe05a45.jpg)

![Figure 10.42](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/ee3281a449f3fcfcbd5d693664b2e3eb086431d0d4cd8e1d7e5a0bc066d1ef9a.jpg)  
Figure 10.42 Natural image matting results (Chuang, Curless et al. 2001) © 2001 IEEE. Difference matting and Knockout both perform poorly on this kind of background, while the newer natural image matting techniques perform well. Chuang et al.’s results are slightly smoother and closer to the ground truth.

noise in our observation with variance $\sigma_{C}^{2}$ , this negative log likelihood (data term) is

$$
L(C) = 1 / 2 \| C -[\alpha F +(1 - \alpha) B] \|^{2} / \sigma_{C}^{2},\tag{10.33}
$$

as illustrated in Figure 10.41h.

The second term, $L(F)$ , corresponds to the likelihood that a particular foreground color F comes from the Gaussian mixture model. After partitioning the sample foreground colors into clusters, a weighted mean $\overline{F}$ and covariance $\Sigma_{F}$ are computed, where the weights are proportional to a given foreground pixel’s opacity and distance from the unknown pixel.<sup>26</sup> The negative log likelihood for each cluster is thus given by

$$
L(F) =(F - \overline{{F}})^{T} \Sigma_{F}^{- 1}(F - \overline{{F}}).\tag{10.34}
$$

A similar method is used to estimate unknown background color distributions. If the background is already known, i.e., for blue screen or difference matting applications, its measured color value and variance are used instead.

An alternative to modeling the foreground and background color distributions as mixtures of Gaussians is to keep around the original color samples and to compute the most likely pairings that explain the observed color C (Wang and Cohen 2005, 2007a). These techniques are described in more detail in (Wang and Cohen 2009).

In their Bayesian matting paper, Chuang, Curless et al. (2001) assume a constant (noninformative) distribution for $L(\alpha)$ . Follow-on papers assume this distribution to be more peaked around 0 and 1, or sometimes use Markov random fields (MRFs) to define a global correlated prior on $P(\alpha)$ (Wang and Cohen 2009).

To compute the most likely estimates for $(F, B, \alpha)$ , the Bayesian matting algorithm alternates between computing $(F, B)$ and $\alpha,$ as each of these problems is quadratic and hence can be solved as a small linear system. When several color clusters are estimated, the most likely pairing of foreground and background color clusters is used.

Bayesian image matting produces results that improve on the original natural image matting algorithm by Ruzon and Tomasi (2000), as can be seen in Figure 10.42. However, compared to later techniques (Wang and Cohen 2009), its performance is not as good for complex backgrounds or inaccurate trimaps (Figure 10.44).

## 10.4.3 Optimization-based matting

An alternative to estimating each pixel’s opacity and foreground color independently is to use global optimization to compute a matte that takes into account correlations between neighboring α values. Two examples of this are border matting in the GrabCut interactive segmentation system (Rother, Kolmogorov, and Blake 2004) and Poisson Matting (Sun, Jia et al. 2004).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/a9b8bddaa256c7ab705384dc963f103d463230ca52a75e823765d485455a8015.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/3c36a52f5af32077b829c403e7318ec8155336f002859de8b77ab6a0a2ba5335.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/aedff038ccf275f7a290008795fc65b943f57f2ca8dcbda740a3a0ad92717c4d.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/a1a2b277513806052a5137930e080f2e592e6cbd98df0dcdd04ac08551666b92.jpg)  
(d)  
Figure 10.43 Color line matting (Levin, Lischinski, and Weiss 2008): (a) local $3 \times 3$ patch of colors; (b) potential assignment of α values; (c) foreground and background color lines, the vector ${\bf a}_{k}$ joining their closest points of intersection, and the family of parallel planes of constant α values, $\alpha_{i} ={\bf a}_{k} \cdot \left({\bf C}_{i} -{\bf B}_{0} \right)$ ; (d) a scatter plot of sample colors and the deviations from the mean $\mu_{k}$ for two sample colors $\mathbf{C}_{i}$ and $\mathbf{C}_{j}$ .

Border matting first dilates the region around the binary segmentation produced by Grab-Cut (Section 4.3.2) and then solves for a sub-pixel boundary location $\Delta$ and a blur width σ for every point along the boundary (Figure 10.39). Smoothness in these parameters along the boundary is enforced using regularization and the optimization is performed using dynamic programming. While this technique can obtain good results for smooth boundaries, such as a person’s face, it has difficulty with fine details, such as hair.

Poisson matting (Sun, Jia et al. 2004) assumes a known foreground and background color for each pixel in the trimap (as with Bayesian matting). However, instead of independently estimating each α value, it assumes that the gradient of the alpha matte and the gradient of the color image are related by

$$
\nabla \alpha = \frac{F - B}{\| F - B \|^{2}} \cdot \nabla C,\tag{10.35}
$$

which can be derived by taking gradients of both sides of (10.29) and assuming that the foreground and background vary slowly. The per-pixel gradient estimates are then integrated into a continuous α(x) field using the regularization (least squares) technique first described in Section 4.2 (4.24) and subsequently used in Poisson blending (Section 8.4.4, Equation (8.75)) and gradient-based dynamic range compression mapping (Section 10.2.1, Equation (10.18)). This technique works well when good foreground and background color estimates are available and these colors vary slowly.

Instead of computing per-pixel foreground and background colors, Levin, Lischinski, and Weiss (2008) assume only that these color distributions can locally be well approximated as mixtures of two colors, which is known as the color line model (Figure 10.43a–c). Under this assumption, a closed-form estimate for α at each pixel i in a (say, $3 \times 3)$ window $W_{k}$ is given by

$$
\alpha_{i} ={\bf a}_{k} \cdot({\bf C}_{i} -{\bf B}_{0}) ={\bf a}_{k} \cdot{\bf C} + b_{k},\tag{10.36}
$$

where $\mathbf{C}_{i}$ is the pixel color treated as a three-vector, $\mathbf{B}_{0}$ is any pixel along the background color line, and ${\bf a}_{k}$ is the vector joining the two closest points on the foreground and background color lines, as shown in Figure 10.43c. (Note that the geometric derivation shown in this figure is an alternative to the algebraic derivation presented by Levin, Lischinski, and Weiss (2008).) Minimizing the deviations of the alpha values $\alpha_{i}$ from their respective color line models (10.36) over all overlapping windows $W_{k}$ in the image gives rise to the cost

$$
E_{\alpha} = \sum_{k} \left(\sum_{i \in W_{k}}(\alpha_{i} - \mathbf{a}_{k} \cdot \mathbf{C}_{i} - b_{k})^{2} + \epsilon \| \mathbf{a}_{k} \| \right),\tag{10.37}
$$

where the $\epsilon$ term is used to regularize the value of ${\bf a}_{k}$ in the case where the two color distributions overlap (i.e., in constant α regions).

Because this formula is quadratic in the unknowns $\left\{\left(\mathbf{a}_{k}, b_{k} \right) \right\}$ , they can be eliminated inside each window $W_{k}$ , leading to a final energy

$$
E_{\alpha} = \alpha^{T} \mathbf{L} \alpha,\tag{10.38}
$$

where the entries in the L matrix are given by

$$
L_{ij} = \sum_{k : i \in W_{k} \wedge j \in W_{k}} \left(\delta_{ij} - \frac{1}{M} \left(1 +(\mathbf{C}_{i} - \boldsymbol{\mu}_{k})^{T} \hat{\Sigma}_{k}^{- 1}(\mathbf{C}_{j} - \boldsymbol{\mu}_{k}) \right) \right),\tag{10.39}
$$

where $M = | W_{k} |$ is the number of pixels in each (overlapping) window, $\mu_{k}$ is the mean color of the pixels in window $W_{k}$ , and $\hat{\Sigma}_{k}$ is the $3 \times 3$ covariance of the pixel colors plus $\epsilon / M \mathbf{I}$

Figure 10.43d shows the intuition behind the entries in this affinity matrix, which is called the matting Laplacian. Note how when two pixels $\mathbf{C}_{i}$ and $\mathbf{C}_{j}$ in $W_{k}$ point in opposite directions away from the mean $\mu_{k}$ , their weighted dot product is close to 1, and so their affinity becomes close to 0. Pixels close to each other in color space (and hence with similar expected α values) will have affinities close to $- 2 / M$

Minimizing the quadratic energy (10.38) constrained by the known values of $\alpha = \{0, 1\}$ at scribbles only requires the solution of a sparse set of linear equations, which is why the authors call their technique a closed-form solution to natural image matting. Once α has been computed, the foreground and background colors are estimated using a least squares minimization of the compositing equation (10.29) regularized with a spatially varying firstorder smoothness,

![Figure 10.44](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/36c4667205a573fab27ffa4fdb028ef890b1b816bf0fe4528e7b8300765204e6.jpg)

Figure 10.44 Comparative matting results for a medium accuracy trimap. Wang and Cohen (2009) describe the individual techniques being compared.  
![Figure 10.45](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/3c61d8de20a05db48edcb2a53d891ee76366275aeec4a540a78412bf07c4cff7.jpg)  
Figure 10.45 Comparative matting results with scribble-based inputs. Wang and Cohen (2009) describe the individual techniques being compared.

$$
E = \sum_{i} | | C_{i} -[\alpha + F_{i} +(1 - \alpha_{i}) B_{i}] | |^{2} + \lambda | \nabla \alpha_{i} |(\| \nabla F_{i} \|^{2} + \| \nabla B_{i} \|^{2}),\tag{10.40}
$$

where the $| \nabla \alpha_{i} |$ weight is applied separately for the x and y components of the F and B derivatives (Levin, Lischinski, and Weiss 2008).

Laplacian (closed-form) matting is just one of many optimization-based techniques surveyed and compared by Wang and Cohen (2009). Some of these techniques use alternative formulations for the affinities or smoothness terms on the α matte, alternative estimation techniques such as belief propagation, or alternative representations (e.g., local histograms) for modeling local foreground and background color distributions (Wang and Cohen 2005, 2007a,b). Some of these techniques also provide real-time results as the user draws a contour line or sparse set of scribbles (Wang, Agrawala, and Cohen 2007; Rhemann, Rother et al. 2008) or even pre-segment the image into a small number of mattes that the user can select with simple clicks (Levin, Acha, and Lischinski 2008).

![Figure 10.46](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/1e1f72e2877d72e1ce823aa5dd703b041d56bdb8c12f0e440549752265baebd3.jpg)  
Figure 10.46 Stroke-based segmentation result (Rhemann, Rother et al. 2008) © 2008 IEEE.

Figure 10.44 shows the results of running a number of the surveyed algorithms on a region of toy animal fur where a trimap has been specified, while Figure 10.45 shows results for techniques that can produce mattes with only a few scribbles as input. Figure 10.46 shows a result for an even more recent algorithm (Rhemann, Rother et al. 2008) that claims to outperform all of the techniques surveyed by Wang and Cohen (2009).

The latest results on natural image matting can be found on the http://alphamatting.com website created by Rhemann, Rother et al. (2009). It currently lists over 60 different algorithms, with most of the more recent algorithms using deep neural networks. The Deep Image Matting paper by Xu, Price et al. (2017) provides a larger database of 49,300 training images and 1,000 test images constructed by overlaying manually created color foreground mattes over a variety of backgrounds.<sup>27</sup>

Pasting. Once a matte has been pulled from an image, it is usually composited directly over the new background, unless the seams between the cutout and background regions are to be hidden, in which case Poisson blending (Perez, Gangnet, and Blake´ 2003) can be used (Section 8.4.4).

In the latter case, it is helpful if the matte boundary passes through regions that either have little texture or look similar in the old and new images. Papers by Jia, Sun et al. (2006) and Wang and Cohen (2007b) explain how to do this.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/330be508a1fea0405f7b892ac03dd3e180e2982ede502d1979df03833c3965b8.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/d9a8c60eeb6152add848b2fed0eab85231efeeedd6a504c9bfbf8760ac61bcf5.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/61987557fc38c2137afffb73d419615af39b79a0ac4a18c5e982051c2901bbf9.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/6e1252b9b009927bda524cdfb98e7da65866378627c027da3011ad553b4cfbc9.jpg)  
(d)  
Figure 10.47 Smoke matting (Chuang, Agarwala et al. 2002) © 2002 ACM: (a) input video frame; (b) after removing the foreground object; (c) estimated alpha matte; (d) insertion of new objects into the background.

## 10.4.4 Smoke, shadow, and flash matting

In addition to matting out solid objects with fractional boundaries, it is also possible to matte out translucent media such as smoke (Chuang, Agarwala et al. 2002). Starting with a video sequence, each pixel is modeled as a linear combination of its (unknown) background color and a constant foreground (smoke) color that is common to all pixels. Voting in color space is used to estimate this foreground color and the distance along each color line is used to estimate the per-pixel temporally varying alpha (Figure 10.47).

Extracting and re-inserting shadows is also possible using a related technique (Chuang, Goldman et al. 2003; Wang, Curless, and Seitz 2020). Here, instead of assuming a constant foreground color, each pixel is assumed to vary between its fully lit and fully shadowed colors, which can be estimated by taking (robust) minimum and maximum values over time as a shadow passes over the scene (Exercise 10.9). The resulting fractional shadow matte can be used to re-project the shadow into a new scene. If the destination scene has a non-planar geometry, it can be scanned by waving a straight stick shadow across the scene. The new shadow matte can then be warped with the computed deformation field to have it drape correctly over the new scene (Figure 10.48). Shadows can also be extracted from video streams by extending video object segmentation algorithms (Section 9.4.3) to include shadows and other effects such as smoke (Lu, Cole et al. 2021). An example of useful shadow manipulation in photographs is the removal or softening of harsh shadows in people’s portraits (Sun, Barron et al. 2019; Zhou, Hadap et al. 2019; Zhang, Barron et al. 2020), which is available as the Portrait Light feature in Google Photos.<sup>28</sup>

The quality and reliability of matting algorithms can also be enhanced using more sophisticated acquisition systems. For example, taking a flash and non-flash image pair supports the reliable extraction of foreground mattes, which show up as regions of large illumination change between the two images (Sun, Li et al. 2006). Taking simultaneous video streams focused at different distances (McGuire, Matusik et al. 2005) or using multi-camera arrays (Joshi, Matusik, and Avidan 2006) are also good approaches to producing high-quality mattes. These techniques are described in more detail in (Wang and Cohen 2009).

![Figure 10.48](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/93334ecaef31df97903bd4f2ce2404496bd6708d43fdd26226f363b1f1e45aa5.jpg)  
Figure 10.48 Shadow matting (Chuang, Goldman et al. 2003) © 2003 ACM. Instead of simply darkening the new scene with the shadow (c), shadow matting correctly dims the lit scene with the new shadow and drapes the shadow over 3D geometry (d).

Lastly, photographing a refractive object in front of a number of patterned backgrounds allows the object to be placed in novel 3D environments. These environment matting techniques (Zongker, Werner et al. 1999; Chuang, Zongker et al. 2000) are discussed in Section 14.4.

## 10.4.5 Video matting

While regular single-frame matting techniques such as blue or green screen matting (Smith and Blinn 1996; Wright 2006; Brinkmann 2008) can be applied to video sequences, the presence of moving objects can sometimes make the matting process easier, as portions of the background may get revealed in preceding or subsequent frames.

Chuang, Agarwala et al. (2002) describe a nice approach to this video matting problem, where foreground objects are first removed using a conservative garbage matte and the resulting background plates are aligned and composited to yield a high-quality background estimate. They also describe how trimaps drawn at sparse keyframes can be interpolated to in-between frames using bi-direction optical flow. Alternative approaches to video matting, such as rotoscoping, which involves drawing curves or strokes in video sequence keyframes (Agarwala, Hertzmann et al. 2004; Wang, Bhat et al. 2005), are discussed in the matting survey paper by Wang and Cohen (2009). There is also a newer dataset of carefully matted stop-motion animation videos created by Erofeev, Gitman et al. (2015).<sup>29</sup>

Since the original development of video matting techniques, improved algorithms have been developed for both interactive and fully automated video object segmentation, as discussed in Section 9.4.3. The paper by Sengupta, Jayaram et al. (2020) uses deep learning and adversarial loss, as well as a motion prior, to provide high-quality mattes from small-motion handheld videos where a clean plate of the background has also been captured. Wang, Curless, and Seitz (2020) describe a system where shadows and occlusions can be determined by observing people walking around a scene, enabling the insertion of new people at correct scales and lighting. In follow-up work Lin, Ryabtsev et al. (2021) describe a high-resolution real-time video matting system along with two new video and image matting datasets. Finally, Lu, Cole et al. (2021) describe how to extract shadows, reflections, and other effects associated with objects being tracked and segmented in videos.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/aa77b38113a072d2d0a36e1e4a6feccec2857b1bad65cb71bb308bebf67162c3.jpg)  
radishes

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/5b8a78fbcd316172a0f6fa78825c251222de1fc477bfdb40262197d365b5bb34.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/8e1a0ef7cd01e0d899d0c532f184e3adb468ed2039e20650789366c908f0e706.jpg)

(b)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/bd4571caa588530f99c85c1a980a5d41e909563187be98ab96aefa137a20c508.jpg)  
yogurt  
(a)  
(c)  
Figure 10.49 Texture synthesis: (a) given a small patch of texture, the task is to synthesize (b) a similar-looking larger patch; (c) other semi-structured textures that are challenging to synthesize. (Images courtesy of Alyosha Efros.)

## 10.5 Texture analysis and synthesis

While texture analysis and synthesis may not at first seem like computational photography techniques, they are, in fact, widely used to repair defects, such as small holes, in images or to create non-photorealistic painterly renderings from regular photographs.

The problem of texture synthesis can be formulated as follows: given a small sample of a “texture” (Figure 10.49a), generate a larger similar-looking image (Figure 10.49b). As you can imagine, for certain sample textures, this problem can be quite challenging.

Traditional approaches to texture analysis and synthesis try to match the spectrum of the source image while generating shaped noise. Matching the frequency characteristics, which is equivalent to matching spatial correlations, is in itself not sufficient. The distributions of the responses at different frequencies must also match. Heeger and Bergen (1995) develop an algorithm that alternates between matching the histograms of multi-scale (steerable pyramid) responses and matching the final image histogram. Portilla and Simoncelli (2000) improve on this technique by also matching pairwise statistics across scale and orientations. De Bonet (1997) uses a coarse-to-fine strategy to find locations in the source texture with a similar parent structure, i.e., similar multi-scale oriented filter responses, and then randomly chooses one of these matching locations as the current sample value. Gatys, Ecker, and Bethge (2015) also use a pyramidal fine-to-coarse-to-fine algorithm, but using deep networks trained for object recognition. At each level in the deep network, they gather correlation statistics between various features. During generation, they iteratively update the random image until these more perceptually motivated statistic (Zhang, Isola et al. 2018) are matched. We give more details on this and other neural approaches to texture synthesis, such as Shaham, Dekel, and Michaeli (2019), in Section 10.5.3 on neural style transfer.

Exemplar-based texture synthesis algorithms sequentially generate texture pixels by looking for neighborhoods in the source texture that are similar to the currently synthesized image (Efros and Leung 1999). Consider the (as yet) unknown pixel p in the partially constructed texture on the left side of Figure 10.50. As some of its neighboring pixels have been already been synthesized, we can look for similar partial neighborhoods in the sample texture image on the right and randomly select one of these as the new value of p. This process can be repeated down the new image either in a raster fashion or by scanning around the periphery (“onion peeling”) when filling holes, as discussed in (Section 10.5.1). In their actual implementation, Efros and Leung (1999) find the most similar neighborhood and then include all other neighborhoods within a d = (1+ $\epsilon$) distance, with $\epsilon$ = 0.1. They also optionally weight the random pixel selections by the similarity metric d.

To accelerate this process and improve its visual quality, Wei and Levoy (2000) extend this technique using a coarse-to-fine generation process, where coarser levels of the pyramid, which have already been synthesized, are also considered during the matching (De Bonet 1997). To accelerate the nearest neighbor finding, tree-structured vector quantization is used. A much faster version of such nearest neighbor search is the widely used randomized Patch-Match iterative update algorithm developed by Barnes, Shechtman et al. (2009).

Efros and Freeman (2001) propose an alternative acceleration and visual quality improvement technique. Instead of synthesizing a single pixel at a time, overlapping square blocks are selected using similarity with previously synthesized regions (Figure 10.51). Once the appropriate blocks have been selected, the seam between newly overlapping blocks is determined using dynamic programming. (Full graph cut seam selection is not required, because only one seam location per row is needed for a vertical boundary.) Because this process involves selecting small patches and them stitching them together, Efros and Freeman (2001) call their system image quilting. Komodakis and Tziritas (2007) present an MRF-based version of this block synthesis algorithm that uses a new, efficient version of loopy belief propagation they call “Priority-BP”. Wei, Lefebvre et al. (2009) present a comprehensive survey of work in exemplar-based texture synthesis through 2009.

![Figure 10.50](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/22605b6155fcaf54bb561fefcf9e48f31fa4415639ace12e540e4ed94c37335b.jpg)

Figure 10.50 Texture synthesis using non-parametric sampling (Efros and Leung 1999). The value of the newest pixel p is randomly chosen from similar local (partial) patches in the source texture (input image). (Figure courtesy of Alyosha Efros.)  
![Figure 10.51](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/301a1989ba52e5239b352febba45963d5eb67341dd96b2d7878e89875566566b.jpg)  
Figure 10.51 Texture synthesis by image quilting (Efros and Freeman 2001). Instead of generating a single pixel at a time, larger blocks are copied from the source texture. The transitions in the overlap regions between the selected blocks are then optimized using dynamic programming. (Figure courtesy of Alyosha Efros.)

## 10.5.1 Application: Hole filling and inpainting

Filling holes left behind when objects or defects are excised from photographs, which is known as inpainting, is one of the most common applications of texture synthesis. Such techniques are used not only to remove unwanted people or interlopers from photographs (King 1997) but also to fix small defects in old photos and movies (scratch removal) or to remove wires holding props or actors in mid-air during filming (wire removal). Bertalmio, Sapiro et al. (2000) solve the problem by propagating pixel values along isophote (constantvalue) directions interleaved with some anisotropic diffusion steps (Figure 10.52a–b). Telea (2004) develops a faster technique that uses the fast marching method from level sets (Section 7.3.2). However, these techniques will not hallucinate texture in the missing regions. Bertalmio, Vese et al. (2003) augment their earlier technique by adding synthetic texture to the infilled regions.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/2fbf71584045c16528bc6d2bf8ef1dfc46a3b54913a255ce784c42f0e7c919a2.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/6120d5771d2ffb05e79bdc3bcc49a9ad1a41467cd0554aa891f8d21de9274818.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/dc0a8692f59425a3d9b22093d0648611e5e10687f52f48b6f0ea4825d2d26335.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/084e6b41c6b42bafe8a78d44b56bd5bad5a36e67eccabefef759b29770f6a01b.jpg)  
(d)  
Figure 10.52 Image inpainting (hole filling): (a–b) propagation along isophote directions (Bertalmio, Sapiro et al. 2000) © 2000 ACM; (c–d) exemplar-based inpainting with confidence-based filling order (Criminisi, Perez, and Toyama´ 2004).

The example-based (non-parametric) texture generation techniques discussed in the previous section can also be used by filling the holes from the outside in (the “onion-peel” ordering). However, this approach may fail to propagate strong oriented structures. Criminisi, Perez, and Toyama ´ (2004) use exemplar-based texture synthesis where the order of synthesis is determined by the strength of the gradient along the region boundary (Figures 10.1d and 10.52c–d). Sun, Yuan et al. (2004) present a related approach where the user draws interactive lines to indicate where structures should be preferentially propagated. Additional techniques related to these approaches include those developed by Drori, Cohen-Or, and Yeshurun (2003), Kwatra, Schodl¨ et al. (2003), Kwatra, Essa et al. (2005), Wilczkowiak, Brostow et al. (2005), Komodakis and Tziritas (2007), and Wexler, Shechtman, and Irani (2007).

Most hole filling algorithms borrow small pieces of the original image to fill in the holes. When a large database of source images is available, e.g., when images are taken from a photo sharing site or the internet, it is sometimes possible to copy a single contiguous image region to fill the hole. Hays and Efros (2007) present such a technique, which uses image context and boundary compatibility to select the source image, which is then blended with the original (holey) image using graph cuts and Poisson blending. This technique is discussed in more detail in Section 6.4.4 and Figure 6.40.

As with other areas of image processing, deep neural networks are used in all of the latest techniques (Yang, Lu et al. 2017; Yu, Lin et al. 2018; Liu, Reda et al. 2018; Zeng, Fu et al. 2019; Yu, Lin et al. 2019; Chang, Liu et al. 2019; Nazeri, Ng et al. 2019; Ren, Yu et al. 2019; Shih, Su et al. 2020; Yi, Tang et al. 2020). Some of these papers have introduced interesting new extensions to neural network architectures, such as partial convolutions (Liu, Reda et al. 2018) and partial convolutions (Yu, Lin et al. 2019), the propagation of edge structures (Nazeri, Ng et al. 2019; Ren, Yu et al. 2019), multi-resolution attention and residuals (Yi, Tang et al. 2020), and iterative confidence feedback (Zeng, Lin et al. 2020). Inpainting has also been applied to video sequences (e.g., Gao, Saraf et al. 2020). Results on recent challenges on image inpainting can be found in the AIM 2020 Workshop and Challenges on this topic (Ntavelis, Romero et al. 2020a).

## 10.5.2 Application: Non-photorealistic rendering

Two more applications of the exemplar-based texture synthesis ideas are texture transfer (Efros and Freeman 2001) and image analogies (Hertzmann, Jacobs et al. 2001), which are both examples of non-photorealistic rendering (Gooch and Gooch 2001).

In addition to using a source texture image, texture transfer also takes a reference (or target) image, and tries to match certain characteristics of the target image with the newly synthesized image. For example, the new image being rendered in Figure 10.53c not only tries to satisfy the usual similarity constraints with the source texture in Figure 10.53b, but it also tries to match the luminance characteristics of the reference image. Efros and Freeman (2001) mention that blurred image intensities or local image orientation angles are alternative quantities that could be matched.

Hertzmann, Jacobs et al. (2001) formulate the following problem:

Given a pair of images A and $A^{\prime}$ (the unfiltered and filtered source images, respectively), along with some additional unfiltered target image B, synthesize a new filtered target image $B^{\prime}$ such that

$$
A : A^{\prime} : : B : B^{\prime}.
$$

Instead of having the user program a certain non-photorealistic rendering effect, it is sufficient to supply the system with examples of before and after images, and let the system synthesize the novel image using exemplar-based synthesis, as shown in Figure 10.54.

The algorithm used to solve image analogies proceeds in a manner analogous to the texture synthesis algorithms of Efros and Leung (1999) and Wei and Levoy (2000). Once Gaussian pyramids have been computed for all of the source and reference images, the algorithm looks for neighborhoods in the source filtered pyramids generated from A0 that are similar to the partially constructed neighborhood in $B^{\prime}$ , while at the same time having similar multi-resolution appearances at corresponding locations in A and B. As with texture transfer, appearance characteristics can include not only (blurred) color or luminance values but also orientations.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/e3941c913dae2c9abd47f8d8a0eacee86041cbdc712ecc85ef10ae789dcd62bf.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/03b3a6aee1c07b8520d2ef5969c65bfd82df8aa39fc6e2eab6368621146832ba.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/79dace62f1965234403949e764b1beb96ae2cd05e0829167b3b6b2b5ad9cede3.jpg)  
(c)

Figure 10.53 Texture transfer (Efros and Freeman 2001) © 2001 ACM: (a) reference (target) image; (b) source texture; (c) image (partially) rendered using the texture.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/fbb984efd87d4c6b82afcf059ea1d1fba630508bcbbe301631d2255864b1139f.jpg)  
A

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/58382780328da42b1ec86c2f00275f2e088e8adbcbdac878a98fd771da05ec7d.jpg)  
A0

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/40904188684fc48ef976526fb74f2dcf4bc6850c26b06d67c0f063f2b2a5d6de.jpg)  
B

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/6f2dc70828bfe52b1c9d113102963adf112ee2c6f56c81c1c295f32d766c3227.jpg)  
B0  
Figure 10.54 Image analogies (Hertzmann, Jacobs et al. 2001) © 2001 ACM. Given an example pair of a source image A and its rendered (filtered) version A0, generate the rendered version B0 from another unfiltered source image B.

This general framework allows image analogies to be applied to a variety of rendering tasks. In addition to exemplar-based non-photorealistic rendering, image analogies can be used for traditional texture synthesis, super-resolution, and texture transfer (using the same textured image for both A and $A^{\prime})$ . If only the filtered (rendered) image $A^{\prime}$ is available, as is the case with paintings, the missing reference image A can be hallucinated using a smart (edge preserving) blur operator. Finally, it is possible to train a system to perform texture-bynumbers by manually painting over a natural image with pseudocolors corresponding to pixels’ semantic meanings, e.g., water, trees, and grass (Figure 10.55a–b). The resulting system can then convert a novel sketch into a fully rendered synthetic photograph (Figure 10.55c–d). In more recent work, Cheng, Vishwanathan, and Zhang (2008) add ideas from image quilting (Efros and Freeman 2001) and MRF inference (Komodakis, Tziritas, and Paragios 2008) to the basic image analogies algorithm, while Ramanarayanan and Bala (2007) recast this process as energy minimization, which means it can be viewed as a conditional random field (Section 4.3.1), and devise an efficient algorithm to find a good minimum.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/803bd60326c284fe771bb9f1d1325833d555f16699b05cebe4d5fd8351eafe41.jpg)  
Original A0

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/bae2ffba0d91fcab7ab9e098c0b699932a5bec7626e8ca3041f2d69db122e278.jpg)  
Painted A

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/b274c540f56e162cd5c5a33ccdc8ed71eb888e9ce29c4cd0735acfc39b4fc89b.jpg)  
Novel painted B

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/871320600e96b269d7cf3efcb4dc23a674f82cc48877ac63970828a61766ff38.jpg)  
Novel textured B0  
Figure 10.55 Texture-by-numbers (Hertzmann, Jacobs et al. 2001) © 2001 ACM. Given a textured image $A^{\prime}$ and a hand-labeled (painted) version A, synthesize a new image $B^{\prime}$ given just the painted version B.

More traditional filtering and feature detection techniques can also be used for nonphotorealistic rendering.<sup>30</sup> For example, pen-and-ink illustration (Winkenbach and Salesin 1994) and painterly rendering techniques (Litwinowicz 1997) use local color, intensity, and orientation estimates as an input to their procedural rendering algorithms. Techniques for stylizing and simplifying photographs and video (DeCarlo and Santella 2002; Winnemoller,¨ Olsen, and Gooch 2006; Farbman, Fattal et al. 2008), as in Figure 10.56, use combinations of edge-preserving blurring (Section 3.3.1) and edge detection and enhancement (Section 7.2.3).

## 10.5.3 Neural style transfer and semantic image synthesis

With the advent of deep learning, image-guided exemplar-based texture synthesis has mostly been replaced with statistics matching in deep networks (Gatys, Ecker, and Bethge 2015). Figure 10.57 illustrates the basic idea used in neural style transfer networks. In the original work of Gatys, Ecker, and Bethge (2016), a style image $y_{s}$ and a content image $y_{c}$ (see Figure 10.58 for examples) are input to a loss network, which compares features derived from the style and target images with those derived from the image $\hat{y}$ being synthesized. These losses are normally a combination of a perceptual loss. The gradients of these losses are used to adjust the generated image $\hat{y}$ in an iterative fashion, which makes this process

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/9603a2cbe2fd5537124ef09f8d305c0b60e2f39f384488a251df3b1c42e82417.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/bbc7d8fcf2ed1a4dff56b7d0a36df9692cb7af539e98f9d1433bda2d60acda6f.jpg)  
(b)  
Figure 10.56 Non-photorealistic abstraction of photographs: (a) (DeCarlo and Santella 2002) © 2002 ACM and (b) (Farbman, Fattal et al. 2008) © 2008 ACM.

![Figure 10.57](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/f38259aaefe07eec0556078494c1e0737abe70c0cf3e8ea9c2ef87ccaac4f342.jpg)  
Figure 10.57 Network architecture for neural style transfer, which learns to transform images in one particular style (Johnson, Alahi, and Fei-Fei 2016) © 2016 Springer. During training, the content target image $y_{c}$ is fed into the image transformation network as an input x, along with a style image $y_{s},$ and the network weights are updated so as to minimize the perceptual losses, i.e., the style reconstruction loss $l_{style}$ and the feature reconstruction loss $l_{feat}$ . The earlier network by Gatys, Ecker, and Bethge (2015) did not have an image transformation network, and instead used the losses to optimize the transformed image yˆ.

quite slow.

To accelerate this, Johnson, Alahi, and Fei-Fei (2016) train a feedforward image transformation network with a fixed style image and many different content targets, adjusting the network weights so that the stylized image $\hat{y}$ resulting from a target $y_{c}$ matches the desired statistics. When a new image x is presented to be stylized, it is simply run through the image transformation network. Figure 10.58a shows some comparisons between Gatys, Ecker, and Bethge (2016) and Johnson, Alahi, and Fei-Fei (2016).

Perceptual loss has now become a standard component of image synthesis systems (Dosovitskiy and Brox 2016), often as an additional component to the generative adversarial loss (Section 5.5.4). They are also sometimes used as an alternative to older image quality metrics such as SSIM (Zhang, Isola et al. 2018; Talebi and Milanfar 2018; Tariq, Tursun et al. 2020; Czolbe, Krause et al. 2020).

The basic architecture in Johnson, Alahi, and Fei-Fei (2016) was extended by Ulyanov, Vedaldi, and Lempitsky (2017), who show that using instance normalization instead of batch normalization significantly improves the results. Dumoulin, Shlens, and Kudlur (2017) and Huang and Belongie (2017) further extended these ideas to train one network to mimic different styles, using conditional instance normalization and adaptive instance normalization to select among the pre-trained styles (or in-between blends), as shown in Figure 10.58b.

Neural style transfer continues to be an actively studied area, with related approaches working on more generalized image-to-image translation (Isola, Zhu et al. 2017) and semantic photo synthesis (Chen and Koltun 2017; Park, Liu et al. 2019; Bau, Strobelt et al. 2019; Ntavelis, Romero et al. 2020b) applications—see Tewari, Fried et al. (2020, Section 6.1) for a recent survey. Most of the newer architectures use generative adversarial networks (GANs) (Kotovenko, Sanakoyeu et al. 2019; Shaham, Dekel, and Michaeli 2019; Yang, Wang et al. 2019; Svoboda, Anoosheh et al. 2020; Wang, Li et al. 2020; Xia, Zhang et al. 2020; Hark¨ onen, Hertzmann¨ et al. 2020), which we discussed in Section 5.5.4. There’s also a recent course on the more general topic of learning-based image synthesis (Zhu 2021).

## 10.6 Additional reading

Good overviews of the first decade of computational photography can be found in the book by Raskar and Tumblin (2010) and survey articles by Nayar (2006), Cohen and Szeliski (2006), Levoy (2006), Debevec (2006), and Hayes (2008), as well as two special journal issues edited by Bimber (2006) and Durand and Szeliski (2007). Notes from the courses on computational photography mentioned at the beginning of this chapter are another great source for more

Style   
The Starry Night,   
Vincent van Gogh,   
1889

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/70728d70a19f099887351794ad65870dae97dc1c195809ff531a9daf47851c97.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/827fce695fc03a4e879c94a6e6b6ad78a8798bfd55d6a7818e4de473b78e44be.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/ba65d7d5b987615b7facb89af67ff253c0fbb1f8a92f58be955e96140a07d64a.jpg)  
Content  
Style The Muse, Pablo Picasso, 1935

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/621fea717770328a4994a14cb7efa9e13c98a6655ae3b03213c812820f2202e1.jpg)  
[11]

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/6c625fcf6ee36897ee53d216fbf388acd34afac339e349a26239cf35c4cd4d9f.jpg)  
Ours

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/9df64aed84516851e9d8b30d2c3bf08b71871d3e56f953fc48f3401bd6fc7025.jpg)  
Content

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/79f34454866f2f6a9e5a0b657ccf81ed093042c6a34604869a53a16ab8e6e1a3.jpg)  
[11]

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/d6e3af98ebfbe66f470b283a80f5652b95174393d8698a449ce03c3fcd648e56.jpg)  
Ours  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/8b2e54476fda8ddcb772c8309a72dc426d608321db3991d253a661ae433881a7.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/1d0b36ced8528e2428902d59d841b1463c8ad28f9c72c2a23341858b240004c4.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/82e50311a9c96d441c92fa56a384b7d70b32d0822869b8745c2149f714694528.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/bdcbf5bd7968517d0f32efbf6f36c31cd1db2a84641b97fa088e89d13e94b0fc.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/1d5abdf0028c80950e151bc8f69bfd0dafe03bbb13a28bbb6287eff2f9b86774.jpg)

![Figure 10.58](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/601-800/images/796cbb38626a5d4524a968bb8f61af054a15d99675e2b96ba45c4d3fdc69a223.jpg)  
Figure 10.58 Two examples of neural style transfer: (a) the pre-trained network of Johnson, Alahi, and Fei-Fei (2016) © 2016 Springer (labeled “Ours”) vs. (Gatys, Ecker, and Bethge 2016) (labeled “[11]”);, (b) a network that uses conditional instance normalization to mimic different styles (top row) applied to various content (left column) © (Dumoulin, Shlens, and Kudlur 2017).

recent material and references.<sup>31</sup>

The sub-field of high dynamic range imaging has its own book discussing research in this area (Reinhard, Heidrich et al. 2010), as well as some books describing related photographic techniques (Freeman 2008; Gulbins and Gulbins 2009). Algorithms for calibrating the radiometric response function of a camera can be found in articles by Mann and Picard (1995), Debevec and Malik (1997), and Mitsunaga and Nayar (1999).

The subject of tone mapping is treated extensively in (Reinhard, Heidrich et al. 2010). Representative papers from the large volume of literature on this topic include (Tumblin and Rushmeier 1993; Larson, Rushmeier, and Piatko 1997; Pattanaik, Ferwerda et al. 1998; Tumblin and Turk 1999; Durand and Dorsey 2002; Fattal, Lischinski, and Werman 2002; Reinhard, Stark et al. 2002; Lischinski, Farbman et al. 2006; Farbman, Fattal et al. 2008; Paris, Hasinoff, and Kautz 2011; Aubry, Paris et al. 2014).

The literature on super-resolution is quite extensive (Chaudhuri 2001; Park, Park, and Kang 2003; Capel and Zisserman 2003; Capel 2004; van Ouwerkerk 2006). The term superresolution usually describes techniques for aligning and merging multiple images to produce higher-resolution composites (Keren, Peleg, and Brada 1988; Irani and Peleg 1991; Cheeseman, Kanefsky et al. 1993; Mann and Picard 1994; Chiang and Boult 1996; Bascle, Blake, and Zisserman 1996; Capel and Zisserman 1998; Smelyanskiy, Cheeseman et al. 2000; Capel and Zisserman 2000; Pickup, Capel et al. 2009; Gulbins and Gulbins 2009; Hasinoff, Sharlet et al. 2016; Wronski, Garcia-Dorado et al. 2019). However, single-image super-resolution techniques have also been developed (Freeman, Jones, and Pasztor 2002; Baker and Kanade 2002; Fattal 2007; Dong, Loy et al. 2016; Cai, Gu et al. 2019; Anwar, Khan, and Barnes 2020). Such techniques are closely related to denoising (Zhang, Zuo et al. 2017; Brown 2019; Liba, Murthy et al. 2019; Gu and Timofte 2019), deblurring and blind image deconvolution (Campisi and Egiazarian 2017; Zhang, Dai et al. 2019; Kupyn, Martyniuk et al. 2019), and demosaicing (Chatterjee, Joshi et al. 2011; Gharbi, Chaurasia et al. 2016; Abdelhamed, Afifi et al. 2020).

A good survey on image matting is given by Wang and Cohen (2009). Representative papers, which include extensive comparisons with previous work, include (Chuang, Curless et al. 2001; Wang and Cohen 2007a; Levin, Acha, and Lischinski 2008; Rhemann, Rother et al. 2008, 2009; Xu, Price et al. 2017). You can find pointers to recent papers and results on the http://alphamatting.com website created by Rhemann, Rother et al. (2009). Matting ideas can also be applied to manipulate shadows (Chuang, Goldman et al. 2003; Sun, Barron et al.

2019; Zhou, Hadap et al. 2019; Zhang, Barron et al. 2020; Wang, Curless, and Seitz 2020) and videos (Chuang, Agarwala et al. 2002; Wang, Bhat et al. 2005; Erofeev, Gitman et al. 2015; Sengupta, Jayaram et al. 2020; Lin, Ryabtsev et al. 2021).

The literature on texture synthesis and hole filling includes traditional approaches to texture synthesis, which try to match image statistics between source and destination images (Heeger and Bergen 1995; De Bonet 1997; Portilla and Simoncelli 2000), as well as approaches that search for matching neighborhoods or patches inside the source sample (Efros and Leung 1999; Wei and Levoy 2000; Efros and Freeman 2001; Wei, Lefebvre et al. 2009) or use neural networks (Gatys, Ecker, and Bethge 2015; Shaham, Dekel, and Michaeli 2019). In a similar vein, traditional approaches to hole filling involve the solution of local variational (smooth continuation) problems (Bertalmio, Sapiro et al. 2000; Bertalmio, Vese et al. 2003; Telea 2004). The next wave of techniques use data-driven texture synthesis approaches (Drori, Cohen-Or, and Yeshurun 2003; Kwatra, Schodl¨ et al. 2003; Criminisi, Perez, and´ Toyama 2004; Sun, Yuan et al. 2004; Kwatra, Essa et al. 2005; Wilczkowiak, Brostow et al. 2005; Komodakis and Tziritas 2007; Wexler, Shechtman, and Irani 2007). The most recent algorithms for image and video inpainting use deep neural networks (Yang, Lu et al. 2017; Yu, Lin et al. 2018; Liu, Reda et al. 2018; Shih, Su et al. 2020; Yi, Tang et al. 2020; Gao, Saraf et al. 2020; Ntavelis, Romero et al. 2020a). In addition to generating isolated patches of texture or inpainting missing region, related techniques can also be used to transfer the style of an image or painting to another one (Efros and Freeman 2001; Hertzmann, Jacobs et al. 2001; Gatys, Ecker, and Bethge 2016; Johnson, Alahi, and Fei-Fei 2016; Dumoulin, Shlens, and Kudlur 2017; Huang and Belongie 2017; Shaham, Dekel, and Michaeli 2019).

## 10.7 Exercises

Ex 10.1: Radiometric calibration. Implement one of the multi-exposure radiometric calibration algorithms described in Section 10.2 (Debevec and Malik 1997; Mitsunaga and Nayar 1999; Reinhard, Heidrich et al. 2010). This calibration will be useful in a number of different applications, such as stitching images or stereo matching with different exposures and shape from shading.

1. Take a series of bracketed images with your camera on a tripod. If your camera has an automatic exposure bracketing (AEB) modes, taking three images may be sufficient to calibrate most of your camera’s dynamic range, especially if your scene has a lot of bright and dark regions. (Shooting outdoors or through a window on a sunny day is best.)

2. If your images are not taken on a tripod, first perform a global alignment.

3. Estimate the radiometric response function using one of the techniques cited above.

4. Estimate the high dynamic range radiance image by selecting or blending pixels from different exposures (Debevec and Malik 1997; Mitsunaga and Nayar 1999; Eden, Uyttendaele, and Szeliski 2006).

5. Repeat your calibration experiments under different conditions, e.g., indoors under incandescent light, to get a sense for the range of color balancing effects that your camera imposes.

6. If your camera supports RAW and JPEG mode, calibrate both sets of images simultaneously and to each other (the radiance at each pixel will correspond). See if you can come up with a model for what your camera does, e.g., whether it treats color balance as a diagonal or full 3 <sub>×</sub> 3 matrix multiply, whether it uses non-linearities in addition to gamma, whether it sharpens the image while “developing” the JPEG image, etc.

7. Develop an interactive viewer to change the exposure of an image based on the average exposure of a region around the mouse. (One variant is to show the adjusted image inside a window around the mouse. Another is to adjust the complete image based on the mouse position.)

8. Implement a tone mapping operator (Exercise 10.5) and use this to map your radiance image to a displayable gamut.

Ex 10.2: Noise level function. Determine your camera’s noise level function using either multiple shots or by analyzing smooth regions.

1. Set up your camera on a tripod looking at a calibration target or a static scene with a good variation in input levels and colors. (Check your camera’s histogram to ensure that all values are being sampled.)

2. Take repeated images of the same scene (ideally with a remote shutter release) and average them to compute the variance at each pixel. Discarding pixels near high gradients (which are affected by camera motion), plot for each color channel the standard deviation at each pixel as a function of its output value.

3. Fit a lower envelope to these measurements and use this as your noise level function. How much variation do you see in the noise as a function of input level? How much of this is significant, i.e., away from flat regions in your camera response function where you do not want to be sampling anyway?

4. (Optional) Using the same images, develop a technique that segments the image into near-constant regions (Liu, Szeliski et al. 2008). (This is easier if you are photographing a calibration chart.) Compute the deviations for each region from a single image and use them to estimate the NLF. How does this compare to the multi-image technique, and how stable are your estimates from image to image?

Ex 10.3: Vignetting. Estimate the amount of vignetting in some of your lenses using one of the following three techniques (or devise one of your choosing):

1. Take an image of a large uniform intensity region (well-illuminated wall or blue sky— but be careful of brightness gradients) and fit a radial polynomial curve to estimate the vignetting.

2. Construct a center-weighted panorama and compare these pixel values to the input image values to estimate the vignetting function. Weight pixels in slowly varying regions more highly, as small misalignments will give large errors at high gradients. Optionally estimate the radiometric response function as well (Litvinov and Schechner 2005; Goldman 2010).

3. Analyze the radial gradients (especially in low-gradient regions) and fit the robust means of these gradients to the derivative of the vignetting function, as described by Zheng, Yu et al. (2008).

For the parametric form of your vignetting function, you can either use a simple radial function, e.g.,

$$
f(r) = 1 + \alpha_{1} r + \alpha_{2} r^{2} + \cdot \cdot \cdot\tag{10.41}
$$

or one of the specialized equations developed by Kang and Weiss (2000) and Zheng, Lin, and Kang (2006).

In all of these cases, be sure that you are using linearized intensity measurements, by using either RAW images or images linearized through a radiometric response function, or at least images where the gamma curve has been removed.

(Optional) What happens if you forget to undo the gamma before fitting a (multiplicative) vignetting function?

Ex 10.4: Optical blur (PSF) estimation. Compute the optical PSF either using a known target (Figure 10.7) or by detecting and fitting step edges (Section 10.1.4) (Joshi, Szeliski, and Kriegman 2008; Cho, Paris et al. 2011).

1. Detect strong edges to sub-pixel precision.

2. Fit a local profile to each oriented edge and fill these pixels into an ideal target image, either at image resolution or at a higher resolution (Figure 10.9c–d).

3. Use least squares (10.1) at valid pixels to estimate the PSF kernel K, either globally or in locally overlapping sub-regions of the image.

4. Visualize the recovered PSFs and use them to remove chromatic aberration or deblur the image.

Ex 10.5: Tone mapping. Implement one of the tone mapping algorithms discussed in Section 10.2.1 (Durand and Dorsey 2002; Fattal, Lischinski, and Werman 2002; Reinhard, Stark et al. 2002; Lischinski, Farbman et al. 2006) or any of the numerous additional algorithms discussed by Reinhard, Heidrich et al. (2010) and https://stellar.mit.edu/S/course/6/sp08/6. 815/materials.html.

(Optional) Compare your algorithm to local histogram equalization (Section 3.1.4).

Ex 10.6: Flash enhancement. Develop an algorithm to combine flash and non-flash photographs to best effect. You can use ideas from Eisemann and Durand (2004) and Petschnigg, Agrawala et al. (2004) or anything else you think might work well.

Ex 10.7: Super-resolution. Implement one or more super-resolution algorithms and compare their performance.

1. Take a set of photographs of the same scene using a hand-held camera (to ensure that there is some jitter between the photographs).

2. Determine the PSF for the images you are trying to super-resolve using one of the techniques in Exercise 10.4.

3. Alternatively, simulate a collection of lower-resolution images by taking a high-quality photograph (avoid those with compression artifacts) and applying your own prefilter kernel and downsampling.

4. Estimate the relative motion between the images using a parametric translation and rotation motion estimation algorithm (Sections 8.1.3 or 9.2).

5. Implement a basic least squares super-resolution algorithm by minimizing the difference between the observed and downsampled images (10.26–10.27).

6. Add in a gradient image prior, either as another least squares term or as a robust term that can be minimized using iteratively reweighted least squares (Appendix A.3).

7. (Optional) Implement one of the example-based super-resolution techniques, where matching against a set of exemplar images is used either to infer higher-frequency information to be added to the reconstruction (Freeman, Jones, and Pasztor 2002) or higher-frequency gradients to be matched in the super-resolved image (Baker and Kanade 2002).

8. (Optional) Use local edge statistic information to improve the quality of the superresolved image (Fattal 2007).

9. (Optional) Try some of the newest DNN-based super-resolution algorithms.

Ex 10.8: Image matting. Develop an algorithm for pulling a foreground matte from natural images, as described in Section 10.4.

1. Make sure that the images you are taking are linearized (Exercise 10.1 and Section 10.1) and that your camera exposure is fixed (full manual mode), at least when taking multiple shots of the same scene.

2. To acquire ground truth data, place your object in front of a computer monitor and display a variety of solid background colors as well as some natural imagery.

3. Remove your object and re-display the same images to acquire known background colors.

4. Use triangulation matting (Smith and Blinn 1996) to estimate the ground truth opacities α and pre-multiplied foreground colors αF for your objects.

5. Implement one or more of the natural image matting algorithms described in Section 10.4 and compare your results to the ground truth values you computed. Alternatively, use the matting test images published on http://alphamatting.com.

6. (Optional) Run your algorithms on other images taken with the same calibrated camera (or other images you find interesting).

Ex 10.9: Smoke and shadow matting. Extract smoke or shadow mattes from one scene and insert them into another (Chuang, Agarwala et al. 2002; Chuang, Goldman et al. 2003).

1. Take a still or video sequence of images with and without some intermittent smoke and shadows. (Remember to linearize your images before proceeding with any computations.)

2. For each pixel, fit a line to the observed color values.

3. If performing smoke matting, robustly compute the intersection of these lines to obtain the smoke color estimate. Then, estimate the background color as the other extremum (unless you have already taken a smoke-free background image).

If performing shadow matting, compute robust shadow (minimum) and lit (maximum) values for each pixel.

4. Extract the smoke or shadow mattes from each frame as the fraction between these two values (background and smoke or shadowed and lit).

5. Scan a new (destination) scene or modify the original background with an image editor.

6. Re-insert the smoke or shadow matte, along with any other foreground objects you may have extracted.

7. (Optional) Using a series of cast stick shadows, estimate the deformation field for the destination scene to correctly warp (drape) the shadows across the new geometry. (This is related to the shadow scanning technique developed by Bouguet and Perona (1999) and implemented in Exercise 13.2.)

8. (Optional) Chuang, Goldman et al. (2003) only demonstrated their technique for planar source geometries. Can you extend their technique to capture shadows acquired from an irregular source geometry?

9. (Optional) Can you change the direction of the shadow, i.e., simulate the effect of changing the light source direction?

10. (Optional) Re-implement the facial shadow removal algorithm of Zhang, Barron et al. (2020) and try applying it to other domains.

Ex 10.10: Texture synthesis. Implement one of the texture synthesis or hole filling algorithms presented in Section 10.5. Here is one possible procedure:

1. Implement the basic Efros and Leung (1999) algorithm, i.e., starting from the outside (for hole filling) or in raster order (for texture synthesis), search for a similar neighborhood in the source texture image, and copy that pixel.

2. Add in the Wei and Levoy (2000) extension of generating the pixels in a coarse-to-fine fashion, i.e., generate a lower-resolution synthetic texture (or filled image), and use this as a guide for matching regions in the finer resolution version.

3. Add in the Criminisi, Perez, and Toyama´ (2004) idea of prioritizing pixels to be filled by some function of the local structure (gradient or orientation strength).

4. Extend any of the above algorithms by selecting sub-blocks in the source texture and using optimization to determine the seam between the new block and the existing image that it overlaps (Efros and Freeman 2001).

5. (Optional) Implement one of the isophote (smooth continuation) inpainting algorithms (Bertalmio, Sapiro et al. 2000; Telea 2004).

6. (Optional) Add the ability to supply a target (reference) image (Efros and Freeman 2001) or to provide sample filtered or unfiltered (reference and rendered) images (Hertzmann, Jacobs et al. 2001), see Section 10.5.2.

7. (Optional) Try some of the newer DNN-based inpainting algorithms described at the end of Section 10.5.1.

Ex 10.11: Colorization. Implement the Levin, Lischinski, and Weiss (2004) colorization algorithm that is sketched out in Section 4.2.4 and Figure 4.10. If you prefer, you can implement this as a neural network (Zhang, Zhu et al. 2017). Find some historic monochrome photographs and some modern color ones. Write an interactive tool that lets you “pick” colors from a modern photo and paint over the old one. Tune the algorithm parameters to give you good results. Are you pleased with the results? Can you think of ways to make them look more “antique”, e.g., with softer (less saturated and edgy) colors?

(Alternative) Implement or test out one of the newer “automatic colorization” algorithms such as Zhang, Isola, and Efros (2016) or (Vondrick, Shrivastava et al. 2018).

Ex 10.12: Style transfer. Try some of the non-photorealistic rendering or style transfer algorithms from Sections 10.5.2–10.5.3 on your own images. Can you come up with surprising results? How about failure cases?


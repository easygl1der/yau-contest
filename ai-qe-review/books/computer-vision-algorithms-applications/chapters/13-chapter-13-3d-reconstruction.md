---
title: "Chapter 13 \u2014 3D reconstruction"
book: "Computer Vision: Algorithms and Applications"
book_slug: computer-vision-algorithms-applications
course: deep-learning
chapter_number: 13
citekey: szeliski2022vision
official_syllabus: true
source_pdf: "sources/textbooks/official/deep-learning/computer-vision-algorithms-applications/source.pdf"
source_transcript: "transcripts/mineru/computer-vision-algorithms-applications/reading.md"
source_line_start: 15370
source_line_end: 16251
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 137
source_empty_image_alt: 137
non_semantic_image_alt: 125
caption_derived_image_alt: 12
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 0
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - deep-learning
  - official-syllabus
---

# Chapter 13 — 3D reconstruction

> [[../README|本书目录]] · [[12-chapter-12-depth-estimation|上一章]] · [[14-chapter-14-image-based-rendering|下一章]]

> [!cite] 来源与可追溯性
> - 书目：Computer Vision: Algorithms and Applications（szeliski2022vision）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/deep-learning/computer-vision-algorithms-applications/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/computer-vision-algorithms-applications/reading.md)，源行 15370–16251。
> - 本章保留 137 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：无。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 3D reconstruction

13.1 Shape from X . 809   
13.1.1 Shape from shading and photometric stereo 809   
13.1.2 Shape from texture 814   
13.1.3 Shape from focus 814   
13.2 3D scanning 816   
13.2.1 Range data merging 820   
13.2.2 Application: Digital heritage . 824   
13.3 Surface representations 825   
13.3.1 Surface interpolation 826   
13.3.2 Surface simplification 827   
13.3.3 Geometry images 828   
13.4 Point-based representations 829   
13.5 Volumetric representations 830   
13.5.1 Implicit surfaces and level sets 831   
13.6 Model-based reconstruction 833   
13.6.1 Architecture 833   
13.6.2 Facial modeling and tracking . 838   
13.6.3 Application: Facial animation 839   
13.6.4 Human body modeling and tracking 843   
13.7 Recovering texture maps and albedos 850   
13.7.1 Estimating BRDFs 852   
13.7.2 Application: 3D model capture 854   
13.8 Additional reading 855   
13.9 Exercises . . . . . . . . . . . .

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/157dc2320d71774f9fe3879bcb146a1b0948d7382bc672fb9538a4cdcd1eae51.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/273a1c241ed5190b7ad822fd4a8d1b16ebe7638232f3dd520e1c1fec5b394d58.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/d79144695ce4dbb9ba5b4b3196c0b6c8b183eceef906b5c96a9d5c3f82f11d28.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/34be8077e5e985b2dad37d867baeda19d2b8034440ad52cf58779e5f1615f462.jpg)  
(d)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/19445284e8c1abf6127a321a0638e653c0c91166c8ea288af4adf00083bae5fa.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/45c2c79134494d115d2ef39acdf5ea8e4cc12ae275b60fb8c30bc73dff6bae47.jpg)  
(e)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/630ec4ed82a004a1b110e0d0da2104cbb093ec0e63ffd3f9560e648c570607f0.jpg)  
(f)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/dc1123d23c892d702cc5590358b59d3059f1feaa503e038035960cda53c012dc.jpg)  
(g)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/1c920e22090aa888919800575866627795e29384918c29e529df4f63c33e1d1a.jpg)  
(h)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/d6528f350f4ddf352da962326a810576613b5279a926da971b28692d298799a2.jpg)  
(i)  
Figure 13.1 3D shape acquisition and modeling techniques: (a) shaded image (Zhang, Tsai et al. 1999) © 1999 IEEE; (b) texture gradient (Garding˚ 1992) © 1992 Springer; (c) real-time depth from focus (Nayar, Watanabe, and Noguchi 1996) © 1996 IEEE; (d) scanning a scene with a stick shadow (Bouguet and Perona 1999) © 1999 Springer; (e) merging range maps into a 3D model (Curless and Levoy 1996) © 1996 ACM; (f) point-based surface modeling (Pauly, Keiser et al. 2003) © 2003 ACM; (g) automated modeling of a 3D building using lines and planes (Werner and Zisserman 2002) © 2002 Springer; (h) 3D face model from spacetime stereo (Zhang, Snavely et al. 2004) © 2004 ACM; (i) whole body, expression, and gesture fitting from a single image (Pavlakos, Choutas et al. 2019) © 2019 IEEE.

As we saw in the previous chapter, many stereo matching techniques have been developed to reconstruct high-quality 3D models from two or more images. However, stereo is just one of the many potential cues that can be used to infer shape from images. In this chapter, we investigate a number of such techniques, which include not only visual cues such as shading and focus, but also techniques for merging multiple range or depth images into 3D models, as well as techniques for reconstructing specialized models, such as heads, bodies, or architecture.

Among the various cues that can be used to infer shape, the shading on a surface (Figure 13.1a) can provide a lot of information about local surface orientations and hence overall surface shape (Section 13.1.1). This approach becomes even more powerful when lights shining from different directions can be turned on and off separately (photometric stereo). Texture gradients (Figure 13.1b), i.e., the foreshortening of regular patterns as the surface slants or bends away from the camera, can provide similar cues on local surface orientation (Section 13.1.2). Focus is another powerful cue to scene depth, especially when two or more images with different focus settings are used (Section 13.1.3).

3D shape can also be estimated using active illumination techniques such as light stripes (Figure 13.1d) or time of flight range finders (Section 13.2). The partial surface models obtained using such techniques (or passive image-based stereo) can then be merged into more coherent 3D surface models (Figure 13.1e), as discussed in Section 13.2.1. Such techniques have been used to construct highly detailed and accurate models of cultural heritage such as historic sites (Section 13.2.2). The resulting surface models can then be simplified to support viewing at different resolutions and streaming across the web (Section 13.3.2). An alternative to working with continuous surfaces is to represent 3D surfaces as dense collections of 3D oriented points (Section 13.4) or as volumetric primitives (Section 13.5).

3D modeling can be more efficient and effective if we know something about the objects we are trying to reconstruct. In Section 13.6, we look at three specialized but commonly occurring examples, namely architecture (Figure 13.1g), heads and faces (Figure 13.1h), and whole bodies (Figure 13.1i). In addition to modeling people, we also discuss techniques for tracking them.

The last stage of shape and appearance modeling is to extract some colored textures to paint onto our 3D models (Section 13.7). Some techniques go beyond this and actually estimate full BRDFs (Section 13.7.1), although if there is no desire to re-light the scene, Surface Light Fields may be easier to acquire (Section 14.3.2).

Because there exists such a large variety of techniques to perform 3D modeling, this chapter does not go into detail on any one of these. Readers are encouraged to find more information in the cited references and recent computer vision conferences, as well as more specialized conferences devoted to these topics, e.g., the International Conference on 3D Vision (3DV) and the IEEE International Conference on Automatic Face and Gesture Recognition (FG).

## 13.1 Shape from X

In addition to binocular disparity, shading, texture, and focus all play a role in how we perceive shape. The study of how shape can be inferred from such cues is sometimes called shape from X, because the individual instances are called shape from shading, shape from texture, and shape from focus.<sup>1</sup> In this section, we look at these three cues and how they can be used to reconstruct 3D geometry. A good overview of all these topics can be found in the collection of papers on physics-based shape inference edited by Wolff, Shafer, and Healey (1992b), the survey by Ackermann and Goesele (2015) and the book by Ikeuchi, Matsushita et al. (2020).

## 13.1.1 Shape from shading and photometric stereo

When you look at images of smooth shaded objects, such as the ones shown in Figure 13.2, you can clearly see the shape of the object from just the shading variation. How is this possible? The answer is that as the surface normal changes across the object, the apparent brightness changes as a function of the angle between the local surface orientation and the incident illumination, as shown in Figure 2.15 (Section 2.2.2).

The problem of recovering the shape of a surface from this intensity variation is known as shape from shading and is one of the classic problems in computer vision (Horn 1975). The collection of papers edited by Horn and Brooks (1989) is a great source of information on this topic, especially the chapter on variational approaches. The survey by Zhang, Tsai et al. (1999) not only reviews more recent techniques, but also provides some comparative results.

Most shape from shading algorithms assume that the surface under consideration is of a uniform albedo and reflectance, and that the light source directions are either known or can be calibrated by the use of a reference object. Under the assumptions of distant light sources and observer, the variation in intensity (irradiance equation) becomes purely a function of the local surface orientation,

$$
I(x, y) = R(p(x, y), q(x, y)),\tag{13.1}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/ec5bb69855d89679bc5c1e0ad83cee7c8fc9411ff549fc1788cf42c7401322e6.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/f47da9546287fc3215625d9d25d3b2a6437d007a14911c3c9a303660c585a446.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/63ebdcc5cfe4578c64bf9538def4f88b7a33a63865d37410f15873ff23176732.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/80d485f0c789429c56345c25c23b202415fa4b1fbd63813e4f74e1d4e3fbac2b.jpg)  
(d)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/9fd5f1736c44ee15a0a8e3eba39d6b4da71205c07592083de4873f13b947ecca.jpg)  
(e)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/a995318a6bb849e503a92f7312236edfc87a81dcf69c6e9eb4806e4d36cef73e.jpg)  
(f)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/464a5e2dcf1bf0a05f4d7847e5c56b36fed9d1ec139f04caaf4acafcb5ec2cab.jpg)  
(g)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/1058fde7c1ead239587f5a75b9d70324b7921a501ad80d9b492aba3a4006b1fa.jpg)  
(h)  
Figure 13.2 Synthetic shape from shading (Zhang, Tsai et al. 1999) © 1999 IEEE: shaded images, (a–b) with light from in front (0, 0, 1) and (c–d) with light from the front right (1, 0, 1); (e–f) corresponding shape from shading reconstructions using the technique of Tsai and Shah (1994).

where $(p, q) \ : = \ :(z_{x}, z_{y})$ are the depth map derivatives and $R(p, q)$ is called the reflectance map. For example, a diffuse (Lambertian) surface has a reflectance map that is the (nonnegative) dot product (2.89) between the surface normal $\hat{\mathbf{n}} =(p, q, 1) / \sqrt{1 + p^{2} + q^{2}}$ and the light source direction $\mathbf{v} =(v_{x}, v_{y}, v_{z})$

$$
R(p, q) = \operatorname{max} \left(0, \rho{\frac{pv_{x} + qv_{y} + v_{z}}{\sqrt{1 + p^{2} + q^{2}}}} \right),\tag{13.2}
$$

where $\rho$ is the surface reflectance factor (albedo).

In principle, Equations (13.1–13.2) can be used to estimate $(p, q)$ using non-linear least squares or some other method. Unfortunately, unless additional constraints are imposed, there are more unknowns per pixel $(p, q)$ than there are measurements (I). One commonly used constraint is the smoothness constraint,

$$
{\mathcal{E}}_{s} = \int p_{x}^{2} + p_{y}^{2} + q_{x}^{2} + q_{y}^{2} dxdy = \int \| \nabla p \|^{2} + \| \nabla q \|^{2} dxdy,\tag{13.3}
$$

which we have already seen in Section 4.2 (4.18). The other is the integrability constraint,

$$
\mathcal{E}_{i} = \int(p_{y} - q_{x})^{2} dxdy,\tag{13.4}
$$

which arises naturally, because for a valid depth map $z(x, y)$ with $(p, q) =(z_{x}, z_{y})$ , we have $p_{y} = z_{xy} = z_{yx} = q_{x}$

Instead of first recovering the orientation fields $(p, q)$ and integrating them to obtain a surface, it is also possible to directly minimize the discrepancy in the image formation equation (13.1) while finding the optimal depth map $z(x, y)$ (Horn 1990). Unfortunately, shape from shading is susceptible to local minima in the search space and, like other variational problems that involve the simultaneous estimation of many variables, can also suffer from slow convergence. Using multi-resolution techniques (Szeliski 1991a) can help accelerate the convergence, while using more sophisticated optimization techniques (Dupuis and Oliensis 1994) can help avoid local minima.

In practice, surfaces other than plaster casts are rarely of a single uniform albedo. Shape from shading therefore needs to be combined with some other technique or extended in some way to make it useful. One way to do this is to combine it with stereo matching (Fua and Leclerc 1995; Logothetis, Mecca, and Cipolla 2019) or known texture (surface patterns) (White and Forsyth 2006). The stereo and texture components provide information in textured regions, while shape from shading helps fill in the information across uniformly colored regions and also provides finer information about surface shape.

Photometric stereo. Another way to make shape from shading more reliable is to use multiple light sources that can be selectively turned on and off. This technique is called photometric stereo, as the light sources play a role analogous to the cameras located at different locations in traditional stereo (Woodham 1981).<sup>2</sup> For each light source, we have a different reflectance map, $R_{1}(p, q), R_{2}(p, q)$ , etc. Given the corresponding intensities $I_{1}, I_{2}$ , etc. at a pixel, we can in principle recover both an unknown albedo $\rho$ and a surface orientation estimate $(p, q)$

For diffuse surfaces (13.2), if we parameterize the local orientation by ˆn, we get (for non-shadowed pixels) a set of linear equations of the form

$$
I_{k} = \rho \hat{\mathbf{n}} \cdot \mathbf{v}_{k},\tag{13.5}
$$

from which we can recover $\rho \hat{\bf n}$ using linear least squares. These equations are well conditioned as long as the (three or more) vectors $\mathbf{v}_{k}$ are linearly independent, i.e., they are not along the same azimuth (direction away from the viewer).

![Figure 13.3](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/c3a214aea3ea0a21744c75d9f36b878e7c3df9d0e14310011bf6602fbdf781b0.jpg)  
Figure 13.3 Multi-view photometric stereo (Logothetis, Mecca, and Cipolla 2019) © 2019 IEEE: initial COLMAP multi-view stereo reconstruction; refined with (Park, Sinha et al. 2017); and (Logothetis, Mecca, and Cipolla 2019).

Once the surface normals or gradients have been recovered at each pixel, they can be integrated into a depth map using a variant of regularized surface fitting (4.24). Nehab, Rusinkiewicz et al. (2005) and Harker and O’Leary (2008) discuss more sophisticated techniques for doing this. The combination of multi-view stereo for coarse shape and photometric stereo for fine detail continues to be an active area of research (Hernandez, Vogiatzis, and´ Cipolla 2008; Wu, Liu et al. 2010; Park, Sinha et al. 2017). Logothetis, Mecca, and Cipolla (2019) describe such a system that can produce very high-quality scans (Figure 13.3), although it requires a sophisticated laboratory setup. A more practical setup that only requires a stereo camera and a flash to produce a flash/non-flash pair is describe by Cao, Waechter et al. (2020). It is also possible to apply photometric stereo to outdoor web camera sequences (Figure 13.4), using the trajectory of the Sun as a variable direction illuminator (Ackermann, Langguth et al. 2012).

When surfaces are specular, more than three light directions may be required. In fact, the irradiance equation given in (13.1) not only requires that the light sources and camera be distant from the surface, it also neglects inter-reflections, which can be a significant source of the shading observed on object surfaces, e.g., the darkening seen inside concave structures such as grooves and crevasses (Nayar, Ikeuchi, and Kanade 1991). However, if one can control the placements of lights and cameras so that they are reciprocal, i.e., the position of lights and cameras can be (conceptually) switched, it is possible to recover constraints on surface depths and normals using a procedure known as Helmholtz stereopsis (Zickler, Belhumeur, and Kriegman 2002).

While earlier work on photometric stereo assumed known illuminant directions and reflectance (BRDF) functions, more recent work aims to loosen these constraints. Ackermann <sup>(c)</sup>Figure 13.5 Synthetic shape from texture (Garding˚ 1992) © 1992 Springer: (a) regular texture wrapped onto a curved surface and (b) the corresponding surface normal estimates. Shape from mirror reflections (Savarese, Chen, and Perona 2005) © 2005 Springer: (c) a regular pattern reflecting off a curved mirror gives rise to (d) curved lines, from which 3D point locations and normals can be inferred.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/fee178e4ac3d220dd2af4c9eec64ffbb604f06721c18c978e9d15f042a1b6927.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/75966e1d0eea03a916516704e3ab58323b330022db845ce3aabfbe65c9945bda.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/43eaabaaa19ce772d5ed305ee6d4178be817ddf53d7b6c1e722078d29fb56c17.jpg)

![Figure 13.4](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/d4a8303341e55c9372536d8c69e409ab0bb6b4cde69b925146a9ad78e8fa8bef.jpg)

Figure 13.4 Webcam-based outdoor photometric stereo (Ackermann, Langguth et al. 2012) © 2012 IEEE: an input image, the recovered normal map, three basis BRDFs below their respective material maps, and a synthetic rendering from a new sun position.  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/28d8f65b9772e7f02230f8f154324646ad075231b90564f9169dc429da1c7b25.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/75bec8e1750664f3bdcbf70c18d02200b584650a9b72675c8e64e5276b5fdc7e.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/6f3ccd62520805efdcf68d5d01249c44521d978276fed1ddda48884a5a6e8a37.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/56d9145acf46603967a437c7d51f5b13a1529b39bcb3d1589e3eefd9fd32938f.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/033d0e858e92c9cbaceecb2ffab54b015cc3b164a8b4cbb2b32fb46931ff476e.jpg)  
<sub>(c)</sub>(c) (d)

and Goesele (2015) provide an extensive survey of such techniques, while Shi, Mo et al. (2019) describe their DiLiGenT dataset and benchmark for evaluating non-Lambertian photometric stereo and cite over 100 related papers. As with other areas of computer vision, deep networks and end-to-end learning are now commonly used to to recover shape and illuminant direction from photometrics stereo. Some recent papers include Chen, Han et al. (2019), Li, Robles-Kelly et al. (2019), Haefner, Ye et al. (2019), Chen, Waechter et al. (2020), and Santo, Waechter, and Matsushita (2020).

## 13.1.2 Shape from texture

The variation in foreshortening observed in regular textures can also provide useful information about local surface orientation. Figure 13.5 shows an example of such a pattern, along with the estimated local surface orientations. Shape from texture algorithms require a number of processing steps, including the extraction of repeated patterns or the measurement of local frequencies to compute local affine deformations, and a subsequent stage to infer local surface orientation. Details on these various stages can be found in the research literature (Witkin 1981; Ikeuchi 1981; Blostein and Ahuja 1987; Garding˚ 1992; Malik and Rosenholtz 1997; Lobay and Forsyth 2006). A more recent paper uses a generative model to represent the repetitive appearance of textures and jointly optimizes the model along with the local surface orientations at every pixel (Verbin and Zickler 2020).

When the original pattern is regular, it is possible to fit a regular but slightly deformed grid to the image and use this grid for a variety of image replacement or analysis tasks (Liu, Collins, and Tsin 2004; Liu, Lin, and Hays 2004; Hays, Leordeanu et al. 2006; Lin, Hays et al. 2006; Park, Brocklehurst et al. 2009). This process becomes even easier if specially printed textured cloth patterns are used (White and Forsyth 2006; White, Crane, and Forsyth 2007).

The deformations induced in a regular pattern when it is viewed in the reflection of a curved mirror, as shown in Figure 13.5c–d, can be used to recover the shape of the surface (Savarese, Chen, and Perona 2005; Rozenfeld, Shimshoni, and Lindenbaum 2011). It is also possible to infer local shape information from specular flow, i.e., the motion of specularities when viewed from a moving camera (Oren and Nayar 1997; Zisserman, Giblin, and Blake 1989; Swaminathan, Kang et al. 2002).

## 13.1.3 Shape from focus

A strong cue for object depth is the amount of blur, which increases as the object’s surface moves away from the camera’s focusing distance. As shown in Figure 2.19, moving the object surface away from the focus plane increases the circle of confusion, according to a formula that is easy to establish using similar triangles (Exercise 2.4).

A number of techniques have been developed to estimate depth from the amount of defocus (depth from defocus) (Pentland 1987; Nayar and Nakagawa 1994; Nayar, Watanabe, and Noguchi 1996; Watanabe and Nayar 1998; Chaudhuri and Rajagopalan 1999; Favaro and Soatto 2006). To make such a technique practical, a number of issues need to be addressed:

- The amount of blur increase in both directions as you move away from the focus plane. Therefore, it is necessary to use two or more images captured with different focus distance settings (Pentland 1987; Nayar, Watanabe, and Noguchi 1996) or to translate the object in depth and look for the point of maximum sharpness (Nayar and Nakagawa 1994).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/adc8562c86183604b4c80e9ad56445bd786817d23a3170e7dddbddc65c4f259c.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/e27a5a8e8a0e41646213f064b390d71c26b32ce3e8ea97cdb6f3ad3321b9c180.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/6f4d2bf452ef667f7fc2764cc313dd058f3f5c472c08b3a2ba9e6e451df6e546.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/844f05ec6f5f35eac136ad7f9a190c621feee401bad74ddd1f41cbb2d24a7c0d.jpg)  
(d)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/5af7ccc8920b9c31bba421e1a0707c860ed18e8e7f3243f9b1d7b8b36b943ef8.jpg)  
(e)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/8695ab4a53786b3e51a32474a2ce5fa7374f3bf4228da7ab9895a06323f1e176.jpg)  
(f)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/e847d51f0a3bdfdc3506abad5e6e5d08ea943c82775787ac172bee74a8c77a7a.jpg)  
(g)  
Figure 13.6 Real-time depth from defocus (Nayar, Watanabe, and Noguchi 1996) © 1996 IEEE: (a) the real-time focus range sensor, which includes a half-silvered mirror between the two telecentric lenses (lower right), a prism that splits the image into two CCD sensors (lower left), and an edged checkerboard pattern illuminated by a Xenon lamp (top); (b–c) input video frames from the two cameras along with (d) the corresponding depth map; (e–f) two frames (you can see the texture if you zoom in) and (g) the corresponding 3D mesh model.

- The magnification of the object can vary as the focus distance is changed or the object is moved. This can be modeled either explicitly (making correspondence more difficult) or using telecentric optics, which approximate an orthographic camera and require an aperture in front of the lens (Nayar, Watanabe, and Noguchi 1996).

- The amount of defocus must be reliably estimated. A simple approach is to average the squared gradient in a region, but this suffers from several problems, including the image magnification problem mentioned above. A better solution is to use carefully designed rational filters (Watanabe and Nayar 1998).

Figure 13.6 shows an example of a real-time depth from defocus sensor, which employs two imaging chips at slightly different depths sharing a common optical path, as well as an active illumination system that projects a checkerboard pattern from the same direction. As you can see in Figure 13.6b–g, the system produces high-accuracy real-time depth maps for both static and dynamic scenes.

![Figure 13.7](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/73b773b89d9a297324bc1d6ce3f9f694255efb3ee828ca5a438e41cbbf86e3d5.jpg)  
Figure 13.7 Range data scanning (Curless and Levoy 1996) © 1996 ACM: (a) a laser dot on a surface is imaged by a CCD sensor; (b) a laser stripe (sheet) is imaged by the sensor (the deformation of the stripe encodes the distance to the object); (c) the resulting set of 3D points are turned into (d) a triangulated mesh.

## 13.2 3D scanning

As we have seen in the previous section, actively lighting a scene, whether for the purpose of estimating normals using photometric stereo, or for adding artificial texture for shape from defocus, can greatly improve the performance of vision systems. This kind of active illumination has been used from the earliest days of machine vision to construct highly precise sensors for estimating 3D depth images using a variety of rangefinding (or range sensing) techniques (Besl 1989; Curless 1999; Hebert 2000; Zhang 2018).<sup>3</sup> While rangefinders such as lidar (Light Detection and Ranging) and laser-based 3D scanners were once limited to commercial and laboratory applications, the development of low-cost depth cameras such as the Microsoft Kinect (Zhang 2012) have revolutionized many aspects of computer vision. It is now common to refer to the registered color and depth frames produced by such cameras as RGB-D (or RGBD) images (Silberman, Hoiem et al. 2012).

One of the early active illumination sensors used in computer vision and computer graph ics was a laser or light stripe sensor, which sweeps a plane of light across the scene or object while observing it from an offset viewpoint, as shown in Figure 13.7b (Rioux and Bird 1993; Curless and Levoy 1995). As the stripe falls across the object, it deforms its shape according to the shape of the surface it is illuminating. It is then a simple matter of using optical triangulation to estimate the 3D locations of all the points seen in a particular stripe. In more detail, knowledge of the 3D plane equation of the light stripe allows us to infer the 3D location corresponding to each illuminated pixel, as previously discussed in (2.70–2.71). The accuracy of light striping techniques can be improved by finding the exact temporal peak in illumination for each pixel (Curless and Levoy 1995). The final accuracy of a scanner can be determined using slant edge modulation techniques, i.e., by imaging sharp creases in a calibration object (Goesele, Fuchs, and Seidel 2003).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/15f4a70476b6b0515e406210abb8b316bdfea2b6d5115fc523307fa006d174e0.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/0c874a15a5c48010ec450e363ed670c3e045e3f0cf0d32af7b4e658a72d39e35.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/2a8809594da6c321e73017a1cbeb979761d5829669dbb3e91cd036c6f7fde596.jpg)  
(c)  
Figure 13.8 Shape scanning using cast shadows (Bouguet and Perona 1999) © 1999 Springer: (a) camera setup with a point light source (a desk lamp without its reflector), a hand-held stick casting a shadow, and (b) the objects being scanned in front of two planar backgrounds. (c) Real-time depth map using a pulsed illumination system (Iddan and Yahav 2001) © 2001 SPIE.

An interesting variant on light stripe rangefinding is presented by Bouguet and Perona (1999). Instead of projecting a light stripe, they simply wave a stick casting a shadow over a scene or object illuminated by a point light source such as a lamp or the Sun (Figure 13.8a). As the shadow falls across two background planes whose orientation relative to the camera is known (or inferred during pre-calibration), the plane equation for each stripe can be inferred from the two projected lines, whose 3D equations are known (Figure 13.8b). The deformation of the shadow as it crosses the object being scanned then reveals its 3D shape, as with regular light stripe rangefinding (Exercise 13.2). This technique can also be used to estimate the 3D geometry of a background scene and how its appearance varies as it moves into shadow, to cast new shadows onto the scene (Chuang, Goldman et al. 2003) (Section 10.4.3).

The time it takes to scan an object using a light stripe technique is proportional to the number of depth planes used, which is usually comparable to the number of pixels across an image. A much faster scanner can be constructed by turning different projector pixels on and off in a structured manner, e.g., using a binary or Gray code (Besl 1989). For example, let us assume that the LCD projector we are using has 1,024 columns of pixels. Taking the 10-bit binary code corresponding to each column’s address (0...1,023), we project the first bit, then the second, etc. After 10 projections (e.g., a third of a second for a synchronized 30Hz camera-projector system), each pixel in the camera knows which of the 1,024 columns of projector light it is seeing. A similar approach can also be used to estimate the refractive properties of an object by placing a monitor behind the object (Zongker, Werner et al. 1999; Chuang, Zongker et al. 2000) (Section 14.4). Very fast scanners can also be constructed with a single laser beam, i.e., a real-time flying spot optical triangulation scanner (Rioux, Bechthold et al. 1987).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/c768bfac94e3ab82d100f032441b6d871b37727ce75ec4927398b2971378764b.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/67fc31bda0da514a38deaf7e2c18714f2d81c7bf779099f58041086f695174a3.jpg)

(b)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/429052d11687f31ddea3c11d698770bf9f20302271962495c2ec64a79f4bbcb0.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/013d0357c049828ade413b7a288c108c8a0842967fec17a9525f399a9ff81be4.jpg)  
(c)  
Figure 13.9 The Microsoft Kinect depth camera (Zhang 2012) © 2012 IEEE: (a) the hardware, comprising an infrared (IR) speckle pattern projector and a color and IR camera pair; (b) close-up of a sample infrared image, showing the projected dots; (c) the final depth map, which has black “shadows” in the areas not illuminated by the projector.

If even faster, i.e., frame-rate, scanning is required, we can project a single textured pattern into the scene. Proesmans, Van Gool, and Defoort (1998) describe a system where a checkerboard grid is projected onto an object and the deformation of the grid is used to infer 3D shape. Unfortunately, such a technique only works if the surface is continuous enough to link all of the grid points. Instead of projecting a grid, it is also possible to project one or more sinusoidal fringe patterns and to then recover deformations in the surface from the relative phase displacements using a process called fringe projection profilometry (Su and Zhang 2010; Zuo, Huang et al. 2016; Zhang 2018).

The Microsoft Kinect (Zhang 2012) depth camera uses a variant of this technique, projecting an infrared (IR) speckle pattern, which looks like a bunch of random dots, but which in fact consists of a known calibrated pseudo-random pattern (Figure 13.9). By measuring the horizontal displacement (parallax) between the dots seen in the IR camera and their expected locations, a depth map can be computed, interpolating over the pixels not illuminated by the dots (Fanello, Rhemann et al. 2016; Fanello, Valentin et al. 2017b). Since its release, the Kinect camera has been widely used in computer vision research (Zhang 2012; Han, Shao et al. 2013), as well as applications such as 3D body tracking (Section 13.6.4) and object scanning and home interior reconstruction (Section 13.2.1). Kinect sensors were used to create the first widely used dataset for 3D semantic scene understanding (Silberman, Hoiem et al. 2012), although larger 3D scanned datasets have since been created (Dai, Chang et al. 2017).

A higher resolution system can be constructed using high-speed custom illumination and sensing hardware. Iddan and Yahav (2001) describe the construction of their 3DV Zcam video-rate depth sensing camera, which projects a pulsed plane of light onto the scene and then integrates the returning light for a short interval, essentially obtaining time-of-flight measurement for the distance to individual pixels in the scene. A good description of earlier time-of-flight systems, including amplitude and frequency modulation schemes for lidar, can be found in (Besl 1989), and a more recent description can be found in the book by Hansard, Lee et al. (2012). While the initial version of the Microsoft Kinect depth camera used a speckle pattern structured light system (Zhang 2012), the newer Kinect V2 uses a time-of-flight (ToF) sensor that uses phase measurements of amplitude-modulated light signals (Bamji, O’Connor et al. 2014). Traditional multi-frequency phase unwrapping techniques can be used to estimate absolute depth, but more accurate depths for dynamic scenes can be obtained by simultaneously modeling depths and object velocities (Stuhmer, Nowozin¨ et al. 2015).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/c181c0d4b76be40044e5a8cebd8a0f066ab95e744fd0bd22bf94756b9d6d8c1a.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/d7eebad99801e7e732799884373fc1f878fa8f964748a0304b71be75b966180b.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/5f1b212b7c83164d50e54e747c81c2b56099f036f805acfda6765007d9cdfbfc.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/7d1e04320a438ee3ad3edbace2b436f7b1e4d1af9e4edc975611afbdb5963548.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/8e08807ae4a532d63b6a2ebff17f83aaadc027b8e33b3ca1c43a5b9d0ed398c5.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/0c0ec5ddd0923a09b8ff6ba934bc589b09ad8c41354a699d937fc71e5c8ccae4.jpg)  
(b)  
Figure 13.10 Real-time dense 3D face capture using spacetime stereo (Zhang, Snavely et al. 2004) © 2004 ACM: (a) set of five consecutive video frames from one of two stereo cameras (every fifth frame is free of stripe patterns, in order to extract texture); (b) resulting high-quality 3D surface model (depth map visualized as a shaded rendering).

Instead of using a single camera, it is also possible to construct an active illumination range sensor using stereo imaging setups, resulting in a system that is often called active (illumination) stereo. The simplest way to do this is to just project random stripe patterns onto the scene to create synthetic texture, which helps match textureless surfaces (Kang, Webb et al. 1995). Projecting a known series of stripes, just as in coded pattern single-camera rangefinding, makes the correspondence between pixels unambiguous and allows for the recovery of depth estimates at pixels only seen in a single camera (Scharstein and Szeliski 2003). This technique has been used to produce large numbers of highly accurate registered multi-image stereo pairs and depth maps for the purpose of evaluating stereo correspondence algorithms (Scharstein and Szeliski 2002; Hirschmuller and Scharstein¨ 2009; Scharstein, Hirschmuller¨ et al. 2014) and learning depth map priors and parameters (Pal, Weinman et al. 2012). Carefully designed algorithms can perform local matching of patterns at 500Hz (Fanello, Valentin

et al. 2017a,b).

While projecting multiple patterns usually requires the scene or object to remain still, additional processing can enable the production of real-time depth maps for dynamic scenes. The basic idea (Davis, Ramamoorthi, and Rusinkiewicz 2003; Zhang, Curless, and Seitz 2003) is to assume that depth is nearly constant within a 3D space–time window around each pixel and to use the 3D window for matching and reconstruction. Depending on the surface shape and motion, this assumption may be error-prone, as shown in Davis, Nahab et al. (2005). To model shapes more accurately, Zhang, Curless, and Seitz (2003) model the linear disparity variation within the space–time window and show that better results can be obtained by globally optimizing disparity and disparity gradient estimates over video volumes (Zhang, Snavely et al. 2004). Figure 13.10 shows the results of applying this system to a person’s face; the frame-rate 3D surface model can then be used for further model-based fitting and computer graphics manipulation (Section 13.6.2). As mentioned previously, motion modeling can also be applied to phase-based time-of-flight sensors (Stuhmer, Nowozin¨ et al. 2015).

One word of caution about active range sensing. When the surfaces being scanned are too reflective, the camera may see a reflection off the object’s surface and assume that this virtual image is the true scene. For surfaces with moderate amounts of reflection, such as the ceramic models in Wood, Azuma et al. (2000) or the Corn Cho puffs in Park, Newcombe, and Seitz (2018), there is still sufficient diffuse reflection under the specular layer to obtain a 3D range map. (The specular part can then be recovered separately to produce a surface light field, as described in Section 14.3.2.) However, for true mirrors, active range scanners will invariably capture the virtual 3D model seen reflected in the mirror, so that additional techniques such as looking for a reflection of the scanning device must be used (Whelan, Goesele et al. 2018).

## 13.2.1 Range data merging

While individual range images can be useful for applications such as real-time z-keying or fa cial motion capture, they are often used as building blocks for more complete 3D object modeling. In such applications, the next two steps in processing are the registration (alignment) of partial 3D surface models and their integration into coherent 3D surfaces (Curless 1999). If desired, this can be followed by a model fitting stage using either parametric representations such as generalized cylinders (Agin and Binford 1976; Nevatia and Binford 1977; Marr and Nishihara 1978; Brooks 1981), superquadrics (Pentland 1986; Solina and Bajcsy 1990; Terzopoulos and Metaxas 1991), or non-parametric models such as triangular meshes (Boissonat 1984) or physically based models (Terzopoulos, Witkin, and Kass 1988; Delingette, Hebert, and Ikeuichi 1992; Terzopoulos and Metaxas 1991; McInerney and Terzopoulos 1993; Terzopoulos 1999). A number of techniques have also been developed for segmenting range images into simpler constituent surfaces (Hoover, Jean-Baptiste et al. 1996).

The most widely used 3D registration technique is the iterative closest point (ICP) algorithm, which alternates between finding the closest point matches between the two surfaces being aligned and then solving a 3D absolute orientation problem (Section 8.1.5, (8.31– 8.32) (Besl and McKay 1992; Chen and Medioni 1992; Zhang 1994; Szeliski and Lavallee´ 1996; Gold, Rangarajan et al. 1998; David, DeMenthon et al. 2004; Li and Hartley 2007; Enqvist, Josephson, and Kahl 2009). Some techniques, such as the one developed by Chen and Medioni (1992), use local surface tangent planes to make this computation more accurate and to accelerate convergence. More recently, Rusinkiewicz (2019) proposed a symmetric oriented point distance similar to the energy terms used in oriented particles (Szeliski and Tonnesen 1992). A nice review of ICP and its related variants can be found in the papers by Tam, Cheng et al. (2012) and Pomerleau, Colas, and Siegwart (2015).

As the two surfaces being aligned usually only have partial overlap and may also have outliers, robust matching criteria (Section 8.1.4 and Appendix B.3) are typically used. To speed up the determination of the closest point, and also to make the distance-to-surface computation more accurate, one of the two point sets (e.g., the current merged model) can be converted into a signed distance function, optionally represented using an octree spline for compactness (Lavallee and Szeliski´ 1995). Variants on the basic ICP algorithm can be used to register 3D point sets under non-rigid deformations, e.g., for medical applications (Feldmar and Ayache 1996; Szeliski and Lavallee´ 1996). Color values associated with the points or range measurements can also be used as part of the registration process to improve robustness (Johnson and Kang 1997; Pulli 1999).

Unfortunately, the ICP algorithm and its variants can only find a locally optimal alignment between 3D surfaces. If this is not known a priori, more global correspondence or search techniques, based on local descriptors invariant to 3D rigid transformations, need to be used. An example of such a descriptor is the spin image, which is a local circular projection of a 3D surface patch around the local normal axis (Johnson and Hebert 1999). Another (earlier) example is the splash representation introduced by Stein and Medioni (1992). More recent work along these lines studies the problem of pose estimation (Section 11.2) from RGB-D images, which is essentially the same problem as aligning a range map to a 3D model. Recent papers on this topic (Drost, Ulrich et al. 2010; Brachmann, Michel et al. 2016; Vidal, Lin et al. 2018) typically evaluate themselves on the Benchmark for 6DOF Object Pose Estimation,<sup>4</sup> which also hosts a series of yearly workshops on this topic.

Once two or more 3D surfaces have been aligned, they can be merged into a single model. One approach is to represent each surface using a triangulated mesh and combine these meshes using a process that is sometimes called zippering (Soucy and Laurendeau 1992; Turk and Levoy 1994). Another, now more widely used, approach is to compute a (truncated) signed distance function that fits all of the 3D data points (Hoppe, DeRose et al. 1992; Curless and Levoy 1996; Hilton, Stoddart et al. 1996; Wheeler, Sato, and Ikeuchi 1998).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/efe88b3aa73b6b2e68d8ef6ce1791e51753c936f76c9442b204da820b40b91c2.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/6c8c5ce017a474d94616252e73257e3927e631350fa6824712c28717832a03d2.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/57ff72a29f039f609553b6a2c855389e450c4adc7e150656bf28007abe4c5c75.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/3e48b7f8b5d5177681261258cf44b8647af3c43e2163fcb7b8051152eeab1c83.jpg)  
(b)  
Figure 13.11 Range data merging (Curless and Levoy 1996) © 1996 ACM: (a) two signed distance functions (top left) are merged with their (weights) bottom left to produce a combined set of functions (right column) from which an isosurface can be extracted (green dashed line); (b) the signed distance functions are combined with empty and unseen space labels to fill holes in the isosurface.

Figure 13.11 shows one such approach, the volumetric range image processing (VRIP) technique developed by Curless and Levoy (1996), which first computes a weighted signed distance function from each range image and then merges them using a weighted averaging process. To make the representation more compact, run-length coding is used to encode the empty, seen, and varying (signed distance) voxels, and only the signed distance values near each surface are stored.<sup>5</sup> Once the merged signed distance function has been computed, a zero-crossing surface extraction algorithm, such as marching cubes (Lorensen and Cline 1987), can be used to recover a meshed surface model. Figure 13.12 shows an example of the complete range data merging and isosurface extraction pipeline. Rusinkiewicz, Hall-Holt, and Levoy (2002) present a real-time system that combines fast ICP and point-based merging and rendering.

The advent of consumer-level RGB-D cameras such as Kinect created renewed interest in large-scale range data registration and merging (Zhang 2012; Han, Shao et al. 2013). An influential paper in this area is Kinect Fusion (Izadi, Kim et al. 2011; Newcombe, Izadi et al. 2011), which combines an ICP-like SLAM technique called DTAM (Newcombe, Lovegrove, and Davison 2011) with real-time TSDF (truncated signed distance function) volumetric integration, which is described in more detail in Section 13.5.1. Follow-on papers include Elastic Fragments for non-rigid alignment (Zhou, Miller, and Koltun 2013), Octomap (Hornung, Wurm et al. 2013), which uses an octree and probabilistic occupancy, and Voxel Hashing (Nießner, Zollhofer¨ et al. 2013) and Chisel (Klingensmith, Dryanovski et al. 2015), both of which uses spatial hashing to compress the TSDF. KinectFusion has also been extended to handle highly variable scanning resolution (Fuhrmann and Goesele 2011, 2014), dynamic scenes (DynamicFusion (Newcombe, Fox, and Seitz 2015), VolumeDeform (Innmann, Zollhofer ¨ et al. 2016), and Motion2Fusion (Dou, Davidson et al. 2017)), to use non-rigid surface deformations for global model refinement (ElasticFusion: Whelan, Salas-Moreno et al. (2016)), to produce a globally consistent BundleFusion model (Dai, Nießner et al. 2017), and to use a deep network to perform the non-rigid matching (Boziˇ c, Zollhˇ ofer¨ et al. 2020). More details on these and other techniques for constructing 3D models from RGB-D scans can be found in the survey by Zollhofer, Stotko¨ et al. (2018).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/74bd087bd657c6b6e4c5345148ceda650429f81aa400e465fbd70ee6e34e2dfd.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/1abe5bc5ab3d57b559d2fc9748773c639fb83e0d8f4d04d2a2ae831c41258d7b.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/4a2fb18aa3dae58ea9f0aeeaa4b71eedb9c082dbe396d4d1f6fc6866074b77aa.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/f4f15e8510a12863937f0e74d58336f5a6c79e269987e35bac07fe3622611ef3.jpg)  
(d)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/f7ef24910bc6b43ad2710c11ecd3a9eccfc07a9fb78e39fc5c37d4975474e766.jpg)  
(e)  
Figure 13.12 Reconstruction and hardcopy of the “Happy Buddha” statuette (Curless and Levoy 1996) © 1996 ACM: (a) photograph of the original statue after spray painting with matte gray; (b) partial range scan; (c) merged range scans; (d) colored rendering of the reconstructed model; (e) hardcopy of the model constructed using stereolithography.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/4b66c405bfb12bc94b74c0e07a527c82fa738a0f5733214e747ab5e327881ef2.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/c5d13f8f4a14e834915dadb2d1a216393360596b85d96501fd38a6ebdb5f2969.jpg)

![Figure 13.13](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/98e80e8b120c51b9857107dafd63972756c7f1f873dfd7b1e5d22a5d38629e66.jpg)  
Figure 13.13 Fusing multiple depth images using the KinectFusion real-time system (Newcombe, Izadi et al. 2011) © 2011 IEEE. The three images show an original (noisy) range scan, rendered as a colored normal map, and the fused 3D model, rendered as both a normal map and Phong-shaded.

Some of the most recent work in range data merging uses neural networks to represent the TSDF (Park, Florence et al. 2019), update a TSDF with incoming range data scans (Weder, Schonberger et al. 2020, 2021), or provide local priors (Chabra, Lenssen et al. 2020). Range data merging techniques are often used for both 3D object scanning and for visual map building and navigation (RGB-D SLAM), which we discussed in Section 11.5. And now that depth sensing (aka lidar) technology is starting to appear in mobile phones, it can be used to build complete texture-mapped 3D room models, e.g., using Occipital’s Canvas app (Stein 2020).<sup>6</sup>

Volumetric range data merging techniques based on signed distance or characteristic (inside–outside) functions are also widely used to extract smooth well-behaved surfaces from oriented or unoriented point sets (Hoppe, DeRose et al. 1992; Ohtake, Belyaev et al. 2003; Kazhdan, Bolitho, and Hoppe 2006; Lempitsky and Boykov 2007; Zach, Pock, and Bischof 2007b; Zach 2008), as discussed in more detail in Section 13.5.1 and the survey paper by Berger, Tagliasacchi et al. (2017).

## 13.2.2 Application: Digital heritage

Active rangefinding technologies, combined with surface modeling and appearance modeling techniques (Section 13.7), are widely used in the fields of archaeological and historical preservation, which often also goes under the name digital heritage (MacDonald 2006). In such applications, detailed 3D models of cultural objects are acquired and later used for applications such as analysis, preservation, restoration, and the production of duplicate artwork (Rioux and Bird 1993).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/aff2906ae655d782718528abd5e22a6e7b0e39f6a29318fc435bad39d8e2ab1d.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/07a34abad95252a6259f39b812bfded12bcecc09cf912c7c921b0f80b0305dce.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/5adcc05c6fb687807c091242afce4d12c46a4a3904f9022701d13d248c91ab3f.jpg)  
(c)  
Figure 13.14 Laser range modeling of the Bayon temple at Angkor-Thom (Banno, Masuda et al. 2008) © 2008 Springer: (a) sample photograph from the site; (b) a detailed head model scanned from the ground; (c) final merged 3D model of the temple scanned using a laser range sensor mounted on a balloon.

A notable example of such an endeavor is the Digital Michelangelo project of Levoy, Pulli et al. (2000), which used Cyberware laser stripe scanners and high-quality digital SLR cameras mounted on a large gantry to obtain detailed scans of Michelangelo’s David and other sculptures in Florence. The project also took scans of the Forma Urbis Romae, an ancient stone map of Rome that had shattered into pieces, for which new matches were obtained using digital techniques. The whole process, from initial planning, to software development, acquisition, and post-processing, took several years (and many volunteers), and produced a wealth of 3D shape and appearance modeling techniques as a result.

Even larger-scale projects have since been attempted, for example, the scanning of complete temple sites such as Angkor-Thom (Ikeuchi and Sato 2001; Ikeuchi and Miyazaki 2007; Banno, Masuda et al. 2008). Figure 13.14 shows details from this project, including a sample photograph, a detailed 3D (sculptural) head model scanned from ground level, and an aerial overview of the final merged 3D site model, which was acquired using a balloon.

## 13.3 Surface representations

In previous sections, we have seen different representations being used to integrate 3D range scans. We now look at several of these representations in more detail. Explicit surface representations, such as triangle meshes, splines (Farin 1992, 2002), and subdivision surfaces (Stollnitz, DeRose, and Salesin 1996; Zorin, Schroder, and Sweldens¨ 1996; Warren and Weimer 2001; Peters and Reif 2008), enable not only the creation of highly detailed models but also processing operations, such as interpolation (Section 13.3.1), fairing or smoothing, and decimation and simplification (Section 13.3.2). We also examine discrete point-based representations (Section 13.4) and volumetric representations (Section 13.5).

## 13.3.1 Surface interpolation

One of the most common operations on surfaces is their reconstruction from a set of sparse data constraints, i.e., scattered data interpolation, which we covered in Section 4.1. When formulating such problems, surfaces may be parameterized as height fields $f(\mathbf{x})$ , as 3D parametric surfaces $\mathbf{f} \left(\mathbf{x} \right)$ , or as non-parametric models such as collections of triangles.

In Section 4.2, we saw how two-dimensional function interpolation and approximation problems $\{d_{i}\} \to f(\mathbf{x})$ could be cast as energy minimization problems using regularization (4.18–4.23). Such problems can also specify the locations of discontinuities in the surface as well as local orientation constraints (Terzopoulos 1986b; Zhang, Dugas-Phocion et al. 2002).

One approach to solving such problems is to discretize both the surface and the energy on a discrete grid or mesh using finite element analysis (4.24–4.27) (Terzopoulos 1986b). Such problems can then be solved using sparse system solving techniques, such as multigrid (Briggs, Henson, and McCormick 2000) or hierarchically preconditioned conjugate gradient (Szeliski 2006b; Krishnan and Szeliski 2011; Krishnan, Fattal, and Szeliski 2013). The surface can also be represented using a hierarchical combination of multilevel B-splines (Lee, Wolberg, and Shin 1997).

An alternative approach is to use radial basis (or kernel) functions (Boult and Kender 1986; Nielson 1993), which we covered in Section 4.1.1. As we mentioned in that section, if we want the function $\mathbf{f} \left(\mathbf{x} \right)$ to exactly interpolate the data points, a dense linear system must be solved to determine the magnitude associated with each basis function (Boult and Kender 1986). It turns out that, for certain regularized problems, e.g., (4.18–4.21), there exist radial basis functions (kernels) that give the same results as a full analytical solution (Boult and Kender 1986). Unfortunately, because the dense system solving is cubic in the number of data points, basis function approaches can only be used for small problems such as featurebased image morphing (Beier and Neely 1992).

When a three-dimensional parametric surface is being modeled, the vector-valued function f in (4.18–4.27) encodes 3D coordinates $(x, y, z)$ on the surface and the domain $\mathbf{x} =$ $(s, t)$ encodes the surface parameterization. One example of such surfaces are symmetryseeking parametric models, which are elastically deformable versions of generalized cylinders<sup>7</sup> (Terzopoulos, Witkin, and Kass 1987). In these models, s is the parameter along the spine of the deformable tube and t is the parameter around the tube. A variety of smoothness and radial symmetry forces are used to constrain the model while it is fitted to image-based silhouette curves.

It is also possible to define non-parametric surface models, such as general triangulated meshes, and to equip such meshes (using finite element analysis) with both internal smoothness metrics and external data fitting metrics (Sander and Zucker 1990; Fua and Sander 1992; Delingette, Hebert, and Ikeuichi 1992; McInerney and Terzopoulos 1993). While most of these approaches assume a standard elastic deformation model, which uses quadratic internal smoothness terms, it is also possible to use sub-linear energy models to better preserve surface creases (Diebel, Thrun, and Brunig¨ 2006) or to use graph-convolutional neural networks (GCNNs) as an alternative to the update equations, as in Deep Active Surface Models (Wickramasinghe, Fua, and Knott 2021). Triangle meshes can also be augmented with either spline elements (Sullivan and Ponce 1998) or subdivision surfaces (Stollnitz, DeRose, and Salesin 1996; Zorin, Schroder, and Sweldens¨ 1996; Warren and Weimer 2001; Peters and Reif 2008) to produce surfaces with better smoothness control.

Both parametric and non-parametric surface models assume that the topology of the surface is known and fixed ahead of time. For more flexible surface modeling, we can either represent the surface as a collection of oriented points (Section 13.4) or use 3D implicit functions (Section 13.5.1), which can also be combined with elastic 3D surface models (McInerney and Terzopoulos 1993).

The field of surface reconstruction from unorganized point samples continues to advance rapidly, with more recent work addressing issues with data imperfections, as described in the survey by Berger, Tagliasacchi et al. (2017) .

## 13.3.2 Surface simplification

Once a triangle mesh has been created from 3D data, it is often desirable to create a hierarchy of mesh models, for example, to control the displayed level of detail (LOD) in a computer graphics application. (In essence, this is a 3D analog to image pyramids (Section 3.5).) One approach to doing this is to approximate a given mesh with one that has subdivision connectivity, over which a set of triangular wavelet coefficients can then be computed (Eck, DeRose et al. 1995). A more continuous approach is to use sequential edge collapse operations to go from the original fine-resolution mesh to a coarse base-level mesh (Hoppe 1996; Lee,

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/750a885a5e90983fe4b5bb15fa55f201fb510bb2a228462597d97872f62b31c6.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/837f55aee29a9472c7d083c1ae4ab656f83daa5e04752dc1aa4b9f9a78ebfa22.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/5d9ab021ad63c6944e1b4b1068dfd8d46c1f7bff02d58e524c06581f2228d64c.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/35c49ff4c113d247609b88582f72b9c68d381fb97a2d65441800482d99218843.jpg)  
(d)

Figure 13.15 Progressive mesh representation of an airplane model (Hoppe 1996) © 1996 ACM: (a) base mesh $M^{0}$ (150 faces); (b) mesh $M^{175}$ (500 faces); (c) mesh $M^{425}$ (1,000 faces); (d) original mesh $M = M^{n}$ (13,546 faces).  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/34b70132c3bf510b878b12540d629091e82ecb5a3d0f020162dd0ba4367ac713.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/c6838afac823e5cf276f9bbb322494f6c066cddeee2e43163b9c11560db564e6.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/a5792319c7ae048c785d8ef75681436a12d9e6fd998972f096cd16aabc2e0574.jpg)  
(c)  
Figure 13.16 Geometry images (Gu, Gortler, and Hoppe 2002) © 2002 ACM: (a) the 257 $\times 257$ geometry image defines a mesh over the surface; (b) the $5l2 \times 5l2$ normal map defines vertex normals; (c) final lit 3D model.

Sweldens et al. 1998). The resulting progressive mesh (PM) representation can be used to render the 3D model at arbitrary levels of detail, as shown in Figure 13.15. More recent papers on multiresolution geometric modeling can be found in the survey by Floater and Hormann (2005) and the collection of papers edited by Dodgson, Floater, and Sabin (2005).

## 13.3.3 Geometry images

While multi-resolution surface representations such as Eck, DeRose et al. (1995), Hoppe (1996), and Lee, Sweldens et al. (1998) support level of detail operations, they still consist of an irregular collection of triangles, which makes them more difficult to compress and store in a cache-efficient manner.

To make the triangulation completely regular (uniform and gridded), Gu, Gortler, and Hoppe (2002) describe how to create geometry images by cutting surface meshes along wellchosen lines and “flattening” the resulting representation into a square. Figure 13.16a shows the resulting $(x, y, z)$ values of the surface mesh mapped over the unit square, while Figure 13.16b shows the associated $(n_{x}, n_{y}, n_{z})$ normal map, i.e., the surface normals associated with each mesh vertex, which can be used to compensate for loss in visual fidelity if the original geometry image is heavily compressed.

## 13.4 Point-based representations

As we mentioned previously, triangle-based surface models assume that the topology (and often the rough shape) of the 3D model is known ahead of time. While it is possible to re-mesh a model as it is being deformed or fitted, a simpler solution is to dispense with an explicit triangle mesh altogether and to have triangle vertices behave as oriented points, or particles, or surface elements (surfels) (Szeliski and Tonnesen 1992).

To endow the resulting particle system with internal smoothness constraints, pairwise interaction potentials can be defined that approximate the equivalent elastic bending energies that would be obtained using local finite-element analysis.<sup>9</sup> Instead of defining the finite element neighborhood for each particle (vertex) ahead of time, a soft influence function is used to couple nearby particles. The resulting 3D model can change both topology and particle density as it evolves and can therefore be used to interpolate partial 3D data with holes (Szeliski, Tonnesen, and Terzopoulos 1993b). Discontinuities in both the surface orientation and crease curves can also be modeled (Szeliski, Tonnesen, and Terzopoulos 1993a).

To render the particle system as a continuous surface, local dynamic triangulation heuristics (Szeliski and Tonnesen 1992) or direct surface element splatting (Pfister, Zwicker et al. 2000) can be used. Another alternative is to first convert the point cloud into an implicit signed distance or inside–outside function, using either minimum signed distances to the oriented points (Hoppe, DeRose et al. 1992) or by interpolating a characteristic (inside–outside) function using radial basis functions (Turk and O’Brien 2002; Dinh, Turk, and Slabaugh 2002). Even greater precision over the implicit function fitting, including the ability to handle irregular point densities, can be obtained by computing a moving least squares (MLS) estimate of the signed distance function (Alexa, Behr et al. 2003; Pauly, Keiser et al. 2003), as shown in Figure 13.17. Further improvements can be obtained using local sphere fitting (Guennebaud and Gross 2007), faster and more accurate re-sampling (Guennebaud, Germann, and

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/258cb9c3ded9ce79a65ee77199866cd1fb507b6386316930d75d185cb585dc41.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/1bdecbc4df735f900d3753188653a8681dd83345bb68fb73306d6f190f637844.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/68c6b7baee3611eeda5ca992b4cbcbb313ff2ba8bbca2231e3411fc082fa5b2d.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/d4c5ee457c3a9405496fab429e554e4446512c9629de4e06abda7c1ff6d14681.jpg)  
(d)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/b2410760ac8bb67bd2cf718a1dc415f68433aaa3265e532b2e684f98358d215f.jpg)  
(e)  
Figure 13.17 Point-based surface modeling with moving least squares (MLS) (Pauly, Keiser et al. 2003) © 2003 ACM: (a) a set of points (black dots) is turned into an implicit inside–outside function (black curve); (b) the signed distance to the nearest oriented point can serve as an approximation to the inside–outside distance; (c) a set of oriented points with variable sampling density representing a 3D surface (head model); (d) local estimate of sampling density, which is used in the moving least squares; (e) reconstructed continuous 3D surface.

Gross 2008), and kernel regression to better tolerate outliers (Oztireli, Guennebaud, and Gross 2008).

The survey by Berger, Tagliasacchi et al. (2017) discusses more recent work on reconstructing smooth complete surfaces from point clouds. The SurfelMeshing paper by Schops, Sattler, and Pollefeys¨ (2020) presents an RGB-D SLAM system based on a variableresolution surfel representation that gets re-triangulated as more scans are integrated. Other recent approaches to 3D point clouds that use deep learning, mentioned previously in Section 5.5.1, are discussed in the survey by Guo, Wang et al. (2020). Even more recent algorithms to estimate better normals in 3D models are presented in Ben-Shabat and Gould (2020) and Zhu and Smith (2020).

## 13.5 Volumetric representations

A third alternative for modeling 3D surfaces is to construct 3D volumetric inside–outside functions. We have already seen examples of this in Section 12.7.2, where we looked at voxel coloring (Seitz and Dyer 1999), space carving (Kutulakos and Seitz 2000), and level set (Pons, Keriven, and Faugeras 2007) techniques for stereo matching, and Section 12.7.3, where we discussed using binary silhouette images to reconstruct volumes.

In this section, we look at continuous implicit (inside–outside) functions to represent 3D shape.

## 13.5.1 Implicit surfaces and level sets

While polyhedral and voxel-based representations can represent three-dimensional shapes to an arbitrary precision, they lack some of the intrinsic smoothness properties available with continuous implicit surfaces, which use an indicator function (or characteristic function) $F(x, y, z)$ to indicate which 3D points are inside $F(x, y, z) < 0$ or outside $F(x, y, z) > 0$ the object.

An early example of using implicit functions to model 3D objects in computer vision were superquadrics (Pentland 1986; Solina and Bajcsy 1990; Waithe and Ferrie 1991; Leonardis, Jaklic, and Solina ˇ 1997). To model a wider variety of shapes, superquadrics are usually combined with either rigid or non-rigid deformations (Terzopoulos and Metaxas 1991; Metaxas and Terzopoulos 2002). Superquadric models can either be fitted to range data or used directly for stereo matching.

A different kind of implicit shape model can be constructed by defining a signed distance function over a regular three-dimensional grid, optionally using an octree spline to represent this function more coarsely away from its surface (zero-set) (Lavallee and Szeliski´ 1995; Szeliski and Lavallee´ 1996; Frisken, Perry et al. 2000; Ohtake, Belyaev et al. 2003). We have already seen examples of signed distance functions being used to represent distance transforms (Section 3.3.3), level sets for 2D contour fitting and tracking (Section 7.3.2), volumetric stereo (Section 12.7.2), range data merging (Section 13.2.1), and point-based modeling (Section 13.4). The advantage of representing such functions directly on a grid is that it is quick and easy to look up distance function values for any $(x, y, z)$ location and also easy to extract the isosurface using the marching cubes algorithm (Lorensen and Cline 1987). The work of Ohtake, Belyaev et al. (2003) is particularly notable, as it allows for several distance functions to be used simultaneously and then combined locally to produce sharp features such as creases.

Poisson surface reconstruction (Kazhdan, Bolitho, and Hoppe 2006; Kazhdan and Hoppe 2013) uses a closely related volumetric function, namely a smoothed 0/1 inside–outside (characteristic or occupancy) function, which can be thought of as a clipped signed distance function. The gradients for this function are set to lie along oriented surface normals near known surface points and 0 elsewhere. The function itself is represented using a quadratic tensorproduct B-spline over an octree, which provides a compact representation with larger cells away from the surface or in regions of lower point density, and also admits the efficient solution of the related Poisson equations (4.24–4.27), e.g., Section 8.4.4 and Perez, Gangnet, and´ Blake (2003).

It is also possible to replace the quadratic penalties used in the Poisson equations with $L_{1}$ (total variation) constraints and still obtain a convex optimization problem, which can be solved using either continuous (Zach, Pock, and Bischof 2007b; Zach 2008) or discrete graph cut (Lempitsky and Boykov 2007) techniques.

![Figure 13.18](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/ad5b0f9c11a438bf582d01fa5caa47bdfbcdbcf5ea16a4b4dbed46e988dcf0b2.jpg)  
Figure 13.18 A Pixel-aligned Implicit Function (PIFu) network can recover a highresolution 3D textured model of a clothed human from a single input image (Saito, Huang et al. 2019) © 2019 IEEE.

Signed distance functions also play an integral role in level-set evolution equations (Sections 7.3.2 and 12.7.2), where the values of distance transforms on the mesh are updated as the surface evolves to fit multi-view stereo photoconsistency measures (Faugeras and Keriven 1998).

As with many other areas of computer vision, deep neural networks have started being applied to the construction and modeling of volumetric object representations. Some neural networks construct 3D surface or volumetric occupancy grid models from single images (Choy, Xu et al. 2016; Tatarchenko, Dosovitskiy, and Brox 2017; Groueix, Fisher et al. 2018; Richter and Roth 2018), although more recent experiments suggest that these networks may just be recognizing the general object category and doing a small amount of fitting (Tatarchenko, Richter et al. 2019). DeepSDFs (Park, Florence et al. 2019), IM-NET (Chen and Zhang 2019), Occupancy Networks (Mescheder, Oechsle et al. 2019), Deep Implicit Surface (DISN) networks (Xu, Wang et al. 2019), and UCLID-Net (Guillard, Remelli, and Fua 2020) train networks to transform continuous (x, y, z) inputs into signed distance or [0, 1] occupancy values and sometimes combine convolutional image encoders with MLPs to represent color and surface details (Oechsle, Mescheder et al. 2019), while MeshSDF can continuously transform SDFs into deformable meshes (Remelli, Lukoianov et al. 2020). All of these networks use latent codes to represent individual instances from a generic class (e.g., car or chair) from the ShapeNet dataset (Chang, Funkhouser et al. 2015), although they use the codes in a different part of the network (either in the input or through conditional batch normalization). This allows them to reconstruct 3D models from just a single image.

Pixel-aligned Implicit function (PIFu) networks combine fully convolutional image features with neural implicit functions to better preserve local shape and color details (Saito,

Huang et al. 2019; Saito, Simon et al. 2020). They are trained specifically on clothed humans and can hallucinate full 3D models from just a single color image (Figure 13.18). Neural Radiance Fields (NeRF) extend this to also use pixel ray directions as inputs and also output continuous valued opacities and radiance values, enabling ray-traced rendering of shiny 3D models constructed from multiple input images (Mildenhall, Srinivasan et al. 2020). This representation is related to Lumigraphs and Surface Light Fields, which we study in Section 14.3. Both of these systems are examples of neural rendering approaches to generating photorealistic novel views, which we discuss in more detail in Section 14.6.

To deal with larger (e.g., building-scale) scenes, Convolutional Occupancy Networks (Peng, Niemeyer et al. 2020) first retrieve local features from a 2D, multiplane, or 3D grid, and then use a trained MLP (fully connected network) to decode these into local occupancy volumes. Instead of modeling a complete 3D scene, Local Implicit Grid Representations (Jiang, Sud et al. 2020) model small local sub-volumes, allowing them to be used as a kind of prior for other shape reconstruction methods.

## 13.6 Model-based reconstruction

When we know something ahead of time about the objects we are trying to model, we can construct more detailed and reliable 3D models using specialized techniques and representations. For example, architecture is usually made up of large planar regions and other parametric forms (such as surfaces of revolution), usually oriented perpendicular to gravity and to each other (Section 13.6.1). Heads and faces can be represented using low-dimensional, nonrigid shape models, because the variability in shape and appearance of human faces, while extremely large, is still bounded (Section 13.6.2). Human bodies or parts, such as hands, form highly articulated structures, which can be represented using kinematic chains of piecewise rigid skeletal elements linked by joints (Section 13.6.4).

In this section, we highlight some of the main ideas, representations, and modeling algorithms used for these three cases. Additional details and references can be found in specialized conferences and workshops devoted to these topics, e.g., the International Conference on 3D Vision (3DV) and the IEEE International Conference on Automatic Face and Gesture Recognition (FG).

## 13.6.1 Architecture

Architectural modeling, especially from aerial photography, has been one of the longest studied problems in both photogrammetry and computer vision (Walker and Herman 1988). In the last two decades, the development of reliable image-based modeling techniques, as well as the prevalence of digital cameras and 3D computer games, has led to widespread deployment of such systems.

![Figure 13.19](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/7bbd67d0009a5a52024440a00c11926b35a6c66b48a7a7e82204046014a438d0.jpg)  
Figure 13.19 Interactive architectural modeling using the Fac¸ade system (Debevec, Taylor, and Malik 1996) © 1996 ACM: (a) input image with user-drawn edges shown in green; (b) shaded 3D solid model; (c) geometric primitives overlaid onto the input image; (d) final view-dependent, texture-mapped 3D model.

The work by Debevec, Taylor, and Malik (1996) was one of the earliest hybrid geometry and image-based modeling and rendering systems. Their Fac¸ade system combines an interactive image-guided geometric modeling tool with model-based (local plane plus parallax) stereo matching and view-dependent texture mapping. During the interactive photogrammetric modeling phase, the user selects block elements and aligns their edges with visible edges in the input images (Figure 13.19a). The system then automatically computes the dimensions and locations of the blocks along with the camera positions using constrained optimization (Figure 13.19b–c). This approach is intrinsically more reliable than general feature-based structure from motion, because it exploits the strong geometry available in the block primitives. Related work by Becker and Bove (1995), Horry, Anjyo, and Arai (1997), Criminisi, Reid, and Zisserman (2000), and Holynski, Geraghty et al. (2020) exploits similar information available from vanishing points. In the interactive, image-based modeling system of Sinha, Steedly et al. (2008), vanishing point directions are used to guide the user drawing of polygons, which are then automatically fitted to sparse 3D points recovered using structure from motion.

Once the rough geometry has been estimated, more detailed offset maps can be computed for each planar face using a local plane sweep, which Debevec, Taylor, and Malik (1996) call model-based stereo. Finally, during rendering, images from different viewpoints are warped and blended together as the camera moves around the scene, using a process (related to light field and Lumigraph rendering; see Section 14.3) called view-dependent texture mapping (Figure 13.19d).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/84365f63020d4e30d68ab22fe2c2f74640d4f8887565efaca8c0d86717c53e76.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/b070d32b5c961e899422787b036c67cf4dcf3aed51a6715a8298f7fa8603c0d8.jpg)  
(b)  
Figure 13.20 Interactive 3D modeling from panoramas (Shum, Han, and Szeliski 1998) © 1998 IEEE: (a) wide-angle view of a panorama with user-drawn vertical and horizontal (axis-aligned) lines; (b) single-view reconstruction of the corridors.

For interior modeling, instead of working with single pictures, it is more useful to work with panoramas, as you can see larger extents of walls and other structures. The 3D modeling system developed by Shum, Han, and Szeliski (1998) first constructs calibrated panoramas from multiple images (Section 11.4.2) and then has the user draw vertical and horizontal lines in the image to demarcate the boundaries of planar regions. The lines are initially used to establish an absolute rotation for each panorama and are later used (along with the inferred vertices and planes) to optimize the 3D structure, which can be recovered up to scale from one or more images (Figure 13.20). Recent advances in deep networks now make it possible to both automatically infer the lines and their junctions (Huang, Wang et al. 2018; Zhang, Li et al. 2019) and to build complete 3D wireframe models (Zhou, Qi, and Ma 2019; Zhou, Qi et al. 2019b). 360° high dynamic range panoramas can also be used for outdoor modeling, because they provide highly reliable estimates of relative camera orientations as well as vanishing point directions (Antone and Teller 2002; Teller, Antone et al. 2003).

While earlier image-based modeling systems required some user authoring, Werner and Zisserman (2002) present a fully automated line-based reconstruction system. As described in Section 11.4.8, they first detect lines and vanishing points and use them to calibrate the camera; then they establish line correspondences using both appearance matching and trifocal tensors, which enables them to reconstruct families of 3D line segments. They then generate plane hypotheses, using both co-planar 3D lines and a plane sweep (Section 12.1.2) based on cross-correlation scores evaluated at interest points. Intersections of planes are used to determine the extent of each plane, i.e., an initial coarse geometry, which is then refined with the addition of rectangular or wedge-shaped indentations and extrusions. Note that when top-down maps of the buildings being modeled are available, these can be used to further constrain the 3D modeling process (Robertson and Cipolla 2002, 2009). The idea of using matched 3D lines for estimating vanishing point directions and dominant planes is used in a number of fully automated image-based architectural modeling systems (Zebedin, Bauer et al. 2008; Micuˇ sˇ´ık and Koseckˇ a´ 2009; Furukawa, Curless et al. 2009b; Sinha, Steedly, and Szeliski 2009; Holynski, Geraghty et al. 2020) as well as SLAM systems (Zhou, Zou et al. 2015; Li, Yao et al. 2018; Yang and Scherer 2019). Figure 13.21 shows some of the processing stages in the system developed by Sinha, Steedly, and Szeliski (2009).

![Figure 13.21](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/d7276f0b851b0c5f6eea6beccf3f6e0ac62a6828e52aa616bcb1f3c94301e967.jpg)  
Figure 13.21 Automated architectural reconstruction using 3D lines and planes (Sinha, Steedly, and Szeliski 2009) © 2009 IEEE.

Another common characteristic of architecture is the repeated use of primitives such as windows, doors, and colonnades. Architectural modeling systems can be designed to search for such repeated elements and to use them as part of the structure inference process (Dick, Torr, and Cipolla 2004; Mueller, Zeng et al. 2007; Schindler, Krishnamurthy et al. 2008; Pauly, Mitra et al. 2008; Sinha, Steedly et al. 2008). The combination of structured elements such as parallel lines, junctions, and rectangles with full axis-aligned 3D models for the modeling of architectural environments has recently been called holistic 3D reconstruction. More details can be found in the recent tutorial by Zhou, Furukawa, and Ma (2019), workshop (Zhou, Furukawa et al. 2020), and state-of-the-art report by Pintore, Mura et al. (2020).

The combination of all these techniques now makes it possible to reconstruct the structure of large 3D scenes (Zhu and Kanade 2008). For example, the Urbanscan system of Pollefeys, Nister´ et al. (2008) reconstructs texture-mapped 3D models of city streets from videos acquired with a GPS-equipped vehicle. To obtain real-time performance, they use both optimized online structure-from-motion algorithms, as well as GPU implementations of plane-sweep stereo aligned to dominant planes and depth map fusion. Cornelis, Leibe et al. (2008) present a related system that also uses plane-sweep stereo (aligned to vertical building fac¸ades) combined with object recognition and segmentation for vehicles. Micuˇ sˇ´ık and Koseckˇ a´ (2009) build on these results using omni-directional images and superpixel-based stereo matching along dominant plane orientations. Reconstruction directly from active range scanning data combined with color imagery that has been compensated for exposure and lighting variations is also possible (Chen and Chen 2008; Stamos, Liu et al. 2008; Troccoli and Allen 2008).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/86b3f30c4e7d923b66f463158432df9c7629bafc5d8d5a13b523f6ea90ab54d6.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/aff34097b7506b13af88fcc5d65d027c3efd3f48d45bf9917716a7032ac9d8d8.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/89a690f187568853640b6c4c1ad5319bea4e837c922ce55e03cd2136caf16d63.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/a3b0f0bbecc657a3eeac7f3f3f5dc5cd72c2255b09045932b1173d1f25b45def.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/729c78b555c69580d8cb16b43609f332448ab059d5de698c66ee8b7bf84cbf96.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/cd3b59a66993bf99197d671d4e28d4e04d48f33e7cb054a8a62d056d48567c8a.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/af0770939918de50f331e5c5490c6b09655166f119ca3c11b9b930e03af61bc4.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/c1542c29935aa13cf7f4a36c0f18e47feac5ecb854f17a1728471936d1c5d6a0.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/2bf5c73c994224734a5bdb884f369643015eb16458368b978c023405d994eb09.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/4f79c15d6f5688df867e9743870a53d762d2a83eee0cb6ebabf7ee5b111ff7c7.jpg)  
(d)  
Figure 13.22 3D model fitting to a collection of images: (Pighin, Hecker et al. 1998) © 1998 ACM: (a) set of five input images along with user-selected keypoints; (b) the complete set of keypoints and curves; (c) three meshes—the original, adapted after 13 keypoints, and after an additional 99 keypoints; (d) the partition of the image into separately animatable regions.

Numerous photogrammetric reconstruction systems that produce detailed texture-mapped 3D models have been developed based on these computer vision techniques.<sup>10</sup> Examples of commercial software that can be used to reconstruct large-scale 3D models from aerial drone and ground level photography include Pix4D,<sup>11</sup> Metashape,<sup>12</sup> and RealityCapture.<sup>13</sup> Another example is Occipital’s Canvas mobile phone app<sup>14</sup> (Stein 2020), which appears to use a combination of photogrammetry (3D point and line matching and reconstruction, as discussed above) and depth map fusion.

## 13.6.2 Facial modeling and tracking

Another area in which specialized shape and appearance models are extremely helpful is in the modeling of heads and faces. Even though the appearance of people seems at first glance to be infinitely variable, the actual shape of a person’s head and face can be described reasonably well using a few dozen parameters (Pighin, Hecker et al. 1998; Guenter, Grimm et al. 1998; DeCarlo, Metaxas, and Stone 1998; Blanz and Vetter 1999; Shan, Liu, and Zhang 2001; Zollhofer, Thies¨ et al. 2018; Egger, Smith et al. 2020).

Figure 13.22 shows an example of an image-based modeling system, where user-specified keypoints in several images are used to fit a generic head model to a person’s face. As you can see in Figure 13.22c, after specifying just over 100 keypoints, the shape of the face has become quite adapted and recognizable. Extracting a texture map from the original images and then applying it to the head model results in an animatable model with striking visual fidelity (Figure 13.23a).

A more powerful system can be built by applying principal component analysis (PCA) to a collection of 3D scanned faces, which is a topic we discuss in Section 13.6.3. As you can see in Figure 13.25, it is then possible to fit morphable 3D models to single images and to use such models for a variety of animation and visual effects (Blanz and Vetter 1999; Egger, Smith et al. 2020). It is also possible to design stereo matching algorithms that optimize directly for the head model parameters (Shan, Liu, and Zhang 2001; Kang and Jones 2002) or to use the output of real-time stereo with active illumination (Zhang, Snavely et al. 2004) (Figures 13.10 and 13.23b).

As the sophistication of 3D facial capture systems evolved, so did the detail and realism in the reconstructed models. Modern systems can capture (in real-time) not only surface details such as wrinkles and creases, but also accurate models of skin reflection, translucency, and sub-surface scattering (Debevec, Hawkins et al. 2000; Weyrich, Matusik et al. 2006; Golovinskiy, Matusik et al. 2006; Bickel, Botsch et al. 2007; Igarashi, Nishino, and Nayar 2007; Meka, Haene et al. 2019).

Once a 3D head model has been constructed, it can be used in a variety of applications, such as head tracking (Toyama 1998; Lepetit, Pilet, and Fua 2004; Matthews, Xiao, and Baker 2007), as shown in Figures 7.30 and face transfer, i.e., replacing one person’s face with another in a video (Bregler, Covell, and Slaney 1997; Vlasic, Brand et al. 2005). Additional applications include face beautification by warping face images toward a more attractive “standard” (Leyvand, Cohen-Or et al. 2008), face de-identification for privacy protection (Gross, Sweeney et al. 2008), and face swapping (Bitouk, Kumar et al. 2008).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/5ffd512bad1ddfabb0016ee0a9588838c6cf54730ab384f9109d91d6574e4317.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/63551bc24ef9cf134c9885972b1ff886ed2c62fe45934901eb9e498f2471a1aa.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/b22c57b1afd4d4cd83c341d9b0c1ae7688ae0a2d14a4413eca3bb90b1f8d0a26.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/cecad4e5ea38674f567baa532d380aa6f263984082e731a2d8776364123600fa.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/293ac23b2aa0f7fd5bc085350c3c04e3ec6a7087a39986bd82d0dc4d771d5bd7.jpg)  
(b)  
Figure 13.23 Head and expression tracking and re-animation using deformable 3D models. (a) Models fitted directly to five input video streams (Pighin, Szeliski, and Salesin 2002) © 2002 Springer: The bottom row shows the results of re-animating a synthetic texture-mapped 3D model with pose and expression parameters fitted to the input images in the top row. (b) Models fitted to frame-rate spacetime stereo surface models (Zhang, Snavely et al. 2004) © 2004 ACM: The top row shows the input images with synthetic green markers overlaid, while the bottom row shows the fitted 3D surface model.

More recent applications of 3D head models include photorealistic avatars for video conferencing (Chu, Ma et al. 2020), 3D unwarping for better selfies (Fried, Shechtman et al. 2016; Zhao, Huang et al. 2019; Ma, Lin et al. 2020), and single image portrait relighting (Sun, Barron et al. 2019; Zhou, Hadap et al. 2019; Zhang, Barron et al. 2020), an example of which is shown in Figure 13.24. This last application is available as the Portrait Light feature in Google Photos.<sup>15</sup> Additional applications can be found in the survey papers by Zollhofer,¨ Thies et al. (2018) and Egger, Smith et al. (2020).

## 13.6.3 Application: Facial animation

Perhaps the most widely used application of 3D head modeling is facial animation (Zollhofer,¨ Thies et al. 2018). Once a parameterized 3D model of the shape and appearance (surface texture) of a person’s head has been constructed, it can be used directly to track a person’s facial motions (Figure 13.23a) and to animate a different character with these same motions and expressions (Pighin, Szeliski, and Salesin 2002).

![Figure 13.24](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/e113f25ceb29fa60ba961d61f026f2d22a133e5629eaaf2fd7de8a960edb976a.jpg)  
Figure 13.24 Portrait shadow removal and manipulation (Zhang, Barron et al. 2020) © 2020 ACM. The top row shows the original photographs and the bottom row the corresponding enhanced photographs after more flattering lighting has been simulated.

An improved version of such a system can be constructed by first applying principal component analysis (PCA) to the space of possible head shapes and facial appearances. Blanz and Vetter (1999) describe a system where they first capture a set of 200 colored range scans of faces (Figure 13.25a), which can be represented as a large collection of (X, Y, Z, R, G, B) samples (vertices).<sup>16</sup> For 3D morphing to be meaningful, corresponding vertices in different people’s scans must first be put into correspondence (Pighin, Hecker et al. 1998). Once this is done, PCA can be applied to more naturally parameterize the 3D morphable model. The flexibility of this model can be increased by performing separate analyses in different subregions, such as the eyes, nose, and mouth, just as in modular eigenspaces (Moghaddam and Pentland 1997).

After computing a subspace representation, different directions in this space can be associated with different characteristics such as gender, facial expressions, or facial features (Figure 13.25a). As in the work of Rowland and Perrett (1995), faces can be turned into caricatures by exaggerating their displacement from the mean image.

3D morphable models can be fitted to a single image using gradient descent on the error between the input image and the re-synthesized model image, after an initial manual placement of the model in an approximately correct pose, scale, and location (Figures 13.25b–c). The efficiency of this fitting process can be increased using inverse compositional image

ORIGINAL

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/247637d00516f33f47453e0c7ab1ccc8ab90bc5c1c3a7774d6ec6500f0bcd1fc.jpg)

CARICATURE

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/6e88583ae03739d1a5448233d2d52231ad1a5317b108c5d742ef336e0312e009.jpg)

MORE MALE

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/324fa9d916164fe9005d7f03a01e937843a6a36912d10fb17c0c4d8576d21b49.jpg)  
SMILE

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/eec7f5e96c9982a6ea5b62a37546c168b64191a6d0785e4026033feb0b167179.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/bbb60fa20141c08f637007bfdc5873a668f7a8d2ec52cad660acc8be6c6fc8b3.jpg)

FEMALE

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/6606a3ad8e364ef163f8b206272490c5750e63911e7b468c12065b4d43fa4fe6.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/94158db651d38102bdf4b2adbb7e2525c9fc4dde9b06040a72ba6a7465692cd2.jpg)  
FROWN

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/a59fee51dd88a2bf1b3c21d59876656d07a72c7b919acc78ec7ef590febd7aa2.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/21893dfc09b92b7ba01d12045232b477cbd5afe4fe52c42d513011b7e3bb8220.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/8aa4244807ead10f56e3f1d9f8cc8e17a5befe6d2bb94b105a9e0f49a6e75e43.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/4e71971d7973a8749173387aa3cdd1d3da13ce788d89edfbeb2bb0132d904a90.jpg)  
WEIGHT  
HOOKED NOSE

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/1a98f38985e989472fe3c51c2e0329d8ef8091e6d49f329cc6af78aa18ff65c6.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/a31907904a4fb20516704e703ddce0ba6cdea969ff6eec18f92bcf506a7c225c.jpg)  
(b)

(a)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/e1484c02163d45aa0c4b22720cfa924040dc08bbb015cf3385d8042540576542.jpg)  
Original

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/b7ffc19d9e232fd651eecbf6a1167438258a58e0af1280a3a5f3349a99ddab03.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/c32f8364413beda05815ff9e3e8586e5bd96098af5a1b9991dcf90a069da1f75.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/d2e13e6b0db030970bcdbad8e81f2f85820755ccd92202add09c64db819a23a9.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/c2a6f483087bc936e53e47a8fe19a62d1a63f211f3e07741250d492c65d29d49.jpg)  
3D Reconstruction

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/8146942c04e384ed0d77033e2c8b11e120857a3957be6b4137c303d00fbeb836.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/97bc7032e7e071755777dbdbc6a9eff09af7c7484c0e2712f92579769e21cca4.jpg)  
Reconstruction of Shape & Texture

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/4f80da3fe9561865d9e97648600954cf6bbb8ddd8a2419ce6a6a3cb40d2bfa9f.jpg)  
Texture Extraction & Facial Expression

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/e08a7649e84c62dd845f8ca68bf7abd8a994aa599c757b2d6499525e3375459f.jpg)  
Cast Shadow

(c)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/19e4a37230a68cae7b57c9f31e6eb52600dda74ece80d207e9d0b64b79df2f63.jpg)  
New Illumination

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/05cc4998a3649218b163889d12b8d2b0a791919c50572aaf22d76c27a5035452.jpg)  
Rotation

Figure 13.25 3D morphable face model (Blanz and Vetter 1999) © 1999 ACM: (a) original 3D face model with the addition of shape and texture variations in specific directions: deviation from the mean (caricature), gender, expression, weight, and nose shape; (b) a 3D morphable model is fitted to a single image, after which its weight or expression can be manipulated; (c) another example of a 3D reconstruction along with a different set of 3D manipulations, such as lighting and pose change.

![Figure 13.26](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/e78cf5101a05958eaf60ccbde18f6d5584741ac46ff6b4a1d7fc7450a964be8a.jpg)  
Figure 13.26 A timeline of twenty years of 3D morphable head models (Egger, Smith et al. 2020) © 2020 ACM, including results from the original paper by Blanz and Vetter (1999), the first publicly available morphable model (Paysan, Knothe et al. 2009), facial re-enactment results (Kim, Garrido et al. 2018), and GAN-based models (Gecer, Ploumpis et al. 2019).

alignment (Baker and Matthews 2004) as described by Romdhani and Vetter (2003).

The resulting texture-mapped 3D model can then be modified to produce a variety of visual effects, including changing a person’s weight or expression, or three-dimensional effects such as re-lighting or 3D video-based animation (Section 14.5.1). Such models can also be used for video compression, e.g., by only transmitting a small number of facial expression and pose parameters to drive a synthetic avatar (Eisert, Wiegand, and Girod 2000; Gao, Chen et al. 2003; Lombardi, Saragih et al. 2018; Wei, Saragih et al. 2019) or to bring a still portrait image to life (Averbuch-Elor, Cohen-Or et al. 2017). The survey paper on 3D morphable face models by Egger, Smith et al. (2020) (Figure 13.26) discusses additional research and applications in this area.

3D facial animation is often matched to the performance of an actor, in what is known as performance-driven animation (Section 7.1.6) (Williams 1990). Traditional performancedriven animation systems use marker-based motion capture (Ma, Jones et al. 2008), while some newer systems use depth cameras or regular video to control the animation (Buck, Finkelstein et al. 2000; Pighin, Szeliski, and Salesin 2002; Zhang, Snavely et al. 2004; Vlasic, Brand et al. 2005; Weise, Bouaziz et al. 2011; Thies, Zollhofer et al. 2016; Thies, Zollhofer¨ et al. 2018).

An example of the latter approach is the system developed for the film The Curious Case of Benjamin Button, in which Digital Domain used the CONTOUR system from Mova<sup>17</sup> to capture actor Brad Pitt’s facial motions and expressions (Roble and Zafar 2009). CONTOUR uses a combination of phosphorescent paint and multiple high-resolution video cameras to capture real-time 3D range scans of the actor. These 3D models were then translated into Facial Action Coding System (FACS) shape and expression parameters (Ekman and Friesen 1978) to drive a different (older) synthetically animated computer-generated imagery (CGI)

character. More recent examples of performance-driven facial animation can be found in the state of the art report by Zollhofer, Thies ¨ et al. (2018).

## 13.6.4 Human body modeling and tracking

The topics of tracking humans, modeling their shape and appearance, and recognizing their activities, are some of the most actively studied areas of computer vision. Annual conferences<sup>18</sup> and special journal issues (Hilton, Fua, and Ronfard 2006) are devoted to this subject, and two surveys (Forsyth, Arikan et al. 2006; Moeslund, Hilton, and Kruger¨ 2006) each list over 400 papers devoted to these topics.<sup>19</sup> The HumanEva database of articulated human motions contains multi-view video sequences of human actions along with corresponding motion capture data, evaluation code, and a reference 3D tracker based on particle filtering. The companion paper by Sigal, Balan, and Black (2010) not only describes the database and evaluation but also has a nice survey of important work in this field. The more recent MPI FAUST dataset (Bogo, Romero et al. 2014) has 300 real, high-resolution human scans with automatically computed ground-truth correspondences, while the even newer AMASS dataset (Mahmood, Ghorbani et al. 2019) has more than 40 hours of motion data, spanning over 300 subjects and 11,000 motions.<sup>20</sup>

Given the breadth of this area, it is difficult to categorize all of this research, especially as different techniques usually build on each other. Moeslund, Hilton, and Kruger¨ (2006) divide their survey into initialization, tracking (which includes background modeling and segmentation), pose estimation, and action (activity) recognition. Forsyth, Arikan et al. (2006) divide their survey into sections on tracking (background subtraction, deformable templates, flow, and probabilistic models), recovering 3D pose from 2D observations, and data association and body parts. They also include a section on motion synthesis, which is more widely studied in computer graphics (Arikan and Forsyth 2002; Kovar, Gleicher, and Pighin 2002; Lee, Chai et al. 2002; Li, Wang, and Shum 2002; Pullen and Bregler 2002): see Section 14.5.2. Another potential taxonomy for work in this field would be along the lines of whether 2D or 3D (or multi-view) images are used as input and whether 2D or 3D kinematic models are used.

In this section, we briefly review some of the more seminal and widely cited papers in the areas of background subtraction, initialization and detection, tracking with flow, 3D kinematic models, probabilistic models, adaptive shape modeling, and activity recognition. We refer the reader to the previously mentioned surveys for other topics and more details.

Background subtraction. One of the first steps in many human tracking systems is to model the background to extract the moving foreground objects (silhouettes) corresponding to people. Toyama, Krumm et al. (1999) review several difference matting and background maintenance (modeling) techniques and provide a good introduction to this topic. Stauffer and Grimson (1999) describe some techniques based on mixture models, while Sidenbladh and Black (2003) develop a more comprehensive treatment, which models not only the background image statistics but also the appearance of the foreground objects, e.g., their edge and motion (frame difference) statistics. More recent techniques for video background matting, such as those of Sengupta, Jayaram et al. (2020) and Lin, Ryabtsev et al. (2021) are discussed in Section 10.4.5 on video matting.

Once silhouettes have been extracted from one or more cameras, they can then be modeled using deformable templates or other contour models (Baumberg and Hogg 1996; Wren, Azarbayejani et al. 1997). Tracking such silhouettes over time supports the analysis of multiple people moving around a scene, including building shape and appearance models and detecting if they are carrying objects (Haritaoglu, Harwood, and Davis 2000; Mittal and Davis 2003; Dimitrijevic, Lepetit, and Fua 2006).

Initialization and detection. To track people in a fully automated manner, it is necessary to first detect (or re-acquire) their presence in individual video frames. This topic is closely related to pedestrian detection, which is often considered as a kind of object recognition (Mori, Ren et al. 2004; Felzenszwalb and Huttenlocher 2005; Felzenszwalb, McAllester, and Ramanan 2008; Dollar, Wojek´ et al. 2012; Dollar, Appel´ et al. 2014; Sermanet, Kavukcuoglu et al. 2013; Ouyang and Wang 2013; Tian, Luo et al. 2015; Zhang, Lin et al. 2016), and is therefore treated in more depth in Section 6.3.2. Additional techniques for initializing 3D trackers based on 2D images include those described by Howe, Leventon, and Freeman (2000), Rosales and Sclaroff (2000), Shakhnarovich, Viola, and Darrell (2003), Sminchisescu, Kanaujia et al. (2005), Agarwal and Triggs (2006), Lee and Cohen (2006), Sigal and Black (2006b), and Stenger, Thayananthan et al. (2006).

Single-frame human detection and pose estimation algorithms can be used by themselves to perform tracking (Ramanan, Forsyth, and Zisserman 2005; Rogez, Rihan et al. 2008; Bourdev and Malik 2009; Guler, Neverova, and Kokkinos¨ 2018; Cao, Hidalgo et al. 2019), as described in Section 6.3.2 (Figure 6.25) and Section 6.4.5 (Figure 6.42–6.43). They are often combined, however, with frame-to-frame tracking techniques to provide better reliability (Fossati, Dimitrijevic et al. 2007; Andriluka, Roth, and Schiele 2008; Ferrari, Marin-Jimenez, and Zisserman 2008).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/17ac32a276fec962cbb513995563fd92505ac95589f7f96a844428bee775c5ce.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/1aa369b50c9861bd013f3303501a942104f34e421879960c7a7ea24f472bce09.jpg)

(b)  
![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/46143ef30a7828a91341362e14ae857afcedbbc4032871ddff3ff057b9f1f72a.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/9c38aaac5be9ab2c18bb368c82656f6ad6aa5e32abb597cdef5a50ea0567defe.jpg)  
(c)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/f08bfea4a3be8503964d6c97b79d96c347e82006d53f8f016233cbe5d5045737.jpg)  
(d)  
Figure 13.27 Tracking 3D human motion: (a) kinematic chain model for a human hand (Rehg, Morris, and Kanade 2003) © 2003, reprinted by permission of SAGE; (b) tracking a kinematic chain blob model in a video sequence (Bregler, Malik, and Pullen 2004) © 2004 Springer; (c–d) probabilistic loose-limbed collection of body parts (Sigal, Bhatia et al. 2004) © 2004 IEEE.

Tracking with flow. The tracking of people and their pose from frame to frame can be enhanced by computing optical flow or matching the appearance of their limbs from one frame to another. For example, the cardboard people model of Ju, Black, and Yacoob (1996) models the appearance of each leg portion (upper and lower) as a moving rectangle, and uses optical flow to estimate their location in each subsequent frame. Cham and Rehg (1999) and Sidenbladh, Black, and Fleet (2000) track limbs using optical flow and templates, along with techniques for dealing with multiple hypotheses and uncertainty. Bregler, Malik, and Pullen (2004) use a full 3D model of limb and body motion, as described below. It is also possible to match the estimated motion field itself to some prototypes in order to identify the particular phase of a running motion or to match two low-resolution video portions to perform video replacement (Efros, Berg et al. 2003). Flow-based tracking can also be used to track non-rigidly deforming objects such as T-shirts (White, Crane, and Forsyth 2007; Pilet, Lepetit, and Fua 2008; Furukawa and Ponce 2008; Salzmann and Fua 2010; Boziˇ c, Zollhˇ ofer¨ et al. 2020; Boziˇ c, Palafoxˇ et al. 2020, 2021). It is also possible to use inter-frame motion to estimate an evolving textured 3D mesh model of a moving person (de Aguiar, Stoll et al. 2008).

3D kinematic models. The effectiveness of human modeling and tracking can be greatly enhanced using a more accurate 3D model of a person’s shape and motion. Underlying such representations, which are ubiquitous in 3D computer animation in games and special effects, is a kinematic model or kinematic chain, which specifies the length of each limb in a skeleton as well as the 2D or 3D rotation angles between the limbs or segments (Figure 13.27a–b). Inferring the values of the joint angles from the locations of the visible surface points is called inverse kinematics (IK) and is widely studied in computer graphics.

Figure 13.27a shows the kinematic model for a human hand used by Rehg, Morris, and Kanade (2003) to track hand motion in a video. As you can see, the attachment points between the fingers and the thumb have two degrees of freedom, while the finger joints themselves have only one. Using this kind of model can greatly enhance the ability of an edge-based tracker to cope with rapid motion, ambiguities in 3D pose, and partial occlusions.

One of the biggest advances in reliable real-time hand tracking and modeling was the introduction of the Kinect consumer RGB-D camera (Sharp, Keskin et al. 2015; Taylor, Bordeaux et al. 2016), Since then, regular RGB tracking and modeling has also improved significantly, with newer techniques using neural networks for reliability and speed (Zimmermann and Brox 2017; Mueller, Bernard et al. 2018; Hasson, Varol et al. 2019; Shan, Geng et al. 2020; Moon, Shiratori, and Lee 2020; Moon, Yu et al. 2020; Spurr, Iqbal et al. 2020; Taheri, Ghorbani et al. 2020). Several systems also combine body and hand tracking to more accurately capture human expressions and activities (Romero, Tzionas, and Black 2017; Joo, Simon, and Sheikh 2018; Pavlakos, Choutas et al. 2019; Rong, Shiratori, and Joo 2020).

In addition to hands, kinematic chain models are even more widely used for whole body modeling and tracking (O’Rourke and Badler 1980; Hogg 1983; Rohr 1994). One popular approach is to associate an ellipsoid or superquadric with each rigid limb in the kinematic model, as shown in Figure 13.27b. This model can then be fitted to each frame in one or more video streams either by matching silhouettes extracted from known backgrounds or by matching and tracking the locations of occluding edges (Gavrila and Davis 1996; Kakadiaris and Metaxas 2000; Bregler, Malik, and Pullen 2004; Kehl and Van Gool 2006).

One of the big breakthroughs in real-time skeletal tracking was the introduction of the Kinect consumer depth camera for interactive video game control (Shotton, Fitzgibbon et al. 2011; Taylor, Shotton et al. 2012; Shotton, Girshick et al. 2013) as shown in Figure 13.28. In the current landscape of skeletal tracking, some techniques use 2D models coupled to 2D measurements, some use 3D measurements (range data or multi-view video) with 3D models (Baak, Mueller et al. 2011), and some use monocular video to infer and track 3D models directly (Mehta, Sridhar et al. 2017; Habermann, Xu et al. 2019).

It is also possible to use temporal models to improve the tracking of periodic motions, such as walking, by analyzing the joint angles as functions of time (Polana and Nelson 1997; Seitz and Dyer 1997; Cutler and Davis 2000). The generality and applicability of such techniques can be improved by learning typical motion patterns using principal component analysis (Sidenbladh, Black, and Fleet 2000; Urtasun, Fleet, and Fua 2006).

![Figure 13.28](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/cfb3e80dcf6850facb87906934ec93e5ebcfe572407ebc5e4236f87c6a9a8fff.jpg)  
Figure 13.28 The Kinect skeletal tracking pipeline, which consists of per-pixel body-part classification, body joint hypotheses, and then mapping to a skeleton using temporal continuity and prior knowledge (Shotton, Girshick et al. 2013). This figure is taken from (Zhang 2012) © 2012 IEEE.

Probabilistic models. Because tracking can be such a difficult task, sophisticated probabilistic inference techniques are often used to estimate the likely states of the person being tracked. One popular approach, called particle filtering (Isard and Blake 1998), was originally developed for tracking the outlines of people and hands, as described in Section 7.3.1. It was subsequently applied to whole-body tracking (Deutscher, Blake, and Reid 2000; Sidenbladh, Black, and Fleet 2000; Deutscher and Reid 2005) and continues to be used in modern trackers (Ong, Micilotta et al. 2006). Alternative approaches to handling the uncertainty inherent in tracking include multiple hypothesis tracking (Cham and Rehg 1999) and inflated covariances (Sminchisescu and Triggs 2001).

Figure 13.27c–d shows an example of a sophisticated spatio-temporal probabilistic graphical model called loose-limbed people, which models not only the geometric relationship between various limbs, but also their likely temporal dynamics (Sigal, Bhatia et al. 2004). The conditional probabilities relating various limbs and time instances are learned from training data, and particle filtering is used to perform the final pose inference.

Adaptive shape modeling. Another essential component of whole body modeling and tracking is the fitting of parameterized shape models to visual data. As we saw in Section 13.6.3 (Figure 13.25), the availability of large numbers of registered 3D range scans can be used to create morphable models of shape and appearance (Allen, Curless, and Popovic´ 2003). Building on this work, Anguelov, Srinivasan et al. (2005) develop a sophisticated system called SCAPE (Shape Completion and Animation for PEople), which first acquires a large number of range scans of different people in varied poses, and then registers these scans using semi-automated marker placement. The registered datasets are used to model the variation in shape as a function of personal characteristics and skeletal pose, e.g., the bulging of muscles as certain joints are flexed (Figure 13.29, top row). The resulting system can then be used for shape completion, i.e., the recovery of a full 3D mesh model from a small number of captured markers, by finding the best model parameters in both shape and pose space that fit the measured data.

![Figure 13.29](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/26dc600491261cc1f73f200df8648efdffe0c1b449563c572b5a3d0d874d7f63.jpg)  
Figure 13.29 Estimating human shape and pose from a single image using a parametric 3D model (Guan, Weiss et al. 2009) © 2009 IEEE.

Because it is constructed completely from scans of people in close-fitting clothing and uses a parametric shape model, the SCAPE system cannot cope with people wearing loosefitting clothing. Balan and Black ˘ (2008) overcome this limitation by estimating the body shape that fits within the visual hull of the same person observed in multiple poses, while Vlasic, Baran et al. (2008) adapt an initial surface mesh fitted with a parametric shape model to better match the visual hull.

While the preceding body fitting and pose estimation systems use multiple views to estimate body shape, Guan, Weiss et al. (2009) fit a human shape and pose model to a single image of a person on a natural background. Manual initialization is used to estimate a rough pose (skeleton) and height model, and this is then used to segment the person’s outline using the Grab Cut segmentation algorithm (Section 4.3.2). The shape and pose estimate are then refined using a combination of silhouette edge cues and shading information (Figure 13.29). The resulting 3D model can be used to create novel animations.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/b821bb7f9a999db380b83015b17a265b28b7d6fff19f5b8348b819a3518dea8f.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/2c51082b9ea20978b117c4794b59359d5481ebd85a08c05bac132af79d342626.jpg)  
(b)  
Figure 13.30 Whole body, expression, and gesture fitting from a single image using the SMPL-X model from Pavlakos, Choutas et al. (2019) © 2019 IEEE: (a) estimating the major joints, skeleton, SMPL, and SMPL-X models from a single image; (b) qualitative results of SMPL-X for some in-the-wild images.

While some of the original work on 3D body and pose fitting was done using the SCAPE and BlendSCAPE (Hirshberg, Loper et al. 2012) models, the Skinned Multi-Person Linear model (SMPL) developed by Loper, Mahmood et al. (2015) introduced a skinned vertexbased model that accurately represents a wide variety of body shapes in natural human poses. The model consists of a rest pose template, pose-dependent blend shapes, and identitydependent blend shapes, and is built by training on a large collection of aligned 3D human scans. Bogo, Kanazawa et al. (2016) show how the parameters of this 3D model can be estimated from just a single image using their SMPLfy method.

In subsequent work Romero, Tzionas, and Black (2017) extend this model by adding a hand Model with Articulated and Non-rigid defOrmations (MANO). Joo, Simon, and Sheikh (2018) stitch together the SMPL body model with a face and a hand model to create the 3D Frank and Adam models that can track multiple people in a social setting. And Pavlakos, Choutas et al. (2019) use thousands of 3D scans to train a new, unified, 3D model of the human body (SMPL-X) that extends SMPL with gender-specific models and includes fully articulated hands and an expressive face, as shown in Figure 13.30. They also replace the mixture of Gaussians prior in SMPL with a variational autoencoder (VAE) and develop a new VPoser prior trained on the large-scale AMASS motion capture dataset collected by Mahmood, Ghorbani et al. (2019).

In more recent work, Kocabas, Athanasiou, and Black (2020) introduce VIBE, a system for video inference of human body pose and shape that makes use of AMASS. Choutas, Pavlakos et al. (2020) develop a system they call ExPose (EXpressive POse and Shape rEgression), which directly regresses the body, face, and hands SMPL-X parameters from an

RGB image. The more recent STAR (Sparse Trained Articulated human body Regressor) model (Osman, Bolkart, and Black 2020), has many fewer parameters than SMPL and removes spurious long-range correlations between vertices. It also includes shape-dependent pose-corrective blend shapes that depend on both body pose and BMI and also models a much wider range of variation in the human population by training STAR with an additional 10,000 scans of male and female subjects. GHUM and GHUML (Xu, Bazavan et al. 2020) rely on non-linear shape spaces constructed from deep variational autoencoders for body and facial deformation and on normalizing flow representations for skeleton (body and hand) kinematics. Recent papers that continue to improve the accuracy and speed of single-image model fitting on the challenging 3D Poses in the Wild (3DPW) benchmark and dataset (von Marcard, Henschel et al. 2018) include Song, Chen, and Hilliges (2020), Joo, Neverova, and Vedaldi (2020), and Rong, Shiratori, and Joo (2020).

Activity recognition. The final widely studied topic in human modeling is motion, activity, and action recognition (Bobick 1997; Hu, Tan et al. 2004; Hilton, Fua, and Ronfard 2006). Examples of actions that are commonly recognized include walking and running, jumping, dancing, picking up objects, sitting down and standing up, and waving. Papers on these topics include Robertson and Reid (2006), Sminchisescu, Kanaujia, and Metaxas (2006), Weinland, Ronfard, and Boyer (2006), Yilmaz and Shah (2006), and Gorelick, Blank et al. (2007), as well as more recent video understanding papers such as the ones we covered in Section 6.5, e.g., Carreira and Zisserman (2017), Tran, Wang et al. (2018), Tran, Wang et al. (2019), Wu, Feichtenhofer et al. (2019), and Feichtenhofer, Fan et al. (2019).

## 13.7 Recovering texture maps and albedos

After a 3D model of an object or person has been acquired, the final step in modeling is usually to recover a texture map to describe the object’s surface appearance. This first requires establishing a parameterization for the $(u, v)$ texture coordinates as a function of 3D surface position.<sup>21</sup> One simple way to do this is to associate a separate texture map with each triangle (or pair of triangles). More space-efficient techniques involve unwrapping the surface onto one or more maps, e.g., using a subdivision mesh (Section 13.3.2) (Eck, DeRose et al. 1995) or a geometry image (Section 13.3.3) (Gu, Gortler, and Hoppe 2002).

Once the $(u, v)$ coordinates for each triangle have been fixed, the perspective projection equations mapping from texture $(u, v)$ to an image $j^{\circ} s$ pixel $(u_{j}, v_{j})$ coordinates can be obtained by concatenating the affine $(u, v)(X, Y, Z)$ mapping with the perspective homography $(X, Y, Z) \to(u_{j}, v_{j})$ (Szeliski and Shum 1997). The color values for the $(u, v)$ texture map can then be re-sampled and stored, or the original image can itself be used as the texture source using projective texture mapping (OpenGL-ARB 1997).

The situation becomes more involved when more than one source image is available for appearance recovery, which is the usual case. One possibility is to use a view-dependent texture map (Section 14.1.1), in which a different source image (or combination of source images) is used for each polygonal face based on the angles between the virtual camera, the surface normals, and the source images (Debevec, Taylor, and Malik 1996; Pighin, Hecker et al. 1998). An alternative approach is to estimate a complete Surface Light Field for each surface point (Wood, Azuma et al. 2000), as described in Section 14.3.2.

In some situations, e.g., when using models in traditional 3D games, it is preferable to merge all of the source images into a single coherent texture map during pre-processing (Weinhaus and Devarajan 1997). Ideally, each surface triangle should select the source image where it is seen most directly (perpendicular to its normal) and at the resolution best matching the texture map resolution.<sup>22</sup> This can be posed as a graph cut optimization problem, where the smoothness term encourages adjacent triangles to use similar source images, followed by blending to compensate for exposure differences (Lempitsky and Ivanov 2007; Sinha, Steedly et al. 2008). Even better results can be obtained by explicitly modeling geometric and photometric misalignments between the source images (Shum and Szeliski 2000; Gal, Wexler et al. 2010; Waechter, Moehrle, and Goesele 2014; Zhou and Koltun 2014; Huang, Dai et al. 2017; Fu, Yan et al. 2018; Schops, Sattler, and Pollefeys¨ 2019b; Lee, Ha et al. 2020). “Neural” texture map representations can also be used as an alternative to RGB color fields (Oechsle, Mescheder et al. 2019; Mihajlovic, Weder et al. 2021). Zollhofer, Stotko¨ et al. (2018, Section 4.1) discuss related techniques in more detail.

These kinds of approaches produce good results when the lighting stays fixed with respect to the object, i.e., when the camera moves around the object or space. When the lighting is strongly directional, however, and the object is being moved relative to this lighting, strong shading effects or specularities may be present, which will interfere with the reliable recovery of a texture (albedo) map. In this case, it is preferable to explicitly undo the shading effects (Section 13.1) by modeling the light source directions and estimating the surface reflectance properties while recovering the texture map (Sato and Ikeuchi 1996; Sato, Wheeler, and Ikeuchi 1997; Yu and Malik 1998; Yu, Debevec et al. 1999). Figure 13.31 shows the results of one such approach, where the specularities are first removed while estimating the matte reflectance component (albedo) and then later re-introduced by estimating the specular component $k_{s}$ in a Torrance–Sparrow reflection model (2.92).

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/078fb9a84d7c57819c49baa10683e3065ef5562ae281a89bce3af450bcc0e0aa.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/ec5ec3bba1772c1aa4d337af4e29d127f3df12aeb5960ccbafa3f2ec4abee10c.jpg)  
(a)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/b6d509d10f0b6c637fc7a03a393615dacfb014ade470a5bb3e81c1c74917e9dc.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/7f3dc031a7c4df6944968f646f5a712119f6a79106ab97b7cd093813a4d7b053.jpg)  
(b)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/f432b98f3e9cfd7e2707b8c3f149fe46c72c53e66460756ea3c4673c9937f712.jpg)  
(c)  
Figure 13.31 Estimating the diffuse albedo and reflectance parameters for a scanned 3D model (Sato, Wheeler, and Ikeuchi 1997) © 1997 ACM: (a) set of input images projected onto the model; (b) the complete diffuse reflection (albedo) model; (c) rendering from the reflectance model including the specular component.

## 13.7.1 Estimating BRDFs

A more ambitious approach to the problem of view-dependent appearance modeling is to estimate a general bidirectional reflectance distribution function (BRDF) for each point on an object’s surface. Dana, van Ginneken et al. (1999), Jensen, Marschner et al. (2001), and Lensch, Kautz et al. (2003) present different techniques for estimating such functions, while Dorsey, Rushmeier, and Sillion (2007) and Weyrich, Lawrence et al. (2009) provide surveys of the topics of BRDF modeling, recovery, and rendering.

As we saw in Section 2.2.2 (2.82), the BRDF can be written as

$$
f_{r}(\theta_{i}, \phi_{i}, \theta_{r}, \phi_{r}; \lambda),\tag{13.6}
$$

where $(\theta_{i}, \phi_{i})$ and $(\theta_{r}, \phi_{r})$ are the angles the incident $\hat{\mathbf{v}}_{i}$ and reflected $\hat{\mathbf{v}}_{r}$ light ray directions make with the local surface coordinate frame $(\hat{\mathbf{d}}_{x}, \hat{\mathbf{d}}_{y}, \hat{\mathbf{n}})$ shown in Figure 2.15. When modeling the appearance of an object, as opposed to the appearance of a patch of material, we need to estimate this function at every point $(x, y)$ on the object’s surface, which gives us the spatially varying BRDF, or SVBRDF (Weyrich, Lawrence et al. 2009),

$$
f_{v}(x, y, \theta_{i}, \phi_{i}, \theta_{r}, \phi_{r}; \lambda).\tag{13.7}
$$

If sub-surface scattering effects are being modeled, such as the long-range transmission of light through materials such as alabaster, the eight-dimensional bidirectional scatteringsurface reflectance-distribution function (BSSRDF) is used instead,

$$
f_{e}(x_{i}, y_{i}, \theta_{i}, \phi_{i}, x_{e}, y_{e}, \theta_{e}, \phi_{e}; \lambda),\tag{13.8}
$$

![Figure 13.32](../../../transcripts/mineru/computer-vision-algorithms-applications/parts/801-1000/images/74fb8d86b4fa175453f9c7e55565da7d3b82af0bf6fb80801726ab9c901786b6.jpg)  
Figure 13.32 Image-based reconstruction of appearance and detailed geometry (Lensch, Kautz et al. 2003) © 2003 ACM. (a) Appearance models (BRDFs) are re-estimated using divisive clustering. (b) To model detailed spatially varying appearance, each lumitexel is projected onto the basis formed by the clustered materials.

where the e subscript now represents the emitted rather than the reflected light directions.

Weyrich, Lawrence et al. (2009) provide a nice survey of these and related topics, including basic photometry, BRDF models, traditional BRDF acquisition using gonio reflectometry, i.e., the precise measurement of visual angles and reflectances (Marschner, Westin et al. 2000; Dupuy and Jakob 2018), multiplexed illumination (Schechner, Nayar, and Belhumeur 2009), skin modeling (Debevec, Hawkins et al. 2000; Weyrich, Matusik et al. 2006), and image-based acquisition techniques, which simultaneously recover an object’s 3D shape and reflectometry from multiple photographs.

A nice example of this latter approach is the system developed by Lensch, Kautz et al. (2003), who estimate locally varying BRDFs and refine their shape models using local estimates of surface normals. To build up their models, they first associate a lumitexel, which contains a 3D position, a surface normal, and a set of sparse radiance samples, with each surface point. Next, they cluster such lumitexels into materials that share common properties, using a Lafortune reflectance model (Lafortune, Foo et al. 1997) and a divisive clustering approach (Figure 13.32a). Finally, to model detailed spatially varying appearance, each lumitexel (surface point) is projected onto the basis of clustered appearance models (Figure 13.32b). A more accurate system for estimating normals can be obtained using polarized lighting, as described by Ma, Hawkins et al. (2007).

More recent approaches to recovering spatially varying BRDFs (SVBRDFs) either start with RGB-D scanners (Park, Newcombe, and Seitz 2018; Schmitt, Donne et al. 2020), flash/noflash image pairs (Aittala, Weyrich, and Lehtinen 2015), or use deep learning approaches to simultaneously estimate surface normals and appearance models (Li, Sunkavalli, and Chandraker 2018; Li, Xu et al. 2018). Even more sophisticated systems can also estimate shape and environmental lighting from range scanner sequences (Park, Holynski, and Seitz 2020) or single monocular images (Boss, Jampani et al. 2020; Li, Shafiei et al. 2020; Chen, Nobuhara, and Nishino 2020) and even perform relighting on such scenes (Bi, Xu et al. 2020a,b; Sang and Chandraker 2020; Bi, Xu et al. 2020c). A more in-depth review of techniques for capturing the 3D shape and appearance of objects with RGB-D cameras can be found in the state of the art report by Zollhofer, Stotko¨ et al. (2018).

While most of the techniques discussed in this section require large numbers of views to estimate surface properties, an interesting challenge is to take these techniques out of the lab and into the real world, and to combine them with regular and internet photo image-based modeling approaches.

## 13.7.2 Application: 3D model capture

The techniques described in this chapter for building complete 3D models from multiple images and then recovering their surface appearance have opened up a whole new range of applications that often go under the name 3D photography. Pollefeys and Van Gool (2002) and Pollefeys, Van Gool et al. (2004) provide nice introductions to such systems, including the processing steps of feature matching, structure from motion recovery, dense depth map estimation, 3D model building, and texture map recovery. A complete web-based system for automatically performing all of these tasks, called ARC3D, is described by Vergauwen and Van Gool (2006) and Moons, Van Gool, and Vergauwen (2010). The latter paper provides not only an in-depth survey of this whole field but also a detailed description of their complete end-to-end system.

An example of a more recent commercial photogrammetric modeling system that can be used for both object and scene capture is Pix4D, whose website shows a wonderful example of a 3D texture-mapped castle reconstructed from both regular and aerial drone photographs.<sup>23</sup> Examples of casual 3D photography enabled by the advent of smartphones include Hedman, Alsisan et al. (2017), Hedman and Kopf (2018), and Kopf, Matzen et al. (2020) and are described in more detail in Section 14.2.2.

An alternative to such fully automated systems is to put the user in the loop in what is sometimes called interactive computer vision. An early example of this was the Fac¸ade architectural modeling system developed by Debevec, Taylor, and Malik (1996). van den Hengel, Dick et al. (2007) describe their VideoTrace system, which performs automated point tracking and 3D structure recovery from video and then lets the user draw triangles and surfaces on top of the resulting point cloud, as well as interactively adjusting the locations of model vertices. Sinha, Steedly et al. (2008) describe a related system that uses matched vanishing points in multiple images (Figure 7.50) to infer 3D line orientations and plane normals. These are then used to guide the user drawing axis-aligned planes, which are automatically fitted to the recovered 3D point cloud. Fully automated variants on these ideas are described by Zebedin, Bauer et al. (2008), Furukawa, Curless et al. (2009a), Furukawa, Curless et al. (2009b), Micuˇ sˇ´ık and Koseckˇ a´ (2009), and Sinha, Steedly, and Szeliski (2009).

As the sophistication and reliability of these techniques continues to improve, we can expect to see even more user-friendly applications for photorealistic 3D modeling from images (Exercise 13.8).

## 13.8 Additional reading

Shape from shading is one of the classic problems in computer vision (Horn 1975). Some representative papers in this area include those by Horn (1977), Ikeuchi and Horn (1981), Pentland (1984), Horn and Brooks (1986), Horn (1990), Szeliski (1991a), Mancini and Wolff (1992), Dupuis and Oliensis (1994), and Fua and Leclerc (1995). The collection of papers edited by Horn and Brooks (1989) is a great source of information on this topic, especially the chapter on variational approaches. The survey by Zhang, Tsai et al. (1999) reviews such techniques and also provides some comparative results.

Woodham (1981) wrote the seminal paper of photometric stereo. Shape from texture techniques include those by Witkin (1981), Ikeuchi (1981), Blostein and Ahuja (1987), Garding˚ (1992), Malik and Rosenholtz (1997), Liu, Collins, and Tsin (2004), Liu, Lin, and Hays (2004), Hays, Leordeanu et al. (2006), Lin, Hays et al. (2006), Lobay and Forsyth (2006), White and Forsyth (2006), White, Crane, and Forsyth (2007), and Park, Brocklehurst et al. (2009). Good papers and books on depth from defocus have been written by Pentland (1987), Nayar and Nakagawa (1994), Nayar, Watanabe, and Noguchi (1996), Watanabe and Nayar (1998), Chaudhuri and Rajagopalan (1999), and Favaro and Soatto (2006). Additional techniques for recovering shape from various kinds of illumination effects, including interreflections (Nayar, Ikeuchi, and Kanade 1991), are discussed in the book on shape recovery edited by Wolff, Shafer, and Healey (1992b). A more recent survey on photometric stereo is Ackermann and Goesele (2015) and recent papers include Logothetis, Mecca, and Cipolla (2019), Haefner, Ye et al. (2019), and Santo, Waechter, and Matsushita (2020).

Active rangefinding systems, which use laser or natural light illumination projected into the scene, have been described by Besl (1989), Rioux and Bird (1993), Kang, Webb et al. (1995), Curless and Levoy (1995), Curless and Levoy (1996), Proesmans, Van Gool, and Defoort (1998), Bouguet and Perona (1999), Curless (1999), Hebert (2000), Iddan and Yahav (2001), Goesele, Fuchs, and Seidel (2003), Scharstein and Szeliski (2003), Davis, Ramamoorthi, and Rusinkiewicz (2003), Zhang, Curless, and Seitz (2003), Zhang, Snavely et al. (2004), and Moons, Van Gool, and Vergauwen (2010), and in the more recent reviews by Zhang (2018) and Ikeuchi, Matsushita et al. (2020). Individual range scans can be aligned using 3D correspondence and distance optimization techniques such as iterative closest points and its variants (Besl and McKay 1992; Zhang 1994; Szeliski and Lavallee´ 1996; Johnson and Kang 1997; Gold, Rangarajan et al. 1998; Johnson and Hebert 1999; Pulli 1999; David, DeMenthon et al. 2004; Li and Hartley 2007; Enqvist, Josephson, and Kahl 2009; Pomerleau, Colas, and Siegwart 2015; Rusinkiewicz 2019). Once they have been aligned, range scans can be merged using techniques that model the signed distance of surfaces to volumetric sample points (Hoppe, DeRose et al. 1992; Curless and Levoy 1996; Hilton, Stoddart et al. 1996; Wheeler, Sato, and Ikeuchi 1998; Kazhdan, Bolitho, and Hoppe 2006; Lempitsky and Boykov 2007; Zach, Pock, and Bischof 2007b; Zach 2008; Newcombe, Izadi et al. 2011; Zhou, Miller, and Koltun 2013; Newcombe, Fox, and Seitz 2015; Zollhofer, Stotko¨ et al. 2018).

Once constructed, 3D surfaces can be modeled and manipulated using a variety of threedimensional representations, which include triangle meshes (Eck, DeRose et al. 1995; Hoppe 1996), splines (Farin 1992; Lee, Wolberg, and Shin 1997; Farin 2002), subdivision surfaces (Stollnitz, DeRose, and Salesin 1996; Zorin, Schroder, and Sweldens¨ 1996; Warren and Weimer 2001; Peters and Reif 2008), and geometry images (Gu, Gortler, and Hoppe 2002). Alternatively, they can be represented as collections of point samples with local orientation estimates (Hoppe, DeRose et al. 1992; Szeliski and Tonnesen 1992; Turk and O’Brien 2002; Pfister, Zwicker et al. 2000; Alexa, Behr et al. 2003; Pauly, Keiser et al. 2003; Diebel, Thrun, and Brunig¨ 2006; Guennebaud and Gross 2007; Guennebaud, Germann, and Gross 2008; Oztireli, Guennebaud, and Gross 2008; Berger, Tagliasacchi et al. 2017). They can also be modeled using implicit inside–outside characteristic or signed distance functions sampled on regular or irregular (octree) volumetric grids (Lavallee and Szeliski´ 1995; Szeliski and Lavallee´ 1996; Frisken, Perry et al. 2000; Dinh, Turk, and Slabaugh 2002; Kazhdan, Bolitho, and Hoppe 2006; Lempitsky and Boykov 2007; Zach, Pock, and Bischof 2007b; Zach 2008; Kazhdan and Hoppe 2013).

The literature on model-based 3D reconstruction is extensive. For modeling architecture and urban scenes, both interactive and fully automated systems have been developed. A special journal issue devoted to the reconstruction of large-scale 3D scenes (Zhu and Kanade 2008) is a good source of references and Robertson and Cipolla (2009) give a nice description of a complete system. Lots of additional references can be found in Section 13.6.1.

Face and whole body modeling and tracking is a very active sub-field of computer vision, with its own conferences and workshops, e.g., the International Conference on Automatic Face and Gesture Recognition (FG) and IEEE Workshop on Analysis and Modeling of Faces and Gestures (AMFG). Two recent survey papers on 3D face modeling and tracking are Zollhofer, Thies¨ et al. (2018) and Egger, Smith et al. (2020), while surveys on the topic of whole body modeling and tracking include Forsyth, Arikan et al. (2006), Moeslund, Hilton, and Kruger¨ (2006), and Sigal, Balan, and Black (2010).

Some representative papers on recovering texture maps from multiple color and RGB-D images include Gal, Wexler et al. (2010), Waechter, Moehrle, and Goesele (2014), Zhou and Koltun (2014), and Lee, Ha et al. (2020) as well as Zollhofer, Stotko¨ et al. (2018, Section 4.1). The more complex process of recovering spatially varying BRDFs is covered in surveys by Dorsey, Rushmeier, and Sillion (2007) and Weyrich, Lawrence et al. (2009). More recent techniques that can do this using fewer images and RGB-D images include Aittala, Weyrich, and Lehtinen (2015), Li, Sunkavalli, and Chandraker (2018), Schmitt, Donne et al. (2020), and Boss, Jampani et al. (2020) and the survey by Zollhofer, Stotko¨ et al. (2018).

## 13.9 Exercises

Ex 13.1: Shape from focus. Grab a series of focused images with a digital SLR set to manual focus (or get one that allows for programmatic focus control) and recover the depth of an object.

1. Take some calibration images, e.g., of a checkerboard, so that you can compute a mapping between the amount of defocus and the focus setting.

2. Try both a fronto-parallel planar target and one which is slanted so that it covers the working range of the sensor. Which one works better?

3. Now put a real object in the scene and perform a similar focus sweep.

4. For each pixel, compute the local sharpness and fit a parabolic curve over focus settings to find the most in-focus setting.

5. Map these focus settings to depth and compare your result to ground truth. If you are using a known simple object, such as a sphere or cylinder (a ball or a soda can), it’s easy to measure its true shape.

6. (Optional) See if you can recover the depth map from just two or three focus settings.

7. (Optional) Use an LCD projector to project artificial texture onto the scene. Use a pair of cameras to compare the accuracy of your shape from focus and shape from stereo techniques.

8. (Optional) Create an all-in-focus image using the technique of Agarwala, Dontcheva et al. (2004).

Ex 13.2: Shadow striping. Implement the handheld shadow striping system of Bouguet and Perona (1999). The basic steps include the following:

1. Set up two background planes behind the object of interest and calculate their orientation relative to the viewer, e.g., with fiducial marks.

2. Cast a moving shadow with a stick across the scene; record the video or capture the data with a webcam.

3. Estimate each light plane equation from the projections of the cast shadow against the two backgrounds.

4. Triangulate to the remaining points on each curve to get a 3D stripe and display the stripes using a 3D graphics engine.

5. (Optional) remove the requirement for a known second (vertical) plane and infer its location (or that of the light source) using the techniques described by Bouguet and Perona (1999). The techniques from Exercise 10.9 may also be helpful here.

Ex 13.3: Range data registration. Register two or more 3D datasets using either iterative closest points (ICP) (Besl and McKay 1992; Zhang 1994; Gold, Rangarajan et al. 1998) or octree signed distance fields (Szeliski and Lavallee´ 1996) (Section 13.2.1).

Apply your technique to narrow-baseline stereo pairs, e.g., obtained by moving a camera around an object, using structure from motion to recover the camera poses, and using a standard stereo matching algorithm.

Ex 13.4: Range data merging. Merge the datasets that you registered in the previous exercise using signed distance fields (Curless and Levoy 1996; Hilton, Stoddart et al. 1996) or one of their newer variants (Newcombe, Izadi et al. 2011; Hornung, Wurm et al. 2013; Nießner, Zollhofer¨ et al. 2013; Klingensmith, Dryanovski et al. 2015; Dai, Nießner et al. 2017; Zollhofer, Stotko¨ et al. 2018). Extract a meshed surface model from the signed distance field using marching cubes and display the resulting model.

Ex 13.5: Surface simplification. Use progressive meshes (Hoppe 1996) or some other technique from Section 13.3.2 to create a hierarchical simplification of your surface model.

Ex 13.6: Architectural modeler. Build a 3D interior or exterior model of some architectural structure, such as your house, from a series of handheld wide-angle photographs.

1. Extract lines and vanishing points (Exercises 7.11–7.14) to estimate the dominant directions in each image.

2. Use structure from motion to recover all of the camera poses and match up the vanishing points.

3. Let the user sketch the locations of the walls by drawing lines corresponding to wall bottoms, tops, and horizontal extents onto the images (Sinha, Steedly et al. 2008)— see also Exercise 11.4. Do something similar for openings (doors and windows) and simple furniture (tables and countertops).

4. Convert the resulting polygonal meshes into a 3D model (e.g., VRML) and optionally texture-map these surfaces from the images.

Ex 13.7: Body tracker. Download some human body movement sequences from one of the datasets such as HumanEva, MPI FAUST, or AMASS discussed in Section 13.6.4. Either implement a human motion tracker from scratch or extend existing code in some interesting way.

Ex 13.8: 3D photography. Combine all of your previously developed techniques to produce a system that takes a series of photographs or a video and constructs a photorealistic texture-mapped 3D model.


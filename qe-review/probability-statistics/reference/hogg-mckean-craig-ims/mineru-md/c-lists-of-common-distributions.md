---
title: "Appendix C — Lists of Common Distributions"
source: Hogg, McKean, Craig, Introduction to Mathematical Statistics, 8th ed., Pearson 2019
kind: mineru-transcript-chapter
part: appendix
canonical_pdf: ../Hogg-McKean-Craig-Introduction-to-Mathematical-Statistics.pdf
---

# Appendix C — Lists of Common Distributions

[Package map](../structure.md) · [Unsplit OCR dump](./_full.md)

[← App. B R Primer](./b-r-primer.md) · [App. D Tables →](./d-tables-of-distributions.md)

> MinerU OCR dump. If a formula, table, or numbering disagrees with the PDF, the PDF is authoritative.

---

# Appendix C

# Lists of Common Distributions

In this appendix, we provide a short list of common distributions. For each distribution, we note the expression where the pmf or pdf is defined in the text, the formula for the pmf or pdf, its mean and variance, and its mgf. The first list contains common discrete distributions, and the second list contains common continuous distributions.

<table><tr><td colspan="2">List of Common Discrete Distributions</td></tr><tr><td>Bernoulli 0 &lt; p &lt; 1</td><td>(3.1.1)p(x) = px(1-p)1-x, x=0,1μ = p, σ2 = p(1-p)m(t) = [(1-p) + pe^t], -∞ &lt; t &lt; ∞</td></tr><tr><td>Binomial 0 &lt; p &lt; 1n = 1, 2, ...</td><td>(3.1.2)p(x) = (nx)p^x(1-p)^{n-x}, x=0,1,2,...,nμ = np, σ^2 = np(1-p)m(t) = [(1-p) + pe^t]^n, -∞ &lt; t &lt; ∞</td></tr><tr><td>Geometric 0 &lt; p &lt; 1</td><td>(3.1.4)p(x) = p(1-p)^x, x=0,1,2,...μ = q/p, σ^2 = 1-p^2m(t) = p[1-(1-p)e^t]^-1, t &lt; -log(1-p)</td></tr><tr><td>Hypergeometric (N, D, n)n = 1, 2,..., min{N, D}</td><td>(3.1.7)p(x) = (N-D/n-x)(D/x)(N)/nμ = nD/N, σ^2 = nD/N N-D N-nN-1The above pmf is the probability of obtaining x Ds in a sample of size n, without replacement.</td></tr><tr><td>Negative Binomial 0 &lt; p &lt; 1r = 1, 2,...</td><td>(3.1.3)p(x) = (x+r-1)r^p(1-p)^x, x=0,1,2,...μ = rq/p, σ^2 = r(1-p)/p^2m(t) = pr[1-(1-p)e^t]^-r, t &lt; -log(1-p)</td></tr><tr><td>Poisson m &gt; 0</td><td>(3.2.1)p(x) = e^{-m}\frac{m^x}{x!}, x=0,1,2,...μ = m, σ^2 = mm(t) = \exp\{m(e^t - 1)\}, -∞ &lt; t &lt; ∞</td></tr><tr><td colspan="2">List of Common Continuous Distributions</td></tr><tr><td>beta</td><td>(3.3.9)</td></tr><tr><td>α&gt;0</td><td>f(x)= Γ(α+β)/Γ(α)Γ(β)xα-1(1-x)β-1, 0&lt;x&lt;1</td></tr><tr><td>β&gt;0</td><td>μ= α/α+β, σ2= αβ/(α+β+1)(α+β)2m(t)=1+ ∑i=1∞(Πj=0k-1α+j/α+β+j)t/t!,-∞&lt;t&lt;∞</td></tr><tr><td>Cauchy</td><td>(1.9.2)f(x)= 1/πx2+1, -∞&lt;x&lt;∞Neither the mean nor the variance exists.The mgf does not exist.</td></tr><tr><td>Chi-squared, χ2(r)</td><td>(3.3.7)f(x)= 1/Γ(r/2)2r/2x(r/2)-1e-x/2, x&gt;0</td></tr><tr><td>r&gt;0</td><td>μ=r, σ2= 2r m(t)= (1-2t)-r/2, t&lt;1/2 χ2(r) ⇌ Γ(r/2,2) r is called the degrees of freedom.</td></tr><tr><td>Exponential</td><td>(3.3.6)f(x)= λe-λx, x&gt;0 μ= 1/λ, σ2= 1/λ2 m(t)= [1-(t/λ)]-1, t&lt;λ Exponential(λ) ⇌ Γ(1,1/λ)</td></tr><tr><td>F, F(r1,r2)</td><td>(3.6.6)f(x)= Γ[(r1+r2)/2](r1/r2)r1/2/(1+r1x/r2)(r1+r2)/2, x&gt;0</td></tr><tr><td>r1&gt;0</td><td rowspan="2">If r2&gt;2, μ= r2/r2-2. If r&gt;4, σ2= 2(r2/r2-2)2r1+r2-2/r1(r2-4). The mgf does not exist.</td></tr><tr><td>r2&gt;0&gt;0</td></tr><tr><td>r1 is called the numerator degrees of freedom.</td><td>r2 is called the denominator degrees of freedom.</td></tr><tr><td>Gamma, Γ(α,β)</td><td>(3.3.2)f(x)= 1/Γ(α)βxα-1e-x/β, x&gt;0</td></tr><tr><td>α&gt;0</td><td>μ= αβ, σ2= αβ2</td></tr><tr><td>β&gt;0</td><td>m(t)=(1-βt)-α, t&lt;1/β</td></tr><tr><td colspan="2">Continuous Distributions, Continued</td></tr><tr><td>Laplace
-∞ &lt; θ &lt; ∞</td><td>(2.2.4)
f(x) = 1/2 e-|x-θ|, -∞ &lt; x &lt; ∞
μ = θ, σ2= 2
m(t) = eth/1-t2, -1 &lt; t &lt; 1</td></tr><tr><td>Logistic
-∞ &lt; θ &lt; ∞</td><td>(6.1.8)
f(x) = exp-{-(x-θ)}/(1+exp{-(x-θ)})2, -∞ &lt; x &lt; ∞
μ = θ, σ2= π/3
m(t) = ethΓ(1-t)Γ(1+t), -1 &lt; t &lt; 1</td></tr><tr><td>Normal, N(μ,σ2)-∞ &lt; μ &lt; ∞
σ &gt; 0</td><td>(3.4.6)
f(x) = 1/√2πσ exp{-(1/2 (x-μ)/σ)2}, -∞ &lt; x &lt; ∞
μ = μ, σ2= σ2
m(t) = exp{μt + (1/2)σ2t2}, -∞ &lt; t &lt; ∞</td></tr><tr><td>t, t(r)
r &gt; 0</td><td>(3.6.2)
f(x) = Γ[(r+1)/2] / (1+x2/r)(r+1)/2, -∞ &lt; x &lt; ∞
If r &gt; 1, μ = 0. If r &gt; 2, σ2=r/r-2.
The mgf does not exist.
The parameter r is called the degrees of freedom.</td></tr><tr><td>Uniform
-∞ &lt; a &lt; b &lt; ∞</td><td>(1.7.4)
f(x) = 1/b-a, a &lt; x &lt; b
μ = a+b/2, σ2=(b-a)/12
m(t) = etb/(b-a)t, -∞ &lt; t &lt; ∞</td></tr></table>


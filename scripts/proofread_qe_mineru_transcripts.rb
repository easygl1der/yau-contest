#!/usr/bin/env ruby
# frozen_string_literal: true

# Correct high-confidence OCR defects against the official PDF page images. This
# intentionally changes only errors that alter notation, a formula, or a stated
# condition; wording-only OCR noise is left to a later editorial pass.

ROOT = File.expand_path("..", __dir__)

CORRECTIONS = {
  "qzc-qe-applied-math-2023-fall" => {
    "f \in$ $C^{2}(a, b), x_{*} \in(a, b)" => "f \in C^{2}(a,b),\ x_* \in (a,b)",
    "\\operatorname{lim}_{k \\to \\infty}" => "\\lim_{k \\to \\infty}",
    "lim $\\begin{array}{r}{\\mathfrak{l}_{k \\to \\infty} \\frac{x_{k + 1} - x_{*}}{(x_{k} - x_{*})^{2}} = \\frac{f^{\\prime \\prime}(x_{*})}{2f^{\\prime}(x_{*})}} \\end{array}$" => "\\(\\lim_{k \\to \\infty} \\frac{x_{k+1}-x_*}{(x_k-x_*)^2}=\\frac{f''(x_*)}{2f'(x_*)}\\)",
    "\\bar{\\rho_{k}} \\lvert \\bar{\\alpha}_{k} - \\mu_{k} \\rvert" => "\\rho_k \\lvert \\alpha_k-\\mu_k \\rvert",
    "The derivative $p^{\\prime}.$ , a polynomial of degree $(n - 1)$ 2 is determined on the same grid. The (classical) diferentiation matrix is the $(n +$ $1) - \\mathrm{by} -(n + 1)$ matrix $D \\stackrel{\\cdot}{=}(D_{ij}) \\in \\dot{\\mathbb{R}}^{(n + 1) \\times(n + 1)}$" => "The derivative $p'$ is a polynomial of degree $(n-1)$ and is determined on the same grid. The (classical) differentiation matrix is the $(n+1)\\text{-by-}(n+1)$ matrix $D=(D_{ij})\\in\\mathbb{R}^{(n+1)\\times(n+1)}$",
    "p^{\\prime}(x_{i}) = \\sum_{j = 0}^{n} D_{ij}p(x_{j})" => "p'(x_i)=\\sum_{j=0}^{n}D_{ij}p(x_j)"
  },
  "qzc-qe-applied-math-2024-spring" => {
    "x^{(k + 1)} =(D - L)^{- 1} Ux^{(k)} +(\\bar{D} - L)^{- 1} \\bar{b}" => "x^{(k+1)}=(D-L)^{-1}Ux^{(k)}+(D-L)^{-1}b",
    "lim ${\\mathfrak{i}}_{k \\to \\infty} x^{(k)} = A^{- 1} b" => "\\(\\lim_{k\\to\\infty}x^{(k)}=A^{-1}b\\)",
    "\\sum_{i \\neq i} | a_{ij} |" => "\\sum_{j\\neq i}|a_{ij}|",
    "\\operatorname{max}_{j}" => "\\max_j"
  },
  "qzc-qe-applied-math-2024-fall" => {
    "\\{T_{k} : 0 \\leq k < n\\}$ }" => "\\{T_k:0\\leq k<n\\}$",
    "| | x_{k} - x^{*} | |_{A}" => "\\|x_k-x^*\\|_A",
    "| | x_{0} - x^{*} | |_{A}" => "\\|x_0-x^*\\|_A",
    "$| | \\cdot | |_{A}$ denotes the Anorm" => "$\\|\\cdot\\|_A$ denotes the $A$-norm",
    "\\operatorname{max} \\lambda(A)" => "\\max \\lambda(A)",
    "\\operatorname{min} \\lambda(A)" => "\\min \\lambda(A)",
    "as $0 < \\epsilon \\ll 1$ 2" => "with $0<\\epsilon\\ll1$",
    "$f : \\mathbb{R}^{n} \\mathbb{R}$" => "$f:\\mathbb{R}^n\\to\\mathbb{R}$",
    "$x \\in$ int dom \\cdot f" => "$x\\in\\operatorname{int}(\\operatorname{dom}f)$"
  },
  "qzc-qe-applied-math-2025-spring" => {
    "A_{j, k} = 4n * \\delta_{j, k} + cos(t_{j} - s_{k})" => "A_{j,k}=4n\\,\\delta_{j,k}+\\cos(t_j-s_k)",
    "min ${\\frac{1}{2}} \\| y - z \\|,{\\mathrm{s.t.~}} y \\in K" => "\\min_{y\\in K} \\frac12\\|y-z\\|_2^2"
  },
  "qzc-qe-applied-math-2025-fall" => {
    "\\operatorname{max}_{x \\in[- 1, 1]}" => "\\max_{x\\in[-1,1]}",
    "\\operatorname{min}_{\\mathrm{\\scriptsize{~ polynomial ~}} p \\atop \\mathrm{\\scriptsize{deg}} p \\leq n, p(1) = 1} \\| p \\|_{\\infty}" => "\\min_{\\substack{p\\in\\mathcal{P}_n\\\\p(1)=1}}\\|p\\|_\\infty",
    "Q^{H}(A, B) Z = \\mathsf{\\bar{(}} S, T)" => "Q^H(A,B)Z=(S,T)"
  },
  "qzc-qe-applied-math-2026-spring" => {
    "unique zero x<sub>⋆</sub>" => "unique zero $x_*$",
    "\\operatorname{min}_{\\mathrm{\\polynomial \\} p} \\quad \\| p \\|_{2}" => "\\min_{\\substack{p\\in\\mathcal{P}_n\\\\p^{(n)}(1)=n!}}\\|p\\|_2",
    "\\operatorname{rank}(B) = \\operatorname{rank} \\left(\\left[B \\right] \\right)" => "\\operatorname{rank}(B)=\\operatorname{rank}\\left(\\begin{bmatrix}B\\\\C\\end{bmatrix}\\right)",
    "rank(A) = m, rank(B) = n" => "\\operatorname{rank}(A)=m,\\ \operatorname{rank}(B)=n",
    "up to $O(\\epsilon^{2})$" => "up to $O(\\epsilon^2)$"
  },
  "qzc-qe-probability-statistics-2023-fall" => {
    "\\mathbf{\\Phi}^{\\langle 6 \\rangle} \\mathrm{Tail}^{\\prime \\rangle}" => "\\text{Tail}",
    "$\" 6, 6, 6 '$" => "$\"(6,6,6)\"$",
    "$T{?}$" => "$T$?",
    "tree <sup>T</sup>" => "tree $\\mathbb{T}$",
    "<sup>T</sup> is" => "$\\mathbb{T}$ is",
    "containing $^{O,}$" => "containing $o$",
    "if $p > p_{c}$ , then $\\theta(p_{c}) > 0$ , while if $p < p_{c}$ then $\\theta(p_{c}) = 0$" => "if $p>p_c$, then $\\theta(p)>0$, while if $p<p_c$, then $\\theta(p)=0$",
    "may depend on $p_{c}$ but do not depend on $k" => "may depend on $p$ but do not depend on $k",
    "$n \\infty(\\mathrm{i.e.,} Y_{n}.$" => "$n\\to\\infty$ (i.e., $Y_n$",
    "f^{\\prime}(x_{n}) - x_{n} f(x_{n})) 0{\\mathrm{~ as ~}} n \\infty" => "f'(x_n)-x_nf(x_n)\\to0$ as $n\\to\\infty",
    "$u^{T} X^{T} Xu + \\sqrt{n} v^{T} Xv.$" => "$u^TX^TXu+\\sqrt{n}\,v^TXv$.",
    "$\\begin{array}{r}{f(x \\mid \\theta) = \\frac{1}{\\pi[1 +(x - \\theta)^{2}]}, - \\infty < x <} \\end{array}$ $\\infty, - \\infty < \\theta < \\infty" => "$f(x\\mid\\theta)=\\frac{1}{\\pi[1+(x-\\theta)^2]},\\quad -\\infty<x<\\infty,\\ -\\infty<\\theta<\\infty$",
    "$\\mathrm{if} \\mid \\Delta \\mid > 1$" => "if $|\\Delta|>1$"
  },
  "qzc-qe-probability-statistics-2024-spring" => {
    "<sup></sup> " => "• ",
    "<sup>R</sup>" => "$\\mathbb{R}$",
    "lim<sub>t</sub> $\\begin{array}{r}{0 \\ \\frac{1 - \\phi(t)}{t^{2} \\ln{| t |}} = - 1;} \\end{array}$" => "$\\lim_{t\\to0}\\frac{1-\\phi(t)}{t^2\\log|t|}=-1$",
    "lim $\\begin{array}{r}{\\operatorname{sup}_{n \\to \\infty} X_{n} / \\ln n = 1} \\end{array}$" => "$\\limsup_{n\\to\\infty}X_n/\\log n=1$",
    "lim $1_{n \\to \\infty} M_{n} /$ ln n = 1" => "$\\liminf_{n\\to\\infty}M_n/\\log n=1$",
    "$X_{n} \\{\\xrightarrow{\\mathrm{~ P ~}}} \\X \\( {\\mathrm{i.e.,}} \\X_{n}$" => "$X_n\\xrightarrow{\\mathbb{P}}X$ (i.e., $X_n$",
    "(a) Prove that: if $X_{n} \\{\\xrightarrow{\\mathrm{~ P ~}}} \\X \\( {\\mathrm{i.e.,}} $X_n$ converges to X in probability) and $Y_{n} \\xrightarrow{\\mathrm{~ P ~}} Y$ then $X_{n} Y_{n} \\xrightarrow{\\textrm{P}} XY$" => "(a) Prove that if $X_n\\xrightarrow{\\mathbb{P}}X$ and $Y_n\\xrightarrow{\\mathbb{P}}Y$, then $X_nY_n\\xrightarrow{\\mathbb{P}}XY$.",
    "(a) Prove that: if $X_{n} \\{\\xrightarrow{\\mathrm{~ P ~}}} \\X \\({\\mathrm{i.e.,}} $X_n$ converges to X in probability) and $Y_{n} \\xrightarrow{\\mathrm{~ P ~}} Y$ then $X_{n} Y_{n} \\xrightarrow{\\textrm{P}} XY$" => "(a) Prove that if $X_n\\xrightarrow{\\mathbb{P}}X$ and $Y_n\\xrightarrow{\\mathbb{P}}Y$, then $X_nY_n\\xrightarrow{\\mathbb{P}}XY$.",
    "(b) Is the following true or false: if $X_{n} \\xrightarrow{L^{1}} X \\(\\mathrm{i.e.,} $X_n$ converges to X in $L^{1})$ and $Y_{n} \\xrightarrow{L^{1}} Y$ then $\\boldsymbol{X_{n}} \\boldsymbol{Y_{n}} \\xrightarrow{\\boldsymbol{L^{1}}}$ XY ? Either prove it or give a counter example." => "(b) Is the following true or false: if $X_n\\xrightarrow{L^1}X$ and $Y_n\\xrightarrow{L^1}Y$, then $X_nY_n\\xrightarrow{L^1}XY$? Either prove it or give a counterexample.",
    "P $^{\\circ}(X_{n} = 1)" => "$\\mathbb{P}(X_n=1)$",
    "with \\mathbb{P}(X_n=1)" => "with $\\mathbb{P}(X_n=1)",
    "e^{tk} \\mathbb{E} M(t)^{- T_{k}}" => "\\mathbb{E}\\left[e^{tS_{T_k}}M(t)^{-T_k}\\right]",
    "s \\le t" => "s\\le t"
  },
  "qzc-qe-probability-statistics-2024-fall" => {
    "${ \\xrightarrow { ( d ) } } \\operatorname { a n d } { \\frac { ( d ) } { = } } $" => "$\\xrightarrow{(d)}$ and $\\overset{(d)}{=}$",
    "\\sum_{k = 1}^{n}{\\bar{U}}_{k}" => "\\sum_{k=1}^n U_k",
    "Z_{n} \\{\\overset{(d)}{=}}$ Bi \\operatorname{\\Pi}_{1}(n, p)" => "$Z_n\\sim\\operatorname{Bin}(n,p)",
    "\\mathrm{forlarge} n" => "\\text{for large }n",
    "\\mathbb{P}(X_{k} \\mid >$ $x)" => "\\mathbb{P}(X_k>x)",
    "on $\\left\\lceil 0, \\theta \\right\\rceil$" => "on $[0,\\theta]$",
    "X_{1},..., X_{n} \\(n \\geq 2)" => "$X_1,\\ldots,X_n$ ($n\\geq2$)",
    "Let $$X_1,\\ldots,X_n$ ($n\\geq2$)$" => "Let $X_1,\\ldots,X_n$ ($n\\geq2$)",
    "X<sup>¯</sup>" => "$\\bar X$"
  },
  "qzc-qe-probability-statistics-2025-spring" => {
    "<sup></sup> " => "• ",
    "{ξ }" => "$\\{\\xi_j\\}$",
    "= - a \\ \\mathrm{or} \\b" => "=-a\\ \text{or}\ b",
    "calculate <sup>E</sup>[T ]" => "calculate $\\mathbb{E}[T]$",
    "\\S_{X}^{2}" => "S_X^2",
    "\\S_{Y}^{2}" => "S_Y^2",
    "I_{\\{x \\geq \\alpha\\}}$ 2 where" => "I_{\\{x\\geq\\alpha\\}}$, where"
  },
  "qzc-qe-probability-statistics-2025-fall" => {
    "${ \\xrightarrow { ( d ) } } \\operatorname { a n d } { \\frac { ( d ) } { = } } $" => "$\\xrightarrow{(d)}$ and $\\overset{(d)}{=}$",
    "Bet $\\begin{array}{r}{\\i(\\alpha, \\beta)" => "Beta $B(\\alpha,\\beta)",
    "$X_{1},..., X_{n}$ <sub>n</sub> be" => "$X_1,\\ldots,X_n$ be"
  },
  "qzc-qe-probability-statistics-2026-spring" => {
    "<sup></sup> " => "• ",
    "<sup> R</sup>" => "• $\\mathbb{R}$",
    "<sup>Rn</sup>" => "$\\mathbb{R}^n$",
    "<sup>P</sup>" => "$\\mathbb{P}$",
    "<sup>Q</sup>" => "$\\mathbb{Q}$",
    "\\begin{array}{r}{P(X = x \\mid \\lambda) = \\frac{e^{- \\lambda} \\lambda^{x}}{x !}; x = 0, 1,...; \\lambda >} \\end{array}$ 0" => "\\(\\mathbb{P}(X=x\\mid\\lambda)=e^{-\\lambda}\\lambda^x/x!\\), for $x=0,1,\\ldots$ and $\\lambda>0$",
    "$$\\mathbb{P}(X=x\\mid\\lambda)=e^{-\\lambda}\\lambda^x/x!$, $x=0,1,\\ldots$, $\\lambda>0$." => "\\(\\mathbb{P}(X=x\\mid\\lambda)=e^{-\\lambda}\\lambda^x/x!\\), for $x=0,1,\\ldots$ and $\\lambda>0$.",
    "f(s) : = \\mathbb{E}[s^{X(1.1)}]" => "f(s):=\\mathbb{E}[s^{X(1,1)}]",
    "$p_{0} > 0$ $p_{0} + p_{1} < 1$" => "$p_0>0$ and $p_0+p_1<1$",
    "\\X_{2}, \\..., \\X_{n}" => "X_2,\\ldots,X_n",
    "as $n \\infty" => "as $n\\to\\infty",
    "\\sqrt{n}(\\tilde{\\lambda} - \\hat{\\lambda}) 0" => "\\sqrt{n}(\\tilde{\\lambda}-\\hat{\\lambda})\\to0"
  }
}.freeze

def paths_for(stem)
  Dir.glob(File.join(ROOT, "*-qe-review", "transcripts", "mineru", stem, "{reading,parts/#{stem}}.md"))
end

changes = 0
CORRECTIONS.each do |stem, replacements|
  paths_for(stem).each do |path|
    content = File.read(path, encoding: "UTF-8")
    original = content.dup
    replacements.each { |from, to| content = content.gsub(from, to) }
    next if content == original

    File.write(path, content, encoding: "UTF-8")
    changes += 1
    warn "proofread #{path}"
  end
end
warn "proofread files=#{changes}"

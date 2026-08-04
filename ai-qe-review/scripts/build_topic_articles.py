#!/usr/bin/env python3
"""Build self-contained ctexart topic files from chapters/topics sources."""

from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CHAPTERS = ROOT / "chapters"
TOPICS = ROOT / "topics"

TOPIC_SPECS = [
    {
        "folder": "01-ml-theory",
        "name": "ml_theory",
        "source": CHAPTERS / "topics" / "01_ml_theory.tex",
        "title": r"求真书院 AI 博士生资格考试\\考点方向一：机器学习理论 (Machine Learning Theory)",
        "label": "sec:ml_theory",
    },
    {
        "folder": "02-deep-rl",
        "name": "deep_rl",
        "source": CHAPTERS / "topics" / "02_deep_rl.tex",
        "title": r"求真书院 AI 博士生资格考试\\考点方向二：高级深度学习与强化学习 (Advanced Deep Learning \& RL)",
        "label": "sec:deep_rl",
    },
    {
        "folder": "03-optimization",
        "name": "optimization",
        "source": CHAPTERS / "topics" / "03_optimization.tex",
        "title": r"求真书院 AI 博士生资格考试\\考点方向三：人工智能中的优化方法 (Optimization Methods for AI)",
        "label": "sec:optimization",
    },
    {
        "folder": "04-nlu",
        "name": "nlu",
        "source": CHAPTERS / "topics" / "04_nlu.tex",
        "title": r"求真书院 AI 博士生资格考试\\考点方向四：自然语言处理与大模型理论 (Natural Language Understanding \& LLM)",
        "label": "sec:nlu",
    },
]


def strip_chapter(body: str) -> str:
    body = re.sub(r"^\\chapter\{[^\n]*\}\n+", "", body)
    body = re.sub(r"^\\label\{ch:([^}]+)\}\n+", r"\\label{sec:\1}\n", body)
    return body


def wrap_command_paragraph(text: str, cmd: str, env: str) -> str:
    """Turn \\cmd <paragraph...> into \\begin{env}...\\end{env}."""
    pattern = re.compile(
        rf"^\\{cmd}\n((?:.*\n)*?)(?=^\n|^\\(?:section|subsection|paragraph|begin|end|source|concepttarget|noindent)|\\Z)",
        re.M,
    )

    def repl(m: re.Match) -> str:
        inner = m.group(1).rstrip()
        return f"\\begin{{{env}}}\n{inner}\n\\end{{{env}}}\n\n"

    return pattern.sub(repl, text)


def wrap_label_block(text: str, cmd: str, env: str) -> str:
    """Turn \\cmd rest-of-line + following material until blank+structural into env."""
    pattern = re.compile(
        rf"^\\{cmd}\s+(.*?)(?=^\n(?:\\(?:section|subsection|paragraph|begin|end|source|concepttarget)|[^\s\\])|^\\(?:section|subsection|paragraph)|\\Z)",
        re.M | re.S,
    )

    def repl(m: re.Match) -> str:
        inner = m.group(1).rstrip()
        # stop before next paragraph that starts a new topic if we over-captured
        return f"\\begin{{{env}}}\n{inner}\n\\end{{{env}}}\n\n"

    return pattern.sub(repl, text)


def remap_ml_theory(body: str) -> str:
    """Hand-targeted semantic remaps for the ML theory topic."""

    # Risk / ERM block after teaching
    body = body.replace(
        "设输入空间为 \(\\mathcal{X}\)，标签空间为 \(\\mathcal{Y}\)，未知数据分布为 \(\\Dcal\)。训练集\n\n"
        "\\[\n"
        "  S=((x_1,y_1),\\ldots,(x_m,y_m))\n"
        "\\]\n\n"
        "由 \(\\Dcal\) 独立同分布抽样得到。假设类 \(\\Hcal\) 是候选预测器集合，损失函数 \(\\ell(h,(x,y))\) 衡量预测器 \(h\) 在样本 \((x,y)\) 上的错误。经验风险和真实风险分别为\n\n"
        "\\[\n"
        "  L_S(h)=\\frac1m\\sum_{i=1}^{m}\\ell(h,(x_i,y_i)),\n"
        "  \\qquad\n"
        "  L_{\\Dcal}(h)=\\E_{(x,y)\\sim\\Dcal}\\ell(h,(x,y)).\n"
        "\\]\n\n"
        "经验风险是可计算的训练误差；真实风险是我们真正关心但无法直接计算的泛化误差。经验风险最小化（ERM）写作\n\n"
        "\\[\n"
        "  h_S\\in \\argmin_{h\\in\\Hcal}L_S(h).\n"
        "\\]\n\n"
        "这一定义背后的直觉很简单：既然看不到总体分布，就先选训练集上表现最好的模型。但 ERM 是否可靠取决于 \(\\Hcal\) 的复杂度。如果 \(\\Hcal\) 太大，它可以把随机噪声也拟合掉，训练误差会系统性偏低。",
        "\\begin{definition}[经验风险、真实风险与 ERM]\n"
        "设输入空间为 \(\\mathcal{X}\)，标签空间为 \(\\mathcal{Y}\)，未知数据分布为 \(\\Dcal\)。训练集\n\n"
        "\\[\n"
        "  S=((x_1,y_1),\\ldots,(x_m,y_m))\n"
        "\\]\n\n"
        "由 \(\\Dcal\) 独立同分布抽样得到。假设类 \(\\Hcal\) 是候选预测器集合，损失函数 \(\\ell(h,(x,y))\) 衡量预测器 \(h\) 在样本 \((x,y)\) 上的错误。经验风险和真实风险分别为\n\n"
        "\\[\n"
        "  L_S(h)=\\frac1m\\sum_{i=1}^{m}\\ell(h,(x_i,y_i)),\n"
        "  \\qquad\n"
        "  L_{\\Dcal}(h)=\\E_{(x,y)\\sim\\Dcal}\\ell(h,(x,y)).\n"
        "\\]\n\n"
        "经验风险最小化（ERM）写作\n\n"
        "\\[\n"
        "  h_S\\in \\argmin_{h\\in\\Hcal}L_S(h).\n"
        "\\]\n"
        "\\end{definition}\n\n"
        "经验风险是可计算的训练误差；真实风险是我们真正关心但无法直接计算的泛化误差。"
        "这一定义背后的直觉很简单：既然看不到总体分布，就先选训练集上表现最好的模型。但 ERM 是否可靠取决于 \(\\Hcal\) 的复杂度。如果 \(\\Hcal\) 太大，它可以把随机噪声也拟合掉，训练误差会系统性偏低。",
    )

    body = body.replace(
        "PAC 是 Probably Approximately Correct 的缩写。它把“学会”写成一个概率命题：样本足够多时，学习算法以高概率输出一个误差不超过目标精度的假设。\n\n"
        "在二分类可实现情形中，假设存在目标函数 \(f\\in\\Hcal\)，标签由 \(y=f(x)\) 生成。算法 \(A\) PAC 学会 \(\\Hcal\)，意思是对任意精度 \(\\varepsilon>0\) 和失败概率 \(\\delta>0\)，当样本量\n\n"
        "\\[\n"
        "  m\\ge m_{\\Hcal}(\\varepsilon,\\delta)\n"
        "\\]\n\n"
        "时，有\n\n"
        "\\[\n"
        "  \\Pbb_{S\\sim \\Dcal^m}\n"
        "  \\left[\n"
        "    L_{\\Dcal}(A(S))\\le \\varepsilon\n"
        "  \\right]\n"
        "  \\ge 1-\\delta.\n"
        "\\]\n\n"
        "这里 \(\\varepsilon\) 是 accuracy parameter，控制允许多错；\(\\delta\) 是 confidence parameter，控制允许多大概率失败。样本复杂度 \(m_{\\Hcal}(\\varepsilon,\\delta)\) 告诉我们要多少样本才能达到这个保证。",
        "PAC 是 Probably Approximately Correct 的缩写。它把“学会”写成一个概率命题：样本足够多时，学习算法以高概率输出一个误差不超过目标精度的假设。\n\n"
        "\\begin{definition}[可实现 PAC 学习]\n"
        "在二分类可实现情形中，假设存在目标函数 \(f\\in\\Hcal\)，标签由 \(y=f(x)\) 生成。算法 \(A\) PAC 学会 \(\\Hcal\)，意思是对任意精度 \(\\varepsilon>0\) 和失败概率 \(\\delta>0\)，当样本量\n\n"
        "\\[\n"
        "  m\\ge m_{\\Hcal}(\\varepsilon,\\delta)\n"
        "\\]\n\n"
        "时，有\n\n"
        "\\[\n"
        "  \\Pbb_{S\\sim \\Dcal^m}\n"
        "  \\left[\n"
        "    L_{\\Dcal}(A(S))\\le \\varepsilon\n"
        "  \\right]\n"
        "  \\ge 1-\\delta.\n"
        "\\]\n"
        "\\end{definition}\n\n"
        "这里 \(\\varepsilon\) 是 accuracy parameter，控制允许多错；\(\\delta\) 是 confidence parameter，控制允许多大概率失败。样本复杂度 \(m_{\\Hcal}(\\varepsilon,\\delta)\) 告诉我们要多少样本才能达到这个保证。",
    )

    body = body.replace(
        "现实中目标函数未必属于 \(\\Hcal\)，甚至标签可能含噪声。Agnostic PAC 不假设可实现性，而是要求算法输出接近类内最优的假设：\n\n"
        "\\[\n"
        "  L_{\\Dcal}(A(S))\n"
        "  \\le\n"
        "  \\inf_{h\\in\\Hcal}L_{\\Dcal}(h)+\\varepsilon\n"
        "\\]\n\n"
        "以至少 \(1-\\delta\) 的概率成立。",
        "\\begin{definition}[Agnostic PAC]\n"
        "现实中目标函数未必属于 \(\\Hcal\)，甚至标签可能含噪声。Agnostic PAC 不假设可实现性，而是要求算法输出接近类内最优的假设：\n\n"
        "\\[\n"
        "  L_{\\Dcal}(A(S))\n"
        "  \\le\n"
        "  \\inf_{h\\in\\Hcal}L_{\\Dcal}(h)+\\varepsilon\n"
        "\\]\n\n"
        "以至少 \(1-\\delta\) 的概率成立。\n"
        "\\end{definition}\n",
    )

    body = body.replace(
        "\\definitionlabel 给定 \\(m\\) 个点 \\(x_1,\\ldots,x_m\\)，增长函数定义为\n\n"
        "\\[\n"
        "  \\tau_{\\Hcal}(m)\n"
        "  =\n"
        "  \\max_{x_1,\\ldots,x_m}\n"
        "  \\left|\n"
        "  \\{\n"
        "    (h(x_1),\\ldots,h(x_m)):h\\in\\Hcal\n"
        "  \\}\n"
        "  \\right|.\n"
        "\\]\n\n"
        "如果\\emph{存在}一个 \\(m\\) 点集，其所有 \\(2^m\\) 种二值标记都能由 \\(\\Hcal\\) 实现，就说该点集被 \\(\\Hcal\\) shatter。用上确界而不是最大值，VC 维的严格定义为\n\n"
        "\\[\n"
        "  d_{\\mathrm{VC}}(\\Hcal)\n"
        "  =\n"
        "  \\sup\\{m\\in\\mathbb{N}:\\tau_{\\Hcal}(m)=2^m\\},\n"
        "\\]\n\n"
        "Sauer 引理说明有限 VC 维会把指数级增长压成多项式增长：若 \\(\\operatorname{VCdim}(\\Hcal)=d<\\infty\\)，则\n\n"
        "\\[\n"
        "  \\tau_{\\Hcal}(m)\n"
        "  \\le\n"
        "  \\sum_{i=0}^{d}\\binom{m}{i}\n"
        "  \\le\n"
        "  \\left(\\frac{em}{d}\\right)^d\n"
        "  \\quad (m\\ge d).\n"
        "\\]\n\n"
        "并约定集合无上界时 \\(d_{\\mathrm{VC}}(\\Hcal)=\\infty\\)。这条引理的意义是：即使 \\(\\Hcal\\) 无限，只要 VC 维有限，在 \\(m\\) 个样本上它能产生的标记模式也只有多项式多；但要得到随机样本上的统一收敛，不能直接把有限类证明中的 \\(|\\Hcal|\\) 替换成 \\(\\tau_{\\Hcal}(m)\\)。",
        "\\begin{definition}[增长函数与 VC 维]\n"
        "给定 \\(m\\) 个点 \\(x_1,\\ldots,x_m\\)，增长函数定义为\n\n"
        "\\[\n"
        "  \\tau_{\\Hcal}(m)\n"
        "  =\n"
        "  \\max_{x_1,\\ldots,x_m}\n"
        "  \\left|\n"
        "  \\{\n"
        "    (h(x_1),\\ldots,h(x_m)):h\\in\\Hcal\n"
        "  \\}\n"
        "  \\right|.\n"
        "\\]\n\n"
        "如果\\emph{存在}一个 \\(m\\) 点集，其所有 \\(2^m\\) 种二值标记都能由 \\(\\Hcal\\) 实现，就说该点集被 \\(\\Hcal\\) shatter。VC 维定义为\n\n"
        "\\[\n"
        "  d_{\\mathrm{VC}}(\\Hcal)\n"
        "  =\n"
        "  \\sup\\{m\\in\\mathbb{N}:\\tau_{\\Hcal}(m)=2^m\\},\n"
        "\\]\n"
        "并约定集合无上界时 \\(d_{\\mathrm{VC}}(\\Hcal)=\\infty\\)。\n"
        "\\end{definition}\n\n"
        "\\begin{lemma}[Sauer]\n"
        "若 \\(\\operatorname{VCdim}(\\Hcal)=d<\\infty\\)，则\n\n"
        "\\[\n"
        "  \\tau_{\\Hcal}(m)\n"
        "  \\le\n"
        "  \\sum_{i=0}^{d}\\binom{m}{i}\n"
        "  \\le\n"
        "  \\left(\\frac{em}{d}\\right)^d\n"
        "  \\quad (m\\ge d).\n"
        "\\]\n"
        "\\end{lemma}\n\n"
        "这条引理的意义是：即使 \\(\\Hcal\\) 无限，只要 VC 维有限，在 \\(m\\) 个样本上它能产生的标记模式也只有多项式多；但要得到随机样本上的统一收敛，不能直接把有限类证明中的 \\(|\\Hcal|\\) 替换成 \\(\\tau_{\\Hcal}(m)\\)。",
    )

    body = body.replace(
        "\\proofsketchlabel 以下骨架针对二值类的 \\(0\\)--\\(1\\) 损失",
        "\\begin{proofsketch}\n以下骨架针对二值类的 \\(0\\)--\\(1\\) 损失",
    )
    # close proofsketch before "典型的 VC 泛化界"
    body = body.replace(
        "这就是 VC 泛化界的来源。考试若要求“说明样本复杂度和 VC 维的关系”，应写出 ghost sample、symmetrization、\\(\\tau_{\\Hcal}(2m)\\) 与 Sauer 引理这条链，而不是把增长函数直接代入固定假设的 Hoeffding 界。\n\n"
        "典型的 VC 泛化界写作",
        "这就是 VC 泛化界的来源。考试若要求“说明样本复杂度和 VC 维的关系”，应写出 ghost sample、symmetrization、\\(\\tau_{\\Hcal}(2m)\\) 与 Sauer 引理这条链，而不是把增长函数直接代入固定假设的 Hoeffding 界。\n"
        "\\end{proofsketch}\n\n"
        "\\begin{theorem}[VC 泛化界（典型形式）]\n"
        "典型的 VC 泛化界写作",
    )
    body = body.replace(
        "对所有 \\(h\\in\\Hcal\\) 同时成立。考试中不必执着于常数，但必须看懂 \\(d/m\\) 是主导量：样本量远大于 VC 维时，训练误差才会可靠。",
        "对所有 \\(h\\in\\Hcal\\) 同时成立。\n"
        "\\end{theorem}\n\n"
        "考试中不必执着于常数，但必须看懂 \\(d/m\\) 是主导量：样本量远大于 VC 维时，训练误差才会可靠。",
    )

    body = body.replace(
        "Rademacher complexity 是另一种更细的复杂度度量。它问的是：函数类能多好地拟合随机噪声？给定样本 \\(S=(z_1,\\ldots,z_m)\\)，经验 Rademacher complexity 为\n\n"
        "\\[\n"
        "  \\widehat{\\mathfrak{R}}_S(\\mathcal{G})\n"
        "  =\n"
        "  \\E_{\\sigma}\n"
        "  \\left[\n"
        "    \\sup_{g\\in\\mathcal{G}}\n"
        "    \\frac1m\n"
        "    \\sum_{i=1}^{m}\\sigma_i g(z_i)\n"
        "  \\right],\n"
        "\\]\n\n"
        "其中 \\(\\sigma_i\\) 独立均匀取值于 \\(\\{-1,+1\\}\\)。如果 \\(\\mathcal{G}\\) 能让内积 \\(\\sum_i\\sigma_i g(z_i)\\) 很大，说明它可以跟随机标签高度相关，复杂度高，泛化风险也高。它比 VC 维更数据依赖，在 margin 类和核方法中尤其自然。",
        "\\begin{definition}[经验 Rademacher complexity]\n"
        "给定样本 \\(S=(z_1,\\ldots,z_m)\\)，经验 Rademacher complexity 为\n\n"
        "\\[\n"
        "  \\widehat{\\mathfrak{R}}_S(\\mathcal{G})\n"
        "  =\n"
        "  \\E_{\\sigma}\n"
        "  \\left[\n"
        "    \\sup_{g\\in\\mathcal{G}}\n"
        "    \\frac1m\n"
        "    \\sum_{i=1}^{m}\\sigma_i g(z_i)\n"
        "  \\right],\n"
        "\\]\n\n"
        "其中 \\(\\sigma_i\\) 独立均匀取值于 \\(\\{-1,+1\\}\\)。\n"
        "\\end{definition}\n\n"
        "Rademacher complexity 问的是：函数类能多好地拟合随机噪声？"
        "如果 \\(\\mathcal{G}\\) 能让内积 \\(\\sum_i\\sigma_i g(z_i)\\) 很大，说明它可以跟随机标签高度相关，复杂度高，泛化风险也高。"
        "它比 VC 维更数据依赖，在 margin 类和核方法中尤其自然。",
    )

    # Bias-variance
    body = body.replace(
        "偏差方差分解是平方损失下的对应版本。设训练集随机，学习算法输出 \\(\\hat f_S(x)\\)，对固定 \\(x\\) 有\n\n"
        "\\[\n"
        "  \\E_S[(\\hat f_S(x)-f(x))^2]\n"
        "  =\n"
        "  \\left(\\E_S[\\hat f_S(x)]-f(x)\\right)^2\n"
        "  +\n"
        "  \\E_S\\left[\n"
        "    \\left(\\hat f_S(x)-\\E_S[\\hat f_S(x)]\\right)^2\n"
        "  \\right].\n"
        "\\]\n\n"
        "第一项是 bias squared，表示平均预测离真函数多远；第二项是 variance，表示换一批训练集后预测波动多大。正则化、交叉验证、结构风险最小化（SRM）都可以看作在这两者之间调参。",
        "\\begin{definition}[偏差--方差分解（平方损失）]\n"
        "设训练集随机，学习算法输出 \\(\\hat f_S(x)\\)，对固定 \\(x\\) 有\n\n"
        "\\[\n"
        "  \\E_S[(\\hat f_S(x)-f(x))^2]\n"
        "  =\n"
        "  \\left(\\E_S[\\hat f_S(x)]-f(x)\\right)^2\n"
        "  +\n"
        "  \\E_S\\left[\n"
        "    \\left(\\hat f_S(x)-\\E_S[\\hat f_S(x)]\\right)^2\n"
        "  \\right].\n"
        "\\]\n"
        "\\end{definition}\n\n"
        "第一项是 bias squared，表示平均预测离真函数多远；第二项是 variance，表示换一批训练集后预测波动多大。"
        "正则化、交叉验证、结构风险最小化（SRM）都可以看作在这两者之间调参。",
    )

    # Hard-margin SVM
    body = body.replace(
        "线性 SVM 的核心是 margin。给定二分类样本 \\(y_i\\in\\{-1,+1\\}\\)，硬间隔 SVM 求\n\n"
        "\\[\n"
        "  \\min_{w,b}\\frac12\\|w\\|_2^2\n"
        "  \\quad\n"
        "  \\text{s.t.}\n"
        "  \\quad\n"
        "  y_i(\\langle w,x_i\\rangle+b)\\ge 1,\\quad i=1,\\ldots,m.\n"
        "\\]\n",
        "\\begin{definition}[硬间隔 SVM]\n"
        "给定二分类样本 \\(y_i\\in\\{-1,+1\\}\\)，硬间隔 SVM 求\n\n"
        "\\[\n"
        "  \\min_{w,b}\\frac12\\|w\\|_2^2\n"
        "  \\quad\n"
        "  \\text{s.t.}\n"
        "  \\quad\n"
        "  y_i(\\langle w,x_i\\rangle+b)\\ge 1,\\quad i=1,\\ldots,m.\n"
        "\\]\n"
        "\\end{definition}\n\n"
        "线性 SVM 的核心是 margin。\n",
    )

    # PSD kernel
    body = body.replace(
        "严格地说，实值核 \\(k:\\mathcal{X}\\times\\mathcal{X}\\to\\R\\) 必须对称，即 \\(k(x,x')=k(x',x)\\)，并对任意有限点集 \\(x_1,\\ldots,x_m\\) 以及任意系数 \\(c\\in\\R^m\\) 满足\n\n"
        "\\[\n"
        "  \\sum_{i,j=1}^{m}c_i c_j k(x_i,x_j)\\ge 0.\n"
        "\\]\n\n"
        "等价地，每一个有限 Gram 矩阵\n\n"
        "\\[\n"
        "  [K(x_i,x_j)]_{i,j=1}^{m}\n"
        "\\]\n\n"
        "半正定。",
        "\\begin{definition}[正定核]\n"
        "实值核 \\(k:\\mathcal{X}\\times\\mathcal{X}\\to\\R\\) 必须对称，即 \\(k(x,x')=k(x',x)\\)，并对任意有限点集 \\(x_1,\\ldots,x_m\\) 以及任意系数 \\(c\\in\\R^m\\) 满足\n\n"
        "\\[\n"
        "  \\sum_{i,j=1}^{m}c_i c_j k(x_i,x_j)\\ge 0.\n"
        "\\]\n\n"
        "等价地，每一个有限 Gram 矩阵 \\([K(x_i,x_j)]_{i,j=1}^{m}\\) 半正定。\n"
        "\\end{definition}\n",
    )

    # RIP
    body = body.replace(
        "RIP 的形式为：对所有 \\(s\\)-稀疏向量 \\(z\\)，\n\n"
        "\\[\n"
        "  (1-\\delta_S)\\|z\\|_2^2\n"
        "  \\le\n"
        "  \\|Mz\\|_2^2\n"
        "  \\le\n"
        "  (1+\\delta_S)\\|z\\|_2^2.\n"
        "\\]\n",
        "\\begin{definition}[限制等距性质 (RIP)]\n"
        "对所有 \\(s\\)-稀疏向量 \\(z\\)，\n\n"
        "\\[\n"
        "  (1-\\delta_S)\\|z\\|_2^2\n"
        "  \\le\n"
        "  \\|Mz\\|_2^2\n"
        "  \\le\n"
        "  (1+\\delta_S)\\|z\\|_2^2.\n"
        "\\]\n"
        "\\end{definition}\n",
    )

    return body


def remap_optimization(body: str) -> str:
    body = body.replace(
        "集合 \\(C\\subseteq\\R^d\\) 是凸的，表示任意 \\(x,y\\in C\\) 和 \\(\\theta\\in[0,1]\\)，都有\n\n"
        "\\[\n"
        "  \\theta x+(1-\\theta)y\\in C.\n"
        "\\]\n\n"
        "函数 \\(f:C\\to\\R\\) 是凸的，表示\n\n"
        "\\[\n"
        "  f(\\theta x+(1-\\theta)y)\n"
        "  \\le\n"
        "  \\theta f(x)+(1-\\theta)f(y).\n"
        "\\]\n",
        "\\begin{definition}[凸集与凸函数]\n"
        "集合 \\(C\\subseteq\\R^d\\) 是凸的，表示任意 \\(x,y\\in C\\) 和 \\(\\theta\\in[0,1]\\)，都有\n\n"
        "\\[\n"
        "  \\theta x+(1-\\theta)y\\in C.\n"
        "\\]\n\n"
        "函数 \\(f:C\\to\\R\\) 是凸的，表示\n\n"
        "\\[\n"
        "  f(\\theta x+(1-\\theta)y)\n"
        "  \\le\n"
        "  \\theta f(x)+(1-\\theta)f(y).\n"
        "\\]\n"
        "\\end{definition}\n",
    )
    body = body.replace(
        "若函数不可微，使用次梯度。向量 \\(g\\in\\R^d\\) 是 \\(f\\) 在 \\(x\\) 的次梯度，若\n\n"
        "\\[\n"
        "  f(y)\\ge f(x)+\\langle g,y-x\\rangle\n"
        "  \\quad\n"
        "  \\forall y.\n"
        "\\]\n\n"
        "所有次梯度构成次微分 \\(\\partial f(x)\\)。最优性条件变成\n\n"
        "\\[\n"
        "  0\\in \\partial f(x^*).\n"
        "\\]\n",
        "\\begin{definition}[次梯度与次微分]\n"
        "向量 \\(g\\in\\R^d\\) 是 \\(f\\) 在 \\(x\\) 的次梯度，若\n\n"
        "\\[\n"
        "  f(y)\\ge f(x)+\\langle g,y-x\\rangle\n"
        "  \\quad\n"
        "  \\forall y.\n"
        "\\]\n\n"
        "所有次梯度构成次微分 \\(\\partial f(x)\\)。最优性条件（Fermat rule）为\n\n"
        "\\[\n"
        "  0\\in \\partial f(x^*).\n"
        "\\]\n"
        "\\end{definition}\n",
    )
    return body


def remap_deep_rl(body: str) -> str:
    body = body.replace(
        "一个多层感知机（MLP）可以写成函数复合：\n\n"
        "\\[\n"
        "  h_0=x,\n"
        "  \\qquad\n"
        "  a_\\ell=W_\\ell h_{\\ell-1}+b_\\ell,\n"
        "  \\qquad\n"
        "  h_\\ell=\\phi(a_\\ell),\n"
        "  \\qquad\n"
        "  \\ell=1,\\ldots,L.\n"
        "\\]\n",
        "\\begin{definition}[多层感知机]\n"
        "一个多层感知机（MLP）可以写成函数复合：\n\n"
        "\\[\n"
        "  h_0=x,\n"
        "  \\qquad\n"
        "  a_\\ell=W_\\ell h_{\\ell-1}+b_\\ell,\n"
        "  \\qquad\n"
        "  h_\\ell=\\phi(a_\\ell),\n"
        "  \\qquad\n"
        "  \\ell=1,\\ldots,L.\n"
        "\\]\n"
        "\\end{definition}\n",
    )
    body = body.replace(
        "反向传播只是链式法则的动态规划。设单样本损失为 \\(J=\\Lcal(h_L,y)\\)，定义\n\n"
        "\\[\n"
        "  \\delta_\\ell=\\frac{\\partial J}{\\partial a_\\ell}.\n"
        "\\]\n",
        "反向传播只是链式法则的动态规划。\n\n"
        "\\begin{definition}[层误差 / adjoint]\n"
        "设单样本损失为 \\(J=\\Lcal(h_L,y)\\)，定义\n\n"
        "\\[\n"
        "  \\delta_\\ell=\\frac{\\partial J}{\\partial a_\\ell}.\n"
        "\\]\n"
        "\\end{definition}\n",
    )
    # Value functions
    body = body.replace(
        "值函数和动作值函数定义为\n\n",
        "\\begin{definition}[值函数与动作值函数]\n"
        "值函数和动作值函数定义为\n\n",
    )
    # Close after the display that typically follows - heuristic: find next blank+paragraph after definition start
    # Safer: close before next prose sentence about Bellman if present
    if "\\begin{definition}[值函数与动作值函数]" in body and "\\end{definition}" not in body.split("\\begin{definition}[值函数与动作值函数]", 1)[1][:800]:
        body = re.sub(
            r"(\\begin\{definition\}\[值函数与动作值函数\].*?\\]\n)(\n)",
            r"\1\\end{definition}\n\2",
            body,
            count=1,
            flags=re.S,
        )
    return body


def remap_nlu(body: str) -> str:
    body = body.replace(
        "语言模型给序列 \\(w_{1:n}\\) 分配概率。链式法则给出\n\n"
        "\\[\n"
        "  P(w_{1:n})\n"
        "  =\n"
        "  \\prod_{i=1}^{n}P(w_i\\mid w_{1:i-1}).\n"
        "\\]\n\n"
        "\\(n\\)-gram 模型用 Markov 假设截断历史：\n\n"
        "\\[\n"
        "  P(w_i\\mid w_{1:i-1})\n"
        "  \\approx\n"
        "  P(w_i\\mid w_{i-n+1:i-1}).\n"
        "\\]\n",
        "\\begin{definition}[语言模型与 \\(n\\)-gram]\n"
        "语言模型给序列 \\(w_{1:n}\\) 分配概率。链式法则给出\n\n"
        "\\[\n"
        "  P(w_{1:n})\n"
        "  =\n"
        "  \\prod_{i=1}^{n}P(w_i\\mid w_{1:i-1}).\n"
        "\\]\n\n"
        "\\(n\\)-gram 模型用 Markov 假设截断历史：\n\n"
        "\\[\n"
        "  P(w_i\\mid w_{1:i-1})\n"
        "  \\approx\n"
        "  P(w_i\\mid w_{i-n+1:i-1}).\n"
        "\\]\n"
        "\\end{definition}\n",
    )
    return body


def convert_macros(body: str) -> str:
    body = wrap_command_paragraph(body, "teaching", "teaching")
    body = wrap_command_paragraph(body, "examnote", "examnote")
    # leftover inline forms at start of paragraph with following text on same/next lines
    body = re.sub(
        r"^\\teaching\s+",
        r"\\begin{teaching}\n",
        body,
        flags=re.M,
    )
    # If we opened teaching without close, leave for remap; prefer already wrapped
    body = wrap_label_block(body, "definitionlabel", "definition")
    body = wrap_label_block(body, "theoremlabel", "theorem")
    body = wrap_label_block(body, "proofsketchlabel", "proofsketch")
    body = wrap_label_block(body, "heuristiclabel", "heuristic")
    body = wrap_label_block(body, "engineeringlabel", "engineering")
    # Remove obsolete label macros if any remain as bare mentions in prose about the macros
    body = body.replace(
        "本章用 \\definitionlabel、\\theoremlabel、\\proofsketchlabel、\\heuristiclabel 与 \\engineeringlabel",
        "本章用 \\texttt{definition}/\\texttt{theorem}/\\texttt{proofsketch}/\\texttt{heuristic}/\\texttt{engineering} 环境",
    )
    return body


def wrap_article(title: str, body: str) -> str:
    return (
        "%!TEX program = xelatex\n"
        "\\documentclass[11pt]{ctexart}\n"
        "\\input{../article-preamble}\n\n"
        f"\\title{{\\bfseries {title}}}\n"
        "\\author{清华大学求真书院 AI 方向博士生资格考试备考资料}\n"
        "\\date{\\today}\n\n"
        "\\begin{document}\n\n"
        "\\maketitle\n"
        "\\tableofcontents\n\n"
        f"{body.rstrip()}\n\n"
        "\\printbibliography[heading=bibintoc,title={参考文献与官方来源}]\n\n"
        "\\end{document}\n"
    )


def build_topic(spec: dict) -> Path:
    raw = spec["source"].read_text(encoding="utf-8")
    body = strip_chapter(raw)
    body = convert_macros(body)
    name = spec["name"]
    if name == "ml_theory":
        body = remap_ml_theory(body)
    elif name == "optimization":
        body = remap_optimization(body)
    elif name == "deep_rl":
        body = remap_deep_rl(body)
    elif name == "nlu":
        body = remap_nlu(body)
    out = wrap_article(spec["title"], body)
    out_path = TOPICS / spec["folder"] / f"{spec['name']}.tex"
    out_path.write_text(out, encoding="utf-8")
    return out_path


def build_syllabus() -> Path:
    preface = strip_chapter((CHAPTERS / "00-preface.tex").read_text(encoding="utf-8"))
    # Drop cross-refs to chapters not in this article; soften wording
    preface = preface.replace(
        "第 \\ref{ch:syllabus} 章和第 \\ref{ch:primer} 章",
        "本讲义与理论预备材料",
    )
    preface = preface.replace(
        "第 \\ref{ch:2025spring}--\\ref{ch:2026spring} 章",
        "各年份真题解答",
    )
    preface = preface.replace(
        "第 \\ref{ch:checklists} 章的 checklist",
        "考前 checklist",
    )

    textbooks = (CHAPTERS / "01-textbooks.tex").read_text(encoding="utf-8")
    syllabus = strip_chapter((CHAPTERS / "01-syllabus.tex").read_text(encoding="utf-8"))
    syllabus = syllabus.replace("\\input{chapters/01-textbooks}\n\n", textbooks + "\n\n")
    syllabus = syllabus.replace(
        "在第 \\ref{ch:primer} 章及各年份真题章中展开",
        "在理论预备与各年份真题解答中展开",
    )

    body = (
        "\\section{说明与使用方式}\n\n"
        + re.sub(r"^\\section\{", r"\\subsection{", preface, flags=re.M)
        + "\n\n"
        + "\\section{考试大纲与考点地图}\n"
        + "\\label{sec:syllabus}\n\n"
        + re.sub(
            r"^\\label\{sec:syllabus\}\n+",
            "",
            syllabus,
        )
    )
    # demote nested sections in syllabus body: first line after our section header already has content
    # Original syllabus sections become subsections
    # Avoid demoting the outer ones we just added — demote only former top-level sections inside syllabus chunk
    # The syllabus variable still has \section{机器学习理论} etc.
    parts = body.split("\\section{考试大纲与考点地图}\n\\label{sec:syllabus}\n\n", 1)
    if len(parts) == 2:
        head, syl = parts
        syl = re.sub(r"^\\section\{", r"\\subsection{", syl, flags=re.M)
        syl = re.sub(r"^\\subsection\{", r"\\subsubsection{", syl, flags=re.M)
        # oops - that demoted all subsections including what were sections. Fix: only one-level demote
        # Restore: we wanted section->subsection, subsection was \subsubsection in textbooks via command.
        # Re-do more carefully:
    preface_part = (
        "\\section{说明与使用方式}\n\n"
        + re.sub(r"^\\section\{", r"\\subsection{", preface, flags=re.M)
    )
    syl_body = strip_chapter((CHAPTERS / "01-syllabus.tex").read_text(encoding="utf-8"))
    syl_body = syl_body.replace("\\input{chapters/01-textbooks}\n\n", textbooks + "\n\n")
    syl_body = syl_body.replace(
        "在第 \\ref{ch:primer} 章及各年份真题章中展开",
        "在理论预备与各年份真题解答中展开",
    )
    syl_body = re.sub(r"^\\label\{sec:syllabus\}\n+", "", syl_body)
    syl_body = re.sub(r"^\\section\{", r"\\subsection{", syl_body, flags=re.M)

    body = (
        preface_part
        + "\n\n\\section{考试大纲与考点地图}\n"
        + "\\label{sec:syllabus}\n\n"
        + syl_body
    )
    body = convert_macros(body)
    out = wrap_article(
        r"求真书院 AI 博士生资格考试\\模块一：考试大纲与参考书目 (Syllabus \& Textbooks)",
        body,
    )
    out_path = TOPICS / "00-syllabus" / "syllabus.tex"
    out_path.write_text(out, encoding="utf-8")
    return out_path


def main() -> None:
    for spec in TOPIC_SPECS:
        path = build_topic(spec)
        print(f"wrote {path.relative_to(ROOT)}")
    path = build_syllabus()
    print(f"wrote {path.relative_to(ROOT)}")


if __name__ == "__main__":
    main()

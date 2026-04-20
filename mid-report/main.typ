#import "@local/aytony:1.0.0": *
#import "@preview/numbly:0.1.0": numbly
#show: aytony-cn-traits

#set page(numbering: none)
#set heading(numbering: numbly("{1:一}、", "{2}.", "（{3}）"))
#set par(spacing: 1.2em, leading: 1.2em)
#set list(indent: 1.15em)
#set enum(indent: .75em)
#show bibliography: set heading(numbering: numbly("{1:一}、"))
#show link: set text(hyphenate: true, fill: black)
#show link: body => [#show strong: body => body.body;#body]
#set page(
  header: [
    #set align(center)
    #set text(zh(5))
    北京航空航天大学电子信息工程学院\ 
    #v(-.3em)
    #line(length: 100%, stroke: 1pt + black)
  ],
 footer: context [
    #set align(center)
    #set text(zh(-5))
    #counter(page).display("1")
  ],
  margin: (x: 3.18cm, y: 3cm)
)

#show heading.where(level: 1): set text(
  zh(3),
  fill: black,
  font: ("SimHei"),
  weight: "regular"
)
#show heading.where(level: 1): it => block(
  above: 3em,
  below: 1.5em,
)[
  #counter(heading).display(it.numbering)
  #it.body
]

#show heading.where(level: 2): set text(
  zh(-3),
  fill: black,
  font: ("SimHei"),
  weight: "regular"
)
#show heading.where(level: 2): it => block(
  above: 2em,
  below: 1.5em,
)[
  #counter(heading).display(it.numbering)
  #it.body
]

#show heading.where(level: 3): set text(
  zh(-4),
  fill: black,
  font: ("SimHei"),
  weight: "regular"
)
#show heading.where(level: 3): it => block(
  above: 1.5em,
  below: 1.5em,
)[
  #counter(heading).display(it.numbering)
  #it.body
]

#let mythm = thmenv(
  "mythm", none, none,
  (name, number, body, title: "测试") => block(
    above: 2em,
    below: 2em,
  )[

    #h(-2em)
    #if name != none [
      *#title #number（#name）*
    ] else [
      *#title #number*
    ]
    #h(.7em)
    #body
  ]
).with(numbering: "1")

#let mypf = thmenv(
  "mythm", none, none,
  (name, number, body, title: "测试") => block(
    above: 2em,
    below: 2em,
  )[

    #h(-2em)
    #if name != none [
      *#title（#name）*
    ] else [
      *#title*
    ]
    #h(.7em)
    #proof-bodyfmt(body)
  ]
).with(numbering: none)

#let de = mythm.with(title: "定义", supplement: "定义")
#let prop = mythm.with(title: "命题", supplement: "命题")
#let ex = mythm.with(title: "例子", supplement: "例子")
#let pf = mypf.with(title: "证明", supplement: "证明")

#align(center)[
  #{" "}
  
  #v(3em)

  #image("buaa-char.png", width: 50%)

  #v(-2em)
  #text(36pt, font: ("Times New Roman", "STXingkai"))[
    毕业设计中期报告
  ]

  #v(6em)

  #text(zh(2), font: "Microsoft Yahei")[
    #set par(leading: 1.5em)
    概率计算网络中混合概率数\
    的数学建模与理论分析
  ]

  #v(8em)

  #text(zh(-3))[
    #show grid.cell: set text(font: "SimHei")
    #show grid.cell.where(x: 0): set text(tracking: 1em)
    #show grid.cell.where(x: 1): set text(tracking: .2em)
    #set grid(
      stroke: (x, y) => if x == 1 {
        (bottom: .5pt + black)
      },
      inset: (x, y) => if x == 1 { (x: 3em, y: .5em) } else { .5em }
    )
    #grid(
      columns: 2,
      column-gutter: 1em,
      row-gutter: .5em,
      [院系名称], [数学科学学院],
      [专业名称], [数学与应用数学],
      [学生姓名], [安阳],
      [指导老师], [李洪革、魏光美],
    )
  ]

  #v(4em)
  #text(zh(-3), font: ("Times New Roman", "Microsoft Yahei"))[
    2026 年 4 月 13 日
  ]
]

#pagebreak()

#align(center)[
  #block(
    above: 3em,
    below: 1.5em,
  )[
    #set text(
      zh(3),
      fill: black,
      font: ("SimHei"),
      weight: "regular"
    )

    目录
  ]
]

#outline(title: none)

#pagebreak()

#align(center)[
  #block(
    above: 3em,
    below: 1.5em,
  )[
    #set text(
      zh(3),
      fill: black,
      font: ("SimHei"),
      weight: "regular"
    )

    任务书
  ]

  #let unchecked-sym = box(
    stroke: .05em + black,
    fill: white,
    height: .8em,
    width: .8em,
    radius: .1em,
    baseline: .08em
  )

  #let checked-sym = box(
    stroke: .05em + black,
    fill: white,
    height: .8em,
    width: .8em,
    radius: 0.1em,
    {
      box(move(dy: .48em, dx: 0.1em, rotate(45deg, reflow: false, line(length: 0.3em, stroke: black + .1em))))
      box(move(dy: .38em, dx: -0.05em, rotate(-45deg, reflow: false, line(length: 0.48em, stroke: black + .1em))))
    },
    baseline: .08em
  )

  #table(
    columns: 6,
    inset: 13pt,
    stroke: .5pt,
    [*学生姓名*], [安阳], [*学号*], [22377264], [*专业*], [数学与应用数学],
    table.cell(colspan: 1)[*校内导师*], table.cell(colspan: 5)[李洪革], 
    table.cell(colspan: 1)[*校外导师*], table.cell(colspan: 5)[无], 
    table.cell(colspan: 1)[*毕设地点*], table.cell(colspan: 5)[北京航空航天大学], 
    table.cell(colspan: 1)[*毕设题目*], table.cell(colspan: 5)[概率计算网络中混合概率数的数学建模与理论分析], 
    table.cell(colspan: 1)[*论文类型*], table.cell(colspan: 5)[#unchecked-sym 工程设计 #h(1em)#checked-sym 理论研究 #h(1em)#unchecked-sym 实验 #h(1em)#unchecked-sym 其他], 
    table.cell(colspan: 6)[
      #set par(first-line-indent: 0em)
      #align(left)[
        *工作内容：*本研究旨在构建一套完整的 HSN 数学理论体系，严格推导噪声、函数运算、算术运算及它们共同作用情况对 HSN 统计特征的影响，最终指导 HSN
在神经网络实践下的参数设计。拟开展的研究工作可大致分为HSN 的数学定义和基础性质研究、基于 HSN
的基础算术运算单元建模与分布特征演化分析、非线性激活函数在 HSN 域的数学逼近理论研究、网络级误差累积模型与系统稳定性讨论四部分。\ \ 

        *预期目标及设计技术要求：*预期产出在两方面。其一，构建 HSN 数学理论框架，求解噪声、加法、乘法、除法、通过 Bernstein
        多项式逼近的复杂函数映射对 HSN 分布及分布特征的作用及影响，并分析 HSN 网络相对于 BN
        网络数字表示误差的上界，进而尝试证明 HSN 网络在分类问题上的有效性（即分类准确率和 BN
        网络几乎一致），理论结果以毕业论文的方式产出；其二，通过 C++/Python 构建仿真程序，利用 Monte Carlo 算法，模拟 HSN 在不同强度下的噪声、加法、乘法、除法、通过 Bernstein 多项式逼近的复杂函数等条件下的分布及分布特征的变化，并与理论推导结果相比较，进行验证，以软件及代码的形式进行产出。
      ]
      #v(1fr)
      #align(right)[
        指导教师签字：#h(10em) \ \

        #h(6em)年#h(3em)月#h(3em)日
      ]
    ], 
  )
]

#pagebreak()

= 毕设工作简介

== 课题来源、研究目的及意义

=== 课题来源

本课题聚焦下一代边缘计算高效能架构。物联网与人工智能的爆发使边缘设备对低功耗、小面积及高可靠性逻辑需求激增 @Alaghi2013。传统二进制架构面临算力与功耗的尖锐对立 @LiDomestic2024，而传统概率计算（SC）虽具高容错与极简逻辑，但在高精度下存在时延指数级增长的局限 @Gaines1967。

在此背景下，本课题依托概率计算演进范式，重点研究混合概率数（HSN）模型。该模型通过结合二进制权值与概率脉冲进行混合编码，旨在从数学机理上打破“精度-时延”瓶颈 @Li2022。本研究将探讨该系统的数学表征，为边缘智能芯片提供理论支撑。

=== 研究目的

本研究旨在构建 HSN 数学理论框架，论证其在边缘智能场景下的数理优越性，并指导复杂神经网络下的参数设计。

研究首先确立 HSN 的形式化定义与统计表征，力求在理论上突破传统 SC 时延瓶颈 @Li2024。随后，通过分析代数运算对 HSN 分布的影响，推导运算结果的统计特征 @Najafi2019；并引入逼近理论，论证 HSN 实现非线性激活函数时的收敛特性 @Li2024。最终，通过构建层间传输与误差累积方程，为大规模神经网络在 HSN 框架下的全局稳定性提供理论判据 @Liu2016。此外，HSN 的定义可统一描述 BN 与 SN，进而导出二者的概率运算性质。

=== 研究意义

1. *理论意义*：通过 HSN 建模为非位置数值表示法提供新视角，丰富随机信号处理内涵；建立不依赖硬件仿真的精度预测模型，为评估概率计算提供数学依据。
2. *应用意义*：文献表明 HSN 架构在同等精度下可显著降低硬件资源与功耗（如 40nm 工艺下的超低动态功耗）@Li2024。本研究将直接助力边缘 AI 芯片设计，并为航空航天、医疗植入等高可靠性领域提供关键支撑 @Liu2016。

== 国内外研究现状

=== 概率计算的起源与演进

概率计算最早由 Gaines@Gaines1967 提出。其核心思想是利用比特流中逻辑电平为“1”的概率来表征数值。进入 21 世纪后，随着摩尔定律趋于极限以及边缘计算对能效比的极致追求，SC 因其极简的硬件算子（如一个与门实现乘法）和极高的容错性重新成为学术界的研究热点@Alaghi2013。

国际上，Alaghi@Alaghi2013 对 SC
的发展进行了系统的梳理，指出传统概率计算面临的核心瓶颈在于精度和时延之间的矛盾：为了获取更高的计算精度，脉冲序列长度需呈指数级增长（$2^n$），这导致了巨大的计算延时。为了解决这一问题，Najafi
等@NajafiDeterm2019 提出了确定性脉冲流计算方法，以及@Najafi2019 提出的分辨率分割技术，试图通过消除随机波动来缩短流长度。此外，使用 Sobol 序列等准随机数代替伪随机数也是提升计算速度的重要手段@Sobol1988。

=== 混合概率计算与 HSN 模型的研究

针对传统概率数（SN）表示效率低下的问题，国内研究团队@LiDomestic2024 指出，混合概率计算是当前概率计算领域的重要方向。通过将二进制数的位置权属性与概率流的统计属性相结合，可以大幅提升信息携带效率。

在理论模型方面，他们探讨了二进制逻辑与概率逻辑的混合计算系统@Li2022，奠定了混合逻辑的数学基础。随后，在 2024 年的最新研究中，该团队正式提出了HSN模型@Li2024。HSN 通过将数值分解为由二进制权位引导的多个概率流，在理论上实现了精度随硬件资源线性增长而非指数增长的飞跃，突破了传统 SC 的性能天花板。

=== 概率计算在神经网络中的应用

在复杂系统实现方面，利用概率计算实现深度神经网络已成为主流趋势。早期的研究如 Liu 等@Liu2016 提出的新型 SC 架构和 Ardakan@Ardakani2017 实现的积分概率计算，主要侧重于如何利用 SC 的低功耗特性优化神经元算子。

最新的 HSN 模型则进一步展示了其在神经网络中的强大潜力。最新研究@LiDomestic2024@Li2024 展示了利用 40nm 工艺实现的 HSN 神经网络芯片，在极小的内核面积下部署了数千个 MAC 单元，其能效比相较于其他全并行或确定性概率计算方案提高了 2.5 至 50 倍。然而，目前的研究大多集中在硬件性能的提升上，对于 HSN 在多层网络级联下的误差非线性传递过程，以及如何通过数学建模实现精度与稳定性的理论最优配比，仍是当前该领域亟待填补的理论空白。

== 研究内容

本研究旨在构建一套完整的 HSN 数学理论体系，严格推导噪声、函数运算、算术运算及它们共同作用情况对 HSN 统计特征的影响，最终指导 HSN
在神经网络实践下的参数设计。拟开展的研究工作可大致分为四部分。

=== HSN 的数学定义和基础性质研究

本部分作为整个课题的逻辑起点，重点在于界定 HSN 的数学定义及其对信息的表征效能。研究将进行 HSN 的形式化定义，通过概率论方法建立二进制位宽 $n$ 与脉冲长度 $L$ 对信息熵的贡献模型。在明确 HSN
定义后，还会定量研究噪声对 HSN 精度的影响大小。该部分通过明确 HSN
的数学定义和基础性质，为后续所有算术运算单元的建模提供最基础的数学理论基础 @LiDomestic2024。

=== 基于 HSN 的基础算术运算单元建模与分布特征演化分析

在明确了数据表示的基础上，本部分进一步探索 HSN
域内的代数运算规律及性质。拟针对混合逻辑下的乘法、加法和除法算子进行建模，并推导运算输出结果的期望 $uE[S]$、方差
$"Var"(S)$、$p$ 阶矩、分布函数 $F_S (x)$ 
等统计学特征。进一步地，本部分还将推导多次代数运算以及噪声等因素对 HSN 分布特征的影响。这一部分通过推导算术运算对 HSN
的影响，支撑了复杂函数的逼近计算，也为最终网络级的误差分析提供理论依据 @Li2024。

=== 非线性激活函数在 HSN 域的数学逼近理论研究

神经网络的实现高度依赖于非线性映射。本部分研究利用 HSN 逼近 Sigmoid、ReLU
等复杂函数的收敛效果和误差分析。拟推导利用分段线性逼近或 Bernstein 多项式理论的 HSN 函数的收敛性和逼近误差的理论上界。另外，本部分还会推导 HSN
在经过函数后噪声的行为特点，在理论上论证基于 HSN 的函数对噪声的放大或抑制作用。

=== 网络级误差累积模型与系统稳定性讨论

作为研究工作的最终落地，本部分将单一算子的分析提升至复杂系统层面。拟利用大数定律、中心极限定理、鞅论等概率论和随机过程理论，分析神经网络中
HSN 信号传播的统计学特征。研究的关键点在于证明 HSN
网络与 BN 传统网络在分类任务上的有效性@Li2024。该部分的研究结论是系统可靠性的理论保证，证明 HSN 网络与 BN 网络的误差在分类问题中不具有显著差别。

== 进度安排

毕业设计时间为 2025 年 12 月到 2026 年 6 月，有效工作时间约 16 周。中期检查时间为 2025 年 4 月 13 日上午。
#[
  #set align(center)
  #set par(leading: .9em, spacing: .9em)
  #table(
    columns: 4,
    align: (x, y) => if x == 0 { center + horizon } else { left  + horizon },
    stroke: .5pt,
    inset: (x: .8em, y: .8em),
    [12 月 15 日前], table.cell(colspan: 2)[完成毕设选题], [已完成],
    [第 1 周], table.cell(rowspan: 2)[#rotate(-90deg, reflow: true)[预备工作]], [
      阅读文献，理解 HSN 表示方法、运算、神经网络的原理
    ], [已完成],

    [第 2 周], [
      针对性复习概率论、鞅论相关知识
    ], [已完成],

    [3 月 6 日前], table.cell(colspan: 2)[完成毕设开题], [已完成],

    [第 3 周], table.cell(rowspan: 2)[#rotate(-90deg, reflow: true)[基础性质]], [
      构建 HSN 的数学模型，完成 HSN 分布的数学表达式推导
    ], [已完成],

    [第 4 周], [
      估计噪声强度对分布及分布特征的影响；编写对应仿真程序验证
    ], [进行中],

    [第 5 周], table.cell(rowspan: 3)[#rotate(-90deg, reflow: true)[算术运算分析]], [
      推导加法、乘法等算术算子对 HSN 分布及特征的影响，研究输入相关性对乘法的影响
    ], [已完成],

    [第 6 周], [
      比较 HSN 的加法和传统 SC 的 MUX 加法对分布及特征的影响，研究噪声在加法、乘法、除法中的扩散过程
    ], [已完成],

    [第 7 周], [
      编写算术运算仿真程序，并验证理论的准确性
    ], [进行中],

    [4 月 17 日前], table.cell(colspan: 2)[完成中期检查], [进行中],

    [第 8 周], table.cell(rowspan: 3)[#rotate(-90deg, reflow: true)[一般函数对 HSN 的作用]], [
      研究 HSN 域内的复杂函数映射，证明用 Bernstein 多项式逼近复杂函数的有效性
    ], [未完成],

    [第 9 周], [
      估计逼近的误差大小，研究复杂函数对 HSN 分布及特征的影响
    ], [未完成],

    [第 10 周], [
      估计复杂函数对 HSN 中噪声的影响，编写对应仿真程序验证
    ], [未完成],

    [第 11 周], table.cell(rowspan: 4)[#rotate(-90deg, reflow: true)[神经网络中 HSN 的传播]], [
      研究 HSN 在复杂神经网络中的行为，分析神经网络传播中 HSN
      信号的分布及分布特征量变化，
    ], [未完成],

    [第 12 周], [
      利用不等式进行估计，分析 HSN 网络和 BN 网络的数字表示误差
    ], [未完成],

    [第 13 周], [
      估计噪声在网络传播过程中的扩散，编写基于 HSN 的神经网络前向传播仿真程序
    ], [未完成],

    [第 14 周], [
      利用仿真程序验证理论的正确性，并用理论解释文献中的实验结果
    ], [未完成],

    [第 15 周], table.cell(colspan: 2)[总结理论成果和仿真代码，完成毕业论文的全文撰写], [未完成],

    [5 月 22 日前], table.cell(colspan: 2)[完成论文查重、评阅], [未完成],

    [第 16 周], table.cell(colspan: 2)[准备毕业答辩], [未完成],

    [约 6 月], table.cell(colspan: 2)[完成结题答辩], [未完成],
  )
]

= 已完成的研究工作

目前完成的主要工作都围绕理论框架进行展开，现阐述构建的理论框架。

== HSN 的数学定义和基础性质

=== HSN 的数学定义

HSN 的核心设计思想在于利用低位宽随机变量序列的统计特性，实现对大动态范围数值的高效表征。为表达简洁，下文中“$x$ 为 $n$ 位数”指 $x in {0, 1, ..., 2^n - 1}$。

为了表征一个 $n$ 位整数 $x$，初步的构思是构造一个长度为 $L$ 的独立同分布（i.i.d.）随机变量序列 ${X'_i}_(i=1)^L$，其中每个采样值 $X'_i$ 均为 $n+1$ 位整数。若该序列满足无偏性条件 $uE[X'_i] = x$，则可定义其样本均值作为 $x$ 的估计量：\ #box[$
  overline(X)' = 1 / L sum_(i=1)^L X'_i  approx x. 
$]

然而，直接处理高位宽随机序列在硬件实现上并不经济。为了优化表示效率，HSN 采用空间截断与权重补偿策略：令 $X'_i$ 的低位恒为零，仅保留高 $m$ 位有效信息（$1 <= m <= n$）。此时，高位宽变量 $X'_i$ 与低位宽变量 $X_i$ 之间存在如下映射关系：\ #box[$
  X'_i = 2^k X_i, quad "其中" k = n - m + 1,
$] 这里 $X_i$ 为 $m$ 位二进制数。相应地，估计式修正为：\ #box[$
  2^k overline(X) = 2^k / L sum_(i=1)^L X_i approx x.
$]

综合上述逻辑，给出 HSN 的形式化定义如下：

#de([HSN])[
  一个 HSN $vX$ 定义为有序三元组 $vX = (m, k, {X_i}_(i=1)^L)$，并满足：

  - 物理位宽 $m in NN^*$，代表硬件实现时的实际位宽；
  - 比例因子 $k$，用于调整数值量程的权重补偿系数；
  - 随机脉冲串 ${X_i}_(i=1)^L$ 为 i.i.d. 序列，且每个 $X_i$ 几乎处处（a.s.）为 $m$ 位二进制数。
]<de:hsn>

#de([表征值])[
  HSN $vX = (m, k, {X_i}_(i=1)^L)$ 的表征值 $X$ 定义为其样本均值的加权映射 $ X = 2^k / L dot sum_(i=1)^L X_i. $
]<de:bzz>

=== 表征空间及编码精度

在定义 HSN 之后，探究其能够表征的数字集合（即表征空间）及其分辨率是衡量编码性能的关键。

#prop([表征空间])[
  对于 HSN $vX = (m, k, {X_i}_(i=1)^L)$，其表征值为 $X$ a.s. 取值于如下离散集合：\ #box[$
    sS &= {z dot alpha | z in ZZ, 0 <= z <= L(2^(m)-1)}\
    &= {0, alpha, 2alpha, 3alpha, ..., 2^(m+k) - 2^k},
  $] 其中 $alpha = 2^k \/ L$。
]<prop:bzkj>

#pf[
  根据@de:bzz 有 \ #box[$
    X = 2^k / L dot sum_(i=1)^L X_i = alpha sum_(i=1)^L X_i.
  $] 由于每个随机变量 $X_i$ 几乎处处取值于二进制整数（即 $X_i in {0, 1, ..., 2^m-1}$），则其序列和 $Z = sum_(i=1)^L X_i$ 取值范围为整数集 ${0, 1, ..., L(2^m - 1)}$。相应地，$X = alpha dot Z$ 取值集合为 ${0, alpha, 2alpha, ..., alpha L(2^m - 1)}$。将上界展开即可得到 \ #box[$
    alpha L (2^m - 1) &= 2^k / L dot L(2^m - 1) = 2^(m+k) - 2^k.
  $] 
]

#de([表征空间])[
  @prop:bzkj 中的 $sS$ 称为 $vX$ 的表征空间。
]
者是
从@prop:bzkj 可知，给定参数 HSN $vX = (n, m, {X_i}_(i=1)^L)$，其所有可能表征值在区间 $[0, 2^n)$ 内构成一个离散的等差数列，该集合 $sS$ 称为 $vX$ 的表征空间。$sS$ 的最大值反映了 HSN 能够表征的最大数，定义为表征上界；数列的公差反映了 HSN 能够分辨的最小数值差异，定义为编码精度。

#de([表征上界、编码精度])[
  设 $vX = (m, k, {X_i}_(i=1)^L)$ 是 HSN，$sS$ 是 $vX$ 的表征空间。

  - 定义 $vX$ 的表征上界 $M = sup sS = 2^(m+k) - 2^k$ 为 HSN 能够表征的最大数；
  - 定义 $vX$ 的编码精度 $alpha = 2^k \/ L$，该参数反映了 HSN 表征空间的分辨率。
]<de:bmjd>

== BN 到 HSN 的转换

=== BTH 转换函数

二进制数至混合概率数（BN-to-HSN, BTH）的转换过程，实质上是将确定性的位置编码映射为包含统计特性的随机表征。该映射通过引入一组辅助随机序列 ${R_i}_(i=1)^L$（在硬件实现中通常由随机数发生器 RNG 产生）作为中介，将 $n$ 位二进制数 $x$ 编码为对应的 HSN $vX$。记 $n$ 位二进制数 $x$ 的比特展开式为：\ #box[$
  x = sum_(j=0)^(n-1) 2^j x^((j)), quad x^((j)) in {0, 1},
$] 其中 $x^((j))$ 代表其第 $j$ 位二进制分量。基于此表示，BTH 转换函数定义如下：

#let BTH = math.class("unary", "BTH")

#de("BTH 转换函数")[
  设转换函数 $BTH$ 为从二进制空间向 HSN 空间的映射。给定物理位宽 $m$、比例因子 $k$ 以及长度为 $L$ 的辅助随机序列 ${R_i}_(i=1)^L$，转换过程记为：\ #box[$
    vX = BTH(m, k, {R_i}_(i=1)^L, x).
  $] 其中，${R_i}_(i=1)^L$ 为 i.i.d. 辅助随机变量，且每个 $R_i$ 在集合 ${0, 1, ..., 2^(n-m+1)-1}$ 上服从均匀分布。待转换的 $n$ 位 BN $x$ 需满足量程约束 $x <= 2^(m+k) - 2^k$。转换逻辑如下：

  1. 数值分解：将 $x$ 分解为 $m$ 个权重分量的线性组合：\ #box[$
      x = sum_(j=0)^(m-1) 2^j x_j.
    $] 其中，$x_j$ 是与权重 $2^j$ 相对应的系数值，且满足 $0 <= x_j < 2^k$；
  2. 随机化生成：对于 HSN 脉冲串中的每个分量 $X_i$（$i=1, ..., L$），其第 $j$ 个比特位 $X_i^((j))$ 根据随机比较结果确定：\ #box[$
      X_i^((j)) = cases(1\, quad R_i < x_j, 0\, quad R_i >= x_j), quad forall j in {0, 1, ...,  m-1}.
    $]
]<de:bth>

在给出 BTH 的形式化定义后，首要任务是验证该转换映射在数学逻辑上的自洽性，即通过该算法构造的序列是否确实符合 HSN 的统计约束。

#prop[
  @de:bth 中构造的元组 $(m, k, {X_i}_(i=1)^L) = vX = BTH(m, k, {R_i}_(i=1)^L, x)$ 是合法的 HSN。
]<prop:bthvalid>

#pf[
  根据 HSN 的定义，核心在于证明构造的随机脉冲串 ${X_i}_(i=1)^L$ 满足 i.i.d. 条件。

  按照@de:bth，每个脉冲位 $X_i^((j))$ 都是辅助随机变量 $R_i$ 的函数，即 $X_i^((j))$ 关于 $R_i$ 生成的 $sigma$-代数 $sigma(R_i)$ 可测。又考虑到 HSN 的每个脉冲位可表示为 $X_i = sum_(j=0)^(m-1) 2^j X_i^((j))$，那么 $X_i$ 是可测函数对 $R_i$ 的复合映射，从而 $X_i in sigma(R_i)$。

  已知辅助随机序列 ${R_i}_(i=1)^L$ 是 i.i.d. 的，根据随机变量变换的性质，若 $R_1, R_2, ..., R_L$ 相互独立，则其对应的可测函数变换序列 ${X_i}_(i=1)^L$ 亦相互独立。同时，由于变换函数对每个 $i$ 保持一致，序列满足同分布性质。

  综上所述，构造得到的 $vX$ 满足 HSN 的所有数学约束。
]

除了随机性的验证，BTH 转换的核心目标是确保转换后的随机表征 $X$ 在统计期望上与原始的二进制数值 $x$ 相等。这一无偏性是后续所有概率运算正确性的基础。

#prop([无偏性])[
  对于转换 $vX = BTH(m, k, {R_i}_(i=1)^L, x)$，其表征值 $X$ 的数学期望等于原始二进制数，即 $uE[X] = x$。
]

#pf[
  根据表征值定义与期望算子的线性性质，推导如下：$
    uE[X] &= uE[ 2^k/L sum_(i=1)^L X_i ]
    = 2^k/L sum_(i=1)^L uE[sum_(j=0)^(m-1) 2^j X_i^((j)) ] 
    = 2^k sum_(j=0)^(m-1) 2^j E[ X_i^((j)) ] \
    &= 2^k sum_(j=0)^(m-1) 2^j dot P(R_i < x_j) 
    = 2^k sum_(j=0)^(m-1) 2^j dot (x_j)/(2^k) 
    = sum_(j=0)^(m-1) x_j 2^j 
    = x.
  $
]

#let Var = math.class("unary", "Var")

=== 转换结果的波动特性

在确定了 BTH 转换的无偏性后，下面进一步研究其统计波动特性。方差的大小直接决定了 HSN 在硬件计算中的信噪比与收敛速度。

#prop([方差分解公式])[
  对于转换 $vX = BTH(m, k, {R_i}_(i=1)^j, x)$，设 BTH 内对 $x$ 的拆分方法为 \ #box[$
    x = sum_(j=0)^(m-1) 2^j x_j,
  $] 那么 $vX$ 的表征值 $X$ 的方差满足公式 \ #box[$
    Var X = 1 / L sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1 + j_2) min{x_j_1, x_j_2}(2^k - max{x_j_1, x_j_2}).
  $] 
]<prop:Var1>

#pf[
  记 ${X_i}_(i=1)^j$ 为 $vX$ 的随机脉冲串，则 $X_i^((j))$ 可以形式化记为 $X_i^((j)) = 1_({R_i < x_j})$，从而 \ #box[$
    X_i &= sum_(j=0)^(m-1) 2^j 1_({R_i < x_j}),\
    X_i^2 &= sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1) 2^(j_2) 1_({R_i < x_j_1}) 1_({R_i < x_j_2})\
    &= sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1+j_2) 1_({R_i < min{x_j_1, x_j_2}}),
  $] 其中 $1_A$ 表示示性函数，其定义为 \ #box[$
    1_A (x) = cases(1\, quad x in A, 0\, quad x in.not A.)
  $] 有了 $X_i, X_i^2$ 的形式化表达，便可以进一步求出它们的期望 $uE[X_i], uE[X_i^2]$，进一步求出 $Var X_i$。利用辅助随机变量 $R_i$ 的离散均匀分布性质（其测度为 $2^(-k)$），可得 \ #box[$
    uE[1_({R_i < x_j})] = uP(R_i < x_j) = 2^(-k) x_j.
  $] 将上述结论代入 $X_i, X_i^2$ 表达式可得 \ #box[$
  uE[X_i] &= sum_(j=0)^(m-1)2^(j-k) x_j,\
  (uE[X_i])^2 &= (sum_(j=0)^(m-1)2^(j-k) x_j)^2 = sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1)2^(j_1 + j_2 - 2k) x_j_1 x_j_2,\
  uE[X_i^2] &= sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1 + j_2 - k) min{x_j_1, x_j_2},\
    Var X_i &= uE [X_i^2] - (uE[X_i])^2\
    &= sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1 + j_2 - 2k) min{x_j_1, x_j_2}(2^k - max{x_j_1, x_j_2}).
  $] 再代入 $X = (2^k \/ L) sum_(i=1)^L X_i$，且考虑到 $X_i$ 是 i.i.d. 即有 \ #box[$
    Var X &= 2^(2k) / L^2 sum_(i=1)^L Var X_i = 2^(2k) / L Var X_1\
    &= 1 / L sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1 + j_2) min{x_j_1, x_j_2}(2^k - max{x_j_1, x_j_2})
  $] 
]

@prop:Var1 揭示了 HSN 表征精度的内在机理。从数学结构上看，方差由双重加权和构成，其核心项 $min{x_j_1, x_j_2}(2^k - max{x_j_1, x_j_2})$ 具有典型的二项分布方差特征，反映了各比特位在随机映射过程中的统计波动及其相互耦合。值得注意的是，方差的大小不仅受目标数值 $x$ 的量值影响，还显著取决于数值分解策略 ${x_j}$。

为了评估 HSN 表征的最劣精度表现，并消除特定目标值 $x$ 及其分解策略 ${x_j}$ 对误差评估的影响，下面讨论方差 $Var X$ 的上确界。

#prop([方差上确界])[
  记 $M = 2^(m+k) - 2^k$ 为 $vX$ 的表征上界，则对于@prop:Var1 中所有可能的 $x in [0, M] inter ZZ$ 及其对应分解策略 ${x_j}$，方差的上确界为\ #box[$
    sup_(x, {x_j}) {Var X} = 2^(2k - 2) / L (2^m-1)^2,
  $] 该上确界给出了 BTH 转化在最坏情况下的统计波动边界。
]<prop:supVar>

#pf[
  根据@prop:Var1 的方差公式，并设 $p_j = x_j \/ 2^k$，其中 $p_j in [0, 1]$，将原式改写为概率映射形式：\ #box[$
  Var X = 2^(2k) / L sum_(j_1=0)^(m-1) sum_(j_2=0)^(m-1) 2^(j_1 + j_2) dot p_(min{j_1, j_2}) (1 - p_(max{j_1, j_2})).
  $] 为了求解该多维函数的最大值，考虑对称性。当所有权重分量的激活概率相等，即 $p_0 = p_1 = ... = p_(m-1) = p$ 时，方差取得极大值：\ #box[$
  Var X &= 2^(2k) / L (sum_(j=0)^(m-1) 2^j)^2 dot p(1 - p) \
  &= 2^(2k) / L (2^m - 1)^2 dot p(1 - p). 
  $] 由于二次函数 $f(p) = p(1 - p)$ 在 $[0, 1]$ 上的最大值为 $f(1\/2) = 1\/4$，代入上式得：\ #box[$
  sup Var X = 2^(2k) / L (2^m - 1)^2 dot 1 / 4 = 2^(2k - 2) / L (2^m - 1)^2.
  $] 此时对应的物理含义为：当所有比特位的激活概率均为 $0.5$（即 $x_j = 2^(k-1)$）时，HSN 的统计波动达到峰值。
]

在实际工程应用中，为了更直观地评估 HSN 的误差包络，可以将@prop:supVar 中精确上确界进一步简化。由于在 $m >> 1$ 的高位宽情形下，$(2^m - 1)^2 approx 2^(2m)$，因此方差的上确界可以近似表示为：\ #box[$
  sup Var X approx 2^(2k + 2m - 2)/L.
$] 这一近似公式揭示了 HSN 统计波动的基本量级特征：方差随总有效位宽 $m+k$ 呈指数级增长，并随脉冲长度 $L$ 线性衰减。该结论为系统架构师在确定硬件参数时提供了便捷的理论准则——若要抵消位宽增加带来的噪声增长，必须按比例增加采样深度 $L$，以维持特定的计算信噪比。

=== 随机脉冲串的分布

在 BTH 转换逻辑中，同一个辅助随机变量 $R_i$ 被同时用于 $m$ 个分量的比较。这种共用随机源的机制使得 HSN 脉冲串的采样值 $X_i$ 具有极强的结构性。

#prop([采样值分布])[
  设 $n$ 位 BN $x$ 在 BTH 转换函数内部分解为 $m$ 个分量 ${x_0, x_1, ..., x_(m-1)}$。若将这些分量按非递减顺序重排为 \ #box[$
  0 <= x_(pi(0)) <= x_(pi(1)) <= ... <= x_(pi(m-1)) < 2^k,
  $] 则随机采样点 $X_i$ 的取值集合 $sV$ 满足 $|sV| <= m+1$。其元素 $v_r$ 具有如下形式：\ #box[$
  v_r = sum_(j=0)^(m-1) 2^j dot 1_({x_j > x_(pi(r-1))}), quad r in {0, 1, ..., m}.
  $]（约定 $x_(pi(-1)) = -1$）
]<prop:discrete>

#pf[
  根据采样点的构造公式 $X_i = sum_(j=0)^(m-1) 2^j 1_({R_i < x_j})$，其取值完全由 $R_i$ 落在的分段区间决定。由于 $R_i in {0, 1, ..., 2^k - 1}$，有序序列 ${x_(pi(r))}$ 将该整数区间划分为如下 $m+1$ 个互斥子区间：
  - $I_0 = [0, x_(pi(0)))$；
  - $I_r = [x_(pi(r-1)), x_(pi(r))), quad r = 1, ..., m-1$；
  - $I_m = [x_(pi(m-1)), 2^k)$。

  当 $R_i in I_r$ 时，对于任意分量 $x_j$：
  - 若 $x_j <= x_(pi(r-1))$，则 $R_i >= x_j$，此时 $1_({R_i < x_j}) = 0$；
  - 若 $x_j >= x_(pi(r))$，则 $R_i < x_j$，此时 $1_({R_i < x_j}) = 1$。

  因此，对于处于同一区间 $I_r$ 内的所有 $R_i$，其对应的 $X_i$ 均塌缩为确定的常数 $v_r$。由于区间总数为 $m+1$，故 $X_i$ 的可能取值至多有 $m+1$ 种。
]

这一命题表明，尽管 HSN 的定义允许 $X_i$ 理论上取遍 $2^m$ 个二进制数，但 BTH 算法通过单随机源映射，将搜索空间压缩到了线性的 $m+1$ 阶量级。这种高度的离散性是 HSN 能够保持高能效比的重要数理基础。下面举一个例子具体说明 BTH 采样值分布。

#ex[
  本例源于文献@Li2024。假设要将 $6$ 位 BN $x = 61$ 编码为物理位宽 $m=3$，比例因子 $k=4$ 的 HSN $vX$。辅助变量 $R_i$ 服从 ${0, 1, ..., 2^4-1=15}$ 上的均匀分布。如果指定 BTH 内部分解为 $x_0 = 5, x_1 = 12, x_2 = 8$，此时 \ #box[$
    x = sum_(j=0)^2 2^j x_j = 2^0 dot 5 + 2^1 dot 12 + 2^2 dot 8 = 61
  $] 说明这是合法的分解。

  为了得到 $R_i$ 和 $X_i$ 的取值对应表，将分量 ${x_j}$ 按升序排列：\ #box[$
    x_pi(0) = x_0 = 5, x_pi(1) = x_2 = 8, x_pi(3) = x_1 = 12,
  $] 这三个阈值将 $R_i$ 的取值空间 $[0, 15] inter ZZ$ 划分为 $m + 1 = 4$ 个互斥区间。

  #figure(
    table(
      columns: 5,
      inset: (x: 1.5em, y: .8em),
      stroke: (x, y) => if y == 0 or y == 1 {
        (top: 1pt + black)
      } else if y == 4 {
        (bottom: 1pt + black)
      } else {
        0pt
      },
      [$R_i$ 取值范围], [$X_i^((0))$], [$X_i^((1))$], [$X_i^((2))$], [$X_i$],
      [$0 <= R_i < 5$], [$1$], [$1$], [$1$], [$7$],
      [$5 <= R_i < 8$], [$0$], [$1$], [$1$], [$6$],
      [$8 <= R_i < 12$], [$0$], [$1$], [$0$], [$2$],
      [$12 <= R_i < 16$], [$0$], [$0$], [$0$], [$0$],
    ),
    caption: [$R_i$ 与 $X_i$ 取值对应表]
  )<tab:bthex>

  如@tab:bthex 所示，尽管 $X_i$ 作为 3 位二进制数理论上可以取 $2^3=8$ 个值，但在 BTH 映射下，它实际上仅在 ${7, 6, 2, 0}$ 这 $m+1=4$ 个元素中取值。
]

前文通过示性函数法导出了方差公式（@prop:Var1）。接下来从 HSN 采样点 $X_i$ 的具体分布特征出发，利用离散随机变量方差的原始定义进行二次推导，以验证其一致性。

#prop([分布特征方差公式])[
  设 $n$ 位 BN $x$ 的 BTH 分量按升序排列为 $0 <= x_(pi(0)) <= x_(pi(1)) <= ... <= x_(pi(m-1)) < 2^k$。记 $Delta_r = x_(pi(r)) - x_(pi(r-1))$（约定 $x_(pi(-1)) = 0$），$v_r$ 为采样点在区间 $I_r$ 上的取值，则 $vX$ 的表征值 $X$ 的方差满足：
  $ Var X = 1 / L sum_(0 <= r < s <= m) Delta_r Delta_s (v_r - v_s)^2 / 2^k $
]<prop:Var2>

#pf[
  根据@prop:discrete，$X_1$ 是一个离散随机变量，其取值为 $v_r$ 的概率为 $p_r = uP(R_i in I_r) = Delta_r \/ 2^k$。
  由随机变量方差的通用恒等式\ #box[$
  Var X_1 = 1 / 2 sum_(r=0)^m sum_(s=0)^m p_r p_s (v_r - v_s)^2
  $] 代入概率分布 $p_r, p_s$ 可得\ #box[$
  Var X_1 = 1 / (2 dot 2^(2k)) sum_(r=0)^m sum_(s=0)^m Delta_r Delta_s (v_r - v_s)^2 = 1 / 2^(2k) sum_(0 <= r < s <= m) Delta_r Delta_s (v_r - v_s)^2
  $] 由于 $X = 2^k \/ L sum_(i=1)^L X_i$ 且 $X_i$ 为 i.i.d.，则\ #box[$
  Var X = 2^(2k) / L^2 sum_(i=1)^L Var X_1 = 2^(2k) / L Var X_1
  $] 将 $Var X_1$ 代入即得\ #box[$
  Var X = 1 / L sum_(0 <= r < s <= m) Delta_r Delta_s (v_r - v_s)^2 / 2^k.
  $]
]

#prop([方差公式等价性])[
  @prop:Var1 与@prop:Var2 给出的方差公式在数学上是完全等价的。
]

#pf[
  本质上，两个公式分别从变量的**二阶矩分解**与**样本空间距离**两个维度描述同一个随机变量 $X_1$。
  
  1. @prop:Var1 采用的是线性分解法。由于 $X_1 = sum 2^j 1_(R_i < x_j)$，其方差必然等于各分量协方差的加权和 $ Var X_1 = sum_(j_1) sum_(j_2) 2^(j_1 + j_2) "Cov"(1_({R_i < x_(j_1)}), 1_({R_i < x_(j_2)})). $
  2. @prop:Var2 采用的是定义法。对于任何离散随机变量 $Y$，其方差定义 $E[Y^2] - (E[Y])^2$ 恒等于所有可能取值点对距离的加权平均。
  
  通过展开@prop:Var2 中的平方项 $(v_r - v_s)^2$，并利用关系 $sum Delta_r = 2^k$ 以及示性函数的重叠性质，可以严谨地化简为@prop:Var1 中的 $min$ 与 $max$ 形式。两公式描述的是同一物理对象的不同数学切面，故本质相同。
]

BTH 转换的这一特性表明，HSN 的统计波动不仅源于概率采样本身，更源于共用随机源 $R_i$ 导致的各比特位之间的强正相关性。这种结构性离散极大简化了方差的分析过程。

=== BTH 生成的 HSN 表征值的渐近收敛性分析

随着脉冲长度 $L$（采样深度）的增加，研究表征值 $X$ 的随机波动如何趋于确定性数值 $x$ 是评估计算精度的关键。为了分析 HSN 在长脉冲序列下的统计行为，考察 $L -> oo$ 时表征值 $X$ 的极限分布。

#prop([渐进正态])[
  设 $vX = (m, k, {X_i}_(i=1)^L)$ 为 BTH 转换生成的 HSN。当脉冲长度 $L -> oo$ 时，表征值 $X$ 满足：\ #box[$
  sqrt(L)(X - x) -->^d sN(0, 2^(2k) Var X_1),
  $] 其中 $-->^d$ 表示依分布收敛（弱收敛），$sN(mu, sigma^2)$ 代表均值为 $mu$，方差为 $sigma^2$ 的正态分布。上式也可以记为 \ #box[$
    X tilde^a sN(x, 2^(2k) / L Var X_1) = sN(x, Var X),
  $] 其中 $tilde^a$ 表示“渐近服从于”。
]<prop:jjzt>

#pf[
  首先根据@de:bzz，将 $X$ 写为脉冲串 $X_i$ 的算术平均形式，即 \ #box[$
    X = 2^k / L sum_(i=1)^L X_i = 2^k dot overline(X)_L,
  $] 其中 $overline(X)_L$ 是随机变量列 ${X_i}$ 的样本均值。在@prop:bthvalid 中已经证明了 ${X_i}_(i=1)^L$ 是 i.i.d. 的，又在@prop:Var1 中证明 $X_i$ 的二阶矩存在，其期望 $uE[X_i] = 2^(-k)x$，方差 $Var X_i < oo$，那么应用 Levy-Lindeberg 中心极限定理@durrett2019probability 知道样本均值满足 \ #box[$
    sqrt(L)(overline(X)_L - 2^(-k)x) -->^d sN(0, Var X_i).
  $] 那么自然可以求得 $X = 2^k overline(X)_L$ 的渐近分布为 \ #box[$
    sqrt(L)(X - x) -->^d sN(0, 2^(2k)Var X_1).
  $] 
]

@prop:jjzt 表明 HSN 的表征误差 $(X - x)$ 的标准差以 $1\/sqrt(L)$ 的速度衰减。这与传统概率计算（SC）的精度特性一致，说明 HSN 在保持随机计算鲁棒性的同时，严格遵循大数定律。在实际电路设计中，基于此渐近正态性，我们可以利用正态分布的分位数（如 $1.96sigma$）来估算在给定脉冲长度 $L$ 下，计算结果落在目标精度范围内的概率（置信水平）。另外，由于 $X$ 实际上是在离散网格（步长为 $alpha = 2^k\/L$）上取值的，当 $L$ 较小时，它呈现为离散的二项式样分布；随着 $L -> oo$，网格变细且分布形态趋于平滑，最终弱收敛于连续的正态分布概率密度函数。

== HSN 的乘法

本部分将探讨 HSN 在概率域下的算术属性。得益于 HSN 的随机表征特性，复杂的算术运算可以转化为脉冲串之间的逐位逻辑或算术操作。

=== 乘法的定义及基础性质

在定义 HSN 乘法之前，必须明确运算分量之间的统计独立性，这是确保期望值满足乘法结合律的前提。

#de([独立])[
  称两个 HSN $vX, vY$ 相互独立，如果它们的脉冲序列的并集 \ #box[$
    {X_i}_(i=1)^(L_X)union{Y_i}_(i=1)^(L_Y) = {X_1, X_2, ..., X_L_X, Y_1, Y_2, ..., Y_L_Y}
  $] 为独立随机变量集合。
]

#de([乘法])[
  设$vX, vY$ 为两个相互独立且它们的脉冲长度相同的 HSN，记为 \ #box[$
    vX = (m_X, k_X, {X_i}_(i=1)^L), quad
    vY = (m_Y, k_Y, {Y_i}_(i=1)^L).
  $]
  定义乘法运算 $vZ = vX vY$，其结果 $vZ = (m_Z, k_Z, {Z_i}_(i=1)^L)$ 满足：

  - $m_Z = m_X + m_Y$（物理位宽叠加）；
  - $k_Z = k_X + k_Y$（比例因子叠加）；
  - $Z_i = X_i Y_i, forall i in {1, 2, ..., L}$（逐脉冲乘积）。
]<de:cf>

#prop([乘法封闭性])[
  @de:cf 中乘法的结果 $vZ$ 仍然是一个 HSN。
]

#pf[
由于 $X_i$ 是 $m_X$ 位整数，$Y_i$ 是 $m_Y$ 位整数，其乘积 $Z_i = X_i Y_i$ 的最大值为 $(2^(m_X)-1)(2^(m_Y)-1) < 2^(m_X+m_Y)-1$。因此，$Z_i$ 几乎处处为 $m_Z$ 位二进制数。另外，由于 ${X_i}$ 与 ${Y_i}$ 相互独立且各自满足 i.i.d. 条件，根据独立随机变量函数变换的性质，其积序列 ${X_i Y_i}$ 亦满足 i.i.d 条件。
]

#prop([乘法无偏性])[
  @de:cf 中的乘法在期望的意义下是准确的，即乘法满足 $uE[Z] = uE[X] uE[Y]$。
]

#pf[
根据 HSN 表征值的定义及期望的性质，推导如下：\ #box[$
E[Z] &= E[2^(k_Z)/L sum_(i=1)^L Z_i ] 
= (2^(k_X+k_Y))/(L) sum_(i=1)^L E[X_i Y_i] 
= (2^(k_X) dot 2^(k_Y))/(L) dot L dot E[X_i] E[Y_i] \
&= (2^(k_X) E[X_i]) \cdot (2^(k_Y) E[Y_i]) 
= ( 2^(k_X) dot (E[X])/(2^(k_X)) ) dot ( 2^(k_Y) dot (E[Y])/(2^(k_Y)) ) \
&= E[X] E[Y].
$] 若 $E[X]=x, E[Y]=y$，则 $E[Z]=x y$。
]

=== 乘法对表征空间的影响

根据乘法定义@de:cf，乘积 $vZ = vX vY$ 的表征空间由 $X_i Y_i$ 的取值特性决定。本节推导其表征空间的离散结构演化。

#prop([乘法表征空间])[
  设 $vX = (m_X, k_X, {X_i})$ 与 $vY = (m_Y, k_Y, {Y_i})$ 独立，其乘积为 $vZ = (m_Z, k_Z, {Z_i})$。令 $alpha_X, alpha_Y$ 分别为分量的编码精度，则 $vZ$ 的表征值 $Z$ a.s. 取值于如下集合：\ #box[$ { z dot (alpha_X alpha_Y dot L) | z in ZZ, 0 <= z <= L(2^(m_X)-1)(2^(m_Y)-1) } \ 
  subset sS_Z = { z dot (alpha_X alpha_Y dot L) | z in ZZ, 0 <= z <= L(2^(m_Z)-1) }. $]
]

#pf[
  根据 $vZ$ 的表征值定义, \ #box[$
  Z = 2^(k_Z) / L sum_(i=1)^L Z_i = (2^(k_X + k_Y)) / L sum_(i=1)^L X_i Y_i 
  $] 由编码精度定义 $alpha_X = 2^(k_X)\/L, alpha_Y = 2^(k_Y)\/L$，上式可改写为 \ #box[$
  Z = (alpha_X L dot alpha_Y L) / L sum_(i=1)^L X_i Y_i = (alpha_X alpha_Y dot L) sum_(i=1)^L X_i Y_i. 
  $] 由于 $X_i, Y_i$ 分别为 $m_X, m_Y$ 位整数，其积 $X_i Y_i$ 亦为非负整数。令 $z = sum_(i=1)^L X_i Y_i$，则 $z$ 的取值范围为 $[0, L(2^(m_X)-1)(2^(m_Y)-1)]$ 之间的整数。

  因此，$Z$ 构成的集合是以 $alpha_Z = alpha_X alpha_Y dot L$ 为步长的等差数列。
]

#prop([精度退化])[
  乘法运算后，结果的编码精度 $alpha_Z$ 与分量精度满足：\ #box[$
    alpha_Z = L dot alpha_X alpha_Y 
  $] 即相对于理想的 $alpha_X alpha_Y$，HSN 的乘法引入了因子为 $L$ 的编码精度损失。
]<prop:jdth>

#pf[
  理想情况下，两个数相乘的编码精度应为各自精度的积。然而在 HSN 框架下\ #box[$
    alpha_Z = 2^(k_Z) / L = 2^(k_X + k_Y) / L 
  $] 而 \ #box[$
    alpha_X alpha_Y = 2^(k_X + k_Y) / L^2,
  $] 显然有 $alpha_Z = L dot (alpha_X alpha_Y)$。这意味着在相同的脉冲长度 $L$ 下，乘法运算会导致表征空间的分辨率稀疏化。
]

@prop:jdth 指出的这种表征空间的变化提示我们，在进行深度 HSN 运算链路设计时，可能需要通过其他方法来补偿乘法带来的精度退化。

=== 乘法对表征值方差的影响

本节探讨乘法运算 $vZ = vX vY$ 如何导致统计误差的累积。

#prop([乘法方差公式])[
  设独立 HSN $vX, vY$ 的表征值期望分别为 $mu_X, mu_Y$，方差分别为 $sigma_X^2, sigma_Y^2$，则乘积 $vZ$ 的表征值 $Z$ 的方差满足：\ #box[$
  Var Z = L sigma_X^2 sigma_Y^2 + mu_X^2 sigma_Y^2 + mu_Y^2 sigma_X^2.
  $]
]<prop:cffcgs>

#pf[
  首先考察单个采样点 $Z_i = X_i Y_i$ 的二阶矩。由 $X_i, Y_i$ 独立性得\ #box[$
  uE[Z_i^2] = uE[X_i^2 Y_i^2] = uE[X_i^2] uE[Y_i^2], 
  $] 代入方差定义式 $uE[Y^2] = Var Y + uE[Y]^2$ 有 \ #box[$
  uE[Z_i^2] &= (Var X_1 + uE[X_1]^2)(Var Y_1 + uE[Y_1]^2) \
   &= Var X_1 Var Y_1 + uE[X_1]^2 Var Y_1 + uE[Y_1]^2 Var X_1 + uE[X_1]^2 uE[Y_1]^2,
   $] 进而得到单点方差\ #box[$
   Var Z_1 &= uE[Z_i^2] - (uE[X_1]uE[Y_1])^2\
   &= Var X_1 Var Y_1 + uE[X_1]^2 Var Y_1 + uE[Y_1]^2 Var X_1.
   $] 根据表征值方差与单点方差的关系 $Var Z = (2^(2 k_Z) \/ L) Var Z_1$ 得到 \ #box[$
   Var Z = 2^(2 k_X + 2 k_Y) / L (Var X_1 Var Y_1 + uE[X_1]^2 Var Y_1 + uE[Y_1]^2 Var X_1).
   $] 注意到 $sigma_X^2 = (2^(2 k_X) \/ L) Var X_1$ 以及 $mu_X = 2^(k_X) uE[X_1]$，代入上式进行整理即有 \ #box[$
   Var Z &= L dot (2^(2 k_X) / L Var X_1) dot (2^(2 k_Y) / L Var Y_1) +\
   & quad (2^(k_X) uE[X_1])^2 dot (2^(2 k_Y) / L Var Y_1) +\
   & quad (2^(k_Y) uE[Y_1])^2 dot (2^(2 k_X) / L Var X_1) \
  &= L sigma_X^2 sigma_Y^2 + mu_X^2 sigma_Y^2 + mu_Y^2 sigma_X^2.
  $]
]

通过@prop:cffcgs，我们可以观察到 HSN 乘法误差的两个组成部分：

- 耦合项（$L sigma_X^2 sigma_Y^2$）：这是乘法特有的高阶误差项。该项带有系数 $L$，这意味着如果两个操作数的方差都较大，乘积的波动会因为脉冲长度的放大作用而剧烈增加；
- 权重缩放项（$mu_X^2 sigma_Y^2 + mu_Y^2 sigma_X^2$）：这一部分描述了操作数的数值大小对另一方波动的放大作用。若 $x$ 或 $y$ 较大，则会将对方的统计噪声线性地放大到结果中。

这种方差演化特征表明，在进行大规模叠乘运算（如深度神经网络的推理）时，必须通过合理调整每层的比例因子 $k$ 或位宽 $m$ 来抑制噪声的指数级增长。

=== 乘法对渐近分布的影响

本节讨论当脉冲长度 $L -> oo$ 时，乘积 $vZ = vX vY$ 的分布演化。

#prop([乘法渐近正态性])[
  设独立 HSN $vX, vY$ 满足 $sqrt(L)(X - mu_X) ->^d N(0, sigma_(X_1)^2)$ 与 $sqrt(L)(Y - mu_Y) ->^d N(0, sigma_(Y_1)^2)$。则其乘积 $Z$ 满足$
  sqrt(L)(Z - mu_X mu_Y) ->^d sN(0, mu_Y^2 sigma_(X_1)^2 + mu_X^2 sigma_(Y_1)^2). 
  $
]<prop:cfjjztx>

#pf[
  定义二元函数 $g(x, y) = x dot y$。显然 $g$ 在 $(mu_X, mu_Y)$ 处一阶连续可微。其梯度向量（Jacobi 矩阵）为 \ #box[$
  nabla g = ( (partial g) / (partial x), (partial g) / (partial y) ) = (y, x). 
  $]  在均值点 $(mu_X, mu_Y)$ 处，有 $nabla g|_(mu) = (mu_Y, mu_X)$。

  由于 $vX$ 与 $vY$ 独立，其联合渐近分布为 \ #box[$
  sqrt(L) ( (X - mu_X), (Y - mu_Y) ) ->^d sN( (0, 0)^T, diag(sigma_(X_1)^2, sigma_(Y_1)^2) ),
  $] 根据 *Delta 方法*，函数映射后的渐近分布为 \ #box[$
  sqrt(L)(g(X, Y) - g(mu_X, mu_Y)) ->^d sN(0, (nabla g) dot Sigma dot (nabla g)^T),
  $] 代入梯度向量与协方差矩阵 $Sigma$ 得到 \ #box[$
  sigma_Z^2 = (mu_Y, mu_X) ( (sigma_(X_1)^2, 0), (0, sigma_(Y_1)^2) ) (mu_Y, mu_X)^T = mu_Y^2 sigma_(X_1)^2 + mu_X^2 sigma_(Y_1)^2,
  $] 因此得出 \ #box[$
  sqrt(L)(Z - mu_X mu_Y) ->^d N(0, mu_Y^2 sigma_(X_1)^2 + mu_X^2 sigma_(Y_1)^2).
  $]
]

== 比例加法

比例加法通过对两个 HSN 进行加权平均，确保运算结果在硬件位宽允许的表征范围内。类似乘法，此处直接给出比例加法的相关结果及简要证明。

#de([比例加法])[
  设 HSN $vX, vY$ 脉冲长度均为 $L$，记为 \ #box[$
  vX = (m_X, k_X, {X_i}), quad vY = (m_Y, k_Y, {Y_i}).
  $] 为简化硬件实现，设 $m_X = m_Y = m$ 且 $k_X = k_Y = k$。定义比例加法 $(m_Z, k_Z, {Z_i}) = vZ = vX plus vY$ 如下：

  - $m_Z = m$；
  - $k_Z = k + 1$；
  - $Z_i = X_i + Y_i, forall i in {1, 2, ..., L}$。
]<de:add>

和乘法不同，在@de:add 中不要求两个运算 HSN 是独立的，因为非独立的加法运算也满足无偏性的要求。

#prop([比例加法封闭性])[
  由 @de:add 定义的 $vZ$ 仍然是 HSN。
]

#pf[
  1. 位宽约束：由于 $X_i, Y_i$ 均为 $m$ 位整数，其最大值为 $2^m - 1$。
     则 $Z_i = X_i + Y_i <= 2(2^m - 1) = 2^(m+1) - 2$。
     注意到虽然 $Z_i$ 可能超过 $m$ 位，但在 HSN 定义中，表征上限由 $m$ 和 $k$ 共同决定。在比例加法中，$k_Z = k + 1$ 实际上完成了对数值的“空间稀释”。从硬件存储角度看，$Z_i$ 仅需 $m+1$ 位存储，或通过截断/饱和处理保持在 $m$ 位（若 $m$ 足够大）。
  2. i.i.d. 性质：由 $X_i, Y_i$ 的独立性及同分布性，其和序列 ${Z_i}$ 显然满足独立同分布。
]

#prop([加法无偏性])[
  比例加法满足 \ #box[$
  E[Z] = (E[X] + E[Y]) / 2.
  $]
]

#pf[
  根据表征值定义，\ #box[$
  E[Z] &= 2^(k_Z) / L sum_(i=1)^L E[Z_i] = 2^(k+1) / L sum_(i=1)^L (E[X_i] + E[Y_i]) \
&= 2 dot [display(2^k / L sum_(i=1)^L E[X_i] + 2^k / L sum_(i=1)^L E[Y_i] )] / 2.
 $] 由于 $E[X] = 2^k E[X_i]$ 且 $E[Y] = 2^k E[Y_i]$，代入得 \ #box[$
 E[Z] = (E[X] + E[Y]).
 $]
]

#prop([比例加法方差])[
  如果比例加法的运算数 $vX, vY$ 独立，那么比例加法结果的方差满足 \ #box[$
  Var Z = 4 (Var X + Var Y).
  $]
]

#pf[
  \ #box[$
  Var Z = 2^(2k_Z) / L Var(Z_1) = 2^(2k + 2) / L Var(X_1 + Y_1)
  $] 由于 $X_1, Y_1$ 独立，方差具有可加性： \ #box[$
  Var Z = 4 dot 2^(2k) / L (Var X_1 + Var Y_1) = 4 (sigma_X^2 + sigma_Y^2) 
  $] 但注意到比例加法通常对应均值减半，若考察相对误差，其波动表现仍为合理。
]

#prop([比例加法渐近分布])[
  当 $L -> oo$ 时，比例加法的结果满足\ #box[$
  sqrt(L)(Z - (mu_X + mu_Y)) ->^d N(0, 4(sigma_(X_1)^2 + sigma_(Y_1)^2)).
  $]
]

#pf[
  由 $X, Y$ 独立性及 Levy-Lindeberg 中心极限定理直接推导 \ #box[$
  sqrt(L)(X + Y - (mu_X + mu_Y)) ->^d N(0, sigma_(X_1)^2 + sigma_(Y_1)^2). 
  $] 由于 $Z$ 的定义中系数 $2^(k_Z)$ 比 $X, Y$ 的 $2^k$ 大一倍，即 $Z = 2(overline(X)_L + overline(Y)_L)$，故其方差项叠加 4 倍系数。
]

= 已取得的阶段性研究成果

本研究已建立了 HSN 的统计分析框架，完成了从生成算法、离散分布特征到线性、非线性算术运算的数学推导与特性验证。

== HSN 的基础表征模型

研究首先定义了 HSN 的形式化数学模型，确立了其作为独立同分布（i.i.d.）随机变量序列的本质属性。通过引入比例因子 $k$ 与物理位宽 $m$ 的双参数化表征，解决了传统概率计算在动态范围上的局限性。利用中心极限定理，证明了当脉冲长度 $L -> oo$ 时，HSN 的表征值严格依分布收敛于正态分布。这一结论不仅刻画了 HSN 的渐近分布特性，也为后续基于置信区间的计算误差评估提供了理论依据。

== BTH 算子的生成分布与方差解析

针对二进制数向 HSN 转换的 BTH（Binary-to-HSN）算子，本研究深入探讨了其统计无偏性与取值离散性。通过示性函数法与空间分布法双重推导，给出了表征值方差的闭式解，揭示了方差与数值分解策略 ${x_j}$ 之间的耦合关系。研究发现，基于单随机源映射的 BTH 算子将采样空间从 $2^m$ 指数级压缩至线性的 $m+1$，并在所有可能分解中确定了方差的上确界近似量级为 $2^(2k+2m-2)\/L$。该理论成果为优化数值转换过程、降低计算初值噪声提供了关键指导。

== HSN 统计特征在算术运算中的演化

在算术运算层面，本研究系统推导了 HSN 乘法与比例加法的表征空间演化及误差传递规律。证明了 HSN 运算在代数结构上具有封闭性与无偏性：乘法运算表现为位宽与比例因子的累加，其方差受数值权重与高阶扰动项共同驱动；比例加法则通过比例因子偏移实现了动态范围的平滑缩放。通过 Delta 方法推导了运算后的渐近分布变化，量化了计算链路中的精度退化特征。上述成果完整构建了 HSN 的初等算术体系，验证了其在大规模流水线计算中的统计鲁棒性。

= 存在的问题以及后续工作安排

== 存在的问题

在目前的研究阶段，HSN 表征模型及其运算框架虽然展现出良好的统计特性和硬件适应性，但仍存在若干问题亟待解决。

=== 单极性表征对负数支持的缺失

当前的 HSN 模型主要基于单极性映射，其表征空间局限于非负实数域 $[0, M]$。然而，在深度学习卷积层运算及高性能数字信号处理中，存在大量涉及负权的乘加运算。若仅采用单极性模型，将导致系统无法处理减法逻辑或包含负向特征值的信号，这极大限制了模型的通用性。因此，构建能够适配符号位且保持统计无偏性的双极性 HSN 表征模型是当前的理论瓶颈。

=== 级联运算下物理位宽的指数级扩张

根据 HSN 乘法的封闭性证明，每进行一次乘法运算，结果的物理位宽 $m$ 与比例因子 $k$ 均会发生累加。在多层感知机或深层神经网络中，这种级联效应会导致脉冲串的单点位宽 $m_Z$ 迅速上升，进而对硬件存储资源和算术逻辑单元的面积造成巨大压力。如何在不损失数值精度的前提下，实现对高位宽 HSN 的有效截断或动态重缩放，是实现低功耗硬件部署亟待解决的关键问题。

=== 多级链路中的精度退化与噪声累积

推导表明，HSN 的表征精度 $alpha_Z$ 会随乘法链条的增加而以 $L$ 为倍数发生稀疏化退化。同时，乘法引入的复合方差项 $L sigma_X^2 sigma_Y^2$ 在长路径运算中可能导致信噪比恶化。目前的模型尚缺乏一套完整的精度补偿机制，无法在长链路计算中自适应地维持数值稳定性，这对于高精度计算任务构成了严峻挑战。

== 后续工作安排

=== 理论验证与价值体现

本研究的最终理论成果具备高度的可验证性。按照计划，将在第七周结束（4月20日）前完成相关验证代码的编写工作。验证程序将基于 Python/C++ 语言，通过 Monte Carlo 采样获取 HSN 的统计表征值，并将其与推导出的期望、方差及渐近分布公式进行横向比对。若仿真曲线与理论解析式在统计误差允许范围内高度契合，则可证实 BTH 转换及其算术运算理论的正确性。

本研究的价值核心在于建立了混合型随机计算的严谨数学底座。通过定量化地描述位宽（$m$）、比例因子（$k$）与采样长度（$L$）对计算精度的影响，本工作不仅为硬件架构师提供相关理论准则，更为后续进一步开发随机计算算术单元提供了相关指导。

=== 预期目标差异分析与补全方案

目前，课题进度已完成单极性 HSN 的基础理论建模、无偏性证明以及乘加运算的统计特征推导，达到了阶段性预期目标的核心部分。然而，由于目前建立的单极性 HSN 模型仅能表征非负数域，导致原本计划在中期前完成的四则运算体系尚未闭合，特别是对减法运算的推导因缺乏负数表示机制而暂时滞后。

针对这一问题，后续将采取由单极性向双极性平移的解决路径。计划在单极性理论的基础上，引入符号位映射或偏移量表征机制，推导出双极性 HSN 的概率映射模型。通过对双极性域下期望与方差公式的修正，可以自然地解决减法运算过程中的数值负向溢出问题，从而实现对加、减、乘运算的覆盖，确保研究任务的完整性。除法由于其在原理上和复杂函数的拟合（逐次逼近法或 Bernstein 多项式法）更为接近，将其和复杂函数一部分的理论合并，不在此处进行推导。

=== 时间进度规划与可行性评估

后续工作的时间安排虽然呈现出一定的紧迫感，但整体仍处于可控的预料范围内。接下来的的工作将在理论推导和仿真验证上并行，具体进度仍按照前文列出的安排进行规划。

虽然双极性理论的引入增加了工作量，但由于单极性模型已打下了坚实的数学框架，大部分推导逻辑具有可复用性。通过合理分配理论迭代与代码仿真的时间比例，预期能够按时保质地完成全部既定科研任务。

#bibliography("ref.bib", style: "gb-7714-2005-numeric", full: true)

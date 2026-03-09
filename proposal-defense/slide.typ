#import "@preview/buaa-unofficial-gradient:0.1.0": *
#import "@local/aytony:1.0.0": *

#set text(font: ("Times New Roman", "SimHei"), lang: "zh")

#show: buaa-theme.with(
  config-info(
    title: [概率计算网络数学模型设计与理论分析],
    subtitle: [2026本科毕业设计开题答辩],
    author: [安阳],
    date: datetime.today(),
    institution: [数学科学学院 #h(2em) | #h(2em) 导师：李洪革、魏光美],
  )
)


#title-slide()

#outline-slide()

= 研究背景

== 课题背景

- 边缘计算高效能架构：低功耗、低时延、高容错
- 不同的计算结构具有不同的特点

#align(center)[
  #figure(
    table(
      columns: 4,
      align: center,
      stroke: none,
      inset: (x: 1em, y: .5em),
      table.hline(),
      [*技术方案*], [*功耗*], [*时延*], [*容错性*],
      table.hline(),
      [二进制计算], [高], [低], [低],
      [概率计算（SC）], [低], [高], [高],
      [混合概率计算（HSC）], [较低], [较低], [较高],
      table.hline(),
    ),
    caption: [不同计算架构的资源消耗表现]
  )
]

- 拟在理论上研究并论证混合概率数（Hybrid Stochastic Number, HSN）模型相对于其它模型的优越性

== 研究意义

#tblock(title: [理论意义])[
  - 非位置数值表示法提供了新的数学视角
  - 为概率计算的评估提供数学依据
]

#tblock(title: [应用意义])[
  - 理论指导助力高性能边缘AI芯片的设计
  - 为设计兼顾高精度与高可靠性的系统提供理论支撑
]

= 相关研究发展

== 概率计算的起源与演进

- Gaines@Gaines1967@Gaines1969：提出概率计算（SC）概念
- Poppelbaum@Poppelbaum1967@Poppelbaum1976StatisticalProcessors：构建 SC 物理实现架构
- Bratley@Sobol1988：提出Sobol你随机序列生成算法
- Hayes@Hayes2015@Alaghi2013：系统总结进展，明确 SC 瓶颈
- Liu@Liu2016, Ardakani@Ardakani2017：将 SC 应用于深度神经网络
- Najafi@Najafi2019@NajafiDeterm2019：提出确定性比特流、分辨率分割概念

== 混合概率计算与 HSN 模型

- Li@Li2022：提出混合逻辑计算
- Li@Li2024：提出混合概率数（HSN），并应用到神经网络
- Li@LiDomestic2024：实现基于 HSN 的神经网络，并展示芯片实现
- 传统 SN 和 BN 表示芯片的算力-功耗矛盾的解决方案

#figure(
  image("img/representation.png", height: 90%),
  caption: [不同数的表示]
)

= 研究内容与方法

== 研究目的

针对混合概率数（HSN）构建一套数学理论框架，依照概率数计算的方向设计四个研究方向

- HSN 的基础性质：研究 HSN 的形式化定义及统计表征
- 算术运算电路：研究 HSN 的算术运算建模
- 复杂函数的计算：研究复杂函数对 HSN 的作用
- 基于 HSN 的神经网络系统：在数学上推导 HSN 神经网络的整体性质

== 拟采用的理论和方法

- 采用理论
  - 概率论、鞅论、随机过程、随机分析等理论
  - Chebyshev 不等式、中心极限定理、大数定律、Weierstrass 逼近定理、鞅收敛定理、Doob 上穿不等式等定理
- 研究路线
  - 在理论上，进行解析建模
  - 在实证上，进行随机仿真验证

== HSN 的基础性质

总体界定 HSN 的数学定义及其表征性质

- 对 HSN 进行数学形式化定义
- 建立二进制位宽 $n$ 与脉冲长度 $L$ 对信息熵、容错性的贡献模型
- 定量研究噪声对 HSN 精度的影响大小
- 其它 HSN 的基础性质

== HSN 的算术运算建模

总体研究 HSN 的代数运算规律及性质

- 对的乘法、加法和除法算子进行建模，推导运算结果的统计学特征
- 推导多次代数运算以及噪声等因素对 HSN 分布特征的影响
- 研究二进制位宽 $n$ 和脉冲长度 $L$ 与算术运算时延和功耗之间的数学关系
- 论证 HSN 在算术运算下相对于 BN 和 SC 在功耗、时延、容错上的优越性

#figure(
  image("img/mult.png", height: 170pt),
  caption: [HSN 乘法运算电路]
)

== 作用于 HSN 的非线性激活函数

总体研究利用 HSN 逼近 Sigmoid、ReLU 等复杂函数的收敛效果和误差分析

- 推导利用分段线性逼近或 Bernstein 多项式理论的 HSN 函数的收敛性和逼近误差的理论上界
- 推导 HSN 在经过函数作用后噪声的行为特点
- 研究 HSN 自身参数（$n, L$ 等）在复杂函数作用过程中的时延、功耗

#figure(
  image("img/bernstein.png", height: 150pt),
  caption: [基于 Bernstein 多项式逼近的 HSN 复杂函数运算电路]
)

== 基于 HSN 构造的神经网络系统

总体研究基于 HSN 的神经网络系统的整体数学性质

- 利用大数定律、中心极限定理、鞅论等概率论和随机过程理论，分析神经网络中 HSN 信号传播的统计学特征
- 证明 HSN 网络在分类任务上具有和 BN 传统网络相同或相近的有效性@Li2024
- 研究随机环境噪声在神经网络中的整体传播统计学性质
- 论证 HSN 相比于 SC 对神经网络的加速作用和比例

#figure(
  image("img/nn.png", height: 150pt),
  caption: [5层全连接概率神经网络架构]
)

= 进度安排

== 进度安排

#[
  #set align(center + horizon)
  #set par(leading: .9em, spacing: .9em)
  #set table(
    columns: 3,
    align: (x, y) => if x == 0 { center + horizon } else { left  + horizon },
    stroke: .5pt,
    inset: (x: .8em, y: .8em)
  )
  #table(
    [12 月 15 日前], table.cell(colspan: 2)[完成毕设选题],
    [第 1 周], table.cell(rowspan: 2)[#rotate(-90deg, reflow: true)[预备工作]], [
      阅读文献，理解 HSN 表示方法、运算、神经网络的原理
    ],
    [第 2 周], [
      针对性复习概率论、鞅论相关知识
    ],
    [3 月 6 日前], table.cell(colspan: 2)[完成毕设开题],
  )
  #pagebreak()
  #table(
    [第 3 周], table.cell(rowspan: 2)[#rotate(-90deg, reflow: true)[基础性质]], [
      构建 HSN 的数学模型，完成 HSN 分布的数学表达式推导
    ],
    [第 4 周], [
      估计噪声强度对分布及分布特征的影响；编写对应仿真程序验证
    ],
    [第 5 周], table.cell(rowspan: 3)[#rotate(-90deg, reflow: true)[算术运算分析]], [
      推导加法、乘法等算术算子对 HSN 分布及特征的影响，研究输入相关性对乘法的影响
    ],
    [第 6 周], [
      比较 HSN 的加法和传统 SC 的 MUX 加法对分布及特征的影响，研究噪声在加法、乘法、除法中的扩散过程
    ],
    [第 7 周], [
      编写算术运算仿真程序，并验证理论的准确性
    ],
    [4 月 17 日前], table.cell(colspan: 2)[完成中期检查],
  )
  #pagebreak()
  #table(
    [第 8 周], table.cell(rowspan: 3)[#rotate(-90deg, reflow: true)[一般函数的分析]], [
      研究 HSN 域内的复杂函数映射，证明用 Bernstein 多项式逼近复杂函数的有效性
    ],
    [第 9 周], [
      估计逼近的误差大小，研究复杂函数对 HSN 分布及特征的影响
    ],
    [第 10 周], [
      估计复杂函数对 HSN 中噪声的影响，编写对应仿真程序验证
    ],
  )
  #pagebreak()
  #table(
    [第 11 周], table.cell(rowspan: 4)[#rotate(-90deg, reflow: true)[神经网络中 HSN 的传播]], [
      研究 HSN 在复杂神经网络中的行为，分析神经网络传播中 HSN
      信号的分布及分布特征量变化，
    ],
    [第 12 周], [
      利用不等式进行估计，分析 HSN 网络和 BN 网络的数字表示误差
    ],
    [第 13 周], [
      估计噪声在网络传播过程中的扩散，编写基于 HSN 的神经网络前向传播仿真程序
    ],
    [第 14 周], [
      利用仿真程序验证理论的正确性，并用理论解释文献中的实验结果
    ],
  )
  #pagebreak()
  #table(
    [第 15 周], table.cell(colspan: 2)[总结理论成果和仿真代码，完成毕业论文的全文撰写],
    [5 月 22 日前], table.cell(colspan: 2)[完成论文查重、评阅],
    [第 16 周], table.cell(colspan: 2)[准备毕业答辩],
    [约 6 月], table.cell(colspan: 2)[完成结题答辩],
  )
]

= 预期目标

== 预期目标

- HSN 数学理论框架
  - 噪声、加法、乘法、除法、复杂函数对 HSN 分布特征的影响
  - 算术运算、函数运算、神经网络系统中 HSN 的功耗、延迟、容错性分析
  - 成果形式：毕业论文中阐述理论框架
- 仿真程序验证
  - 基于 C++/Python 构建
  - 利用 Monte Carlo 算法进行仿真模拟
  - 模拟噪声、加法、乘法、除法、复杂函数、神经网络前向传播过程
  - 结果与理论推导相比较，进行验证
  - 成果形式：构建的仿真程序源代码

= 参考文献

== 参考文献

#text(zh(5))[
    #bibliography("ref.bib", style: "gb-7714-2005-numeric", title: none)
]

#end-slide()

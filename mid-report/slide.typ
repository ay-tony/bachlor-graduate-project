#import "@preview/buaa-unofficial-gradient:0.1.0": *
#import "@local/aytony:1.0.0": *

#set text(font: ("Times New Roman", "SimHei"), lang: "zh")
#show: thmrules

#show: buaa-theme.with(
  config-info(
    title: [概率计算网络数学模型设计与理论分析],
    subtitle: [2026本科毕业设计中期答辩],
    author: [安阳],
    date: datetime.today(),
    institution: [数学科学学院 #h(2em) | #h(2em) 导师：李洪革、魏光美],
  )
)

#let mythm = thmenv(
  "mythm", none, none,
  (name, number, body, title: "测试") => block(
    above: 2em,
    below: 2em,
    breakable: false,
    width: 100%,
  )[

    #set align(left)
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
    breakable: false,
    width: 100%,
  )[

    #set align(left)
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

#title-slide()

#outline-slide()

= 毕设工作简介

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

= 进度安排

== 进度安排

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

    [4 月 17 日前], table.cell(colspan: 2, inset: (y: 2em))[#text(fill: red.darken(20%))[完成中期检查]], [进行中],

    [第 8 周], table.cell(rowspan: 3, inset: (y: 3em))[#rotate(-90deg, reflow: true)[一般函数对 HSN 的作用]], [
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

= 已完成工作

== HSN 的数学定义和基础性质

#de([HSN])[
  一个 HSN $vX$ 定义为有序三元组 $vX = (m, k, {X_i}_(i=1)^L)$，并满足：

  - 物理位宽 $m in NN^*$，代表硬件实现时的实际位宽；
  - 比例因子 $k$，用于调整数值量程的权重补偿系数；
  - 随机脉冲串 ${X_i}_(i=1)^L$ 为 i.i.d. 序列，且每个 $X_i$ 几乎处处（a.s.）为 $m$ 位二进制数。
]<de:hsn>

#ex[
  本例中 $m=3, k=2, L=4$，表征值 $x = 60 = 2^k dot overline(X)$。
  #figure(
    table(
      columns: 8,
      inset: .5em,
      [$X_i^((2))$], [$X_i^((1))$], [$X_i^((0))$], [], [], [], [], [$2^k dot X_i$],
      [$0$], [$1$], [$0$], [$0$], [$0$], [$0$], [$0$], [$2 dot 2^4 = 32$],
      [$1$], [$1$], [$1$], [$0$], [$0$], [$0$], [$0$], [$7 dot 2^4 = 112$],
      [$1$], [$0$], [$1$], [$0$], [$0$], [$0$], [$0$], [$5 dot 2^4 = 80$],
      [$0$], [$0$], [$1$], [$0$], [$0$], [$0$], [$0$], [$1 dot 2^4 = 16$],
    ),
    caption: [例子]
  )
]

#de([表征值])[
  HSN $vX = (m, k, {X_i}_(i=1)^L)$ 的表征值 $X$ 定义为其样本均值的加权映射 $ X = 2^k / L dot sum_(i=1)^L X_i. $
]<de:bzz>

#pagebreak()

#prop([表征空间])[
  对于 HSN $vX = (m, k, {X_i}_(i=1)^L)$，其表征值为 $X$ a.s. 取值于如下离散集合：\ #box(width: 100%)[$
    sS &= {z dot alpha | z in ZZ, 0 <= z <= L(2^(m)-1)}\
    &= {0, alpha, 2alpha, 3alpha, ..., 2^(m+k) - 2^k},
  $] 其中 $alpha = 2^k \/ L$。
]<prop:bzkj>

#de([表征空间])[
  @prop:bzkj 中的 $sS$ 称为 $vX$ 的表征空间。
]

#de([表征上界、编码精度])[
  设 $vX = (m, k, {X_i}_(i=1)^L)$ 是 HSN，$sS$ 是 $vX$ 的表征空间。

  - 定义 $vX$ 的表征上界 $M = sup sS = 2^(m+k) - 2^k$ 为 HSN 能够表征的最大数；
  - 定义 $vX$ 的编码精度 $alpha = 2^k \/ L$，该参数反映了 HSN 表征空间的分辨率。
]<de:bmjd>

== BTH 转换函数

#let BTH = math.class("unary", "BTH")

#de("BTH 转换函数")[
  设转换函数 $BTH$ 为从二进制空间向 HSN 空间的映射。给定物理位宽 $m$、比例因子 $k$ 以及长度为 $L$ 的辅助随机序列 ${R_i}_(i=1)^L$，转换过程记为：\ #box(width: 100%)[$
    vX = BTH(m, k, {R_i}_(i=1)^L, x).
  $] 其中，${R_i}_(i=1)^L$ 为 i.i.d. 辅助随机变量，且每个 $R_i$ 在集合 ${0, 1, ..., 2^(n-m+1)-1}$ 上服从均匀分布。待转换的 $n$ 位 BN $x$ 需满足量程约束 $x <= 2^(m+k) - 2^k$。转换逻辑如下：

  1. 数值分解：将 $x$ 分解为 $m$ 个权重分量的线性组合：\ #box(width: 100%)[$
      x = sum_(j=0)^(m-1) 2^j x_j.
    $] 其中，$x_j$ 是与权重 $2^j$ 相对应的系数值，且满足 $0 <= x_j < 2^k$；
  2. 随机化生成：对于 HSN 脉冲串中的每个分量 $X_i$（$i=1, ..., L$），其第 $j$ 个比特位 $X_i^((j))$ 根据随机比较结果确定：\ #box(width: 100%)[$
      X_i^((j)) = cases(1\, quad R_i < x_j, 0\, quad R_i >= x_j), quad forall j in {0, 1, ...,  m-1}.
    $]
]<de:bth>

#prop[
  @de:bth 中构造的元组 $(m, k, {X_i}_(i=1)^L) = vX = BTH(m, k, {R_i}_(i=1)^L, x)$ 是合法的 HSN。
]<prop:bthvalid>

#prop([无偏性])[
  对于转换 $vX = BTH(m, k, {R_i}_(i=1)^L, x)$，其表征值 $X$ 的数学期望等于原始二进制数，即 $uE[X] = x$。
]

#let Var = math.class("unary", "Var")

#prop([方差分解公式])[
  对于转换 $vX = BTH(m, k, {R_i}_(i=1)^j, x)$，设 BTH 内对 $x$ 的拆分方法为 \ #box(width: 100%)[$
    x = sum_(j=0)^(m-1) 2^j x_j,
  $] 那么 $vX$ 的表征值 $X$ 的方差满足公式 \ #box(width: 100%)[$
    Var X = 1 / L sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1 + j_2) min{x_j_1, x_j_2}(2^k - max{x_j_1, x_j_2}).
  $] 
]<prop:Var1>

#prop([方差上确界])[
  记 $M = 2^(m+k) - 2^k$ 为 $vX$ 的表征上界，则对于@prop:Var1 中所有可能的 $x in [0, M] inter ZZ$ 及其对应分解策略 ${x_j}$，方差的上确界为\ #box(width: 100%)[$
    sup_(x, {x_j}) {Var X} = 2^(2k - 2) / L (2^m-1)^2,
  $] 该上确界给出了 BTH 转化在最坏情况下的统计波动边界。
]<prop:supVar>

#prop([采样值分布])[
  设 $n$ 位 BN $x$ 在 BTH 转换函数内部分解为 $m$ 个分量 ${x_0, x_1, ..., x_(m-1)}$。若将这些分量按非递减顺序重排为 \ #box(width: 100%)[$
  0 <= x_(pi(0)) <= x_(pi(1)) <= ... <= x_(pi(m-1)) < 2^k,
  $] 则随机采样点 $X_i$ 的取值集合 $sV$ 满足 $|sV| <= m+1$。其元素 $v_r$ 具有如下形式：\ #box(width: 100%)[$
  v_r = sum_(j=0)^(m-1) 2^j dot 1_({x_j > x_(pi(r-1))}), quad r in {0, 1, ..., m}.
  $]（约定 $x_(pi(-1)) = -1$）
]<prop:discrete>

#ex[
  本例源于文献@Li2024。假设要将 $6$ 位 BN $x = 61$ 编码为物理位宽 $m=3$，比例因子 $k=4$ 的 HSN $vX$。辅助变量 $R_i$ 服从 ${0, 1, ..., 2^4-1=15}$ 上的均匀分布。如果指定 BTH 内部分解为 $x_0 = 5, x_1 = 12, x_2 = 8$，此时 \ #box(width: 100%)[$
    x = sum_(j=0)^2 2^j x_j = 2^0 dot 5 + 2^1 dot 12 + 2^2 dot 8 = 61
  $] 说明这是合法的分解。

  为了得到 $R_i$ 和 $X_i$ 的取值对应表，将分量 ${x_j}$ 按升序排列：\ #box(width: 100%)[$
    x_pi(0) = x_0 = 5, x_pi(1) = x_2 = 8, x_pi(3) = x_1 = 12,
  $] 这三个阈值将 $R_i$ 的取值空间 $[0, 15] inter ZZ$ 划分为 $m + 1 = 4$ 个互斥区间。
]

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

#prop([分布特征方差公式])[
  设 $n$ 位 BN $x$ 的 BTH 分量按升序排列为 $0 <= x_(pi(0)) <= x_(pi(1)) <= ... <= x_(pi(m-1)) < 2^k$。记 $Delta_r = x_(pi(r)) - x_(pi(r-1))$（约定 $x_(pi(-1)) = 0$），$v_r$ 为采样点在区间 $I_r$ 上的取值，则 $vX$ 的表征值 $X$ 的方差满足：
  $ Var X = 1 / L sum_(0 <= r < s <= m) Delta_r Delta_s (v_r - v_s)^2 / 2^k $
]<prop:Var2>

#prop([方差公式等价性])[
  @prop:Var1 与@prop:Var2 给出的方差公式在数学上是完全等价的。
]

#prop([渐进正态])[
  设 $vX = (m, k, {X_i}_(i=1)^L)$ 为 BTH 转换生成的 HSN。当脉冲长度 $L -> oo$ 时，表征值 $X$ 满足：\ #box(width: 100%)[$
  sqrt(L)(X - x) -->^d sN(0, 2^(2k) Var X_1),
  $] 其中 $-->^d$ 表示依分布收敛（弱收敛），$sN(mu, sigma^2)$ 代表均值为 $mu$，方差为 $sigma^2$ 的正态分布。上式也可以记为 \ #box(width: 100%)[$
    X tilde^a sN(x, 2^(2k) / L Var X_1) = sN(x, Var X),
  $] 其中 $tilde^a$ 表示“渐近服从于”。
]<prop:jjzt>

== HSN 的乘法

#de([独立])[
  称两个 HSN $vX, vY$ 相互独立，如果它们的脉冲序列的并集 \ #box(width: 100%)[$
    {X_i}_(i=1)^(L_X)union{Y_i}_(i=1)^(L_Y) = {X_1, X_2, ..., X_L_X, Y_1, Y_2, ..., Y_L_Y}
  $] 为独立随机变量集合。
]

#de([乘法])[
  设$vX, vY$ 为两个相互独立且它们的脉冲长度相同的 HSN，记为 \ #box(width: 100%)[$
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

#prop([乘法无偏性])[
  @de:cf 中的乘法在期望的意义下是准确的，即乘法满足 $uE[Z] = uE[X] uE[Y]$。
]

#prop([乘法表征空间])[
  设 $vX = (m_X, k_X, {X_i})$ 与 $vY = (m_Y, k_Y, {Y_i})$ 独立，其乘积为 $vZ = (m_Z, k_Z, {Z_i})$。令 $alpha_X, alpha_Y$ 分别为分量的编码精度，则 $vZ$ 的表征值 $Z$ a.s. 取值于如下集合：\ #box(width: 100%)[$ { z dot (alpha_X alpha_Y dot L) | z in ZZ, 0 <= z <= L(2^(m_X)-1)(2^(m_Y)-1) } \ 
  subset sS_Z = { z dot (alpha_X alpha_Y dot L) | z in ZZ, 0 <= z <= L(2^(m_Z)-1) }. $]
]

#prop([精度退化])[
  乘法运算后，结果的编码精度 $alpha_Z$ 与分量精度满足：\ #box(width: 100%)[$
    alpha_Z = L dot alpha_X alpha_Y 
  $] 即相对于理想的 $alpha_X alpha_Y$，HSN 的乘法引入了因子为 $L$ 的编码精度损失。
]<prop:jdth>

#prop([乘法方差公式])[
  设独立 HSN $vX, vY$ 的表征值期望分别为 $mu_X, mu_Y$，方差分别为 $sigma_X^2, sigma_Y^2$，则乘积 $vZ$ 的表征值 $Z$ 的方差满足：\ #box(width: 100%)[$
  Var Z = L sigma_X^2 sigma_Y^2 + mu_X^2 sigma_Y^2 + mu_Y^2 sigma_X^2.
  $]
]<prop:cffcgs>

#prop([乘法渐近正态性])[
  设独立 HSN $vX, vY$ 满足 $sqrt(L)(X - mu_X) ->^d N(0, sigma_(X_1)^2)$ 与 $sqrt(L)(Y - mu_Y) ->^d N(0, sigma_(Y_1)^2)$。则其乘积 $Z$ 满足$
  sqrt(L)(Z - mu_X mu_Y) ->^d sN(0, mu_Y^2 sigma_(X_1)^2 + mu_X^2 sigma_(Y_1)^2). 
  $
]<prop:cfjjztx>

== 比例加法

#de([比例加法])[
  设 HSN $vX, vY$ 脉冲长度均为 $L$，记为 \ #box(width: 100%)[$
  vX = (m_X, k_X, {X_i}), quad vY = (m_Y, k_Y, {Y_i}).
  $] 为简化硬件实现，设 $m_X = m_Y = m$ 且 $k_X = k_Y = k$。定义比例加法 $(m_Z, k_Z, {Z_i}) = vZ = vX plus vY$ 如下：

  - $m_Z = m$；
  - $k_Z = k + 1$；
  - $Z_i = X_i + Y_i, forall i in {1, 2, ..., L}$。
]<de:add>

#prop([比例加法封闭性])[
  由 @de:add 定义的 $vZ$ 仍然是 HSN。
]

#prop([加法无偏性])[
  比例加法满足 \ #box(width: 100%)[$
  E[Z] = (E[X] + E[Y]) / 2.
  $]
]

#prop([比例加法方差])[
  如果比例加法的运算数 $vX, vY$ 独立，那么比例加法结果的方差满足 \ #box(width: 100%)[$
  Var Z = 4 (Var X + Var Y).
  $]
]

#prop([比例加法渐近分布])[
  当 $L -> oo$ 时，比例加法的结果满足\ #box(width: 100%)[$
  sqrt(L)(Z - (mu_X + mu_Y)) ->^d N(0, 4(sigma_(X_1)^2 + sigma_(Y_1)^2)).
  $]
]

= 阶段性成果
== 阶段性成果

本研究已建立了 HSN 的统计分析框架，完成了从生成算法、离散分布特征到线性、非线性算术运算的数学推导与特性验证：

- HSN 的基础表征模型
- BTH 算子的生成分布与统计特征分析
- HSN 统计特征在算术运算中的演化

= 问题及后续工作

== 存在的问题

仍存在若干问题亟待解决：

- 单极性表征对负数支持的缺失
- 级联运算下物理位宽的指数级扩张
- 多级链路中的精度退化与噪声累积

== 后续工作安排

=== 代码模拟验证

- 第七周结束（4月20日）前完成相关验证代码的编写工作
- 基于 Python/C++
- 通过 Monte Carlo 法采样获取 HSN 的统计表征值，并将其与推导出的期望、方差及渐近分布公式进行横向比对

=== 预期目标差异分析与补全方案

- 目前仅建立单极性 HSN 模型，不能表征负数
- 对减法运算的推导因而滞后
- 计划推导出双极性 HSN 的概率映射模型i
- 除法原理上（逐次逼近法或 Bernstein 多项式法）更接近复杂函数部分，不在此处推导

=== 时间进度规划与可行性评估

具体进度仍按照前文列出的安排进行规划，双极性理论的引入增加了工作量，但大部分推导逻辑具有可复用性，预期能够按时完成既定科研任务

= 参考文献

== 参考文献

#text(zh(5))[
    #bibliography("ref.bib", style: "gb-7714-2005-numeric", title: none, full: true)
]

#end-slide()

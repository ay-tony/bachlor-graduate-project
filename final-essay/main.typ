#import "@preview/pointless-size:0.1.0": zh
#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "@preview/ctheorems:1.1.3": *
#import "@preview/physica:0.9.4": *
#import "@preview/wordometer:0.1.5": word-count, total-words

#show: word-count
#show: show-cn-fakebold
#show: thmrules.with(qed-symbol: $square$)
#show math.equation: set text(font: ("New Computer Modern Math", "Kaiti"))

#set text(lang: "zh")

// 修复没有顶满整行的列表的居中公式显示问题
#show math.equation.where(block: true): e => [
  #block(
    width: 100%,
    inset: 0em,
    [
      #set align(center)
      #e
    ],
  )
]

// 封面页

#set page(margin: (top: 2.2cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm))
#set align(center)

#box[#image("img/buaa-icon.png", width: 3.18cm)]
#h(1fr)
#box(height: 3.18cm)[
  #set text(zh(5), font: ("Times New Roman", "SimHei"), weight: "semibold")

  #set grid(
    stroke: (x, y) => if x == 1 {
      (bottom: .5pt + black)
    },
    inset: (x, y) => if x == 1 { (x: 2.5em, y: .1em) } else { .1em },
  )
  #grid(
    columns: 2,
    row-gutter: 1em,
    column-gutter: .3em,
    [单位代码], [10006],
    [学#h(2em)号], [22377264],
    [分#h(.5em)类#h(.5em)号], [O213.9],
  )
]

#v(1cm)

#image("img/buaa-char.png", width: 12.8cm)

#text(36pt, font: ("Times New Roman", "SimHei"))[
  毕业设计（论文）
]

#v(1cm)

#text(zh(2), font: ("Times New Roman", "SimHei"))[
  #set par(leading: 1.5em)
  概率计算网络中混合概率数\
  的数学建模与理论分析
]

#v(3cm)

#text(zh(-3))[
  #show grid.cell: set text(font: ("Times New Roman", "SimHei"))
  #show grid.cell.where(x: 0): set text(tracking: .7em)
  #show grid.cell.where(x: 1): set text(tracking: .1em)
  #set grid(
    stroke: (x, y) => if x == 1 {
      (bottom: .5pt + black)
    },
    inset: (x, y) => if x == 1 { (x: 3em, y: .3em) } else { .3em },
  )
  #grid(
    columns: 2,
    column-gutter: .5em,
    row-gutter: .5em,
    [学院名称], [数学科学学院],
    [专业名称], [数学与应用数学],
    [学生姓名], [安阳],
    [指导老师], [李洪革、魏光美],
  )

  #v(1cm)

  2026 年 6 月
]

#pagebreak()

// 书脊页

#set page(margin: (top: 3cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm))

#text(zh(4), font: "SimSun")[\ 论文封面书脊]

#align(horizon)[
  #box(
    stroke: black + 2pt,
    width: 1.5cm,
    inset: .5cm,
  )[
    #set par(leading: .4em, spacing: .4em)
    #set text(zh(4), font: "SimHei")
    概率计算网络中混合概率数的数学建模与理论分析

    #v(1cm)

    安阳

    #v(1cm)

    #set text(zh(-4))
    北京航空航天大学
  ]
]

#pagebreak()

// 声明页

#v(2cm)

#text(zh(-2), font: "Simsun")[*本人声明*]

#v(1cm)

#text(zh(4), font: "Simsun")[
  #set align(left)
  #set par(first-line-indent: (amount: 2em, all: true), leading: 1.5em)

  我声明，本论文及其研究工作是由本人在导师指导下独立完成的，在完成论文时所利用的一切资料均已在参考文献中列出。
]

#v(3cm)

#align(right)[
  #box(width: 5cm)[
    #set text(zh(-4), font: "Simsun")
    #set align(left)

    作者：安阳

    签字：

    时间：2026年6月
  ]
]

#pagebreak()

// 中文摘要页

#counter(page).update(1)
#set page(
  header: [
    \
    #box[#image("img/buaa-icon.png", width: 1.27cm)
      #v(-.3cm)
    ]
    #set text(zh(4), font: "SimHei", tracking: .1em)
    #h(2.5cm)
    北京航空航天大学毕业设计（论文）
    #h(1fr)
    #set text(zh(5), font: ("Times New Roman", "SimSun"))
    第
    #context counter(page).display("I")
    页\
    #v(-.1cm)
    #line(length: 100%, stroke: 1pt + black)
  ],
)

#pagebreak()

// 英文摘要页

#pagebreak()

// 目录页

#set par(spacing: 1em, leading: 1em)
#set text(zh(-4))

#show outline.entry.where(level: 1): set text(font: ("Times New Roman", "SimHei"), weight: "semibold")
#show outline.entry.where(level: 1): set block(above: 1.5em)
#show outline.entry.where(level: 2): set text(font: ("Times New Roman", "SimSun"))
#show outline.entry.where(level: 3): set text(font: ("Times New Roman", "SimSun"))

#text(zh(3), font: "SimHei", weight: "semibold")[目录]
#v(1cm)

#outline(title: none)

#pagebreak()

// 正文页

#counter(page).update(1)
#set page(
  header: [
    \
    #box[#image("img/buaa-icon.png", width: 1.27cm)
      #v(-.3cm)
    ]
    #set text(zh(4), font: "SimHei", tracking: .1em)
    #h(2.5cm)
    北京航空航天大学毕业设计（论文）
    #h(1fr)
    #set text(zh(5), font: ("Times New Roman", "SimSun"))
    第
    #context counter(page).display("1")
    页\
    #v(-.1cm)
    #line(length: 100%, stroke: 1pt + black)
  ],
)

#set align(left)
#set text(zh(-4), font: ("Times New Roman", "SimSun"))
#set par(spacing: 1em, leading: 1em, first-line-indent: (amount: 2em, all: true), justify: true)
#set list(marker: (
  box(height: 0.65em, move(dy: 0.15em)[•]),
  box(height: 0.65em, move(dy: 0.15em)[‣]),
  box(height: 0.65em, move(dy: 0.15em)[–])
))
#set enum(numbering: (..args) => {
  let marker = numbering("1.", ..args)
  box(height: 0.65em, move(dy: 0.17em, marker))
})

#set heading(numbering: "1.1  ")
#show heading.where(level: 1): it => [
  #pagebreak(weak: true)
  #it
]
#show heading.where(level: 1): set text(
  zh(3),
  font: ("Times New Roman", "SimHei"),
  weight: "semibold",
)
#show heading.where(level: 1): set align(center)
#show heading.where(level: 1): set block(above: 2cm, below: 1.5cm)
#show heading.where(level: 2): set text(
  zh(-4),
  font: ("Times New Roman", "SimHei"),
  weight: "semibold",
)
#show heading.where(level: 2): set align(left)
#show heading.where(level: 2): set block(above: 2em, below: 1.5em)
#show heading.where(level: 3): set text(
  zh(-4),
  font: ("Times New Roman", "SimHei"),
  weight: "semibold",
)
#show heading.where(level: 3): set align(left)
#show heading.where(level: 3): set block(above: 2em, below: 1.5em)

#let mythm = thmenv(
  "mythm",
  none,
  none,
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
  ],
).with(numbering: "1")

#let mypf = thmenv(
  "mythm",
  none,
  none,
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
  ],
).with(numbering: none)

#let de = mythm.with(title: "定义", supplement: "定义")
#let prop = mythm.with(title: "命题", supplement: "命题")
#let ex = mythm.with(title: "例子", supplement: "例子")
#let pf = mypf.with(title: "证明", supplement: "证明")

#let scr(it) = text(features: ("ss01",), box($cal(it)$))
#let cate(it) = $upright(sans(#it))$

#let sA = $scr(A)$
#let sB = $scr(B)$
#let sF = $scr(F)$
#let sG = $scr(G)$
#let sH = $scr(H)$
#let sM = $scr(M)$
#let sN = $scr(N)$
#let sR = $scr(R)$
#let sS = $scr(S)$
#let sL = $scr(L)$
#let sV = $scr(V)$
#let sX = $scr(X)$
#let sY = $scr(Y)$
#let sZ = $scr(Z)$
#let sl = $scr(l)$
#let vF = $vb(F)$
#let vI = $vb(I)$
#let vX = $vb(X)$
#let vY = $vb(Y)$
#let vZ = $vb(Z)$
#let vr = $vb(r)$
#let vx = $vb(x)$
#let vy = $vb(y)$
#let vz = $vb(z)$
#let uE = $upright(E)$
#let uM = $upright(M)$
#let uP = $upright(P)$
#let ue = $upright(e)$
#let cC = $cate(C)$
#let cL = $cate(L)$
#let fC = $frak(C)$
#let fX = $frak(X)$

#let LHS = math.class("normal", "LHS")
#let RHS = math.class("normal", "RHS")
#let var = math.class("unary", "var")
#let Var = math.class("unary", "Var")
#let Ob = math.class("unary", "Ob")
#let Mor = math.class("unary", "Mor")
#let Hom = math.class("unary", "Hom")
#let Aut = math.class("unary", "Aut")
#let End = math.class("unary", "End")
#let bits = $"bits"$
#let argmin = math.op("argmin")
#let argmax = math.op("argmax")

#show sym.lt.eq: sym.lt.eq.slant
#show sym.gt.eq: sym.gt.eq.slant
#show sym.dots: sym.dots.c


= 绪论

= 预备知识


= 混合概率数（HSN）的数学定义与基础性质

== 引言

神经网络等复杂计算任务往往对数据的动态范围有较高要求，传统的确定性二进制编码（BN）表征能力强，但硬件开销大；而传统的概率计算（SC）虽具极简的硬件结构，却面临高精度下时延随位宽呈指数级增长的“精度-时延”瓶颈。混合概率数（Hybrid Stochastic Number, HSN）的核心设计思想，正是试图通过结合二进制的位置权属性与随机比特流的统计特性，用低位宽的随机变量序列来实现对大动态范围数值的高效、高容错表征。

为方便后续讨论，我们首先约定：称一个正整数 $x$ 为“$n$ 位数”，是指其取值空间限定在离散集合 $x in {0, 1, ..., 2^n - 1}$ 内。

== HSN 的构思演进与形式化定义

为了利用随机信号表征一个 $n$ 位整数 $x$，一种最直观的初步构思是：构造一个长度为 $L$ 的独立同分布（i.i.d.）随机变量序列 ${X'_i}_(i=1)^L$。为了让该序列具备足够的表征范围，我们可以让每个采样值 $X'_i$ 均为 $n+1$ 位整数。若该序列满足如下无偏性条件：\ #box[$ E[X'_i] = x, $] 则根据大数定律，在硬件中我们便可以通过累加求和的方式，定义其样本均值作为目标数值 $x$ 的经验估计量：\ #box[$ overline(X)' = 1 / L sum_(i=1)^L X'_i approx x. $]

然而，这种初级构思在实际的微电子架构中并不经济。在硬件实现上，直接在时域传输并处理高位宽的随机序列会消耗大量的布线资源与逻辑门。为了在维持动态范围的同时优化表示效率，在空间上，我们对高位宽变量 $X'_i$ 进行截断，令其低位恒为零，仅保留高 $m$ 位的有效信息（其中 $1 <= m <= n$）。此时，高位宽变量 $X'_i$ 与低位宽变量 $X_i$ 之间便建立起了映射：\ #box[$ X'_i = 2^k X_i, quad "其中" k = n - m + 1, $] 这里 $X_i$ 转化为一个物理位宽仅为 $m$ 位的二进制数，其硬件代价大幅降低。相应地，对目标值 $x$ 的估计式也通过比例因子 $k$ 进行了权重补偿，修正为：\ #box[$ 2^k overline(X) = 2^k / L sum_(i=1)^L X_i approx x. $]

综合上述从随机统计到硬件剪裁的演进逻辑，我们给出HSN的形式化定义。

#de([HSN])[
  一个 HSN $vX$ 定义为一个有序三元组 $vX = (m, k, {X_i}_(i=1)^L)$，它严格满足以下硬件与概率约束：
  - 物理位宽 $m in NN^*$：代表微架构实现时数据总线的实际物理位宽；
  - 比例因子 $k in ZZ$：用于调整数值量程与动态范围的权重补偿系数；
  - 随机脉冲串 ${X_i}_(i=1)^L$：为一独立同分布（i.i.d.）的随机序列，且每个采样点 $X_i$ 几乎处处（a.s.）取值于 $m$ 位二进制数空间。
]<de:hsn>

在明确了序列本身的统计约束后，我们需要定义该序列最终映射回实数域的数学实体。

#de([表征值])[
  设 $vX = (m, k, {X_i}_(i=1)^L)$ 为一个 HSN，定义该 HSN 的表征值 $X$ 为其随机脉冲串样本均值的加权映射：\ #box[$ X = 2^k / L dot sum_(i=1)^L X_i. $]
]<de:bzz>

#prop()[
  设 HSN $vX$ 的表征值是 $X$，那么 $
    uE X = 2^k uE X_i.
  $
]

#pf[
  $
    uE X = uE [2^k / L dot sum_(i=1)^L X_i] = 2^k / L dot L dot uE X_i = 2^k uE X_i.
  $
]

== 表征空间及编码精度

在建立 HSN 的形式化基础之后，一个自然衍生且在工程上至关重要的问题是：给定一组具体的硬件参数 $(m, k, L)$，该系统究竟能够表达哪些数字？其分辨细微数值差异的能力如何？这要求我们从测度论和离散数学的角度，探究其所能覆盖的数字集合（表征空间）以及最小分辨率（编码精度）。

#prop([表征空间])[
  对于 HSN $vX = (m, k, {X_i}_(i=1)^L)$，其表征值 $X$ 几乎处处（a.s.）取值于如下一维离散网格集合：\ #box[$
    sS & = {z dot alpha | z in ZZ, 0 <= z <= L(2^(m)-1)} \
       & = {0, alpha, 2alpha, 3alpha, ..., 2^(m+k) - 2^k},
  $]
  其中 $alpha = 2^k \/ L$。这样，我们也可以在几乎处处的意义下将表征值 $X$ 看做 $sS$ 上的随机变量。
]<prop:bzkj>

#pf[
  根据@de:bzz 的表征值定义，可以将 $X$ 改写为\ #box[$ X = 2^k / L dot sum_(i=1)^L X_i = alpha sum_(i=1)^L X_i. $]
  由于脉冲串中每个随机变量 $X_i$ 几乎处处取值于二进制整数集合（即 $X_i in {0, 1, ..., 2^m-1}$），则整个时间序列的求和量 $Z = sum_(i=1)^L X_i$ 显然是一个离散的整数，其取值边界由单点域的最大值线性累加决定，即其范围为整数集 ${0, 1, ..., L(2^m - 1)}$。

  相应地，$X = alpha dot Z$ 的取值集合即为公差为 $alpha$ 的等差点集 ${0, alpha, 2alpha, ..., alpha L(2^m - 1)}$。将该集合的离散上界进行代数展开，可得：\  #box[$ alpha L (2^m - 1) = 2^k / L dot L(2^m - 1) = 2^(m+k) - 2^k. $]证毕。
]

#de([表征空间])[
  @prop:bzkj 中定义的离散网格集合 $sS$ 称为该 HSN $vX$ 的表征空间。
]<de:bzkj>

从上面的推导不难看出，给定结构参数后，HSN 的所有可能表征值在区间 $[0, 2^(m+k)-2^k]$ 内构成了一个均匀分布的等差数列。这个等差数列可以通过上界和公差刻画，从而引出了@de:bzsjybmjd。

#de([表征上界与编码精度])[
  设 $vX = (m, k, {X_i}_(i=1)^L)$ 为一 HSN，其对应的表征空间为 $sS$：
  - 定义 $vX$ 的表征上界 $M = sup sS = 2^(m+k) - 2^k$，其反映了该编码方案在不溢出前提下能够承载的最大有效数值；
  - 定义 $vX$ 的编码精度 $alpha = 2^k \/ L$，即表征空间等差数列的公差。该参数在物理上定义了 HSN 表征空间的分辨率，代表系统能够分辨的最小数值扰动。
]<de:bzsjybmjd>

总结来看，本节对表征空间的推导揭示了一个重要事实：尽管混合概率数在底层使用的是不断随时间变化的随机序列，但它最终表达出来的数值 $X$ 并不是连续的，而是严格限制在以 $alpha$ 为间隔的等差集合 $sS$ 之中。这意味着，当我们尝试用混合概率数去表示一个任意的实数时，往往无法做到绝对精确，而是会产生一定的舍入误差。

表征空间 $sS$ 的范围大小和密集程度，直接决定了这种方案在表达一个数时可能带来的最大误差。在明确了这种静态的表达范围和精度之后，我们便有了基础工具去分析更加复杂的动态过程。

== HSN 的 Shannon 熵

=== Shannon 熵的定义与基础性质

混合概率数的底层载体是随时间流动的随机序列，这意味着系统在运行的每一个瞬间都包含着随机波动。为了量化这种由随机性带来的不确定性，我们需要引入概率论与信息论中的核心概念—— Shannon 熵。

#de([单时刻Shannon熵])[
  设 $vX = (m, k, {X_i}_(i=1)^L)$ 为 HSN，它在 $i$ 时刻的采样值为 $X_i$（由于 $X_i$ 是 i.i.d. 的，所以可以任意取 $i$ 而不影响结论），定义 $vX$ 的单时刻Shannon熵 $H(X_i)$ 为：
  \ #box[$ H(X_i) = - sum_(k=0)^(2^m-1) uP(X_i = k) log_2 uP(X_i = k). $]
]<de:dskshannons>

从直观上看，单时刻 Shannon 熵是用来下一时刻该序列会输出什么数值的不确定程度。我们对输出结果感到越不确定、越难猜中，单时刻 Shannon 熵的值就越大；反之，如果我们能很有把握地断定输出结果，单时刻 Shannon 熵的值就越小。单时刻 Shannon熵的大小直接反映了随机序列波动的混乱程度。

根据@de:dskshannons，我们可以立刻得到单时刻 Shannon 熵的两个最基本的边界特征，即@prop:bjtz。

#prop([边界特征])[
  - 零熵状态（确定性退化）：当且仅当某一个状态的概率 $uP(X_i = k) = 1$，而其余状态的概率全为 $0$ 时，$H(X_t) = 0$。这表明该 HSN 在当前时刻完全失去了随机性，退化为了一个固定不变的确定性数值。
  - 最大熵状态（均匀分布）：由于状态空间共有 $2^m$ 个元素，当且仅当所有状态的发生概率完全相等（即 $uP(X_i = k) = 2^(-m), k = 0, 1, ..., 2^m-1$）时，单时刻 Shannon熵达到其理论最大值
    \ #box[$ H_(max)(X) = log_2 (2^m) = m bits. $]
]<prop:bjtz>

故混合概率数在实际工作时，其单时刻携带的 Shannon 熵总是在 $0 bits$ 到 $m bits$ 之间变动。在研究 Shannon 熵的时候，我们需要时刻明确这一静态边界。

除了@de:dskshannons 之外，还可以研究 HSN 表征值的 Shannon 熵。

#de([表征 Shannon 熵])[
  设 HSN $vX$ 的表征值为 $X$，编码精度为 $alpha = 2^k \/ L$，定义 $vX$ 的表征 Shannon 熵为 $
    H(X) = - sum_(k=0)^(L(2^m-1)) uP(X = alpha k) log_2 uP(X = alpha k).
  $
]<de:bzshannons>

@de:bzshannons 描述了表征值 $X$ 所携带的信息量。需要说明的是，表征 Shannon 熵和单时刻 Shannon 熵之间并不存在简单的单调性关系。由于目前并未找到表征 Shannon 熵 $H(X)$ 和单时刻 Shannon 熵 $H(X_i)$ 之间的有效联系，后续的推导将以 $H(X_i)$ 为主。

=== 固定期望下的最大熵

在实际的硬件系统或神经网络中，一个 HSN 通常需要承载一个固定的目标数值，即其数值期望 $E X_i$ 是被约束的。为了让接下来的讨论更具普适性，我们以整数形式为例，设已知该 HSN 脉冲的期望值为 $uE X_i = mu$，在期望值 $mu$ 固定的约束条件下，单时刻 Shannon 熵 $H(X_i)$ 会展现出若干解析性质。

#prop([最大熵分布])[
  在已知期望为 $mu$ 的所有可能分布中，能使单时刻 Shannon 熵 $H(X_i)$ 达到最大值的概率分布，必定呈现出如下的离散 Gibbs 分布形式：
  \ #box[$ uP(X_i = k) = e^(-lambda k) / Z(lambda), quad k in {0, 1, ..., 2^m - 1}, $]
  其中 $Z(lambda) = sum_(k=0)^(2^m-1) e^(-lambda k)$ 为确保概率之和为 1 的常数项，而常数 $lambda$ 则由期望约束方程 $-dif/dd(lambda) ln Z(lambda) = mu$ 唯一决定。
]<prop:zdsfb>

#pf[
  这是一个典型的带约束条件的函数极值问题，可以使用 Lagrange 乘数法求解。记 $p_k = uP(X_i = k)$，构造 Lagrange 函数
  \ #box[$ sL = - sum_(k=0)^(2^m-1) p_k ln p_k - lambda_0 (sum_(k=0)^(2^m-1) p_k - 1) - lambda (sum_(k=0)^(2^m-1) k dot p_k - mu). $]
  对每一个未知数 $p_k$ 分别求导数，并令导数等于 $0$，即得到
  \ #box[$ pdv(sL, p_k) = -ln p_k - 1 - lambda_0 - lambda k = 0 quad ==> quad  p_k = e^(-(1+lambda_0)) e^(-lambda k). $]
  利用概率之和为 1 的条件，将常数部分记为 $1 \/ Z(lambda)$，即可得到 $p_k = e^(-lambda k) \/ Z(lambda)$。
]

在@prop:zdsfb 中，我们定性地证明了在固定期望值 $mu$ 的约束下，HSN 存在一个理论上的最大香农熵，并且其对应的最优概率分布服从离散吉布斯分布。然而，为了在实际应用或误差分析中定量评估系统的噪声门槛，我们需要进一步计算出最大香农熵 $H_(max)(mu)$ 关于给定期望 $mu$ 的具体解析表达式。

#prop([最大熵])[
  设 HSN $vX = (m, k, {X_i}_(i=1)^L)$ 满足 $uE X_i = mu$，那么它的单时刻 Shannon 熵 $H_mu (X_i)$ 达到最大时（也即 $X_i$ 的分布取到@prop:zdsfb 中情况时），有 
  \ #box[$ H_(mu) = - mu log_2 t + log_2 ( (1 - t^(2^m))/(1 - t) ). $]
  其中，参数 $t$ 是有理分式方程 
  \ #box[$ mu = (t)/(1-t) - (2^m t^(2^m))/(1-t^(2^m)) $] 的唯一正实根。
]<prop:zds>

#pf[
  由@prop:zdsfb 的极值条件可知，满足最大单时刻 Shannon 熵的概率分布 $p_k$ 必须满足
  \ #box[$ p_k (t) = t^k / Z(t), quad k in {0, 1, ..., 2^m - 1}, $]
  其中变量 $t$ 是一个大于 $0$ 的待定参数，它与期望约束紧密相关；而分母 $Z(t)$ 则为确保所有状态概率之和为 1 的归一化项。
  
  首先，我们计算归一化项 $Z(t)$。由于各状态的概率构成了一个有限项的等比数列，利用等比数列求和公式，可以将 $Z(t)$ 直接写为
  \ #box[$ Z(t) = sum_(k=0)^(2^m-1) t^k = (1 - t^(2^m))/(1 - t). $]
  
  其次，我们需要建立参数 $t$ 与给定期望 $mu$ 之间的代数方程。根据期望值的定义，将概率分布代入可得
  \ #box[$ mu = uE X_i = sum_(k=0)^(2^m-1) k dot p_k = (t)/(1 - t) - (2^m t^(2^m))/(1 - t^(2^m)). $]
  对于任意给定的期望值 $mu in (0, 2^m - 1)$，上式右侧关于参数 $t$ 是严格单调递增的。因此，在该区间内，该方程存在唯一的正实根，将其记为 $t(mu)$。
  
  最后，将最大单时刻 Shannon 熵 $H_(mu)$ 表达为 $mu$ 与 $t$ 的代数式。将概率 $p_k = t^k \/ Z$ 代入单时刻 Shannon 熵的定义公式中，得到
  \ #box[$ H_(mu) = - sum_(k=0)^(2^m-1) p_k log_2 p_k = - sum_(k=0)^(2^m-1) p_k log_2 ( (t^k)/(Z) ). $]
  利用对数的运算性质，将括号内的分式展开为相减形式，即有
  \ #box[$ H_(mu) = - sum_(k=0)^(2^m-1) p_k ( k log_2 t - log_2 Z ) = - ( sum_(k=0)^(2^m-1) k p_k ) log_2 t + ( sum_(k=0)^(2^m-1) p_k ) log_2 Z. $]
  因为在约束条件中，所有概率之和 $sum p_k = 1$，且数值期望 $sum k p_k = mu$，代入上式后即可得到通用参数化解析表达式
  \ #box[$ H_(mu) = - mu log_2 t + log_2 ( (1 - t^(2^m))/(1 - t) ). $]
  其中，参数 $t$ 是有理分式方程 
  \ #box[$ mu = (t)/(1-t) - (2^m t^(2^m))/(1-t^(2^m)) $] 的唯一正实根。
]

对于有限的离散状态空间，当状态数 $N = 2^m$ 较小时（例如 $m=1$），我们可以直接消去中间变量，求出完全显式的解析式；而当 $m > 1$ 时，虽然无法直接写出关于 $mu$ 的简单单项式，但我们可以通过建立代数方程，给出其精密的参数化显式解与边界近似规律。

当 HSN 退化为物理位宽 $m=1$（即状态数 $2^m = 2^1 = 2$，此时 HSN 退化为传统 SN）的特例时，该系统实际上退化为了标准的二进制定点数或纯粹的单比特概率计算。在这种情况下，我们可以通过代数变换直接消去中间参数 $t$，从而求出完全显式的解析表达式。

#prop[
  设 HSN $vX = (m = 1, k, {X_i}_(i=1)^L)$ 满足 $uE X_i = mu$（此时 $X_i in {0, 1}$），那么它的单时刻 Shannon 熵 $H_mu (X_i)$ 达到最大时有 
  \ #box[$ H_(mu) = - mu log_2 mu - (1-mu) log_2 (1-mu). $]
]

#pf[
  此时，关于参数 $t$ 的方程简化为
  \ #box[$ mu = (t)/(1-t) - (2 t^2)/(1 - t^2) = (t(1+t) - 2t^2)/(1-t^2) = (t)/(1+t). $]
  由此可直接反解出参数 $t$ 关于期望 $mu$ 的表达式为
  \ #box[$ t = (mu)/(1-mu). $]
  同时，归一化项 $Z$ 也可以同步转化为关于 $mu$ 的函数
  \ #box[$ Z = 1 + t = 1 + (mu)/(1-mu) = (1)/(1-mu). $]
  将求得的 $t$ 和 $Z$ 直接代入@prop:zds，展开并化简可得
  \ #box[$ H_(mu) = - mu log_2 ( (mu)/(1-mu) ) + log_2 ( (1)/(1-mu) ) = - mu log_2 mu - (1-mu) log_2 (1-mu). $]
]

这一推导结论表明，在传统 SN 情况下，即物理位宽 $m=1$ 时，$H_(mu)$ 正好退化为概率论中经典的二项分布熵。这也从侧面验证了通用参数化公式在低维情况下的正确性。

在后续的 HSN 分析中，这个@prop:zds 描述了给定均值下熵的上界。对后续章节中出现的任意 HSN 对应的单时刻 Shannon 熵 $H(X_i)$，其数值都必然严格受到本节结论的约束，即
\ #box[$ H(X_i) <= H_(mu). $]
通过对比实际算子的熵曲线与本节推导出的理论最大熵曲线之间的逼近程度，我们便能够严格地量化和评估具体HSN 对信息的表达效率，从而为硬件电路的进一步优化提供理论指导。

= HSN 的生成

== BTH 转换函数

二进制数至混合概率数（BN-to-HSN, BTH）的转换过程，实质上是将确定性的位置编码映射为包含统计特性的随机编码。该映射通过引入一组辅助随机序列 ${R_i}_(i=1)^L$（在硬件实现中通常由随机数发生器产生）作为中介，将 $n$ 位二进制数 $x$ 编码为对应的 HSN $vX$。记 $n$ 位二进制数 $x$ 的比特展开式为
\ #box[$ x = sum_(j=0)^(n-1) 2^j x^((j)), quad x^((j)) in {0, 1}, $]
其中 $x^((j))$ 代表其第 $j$ 位二进制分量。基于此表示，定义 BTH 转换函数。

#let BTH = math.class("unary", "BTH")

#de("BTH")[
  给定物理位宽 $m$、比例因子 $k$ 以及长度为 $L$ 的辅助随机序列 ${R_i}_(i=1)^L$，转换函数 $BTH$ 为从二进制空间 $ZZ inter [0, 2^m-1]$ 向 HSN 空间的映射，记为
  \ #box[$ vX = BTH(m, k, {R_i}_(i=1)^L, x). $]
  其中，${R_i}_(i=1)^L$ 为 i.i.d. 辅助随机变量，且每个 $R_i$ 在集合 ${0, 1, ..., 2^m-1}$ 上服从均匀分布。待转换的 $n$ 位 BN $x$ 需满足量程约束 $0<=x <= 2^(m+k) - 2^k$。转换逻辑如下：

  1. 数值分解：将 $x$ 分解为 $m$ 个权重分量的线性组合：\ #box[$ x = sum_(j=0)^(m-1) 2^j x_j. $] 其中，$x_j$ 是与权重 $2^j$ 相对应的系数值，且满足 $0 <= x_j < 2^k$；
  2. 随机化生成：对于 HSN 脉冲串中的每个分量 $X_i$（$i=1, ..., L$），其第 $j$ 个比特位 $X_i^((j))$ 根据随机比较结果确定：\ #box[$ X_i^((j)) = cases(1\, quad R_i < x_j, 0\, quad R_i >= x_j) = 1_({R_i < X_j}), quad forall j in {0, 1, ..., m-1}. $]
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
  根据表征值定义与期望算子的线性性质，推导如下：$ uE[X] & = uE[ 2^k/L sum_(i=1)^L X_i ]
          = 2^k/L sum_(i=1)^L uE[sum_(j=0)^(m-1) 2^j X_i^((j)) ]
          = 2^k sum_(j=0)^(m-1) 2^j E[ X_i^((j)) ] \
        & = 2^k sum_(j=0)^(m-1) 2^j dot P(R_i < x_j)
          = 2^k sum_(j=0)^(m-1) 2^j dot (x_j)/(2^k)
          = sum_(j=0)^(m-1) x_j 2^j
          = x. $
]

#let Var = math.class("unary", "Var")

== 转换结果的波动特性

在确定了 BTH 的无偏性后，下面进一步研究其波动特性。方差的大小直接决定了 HSN 在硬件计算中的信噪比与收敛速度。

#prop([方差分解公式])[
  对于转换 $vX = BTH(m, k, {R_i}_(i=1)^j, x)$，设 BTH 内对 $x$ 的拆分方法为 \ #box[$ x = sum_(j=0)^(m-1) 2^j x_j, $] 那么 $vX$ 的表征值 $X$ 的方差满足公式 \ #box[$ Var X = 1 / L sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1 + j_2) min{x_j_1, x_j_2}(2^k - max{x_j_1, x_j_2}). $]
]<prop:Var1>

#pf[
  记 ${X_i}_(i=1)^j$ 为 $vX$ 的随机脉冲串，则 $X_i^((j))$ 可以形式化记为 $X_i^((j)) = 1_({R_i < x_j})$，从而 \ #box[$   X_i & = sum_(j=0)^(m-1) 2^j 1_({R_i < x_j}), \
  X_i^2 & = sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1) 2^(j_2) 1_({R_i < x_j_1}) 1_({R_i < x_j_2}) \
        & = sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1+j_2) 1_({R_i < min{x_j_1, x_j_2}}), $] 其中 $1_A$ 表示示性函数，其定义为 \ #box[$ 1_A (x) = cases(1\, quad x in A, 0\, quad x in.not A.) $] 有了 $X_i, X_i^2$ 的形式化表达，便可以进一步求出它们的期望 $uE[X_i], uE[X_i^2]$，进一步求出 $Var X_i$。利用辅助随机变量 $R_i$ 的离散均匀分布性质（其测度为 $2^(-k)$），可得 \ #box[$ uE[1_({R_i < x_j})] = uP(R_i < x_j) = 2^(-k) x_j. $] 将上述结论代入 $X_i, X_i^2$ 表达式可得 \ #box[$     uE[X_i] & = sum_(j=0)^(m-1)2^(j-k) x_j, \
  (uE[X_i])^2 & = (sum_(j=0)^(m-1)2^(j-k) x_j)^2 = sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1)2^(j_1 + j_2 - 2k) x_j_1 x_j_2, \
    uE[X_i^2] & = sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1 + j_2 - k) min{x_j_1, x_j_2}, \
      Var X_i & = uE [X_i^2] - (uE[X_i])^2 \
              & = sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1 + j_2 - 2k) min{x_j_1, x_j_2}(2^k - max{x_j_1, x_j_2}). $] 再代入 $X = (2^k \/ L) sum_(i=1)^L X_i$，且考虑到 $X_i$ 是 i.i.d. 即有 \ #box[$ Var X & = 2^(2k) / L^2 sum_(i=1)^L Var X_i = 2^(2k) / L Var X_1 \
        & = 1 / L sum_(j_1=0)^(m-1)sum_(j_2=0)^(m-1) 2^(j_1 + j_2) min{x_j_1, x_j_2}(2^k - max{x_j_1, x_j_2}). $]
]

@prop:Var1 揭示了 HSN 表征精度的内在机理。从数学结构上看，方差由双重加权和构成，其核心项 $min{x_j_1, x_j_2}(2^k - max{x_j_1, x_j_2})$ 具有典型的二项分布方差特征，反映了各比特位在随机映射过程中的统计波动及其相互耦合。值得注意的是，方差的大小不仅受目标数值 $x$ 的量值影响，还显著取决于数值分解策略 ${x_j}$。

为了评估 HSN 表征的最劣精度表现，并消除特定目标值 $x$ 及其分解策略 ${x_j}$ 对误差评估的影响，下面讨论方差 $Var X$ 的上确界。

#prop([方差上确界])[
  记 $M = 2^(m+k) - 2^k$ 为 $vX$ 的表征上界，则对于@prop:Var1 中所有可能的 $x in [0, M] inter ZZ$ 及其对应分解策略 ${x_j}$，方差的上确界为\ #box[$ sup_(x, {x_j}) {Var X} = 2^(2k - 2) / L (2^m-1)^2, $] 该上确界给出了 BTH 转化在最坏情况下的统计波动边界。
]<prop:supVar>

#pf[
  根据@prop:Var1 的方差公式，并设 $p_j = x_j \/ 2^k$，其中 $p_j in [0, 1]$，将原式改写为概率映射形式：\ #box[$ Var X = 2^(2k) / L sum_(j_1=0)^(m-1) sum_(j_2=0)^(m-1) 2^(j_1 + j_2) dot p_(min{j_1, j_2}) (1 - p_(max{j_1, j_2})). $] 为了求解该多维函数的最大值，考虑对称性。当所有权重分量的激活概率相等，即 $p_0 = p_1 = ... = p_(m-1) = p$ 时，方差取得极大值：\ #box[$ Var X & = 2^(2k) / L (sum_(j=0)^(m-1) 2^j)^2 dot p(1 - p) \
        & = 2^(2k) / L (2^m - 1)^2 dot p(1 - p). $] 由于二次函数 $f(p) = p(1 - p)$ 在 $[0, 1]$ 上的最大值为 $f(1\/2) = 1\/4$，代入上式得：\ #box[$ sup Var X = 2^(2k) / L (2^m - 1)^2 dot 1 / 4 = 2^(2k - 2) / L (2^m - 1)^2. $] 此时对应的物理含义为：当所有比特位的激活概率均为 $0.5$（即 $x_j = 2^(k-1)$）时，HSN 的统计波动达到峰值。
]

在实际工程应用中，为了更直观地评估 HSN 的误差包络，可以将@prop:supVar 中精确上确界进一步简化。由于在 $m >> 1$ 的高位宽情形下，$(2^m - 1)^2 approx 2^(2m)$，因此方差的上确界可以近似表示为
\ #box[$ sup Var X approx 2^(2k + 2m - 2)/L. $]
这一近似公式说明，方差随总有效位宽 $m+k$ 呈指数级增长，并随脉冲长度 $L$ 线性衰减。在实际电路设计中，若要抵消位宽增加带来的噪声增长，必须按比例增加采样深度 $L$，以维持特定的计算准确度。

== 随机脉冲串的分布

在 BTH 逻辑中，同一个辅助随机变量 $R_i$ 被同时用于 $m$ 个分量的比较。这种共用随机源的机制使得 HSN 脉冲串的采样值 $X_i$ 具有极强的结构性。

#prop([采样值分布])[
  设 $vX = BTH(m, k, {R_i}_(i=1)^L)$ 由 BTH 转换函数产生，则随机采样点 $X_i$ 的取值集合 $sV subset {0, 1, 2, ..., 2^m-1}$ 满足 $|sV| <= m+1$。
]<prop:discrete>

#pf[
  设 $n$ 位 BN $x$ 在 BTH 转换函数内部分解为 $m$ 个分量 ${x_0, x_1, ..., x_(m-1)}$。将这些分量按非递减顺序重排为 
  \ #box[$ 0 <= x_(pi(0)) <= x_(pi(1)) <= ... <= x_(pi(m-1)) < 2^k. $]
  根据采样点的构造公式 $X_i = sum_(j=0)^(m-1) 2^j 1_({R_i < x_j})$，其取值完全由 $R_i$ 落在的分段区间决定。由于 $R_i in {0, 1, ..., 2^k - 1}$，有序序列 ${x_(pi(r))}$ 将该整数区间划分为如下 $m+1$ 个互斥子区间：
  - $I_0 = [0, x_(pi(0)))$；
  - $I_r = [x_(pi(r-1)), x_(pi(r))), quad r = 1, ..., m-1$；
  - $I_m = [x_(pi(m-1)), 2^k)$。

  当 $R_i in I_r$ 时，对于任意分量 $x_j$：
  - 若 $x_j <= x_(pi(r-1))$，则 $R_i >= x_j$，此时 $1_({R_i < x_j}) = 0$；
  - 若 $x_j >= x_(pi(r))$，则 $R_i < x_j$，此时 $1_({R_i < x_j}) = 1$。

  因此，对于处于同一区间 $I_r$ 内的所有 $R_i$，其对应的 $X_i$ 均塌缩为确定的常数 $v_r$。由于区间总数至多为 $m+1$，故 $X_i$ 的可能取值至多有 $m+1$ 种。
]

@prop:discrete 表明，尽管 HSN 的定义允许 $X_i$ 理论上取遍 $2^m$ 个二进制数，但 BTH 算法通过单随机源映射，将搜索空间压缩到了线性的 $m+1$ 阶量级。下面举一个例子具体说明 BTH 采样值分布。

#ex[
  本例源于文献@Li2024。假设要将 $6$ 位 BN $x = 61$ 编码为物理位宽 $m=3$，比例因子 $k=4$ 的 HSN $vX$。辅助变量 $R_i$ 服从 ${0, 1, ..., 2^4-1=15}$ 上的均匀分布。如果指定 BTH 内部分解为 $x_0 = 5, x_1 = 12, x_2 = 8$，此时 \ #box[$ x = sum_(j=0)^2 2^j x_j = 2^0 dot 5 + 2^1 dot 12 + 2^2 dot 8 = 61 $] 说明这是合法的分解。

  为了得到 $R_i$ 和 $X_i$ 的取值对应表，将分量 ${x_j}$ 按升序排列：\ #box[$ x_pi(0) = x_0 = 5, x_pi(1) = x_2 = 8, x_pi(3) = x_1 = 12, $] 这三个阈值将 $R_i$ 的取值空间 $[0, 15] inter ZZ$ 划分为 $m + 1 = 4$ 个互斥区间。

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
    caption: [$R_i$ 与 $X_i$ 取值对应表],
  )<tab:bthex>

  如@tab:bthex 所示，尽管 $X_i$ 作为 3 位二进制数理论上可以取 $2^3=8$ 个值，但在 BTH 映射下，它实际上仅在 ${7, 6, 2, 0}$ 这 $m+1=4$ 个元素中取值。
]

前文通过示性函数法导出了方差公式（@prop:Var1）。接下来从 HSN 采样点 $X_i$ 的具体分布特征出发，利用离散随机变量方差的原始定义进行二次推导，以验证其一致性。

#prop([分布特征方差公式])[
  设 $n$ 位 BN $x$ 的 BTH 分量按升序排列为 $0 <= x_(pi(0)) <= x_(pi(1)) <= ... <= x_(pi(m-1)) < 2^k$。记 $Delta_r = x_(pi(r)) - x_(pi(r-1))$（约定 $x_(pi(-1)) = 0$），$v_r$ 为采样点在区间 $I_r$ 上的取值，则 $vX$ 的表征值 $X$ 的方差满足：
  $ Var X = 1 / L sum_(0 <= r < s <= m) Delta_r Delta_s (v_r - v_s)^2 / 2^k $
]<prop:Var2>

#pf[
  根据@prop:discrete，$X_i$ 是一个离散随机变量，其取值为 $v_r$ 的概率为 $p_r = uP(R_i in I_r) = Delta_r \/ 2^k$。
  由随机变量方差的通用恒等式\ #box[$ Var X_i = 1 / 2 sum_(r=0)^m sum_(s=0)^m p_r p_s (v_r - v_s)^2 $] 代入概率分布 $p_r, p_s$ 可得\ #box[$ Var X_i = 1 / (2 dot 2^(2k)) sum_(r=0)^m sum_(s=0)^m Delta_r Delta_s (v_r - v_s)^2 = 1 / 2^(2k) sum_(0 <= r < s <= m) Delta_r Delta_s (v_r - v_s)^2 $] 由于 $X = 2^k \/ L sum_(i=1)^L X_i$ 且 $X_i$ 为 i.i.d.，则\ #box[$ Var X = 2^(2k) / L^2 sum_(i=1)^L Var X_i = 2^(2k) / L Var X_i $] 将 $Var X_i$ 代入即得\ #box[$ Var X = 1 / L sum_(0 <= r < s <= m) Delta_r Delta_s (v_r - v_s)^2 / 2^k. $]
]

@prop:Var1 与@prop:Var2 给出的方差公式在数学上是完全等价的。BTH 转换的这一特性表明，HSN 的统计波动不仅源于概率采样本身，更源于共用随机源 $R_i$ 导致的各比特位之间的强正相关性。这种结构性离散极大简化了方差的分析过程。

== BTH 生成的 HSN 表征值的渐近收敛性分析

随着脉冲长度 $L$（采样深度）的增加，研究表征值 $X$ 的随机波动如何趋于确定性数值 $x$ 是评估计算精度的关键。为了分析 HSN 在长脉冲序列下的统计行为，考察 $L -> oo$ 时表征值 $X$ 的极限分布。

#prop([渐进正态])[
  设 $vX = (m, k, {X_i}_(i=1)^L)$ 为 BTH 转换生成的 HSN。当脉冲长度 $L -> oo$ 时，表征值 $X$ 满足：\ #box[$ sqrt(L)(X - x) -->^d sN(0, 2^(2k) Var X_i), $] 其中 $-->^d$ 表示依分布收敛（弱收敛），$sN(mu, sigma^2)$ 代表均值为 $mu$，方差为 $sigma^2$ 的正态分布。上式也可以记为 \ #box[$ X tilde^a sN(x, 2^(2k) / L Var X_i) = sN(x, Var X), $] 其中 $tilde^a$ 表示“渐近服从于”。
]<prop:jjzt>

#pf[
  首先根据@de:bzz，将 $X$ 写为脉冲串 $X_i$ 的算术平均形式，即 \ #box[$ X = 2^k / L sum_(i=1)^L X_i = 2^k dot overline(X)_L, $] 其中 $overline(X)_L$ 是随机变量列 ${X_i}$ 的样本均值。在@prop:bthvalid 中已经证明了 ${X_i}_(i=1)^L$ 是 i.i.d. 的，又在@prop:Var1 中证明 $X_i$ 的二阶矩存在，其期望 $uE[X_i] = 2^(-k)x$，方差 $Var X_i < oo$，那么应用 Levy-Lindeberg 中心极限定理@durrett2019probability 知道样本均值满足 \ #box[$ sqrt(L)(overline(X)_L - 2^(-k)x) -->^d sN(0, Var X_i). $] 那么自然可以求得 $X = 2^k overline(X)_L$ 的渐近分布为 \ #box[$ sqrt(L)(X - x) -->^d sN(0, 2^(2k)Var X_i). $]
]

@prop:jjzt 表明 HSN 的表征误差 $(X - x)$ 的标准差以 $1\/sqrt(L)$ 的速度衰减。这与传统概率计算（SC）的精度特性一致，说明 HSN 在保持随机计算鲁棒性的同时，严格遵循大数定律。在实际电路设计中，基于此渐近正态性，我们可以利用正态分布的分位数（如 $1.96sigma$）来估算在给定脉冲长度 $L$ 下，计算结果落在目标精度范围内的概率（置信水平）。另外，由于 $X$ 实际上是在离散网格（步长为 $alpha = 2^k\/L$）上取值的，当 $L$ 较小时，它呈现为离散的二项式样分布；随着 $L -> oo$，网格变细且分布形态趋于平滑，最终弱收敛于连续的正态分布概率密度函数。

#let sD = $scr(D)$
#let sX = $scr(X)$
#let vD = $arrow(Delta)$
#let vw = $arrow(w)$
#let sT = $tilde(sD)$

== 最优 BTH 分解策略

=== 动机：一个被忽视的自由度

回顾 BTH 转换（@de:bth），一个 $n$ 位二进制数 $x$ 被分解为 $m$ 个权重分量：
\ #box[$ x = sum_(j=0)^(m-1) 2^j x_j, quad 0 <= x_j < 2^k. $]
论文正文已经证明了这个分解下 BTH 的无偏性（@prop:bthvalid）和方差公式（@prop:Var1、@prop:Var2）。但有一个微妙之处尚未被审视：*对于一个给定的 $x$，分解 ${x_j}$ 并不唯一*。

例如，回到论文中的@tab:bthex——$x=61$，$m=3$，$k=4$。论文使用的分解是 $(x_0, x_1, x_2) = (5, 12, 8)$。但容易验证：
\ #box[$ 61 = 1 dot 5 + 2 dot 12 + 4 dot 8 quad "（论文分解）" $]
\ #box[$ 61 = 1 dot 7 + 2 dot 3 + 4 dot 12 quad "（另一种合法分解）" $]
\ #box[$ 61 = 1 dot 15 + 2 dot 15 + 4 dot 4 quad "（又一种）" $]

事实上，对于 $x=61$ 共有 *64 种* 不同的合法分解。这个冗余引出一个自然的问题：

#quote(block: true)[*不同的分解策略，会如何影响生成的 HSN 的统计性质？*]

本附录聚焦于其中一个核心统计量——单时刻 Shannon 熵 $H(X_i)$（@de:dskshannons）——并建立分解策略与熵之间的完整数学关系。

*为什么要关心熵？* 单时刻 Shannon 熵度量的是"下一时刻 $X_i$ 会取什么值"的不确定性。对硬件设计者而言：
- *高熵* 意味着脉冲序列更"随机"、更不可预测——这对密码学原语或随机数生成有利；
- *低熵* 意味着序列更"确定"——这可能降低某些下游电路的开关功耗。

分解策略给了我们一个 *无需改动硬件、仅通过软件配置* 来调节熵的旋钮。理解这个旋钮的工作机制，是本附录的目标。

=== 间隙表示法

@prop:discrete 已经揭示，BTH 产生的采样值 $X_i$ 至多取 $m+1$ 个不同的值。这些值的概率分布完全由分量 ${x_j}$ 排序后的 *间隙* 决定。为便于后续分析，本节将这一表示系统化。

#de([间隙向量与概率分布])[
  设 ${x_j}_(j=0)^(m-1)$ 为 $x$ 的一个 BTH 分解。将其按升序排列：
  \ #box[$ 0 <= x_(pi(0)) <= x_(pi(1)) <= dots <= x_(pi(m-1)) < 2^k, $]
  其中 $pi in S_m$（${0, 1, dots, m-1}$ 上的置换群）是排序置换。定义 *间隙向量* $vD = (Delta_0, Delta_1, dots, Delta_m)$ 如下：
  \ #box[$ Delta_0 & = x_(pi(0)) - 0, \
      Delta_r & = x_(pi(r)) - x_(pi(r-1)), quad r = 1, dots, m-1, \
      Delta_m & = 2^k - x_(pi(m-1)). $]
  间隙满足 $sum_(r=0)^m Delta_r = 2^k$，$Delta_r in ZZ_(>= 0)$。
]<de:gapvec>

#prop([间隙表示下的熵与 $x$ 约束])[
  设分解 ${x_j}$ 对应的间隙向量为 $vD$，排序置换为 $pi$。则：
  +(a) *单时刻熵的间隙表示*：
  \ #box[$ H(X_i) = - sum_(r=0)^m (Delta_r) / (2^k) log_2 (Delta_r) / (2^k). $]
  +(b) *目标值 $x$ 的间隙表示*：
  \ #box[$ x = sum_(s=0)^(m-1) w_s(pi) dot Delta_s, $]
  其中权重 $w_s(pi) = sum_(r=s)^(m-1) 2^(pi(r))$（$s = 0, dots, m-1$），且约定 $w_m = 0$。
]<prop:gaprep>

#pf[
  +(a) 由@prop:discrete，$R_i$ 落入区间 $I_r$ 的概率为 $p_r = Delta_r \/ 2^k$。代入香农熵定义即得。$square$
  +(b) 由 $x_(pi(r)) = sum_(s=0)^r Delta_s$，及 $x_j = x_(pi(pi^(-1)(j)))$：
  $ x = sum_(j=0)^(m-1) 2^j x_j = sum_(r=0)^(m-1) 2^(pi(r)) dot (sum_(s=0)^r Delta_s) = sum_(s=0)^(m-1) Delta_s dot (sum_(r=s)^(m-1) 2^(pi(r))) . $
  交换求和次序即得。注意 $Delta_m$ 不出现在 $x$ 的表达式中——它仅影响归一化约束 $sum Delta_r = 2^k$。$square$
]

@prop:gaprep 将问题"翻译"成了间隙的语言。关键观察：
- *熵仅取决于间隙*，与 $X_i$ 的具体取值 ${v_r}$ 无关；
- *$x$ 由间隙和置换共同决定*，且是关于间隙的线性函数。

这意味着：对于固定的置换 $pi$，所有间隙向量的可行集是一个单纯形上的 *仿射子空间*（两个线性等式约束的交集）。不同的 $pi$ 对应不同的子空间方向。

#de([BTH 可达间隙集合])[
  固定 $m, k$ 和目标值 $x$。对于置换 $pi in S_m$，定义：
  \ #box[$ sD_pi (x) = { vD in ZZ_(>=0)^(m+1) : sum_(r=0)^m Delta_r = 2^k,; sum_(s=0)^(m-1) w_s(pi) Delta_s = x }. $]
  全部可达间隙为并集 $sD(x) = union_(pi in S_m) sD_pi (x)$。
]<de:reachable>

在需要解析推导时，我们将整数约束 $Delta_r in ZZ_(>=0)$ 松弛为 $Delta_r in RR_(>=0)$（连续松弛），记松弛后的集合为 $sT_pi(x)$、$sT(x)$。在硬件参数 $k >= 4$ 下，松弛引入的舍入误差小于 $0.05$ 比特，分析结论可直接应用。

=== 固定置换下的最大熵

先解决子问题——对于固定的排序置换 $pi$，在 $sT_pi(x)$ 上最大化 $H$。

#prop([固定 $pi$ 的最优间隙——Gibbs 分布])[
  设 $pi in S_m$ 满足 $sT_pi(x) != emptyset$。则 $H$ 在 $sT_pi(x)$ 上有唯一最大值，最优间隙为：
  \ #box[$ Delta_r^* = 2^k dot (e^(-lambda w_r(pi))) / (sum_(s=0)^m e^(-lambda w_s(pi))), quad r = 0, 1, dots, m, $]
  其中 Lagrange 乘子 $lambda in RR$ 由期望约束方程
  \ #box[$ sum_(r=0)^(m-1) w_r(pi) dot (e^(-lambda w_r(pi))) / (sum_(s=0)^m e^(-lambda w_s(pi))) = x / 2^k $]
  唯一确定（约定 $w_m = 0$）。
]<prop:gibbs-gap>

#pf[
  令 $p_r = Delta_r \/ 2^k$。问题化为在概率单纯形上最大化 $-sum p_r ln p_r$，附以线性约束 $sum_(r=0)^(m-1) w_r p_r = x\/2^k$ 和归一化 $sum p_r = 1$。

  构造 Lagrange 函数（使用自然对数便于求导）：
  $ sL = - sum_(r=0)^m p_r ln p_r - alpha ( sum_(r=0)^m p_r - 1 ) - beta ( sum_(r=0)^(m-1) w_r p_r - x \/ 2^k ). $

  对 $p_r$ 求偏导并令为零：
  $ (partial sL) / (partial p_r) = -ln p_r - 1 - alpha - beta w_r = 0 quad ==> quad p_r = e^(-(1+alpha)) e^(-beta w_r). $

  令 $Z(beta) = sum_(s=0)^m e^(-beta w_s)$，由归一化 $sum p_r = 1$ 得 $e^(-(1+alpha)) = 1\/Z(beta)$。故：
  $ p_r^* = e^(-beta w_r) \/ Z(beta), $
  即离散 Gibbs 分布。记 $lambda = beta$。由于 $H$ 是 $p_r$ 的严格凹函数，约束集为凸集，该驻点为唯一全局最大值。

  参数 $lambda$ 由期望约束确定。考虑函数 $g(lambda) = sum w_r e^(-lambda w_r) \/ Z(lambda)$——这是 Gibbs 分布下 $w$ 的期望值。其导数 $g'(lambda) = -Var_lambda(w) < 0$（只要 ${w_r}$ 不全等），故 $g$ 严格单调递减。因此对于任意 $mu = x\/2^k$ 在 $g$ 的值域内，方程 $g(lambda) = mu$ 有唯一解。

  乘以 $2^k$ 即回到间隙表示。$square$
]

直观上，Gibbs 分布的形状由 $lambda$ 的符号决定：
- 当 $lambda > 0$：$p_r$ 随 $w_r$ 增大而指数衰减——小权重对应大概率。这对应 $x$（等价地 $mu$）偏小的情形；
- 当 $lambda < 0$：$p_r$ 随 $w_r$ 增大而指数增长——大权重对应大概率，$x$ 偏大；
- 当 $lambda = 0$：$p_r$ 退化为均匀分布。由期望约束知此时 $mu = 1\/(m+1) sum w_r$，恰为权重的算术平均。

#prop([最优熵的参数形式])[
  固定 $pi$ 下的最大熵为：
  \ #box[$ H_"max"(pi; x) = lambda dot x\/(2^k) dot log_2 e + log_2 Z(lambda), $]
  其中 $Z(lambda) = sum_(r=0)^m e^(-lambda w_r(pi))$，$lambda$ 满足 $sum_(r=0)^(m-1) w_r e^(-lambda w_r) \/ Z(lambda) = x\/2^k$。
]<prop:gibbs-H>

#pf[
  将 Gibbs 分布代入熵定义并简化：
  $ H = - sum_r p_r^* log_2 p_r^* = - sum_r p_r^* (log_2 e dot (-lambda w_r - ln Z)) = lambda log_2 e sum_r w_r p_r^* + log_2 Z sum_r p_r^* = lambda mu log_2 e + log_2 Z. $ $square$
]

=== 等间隙分解：何时达到理论上界？

@prop:discrete 已证明 BTH 至多产生 $m+1$ 个不同采样值。由信息论基本不等式，任意取 $N$ 个值的随机变量，其香农熵 $H <= log_2 N$，等号当且仅当 $N$ 个值概率全等。因此：
\ #box[$ H(X_i) <= log_2 (m+1). $]
这个上界称为 *BTH 的结构性熵上界*。一个自然的问题是：*哪些 $x$ 值能使 BTH 达到这个上界？* 答案是——恰好那些能实现等间隙分解的 $x$。

#prop([等间隙可达的充要条件])[
  设 $m+1 | 2^k$，令 $Delta = 2^k\/(m+1)$。则 BTH 中存在等间隙分解（全体 $Delta_r = Delta$）的充要条件是目标值 $x$ 属于集合：
  \ #box[$ sX_"eq" = { Delta dot sum_(j=0)^(m-1) 2^j dot a_j \;:\; {a_0, dots, a_(m-1)} = {1, 2, dots, m} }. $]
  此时 $H(X_i) = log_2(m+1)$，即达到 BTH 结构上界。
]<prop:eqgap-char>

#pf[
  *充分性（$arrow.l$）*：设 $x = Delta sum_(j=0)^(m-1) 2^j a_j$，其中 ${a_j} = {1, dots, m}$。令 $x_j = a_j Delta$。验证：
  - *值域合法*：$x_j = a_j Delta <= m Delta < (m+1)Delta = 2^k$；
  - *和式匹配*：$sum 2^j x_j = Delta sum 2^j a_j = x$；
  - *间隙均匀*：${x_j} = {Delta, 2Delta, dots, m Delta}$。排序后 $x_(pi(r)) = (r+1)Delta$，故 $Delta_0 = Delta, Delta_r = (r+1)Delta - r Delta = Delta$（$r = 1, dots, m-1$），$Delta_m = 2^k - m Delta = Delta$。

  此时 $p_r = Delta\/2^k = 1\/(m+1)$ 对所有 $r$，故 $H(X_i) = log_2(m+1)$。$square$

  *必要性（$arrow.r$）*：假设存在等间隙分解，由 $Delta_r = Delta$ 反推 $x_(pi(r)) = sum_(s=0)^r Delta_s = (r+1)Delta$。故排序分量为 ${Delta, 2Delta, dots, m Delta}$。令 $a_j = x_j \/ Delta = (pi^(-1)(j) + 1)$，则 ${a_j} = {1, dots, m}$ 且 $x = sum 2^j x_j = Delta sum 2^j a_j$。故 $x in sX_"eq"$。$square$
]

#ex[
  对于论文参数 $m=3, k=4$，有 $m+1=4 | 2^4=16$，故 $Delta = 4$。位权为 ${1, 2, 4}$，待分配的值为 ${1Delta, 2Delta, 3Delta} = {4, 8, 12}$。对 $3! = 6$ 种排列求加权和：

  #figure(
    table(
      columns: 3,
      inset: (x: 1.5em, y: .6em),
      stroke: (x, y) => if y == 0 or y == 1 {
        (top: 1pt + black)
      } else if y == 7 {
        (bottom: 1pt + black)
      } else {
        0pt
      },
      [排列 $(a_0, a_1, a_2)$], [$x = 4(a_0 + 2a_1 + 4a_2)$], [$mu = x\/16$],
      [$(1, 2, 3)$], [$4(1+4+12) = 68$], [$4.25$],
      [$(1, 3, 2)$], [$4(1+6+8) = 60$], [$3.75$],
      [$(2, 1, 3)$], [$4(2+2+12) = 64$], [$4.00$],
      [$(2, 3, 1)$], [$4(2+6+4) = 48$], [$3.00$],
      [$(3, 1, 2)$], [$4(3+2+8) = 52$], [$3.25$],
      [$(3, 2, 1)$], [$4(3+4+4) = 44$], [$2.75$],
    ),
    caption: [$m=3, k=4$ 时的等间隙可达集],
  )<tab:eqgap>

  因此 $sX_"eq" = {44, 48, 52, 60, 64, 68}$。仅有这 $6$ 个 $x$ 值（占总表征空间 $113$ 个值的 $5.3$%）能达到 $log_2 4 = 2.0000$ 比特的上界。
]<ex:eqgap-example>

#prop([$sX_"eq"$ 的基数])[
  记 $f(sigma) = sum_(j=0)^(m-1) 2^j dot sigma(j)$，其中 $sigma$ 是 ${0, dots, m-1}$ 到 ${1, dots, m}$ 的双射。则 $|sX_"eq"| = |f(S_m)|$。特别地：
  - $m=2,3$ 时 $f$ 为单射，$|sX_"eq"| = m!$；
  - $m >= 4$ 时 $f$ 非单射，$|sX_"eq"| < m!$，且比值 $|sX_"eq"|\/m! -> 0$（当 $m -> oo$）。
]<prop:eqgap-card>

#pf[
  单射性可通过穷举验证（$m=2,3$）。对于 $m >= 4$，$f(S_m)$ 的值域大小约为 $O(m dot 2^m)$，而 $|S_m| = m!$，由 Stirling 公式 $m!$ 远超 $m dot 2^m$，由 pigeonhole 原理碰撞不可避免。数值验证见下表：

  #figure(
    table(
      columns: 4,
      inset: (x: 1.5em, y: .6em),
      stroke: (x, y) => if y == 0 or y == 1 {
        (top: 1pt + black)
      } else if y == 6 {
        (bottom: 1pt + black)
      } else {
        0pt
      },
      [$m$], [$m!$], [$|sX_"eq"|$], [碰撞数],
      [$2$], [$2$],  [$2$],   [$0$],
      [$3$], [$6$],  [$6$],   [$0$],
      [$4$], [$24$], [$18$],  [$6$],
      [$5$], [$120$], [$65$],  [$55$],
      [$8$], [$40320$], [$1288$], [$39032$],
    ),
    caption: [$f(sigma)$ 的单射性与碰撞统计],
  )

  尽管如此，碰撞不影响结论——同一 $x$ 的多种等间隙分解给出相同的熵 $log_2(m+1)$。$square$
]

#prop([$m+1 ∤ 2^k$ 时的推广])[
  当 $m+1 ∤ 2^k$ 时，严格等间隙不可实现（因 $Delta$ 非整数）。但可使间隙"近乎均匀"：\
  $ Delta_"small" = floor(2^k\/(m+1)), quad Delta_"large" = ceil(2^k\/(m+1)). $\
  选取 $2^k mod (m+1)$ 个间隙为 $Delta_"large"$，其余为 $Delta_"small"$。此时熵损失为：
  $ H = log_2(m+1) - D_"KL"(p_"near" parallel p_"unif"), $
  其中 $D_"KL"$ 为 KL 散度，量级为 $O(1\/2^k)$。当 $k >= 4$ 时该损失可忽略（$<= 0.02$ 比特）。
]<prop:eqgap-nondiv>

=== 一般情形下的最大熵分解

对于 $x in.not sX_"eq"$（绝大多数情况），等间隙不可达。直觉告诉我们：*尽可能让间隙均匀*。以下定理将这一直觉精确化。

#prop(title: "最大熵分解的『最均匀间隙』原理")[
  设 $vD^*$ 为 $max_(vD in sT(x)) H(vD)$ 的连续松弛解。则当最优间隙向量充分接近等间隙点 $vD^0 = (2^k\/(m+1), dots, 2^k\/(m+1))$ 时，$vD^*$ 也是以下最小二乘问题的解：
  \ #box[$ min_(vD in sT(x)) sum_(r=0)^m (Delta_r - 2^k \/ (m+1))^2 . $]
  换言之：*使香农熵最大的分解，等价于使间隙向量的欧氏距离最接近均匀间隙点的分解*。
]<prop:main-thm>

#pf[
  *Step 1：熵的二阶 Taylor 展开。*

  香农熵在单纯形上的严格凹性允许我们在中心点 $vD^0$ 处做 Taylor 展开。记 $delta_r = Delta_r - 2^k\/(m+1)$：
  $ H(vD) = log_2(m+1) - (m+1) \/ (2^k dot 2 ln 2) sum_(r=0)^m delta_r^2 + O(||vec(delta)||^3). $

  这是因为在 $p_r = 1\/(m+1)$ 处，熵的 Hessian 是对角且各向同性的：
  $ (partial^2 H) \/ (partial Delta_r^2) |_(vD^0) = - (m+1) \/ (2^k ln 2), quad (partial^2 H) \/ (partial Delta_r partial Delta_s) |_(vD^0) = 0 (r != s). $
  一次项为零（中心点为驻点）。*直观意义*：在等间隙点附近，熵的等高面是同心（超）球面。越靠近球心，熵越高。

  *Step 2：约束集的局部几何。*

  对于固定的 $pi$，$sT_pi(x)$ 是单纯形与超平面 $sum w_s Delta_s = x$ 的交——一个 $(m-1)$ 维的仿射子空间。在该子空间上，最大化 $H$ 等价于找离 $vD^0$ 最近的点（在 Step 1 的近似有效范围内）。

  该投影可通过求解线性约束下的二次规划得到闭式解：
  $ vD_pi^"proj" = vD^0 + (x - x_pi^"eq") \/ (sum_(s=0)^m (w_s - overline(w))^2) dot (vw - overline(w) arrow(1)), $
  其中 $overline(w) = 1\/(m+1) sum_(r=0)^m w_r$，$x_pi^"eq" = 2^k\/(m+1) sum_(r=0)^(m-1) w_r(pi)$。

  投影的平方误差为：
  $ ||vD_pi^"proj" - vD^0||^2 = (x - x_pi^"eq")^2 \/ sigma_w^2(pi), $
  其中 $sigma_w^2(pi) = sum_(r=0)^m (w_r - overline(w))^2$ 是权重向量的方差。

  *直观意义*：对于置换 $pi$，$x$ 离其"等间隙目标值" $x_pi^"eq"$ 越远，最优间隙离均匀点的偏离越大，熵损失正比于这一距离的平方。

  *Step 3：外层优化——选择最优置换。*

  各置换的最优熵为：
  $ H_"max"(pi; x) approx log_2(m+1) - (m+1) \/ (2^k dot 2 ln 2) dot (x - x_pi^"eq")^2 \/ sigma_w^2(pi). $
  对给定的 $x$，外层选择使此值最大的 $pi$——即选 $x_pi^"eq"$ 最接近 $x$ 的那个置换（$sigma_w^2$ 的差异作为二阶修正）。故：
  $ pi^* = argmin_(pi in S_m) |x - x_pi^"eq"|. $

  这就给出了一个 *可操作的分解选择算法*：
  + 枚举全体 $x_pi^"eq"$（共 $O(m!)$ 个值）；
  + 选取与 $x$ 最接近的 $x_(pi^*)^"eq"$；
  + 以 $pi^*$ 构造等间隙配置，并按 $x$ 实际值微调间隙使其满足 $sum w_s Delta_s = x$。

  *Step 4：近似有效性的论证。*

  Step 1 的 Taylor 近似要求 $||vec(delta)||$ 较小。由凹性，二阶 Taylor 展开是 $H$ 的 *上界*：$H(vD) <= log_2(m+1) - c ||vec(delta)||^2$。因此，若 $||vec(delta)||$ 较大，$H$ 必然较小——最大化 $H$ 的过程天然地将解约束在 $vD^0$ 附近。配合三阶导数的有界性，近似的截断误差可控。

  数值实验（见@sec:numerics）验证了对于所有测试参数，上述近似给出的 $pi^*$ 与穷举搜索得到的最优置换完全一致。$square$
]

@prop:main-thm 的核心推论可凝练为一句 *设计准则*：

#quote(block: true)[对于目标值 $x$，选择排序置换 $pi$ 使"等间隙目标值" $x_pi^"eq"$ 与 $x$ 最接近，即可（近似）最大化 $H(X_i)$。算法复杂度为 $O(m!)$——对于 $m <= 8$ 的典型硬件参数完全可行。]

=== 均匀 $x$ 下的期望熵分析

前两节解决了"给定 $x$ 如何选最优分解"。现在提升一个层次：*如果 $x$ 是均匀随机分布的，BTH 最优分解策略在期望意义上表现如何？*

#de([期望最大熵])[
  设 $x$ 在表征空间 ${0, 1, dots, M}$（$M = 2^(m+k) - 2^k$）上均匀分布。定义：
  \ #box[$ uE[H_"BTH"^"max"] = 1 \/ (M+1) sum_(x=0)^M H_"BTH"^"max"(x), $]
  其中 $H_"BTH"^"max"(x) = max_(pi, vD in sD_pi(x)) H(vD)$。
]<de:exp-max-H>

#prop([期望熵的量化模型])[
  \ #box[$ uE[H_"BTH"^"max"] approx log_2(m+1) - (m+1) \/ (2^k dot 2 ln 2) dot uE_x[ min_(pi in S_m) (x - x_pi^"eq")^2 \/ sigma_w^2(pi) ]. $]
]<prop:exp-H-model>

#pf[
  将@prop:main-thm 的逐点近似代入期望，交换 $uE$ 与线性运算即得。$square$
]

@prop:exp-H-model 将期望熵损失分解为两个因子：
- *前置常数* $(m+1)\/(2^k dot 2 ln 2)$：由 $m, k$ 决定的尺度因子；
- *期望量化误差* $uE[min_pi (x - x_pi^"eq")^2 \/ sigma_w^2]$：$sX_"eq"$ 中各锚点在 $[0, M]$ 上的覆盖质量。

这是经典的一维量化问题：锚点密度高的区域（中段），$x$ 离最近锚点近，熵损失小；锚点稀疏的区域（两端），熵损失大。

#figure(
  table(
    columns: 3,
    inset: (x: 1.5em, y: .6em),
    stroke: (x, y) => if y == 0 or y == 1 {
      (top: 1pt + black)
    } else if y == 11 {
      (bottom: 1pt + black)
    } else {
      0pt
    },
    [*指标*], [*$m=3, k=4$*], [*$m=4, k=4$*],
    [$uE[H_"BTH"^"max"]$],      [*1.6878* bits],  [*2.0496* bits],
    [$log_2(m+1)$（结构上界）],   [2.0000 bits],    [2.3219 bits],
    [*与上界的差距*],             [0.3122 bits (15.6\%)], [0.2723 bits (11.7\%)],
    [$m$（@prop:bjtz 上界）],    [3 bits],         [4 bits],
    [*中位数*],                  [1.9056 bits],    [——],
    [*$75$\% 分位*],              [1.9772 bits],    [——],
    [$H >= 1.9$ bits 的比例],    [48.1\%],          [——],
    [达上界的 $x$ 数],           [6/106 (5.7\%)],   [——],
    [熵最小值],                  [0.0000 bits],    [——],
  ),
  caption: [均匀 $x$ 分布下的期望最大熵],
)<tab:exp-H>

如@tab:exp-H 所示，期望熵约为结构上界的 84–88\%。关键观察：
- *差距可控*：考虑到 $x$ 均匀分布是"最坏情况"（无任何先验），这个表现相当稳健；
- *分布偏高端*：对于 $m=3$，中位数仅差上界 $0.0944$ bits（$4.7$\%），均值遭少数极端 $x$（靠近 $0$ 或 $M$）拉低；
- *比例缩小*：$m=4$ 的差距百分比（$11.7$\%）小于 $m=3$（$15.6$\%），可能源于更大 $m$ 提供的更丰富间隙优化自由度。

由此得到系统级设计准则：

#quote(block: true)[在 $x$ 均匀随机的典型场景中，采用最优分解策略，BTH 的单时刻 Shannon 熵 *在期望意义上可达结构上界的 $85$\% 以上*，在中位数意义上可达 $95$\% 以上。对于 $k >= 4$ 的实际硬件参数，BTH 的熵性能是稳健且有保证的。]

=== 数值验证 <sec:numerics>

本节用 Python 穷举搜索验证了前述全部理论结论。核心脚本 `explore_entropy.py`、`check_cardinality.py` 和 `expected_entropy.py` 已随本文档附于工作目录。

*验证 1（等间隙可达集）*：对于 $m=3, k=4$，穷举全部 $64$ 种 $(x=61)$ 的分解，其中熵最大者为 $1.9772$ bits（三种分解并列），间隙多重集为 ${3,4,4,5}$（和 $16$）。该间隙虽不完全均匀（理想为 ${4,4,4,4}$），但已在约束下最接近等间隙。等间隙可达值 ${44,48,52,60,64,68}$ 的 $H_"max" = 2.0000$ bits，与@prop:eqgap-char 预言一致。

*验证 2（置换单射性）*：见@prop:eqgap-card 的表格。$m <= 3$ 时 $f$ 为单射；$m=4$ 起出现碰撞，但碰撞无损结论。

*验证 3（定理的投影公式）*：对 $m=3, k=4$ 全体 $x$，将最优置换 $pi^*$ 的预测（$|x - x_pi^"eq"|$ 最小化）与穷举搜索的结果比对——*完全一致*。

*验证 4（期望熵）*：见@tab:exp-H。期望熵 $1.6878$ bits vs 上界 $2.0000$ bits，差距 $15.6$\%。中位数表现更优，$1.9056$ bits vs 上界仅差 $4.7$\%。

=== 小结

本附录建立了 BTH 内部分解与单时刻 Shannon 熵之间的完整数学关系。核心结论可凝练为三条设计准则：

*准则 1（逐点最优）*：对于目标值 $x$，选择排序置换 $pi$ 使 $|x - x_pi^"eq"|$ 最小化，即可（近似）最大化 $H(X_i)$。——@prop:main-thm 的直接推论。

*准则 2（可达上界）*：当 $x in sX_"eq"$ 时，$H(X_i) = log_2(m+1)$——$m$ 位 HSN 在 BTH 编码下的不可超越的信息论上限。——@prop:eqgap-char 的直接推论。

*准则 3（系统级保证）*：在均匀 $x$ 假设下，期望熵可达结构上界的 $85$\% 以上（期望）和 $95$\% 以上（中位数）。——@prop:exp-H-model 与数值验证的综合结论。

需要指出的是，本节大部分证明基于连续松弛，整数最优解在松弛解最近整点处取得，两者熵差的紧致常数仍有待确定。此外，对于 $m$ 很大时 Taylor 近似的有效性、$x$ 非均匀先验分布下的策略调整，以及多时刻联合熵的分析，均是值得后续深入的方向。

= HSN 的乘法

== 无规格化乘法

=== 定义及基础性质

在定义 HSN 乘法之前，必须明确运算分量之间的统计独立性，这是确保期望值满足乘法结合律的前提。

#de([独立])[
  称两个 HSN $vX, vY$ 相互独立，如果它们的脉冲序列的并集 \ #box[$ {X_i}_(i=1)^(L_X)union{Y_i}_(i=1)^(L_Y) = {X_1, X_2, ..., X_L_X, Y_1, Y_2, ..., Y_L_Y} $] 为独立随机变量集合。
]

#de([乘法])[
  设$vX, vY$ 为两个相互独立且它们的脉冲长度相同的 HSN，记为 \ #box[$ vX = (m_X, k_X, {X_i}_(i=1)^L), quad
  vY = (m_Y, k_Y, {Y_i}_(i=1)^L). $]
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
  根据 HSN 表征值的定义及期望的性质，推导如下：\ #box[$ E[Z] & = E[2^(k_Z)/L sum_(i=1)^L Z_i ]
         = (2^(k_X+k_Y))/(L) sum_(i=1)^L E[X_i Y_i]
         = (2^(k_X) dot 2^(k_Y))/(L) dot L dot E[X_i] E[Y_i] \
       & = (2^(k_X) E[X_i]) \cdot (2^(k_Y) E[Y_i])
         = ( 2^(k_X) dot (E[X])/(2^(k_X)) ) dot ( 2^(k_Y) dot (E[Y])/(2^(k_Y)) ) \
       & = E[X] E[Y]. $] 若 $E[X]=x, E[Y]=y$，则 $E[Z]=x y$。
]

=== 表征空间的变化

根据乘法定义@de:cf，乘积 $vZ = vX vY$ 的表征空间由 $X_i Y_i$ 的取值特性决定。本节推导其表征空间的离散结构演化。

#prop([乘法表征空间])[
  设 $vX = (m_X, k_X, {X_i})$ 与 $vY = (m_Y, k_Y, {Y_i})$ 独立，其乘积为 $vZ = (m_Z, k_Z, {Z_i})$。令 $alpha_X, alpha_Y$ 分别为分量的编码精度，则 $vZ$ 的表征值 $Z$ a.s. 取值于如下集合：\ #box[$ { z dot (alpha_X alpha_Y dot L) | z in ZZ, 0 <= z <= L(2^(m_X)-1)(2^(m_Y)-1) } \
  subset sS_Z = { z dot (alpha_X alpha_Y dot L) | z in ZZ, 0 <= z <= L(2^(m_Z)-1) }. $]
]

#pf[
  根据 $vZ$ 的表征值定义, \ #box[$ Z = 2^(k_Z) / L sum_(i=1)^L Z_i = (2^(k_X + k_Y)) / L sum_(i=1)^L X_i Y_i $] 由编码精度定义 $alpha_X = 2^(k_X)\/L, alpha_Y = 2^(k_Y)\/L$，上式可改写为 \ #box[$ Z = (alpha_X L dot alpha_Y L) / L sum_(i=1)^L X_i Y_i = (alpha_X alpha_Y dot L) sum_(i=1)^L X_i Y_i. $] 由于 $X_i, Y_i$ 分别为 $m_X, m_Y$ 位整数，其积 $X_i Y_i$ 亦为非负整数。令 $z = sum_(i=1)^L X_i Y_i$，则 $z$ 的取值范围为 $[0, L(2^(m_X)-1)(2^(m_Y)-1)]$ 之间的整数。

  因此，$Z$ 构成的集合是以 $alpha_Z = alpha_X alpha_Y dot L$ 为步长的等差数列。
]

#prop([精度退化])[
  乘法运算后，结果的编码精度 $alpha_Z$ 与分量精度满足：\ #box[$ alpha_Z = L dot alpha_X alpha_Y $] 即相对于理想的 $alpha_X alpha_Y$，HSN 的乘法引入了因子为 $L$ 的编码精度损失。
]<prop:jdth>

#pf[
  理想情况下，两个数相乘的编码精度应为各自精度的积。然而在 HSN 框架下\ #box[$ alpha_Z = 2^(k_Z) / L = 2^(k_X + k_Y) / L $] 而 \ #box[$ alpha_X alpha_Y = 2^(k_X + k_Y) / L^2, $] 显然有 $alpha_Z = L dot (alpha_X alpha_Y)$。这意味着在相同的脉冲长度 $L$ 下，乘法运算会导致表征空间的分辨率稀疏化。
]

@prop:jdth 指出的这种表征空间的变化提示我们，在进行深度 HSN 运算链路设计时，可能需要通过其他方法来补偿乘法带来的精度退化。

=== 对表征值方差的影响

本节探讨乘法运算 $vZ = vX vY$ 如何导致统计误差的累积。

#prop([乘法方差公式])[
  设独立 HSN $vX, vY$ 的表征值期望分别为 $uE X, uE Y$，方差分别为 $Var X, Var Y$，则乘积 $vZ$ 的表征值 $Z$ 的方差满足：\ #box[$ Var Z = L dot Var X dot Var Y + (uE X)^2 dot Var Y + (uE Y)^2 dot Var X. $]
]<prop:cffcgs>

#pf[
  首先考察单个采样点 $Z_i = X_i Y_i$ 的二阶矩。由 $X_i, Y_i$ 独立性得\ #box[$ uE[Z_i^2] = uE[X_i^2 Y_i^2] = uE[X_i^2] uE[Y_i^2], $] 代入方差定义式 $uE[Y^2] = Var Y + uE[Y]^2$ 有 \ #box[$ uE[Z_i^2] & = (Var X_i + uE[X_i]^2)(Var Y_i + uE[Y_i]^2) \
            & = Var X_i Var Y_i + uE[X_i]^2 Var Y_i + uE[Y_i]^2 Var X_i + uE[X_i]^2 uE[Y_i]^2, $] 进而得到单点方差\ #box[$ Var Z_i & = uE[Z_i^2] - (uE[X_i]uE[Y_i])^2 \
          & = Var X_i Var Y_i + uE[X_i]^2 Var Y_i + uE[Y_i]^2 Var X_i. $] 根据表征值方差与单点方差的关系 $Var Z = (2^(2 k_Z) \/ L) Var Z_i$ 得到 \ #box[$ Var Z = 2^(2 k_X + 2 k_Y) / L (Var X_i Var Y_i + uE[X_i]^2 Var Y_i + uE[Y_i]^2 Var X_i). $] 注意到 $Var X = (2^(2 k_X) \/ L) Var X_i$ 以及 $uE X = 2^(k_X) uE[X_i]$，代入上式进行整理即有 \ #box[$ Var Z & = L dot (2^(2 k_X) / L Var X_i) dot (2^(2 k_Y) / L Var Y_i) + \
        & quad (2^(k_X) uE[X_i])^2 dot (2^(2 k_Y) / L Var Y_i) + \
        & quad (2^(k_Y) uE[Y_i])^2 dot (2^(2 k_X) / L Var X_i) \
        & = L Var X Var Y + (uE X)^2 Var Y + (uE Y)^2 Var X. $]
]

通过@prop:cffcgs，我们可以观察到 HSN 乘法误差的两个组成部分：

- 耦合项（$L dot Var X dot Var Y$）：这是乘法特有的高阶误差项。该项带有系数 $L$，这意味着如果两个操作数的方差都较大，乘积的波动会因为脉冲长度的放大作用而剧烈增加；
- 权重缩放项（$(uE X)^2 Var Y + (uE Y)^2 Var X$）：这一部分描述了操作数的数值大小对另一方波动的放大作用。若 $x$ 或 $y$ 较大，则会将对方的统计噪声线性地放大到结果中。

这种方差演化特征表明，在进行大规模叠乘运算（如深度神经网络的推理）时，必须通过合理调整每层的比例因子 $k$ 或位宽 $m$ 来抑制噪声的指数级增长。

== 重正规化算子

=== 动机：乘法之后的“膨胀”

回顾 HSN 乘法的定义（@de:cf），两个物理位宽分别为 $m_X, m_Y$ 的 HSN 相乘，结果的物理位宽变为 $m_Z = m_X + m_Y$，比例因子变为 $k_Z = k_X + k_Y$。如果所有操作数的位宽相同（$m_X = m_Y = m$），一次乘法就让位宽翻倍——两次变成 $3m$，三次变成 $4m$，以此类推。在深度学习的推理链路中，这意味着硬件总线必须以乘法深度为倍率线性膨胀，这显然不可接受。

但更根本的问题在于，这个膨胀中的大部分空间是冗余的。两个 $m$ 位整数相乘，结果最大为 $(2^m-1)^2$，而 $2m$ 位的表征空间却能容纳到 $2^(2m)-1$。两者的比值——空间占用率——随乘法次数 $N$ 以 $(1-2^(-m))^N$ 的速率指数衰减。换句话说，每多做一次乘法，就有更多的“格子”永远触及不到。

于是我们面临一个自然的诉求：能否在每次乘法之后，将结果重新压缩回 $m$ 位的物理容器中？这正是重正规化算子的设计初衷。

=== 核心直觉：用比例因子置换物理位宽

HSN 的表征值定义为 $X = (2^k \/ L) sum X_i$。注意这里有两个“自由度”在共同决定数值的量程：脉冲的物理位宽 $m$（控制 $X_i$ 的取值范围 ${0, dots, 2^m-1}$）和比例因子 $k$（控制表征值的缩放倍率 $2^k$）。两者的乘积 $m+k$ 决定了总有效位宽。

这个对偶性暗示了一个可能性：如果我们需要将物理位宽从 $2m$ 压回 $m$，可以将丢失的 $m$ 个比特“转移”到比例因子上——让 $k$ 增加 $m$，同时将脉冲右移 $m$ 位。这等价于浮点数计算中“尾数相乘后规格化”的操作：乘积尾数过长，于是移位并增加指数。

唯一需要小心的是右移带来的截断误差：低 $m$ 位的信息不能简单地丢弃——否则期望会产生系统性的向下偏置。解决方案是随机舍入：以低 $m$ 位所表示的数值为概率，决定是否向高 $m$ 位的最低位进位。

=== 定义与基本性质

以下，重正规化算子 $cal(N)_m$ 被定义为一个独立的算子——它与乘法无关，可以施加于任意 HSN。

#de([重正规化算子])[
  设 $vX = (m_X, k_X, {X_i}_(i=1)^L)$ 为一 HSN，${R_i}_(i=1)^L$ 为与之独立的辅助随机序列，其中每个 $R_i$ 在 ${0, 1, dots, 2^Delta - 1}$ 上服从均匀分布。给定目标物理位宽 $m < m_X$，令压缩位宽 $Delta = m_X - m$，定义：
  \ #box[$ cal(N)_m!(vX, {R_i}) = (m, k', {X_i'}_(i=1)^L), $]
  其中：
  \ #box[$ k' = k_X + Delta, quad
  X_i' = underbrace(floor(X_i \/ 2^Delta),"高" m "位") + underbrace(1_({R_i < X_i op("mod") 2^Delta}), "随机进位"). $]

  逐项解释：
  - 高 $m$ 位：脉冲 $X_i$ 的二进制表示中，高 $m$ 位直接从第 $Delta$ 位以上截取。这是硬连线操作，零逻辑门。
  - 随机进位：低 $Delta$ 位被解释为一个 $Delta$ 位的整数 $r = X_i mod 2^Delta$。以 $r\/2^Delta$ 为概率，向高 $m$ 位的最低位加 $1$。这保证了期望意义上的无偏性。
  - $k' = k_X + Delta$：比例因子增加 $Delta$，补偿右移 $Delta$ 位带来的量程收缩。结果是表征值 $X'$ 在期望上与 $X$ 相等。
  - ${R_i}$ 与 ${X_i}$ 独立：随机进位所用的随机源不得与原始 HSN 的脉冲序列共享任何统计依赖。

  在硬件上，随机进位只需一个 $Delta$ 位比较器（比较 $R_i$ 与 $r$）和一个条件加 $1$ 的逻辑——这与 BTH 转换（@de:bth）中生成脉冲比特位的电路完全同构。因此 $cal(N)_m$ 的硬件开销是极微小的。
]<de:regularization>

#prop([封闭性])[
  $cal(N)_m(vX, {R_i})$ 仍为一个合法的 HSN。
]

#pf[
  由 ${R_i}$ 与 ${X_i}$ 的独立性及各自的 i.i.d. 性质，复合变换后的序列 ${X_i'}$ 亦满足 i.i.d. 条件。每个 $X_i'$ 取值于 ${0, 1, dots, 2^m}$。在后续乘法应用的语境下（$m_X = 2m, Delta = m$），$X_i$ 的最大值为 $(2^m-1)^2$，此时 $floor(X_i \/ 2^m) <= 2^m-2$，随机进位至多加 $1$，故 $X_i' <= 2^m-1$，满足 $m$ 位二进制数的约束。
]

#prop([严格无偏性])[
  \ #box[$ uE[X'] = uE[X]. $]
]<prop:wpx>

#pf[
  由全期望公式，首先对给定的 $X_i$ 求条件期望：
  \ #box[$ uE[X_i'|X_i] = floor(X_i \/ 2^Delta) + uP(R_i < X_i mod 2^Delta) = floor(X_i \/ 2^Delta) + (X_i mod 2^Delta) \/ 2^Delta = X_i \/ 2^Delta. $]
  这一步是整个证明的核心：随机舍入以概率 $r\/2^Delta$ 进位，恰好将截断损失的期望补回。再对 $X_i$ 求无条件期望：
  \ #box[$ uE[X_i'] = uE[X_i] \/ 2^Delta. $]
  代入表征值定义：
  \ #box[$ uE[X'] = 2^(k') \/ L sum_(i=1)^L uE[X_i'] = 2^(k_X + Delta) \/ L dot (sum_(i=1)^L uE[X_i]) \/ 2^Delta = 2^(k_X) \/ L sum_(i=1)^L uE[X_i] = uE[X]. $]
]

@prop:wpx 表明：重正规化不改变数值的期望——收缩位宽的同时，信息在统计意义上被完整保留。

#prop([方差分解——正规化的噪声代价])[
  \ #box[$ Var(X') = Var(X) + epsilon, quad 0 <= epsilon <= 2^(2k_X + 2Delta - 2) / L. $]
  具体地：
  \ #box[$ epsilon = 2^(2k_X + 2Delta) / L^2 sum_(i=1)^L uE[(r_i (2^Delta - r_i)) / 2^(2Delta)], quad r_i = X_i mod 2^Delta. $]
]<prop:regvar>

$epsilon$ 是随机舍入注入的额外噪声。其结构具有典型的 Bernoulli 方差形式 $p(1-p)$——余数 $r$ 越接近 $2^Delta\/2$（即 $r\/2^Delta approx 0.5$），进位与否越不确定，引入的噪声越大。上界 $epsilon <= 2^(2k_X+2Delta-2)\/L$ 在 $r_i = 2^(Delta-1)$ 时达到（此时 $p=0.5$）。

#pf[
  由全方差公式：
  \ #box[$ Var(X') = underbrace(Var(uE[X'|{X_i}]), "由" {X_i} "的波动驱动") + underbrace(uE[Var(X'|{X_i})], "由随机舍入的波动驱动"). $]
  由@prop:wpx 的无偏性，$uE[X'|{X_i}] = X$，故第一项恰好等于 $Var(X)$。

  第二项来自随机舍入的 Bernoulli 条件方差：给定 $X_i$ 时，$B_i = 1_({R_i < r_i})$ 的方差为 $r_i(2^Delta-r_i)\/2^(2Delta)$。代入 $X' = (2^(k_X+Delta) \/ L) sum (floor(X_i\/2^Delta) + B_i)$，由于 ${B_i}$ 在给定 ${X_i}$ 下条件独立：
  \ #box[$ Var(X'|{X_i}) = 2^(2k_X+2Delta) / L^2 sum_(i=1)^L (r_i(2^Delta-r_i)) / 2^(2Delta). $]
  取无条件期望即得 $epsilon$。利用 $r(2^Delta-r) <= 2^(2Delta-2)$（二次函数在区间中点取最大值），得到 $epsilon <= 2^(2k_X+2Delta-2)\/L$。
]

当脉冲长度 $L$ 较大时，$epsilon = O(1\/L)$ 量级，相对于乘法本身的方差（@prop:cffcgs，通常含 $L$ 或更大的项）是可忽略的增量。

== 重正规化乘法

以下设所有参与运算的 HSN 具有相同的物理位宽 $m >= 2$（比例因子 $k$ 和脉冲长度 $L$ 可以各异）。为使记号简洁，引入辅助符号 $times.square$ 表示 HSN 乘法：
\ #box[$ vX times.square vY = vX times.square vY. $]
定义“乘后即正规化”的复合算子：
\ #box[$ times.square_cal(N)(vX, vY) = cal(N)_m!(vX times.square vY, {R_i}). $]
此时 $vZ = vX times.square vY$ 的 $m_Z = 2m$，故 $Delta = m_Z - m = m$。正规化后 $k' = k_X + k_Y + m$。

=== 单次乘-正规化的空间占用率

#de([空间占用率])[
  设 HSN $vX$ 的单脉冲采样点 $X_i$ 的最大可达值为 $X_i^"max"$，表征上界为 $M = sup sS$，定义 $vX$ 的空间占用率为二者的比值：
  \ #box[$ rho(vX) = (2^k dot X_i^"max") \/ M. $]
  它反映了“在表征空间 $sS$ 中，实际可达的最大表征值占理论上界的比例”。占用率越接近 $1$，位宽浪费越少。
]

#prop([单次乘-正规化的空间占用率])[
  对任意两个 $m$ 位 HSN $vX, vY$，复合算子 $times.square_cal(N)$ 的输出 $vZ'$ 满足：
  \ #box[$ rho(vZ') = (2^m-2) \/ (2^m-1) = 1 - 1 \/ (2^m-1). $]
  此值与 $vX, vY$ 的具体参数（$k_X, k_Y, L$）无关，仅由 $m$ 决定。
]

#pf[
  $vZ = vX times.square vY$ 的单脉冲 $Z_i = X_i Y_i$，其最大值为 $(2^m-1)^2 = 2^(2m) - 2^(m+1) + 1$。除以 $2^m$ 取整：
  \ #box[$ floor((2^m-1)^2 \/ 2^m) = floor(2^m - 2 + 2^(-m)) = 2^m-2. $]
  随机舍入至多加 $1$，故 $Z_i' <= 2^m-1$。$"sup" Z' = 2^(k_X + k_Y + m)(2^m-2)$。完整表征上界为 $2^(m+k') - 2^(k') = 2^(k_X+k_Y+m)(2^m-1)$。相除得结论。
]

纵向对比：无正规化的单次乘法占用率为 $rho_("raw") = (2^m-1)^2\/(2^(2m)-1) approx 1 - 2\/2^m$。正规化将冗余从 $tilde 2\/2^m$ 降低到 $1\/(2^m-1) approx 1\/2^m$——收窄了近一倍。但这只是单次乘法的局部改善；真正的威力体现在长程稳定性上。

=== N 步乘-正规化链的占用率稳定性

#prop([$N$ 步乘-正规化链的占用率稳定性])[
  设 $vX^((1)), vX^((2)), dots, vX^((N))$ 为一列 $m$ 位 HSN，逐次进行“乘后即正规化”：
  \ #box[$ vZ^((1)) = vX^((1)), quad vZ^((j)) = times.square_cal(N)!(vZ^((j-1)), vX^((j))), quad j = 2, dots, N. $]
  记 $vZ^((j))$ 的单脉冲最大值为 $M_j$。则：
  \ #box[$ M_N approx 2^m - N quad("当" N << 2^m "时"), quad rho(vZ^((N))) approx 1 - (N-1) \/ (2^m-1). $]
]

每次乘-正规化循环，乘积脉冲 $Z_i^((j-1)) dot X_i^((j))$ 的最大值约为 $M_(j-1) (2^m-1)$。除以 $2^m$ 并随机舍入后，$M_j$ 的期望递推为：
\ #box[$ uE[M_j] approx uE[M_(j-1)] dot (2^m-1) \/ 2^m + 1\/2. $]
第一项是截断的收缩效应（每步乘以 $(2^m-1)\/2^m approx 1 - 1\/2^m$），第二项是随机舍入的“向上托举”。两者的平衡使得期望衰减极为缓慢——每步仅损失约 $1$（在 $2^m$ 的基数上）。$N$ 步累积后，$M_N approx 2^m - N$，当 $N << 2^m$ 时衰减几乎不可见。

横向对比：

#figure(
  table(
    columns: 4,
    inset: (x: 1.2em, y: .8em),
    align: (left, center, center, center),
    stroke: (x, y) => if y == 0 or y == 1 {
      (top: 1pt + black)
    } else if y == 3 {
      (bottom: 1pt + black)
    } else {
      0pt
    },
    [], [$m_Z$], [占用率衰减速率的阶], [$N=10, m=8$ 时的占用率],
    [纯乘法（无正规化）], [$N m$], [$(1-2^(-m))^N$（指数）], [$approx (255\/256)^10 approx 0.962$],
    [乘-正规化链], [$m$], [$approx 1 - N\/2^m$（线性）], [$approx 1 - 9\/255 approx 0.965$],
  ),
  caption: [乘-正规化链与纯乘法链的空间行为对比],
)

在 $m=8$ 时，两者的占用率在数值上相近（因为 $2^m$ 很大，指数衰减的初期与线性差异不大）。但当 $m$ 较小或 $N$ 较大时，差异急剧拉开：$m=4, N=10$ 时，纯乘法的占用率已跌至 $(15\/16)^10 approx 0.524$，而正规化仍维持 $approx 1 - 9\/15 = 0.400$——更关键的是，正规化的硬件位宽是 $m=4$，而纯乘法的位宽已经膨胀到了 $40$ 位。

=== 精度演化——“退化加剧”的真相

#prop([精度演化])[
  经 $N$ 次乘-正规化后，$vZ^((N))$ 的编码精度为：
  \ #box[$ alpha^((N)) = 2^(N k + (N-1)m) \/ L. $]
  相比无正规化的 $alpha_("raw")^((N)) = 2^(N k)\/L$，正规化使绝对精度多退化了一个因子 $2^((N-1)m)$。
]

但这并非缺陷，而是信息论边界的体现。考察“可分辨等级数”——即一个 HSN 能在其数值范围内区分多少个不同的量值：
\ #box[$ "可分辨等级数" &= ("有效数值范围") \/ ("编码精度") \
&approx (2^(N k + (N-1)m) dot 2^m) \/ (2^(N k + (N-1)m) \/ L) \
&= L dot 2^m. $]
这个数字与 $N$ 无关——它是 $m$ 位 HSN 的信息论上限，不可逾越。无正规化的链路虽然表面上精度更好，但那是建立在 $N m$ 位硬件的基础上；一旦你只能用 $m$ 位物理总线，$L dot 2^m$ 就是你所能表示的全部数值等级。正规化只是诚实地将它们均匀分布在整个数值范围内。

=== 方差——正规化结合乘法的总噪声

#prop([正规化结合乘法的总方差])[
  \ #box[$ Var(times.square_cal(N)(vX, vY)) = Var(vX times.square vY) + epsilon, quad 0 <= epsilon <= 2^(2(k_X + k_Y + m)-2) \/ L. $]
]

乘法的方差 $Var(vX times.square vY)$ 由@prop:cffcgs 给出（含耦合项 $L Var X Var Y$ 和权重缩放项）。正规化额外注入的舍入噪声 $epsilon = O(1\/L)$ 量级，在 $L$ 较大时相对耦合项（含 $L$ 因子）可忽略。

=== 总结

重正规化算子 $cal(N)_m$ 的逻辑可以凝练为一句话：将物理位宽的指数膨胀转化为比例因子的线性叠加，以截断噪声换取位宽恒定。

它与乘法的结合——$times.square_cal(N)$——构成了一个“自封闭”的运算系统：任意深度的乘法链中，物理位宽始终是 $m$，空间占用率维持在线性衰减的慢车道上，期望严格无偏，方差仅增加一个 $O(1\/L)$ 的微小项。代价是绝对精度的加速退化，但这一退化恰好处在 $m$ 位 HSN 的信息论边界上——不多，也不少。


= HSN 的加法

== 比例加法

比例加法通过对两个 HSN 进行加权平均，确保运算结果在硬件位宽允许的表征范围内。类似乘法，此处直接给出比例加法的相关结果及简要证明。

#de([比例加法])[
  设 HSN $vX, vY$ 脉冲长度均为 $L$，记为 \ #box[$ vX = (m_X, k_X, {X_i}), quad vY = (m_Y, k_Y, {Y_i}). $] 为简化硬件实现，设 $m_X = m_Y = m$ 且 $k_X = k_Y = k$。定义比例加法 $(m_Z, k_Z, {Z_i}) = vZ = vX plus vY$ 如下：

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
  比例加法满足 \ #box[$ E[Z] = (E[X] + E[Y]) . $]
]

#pf[
  根据表征值定义，\ #box[$ E[Z] & = 2^(k_Z) / L sum_(i=1)^L E[Z_i] = 2^(k+1) / L sum_(i=1)^L (E[X_i] + E[Y_i]) \
       & = 2 dot [display(2^k / L sum_(i=1)^L E[X_i] + 2^k / L sum_(i=1)^L E[Y_i])] / 2. $] 由于 $E[X] = 2^k E[X_i]$ 且 $E[Y] = 2^k E[Y_i]$，代入得 \ #box[$ E[Z] = E[X] + E[Y]. $]
]

#prop([比例加法方差])[
  如果比例加法的运算数 $vX, vY$ 独立，那么比例加法结果的方差满足 \ #box[$ Var Z = 4 (Var X + Var Y). $]
]

#pf[
  \ #box[$ Var Z = 2^(2k_Z) / L Var(Z_1) = 2^(2k + 2) / L Var(X_1 + Y_1) $] 由于 $X_1, Y_1$ 独立，方差具有可加性： \ #box[$ Var Z = 4 dot 2^(2k) / L (Var X_1 + Var Y_1) = 4 (sigma_X^2 + sigma_Y^2) $] 但注意到比例加法通常对应均值减半，若考察相对误差，其波动表现仍为合理。
]

#prop([比例加法渐近分布])[
  当 $L -> oo$ 时，比例加法的结果满足\ #box[$ sqrt(L)(Z - (mu_X + mu_Y)) ->^d N(0, 4(sigma_(X_1)^2 + sigma_(Y_1)^2)). $]
]

#pf[
  由 $X, Y$ 独立性及 Levy-Lindeberg 中心极限定理直接推导 \ #box[$ sqrt(L)(X + Y - (mu_X + mu_Y)) ->^d N(0, sigma_(X_1)^2 + sigma_(Y_1)^2). $] 由于 $Z$ 的定义中系数 $2^(k_Z)$ 比 $X, Y$ 的 $2^k$ 大一倍，即 $Z = 2(overline(X)_L + overline(Y)_L)$，故其方差项叠加 4 倍系数。
]

= 结论

= 致谢

= 参考文献

#bibliography("ref.bib", style: "gb-7714-2005-numeric", full: true)

共 #total-words 字

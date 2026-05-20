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
  - *零熵状态（确定性退化）*：当且仅当某一个状态的概率 $uP(X_i = k) = 1$，而其余状态的概率全为 $0$ 时，$H(X_t) = 0$。这表明该 HSN 在当前时刻完全失去了随机性，退化为了一个固定不变的确定性数值。
  - *最大熵状态（均匀分布）*：由于状态空间共有 $2^m$ 个元素，当且仅当所有状态的发生概率完全相等（即 $uP(X_i = k) = 2^(-m), k = 0, 1, ..., 2^m-1$）时，单时刻 Shannon熵达到其理论最大值
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

== 最优 BTH 分解策略

= HSN 的乘法

== 乘法的定义及基础性质

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

== 乘法对表征空间的影响

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

== 乘法对表征值方差的影响

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

/*
== 乘法对渐近分布的影响

本节讨论当脉冲长度 $L -> oo$ 时，乘积 $vZ = vX vY$ 的分布演化。

#prop([乘法渐近正态性])[
  设独立 HSN $vX, vY$ 满足 $sqrt(L)(X - uE X) -->^d sN(0, 2^(2k) Var X_i)$ 与 $sqrt(L)(Y - uE Y) -->^d sN(0, 2^(2k) Var Y_i)$。则其乘积 $Z$ 满足$ sqrt(L)(Z - uE X uE Y) -->^d sN(0, mu_Y^2 sigma_(X_1)^2 + mu_X^2 sigma_(Y_1)^2). $
]<prop:cfjjztx>

#pf[
  定义二元函数 $g(x, y) = x dot y$。显然 $g$ 在 $(mu_X, mu_Y)$ 处一阶连续可微。其梯度向量（Jacobi 矩阵）为 \ #box[$ nabla g = ( (partial g) / (partial x), (partial g) / (partial y) ) = (y, x). $]  在均值点 $(mu_X, mu_Y)$ 处，有 $nabla g|_(mu) = (mu_Y, mu_X)$。

  由于 $vX$ 与 $vY$ 独立，其联合渐近分布为 \ #box[$ sqrt(L) ( (X - mu_X), (Y - mu_Y) ) ->^d sN((0, 0)^T, diag(sigma_(X_1)^2, sigma_(Y_1)^2)), $] 根据 *Delta 方法*，函数映射后的渐近分布为 \ #box[$ sqrt(L)(g(X, Y) - g(mu_X, mu_Y)) ->^d sN(0, (nabla g) dot Sigma dot (nabla g)^T), $] 代入梯度向量与协方差矩阵 $Sigma$ 得到 \ #box[$ sigma_Z^2 = (mu_Y, mu_X) ( (sigma_(X_1)^2, 0), (0, sigma_(Y_1)^2) ) (mu_Y, mu_X)^T = mu_Y^2 sigma_(X_1)^2 + mu_X^2 sigma_(Y_1)^2, $] 因此得出 \ #box[$ sqrt(L)(Z - mu_X mu_Y) ->^d N(0, mu_Y^2 sigma_(X_1)^2 + mu_X^2 sigma_(Y_1)^2). $]
]
*/

= 噪声在 HSN 运算中的传播

= 结论

= 致谢

= 参考文献



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
  比例加法满足 \ #box[$ E[Z] = (E[X] + E[Y]) / 2. $]
]

#pf[
  根据表征值定义，\ #box[$ E[Z] & = 2^(k_Z) / L sum_(i=1)^L E[Z_i] = 2^(k+1) / L sum_(i=1)^L (E[X_i] + E[Y_i]) \
       & = 2 dot [display(2^k / L sum_(i=1)^L E[X_i] + 2^k / L sum_(i=1)^L E[Y_i])] / 2. $] 由于 $E[X] = 2^k E[X_i]$ 且 $E[Y] = 2^k E[Y_i]$，代入得 \ #box[$ E[Z] = (E[X] + E[Y]). $]
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

#bibliography("ref.bib", style: "gb-7714-2005-numeric", full: true)

共 #total-words 字

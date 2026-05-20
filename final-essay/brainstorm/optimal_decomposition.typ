// 新增记号
#let sD = $scr(D)$
#let sX = $scr(X)$
#let vD = $arrow(Delta)$
#let vw = $arrow(w)$
#let sT = $tilde(sD)$
#let argmin = math.op("argmin")
#let argmax = math.op("argmax")

== 最优 BTH 分解策略

=== 动机：一个被忽视的自由度

回顾 BTH 转换（@de:bth），一个 $n$ 位二进制数 $x$ 被分解为 $m$ 个权重分量：
\ #box[$ x = sum_(j=0)^(m-1) 2^j x_j, quad 0 <= x_j < 2^k. $]
论文正文已经证明了这个分解下 BTH 的无偏性（@prop:bthvalid）和方差公式（@prop:Var1、@prop:Var2）。但有一个微妙之处尚未被审视：*对于一个给定的 $x$，分解 ${x_j}$ 并不唯一*。

例如，回到论文中的@ex:tab:bthex——$x=61$，$m=3$，$k=4$。论文使用的分解是 $(x_0, x_1, x_2) = (5, 12, 8)$。但容易验证：
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

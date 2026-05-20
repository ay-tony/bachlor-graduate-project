````# 混合概率数（HSN）的数学定义与基础性质

## 引言

神经网络等复杂计算任务往往对数据的动态范围有较高要求，传统的确定性二进制编码（BN）表征能力强，但硬件开销大；而传统的概率计算（SC）虽具极简的硬件结构，却面临高精度下时延随位宽呈指数级增长的"精度-时延"瓶颈。混合概率数（Hybrid Stochastic Number, HSN）的核心设计思想，正是试图通过结合二进制的位置权属性与随机比特流的统计特性，用低位宽的随机变量序列来实现对大动态范围数值的高效、高容错表征。

为方便后续讨论，我们首先约定：称一个正整数 $x$ 为"$n$ 位数"，是指其取值空间限定在离散集合 $x \in \{0, 1, \dots, 2^n - 1\}$ 内。

---

## HSN 的构思演进与形式化定义

为了利用随机信号表征一个 $n$ 位整数 $x$，一种最直观的初步构思是：构造一个长度为 $L$ 的独立同分布（i.i.d.）随机变量序列 $\{X'_i\}_{i=1}^L$。为了让该序列具备足够的表征范围，我们可以让每个采样值 $X'_i$ 均为 $n+1$ 位整数。若该序列满足如下无偏性条件：

$$E[X'_i] = x,$$

则根据大数定律，在硬件中我们便可以通过累加求和的方式，定义其样本均值作为目标数值 $x$ 的经验估计量：

$$\overline{X}' = \frac{1}{L} \sum_{i=1}^L X'_i \approx x.$$

然而，这种初级构思在实际的微电子架构中并不经济。在硬件实现上，直接在时域传输并处理高位宽的随机序列会消耗大量的布线资源与逻辑门。为了在维持动态范围的同时优化表示效率，在空间上，我们对高位宽变量 $X'_i$ 进行截断，令其低位恒为零，仅保留高 $m$ 位的有效信息（其中 $1 \le m \le n$）。此时，高位宽变量 $X'_i$ 与低位宽变量 $X_i$ 之间便建立起了映射：

$$X'_i = 2^k X_i, \quad \text{其中}\ k = n - m + 1,$$

这里 $X_i$ 转化为一个物理位宽仅为 $m$ 位的二进制数，其硬件代价大幅降低。相应地，对目标值 $x$ 的估计式也通过比例因子 $k$ 进行了权重补偿，修正为：

$$2^k \overline{X} = \frac{2^k}{L} \sum_{i=1}^L X_i \approx x.$$

综合上述从随机统计到硬件剪裁的演进逻辑，我们给出HSN的形式化定义。

### 定义 1（HSN）

一个 HSN $\mathbf{X}$ 定义为一个有序三元组 $\mathbf{X} = (m, k, \{X_i\}_{i=1}^L)$，它严格满足以下硬件与概率约束：
- **物理位宽** $m \in \mathbb{N}^*$：代表微架构实现时数据总线的实际物理位宽；
- **比例因子** $k \in \mathbb{Z}$：用于调整数值量程与动态范围的权重补偿系数；
- **随机脉冲串** $\{X_i\}_{i=1}^L$：为一独立同分布（i.i.d.）的随机序列，且每个采样点 $X_i$ 几乎处处（a.s.）取值于 $m$ 位二进制数空间。

### 定义 2（表征值）

设 $\mathbf{X} = (m, k, \{X_i\}_{i=1}^L)$ 为一个 HSN，定义该 HSN 的**表征值** $X$ 为其随机脉冲串样本均值的加权映射：

$$X = \frac{2^k}{L} \cdot \sum_{i=1}^L X_i.$$

### 命题 1

设 HSN $\mathbf{X}$ 的表征值是 $X$，那么

$$E X = 2^k E X_i.$$

**证明：**

$$E X = E\left[\frac{2^k}{L} \cdot \sum_{i=1}^L X_i\right] = \frac{2^k}{L} \cdot L \cdot E X_i = 2^k E X_i.$$

---

## 表征空间及编码精度

### 命题 2（表征空间）

对于 HSN $\mathbf{X} = (m, k, \{X_i\}_{i=1}^L)$，其表征值 $X$ 几乎处处（a.s.）取值于如下一维离散网格集合：

$$\mathcal{S} = \{z \cdot \alpha \mid z \in \mathbb{Z},\ 0 \le z \le L(2^{m}-1)\}
= \{0, \alpha, 2\alpha, 3\alpha, \dots, 2^{m+k} - 2^k\},$$

其中 $\alpha = 2^k / L$。这样，我们也可以在几乎处处的意义下将表征值 $X$ 看做 $\mathcal{S}$ 上的随机变量。

**证明：**

根据定义2的表征值定义，可以将 $X$ 改写为

$$X = \frac{2^k}{L} \cdot \sum_{i=1}^L X_i = \alpha \sum_{i=1}^L X_i.$$

由于脉冲串中每个随机变量 $X_i$ 几乎处处取值于二进制整数集合（即 $X_i \in \{0, 1, \dots, 2^m-1\}$），则整个时间序列的求和量 $Z = \sum_{i=1}^L X_i$ 显然是一个离散的整数，其取值边界由单点域的最大值线性累加决定，即其范围为整数集 $\{0, 1, \dots, L(2^m - 1)\}$。

相应地，$X = \alpha \cdot Z$ 的取值集合即为公差为 $\alpha$ 的等差点集 $\{0, \alpha, 2\alpha, \dots, \alpha L(2^m - 1)\}$。将该集合的离散上界进行代数展开，可得：

$$\alpha L (2^m - 1) = \frac{2^k}{L} \cdot L(2^m - 1) = 2^{m+k} - 2^k.$$

证毕。

### 定义 3（表征空间）

命题2中定义的离散网格集合 $\mathcal{S}$ 称为该 HSN $\mathbf{X}$ 的**表征空间**。

### 定义 4（表征上界与编码精度）

设 $\mathbf{X} = (m, k, \{X_i\}_{i=1}^L)$ 为一 HSN，其对应的表征空间为 $\mathcal{S}$：
- 定义 $\mathbf{X}$ 的**表征上界** $M = \sup \mathcal{S} = 2^{m+k} - 2^k$，其反映了该编码方案在不溢出前提下能够承载的最大有效数值；
- 定义 $\mathbf{X}$ 的**编码精度** $\alpha = 2^k / L$，即表征空间等差数列的公差。该参数在物理上定义了 HSN 表征空间的分辨率，代表系统能够分辨的最小数值扰动。

---

从上面的推导不难看出，给定结构参数后，HSN 的所有可能表征值在区间 $[0, 2^{m+k}-2^k]$ 内构成了一个均匀分布的等差数列。尽管混合概率数在底层使用的是不断随时间变化的随机序列，但它最终表达出来的数值 $X$ 并不是连续的，而是严格限制在以 $\alpha$ 为间隔的等差集合 $\mathcal{S}$ 之中。

---

## HSN 的 Shannon 熵

### Shannon 熵的定义与基础性质

#### 定义 5（单时刻 Shannon 熵）

设 $\mathbf{X} = (m, k, \{X_i\}_{i=1}^L)$ 为 HSN，它在 $i$ 时刻的采样值为 $X_i$（由于 $X_i$ 是 i.i.d. 的，所以可以任意取 $i$ 而不影响结论），定义 $\mathbf{X}$ 的**单时刻 Shannon 熵** $H(X_i)$ 为：

$$H(X_i) = -\sum_{k=0}^{2^m-1} P(X_i = k) \log_2 P(X_i = k).$$

单时刻 Shannon 熵是用来度量下一时刻该序列会输出什么数值的不确定程度。我们对输出结果感到越不确定、越难猜中，单时刻 Shannon 熵的值就越大；反之，如果我们能很有把握地断定输出结果，单时刻 Shannon 熵的值就越小。

#### 命题 3（边界特征）

- **零熵状态（确定性退化）**：当且仅当某一个状态的概率 $P(X_i = k) = 1$，而其余状态的概率全为 $0$ 时，$H(X_t) = 0$。这表明该 HSN 在当前时刻完全失去了随机性，退化为了一个固定不变的确定性数值。
- **最大熵状态（均匀分布）**：由于状态空间共有 $2^m$ 个元素，当且仅当所有状态的发生概率完全相等（即 $P(X_i = k) = 2^{-m},\ k = 0, 1, \dots, 2^m-1$）时，单时刻 Shannon 熵达到其理论最大值

$$H_{\max}(X) = \log_2 (2^m) = m\ \text{bits}.$$

故混合概率数在实际工作时，其单时刻携带的 Shannon 熵总是在 $0$ bits 到 $m$ bits 之间变动。

#### 定义 6（表征 Shannon 熵）

设 HSN $\mathbf{X}$ 的表征值为 $X$，编码精度为 $\alpha = 2^k / L$，定义 $\mathbf{X}$ 的**表征 Shannon 熵**为

$$H(X) = -\sum_{k=0}^{L(2^m-1)} P(X = \alpha k) \log_2 P(X = \alpha k).$$

描述了表征值 $X$ 所携带的信息量。需要说明的是，表征 Shannon 熵和单时刻 Shannon 熵之间并不存在简单的单调性关系。

---

### 固定期望下的最大熵

在实际的硬件系统或神经网络中，一个 HSN 通常需要承载一个固定的目标数值，即其数值期望 $E X_i$ 是被约束的。设已知该 HSN 脉冲的期望值为 $E X_i = \mu$，在期望值 $\mu$ 固定的约束条件下，单时刻 Shannon 熵 $H(X_i)$ 会展现出若干解析性质。

#### 命题 4（最大熵分布）

在已知期望为 $\mu$ 的所有可能分布中，能使单时刻 Shannon 熵 $H(X_i)$ 达到最大值的概率分布，必定呈现出如下的离散 Gibbs 分布形式：

$$P(X_i = k) = \frac{e^{-\lambda k}}{Z(\lambda)}, \quad k \in \{0, 1, \dots, 2^m - 1\},$$

其中 $Z(\lambda) = \sum_{k=0}^{2^m-1} e^{-\lambda k}$ 为确保概率之和为 1 的常数项，而常数 $\lambda$ 则由期望约束方程 $-\frac{d}{d\lambda} \ln Z(\lambda) = \mu$ 唯一决定。

**证明：**

这是一个典型的带约束条件的函数极值问题，可以使用 Lagrange 乘数法求解。记 $p_k = P(X_i = k)$，构造 Lagrange 函数

$$\mathcal{L} = -\sum_{k=0}^{2^m-1} p_k \ln p_k - \lambda_0 \left(\sum_{k=0}^{2^m-1} p_k - 1\right) - \lambda \left(\sum_{k=0}^{2^m-1} k \cdot p_k - \mu\right).$$

对每一个未知数 $p_k$ 分别求导数，并令导数等于 $0$，即得到

$$\frac{\partial \mathcal{L}}{\partial p_k} = -\ln p_k - 1 - \lambda_0 - \lambda k = 0 \quad \Longrightarrow \quad p_k = e^{-(1+\lambda_0)} e^{-\lambda k}.$$

利用概率之和为 1 的条件，将常数部分记为 $1 / Z(\lambda)$，即可得到 $p_k = e^{-\lambda k} / Z(\lambda)$。

#### 命题 5（最大熵）

设 HSN $\mathbf{X} = (m, k, \{X_i\}_{i=1}^L)$ 满足 $E X_i = \mu$，那么它的单时刻 Shannon 熵 $H_\mu(X_i)$ 达到最大时（也即 $X_i$ 的分布取到命题4中情况时），有

$$H(\mu) = -\mu \log_2 t + \log_2 \left( \frac{1 - t^{2^m}}{1 - t} \right).$$

其中，参数 $t$ 是有理分式方程

$$\mu = \frac{t}{1-t} - \frac{2^m t^{2^m}}{1-t^{2^m}}$$

的唯一正实根。

**证明：**

由命题4的极值条件可知，满足最大单时刻 Shannon 熵的概率分布 $p_k$ 必须满足

$$p_k(t) = \frac{t^k}{Z(t)}, \quad k \in \{0, 1, \dots, 2^m - 1\},$$

其中变量 $t$ 是一个大于 $0$ 的待定参数，它与期望约束紧密相关；而分母 $Z(t)$ 则为确保所有状态概率之和为 1 的归一化项。

首先，计算归一化项 $Z(t)$。由于各状态的概率构成了一个有限项的等比数列，利用等比数列求和公式，可以将 $Z(t)$ 直接写为

$$Z(t) = \sum_{k=0}^{2^m-1} t^k = \frac{1 - t^{2^m}}{1 - t}.$$

其次，建立参数 $t$ 与给定期望 $\mu$ 之间的代数方程。根据期望值的定义，将概率分布代入可得

$$\mu = E X_i = \sum_{k=0}^{2^m-1} k \cdot p_k = \frac{t}{1 - t} - \frac{2^m t^{2^m}}{1 - t^{2^m}}.$$

对于任意给定的期望值 $\mu \in (0, 2^m - 1)$，上式右侧关于参数 $t$ 是严格单调递增的。因此，在该区间内，该方程存在唯一的正实根，将其记为 $t(\mu)$。

最后，将最大单时刻 Shannon 熵 $H(\mu)$ 表达为 $\mu$ 与 $t$ 的代数式。将概率 $p_k = t^k / Z$ 代入单时刻 Shannon 熵的定义公式中，得到

$$H(\mu) = -\sum_{k=0}^{2^m-1} p_k \log_2 p_k = -\sum_{k=0}^{2^m-1} p_k \log_2 \left( \frac{t^k}{Z} \right).$$

利用对数的运算性质，将括号内的分式展开为相减形式，即有

$$H(\mu) = -\sum_{k=0}^{2^m-1} p_k \left( k \log_2 t - \log_2 Z \right) = -\left( \sum_{k=0}^{2^m-1} k p_k \right) \log_2 t + \left( \sum_{k=0}^{2^m-1} p_k \right) \log_2 Z.$$

因为在约束条件中，所有概率之和 $\sum p_k = 1$，且数值期望 $\sum k p_k = \mu$，代入上式后即可得到通用参数化解析表达式

$$H(\mu) = -\mu \log_2 t + \log_2 \left( \frac{1 - t^{2^m}}{1 - t} \right).$$

其中，参数 $t$ 是有理分式方程 $\mu = \frac{t}{1-t} - \frac{2^m t^{2^m}}{1-t^{2^m}}$ 的唯一正实根。

#### 命题 6（$m=1$ 特例）

设 HSN $\mathbf{X} = (m = 1, k, \{X_i\}_{i=1}^L)$ 满足 $E X_i = \mu$（此时 $X_i \in \{0, 1\}$），那么它的单时刻 Shannon 熵 $H_\mu(X_i)$ 达到最大时有

$$H(\mu) = -\mu \log_2 \mu - (1-\mu) \log_2 (1-\mu).$$

**证明：**

此时，关于参数 $t$ 的方程简化为

$$\mu = \frac{t}{1-t} - \frac{2 t^2}{1 - t^2} = \frac{t(1+t) - 2t^2}{1-t^2} = \frac{t}{1+t}.$$

由此可直接反解出参数 $t$ 关于期望 $\mu$ 的表达式为

$$t = \frac{\mu}{1-\mu}.$$

同时，归一化项 $Z$ 也可以同步转化为关于 $\mu$ 的函数

$$Z = 1 + t = 1 + \frac{\mu}{1-\mu} = \frac{1}{1-\mu}.$$

将求得的 $t$ 和 $Z$ 直接代入命题5，展开并化简可得

$$H(\mu) = -\mu \log_2 \left( \frac{\mu}{1-\mu} \right) + \log_2 \left( \frac{1}{1-\mu} \right) = -\mu \log_2 \mu - (1-\mu) \log_2 (1-\mu).$$

这一推导结论表明，在传统 SN 情况下（即物理位宽 $m=1$ 时），$H(\mu)$ 正好退化为概率论中经典的二项分布熵，这也从侧面验证了通用参数化公式在低维情况下的正确性。

在后续的 HSN 分析中，命题5描述了给定均值下熵的上界。对后续章节中出现的任意 HSN 对应的单时刻 Shannon 熵 $H(X_i)$，其数值都必然严格受到本节结论的约束，即

$$H(X_i) \le H(\mu).$$

---

# HSN 的生成

## BTH 转换函数

二进制数至混合概率数（BN-to-HSN, BTH）的转换过程，实质上是将确定性的位置编码映射为包含统计特性的随机编码。该映射通过引入一组辅助随机序列 $\{R_i\}_{i=1}^L$（在硬件实现中通常由随机数发生器产生）作为中介，将 $n$ 位二进制数 $x$ 编码为对应的 HSN $\mathbf{X}$。记 $n$ 位二进制数 $x$ 的比特展开式为

$$x = \sum_{j=0}^{n-1} 2^j x^{(j)}, \quad x^{(j)} \in \{0, 1\},$$

其中 $x^{(j)}$ 代表其第 $j$ 位二进制分量。

### 定义 7（BTH）

给定物理位宽 $m$、比例因子 $k$ 以及长度为 $L$ 的辅助随机序列 $\{R_i\}_{i=1}^L$，转换函数 $\mathrm{BTH}$ 为从二进制空间 $\mathbb{Z} \cap [0, 2^m-1]$ 向 HSN 空间的映射，记为

$$\mathbf{X} = \mathrm{BTH}(m, k, \{R_i\}_{i=1}^L, x).$$

其中，$\{R_i\}_{i=1}^L$ 为 i.i.d. 辅助随机变量，且每个 $R_i$ 在集合 $\{0, 1, \dots, 2^k-1\}$ 上服从均匀分布。待转换的 $n$ 位 BN $x$ 需满足量程约束 $0 \le x \le 2^{m+k} - 2^k$。转换逻辑如下：

1. **数值分解**：将 $x$ 分解为 $m$ 个权重分量的线性组合：

$$x = \sum_{j=0}^{m-1} 2^j x_j,$$

其中，$x_j$ 是与权重 $2^j$ 相对应的系数值，且满足 $0 \le x_j < 2^k$；

2. **随机化生成**：对于 HSN 脉冲串中的每个分量 $X_i$（$i=1, \dots, L$），其第 $j$ 个比特位 $X_i^{(j)}$ 根据随机比较结果确定：

$$X_i^{(j)} = \begin{cases}
1, & R_i < x_j, \\
0, & R_i \ge x_j
\end{cases}
= \mathbf{1}_{\{R_i < X_j\}}, \quad \forall j \in \{0, 1, \dots, m-1\}.$$

### 命题 7（BTH 合法性）

定义7中构造的元组 $(m, k, \{X_i\}_{i=1}^L) = \mathbf{X} = \mathrm{BTH}(m, k, \{R_i\}_{i=1}^L, x)$ 是合法的 HSN。

**证明：**

根据 HSN 的定义，核心在于证明构造的随机脉冲串 $\{X_i\}_{i=1}^L$ 满足 i.i.d. 条件。

按照定义7，每个脉冲位 $X_i^{(j)}$ 都是辅助随机变量 $R_i$ 的函数，即 $X_i^{(j)}$ 关于 $R_i$ 生成的 $\sigma$-代数 $\sigma(R_i)$ 可测。又考虑到 HSN 的每个脉冲位可表示为 $X_i = \sum_{j=0}^{m-1} 2^j X_i^{(j)}$，那么 $X_i$ 是可测函数对 $R_i$ 的复合映射，从而 $X_i \in \sigma(R_i)$。

已知辅助随机序列 $\{R_i\}_{i=1}^L$ 是 i.i.d. 的，根据随机变量变换的性质，若 $R_1, R_2, \dots, R_L$ 相互独立，则其对应的可测函数变换序列 $\{X_i\}_{i=1}^L$ 亦相互独立。同时，由于变换函数对每个 $i$ 保持一致，序列满足同分布性质。

综上所述，构造得到的 $\mathbf{X}$ 满足 HSN 的所有数学约束。

### 命题 8（无偏性）

对于转换 $\mathbf{X} = \mathrm{BTH}(m, k, \{R_i\}_{i=1}^L, x)$，其表征值 $X$ 的数学期望等于原始二进制数，即 $E[X] = x$。

**证明：**

根据表征值定义与期望算子的线性性质，推导如下：

$$\begin{aligned}
E[X] &= E\left[ \frac{2^k}{L} \sum_{i=1}^L X_i \right]
      = \frac{2^k}{L} \sum_{i=1}^L E\left[\sum_{j=0}^{m-1} 2^j X_i^{(j)} \right] \\
     &= 2^k \sum_{j=0}^{m-1} 2^j E[ X_i^{(j)} ]
      = 2^k \sum_{j=0}^{m-1} 2^j \cdot P(R_i < x_j) \\
     &= 2^k \sum_{j=0}^{m-1} 2^j \cdot \frac{x_j}{2^k}
      = \sum_{j=0}^{m-1} x_j 2^j
      = x.
\end{aligned}$$

---

## 转换结果的波动特性

在确定了 BTH 的无偏性后，下面进一步研究其波动特性。方差的大小直接决定了 HSN 在硬件计算中的信噪比与收敛速度。

### 命题 9（方差分解公式）

对于转换 $\mathbf{X} = \mathrm{BTH}(m, k, \{R_i\}_{i=1}^L, x)$，设 BTH 内对 $x$ 的拆分方法为

$$x = \sum_{j=0}^{m-1} 2^j x_j,$$

那么 $\mathbf{X}$ 的表征值 $X$ 的方差满足公式

$$\operatorname{Var} X = \frac{1}{L} \sum_{j_1=0}^{m-1}\sum_{j_2=0}^{m-1} 2^{j_1 + j_2} \min\{x_{j_1}, x_{j_2}\}(2^k - \max\{x_{j_1}, x_{j_2}\}).$$

**证明：**

记 $\{X_i\}_{i=1}^L$ 为 $\mathbf{X}$ 的随机脉冲串，则 $X_i^{(j)}$ 可以形式化记为 $X_i^{(j)} = \mathbf{1}_{\{R_i < x_j\}}$，从而

$$\begin{aligned}
X_i   &= \sum_{j=0}^{m-1} 2^j \mathbf{1}_{\{R_i < x_j\}},
\\
X_i^2 &= \sum_{j_1=0}^{m-1}\sum_{j_2=0}^{m-1} 2^{j_1} 2^{j_2} \mathbf{1}_{\{R_i < x_{j_1}\}} \mathbf{1}_{\{R_i < x_{j_2}\}}
      = \sum_{j_1=0}^{m-1}\sum_{j_2=0}^{m-1} 2^{j_1+j_2} \mathbf{1}_{\{R_i < \min\{x_{j_1}, x_{j_2}\}\}},
\end{aligned}$$

其中 $\mathbf{1}_A$ 表示示性函数，其定义为 $\mathbf{1}_A(x) = \begin{cases}1, & x \in A, \\ 0, & x \notin A.\end{cases}$

利用辅助随机变量 $R_i$ 的离散均匀分布性质（其测度为 $2^{-k}$），可得

$$E[\mathbf{1}_{\{R_i < x_j\}}] = P(R_i < x_j) = 2^{-k} x_j.$$

将上述结论代入 $X_i, X_i^2$ 表达式可得

$$\begin{aligned}
E[X_i] &= \sum_{j=0}^{m-1} 2^{j-k} x_j,
\\
(E[X_i])^2 &= \left(\sum_{j=0}^{m-1} 2^{j-k} x_j\right)^2 = \sum_{j_1=0}^{m-1}\sum_{j_2=0}^{m-1} 2^{j_1 + j_2 - 2k} x_{j_1} x_{j_2},
\\
E[X_i^2] &= \sum_{j_1=0}^{m-1}\sum_{j_2=0}^{m-1} 2^{j_1 + j_2 - k} \min\{x_{j_1}, x_{j_2}\},
\\
\operatorname{Var} X_i &= E[X_i^2] - (E[X_i])^2 \\
&= \sum_{j_1=0}^{m-1}\sum_{j_2=0}^{m-1} 2^{j_1 + j_2 - 2k} \min\{x_{j_1}, x_{j_2}\}(2^k - \max\{x_{j_1}, x_{j_2}\}).
\end{aligned}$$

再代入 $X = \frac{2^k}{L} \sum_{i=1}^L X_i$，且考虑到 $X_i$ 是 i.i.d. 即有

$$\begin{aligned}
\operatorname{Var} X &= \frac{2^{2k}}{L^2} \sum_{i=1}^L \operatorname{Var} X_i = \frac{2^{2k}}{L} \operatorname{Var} X_1 \\
&= \frac{1}{L} \sum_{j_1=0}^{m-1}\sum_{j_2=0}^{m-1} 2^{j_1 + j_2} \min\{x_{j_1}, x_{j_2}\}(2^k - \max\{x_{j_1}, x_{j_2}\}).
\end{aligned}$$

命题9揭示了 HSN 表征精度的内在机理。从数学结构上看，方差由双重加权和构成，其核心项 $\min\{x_{j_1}, x_{j_2}\}(2^k - \max\{x_{j_1}, x_{j_2}\})$ 具有典型的二项分布方差特征，反映了各比特位在随机映射过程中的统计波动及其相互耦合。

### 命题 10（方差上确界）

记 $M = 2^{m+k} - 2^k$ 为 $\mathbf{X}$ 的表征上界，则对于命题9中所有可能的 $x \in [0, M] \cap \mathbb{Z}$ 及其对应分解策略 $\{x_j\}$，方差的上确界为

$$\sup_{x, \{x_j\}} \{\operatorname{Var} X\} = \frac{2^{2k - 2}}{L} (2^m - 1)^2,$$

该上确界给出了 BTH 转化在最坏情况下的统计波动边界。

**证明：**

根据命题9的方差公式，并设 $p_j = x_j / 2^k$，其中 $p_j \in [0, 1]$，将原式改写为概率映射形式：

$$\operatorname{Var} X = \frac{2^{2k}}{L} \sum_{j_1=0}^{m-1} \sum_{j_2=0}^{m-1} 2^{j_1 + j_2} \cdot p_{\min\{j_1, j_2\}} (1 - p_{\max\{j_1, j_2\}}).$$

为了求解该多维函数的最大值，考虑对称性。当所有权重分量的激活概率相等，即 $p_0 = p_1 = \dots = p_{m-1} = p$ 时，方差取得极大值：

$$\begin{aligned}
\operatorname{Var} X &= \frac{2^{2k}}{L} \left(\sum_{j=0}^{m-1} 2^j\right)^2 \cdot p(1 - p) \\
&= \frac{2^{2k}}{L} (2^m - 1)^2 \cdot p(1 - p).
\end{aligned}$$

由于二次函数 $f(p) = p(1 - p)$ 在 $[0, 1]$ 上的最大值为 $f(1/2) = 1/4$，代入上式得：

$$\sup \operatorname{Var} X = \frac{2^{2k}}{L} (2^m - 1)^2 \cdot \frac{1}{4} = \frac{2^{2k - 2}}{L} (2^m - 1)^2.$$

此时对应的物理含义为：当所有比特位的激活概率均为 $0.5$（即 $x_j = 2^{k-1}$）时，HSN 的统计波动达到峰值。

在实际工程应用中，由于在 $m \gg 1$ 的高位宽情形下，$(2^m - 1)^2 \approx 2^{2m}$，因此方差的上确界可以近似表示为

$$\sup \operatorname{Var} X \approx \frac{2^{2k + 2m - 2}}{L}.$$

---

## 随机脉冲串的分布

在 BTH 逻辑中，同一个辅助随机变量 $R_i$ 被同时用于 $m$ 个分量的比较。这种共用随机源的机制使得 HSN 脉冲串的采样值 $X_i$ 具有极强的结构性。

### 命题 11（采样值分布）

设 $\mathbf{X} = \mathrm{BTH}(m, k, \{R_i\}_{i=1}^L)$ 由 BTH 转换函数产生，则随机采样点 $X_i$ 的取值集合 $\mathcal{V} \subset \{0, 1, 2, \dots, 2^m-1\}$ 满足 $|\mathcal{V}| \le m+1$。

**证明：**

设 $n$ 位 BN $x$ 在 BTH 转换函数内部分解为 $m$ 个分量 $\{x_0, x_1, \dots, x_{m-1}\}$。将这些分量按非递减顺序重排为

$$0 \le x_{\pi(0)} \le x_{\pi(1)} \le \dots \le x_{\pi(m-1)} < 2^k.$$

根据采样点的构造公式 $X_i = \sum_{j=0}^{m-1} 2^j \mathbf{1}_{\{R_i < x_j\}}$，其取值完全由 $R_i$ 落在的分段区间决定。由于 $R_i \in \{0, 1, \dots, 2^k - 1\}$，有序序列 $\{x_{\pi(r)}\}$ 将该整数区间划分为如下 $m+1$ 个互斥子区间：

- $I_0 = [0, x_{\pi(0)})$；
- $I_r = [x_{\pi(r-1)}, x_{\pi(r)}),\ r = 1, \dots, m-1$；
- $I_m = [x_{\pi(m-1)}, 2^k)$。

当 $R_i \in I_r$ 时，对于任意分量 $x_j$：
- 若 $x_j \le x_{\pi(r-1)}$，则 $R_i \ge x_j$，此时 $\mathbf{1}_{\{R_i < x_j\}} = 0$；
- 若 $x_j \ge x_{\pi(r)}$，则 $R_i < x_j$，此时 $\mathbf{1}_{\{R_i < x_j\}} = 1$。

因此，对于处于同一区间 $I_r$ 内的所有 $R_i$，其对应的 $X_i$ 均塌缩为确定的常数 $v_r$。由于区间总数至多为 $m+1$，故 $X_i$ 的可能取值至多有 $m+1$ 种。

命题11表明，尽管 HSN 的定义允许 $X_i$ 理论上取遍 $2^m$ 个二进制数，但 BTH 算法通过单随机源映射，将搜索空间压缩到了线性的 $m+1$ 阶量级。

### 例子 1（BTH 采样值分布）

本例源于文献 [Li2024]。假设要将 $6$ 位 BN $x = 61$ 编码为物理位宽 $m=3$，比例因子 $k=4$ 的 HSN $\mathbf{X}$。辅助变量 $R_i$ 服从 $\{0, 1, \dots, 2^4-1=15\}$ 上的均匀分布。如果指定 BTH 内部分解为 $x_0 = 5, x_1 = 12, x_2 = 8$，此时

$$x = \sum_{j=0}^2 2^j x_j = 2^0 \cdot 5 + 2^1 \cdot 12 + 2^2 \cdot 8 = 61$$

说明这是合法的分解。

为了得到 $R_i$ 和 $X_i$ 的取值对应表，将分量 $\{x_j\}$ 按升序排列：

$$x_{\pi(0)} = x_0 = 5,\quad x_{\pi(1)} = x_2 = 8,\quad x_{\pi(2)} = x_1 = 12,$$

这三个阈值将 $R_i$ 的取值空间 $[0, 15] \cap \mathbb{Z}$ 划分为 $m + 1 = 4$ 个互斥区间。

| $R_i$ 取值范围 | $X_i^{(0)}$ | $X_i^{(1)}$ | $X_i^{(2)}$ | $X_i$ |
|:---:|:---:|:---:|:---:|:---:|
| $0 \le R_i < 5$  | 1 | 1 | 1 | 7 |
| $5 \le R_i < 8$  | 0 | 1 | 1 | 6 |
| $8 \le R_i < 12$ | 0 | 1 | 0 | 2 |
| $12 \le R_i < 16$ | 0 | 0 | 0 | 0 |

如表所示，尽管 $X_i$ 作为 3 位二进制数理论上可以取 $2^3=8$ 个值，但在 BTH 映射下，它实际上仅在 $\{7, 6, 2, 0\}$ 这 $m+1=4$ 个元素中取值。

### 命题 12（分布特征方差公式）

设 $n$ 位 BN $x$ 的 BTH 分量按升序排列为 $0 \le x_{\pi(0)} \le x_{\pi(1)} \le \dots \le x_{\pi(m-1)} < 2^k$。记 $\Delta_r = x_{\pi(r)} - x_{\pi(r-1)}$（约定 $x_{\pi(-1)} = 0$），$v_r$ 为采样点在区间 $I_r$ 上的取值，则 $\mathbf{X}$ 的表征值 $X$ 的方差满足：

$$\operatorname{Var} X = \frac{1}{L} \sum_{0 \le r < s \le m} \frac{\Delta_r \Delta_s (v_r - v_s)^2}{2^k}.$$

**证明：**

根据命题11，$X_i$ 是一个离散随机变量，其取值为 $v_r$ 的概率为 $p_r = P(R_i \in I_r) = \Delta_r / 2^k$。

由随机变量方差的通用恒等式

$$\operatorname{Var} X_i = \frac{1}{2} \sum_{r=0}^m \sum_{s=0}^m p_r p_s (v_r - v_s)^2$$

代入概率分布 $p_r, p_s$ 可得

$$\operatorname{Var} X_i = \frac{1}{2 \cdot 2^{2k}} \sum_{r=0}^m \sum_{s=0}^m \Delta_r \Delta_s (v_r - v_s)^2 = \frac{1}{2^{2k}} \sum_{0 \le r < s \le m} \Delta_r \Delta_s (v_r - v_s)^2.$$

由于 $X = \frac{2^k}{L} \sum_{i=1}^L X_i$ 且 $X_i$ 为 i.i.d.，则

$$\operatorname{Var} X = \frac{2^{2k}}{L^2} \sum_{i=1}^L \operatorname{Var} X_i = \frac{2^{2k}}{L} \operatorname{Var} X_i.$$

将 $\operatorname{Var} X_i$ 代入即得

$$\operatorname{Var} X = \frac{1}{L} \sum_{0 \le r < s \le m} \frac{\Delta_r \Delta_s (v_r - v_s)^2}{2^k}.$$

命题9与命题12给出的方差公式在数学上是完全等价的。BTH 转换的这一特性表明，HSN 的统计波动不仅源于概率采样本身，更源于共用随机源 $R_i$ 导致的各比特位之间的强正相关性。

---

## BTH 生成的 HSN 表征值的渐近收敛性分析

### 命题 13（渐近正态）

设 $\mathbf{X} = (m, k, \{X_i\}_{i=1}^L)$ 为 BTH 转换生成的 HSN。当脉冲长度 $L \to \infty$ 时，表征值 $X$ 满足：

$$\sqrt{L}(X - x) \overset{d}{\longrightarrow} \mathcal{N}(0, 2^{2k} \operatorname{Var} X_i),$$

其中 $\overset{d}{\longrightarrow}$ 表示依分布收敛（弱收敛），$\mathcal{N}(\mu, \sigma^2)$ 代表均值为 $\mu$，方差为 $\sigma^2$ 的正态分布。上式也可以记为

$$X \overset{a}{\sim} \mathcal{N}\left(x, \frac{2^{2k}}{L} \operatorname{Var} X_i\right) = \mathcal{N}(x, \operatorname{Var} X),$$

其中 $\overset{a}{\sim}$ 表示"渐近服从于"。

**证明：**

首先根据定义2，将 $X$ 写为脉冲串 $X_i$ 的算术平均形式，即

$$X = \frac{2^k}{L} \sum_{i=1}^L X_i = 2^k \cdot \overline{X}_L,$$

其中 $\overline{X}_L$ 是随机变量列 $\{X_i\}$ 的样本均值。在命题7中已经证明了 $\{X_i\}_{i=1}^L$ 是 i.i.d. 的，又在命题9中证明 $X_i$ 的二阶矩存在，其期望 $E[X_i] = 2^{-k}x$，方差 $\operatorname{Var} X_i < \infty$，那么应用 Levy-Lindeberg 中心极限定理知道样本均值满足

$$\sqrt{L}(\overline{X}_L - 2^{-k}x) \overset{d}{\longrightarrow} \mathcal{N}(0, \operatorname{Var} X_i).$$

那么自然可以求得 $X = 2^k \overline{X}_L$ 的渐近分布为

$$\sqrt{L}(X - x) \overset{d}{\longrightarrow} \mathcal{N}(0, 2^{2k} \operatorname{Var} X_i).$$

命题13表明 HSN 的表征误差 $(X - x)$ 的标准差以 $1/\sqrt{L}$ 的速度衰减。这与传统概率计算（SC）的精度特性一致，说明 HSN 在保持随机计算鲁棒性的同时，严格遵循大数定律。

---

# HSN 的乘法

## 乘法的定义及基础性质

在定义 HSN 乘法之前，必须明确运算分量之间的统计独立性，这是确保期望值满足乘法结合律的前提。

### 定义 8（独立）

称两个 HSN $\mathbf{X}, \mathbf{Y}$ 相互**独立**，如果它们的脉冲序列的并集

$$\{X_i\}_{i=1}^{L_X} \cup \{Y_i\}_{i=1}^{L_Y} = \{X_1, X_2, \dots, X_{L_X}, Y_1, Y_2, \dots, Y_{L_Y}\}$$

为独立随机变量集合。

### 定义 9（乘法）

设 $\mathbf{X}, \mathbf{Y}$ 为两个相互独立且它们的脉冲长度相同的 HSN，记为

$$\mathbf{X} = (m_X, k_X, \{X_i\}_{i=1}^L), \quad
\mathbf{Y} = (m_Y, k_Y, \{Y_i\}_{i=1}^L).$$

定义乘法运算 $\mathbf{Z} = \mathbf{X} \boxtimes \mathbf{Y}$，其结果 $\mathbf{Z} = (m_Z, k_Z, \{Z_i\}_{i=1}^L)$ 满足：

- $m_Z = m_X + m_Y$（物理位宽叠加）；
- $k_Z = k_X + k_Y$（比例因子叠加）；
- $Z_i = X_i Y_i,\ \forall i \in \{1, 2, \dots, L\}$（逐脉冲乘积）。

### 命题 14（乘法封闭性）

定义9中乘法的结果 $\mathbf{Z}$ 仍然是一个 HSN。

**证明：**

由于 $X_i$ 是 $m_X$ 位整数，$Y_i$ 是 $m_Y$ 位整数，其乘积 $Z_i = X_i Y_i$ 的最大值为 $(2^{m_X}-1)(2^{m_Y}-1) < 2^{m_X+m_Y}-1$。因此，$Z_i$ 几乎处处为 $m_Z$ 位二进制数。另外，由于 $\{X_i\}$ 与 $\{Y_i\}$ 相互独立且各自满足 i.i.d. 条件，根据独立随机变量函数变换的性质，其积序列 $\{X_i Y_i\}$ 亦满足 i.i.d 条件。

### 命题 15（乘法无偏性）

定义9中的乘法在期望的意义下是准确的，即乘法满足 $E[Z] = E[X] E[Y]$。

**证明：**

根据 HSN 表征值的定义及期望的性质，推导如下：

$$\begin{aligned}
E[Z] &= E\left[\frac{2^{k_Z}}{L} \sum_{i=1}^L Z_i\right]
      = \frac{2^{k_X+k_Y}}{L} \sum_{i=1}^L E[X_i Y_i]
      = \frac{2^{k_X} \cdot 2^{k_Y}}{L} \cdot L \cdot E[X_i] E[Y_i] \\
     &= \left(2^{k_X} E[X_i]\right) \cdot \left(2^{k_Y} E[Y_i]\right)
      = \left( 2^{k_X} \cdot \frac{E[X]}{2^{k_X}} \right) \cdot \left( 2^{k_Y} \cdot \frac{E[Y]}{2^{k_Y}} \right) \\
     &= E[X] E[Y].
\end{aligned}$$

若 $E[X]=x, E[Y]=y$，则 $E[Z]=x y$。

---

## 乘法对表征空间的影响

### 命题 16（乘法表征空间）

设 $\mathbf{X} = (m_X, k_X, \{X_i\})$ 与 $\mathbf{Y} = (m_Y, k_Y, \{Y_i\})$ 独立，其乘积为 $\mathbf{Z} = (m_Z, k_Z, \{Z_i\})$。令 $\alpha_X, \alpha_Y$ 分别为分量的编码精度，则 $\mathbf{Z}$ 的表征值 $Z$ a.s. 取值于如下集合：

$$\{ z \cdot (\alpha_X \alpha_Y \cdot L) \mid z \in \mathbb{Z},\ 0 \le z \le L(2^{m_X}-1)(2^{m_Y}-1) \}
\subset \mathcal{S}_Z = \{ z \cdot (\alpha_X \alpha_Y \cdot L) \mid z \in \mathbb{Z},\ 0 \le z \le L(2^{m_Z}-1) \}.$$

**证明：**

根据 $\mathbf{Z}$ 的表征值定义，

$$Z = \frac{2^{k_Z}}{L} \sum_{i=1}^L Z_i = \frac{2^{k_X + k_Y}}{L} \sum_{i=1}^L X_i Y_i.$$

由编码精度定义 $\alpha_X = 2^{k_X}/L,\ \alpha_Y = 2^{k_Y}/L$，上式可改写为

$$Z = \frac{\alpha_X L \cdot \alpha_Y L}{L} \sum_{i=1}^L X_i Y_i = (\alpha_X \alpha_Y \cdot L) \sum_{i=1}^L X_i Y_i.$$

由于 $X_i, Y_i$ 分别为 $m_X, m_Y$ 位整数，其积 $X_i Y_i$ 亦为非负整数。令 $z = \sum_{i=1}^L X_i Y_i$，则 $z$ 的取值范围为 $[0, L(2^{m_X}-1)(2^{m_Y}-1)]$ 之间的整数。

因此，$Z$ 构成的集合是以 $\alpha_Z = \alpha_X \alpha_Y \cdot L$ 为步长的等差数列。

### 命题 17（精度退化）

乘法运算后，结果的编码精度 $\alpha_Z$ 与分量精度满足：

$$\alpha_Z = L \cdot \alpha_X \alpha_Y,$$

即相对于理想的 $\alpha_X \alpha_Y$，HSN 的乘法引入了因子为 $L$ 的编码精度损失。

**证明：**

理想情况下，两个数相乘的编码精度应为各自精度的积。然而在 HSN 框架下

$$\alpha_Z = \frac{2^{k_Z}}{L} = \frac{2^{k_X + k_Y}}{L},$$

而

$$\alpha_X \alpha_Y = \frac{2^{k_X + k_Y}}{L^2},$$

显然有 $\alpha_Z = L \cdot (\alpha_X \alpha_Y)$。这意味着在相同的脉冲长度 $L$ 下，乘法运算会导致表征空间的分辨率稀疏化。

---

## 乘法对表征值方差的影响

### 命题 18（乘法方差公式）

设独立 HSN $\mathbf{X}, \mathbf{Y}$ 的表征值期望分别为 $E X, E Y$，方差分别为 $\operatorname{Var} X, \operatorname{Var} Y$，则乘积 $\mathbf{Z}$ 的表征值 $Z$ 的方差满足：

$$\operatorname{Var} Z = L \cdot \operatorname{Var} X \cdot \operatorname{Var} Y + (E X)^2 \cdot \operatorname{Var} Y + (E Y)^2 \cdot \operatorname{Var} X.$$

**证明：**

首先考察单个采样点 $Z_i = X_i Y_i$ 的二阶矩。由 $X_i, Y_i$ 独立性得

$$E[Z_i^2] = E[X_i^2 Y_i^2] = E[X_i^2] E[Y_i^2],$$

代入方差定义式 $E[Y^2] = \operatorname{Var} Y + E[Y]^2$ 有

$$\begin{aligned}
E[Z_i^2] &= (\operatorname{Var} X_i + E[X_i]^2)(\operatorname{Var} Y_i + E[Y_i]^2) \\
         &= \operatorname{Var} X_i \operatorname{Var} Y_i + E[X_i]^2 \operatorname{Var} Y_i + E[Y_i]^2 \operatorname{Var} X_i + E[X_i]^2 E[Y_i]^2,
\end{aligned}$$

进而得到单点方差

$$\begin{aligned}
\operatorname{Var} Z_i &= E[Z_i^2] - (E[X_i]E[Y_i])^2 \\
&= \operatorname{Var} X_i \operatorname{Var} Y_i + E[X_i]^2 \operatorname{Var} Y_i + E[Y_i]^2 \operatorname{Var} X_i.
\end{aligned}$$

根据表征值方差与单点方差的关系 $\operatorname{Var} Z = \frac{2^{2k_Z}}{L} \operatorname{Var} Z_i$ 得到

$$\operatorname{Var} Z = \frac{2^{2k_X + 2k_Y}}{L} \left( \operatorname{Var} X_i \operatorname{Var} Y_i + E[X_i]^2 \operatorname{Var} Y_i + E[Y_i]^2 \operatorname{Var} X_i \right).$$

注意到 $\operatorname{Var} X = \frac{2^{2k_X}}{L} \operatorname{Var} X_i$ 以及 $E X = 2^{k_X} E[X_i]$，代入上式进行整理即有

$$\begin{aligned}
\operatorname{Var} Z &= L \cdot \left(\frac{2^{2k_X}}{L} \operatorname{Var} X_i\right) \cdot \left(\frac{2^{2k_Y}}{L} \operatorname{Var} Y_i\right) \\
&\quad + \left(2^{k_X} E[X_i]\right)^2 \cdot \left(\frac{2^{2k_Y}}{L} \operatorname{Var} Y_i\right) \\
&\quad + \left(2^{k_Y} E[Y_i]\right)^2 \cdot \left(\frac{2^{2k_X}}{L} \operatorname{Var} X_i\right) \\
&= L \operatorname{Var} X \operatorname{Var} Y + (E X)^2 \operatorname{Var} Y + (E Y)^2 \operatorname{Var} X.
\end{aligned}$$

通过命题18，我们可以观察到 HSN 乘法误差的两个组成部分：

- **耦合项**（$L \cdot \operatorname{Var} X \cdot \operatorname{Var} Y$）：这是乘法特有的高阶误差项。该项带有系数 $L$，这意味着如果两个操作数的方差都较大，乘积的波动会因为脉冲长度的放大作用而剧烈增加；
- **权重缩放项**（$(E X)^2 \operatorname{Var} Y + (E Y)^2 \operatorname{Var} X$）：这一部分描述了操作数的数值大小对另一方波动的放大作用。若 $x$ 或 $y$ 较大，则会将对方的统计噪声线性地放大到结果中。

---

# 比例加法

## 定义 10（比例加法）

设 HSN $\mathbf{X}, \mathbf{Y}$ 脉冲长度均为 $L$，记为

$$\mathbf{X} = (m_X, k_X, \{X_i\}), \quad \mathbf{Y} = (m_Y, k_Y, \{Y_i\}).$$

为简化硬件实现，设 $m_X = m_Y = m$ 且 $k_X = k_Y = k$。定义比例加法 $(m_Z, k_Z, \{Z_i\}) = \mathbf{Z} = \mathbf{X} \oplus \mathbf{Y}$ 如下：

- $m_Z = m$；
- $k_Z = k + 1$；
- $Z_i = X_i + Y_i,\ \forall i \in \{1, 2, \dots, L\}$。

和乘法不同，在定义10中不要求两个运算 HSN 是独立的，因为非独立的加法运算也满足无偏性的要求。

## 命题 19（比例加法封闭性）

由定义10定义的 $\mathbf{Z}$ 仍然是 HSN。

**证明：**

1. **位宽约束**：由于 $X_i, Y_i$ 均为 $m$ 位整数，其最大值为 $2^m - 1$。则 $Z_i = X_i + Y_i \le 2(2^m - 1) = 2^{m+1} - 2$。注意到虽然 $Z_i$ 可能超过 $m$ 位，但在 HSN 定义中，表征上限由 $m$ 和 $k$ 共同决定。在比例加法中，$k_Z = k + 1$ 实际上完成了对数值的"空间稀释"。从硬件存储角度看，$Z_i$ 仅需 $m+1$ 位存储，或通过截断/饱和处理保持在 $m$ 位（若 $m$ 足够大）。
2. **i.i.d. 性质**：由 $X_i, Y_i$ 的独立性及同分布性，其和序列 $\{Z_i\}$ 显然满足独立同分布。

## 命题 20（加法无偏性）

比例加法满足

$$E[Z] = \frac{E[X] + E[Y]}{2}.$$

**证明：**

根据表征值定义，

$$\begin{aligned}
E[Z] &= \frac{2^{k_Z}}{L} \sum_{i=1}^L E[Z_i] = \frac{2^{k+1}}{L} \sum_{i=1}^L (E[X_i] + E[Y_i]) \\
     &= 2 \cdot \frac{\frac{2^k}{L} \sum_{i=1}^L E[X_i] + \frac{2^k}{L} \sum_{i=1}^L E[Y_i]}{2}.
\end{aligned}$$

由于 $E[X] = 2^k E[X_i]$ 且 $E[Y] = 2^k E[Y_i]$，代入得

$$E[Z] = \frac{E[X] + E[Y]}{2}.$$

## 命题 21（比例加法方差）

如果比例加法的运算数 $\mathbf{X}, \mathbf{Y}$ 独立，那么比例加法结果的方差满足

$$\operatorname{Var} Z = 4 (\operatorname{Var} X + \operatorname{Var} Y).$$

**证明：**

$$\operatorname{Var} Z = \frac{2^{2k_Z}}{L} \operatorname{Var}(Z_1) = \frac{2^{2k + 2}}{L} \operatorname{Var}(X_1 + Y_1).$$

由于 $X_1, Y_1$ 独立，方差具有可加性：

$$\operatorname{Var} Z = 4 \cdot \frac{2^{2k}}{L} (\operatorname{Var} X_1 + \operatorname{Var} Y_1) = 4 (\sigma_X^2 + \sigma_Y^2).$$

## 命题 22（比例加法渐近分布）

当 $L \to \infty$ 时，比例加法的结果满足

$$\sqrt{L}(Z - (\mu_X + \mu_Y)) \overset{d}{\longrightarrow} \mathcal{N}(0, 4(\sigma_{X_1}^2 + \sigma_{Y_1}^2)).$$

**证明：**

由 $X, Y$ 独立性及 Levy-Lindeberg 中心极限定理直接推导

$$\sqrt{L}(X + Y - (\mu_X + \mu_Y)) \overset{d}{\longrightarrow} \mathcal{N}(0, \sigma_{X_1}^2 + \sigma_{Y_1}^2).$$

由于 $Z$ 的定义中系数 $2^{k_Z}$ 比 $X, Y$ 的 $2^k$ 大一倍，即 $Z = 2(\overline{X}_L + \overline{Y}_L)$，故其方差项叠加 4 倍系数。

"""
探索 BTH 内部分解对单时刻 Shannon 熵的影响
方向1: 最大熵分解策略

问题: 给定 (m, k, x)，在所有满足 sum(2^j * x_j) = x, 0 <= x_j < 2^k
的合法分解中，找到使 H(X_i) 最大的那个。
"""

import itertools
import math
from collections import defaultdict
from typing import List, Tuple, Dict
import json


def all_decompositions(x: int, m: int, k: int) -> List[Tuple[int, ...]]:
    """
    枚举所有合法的 BTH 内部分解 {x_j}_{j=0}^{m-1}，
    满足 sum(2^j * x_j) = x 且 0 <= x_j < 2^k。
    
    使用递归搜索 + 剪枝。
    """
    max_val = 2**k - 1
    decompositions = []
    
    def dfs(idx: int, remaining: int, current: List[int]):
        if idx == m - 1:
            # 最后一位: 2^(m-1) * x_{m-1} = remaining
            weight = 2 ** (m - 1)
            if remaining % weight == 0:
                x_last = remaining // weight
                if 0 <= x_last <= max_val:
                    decompositions.append(tuple(current + [x_last]))
            return
        
        weight = 2 ** idx
        # x_j 的范围
        max_xj = min(max_val, remaining // weight)
        for xj in range(max_xj + 1):
            dfs(idx + 1, remaining - weight * xj, current + [xj])
    
    dfs(0, x, [])
    return decompositions


def compute_gaps_and_values(xjs: Tuple[int, ...], m: int, k: int) -> Tuple[List[int], List[int], List[int]]:
    """
    给定分量 {x_j}，计算：
    - 排序后的 x_j 值
    - 间隙 {Delta_r}
    - 每个间隙对应的 X_i 取值 {v_r}
    """
    # 创建 (j, x_j) 对，按 x_j 排序
    indexed = list(enumerate(xjs))  # [(0, x_0), (1, x_1), ..., (m-1, x_{m-1})]
    indexed.sort(key=lambda p: p[1])  # 按 x_j 值升序
    
    sorted_x = [p[1] for p in indexed]  # x_{pi(0)}, x_{pi(1)}, ..., x_{pi(m-1)}
    sorted_j = [p[0] for p in indexed]  # pi(0), pi(1), ..., pi(m-1)
    
    # 计算间隙
    gaps = []
    gaps.append(sorted_x[0])  # Delta_0 = x_{pi(0)} - 0
    for r in range(1, m):
        gaps.append(sorted_x[r] - sorted_x[r-1])
    gaps.append(2**k - sorted_x[-1])  # Delta_m = 2^k - x_{pi(m-1)}
    
    # 计算每个间隙区间的 v_r 值
    # 区间 I_0: R_i < x_{pi(0)} -> 所有 x_j > 0... 不对
    # 区间 I_r: x_{pi(r-1)} <= R_i < x_{pi(r)}
    #   对于 x_j <= x_{pi(r-1)}：指示函数 = 0
    #   对于 x_j >= x_{pi(r)}：指示函数 = 1
    # 所以 v_r = sum_{j: x_j >= x_{pi(r)}} 2^j
    
    values = []
    for r in range(m + 1):
        if r == 0:
            # I_0 = [0, x_{pi(0)}): 所有指示函数 = 1
            threshold = -1  # 所有 x_j >= 0 都是 1
        elif r == m:
            # I_m = [x_{pi(m-1)}, 2^k): 所有指示函数 = 0
            v = 0
            values.append(v)
            continue
        else:
            threshold = sorted_x[r-1]
        
        v = 0
        for j in range(m):
            if xjs[j] > threshold or (r == 0 and xjs[j] >= 0):
                v += 2**j
        values.append(v)
    
    return gaps, values, sorted_x


def entropy_from_gaps(gaps: List[int], k: int) -> float:
    """从间隙计算单时刻 Shannon 熵 H(X_i)"""
    total = 2**k
    H = 0.0
    for d in gaps:
        if d > 0:
            p = d / total
            H -= p * math.log2(p)
    return H


def max_entropy_bound(m: int) -> float:
    """理论上界：log2(2^m) = m bits"""
    return m


def max_entropy_given_mu(mu: float, m: int) -> float:
    """
    命题5：固定期望 mu 下的最大熵（Gibbs分布）
    这里用数值求解 t 的方程：
    mu = t/(1-t) - 2^m * t^{2^m} / (1 - t^{2^m})

    对于 t ∈ (0, ∞)，mu 从 0 单调递增到 2^m-1。
    t < 1 对应 mu < (2^m-1)/2; t > 1 对应 mu > (2^m-1)/2。
    """
    N = 2**m
    if mu <= 0:
        return 0.0
    if mu >= N - 1:
        return 0.0

    midpoint = (N - 1) / 2

    def f(t):
        if abs(t - 1.0) < 1e-15:
            # 极限: mu → (N-1)/2
            return midpoint - mu
        tn = t ** N
        return t / (1 - t) - N * tn / (1 - tn) - mu

    # 二分搜索
    if mu <= midpoint:
        lo, hi = 1e-12, 1.0 - 1e-12
    else:
        lo, hi = 1.0 + 1e-12, 1e6

    for _ in range(80):
        mid = (lo + hi) / 2
        fm = f(mid)
        if fm > 0:
            if mu <= midpoint:
                hi = mid
            else:
                lo = mid
        else:
            if mu <= midpoint:
                lo = mid
            else:
                hi = mid

    t = (lo + hi) / 2

    # H(mu) = -mu log2(t) + log2(Z)
    if abs(t - 1.0) < 1e-10:
        Z = float(N)
    else:
        Z = (1 - t**N) / (1 - t)
    H = -mu * math.log2(t) + math.log2(Z)
    return H


def analyze_case(m: int, k: int, x: int, verbose: bool = True) -> dict:
    """分析单个 (m, k, x) 的所有分解"""
    decomps = all_decompositions(x, m, k)
    
    if verbose:
        print(f"\n{'='*60}")
        print(f"m={m}, k={k}, x={x}, 总分解数={len(decomps)}")
        print(f"mu = E[X_i] = x / 2^k = {x / 2**k:.4f}")
        print(f"理论上界 H_max = m = {m} bits")
        try:
            H_gibbs = max_entropy_given_mu(x / 2**k, m)
            print(f"命题5边界 H(mu) = {H_gibbs:.4f} bits (Gibbs)")
        except Exception as e:
            H_gibbs = None
            print(f"命题5边界: 无法计算 ({e})")
        print(f"log2(m+1) = {math.log2(m+1):.4f} bits (均匀间隙时的熵)")
        print(f"{'='*60}")
    else:
        try:
            H_gibbs = max_entropy_given_mu(x / 2**k, m)
        except Exception:
            H_gibbs = None
    
    results = []
    for xjs in decomps:
        gaps, values, sorted_x = compute_gaps_and_values(xjs, m, k)
        H = entropy_from_gaps(gaps, k)
        results.append({
            'xjs': list(xjs),
            'sorted_x': sorted_x,
            'gaps': gaps,
            'values': values,
            'H': H,
        })
    
    results.sort(key=lambda r: r['H'], reverse=True)
    
    if verbose and results:
        print(f"\n--- 熵最大的 {min(3, len(results))} 个分解 ---")
        for i, r in enumerate(results[:3]):
            print(f"\n  #{i+1}: H = {r['H']:.4f} bits")
            print(f"  x_j  = {r['xjs']}")
            print(f"  sorted = {r['sorted_x']}")
            print(f"  gaps   = {r['gaps']}")
            print(f"  values = {r['values']}")
        
        if len(results) > 3:
            print(f"\n--- 熵最小的 {min(3, len(results))} 个分解 ---")
            for i, r in enumerate(results[-3:]):
                print(f"\n  #倒数{3-i}: H = {r['H']:.4f} bits")
                print(f"  x_j  = {r['xjs']}")
                print(f"  sorted = {r['sorted_x']}")
                print(f"  gaps   = {r['gaps']}")
        
        # 熵的分布统计
        entropies = [r['H'] for r in results]
        print(f"\n--- 熵的分布 ---")
        print(f"  最大值: {max(entropies):.4f} bits")
        print(f"  最小值: {min(entropies):.4f} bits")
        print(f"  平均值: {sum(entropies)/len(entropies):.4f} bits")
        print(f"  标准差: {(sum((h - sum(entropies)/len(entropies))**2 for h in entropies)/len(entropies))**0.5:.4f} bits")
    
    return {
        'm': m, 'k': k, 'x': x,
        'mu': x / 2**k,
        'n_decomps': len(decomps),
        'H_gibbs': H_gibbs,
        'max_H': results[0]['H'] if results else 0,
        'min_H': results[-1]['H'] if results else 0,
        'top_decomps': results[:3] if results else [],
    }


def study_equal_gap_feasibility(m: int, k: int):
    """
    研究等间隙分解的可达性：
    对于每个置换 pi，计算等间隙分解能表达的 x 值集合。
    """
    print(f"\n{'='*60}")
    print(f"等间隙分解可达性分析: m={m}, k={k}")
    print(f"{'='*60}")
    
    if (2**k) % (m + 1) == 0:
        Delta = 2**k // (m + 1)
        print(f"m+1={m+1} 整除 2^k={2**k}，精确等间隙可能: Delta={Delta}")
    else:
        print(f"m+1={m+1} 不整除 2^k={2**k}，无法实现精确等间隙")
        print(f"最接近的: floor={2**k // (m+1)}, ceil={2**k // (m+1) + 1}")
        return
    
    # 排序后的 x 值: Delta, 2*Delta, ..., m*Delta
    sorted_vals = [(j + 1) * Delta for j in range(m)]
    print(f"排序后 x 值: {sorted_vals}")
    
    # 对于每种置换（分配 sorted_vals 到权重位置），计算 x
    x_values = set()
    x_to_pi = defaultdict(list)
    
    weights = [2**j for j in range(m)]
    
    for perm in itertools.permutations(range(m)):
        # perm[j] = 分配到权重 2^j 的值在 sorted_vals 中的索引
        x = sum(weights[j] * sorted_vals[perm[j]] for j in range(m))
        x_values.add(x)
        x_to_pi[x].append(perm)
    
    print(f"\n可达的 x 值数量: {len(x_values)} / 理论最大 {math.factorial(m)}")
    print(f"总状态数: {2**(m+k) - 2**k + 1}")
    print(f"\n可达的 x 值列表 (前20个):")
    for i, x in enumerate(sorted(x_values)[:20]):
        print(f"  x={x} (mu={x/2**k:.4f})")
    if len(x_values) > 20:
        print(f"  ... 共 {len(x_values)} 个")
    
    return list(sorted(x_values))


# ============================================================
# 主分析
# ============================================================

if __name__ == '__main__':
    # ---- 案例1: 论文中的例子 ----
    # x=61, m=3, k=4, 论文中使用的分解: x_0=5, x_1=12, x_2=8
    print("\n" + "="*70)
    print("案例1: 论文例子 (x=61, m=3, k=4)")
    print("论文中使用的分解: x_0=5, x_1=12, x_2=8")
    print("="*70)
    
    # 直接计算论文分解的熵
    xjs_paper = (5, 12, 8)
    gaps, values, sorted_x = compute_gaps_and_values(xjs_paper, m=3, k=4)
    H_paper = entropy_from_gaps(gaps, k=4)
    print(f"\n论文分解的熵: H = {H_paper:.4f} bits")
    print(f"  x_j = {list(xjs_paper)}")
    print(f"  sorted = {sorted_x}")
    print(f"  gaps = {gaps}")
    print(f"  values = {values}")
    
    analyze_case(m=3, k=4, x=61)
    
    # ---- 等间隙可达性 ----
    study_equal_gap_feasibility(m=3, k=4)
    
    # ---- 案例2: 更大的 m ----
    # m=4, k=4, 随机选几个 x 分析
    print("\n" + "="*70)
    print("案例2: m=4, k=4, x=100")
    print("="*70)
    analyze_case(m=4, k=4, x=100)
    
    # ---- 案例3: 观察熵和间隙均匀度的关联 ----
    print("\n" + "="*70)
    print("案例3: m=3, k=4, x=30 (中间值)")
    print("="*70)
    analyze_case(m=3, k=4, x=30)
    
    print("\n" + "="*70)
    print("案例3b: m=3, k=4, x=8 (小值)")
    print("="*70)
    analyze_case(m=3, k=4, x=8)
    
    # ---- 汇总：扫描多个 x 值 ----
    print("\n" + "="*70)
    print("汇总: m=3, k=4, 扫描 x in [0, 56] 熵的上下界")
    print("="*70)
    
    summary = []
    for x in range(0, 57, 4):  # 抽样
        result = analyze_case(m=3, k=4, x=x, verbose=False)
        summary.append(result)
        print(f"  x={x:3d}  mu={result['mu']:.3f}  n_decomp={result['n_decomps']:4d}  "
              f"H_max={result['max_H']:.4f}  H_min={result['min_H']:.4f}  "
              f"H_gibbs={result['H_gibbs']:.4f}" if result['H_gibbs'] else "")
    
    # 保存汇总结果
    with open('/Users/aytony/Projects/bachlor-graduate-project/final-essay/brainstorm/entropy_scan.json', 'w') as f:
        json.dump(summary, f, indent=2, default=str)
    print(f"\n汇总结果已保存到 entropy_scan.json")

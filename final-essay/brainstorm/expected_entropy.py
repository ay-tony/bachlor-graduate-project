"""
分析：在 x 均匀分布假设下，BTH 最优分解的期望香农熵
"""
import itertools, math, json
from collections import defaultdict

def all_decompositions(x, m, k):
    max_val = 2**k - 1
    decomps = []
    def dfs(idx, remaining, current):
        if idx == m - 1:
            weight = 2**(m-1)
            if remaining % weight == 0:
                x_last = remaining // weight
                if 0 <= x_last <= max_val:
                    decomps.append(tuple(current + [x_last]))
            return
        weight = 2**idx
        for xj in range(min(max_val, remaining // weight) + 1):
            dfs(idx+1, remaining - weight*xj, current + [xj])
    dfs(0, x, [])
    return decomps

def entropy_of_decomp(xjs, m, k):
    indexed = list(enumerate(xjs))
    indexed.sort(key=lambda p: p[1])
    sorted_x = [p[1] for p in indexed]
    gaps = [sorted_x[0]]
    for r in range(1, m):
        gaps.append(sorted_x[r] - sorted_x[r-1])
    gaps.append(2**k - sorted_x[-1])
    H = 0.0
    for d in gaps:
        if d > 0:
            p = d / (2**k)
            H -= p * math.log2(p)
    return H, gaps

def max_entropy_for_x(x, m, k):
    """对给定的 x，在所有合法分解中找到最大熵"""
    decomps = all_decompositions(x, m, k)
    if not decomps:
        return None, None
    best_H = -1
    best_decomp = None
    for xjs in decomps:
        H, _ = entropy_of_decomp(xjs, m, k)
        if H > best_H:
            best_H = H
            best_decomp = xjs
    return best_H, best_decomp

def expected_max_entropy(m, k):
    """计算均匀 x 分布下的期望最大熵"""
    M = 2**(m+k) - 2**k
    total_H = 0.0
    n_valid = 0
    
    results = []
    
    for x in range(M + 1):
        H_max, _ = max_entropy_for_x(x, m, k)
        if H_max is not None:
            total_H += H_max
            n_valid += 1
            results.append((x, H_max))
    
    expected_H = total_H / n_valid if n_valid > 0 else 0
    return expected_H, n_valid, results

# ============================================================
# 主计算
# ============================================================

print("=" * 70)
print("期望最大熵分析：x 均匀分布下的 BTH 最优分解")
print("=" * 70)

# 案例: m=3, k=4
m, k = 3, 4
M = 2**(m+k) - 2**k
H_bound = math.log2(m+1)

print(f"\n参数: m={m}, k={k}")
print(f"x 范围: [0, {M}] (共 {M+1} 个值)")
print(f"理论上界: log2(m+1) = {H_bound:.4f} bits")
print(f"最大可能熵: m = {m} bits (命题3，2^m=8 个支点)")

expected_H, n_valid, results = expected_max_entropy(m, k)

print(f"\n--- 结果 ---")
print(f"有效 x 值数: {n_valid}")
print(f"期望最大熵: E[H_max] = {expected_H:.4f} bits")
print(f"与上界 log2(m+1) 的差距: {H_bound - expected_H:.4f} bits ({100*(H_bound-expected_H)/H_bound:.1f}%)")
print(f"与上界 m 的差距: {m - expected_H:.4f} bits ({100*(m-expected_H)/m:.1f}%)")

# 找到达到上界的 x 值
at_bound = [(x, H) for x, H in results if abs(H - H_bound) < 1e-10]
print(f"\n达到上界 log2(m+1) 的 x 值: {len(at_bound)}/{n_valid} ({100*len(at_bound)/n_valid:.1f}%)")
print(f"  x 值: {[x for x, _ in at_bound]}")

# 熵分布统计
Hs = [H for _, H in results]
Hs_sorted = sorted(Hs)
print(f"\n熵分布:")
print(f"  最小: {min(Hs):.4f} bits")
print(f"  25%分位: {Hs_sorted[len(Hs)//4]:.4f} bits")
print(f"  中位数: {Hs_sorted[len(Hs)//2]:.4f} bits")
print(f"  75%分位: {Hs_sorted[3*len(Hs)//4]:.4f} bits")
print(f"  最大: {max(Hs):.4f} bits")

# 熵的分桶直方图
print(f"\n熵值分桶:")
buckets = [0, 0.5, 1.0, 1.3, 1.5, 1.7, 1.85, 1.95, 2.0]
for i in range(len(buckets)-1):
    lo, hi = buckets[i], buckets[i+1]
    count = sum(1 for h in Hs if lo <= h < hi)
    bar = '█' * (count * 50 // max(1, len(Hs)))
    print(f"  [{lo:.1f}, {hi:.1f}): {count:4d} ({100*count/len(Hs):5.1f}%) {bar}")

# 也看 m=4, k=4 (如果计算量可接受)
print("\n" + "=" * 70)
print("m=4, k=4")
print("=" * 70)
m2, k2 = 4, 4
M2 = 2**(m2+k2) - 2**k2
H_bound2 = math.log2(m2+1)

print(f"x 范围: [0, {M2}] (共 {M2+1} 个值)")
print(f"理论上界: log2(m+1) = {H_bound2:.4f} bits")

expected_H2, n_valid2, results2 = expected_max_entropy(m2, k2)
print(f"\n有效 x 值数: {n_valid2}")
print(f"期望最大熵: E[H_max] = {expected_H2:.4f} bits")
print(f"与上界的差距: {H_bound2 - expected_H2:.4f} bits ({100*(H_bound2-expected_H2)/H_bound2:.1f}%)")
print(f"理论最大: m = {m2} bits, 差距: {m2 - expected_H2:.4f} bits ({100*(m2-expected_H2)/m2:.1f}%)")

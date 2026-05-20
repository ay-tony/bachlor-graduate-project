# 验证等间隙可达集合的基数 (m!) 和冲突情况
import itertools

def check_equal_gap_distinctness(m_max=8):
    """对每个 m，检查等间隙分解产生的 x 值是否全部互异"""
    for m in range(2, m_max + 1):
        weights = [2**j for j in range(m)]
        values = list(range(1, m + 1))
        
        sums = set()
        n_collisions = 0
        for perm in itertools.permutations(values):
            s = sum(w * v for w, v in zip(weights, perm))
            if s in sums:
                n_collisions += 1
            sums.add(s)
        
        n_unique = len(sums)
        n_total = len(list(itertools.permutations(values)))
        
        min_s = min(sums)
        max_s = max(sums)
        range_size = max_s - min_s + 1
        
        print(f"m={m}: {n_unique} unique / {n_total} total "
              f"| collisions={n_collisions} "
              f"| sum range=[{min_s}, {max_s}] ({range_size} values) "
              f"| {'ALL DISTINCT' if n_unique == n_total else 'COLLISIONS!'}")

if __name__ == '__main__':
    check_equal_gap_distinctness(10)

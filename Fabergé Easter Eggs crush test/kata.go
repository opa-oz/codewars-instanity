package kata

import (
	"math/big"
)

func Height(n, m *big.Int) *big.Int {
	zero := big.NewInt(0)
	one := big.NewInt(1)

	if zero.Cmp(m) == 0 || zero.Cmp(n) == 0 {
		return zero
	}

	ni := int(n.Int64())
	mi := int(m.Int64())

	dp := make([][]*big.Int, ni+1)
	for index := range dp {
		dpr := make([]*big.Int, mi+1)
		dp[index] = dpr
	}

	for tries := 1; tries < mi+1; tries++ {
		for eggs := 1; eggs < ni+1; eggs++ {
			left := dp[eggs-1][tries-1]
			right := dp[eggs][tries-1]

			if left == nil {
				left = zero
			}

			if right == nil {
				right = zero
			}

			var result1, result2 big.Int

			dp[eggs][tries] = result2.Add(one, result1.Add(left, right))
		}
	}

	return dp[ni][mi]
}

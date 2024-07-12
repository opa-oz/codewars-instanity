package main

func FindOdd(seq []int) int {
	storage := make(map[int]int)

	for _, v := range seq {
		if _, ok := storage[v]; ok {
			storage[v]++
		} else {
			storage[v] = 1
		}
	}

	for k, v := range storage {
		if v%2 != 0 {
			return k
		}
	}

	return 0 // your code here
}

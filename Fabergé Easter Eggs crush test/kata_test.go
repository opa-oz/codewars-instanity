package kata_test

import (
	"testing"

	. "github.com/opa-oz/codewars-insanity"
	"github.com/stretchr/testify/assert"

	"math/big"
)

func testerIntString(t *testing.T, a, b int64, c string) {
	assert.Equal(t, Height(big.NewInt(a), big.NewInt(b)).String(), c)
}
func testerInt(t *testing.T, a, b, c int64) {
	assert.Equal(t, Height(big.NewInt(a), big.NewInt(b)).String(), big.NewInt(c).String())
}

func TestInts(t *testing.T) {
	testerInt(t, 1, 3, 3)
	testerInt(t, 1, 51, 51)
	testerInt(t, 2, 1, 1)
	testerInt(t, 2, 20, 210)
	testerInt(t, 3, 20, 1350)
	testerInt(t, 4, 20, 6195)
	// testerInt(t, 19000, 19000, 1414)
}

func TestStrings(t *testing.T) {
	testerIntString(t, 310, 512, "13407798997994793023909825703579562145240298498207798340676479471840456202906831071791573160709230447579657844888754638680952175985107213464211003140484530")
	testerIntString(t, 30, 400, "1549835246319296875396604627597789530400430471")
	testerIntString(t, 494, 500, "3273390607896141870013189696827599152216642046043064789483291368096133796404674554883270092325904157150886684127560071009217256545885393053070689036899")
}

package kata_test

import (
	"testing"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

func TestFabergéEasterEggsCrushTest(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "FabergéEasterEggsCrushTest Suite")
}

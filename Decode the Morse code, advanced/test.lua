local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'
describe("Your solution", function()
    it("should decode simple morse code correctly", function()
        assert.equal("HEY JUDE", solution.decodeMorse(".... . -.--   .--- ..- -.. ."))
    end)
    --
    it("should decode simple bitstrings correctly", function()
        assert.equal(".... . -.--   .--- ..- -.. .",
            solution.decodeBits(
                "1100110011001100000011000000111111001100111111001111110000000000000011001111110011111100111111000000110011001111110000001111110011001100000011"))
                --"101010.."
        -- .   .   .   .       .       -  -    .
    end)
    --
    it("Should decode a simple message correctly", function()
        assert.equal("HEY JUDE",
            solution.decodeMorse(solution.decodeBits(
                "1100110011001100000011000000111111001100111111001111110000000000000011001111110011111100111111000000110011001111110000001111110011001100000011")))
    end)

    it("problematic", function()
        assert.equal('..', solution.decodeBits("101"))
    end)

    it("problematic2", function()
        assert.equal('. .', solution.decodeBits("10001"))
    end)

    it("problematic3", function()
        assert.equal('.', solution.decodeBits("111"))
    end)
    it("problematic4", function()
        assert.equal('--', solution.decodeBits("1110111"))
    end)
end)

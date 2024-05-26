local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'

describe("decode_morse_code", function()
    it("sample test", function()
        local input = ".... . -.--   .--- ..- -.. ."
        local expected = "HEY JUDE"
        local actual = solution.decode_morse_code(input)

        assert.are.same(expected, actual)
    end)
end)

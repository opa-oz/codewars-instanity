local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'

describe("thirt", function()
    local function testequal(n, expect)
        local actual = solution.thirt(n)
        assert.are.same(expect, actual)
    end

    it("basic tests", function()
        testequal(1234567, 87)
        testequal(1219890, 9)
        testequal(8529, 79)
        testequal(85299258, 31)
    end)
end)

local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'

describe("Sample Test Cases", function()
    it("tests", function()
        assert.are.same(23, solution.solution(10))
    end)
end)

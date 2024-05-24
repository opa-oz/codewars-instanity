local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local sum_two_smallest_numbers = require 'solution'

describe("Your function", function()
    it("13", function()
        assert.are.same(13, sum_two_smallest_numbers { 5, 8, 12, 19, 22 })
    end)
    it("6", function()
        assert.are.same(6, sum_two_smallest_numbers { 15, 28, 4, 2, 43 })
    end)
    it("10", function()
        assert.are.same(10, sum_two_smallest_numbers { 3, 87, 45, 12, 7 })
    end)
    it("24", function()
        assert.are.same(24, sum_two_smallest_numbers { 23, 71, 33, 82, 1 })
    end)
    it("16", function()
        assert.are.same(16, sum_two_smallest_numbers { 52, 76, 14, 12, 4 })
    end)
end)

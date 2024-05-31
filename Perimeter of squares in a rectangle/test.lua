local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'
describe("Perimeter of squares in a rectangle", function()
    it("test1", function()
        assert.equal(80, solution.perimeter(5))
    end)
    it("test2", function()
        assert.equal(216, solution.perimeter(7))
    end)
    it("test3", function()
        assert.equal(114624, solution.perimeter(20))
    end)
    it("test4", function()
        assert.equal(396779412379021984, solution.perimeter(80))
    end)
end)

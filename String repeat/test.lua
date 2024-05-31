local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'
describe("Example Tests", function()
    it("should be equal to ", function()
        assert.are.same("aaaa", solution.repeatStr(4, "a"))
        assert.are.same("hello hello hello ", solution.repeatStr(3, "hello "))
        assert.are.same("abcabc", solution.repeatStr(2, "abc"))
    end)
end)

local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'
describe("Sample Tests", function()
    it("",
        function() assert.are.same({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, josephus({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, 1)) end)
    it("",
        function() assert.are.same({ 2, 4, 6, 8, 10, 3, 7, 1, 9, 5 }, josephus({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, 2)) end)
    it("",
        function()
            assert.are.same({ 'e', 's', 'W', 'o', 'C', 'd', 'r', 'a' },
                josephus({ "C", "o", "d", "e", "W", "a", "r", "s" }, 4))
        end)
    it("", function() assert.are.same({ 3, 6, 2, 7, 5, 1, 4 }, josephus({ 1, 2, 3, 4, 5, 6, 7 }, 3)) end)
    it("", function() assert.are.same({}, josephus({}, 3)) end)
end)

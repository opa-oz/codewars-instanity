local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'
describe("RomanEncoder", function()
    it("MMMCMXCIX", function()
        assert.are.same("MMMCMXCIX", solution.romanEncoder(3999))
    end)
    it("M", function()
        assert.are.same("M", solution.romanEncoder(1000))
    end)
    it("IV", function()
        assert.are.same("IV", solution.romanEncoder(4))
    end)
    it("I", function()
        assert.are.same("I", solution.romanEncoder(1))
    end)
    it("MMVIII", function()
        assert.are.same("MMVIII", solution.romanEncoder(2008))
    end)
    it("MMMLXXXIII", function()
        assert.are.same("MMMLXXXIII", solution.romanEncoder(3083))
    end)
end)

local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require "solution"

describe("RGB To Hex", function()
    it("ADFF2F", function() assert.are.same("ADFF2F", solution.rgb(173, 255, 47)) end)
    it("FFFFFF", function() assert.are.same("FFFFFF", solution.rgb(300, 255, 255)) end)
    it("090D05", function() assert.are.same("090D05", solution.rgb(9, 13, 5)) end)
    it("000000", function() assert.are.same("000000", solution.rgb(0, 0, -20)) end)
    it("000000", function() assert.are.same("000000", solution.rgb(0, 0, 0)) end)
end)

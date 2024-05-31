local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local rectangleRotation = require 'solution'
describe("Rectangle Rotation", function()
    it("23", function() assert.are.same(23, rectangleRotation(6, 4)) end)
    it("65", function() assert.are.same(65, rectangleRotation(30, 2)) end)
    it("49", function() assert.are.same(49, rectangleRotation(8, 6)) end)
    it("333", function() assert.are.same(333, rectangleRotation(16, 20)) end)
end)

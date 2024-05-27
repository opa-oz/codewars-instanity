local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'

describe("Direction Reduction", function()
  it("Basic Tests", function()
    assert.are.same({"WEST"}, solution.dirReduc({"NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"}))
    assert.are.same({}, solution.dirReduc({"NORTH","SOUTH","SOUTH","EAST","WEST","NORTH"}))
    assert.are.same({"NORTH"}, solution.dirReduc({"NORTH","SOUTH","SOUTH","EAST","WEST","NORTH","NORTH"}))
    assert.are.same({"EAST", "NORTH"}, solution.dirReduc({"EAST", "EAST", "WEST", "NORTH", "WEST", "EAST", "EAST", "SOUTH", "NORTH", "WEST"}))
    assert.are.same({"NORTH", "EAST"}, solution.dirReduc({"NORTH", "EAST", "NORTH", "EAST", "WEST", "WEST", "EAST", "EAST", "WEST", "SOUTH"}))
    assert.are.same({"NORTH", "WEST", "SOUTH", "EAST"}, solution.dirReduc({"NORTH", "WEST", "SOUTH", "EAST"}))
  end)
end)
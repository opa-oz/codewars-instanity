local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'

describe("Sample Tests", function()
  it("should pass sample tests", function()
    assert.are.same(0, solution.zeros(0))
    assert.are.same(1, solution.zeros(6))
    assert.are.same(7, solution.zeros(30))
  end)
end)

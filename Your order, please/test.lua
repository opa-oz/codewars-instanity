local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'
describe("Sample Test", function()
  it("", function() assert.are.same("Thi1s is2 3a T4est", order("is2 Thi1s T4est 3a")) end)
  it("", function() assert.are.same("Fo1r the2 g3ood 4of th5e pe6ople", order("4of Fo1r pe6ople g3ood th5e the2")) end)
  it("", function() assert.are.same("", order("")) end)
end)

local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local binary_array_to_number = require "solution"

describe("Fixed Tests", function()
  it("Basic Test Cases", function()
    assert.are.same(1, binary_array_to_number { 0, 0, 0, 1 }, "Testing for arr = { 0, 0, 0, 1 }")
    assert.are.same(2, binary_array_to_number { 0, 0, 1, 0 }, "Testing for arr = { 0, 0, 1, 0 }")
    assert.are.same(15, binary_array_to_number { 1, 1, 1, 1 }, "Testing for arr = { 1, 1, 1, 1 }")
    assert.are.same(6, binary_array_to_number { 0, 1, 1, 0 }, "Testing for arr = { 0, 1, 1, 0 }")
  end)
end)
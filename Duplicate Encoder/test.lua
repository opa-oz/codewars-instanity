local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

require "solution"

describe("Duplicate Encoder", function()
    it("(((", function() assert.are.same("(((", duplicate_encode("din")) end)
    it("()()()", function() assert.are.same("()()()", duplicate_encode("recede")) end)
    it(")())())", function() assert.are.same(")())())", duplicate_encode("Success"), "should ignore case") end)
    it("))((", function() assert.are.same("))((", duplicate_encode("(( @")) end)
end)

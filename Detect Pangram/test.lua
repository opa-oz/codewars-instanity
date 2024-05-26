local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local is_pangram = require "solution"

describe("Sample tests", function()
    it("should return true for a pangram", function()
        assert.are.same(true, is_pangram "The quick, brown fox jumps over the lazy dog!")
    end)
    it("should return false for not a pangram", function()
        assert.are.same(false, is_pangram "1bcdefghijklmnopqrstuvwxyz")
    end)
end)

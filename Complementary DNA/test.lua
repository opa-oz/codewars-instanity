local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local DNA_strand = require "solution"

describe("Fixed Tests", function()
    it("Basic Test Cases", function()
        assert.are.same("TTTT", DNA_strand("AAAA"))
        assert.are.same("TAACG", DNA_strand("ATTGC"))
        assert.are.same("CATA", DNA_strand("GTAT"))
    end)
end)

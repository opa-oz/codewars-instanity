local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local alphabet_position = require "solution"

describe("Fixed Tests", function()
    it("Basic Test Cases", function()
        assert.are.same("20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11",
            alphabet_position "The sunset sets at twelve o' clock.")
        assert.are.same("20 8 5 14 1 18 23 8 1 12 2 1 3 15 14 19 1 20 13 9 4 14 9 7 8 20",
            alphabet_position "The narwhal bacons at midnight.")
    end)
end)

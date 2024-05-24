local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local find_short = require "solution"

describe("Fixed Tests", function()
    it("bitcoin take over the world maybe who knows perhaps", function()
        assert.are.same(3, find_short("bitcoin take over the world maybe who knows perhaps"))
    end)
    it("turns out random test cases are easier than writing out basic ones", function()
        assert.are.same(3, find_short("turns out random test cases are easier than writing out basic ones"))
    end)
    it("lets talk about lua the best language", function()
        assert.are.same(3, find_short("lets talk about lua the best language"))
    end)
    it("i want to travel the world writing code one day", function()
        assert.are.same(1, find_short("i want to travel the world writing code one day"))
    end)
    it("Lets all go on holiday somewhere very cold", function()
        assert.are.same(2, find_short("Lets all go on holiday somewhere very cold"))
    end)
    it("Let's travel abroad shall we", function()
        assert.are.same(2, find_short("Let's travel abroad shall we"))
    end)
end)

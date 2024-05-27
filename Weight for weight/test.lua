local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'

function dotest(str, expected)
    assert.are.same(expected, solution.orderWeight(str))
end

describe("orderWeight Tests", function()
    it("", function() dotest("", "") end)
    it("103 123 4444 99 2000\", \"2000 103 123 4444 99",
        function()
            dotest("103 123 4444 99 2000", "2000 103 123 4444 99")
        end)
    it("2000 10003 1234000 44444444 9999 11 11 22 123",
        function()
            dotest("2000 10003 1234000 44444444 9999 11 11 22 123",
                "11 11 2000 10003 22 123 1234000 44444444 9999")
        end)
end)

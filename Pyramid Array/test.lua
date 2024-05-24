local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local pyramid = require 'solution'
function tester(n, exp)
    it("Testing for " .. n, function() assert.are.same(exp, pyramid(n)) end)
end

describe("basic tests", function()
    tester(0, {})
    tester(1, { { 1 } })
    tester(2, { { 1 }, { 1, 1 } })
    tester(3, { { 1 }, { 1, 1 }, { 1, 1, 1 } })
end)

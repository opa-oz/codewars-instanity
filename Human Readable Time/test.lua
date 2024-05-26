local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'

describe("Basic Tests", function()
    it("00:00:00", function() assert.are.same("00:00:00", solution.make_readable(0)) end)
    it("00:00:05", function() assert.are.same("00:00:05", solution.make_readable(5)) end)
    it("00:01:00", function() assert.are.same("00:01:00", solution.make_readable(60)) end)
    it("23:59:59", function() assert.are.same("23:59:59", solution.make_readable(86399)) end)
    it("99:59:59", function() assert.are.same("99:59:59", solution.make_readable(359999)) end)
end)

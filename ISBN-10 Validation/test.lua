local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'

describe("Sample tests", function()
    it('1112223339', function() assert.are.same(true, solution.valid_ISBN10 '1112223339') end)
    it('048665088X', function() assert.are.same(true, solution.valid_ISBN10 '048665088X') end)
    it('1293000000', function() assert.are.same(true, solution.valid_ISBN10 '1293000000') end)
    it('1234554321', function() assert.are.same(true, solution.valid_ISBN10 '1234554321') end)
    it('1234512345', function() assert.are.same(false, solution.valid_ISBN10 '1234512345') end)
    it('1293', function() assert.are.same(false, solution.valid_ISBN10 '1293') end)
    it('X123456788', function() assert.are.same(false, solution.valid_ISBN10 'X123456788') end)
    it('ABCDEFGHIJ', function() assert.are.same(false, solution.valid_ISBN10 'ABCDEFGHIJ') end)
    it('XXXXXXXXXX', function() assert.are.same(false, solution.valid_ISBN10 'XXXXXXXXXX') end)
    it('123456789T', function() assert.are.same(false, solution.valid_ISBN10 '123456789T') end)
    it('12345543210', function() assert.are.same(false, solution.valid_ISBN10 '12345543210') end)
end)

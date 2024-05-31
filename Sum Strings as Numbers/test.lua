local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local sumstrings = require 'solution'.sumstrings

describe("Example Tests", function()
  it("basic tests", function()
    assert.are.same('579', sumstrings('123', '456'))
  end)
end)

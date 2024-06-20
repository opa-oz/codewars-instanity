local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'

describe("balanceStatement", function()
    local function testing(a1, a2, expect)
        local actual = solution.inArray(a1, a2)
        assert.are.same(expect, actual)
    end
    it("basic tests", function()
        local a1 = { "live", "arp", "strong", "der", "ong", "arp", "arp", "live" }
        local a2 = { "lively", "alive", "harp", "sharp", "armstrong" }
        local r = { "arp", "live", "ong", "strong" }
        testing(a1, a2, r)

        a1 = { "arp", "mice", "bull" }
        a2 = { "lively", "alive", "harp", "sharp", "armstrong" }
        r = { "arp" }
        testing(a1, a2, r)

        a1 = { "cod", "code", "wars", "ewar", "ar" }
        a2 = {}
        r = {}
        testing(a1, a2, r)
    end)
    it("advanced test", function()
        local a1 = { "llus", "do", "er.", "is", "Cr", "do", "iat", "is" }
        local a2 = { "consectetur", "gravida", "massa", "a", "dolor", "id", "eget", "non", "Proin", "vitae", "Morbi",
            "nisi.", "vulputate", "hendrerit.", "gravida", "eleifend", "adipiscing" }
        local r = { "do", "is" }

        testing(a1, a2, r)
    end)
end)

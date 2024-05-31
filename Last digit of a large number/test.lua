local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require 'solution'
local function last_digit(n1, n2)
    return tonumber(solution.last_digit(n1, n2)) -- we accept both number and string as return value
end

describe("Example tests", function()
    it("4", function() assert.are.same(9, last_digit('7', '358')) end)
    it("4", function() assert.are.same(4, last_digit('4', '1')) end)
    it("6", function() assert.are.same(6, last_digit('4', '2')) end)
    it("9", function() assert.are.same(9, last_digit('9', '7')) end)
    it("0", function() assert.are.same(0, last_digit('10', '10000000000')) end)
    local n1 = '1606938044258990275541962092341162602522202993782792835301376'                               -- 2^200
    local n2 = '2037035976334486086268445688409378161051468393665936250636140449354381299763336706183397376' -- 2^300
    it("6", function() assert.are.same(6, last_digit(n1, n2)) end)
    it("7",
        function()
            assert.are.same(7,
                last_digit('3715290469715693021198967285016729344580685479654510946723',
                    '68819615221552997273737174557165657483427362207517952651'))
        end)
    for i = 1, 8 do
        it("" .. i .. "^0", function()
            assert.are.same(1, last_digit(tostring(i ^ i), '0'), 'x^0 must return 1')
        end)
    end
end)

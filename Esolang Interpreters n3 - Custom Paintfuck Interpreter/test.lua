local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local interpreter = require 'solution'

local function assertEquals(desc, expected, value)
    it(desc, function()
        assert.are.same(expected, value)
    end)
end

describe("examples", function()
    assertEquals("Your interpreter should initialize all cells in the datagrid to 0",
        "000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000",
        interpreter("*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*", 0, 6, 9));
    assertEquals("Your interpreter should adhere to the number of iterations specified",
        "111100\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000",
        interpreter("*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*", 7, 6, 9));
    assertEquals("Your interpreter should traverse the 2D datagrid correctly",
        "111100\r\n000010\r\n000001\r\n000010\r\n000100\r\n000000\r\n000000\r\n000000\r\n000000",
        interpreter("*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*", 19, 6, 9));
    assertEquals(
        "Your interpreter should traverse the 2D datagrid correctly for all of the \"n\", \"e\", \"s\" and \"w\" commands",
        "111100\r\n100010\r\n100001\r\n100010\r\n111100\r\n100000\r\n100000\r\n100000\r\n100000",
        interpreter("*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*", 42, 6, 9));
    assertEquals(
        "Your interpreter should terminate normally and return a representation of the final state of the 2D datagrid when all commands have been considered from left to right even if the number of iterations specified have not been fully performed",
        "111100\r\n100010\r\n100001\r\n100010\r\n111100\r\n100000\r\n100000\r\n100000\r\n100000",
        interpreter("*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*", 100, 6, 9));
    assertEquals("simple loop", "10000\r\n01000\r\n00000\r\n00000\r\n00000\r\n00000", interpreter("*[es*]", 5, 5, 6))
    assertEquals("toroidalBehaviour",
        "00011000\r\n00011000\r\n00011000\r\n11111111\r\n11111111\r\n00011000\r\n00011000\r\n00011000\r\n00011000\r\n00011000",
        interpreter("eee*s*s*s*w*w*w*w*w*w*w*n*n*n*n*n*n*n*n*n*e*e*e*e*e*e*e*s*s*s*s*s*", 1000, 8, 10))
    assertEquals("Your interpreter should should exhibit toroidal behaviour ;)",
        "01111\r\n11111\r\n11111\r\n11111\r\n11111\r\n11111", interpreter("*[es*]", 1000, 5, 6))
    assertEquals("Your interpreter should also work with nested loops", "11100\r\n11100\r\n11000\r\n11000\r\n11000",
        interpreter("*[s[e]*]", 49, 5, 5))
end)

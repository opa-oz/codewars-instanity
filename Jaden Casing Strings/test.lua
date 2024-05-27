local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local to_jaden_case = require "solution"

describe("Sample test", function()
    it("Simple text", function()
        local quote = "How can mirrors be real if our eyes aren't real"
        assert.are.same("How Can Mirrors Be Real If Our Eyes Aren't Real", to_jaden_case(quote))
    end)
    it("From line start", function()
        local quote = "most trees are blue"
        assert.are.same("Most Trees Are Blue", to_jaden_case(quote))
    end)
    it("Random string", function()
        local quote = "WLnEhPpExp Ur iOnACW ZZxkkP aWVWHiBPXQ ufAp fxltX pyNpWYzM zIRwqaXfXN sTaHqg Cz r CffzeElbe"
        assert.are.same("Wlnehppexp Ur Ionacw Zzxkkp Awvwhibpxq Ufap Fxltx Pynpwyzm Zirwqaxfxn Stahqg Cz R Cffzeelbe",
            to_jaden_case(quote))
    end)
end)

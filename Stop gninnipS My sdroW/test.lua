local solution = require 'solution'
local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it


describe("Stop gninnipS My sdroW!", function()
    it("Single word", function()
        assert.are.same("Welcome", solution.spin_words "emocleW")
        assert.are.same("to", solution.spin_words "to")
        assert.are.same("CodeWars", solution.spin_words "sraWedoC")
    end)

    it("Multiple words", function()
        assert.are.same("Hey fellow warriors", solution.spin_words "Hey wollef sroirraw")
        assert.are.same("This sentence is a sentence", solution.spin_words "This ecnetnes is a ecnetnes")
    end)
end)

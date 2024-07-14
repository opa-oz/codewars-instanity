local bst = require 'busted'
local describe = bst.describe
local assert = bst.assert
local it = bst.it

local solution = require('solution')

describe("Sample tests", function()
    it("size = 5", function()
        size = 5
        spiral = {
            { 1, 1, 1, 1, 1 },
            { 0, 0, 0, 0, 1 },
            { 1, 1, 1, 0, 1 },
            { 1, 0, 0, 0, 1 },
            { 1, 1, 1, 1, 1 },
        }

        print("Expected")
        for i = 1, size do
            for j = 1, size do
                io.write(spiral[i][j])
            end
            print()
        end
        print()
        print("Actual")
        solution.spiralize(5)
        assert.are.same({
            { 1, 1, 1, 1, 1 },
            { 0, 0, 0, 0, 1 },
            { 1, 1, 1, 0, 1 },
            { 1, 0, 0, 0, 1 },
            { 1, 1, 1, 1, 1 },
        }, solution.spiralize(5))
    end)

    it("size = 8", function()
        print("\n\n")
        size = 8
        spiral = {
            { 1, 1, 1, 1, 1, 1, 1, 1 },
            { 0, 0, 0, 0, 0, 0, 0, 1 },
            { 1, 1, 1, 1, 1, 1, 0, 1 },
            { 1, 0, 0, 0, 0, 1, 0, 1 },
            { 1, 0, 1, 0, 0, 1, 0, 1 },
            { 1, 0, 1, 1, 1, 1, 0, 1 },
            { 1, 0, 0, 0, 0, 0, 0, 1 },
            { 1, 1, 1, 1, 1, 1, 1, 1 },
        }
        print("Expected")
        for i = 1, size do
            for j = 1, size do
                io.write(spiral[i][j])
            end
            print()
        end
        print()
        print("Actual")
        solution.spiralize(8)
        assert.are.same({
            { 1, 1, 1, 1, 1, 1, 1, 1 },
            { 0, 0, 0, 0, 0, 0, 0, 1 },
            { 1, 1, 1, 1, 1, 1, 0, 1 },
            { 1, 0, 0, 0, 0, 1, 0, 1 },
            { 1, 0, 1, 0, 0, 1, 0, 1 },
            { 1, 0, 1, 1, 1, 1, 0, 1 },
            { 1, 0, 0, 0, 0, 0, 0, 1 },
            { 1, 1, 1, 1, 1, 1, 1, 1 },
        }, solution.spiralize(8))
    end)

    it("size = 6", function()
        print("\n\n")
        size = 6
        spiral = {
            { 1, 1, 1, 1, 1, 1 },
            { 0, 0, 0, 0, 0, 1 },
            { 1, 1, 1, 1, 0, 1 },
            { 1, 0, 0, 1, 0, 1 },
            { 1, 0, 0, 0, 0, 1 },
            { 1, 1, 1, 1, 1, 1 },
        }
        print("Expected")
        for i = 1, size do
            for j = 1, size do
                io.write(spiral[i][j])
            end
            print()
        end
        print()
        print("Actual")
        solution.spiralize(6)
        assert.are.same({
            { 1, 1, 1, 1, 1, 1 },
            { 0, 0, 0, 0, 0, 1 },
            { 1, 1, 1, 1, 0, 1 },
            { 1, 0, 0, 1, 0, 1 },
            { 1, 0, 0, 0, 0, 1 },
            { 1, 1, 1, 1, 1, 1 },
        }, solution.spiralize(6))
    end)
end)

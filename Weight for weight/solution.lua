local solution = {}

function solution.orderWeight(str)
    local numbers = {}

    local function weights(a)
        local aW = 0
        for idx = 1, #a do aW = aW + tonumber(a:sub(idx, idx)) end
        return aW
    end

    local function comparator(a, b)
        local aW = weights(a)
        local bW = weights(b)

        if aW == bW then
            return a < b
        end

        return aW < bW
    end

    for n in str:gmatch("([0-9]+)") do numbers[#numbers + 1] = n end
    table.sort(numbers, comparator)

    return table.concat(numbers, ' ')
end

return solution

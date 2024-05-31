local solution = {}

function solution.solution(value)
    local function unit_sum(n)
        return (n * (n + 1)) / 2
    end

    value = value - 1

    return 3 * unit_sum(math.floor(value / 3)) + 5 * unit_sum(math.floor(value / 5)) -
        15 * unit_sum(math.floor(value / 15))
end

return solution

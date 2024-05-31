local solution = {}

function solution.perimeter(n)
    local function fb(num)
        if num == 0 or num == 1 then return num end

        local prev, cur = 0, 1
        for _ = 3, num + 1 do
            prev, cur = cur, prev + cur
        end

        return cur
    end

    local fib = 0
    for i = 1, n + 1 do
        fib = fib + fb(i)
    end

    return 4 * fib
end

return solution

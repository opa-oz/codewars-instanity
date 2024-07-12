local solution = {}

local seq = { 1, 10, 9, 12, 3, 4 }

function solution.thirt(n)
    if n == 0 then
        return 0
    end

    local origin = n

    local s = 0
    local index = 1
    while n >= 10 do
        local right = n % 10
        n = math.floor(n / 10)

        s = s + (right * seq[index])
        index = index + 1
        if index > #seq then
            index = 1
        end
    end

    s = s + (n * seq[index])

    if s == origin then
        return s
    end

    return solution.thirt(s)
end

return solution

local solution = {}

function solution.zeros(n)
    local zs = 0
    while (n >= 5) do
        n = n // 5
        zs = zs + n
    end

    return zs
end

return solution

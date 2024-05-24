local kata = {}

local I = 'I'
local V = 'V'
local X = 'X'
local L = 'L'
local C = 'C'
local D = 'D'
local M = 'M'

kata.romanDigits = {
    [I] = 1,
    [V] = 5,
    [X] = 10,
    [L] = 50,
    [C] = 100,
    [D] = 500,
    [M] = 1000
}
kata.digitsRoman = {
    [1] = I,
    [5] = V,
    [10] = X,
    [50] = L,
    [100] = C,
    [500] = D,
    [1000] = M
}

-- Substractive notation
kata.substract = {
    [4] = 'IV',
    [9] = 'IX',
    [40] = 'XL',
    [90] = 'XC',
    [400] = 'CD',
    [900] = 'CM'
}

kata.brakets = { 1000, 500, 100, 50, 10, 5, 1 }

kata.boundaries = {
    high = 4000,
    low = 0
}

kata.romanEncoder = function(number)
    local result = {}
    local significats = {}

    local function split_by_closest(n, bound, l)
        local res = {}
        if kata.substract[n] then
            res[#res + 1] = kata.substract[n]
            return res
        end

        for _ = 1, math.floor(n / bound) do
            res[#res + 1] = l
        end

        local leftover = n % bound

        if leftover ~= 0 then
            local bounds = get_in_boundaries(leftover)
            --print("leftovers", leftover, bounds)

            for _, b in pairs(bounds) do
                res[#res + 1] = b
            end
        end

        return res
    end

    function get_in_boundaries(n)
        for _, b in ipairs(kata.brakets) do
            --print("n=", n, "b=", b)
            if n > b then
                return split_by_closest(n, b, kata.digitsRoman[b])
            elseif n == b then
                return { [1] = kata.digitsRoman[b] }
            end
        end
    end

    local x = number
    local depth = 0
    while x > 10 do
        significats[#significats + 1] = math.floor((x % 10) * 10 ^ depth)
        x = math.floor(x / 10)
        depth = depth + 1
    end
    significats[#significats + 1] = math.floor(x * 10 ^ depth)

    --print("sign", table.concat(significats, ", "))

    for i = #significats, 1, -1 do
        local val = significats[i]
        if val ~= 0 then
            local bounds = get_in_boundaries(val)

            for _, v in pairs(bounds) do
                result[#result + 1] = v
            end
        end
    end

    --print("res", table.concat(result, ', '))

    return table.concat(result, '')
end

return kata

return function(a, b)
    local l = math.sqrt(2)

    local function calc_full_amount(n)
        return math.floor(n / (2 * l)) * 2 + 1
    end

    local function calc_half_amount(n)
        return (math.floor((n / 2.0 - l / 2) / l) + 1) * 2
    end

    return calc_full_amount(a) * calc_full_amount(b) + calc_half_amount(a) * calc_half_amount(b)
end

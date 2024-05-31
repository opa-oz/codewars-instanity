local solution = {}

function solution.sumstrings(a, b)
    local sum = {}
    local carryover = 0

    local max_len = math.max(#a, #b)
    a = string.format("%" .. max_len .. "s", a)
    b = string.format("%" .. max_len .. "s", b)
    local space = string.byte(' ')

    for idx = max_len, 1, -1 do
        local left, right
        if a:byte(idx) == space then left = 0 else left = tonumber(a:sub(idx, idx)) end
        if b:byte(idx) == space then right = 0 else right = tonumber(b:sub(idx, idx)) end


        local lsum = left + right + carryover
        if lsum > 9 then
            carryover = math.floor(lsum / 10)
            lsum = lsum % 10
        else
            carryover = 0
        end
        sum[#sum + 1] = lsum
    end

    if carryover > 0 then
        sum[#sum + 1] = carryover
    end

    for i = 1, #sum // 2, 1 do
        sum[i], sum[#sum - i + 1] = sum[#sum - i + 1], sum[i]
    end

    return table.concat(sum):gsub("^0+", "")
end

return solution

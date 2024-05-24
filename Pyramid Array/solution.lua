return function(n)
    local result = {}

    for i = 1, n do
        local arr = {}
        for j = 1, i do arr[j] = 1 end
        result[#result + 1] = arr
    end

    return result
end

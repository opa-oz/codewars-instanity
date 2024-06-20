local solution = {}

function solution.inArray(array1, array2)
    local t = {}
    local src_string = table.concat(array2, "/")

    for i = 1, #array1 do
        local mat = src_string:match(array1[i]:gsub("%.", "%%."))
        if mat ~= nil then
            t[array1[i]] = true
        end
    end

    local result = {}
    for key, _ in pairs(t) do
        result[#result + 1] = key
    end

    table.sort(result)
    return result
end

return solution

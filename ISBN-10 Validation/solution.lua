local solution = {}

function solution.valid_ISBN10(isbn)
    if #isbn ~= 10 then
        return false
    end

    local match = isbn:match("^[0-9][0-9X]+$")
    if match == nil then
        return false
    end

    local sum = 0
    local X = string.byte('X')
    for idx = 1, #isbn do
        if isbn:byte(idx) ~= X then
            sum = sum + (idx * tonumber(isbn:sub(idx, idx)))
        else
            sum = sum + (idx * 10) -- because X = 10
        end
    end

    return (sum % 11) == 0
end

return solution

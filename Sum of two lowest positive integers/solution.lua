function sum_two_smallest_numbers(array)
    local min = 1 / 0
    local secondMin = 1 / 0

    for _, number in ipairs(array) do
        if number < min then
            secondMin = min
            min = number
        elseif number < secondMin then
            secondMin = number
        end
    end

    return min + secondMin
end

return sum_two_smallest_numbers

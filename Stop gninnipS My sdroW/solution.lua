local solution = {}

function solution.spin_words(sentence)
    local result = {}

    for word in sentence:gmatch("[%S]+") do
        if #word < 5 then
            result[#result + 1] = word
        else
            result[#result + 1] = word:reverse()
        end
    end

    return table.concat(result, " ")
end

return solution

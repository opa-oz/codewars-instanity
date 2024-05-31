function order(words_s)
    local words = {}
    local order = {}
    for word in words_s:gmatch("%w+") do
        words[#words + 1] = word
        order[tonumber(word:match("[0-9]"))] = word
    end

    return table.concat(order, ' ')
end


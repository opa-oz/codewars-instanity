function duplicate_encode(word)
    local symbols = {}

    word = word:lower()

    for idx = 1, #word do
        local letter = word:sub(idx, idx)

        if symbols[letter] == nil then
            symbols[letter] = 1
        else
            symbols[letter] = symbols[letter] + 1
        end
    end

    for letter, count in pairs(symbols) do
        if count > 1 then
            symbols[letter] = ')'
        else
            symbols[letter] = '('
        end
    end

    return word:gsub(".", symbols)
end

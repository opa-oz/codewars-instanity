local function alphabet_position(text)
    local alphabet = "abcdefghijklmnopqrstuvwxyz"
    local alphabet_tbl = {}

    for idx = 1, #alphabet do
        alphabet_tbl[alphabet:byte(idx)] = idx
    end

    local result = {}
    text = text:lower()

    for idx = 1, #text do
        local v = alphabet_tbl[text:byte(idx)]
        if v then
            result[#result + 1] = v
        end
    end

    return table.concat(result, ' ')
end

return alphabet_position

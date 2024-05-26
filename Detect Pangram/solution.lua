local function is_pangram(s)
    local alphabet = "abcdefghijklmnopqrstuvwxyz"

    for idx = 1, #alphabet do
        local index = string.find(s:lower(), alphabet:sub(idx, idx), 1, true)
        if index == nil then return false end
    end

    return true
end

return is_pangram

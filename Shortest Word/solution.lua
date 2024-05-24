local function find_short(s)
    local min = 1 / 0
    local space = string.byte(' ')
    local current_size = 0

    for idx = 1, #s do
        if s:byte(idx) == space then
            if current_size < min then
                min = current_size
            end
            current_size = 0
        else
            current_size = current_size + 1
        end
    end

    if current_size < min then
        min = current_size
    end

    return min
end

return find_short

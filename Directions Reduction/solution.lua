local kata = {}

kata.lookTable = {
    EAST = 'WEST',
    WEST = 'EAST',
    SOUTH = 'NORTH',
    NORTH = 'SOUTH',
}

function kata.dirReduc(dir)
    local iterations = #dir / 2 -- best-case - all pairs

    for i = 1, iterations do
        for idx = 1, #dir - 1 do
            local current_dir = dir[idx]
            local next_dir = dir[idx + 1]
            if next_dir == kata.lookTable[current_dir] then
                table.remove(dir, idx + 1) -- remove next first
                table.remove(dir, idx)     -- remove current
                break                      -- go to next pair removal
            end
        end
    end

    return dir
end

function kata.dirReduc(dir)
    -- Incorrect, because you need to eliminate direct-pairs
    local indices = {}
    local result = {}

    for idx = 1, #dir do
        local current_dir = dir[idx]

        if indices[idx] == nil then
            for idy = idx + 1, #dir do
                local next_dir = dir[idy]
                if indices[idy] == nil and next_dir == kata.lookTable[current_dir] then
                    indices[idx] = current_dir
                    indices[idy] = next_dir
                    print("PAIR found", current_dir, next_dir)
                    break
                end
            end
        end

        if indices[idx] == nil then
            result[#result + 1] = current_dir
        end
    end

    return result
end

return kata

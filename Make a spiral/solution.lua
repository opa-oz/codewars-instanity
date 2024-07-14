local codewars = {}

function codewars.spiralize(size)
    local spiral = {}

    for i = 1, size do
        local row = {}
        for j = 1, size do
            row[j] = 0
        end
        spiral[i] = row
    end

    local top = 1
    local bottom = size
    local left = 1
    local right = size

    while true do
        if left > right then
            break
        end

        for i = math.max(left - 1, 1), right do
            spiral[top][i] = 1
        end
        top = top + 2

        print(bottom, top, left, right)
        if top > bottom then
            spiral[bottom][right] = 1
            break
        end

        for i = math.max(top - 1, 1), bottom do
            spiral[i][right] = 1
        end
        right = right - 2

        if left > right then
            break
        end

        for i = right + 1, left, -1 do
            spiral[bottom][i] = 1
        end
        bottom = bottom - 2

        print(bottom, top)
        if top > bottom then
            spiral[top][left] = 1
            break
        end

        for i = bottom + 1, top, -1 do
            spiral[i][left] = 1
        end
        left = left + 2
    end


    for i = 1, #spiral do
        for j = 1, #spiral[i] do
            io.write(spiral[i][j])
        end
        print()
    end

    return spiral
end

return codewars

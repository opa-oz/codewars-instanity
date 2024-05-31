kata = {}

function kata.repeatStr(r, string)
    local res = {}

    for _ = 1, r do
        res[#res + 1] = string
    end

    return table.concat(res)
end

return kata

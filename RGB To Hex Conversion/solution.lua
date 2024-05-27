local kata = {}

function kata.rgb(r, g, b)
    local function pushInBounds(v)
        if v > 255 then return 255 end
        if v < 0 then return 0 end
        return v
    end

    r = pushInBounds(r)
    g = pushInBounds(g)
    b = pushInBounds(b)

    return string.format("%02x%02x%02x", r, g, b):upper()
end

return kata

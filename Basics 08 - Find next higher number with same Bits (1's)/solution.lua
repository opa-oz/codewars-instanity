return function(number)
    local function get_bits(n)
        local res = 0
        while n ~= 0 do
            res = res + (n & 1)
            n = n >> 1
        end
        return res
    end
    local target = get_bits(number)
    local i = number
    while true do
        i = i + 1
        local next = get_bits(i)
        if next == target then
            return i
        end
    end
end


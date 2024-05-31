local solution = {}

function solution.generate_hashtag(s)
    s = s:lower():gsub('[%S]+', function(w)
        return w:sub(1, 1):upper() .. w:sub(2)
    end):gsub(' ', '')

    if #s >= 139 or #s == 0 then
        return false
    end

    return '#' .. s
end

return solution

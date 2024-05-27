local function to_jaden_case(s)
    local function upper(ss) return ss:upper() end
    return s:lower():gsub("%s[a-z]", upper):gsub("^[a-z]", upper)
end

return to_jaden_case

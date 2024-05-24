local function binary_array_to_number(arr)
  return tonumber(table.concat(arr), 2)
end

return binary_array_to_number
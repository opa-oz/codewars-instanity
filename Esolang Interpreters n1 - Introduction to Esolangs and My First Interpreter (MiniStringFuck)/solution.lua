function myFirstInterpreter(code)
    local memory = 0

    return code:gsub('.', function(char)
        if char == '+' then
            memory = memory + 1
            if memory == 256 then memory = 0 end
            return ''
        end

        if char == '.' then
            return string.char(memory)
        end

        return ''
    end)
end

return myFirstInterpreter

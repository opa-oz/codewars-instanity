MORSE_CODE = {
    ['.-'] = 'A',
    ['-...'] = 'B',
    ['-.-.'] = 'C',
    ['-..'] = 'D',
    ['.'] = 'E',
    ['..-.'] = 'F',
    ['--.'] = 'G',
    ['....'] = 'H',
    ['..'] = 'I',
    ['.---'] = 'J',
    ['-.-'] = 'K',
    ['.-..'] = 'L',
    ['--'] = 'M',
    ['-.'] = 'N',
    ['---'] = 'O',
    ['.--.'] = 'P',
    ['--.-'] = 'Q',
    ['.-.'] = 'R',
    ['...'] = 'S',
    ['-'] = 'T',
    ['..-'] = 'U',
    ['...-'] = 'V',
    ['.--'] = 'W',
    ['-..-'] = 'X',
    ['-.--'] = 'Y',
    ['--..'] = 'Z',
    ['-----'] = '',
    ['.----'] = '',
    ['..---'] = '2',
    ['...--'] = '3',
    ['....-'] = '4',
    ['.....'] = '5',
    ['-....'] = '6',
    ['--...'] = '7',
    ['---..'] = '8',
    ['----.'] = '9',
    ['.-.-.-'] = '.',
    ['--..--'] = ',',
    ['..--..'] = '?',
    ['.----.'] = "'",
    ['-.-.--'] = '!',
    ['-..-.'] = '/',
    ['-.--.'] = '(',
    ['-.--.-'] = ')',
    ['.-...'] = '&',
    ['---...'] = '=>',
    ['-.-.-.'] = ';',
    ['-...-'] = '=',
    ['.-.-.'] = '+',
    ['-....-'] = '-',
    ['..--.-'] = '_',
    ['.-..-.'] = '"',
    ['...-..-'] = '$',
    ['.--.-.'] = '@',
    ['...---...'] = 'SOS',
}

SYMBOLS = {
    ['1'] = '.',
    ['111'] = '-',
    ['0'] = '',
    ['000'] = ' ',      -- 1 space
    ['0000000'] = '   ' -- 3 spaces
}
ONE = string.byte('1')
ZERO = string.byte('0')

solution = {}

function solution.decodeBits(bitstring)
    local result = {}
    bitstring = bitstring:gsub("^[0]*", ""):gsub("[0]*$", "")

    local function get_bounds(symbol)
        local as_byte = string.byte(symbol)
        local min = 1 / 0
        local max = -1

        if bitstring:find(symbol) == nil then
            return nil, nil
        end

        local seq = 0
        for idx = 1, #bitstring do
            if bitstring:byte(idx) == as_byte then
                seq = seq + 1
            else
                if seq > 0 then
                    min = math.min(seq, min)
                    max = math.max(seq, max)
                end
                seq = 0
            end
        end
        if seq > 0 then
            min = math.min(seq, min)
            max = math.max(seq, max)
        end

        return min, max
    end

    local one_min, one_max = get_bounds('1')
    local zero_min, zero_max = get_bounds('0')

    print("[", one_min, one_max)
    print(" ", zero_min, zero_max, "]")

    local rate = 0
    if one_min == nil then      -- '000' = ' '
        rate = zero_min
    elseif zero_min == nil then -- '111' = '.'
        rate = one_min
    else
        rate = math.min(zero_min, one_min)
    end

    local function parse_with_rate(inp, r)
        return SYMBOLS[inp:sub(1, #inp / r)]
    end

    local acc = ''
    for idx = 1, #bitstring do
        local curr = bitstring:byte(idx)
        if #acc > 0 then
            local last_seen = acc:byte(#acc)
            if last_seen == curr then
                acc = acc .. bitstring:sub(idx, idx)
            else
                print("acc", acc)
                result[#result + 1] = parse_with_rate(acc, rate)
                acc = bitstring:sub(idx, idx)
            end
        else
            acc = acc .. bitstring:sub(idx, idx)
        end
    end
    if #acc > 0 then
        print("final acc", acc)
        result[#result + 1] = parse_with_rate(acc, rate)
    end


    return table.concat(result)
end

function solution.decodeMorse(morse)
    local result = morse:match("^%s*(.-)%s*$")
    result = result:gsub("[^%s]+", MORSE_CODE)
    result = result:gsub("%s%s%s", '<tripplespace>')
    result = result:gsub("%s", '')
    result = result:gsub("<tripplespace>", ' ')

    return result
end

return solution

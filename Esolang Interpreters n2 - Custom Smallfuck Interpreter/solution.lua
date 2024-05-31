-- Here are a list of commands in Smallfuck:
--
-- > - Move pointer to the right (by 1 cell)
-- < - Move pointer to the left (by 1 cell)
-- * - Flip the bit at the current cell
-- [ - Jump past matching ] if value at current cell is 0
-- ] - Jump back to matching [ (if value at current cell is nonzero)

function interpreter(code, tape)
    -- print("code '" .. code .. "', tape '" .. tape .. "'")
    local mmr = {}
    local pnt = 1
    local abort = false

    local rightb = string.byte('>')
    local leftb = string.byte('<')
    local flipb = string.byte('*')
    local open_braket_b = string.byte('[')
    local close_braket_b = string.byte(']')

    for idx = 1, #tape do
        mmr[idx] = tonumber(tape:sub(idx, idx), 10)
    end


    local function eval_s(from, to)
        local lastseen_open = nil
        local lastseen_close = nil
        -- print("evaluate", code:sub(from, to))

        local skip_to = nil

        for idx = from, to do
            if abort then break end
            if skip_to ~= nil and idx < skip_to then goto continue end

            local bt = code:byte(idx)

            if bt == rightb then
                pnt = pnt + 1
                if pnt > #mmr then abort = true end
            end
            if bt == leftb then
                pnt = pnt - 1
                if pnt < 1 then abort = true end
            end
            if bt == flipb then
                if mmr[pnt] == 0 then
                    mmr[pnt] = 1
                elseif mmr[pnt] == 1 then
                    mmr[pnt] = 0
                end
            end

            if bt == open_braket_b then
                lastseen_open = idx
                for six = to, idx, -1 do
                    if code:byte(six) == close_braket_b then
                        lastseen_close = six
                        break
                    end
                end

                local curr = mmr[pnt]

                if curr == 0 then skip_to = lastseen_close + 1 end
                while curr == 1 do
                    eval_s(lastseen_open + 1, lastseen_close - 1)
                    curr = mmr[pnt]
                end
            end
            ::continue::
        end
    end

    eval_s(1, #code)

    return table.concat(mmr)
end

return interpreter

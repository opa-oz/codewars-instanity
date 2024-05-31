-- Here are a list of commands in Smallfuck:
--
-- n - Move data pointer north (up)
-- e - Move data pointer east (right)
-- s - Move data pointer south (down)
-- w - Move data pointer west (left)
-- [ - Jump past matching ] if value at current cell is 0
-- ] - Jump back to matching [ (if value at current cell is nonzero)


function interpreter(code, iterations, width, height)
    print("code '" .. code .. "', iterations '" .. iterations .. "' width/height", width, height)
    local mmr = {}
    local pnt_w = 1
    local pnt_h = 1
    local abort = false

    local eastb = string.byte('e')
    local westb = string.byte('w')
    local northb = string.byte('n')
    local southb = string.byte('s')
    local flipb = string.byte('*')
    local open_braket_b = string.byte('[')
    local close_braket_b = string.byte(']')

    for idx = 1, height do
        local row = {}
        for idy = 1, width do
            row[idy] = 0
        end
        mmr[idx] = row
    end

    local function result()
        local res = {}
        for idx = 1, #mmr do
            res[#res + 1] = table.concat(mmr[idx])
        end

        return table.concat(res, '\r\n')
    end

    if iterations == 0 then return result() end

    local function eval_s(from, to, inside_loop)
        local lastseen_open = nil
        local lastseen_close = nil
        -- print("evaluate", code:sub(from, to), "iterations left", iterations)

        local skip_to = nil

        for idx = from, to do
            if iterations == 0 then abort = true end
            if abort then break end
            if skip_to ~= nil and idx < skip_to then
                -- print("skip from", idx, skip_to)
                goto continue
            end

            local bt = code:byte(idx)

            if bt == eastb then
                -- print("action", code:sub(from, to), pnt_h, pnt_w, "e")
                pnt_w = pnt_w + 1
                if pnt_w > width then pnt_w = 1 end
                iterations = iterations - inside_loop
            end
            if bt == westb then
                -- print("action", pnt_h, pnt_w, "w")
                pnt_w = pnt_w - 1
                if pnt_w < 1 then pnt_w = width end
                iterations = iterations - inside_loop
            end
            if bt == northb then
                -- print("action", pnt_h, pnt_w, "n")
                pnt_h = pnt_h - 1
                if pnt_h < 1 then pnt_h = height end
                iterations = iterations - inside_loop
            end
            if bt == southb then
                -- print("action", code:sub(from, to), pnt_h, pnt_w, "s")
                pnt_h = pnt_h + 1
                if pnt_h > height then pnt_h = 1 end
                iterations = iterations - inside_loop
            end
            if bt == flipb then
                -- print("action", code:sub(from, to), pnt_h, pnt_w, "f")
                iterations = iterations - inside_loop
                if mmr[pnt_h][pnt_w] == 0 then
                    mmr[pnt_h][pnt_w] = 1
                elseif mmr[pnt_h][pnt_w] == 1 then
                    mmr[pnt_h][pnt_w] = 0
                    print("alert")
                end
            end

            if bt == open_braket_b then
                -- print("action", code:sub(from, to), pnt_h, pnt_w, "c")
                lastseen_open = idx
                for six = to, idx, -1 do
                    if code:byte(six) == close_braket_b then
                        lastseen_close = six
                        break
                    end
                end

                local curr = mmr[pnt_h][pnt_w]

                if curr == 0 then
                    iterations = iterations - inside_loop
                end
                skip_to = lastseen_close + 1
                while mmr[pnt_h][pnt_w] == 1 do
                    eval_s(lastseen_open + 1, lastseen_close - 1, 1)
                    if abort then break end
                    if iterations == 0 then
                        abort = true
                        break
                    end
                    iterations = iterations - inside_loop
                    -- print("action", pnt_h, pnt_w, code:sub(lastseen_open + 1, lastseen_close - 1), "iter",
                    -- mmr[pnt_h][pnt_w])
                end
            end
            ::continue::
        end
    end

    eval_s(1, #code, 1)

    return result()
end

return interpreter

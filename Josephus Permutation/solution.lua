function table.shallow_copy(t)
    local t2 = {}
    for k, v in pairs(t) do
        t2[k] = v
    end
    return t2
end

--
--function josephus(items, k)
--    local killlist = {}
--    local start = k
--    local orgi_items = table.shallow_copy(items)
--
--    local to_log = k == 6
--
--    while #items > 1 do
--        local diff = {}
--
--        if start > #items then
--            local leftover = start % #items
--            if to_log then print("leftover", leftover) end
--            killlist[#killlist + 1] = items[leftover]
--
--            if leftover == 0 then
--                leftover = 1
--            end
--
--            if not pcall(function(items, leftover)
--                    table.remove(items, leftover)
--                end, items, leftover) then
--                error( --table.concat(orgi_items, ",") ..
--                    " = " .. k .. " = " .. leftover .. " = " .. #items .. " = " .. start)
--            end
--
--            start = leftover
--        else
--            local last_seen_index = -1
--            for i = start, #items, k do
--                diff[#diff + 1] = i
--                killlist[#killlist + 1] = items[i]
--                if to_log then print("kill", items[i], i) end
--                last_seen_index = i
--            end
--
--            if last_seen_index < #items then
--                start = k - (#items - last_seen_index)
--            else
--                start = k
--            end
--
--            for i = #diff, 1, -1 do
--                local index = diff[i]
--                table.remove(items, index)
--            end
--        end
--    end
--
--    if #items > 0 then
--        killlist[#killlist + 1] = items[1]
--    end
--
--    return killlist
--end

function josephus(items, k)
    local killlist = {}

    k = k - 1

    local function j(list, start)
        if #list == 1 then
            killlist[#killlist + 1] = list[1]
            return
        end
        if #list == 0 then
            return
        end

        start = (start + k) % #list
        killlist[#killlist + 1] = list[start + 1]
        table.remove(list, start + 1)

        return j(list, start)
    end

    j(items, 0)

    return killlist
end

function josephus_only_last(n, k)
    local last = nil
    local items = {}

    for i = 1, n do
        items[#items + 1] = i
    end

    print(table.concat(items, ','))

    k = k - 1

    local function j(list, start)
        if #list == 1 then
            last = list[1]
            return
        end
        if #list == 0 then
            return
        end

        start = (start + k) % #list
        table.remove(list, start + 1)

        return j(list, start)
    end

    j(items, 0)

    return last
end

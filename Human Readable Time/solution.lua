local solution = {}

function solution.make_readable(seconds)
    local s2h = 3600
    local s2m = 60
    local hours = math.floor(seconds / s2h)
    local minutes = math.floor((seconds - (hours * s2h)) / s2m)
    seconds = seconds - (hours * s2h) - (minutes * s2m)

    return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

return solution

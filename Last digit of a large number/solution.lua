local solution = {}

function solution.last_digit(base, exponent) -- s1 and s2 are strings
    local last_digit = base:sub(#base, #base)
    local last_exponent_digit = exponent:sub(#exponent, #exponent)

    -- edge case
    if last_exponent_digit == '0' and #exponent == 1 then return 1 end

    -- 0 Last digit of the Power if the last digit of the Base number is 0
    if last_digit == '0' then return 0 end

    -- 1 Last digit of the Power if the last digit of the Base number is 1
    if last_digit == '1' then return 1 end

    -- 4 Last digit of the Power if the last digit of the Base number is 4
    -- If the Exponent is odd, then the last digit of the Power is 4.
    -- If the Exponent is even, then the last digit of the Power is 6.
    if last_digit == '4' then
        if tonumber(last_exponent_digit) % 2 == 0 then
            return 6
        else
            return 4
        end
    end

    -- 5 Last digit of the Power if the last digit of the Base number is 5
    if last_digit == '5' then return 5 end

    -- 6 Last digit of the Power if the last digit of the Base number is 6
    if last_digit == '6' then return 6 end

    -- 9 Last digit of the Power if the last digit of the Base number is 9
    -- If the Exponent is odd, then the last digit of the Power is 9.
    -- If the Exponent is even, then the last digit of the Power is 1.
    if last_digit == '9' then
        if tonumber(last_exponent_digit) % 2 == 0 then
            return 1
        else
            return 9
        end
    end

    -- left only 2, 3, 7, 8
    local function divideByFour(hugeNumber)
        local remainder = 0
        local result = ""

        -- Iterate through each digit of the huge number
        for i = 1, #hugeNumber do
            local digit = tonumber(hugeNumber:sub(i, i)) -- Get the digit at position i

            -- Add the remainder from the previous iteration
            local partial = remainder * 10 + digit

            -- Perform division
            local quotient = math.floor(partial / 4)

            -- Compute the new remainder
            remainder = partial % 4

            -- Append the quotient to the result
            result = result .. quotient

            -- If it's the last digit and the quotient is 0, break the loop
            if i == #hugeNumber and quotient == 0 then
                break
            end
        end

        return result, remainder
    end

    local t, remainder = divideByFour(exponent)
    print("exponent", exponent, "t", t, "remainder", remainder)
    if last_digit == '2' then return ({ 2, 4, 8, 6 })[remainder] end
    if last_digit == '3' then return ({ 3, 9, 7, 1 })[remainder] end
    if last_digit == '7' then return ({ 7, 9, 3, 1 })[remainder] end
    if last_digit == '7' then return ({ 8, 4, 2, 6 })[remainder] end

    return 0
end

return solution

-- Day 1: Easy Exercise
--
-- Now, write a similar function called is_prime(num) to test is a number
-- is prime (that is, it's divisible only by itself and 1).
luaunit = require('luaunit')

function is_prime(num)
    if num < 1 then
        return false
    elseif num == 1 or num == 2 then
        return true
    else
        local half_point = math.floor(num / 2)
        for i = 2, half_point do
            if num % i == 0 then
                return false
            end
        end
        return true
    end
end

function test_is_prime()
    luaunit.assertFalse(is_prime(-1))
    luaunit.assertFalse(is_prime(0))
    luaunit.assertFalse(is_prime(4))
    luaunit.assertFalse(is_prime(9))
    luaunit.assertFalse(is_prime(49))

    luaunit.assertTrue(is_prime(1))
    luaunit.assertTrue(is_prime(2))
    luaunit.assertTrue(is_prime(3))
    luaunit.assertTrue(is_prime(5))
    luaunit.assertTrue(is_prime(7))
    luaunit.assertTrue(is_prime(1663))
end

os.exit( luaunit.LuaUnit.run() )

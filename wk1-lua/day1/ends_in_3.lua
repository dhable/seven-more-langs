-- Day 1: Easy Exercise
--
-- Write a function called ends_in_3(num) that returns true if the final
-- digit of the num is 3, and false otherwise.
luaunit = require('luaunit')

function ends_in_3(num)
    local final_digit = math.abs(num) % 10
    return final_digit == 3
end

function test_ends_in_3()
    luaunit.assertTrue(ends_in_3(3))
    luaunit.assertTrue(ends_in_3(43))
    luaunit.assertTrue(ends_in_3(-3))

    luaunit.assertFalse(ends_in_3(0))
    luaunit.assertFalse(ends_in_3(1))
    luaunit.assertFalse(ends_in_3(-1))
end

os.exit( luaunit.LuaUnit.run() )

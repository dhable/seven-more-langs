-- Day 1: Hard Exercise
--
-- Write a function reduce(max, init, f) that calls function f() over
-- the integers from 1 to max like so:
--
-- function add(previous, next)
--      return previous + next
-- end
--
-- reduce(5, 0, add)
luaunit = require('luaunit')

function reduce(max, init, f)
    local result = init
    for i = 1, max do
        result = f(result, i)
    end
    return result
end

function test_reduce_max_of_zero()
    function just_fail()
        luaunit.assertTrue(false)
    end
    luaunit.assertEquals(10, reduce(0, 10, just_fail))
end

function test_reduce_add_1_through_5()
    function add(previous, next)
        return previous + next
    end
    luaunit.assertEquals(15, reduce(5, 0, add))
end

os.exit( luaunit.LuaUnit.run() )

-- Day 1: Hard Exercise
--
-- Implement factorial() in terms of reduce
luaunit = require('luaunit')

function reduce(max, init, f)
    local result = init
    for i = 1, max do
        result = f(result, i)
    end
    return result
end

function factorial(n)
    return reduce(n, 1, (function(total, current) return total * current end))
end

function test_factorial()
    luaunit.assertEquals(1, factorial(0))
    luaunit.assertEquals(1, factorial(1))
    luaunit.assertEquals(2, factorial(2))
    luaunit.assertEquals(6, factorial(3))
    luaunit.assertEquals(3628800, factorial(10))
end

os.exit( luaunit.LuaUnit.run() )

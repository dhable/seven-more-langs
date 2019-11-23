-- Day 2: Medium Exercise
--
-- What if Lua didn't have a for loop? Using if and while, write a function
-- for_loop(a, b, f) that calls f() on each integer from a to b (inclusive).
luaunit = require('luaunit')

function for_loop(a, b, f)
    local i = a
    while i <= b do
        f()
        i = i + 1
    end
end

function test_for_loop_no_iterations()
    local counter = 0
    for_loop(2, 1, (function() counter = counter + 1 end))
    luaunit.assertEquals(counter, 0)
end

function test_for_loop_single_iteration()
    local counter = 0
    for_loop(1, 1, (function() counter = counter + 1 end))
    luaunit.assertEquals(counter, 1)
end

function test_for_loop_multiple_iterations()
    local counter = 0
    for_loop(1, 5, (function() counter = counter + 1 end))
    luaunit.assertEquals(counter, 5)
end

os.exit( luaunit.LuaUnit.run() )

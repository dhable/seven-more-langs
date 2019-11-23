-- Day 2: Hard Exercise
--
-- Using coroutines, write a fault-tolerant function retry(count, body) that
-- works as follows:
--    * Call the body() function
--    * If body() yields a string with coroutine.yield(), consider this an error
--      message and restart body() from its beginning.
--    * Don't retry more than count times; if you exceed count, print an error
--      message and return.
--    * If body() returns without yielding a string, consider this a success.
--
-- Example Usage:
-- retry(
--    5,
--    function()
--       if math.random() > 0.2 then
--          coroutine.yield('something bad happened')
--       end
--       print('Succeeded')
--    end
-- )
luaunit = require("luaunit")

function retry(count, body)
    function body_coroutine()
        return coroutine.create(body)
    end

    for attempts = 1, count do
        local _, body_result = coroutine.resume(body_coroutine())
        if type(body_result) == "string" then
            attempts = attempts + 1
        else
            return
        end
    end
    error "Execution of body resulted in nothing but failures."
end


--
-- Test Cases
--

function test_succeed_first_run()
    local counter = 0
    function always_pass()
        counter = counter + 1
    end

    retry(1, always_pass)
    luaunit.assertEquals(1, counter)
end

function test_eventually_pass()
    local counter = 0
    function pass_after_10()
        counter = counter + 1
        if counter < 9 then
            return "failure"
        else
            return
        end
    end

    retry(10, pass_after_10)
    luaunit.assertEquals(9, counter)
end

function test_always_fail()
    local counter = 0
    function never_pass()
        counter = counter + 1
        return "fail"
    end

    luaunit.assertErrorMsgContains("Execution of body resulted in nothing but failures.",
                                   function() retry(2, never_pass) end)
    luaunit.assertEquals(2, counter)
end

os.exit( luaunit.LuaUnit.run() )

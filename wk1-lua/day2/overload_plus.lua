-- Day 2: Medium Exercise
--
-- Change the global metatable you discovered in the Find section earlier
-- so that any time you try to add two arrays using the plus sign 
-- (e.g. a1 + a2), Lua concatenates them together using your concatenate()
-- function.
luaunit = require("luaunit")
concat = require("concatenate")

local global_mt = {
    __add = function(lhs, rhs)
        if type(lhs) == "table" and type(rhs) == "table" then
            return concat.concatenate(lhs, rhs)
        else
            return lhs + rhs
        end
    end
}
setmetatable(_G, global_mt)


function test_existing_plus()
    luaunit.assertEquals(3, 1 + 2)
end


function test_lists()
    local a1 = {1, 2, 3}
    local a2 = {4, 5, 6}
    luaunit.assertEquals({1, 2, 3, 4, 5, 6}, a1 + a2)
end


os.exit( luaunit.LuaUnit.run() )

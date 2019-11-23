-- Day 2: Easy Exercise
--
-- Our strict table implementation doesn't provide a way to delete items from the
-- table. If we try the usual approach, treasure.gold = nil, we get a duplicate
-- key error. Modify strict_write() to allow deleting keys (by setting their values
-- to nil).
luaunit = require("luaunit")

local _private = {}

function strict_read(table, key)
    if _private[key] then
        return _private[key]
    else
        error("Invalid key: " .. key)
    end
end


function strict_write(table, key, value)
    if not(key == nil) and _private[key] then
        error("Duplicate key: " .. key)
    else
        _private[key] = value
    end
end


local mt = {
    __index    = strict_read,
    __newindex = strict_write
}


treasure = {}
setmetatable(treasure, mt)


function test_read_write_key()
    treasure.gold = 50
    luaunit.assertEquals(50, treasure.gold)
    luaunit.assertErrorMsgContains("Invalid key: silver", 
                                   (function() return treasure.silver end))
end


function test_write_duplicate_key()
    treasure.silver = 100
    luaunit.assertErrorMsgContains("Duplicate key: silver",
                                   (function() treasure.silver = 200 end))
    luaunit.assertEquals(100, treasure.silver)
end


function test_deleting_key()
    treasure.silver = nil
    luaunit.assertErrorMsgContains("Invalid key: silver",
                                   (function() return treasure.silver end))
end


os.exit( luaunit.LuaUnit.run() )

-- Day 2: Easy Exercise
--
-- Write a function called concatenate(a1, a2) that takes two arrays and returns
-- a new array with all the elements of a1 followed by all the elements of a2.
luaunit = require("luaunit")

function concatenate(a1, a2)
    local result = {}

    for i, v in ipairs(a1) do
        result[#result + 1] = v
    end

    for i, v in ipairs(a2) do
        result[#result + 1] = v
    end

    return result
end


function test_concat_two_lists()
    result = concatenate({1, 2, 3, 4}, {5, 6, 7, 8})
    luaunit.assertEquals({1, 2, 3, 4, 5, 6, 7, 8}, result)
end


function test_concat_two_lists_diff_size()
    result = concatenate({1, 2}, {5, 6, 7, 8})
    luaunit.assertEquals({1, 2, 5, 6, 7, 8}, result)

    result = concatenate({1, 2, 3, 4}, {7, 8})
    luaunit.assertEquals({1, 2, 3, 4, 7, 8}, result)
end


function test_concat_one_list_to_empty_list()
    result = concatenate({1, 2, 3},  {})
    luaunit.assertEquals({1, 2, 3}, result)

    result = concatenate({}, {7, 8})
    luaunit.assertEquals({7, 8}, result)
end


function test_concat_empty_lists()
    result = concatenate({}, {})
    luaunit.assertEquals({}, result)
end


os.exit( luaunit.LuaUnit.run() )

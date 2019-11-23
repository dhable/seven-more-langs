-- Day 2: Medium Exercise
--
-- Using Lua's built-in OO syntax, write a class called Queue that implements
-- a first-in, first-out (FIFO) queue as follows:
--
-- a = Queue.new() returns a new object
-- q:add(item) adds item past the last one currently in the queue.
-- q:remove() removes and returns the first item in the queue, or nil
-- if the queue is empty.
luaunit = require("luaunit")

Queue ={ data = {} }

function Queue:new()
    local obj = { data = {} }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Queue:add(item)
    self.data[#self.data + 1] = item
end

function Queue:remove()
    if #self.data < 1 then
      return nil
    else
      local element = self.data[1]
      table.remove(self.data, 1)
      return element
    end
end

--
-- Test Cases
--
function test_create_empty_queue()
    q = Queue:new()
    luaunit.assertEquals({}, q.data)
end

function test_add_items()
    q = Queue:new()
    q:add(1)
    q:add(2)
    q:add(2)
    luaunit.assertEquals({1, 2, 2}, q.data)
end

function test_remove_items()
    q = Queue:new()
    q:add(1)
    q:add(2)
    q:add(3)
    luaunit.assertEquals(1, q:remove())
    luaunit.assertEquals({2, 3}, q.data)
end

function test_remove_empty_queue()
    q = Queue:new()
    luaunit.assertEquals(nil, q:remove())
    luaunit.assertEquals({}, q.data)
end

os.exit( luaunit.LuaUnit.run() )

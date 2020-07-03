Snake = {}


function Snake:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self

    o.body = {}

    return o
end
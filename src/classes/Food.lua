Food = {}


function Food:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end
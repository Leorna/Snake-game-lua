StartState = BaseState:new()
local flag = 1

function StartState:new()
    local o = BaseState:new()
    setmetatable(o, self)
    self.__index = self
    return o
end


function StartState:update(dt)
    
end
TutorialState = BaseState:new()


function TutorialState:new()
    local o = BaseState:new()
    setmetatable(o, self)
    self.__index = self
    return o
end
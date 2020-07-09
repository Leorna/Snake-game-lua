PlayState = BaseState:new()


function PlayState:new()
    local o = BaseState:new()
    setmetatable(o, self)
    self.__index = self

    o.snake = Snake:new()

    return o
end


function PlayState:update(dt)
    self.snake:update(dt)
end


function PlayState:render()
    self.snake:render()
end
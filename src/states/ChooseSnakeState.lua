ChooseSnakeState = BaseState:new()


function ChooseSnakeState:new()
    local o = BaseState:new()
    setmetatable(o, self)
    self.__index = self
    return o
end


function ChooseSnakeState:render()
    love.graphics.printf('Choose Snake', WINDOW_HEIGHT/2-70, 400, WINDOW_HEIGHT, 'center')
end
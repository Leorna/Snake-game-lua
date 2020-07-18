PlayState = BaseState:new()


function PlayState:new()
    local o = BaseState:new()
    setmetatable(o, self)
    self.__index = self

    o.snake = Snake:new()

    o.paused = false

    return o
end


function PlayState:update(dt)
    if not self.paused then
        self.snake:update(dt)
    end

    if love.keyboard.wasPressed('p') then
        if self.paused then
            self.paused = false
        else
            self.paused = true
        end
    end
end


function PlayState:render()
    if not self.paused then
        self.snake:render()
    end
end
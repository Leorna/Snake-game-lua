HighScoreState = BaseState:new()


function HighScoreState:new()
    local o = BaseState:new()
    setmetatable(o, self)
    self.__index = self
    return o
end


function HighScoreState:render()
    love.graphics.printf('High Scores', WINDOW_HEIGHT/2-70, 400, WINDOW_HEIGHT, 'center')
end
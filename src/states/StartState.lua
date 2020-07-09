StartState = BaseState:new()
local flag = 1


function StartState:new()
    local o = BaseState:new()
    setmetatable(o, self)
    self.__index = self
    return o
end


function StartState:update(dt)
    if love.keyboard.wasPressed('down') then
        if flag == 1 then
            flag = 2
        elseif flag == 2 then
            flag = 3
        else
            flag = 1
        end
    elseif love.keyboard.wasPressed('up') then
        if flag == 1 then
            flag = 3
        elseif flag == 2 then
            flag = 1
        else
            flag = 2
        end
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if flag == 1 then
            gStateMachine:change('play')
        elseif flag == 2 then
            gStateMachine:change('')
        else
            gStateMachine:change('')
        end
    end
end


function StartState:render()
    love.graphics.setFont(gFonts.large)

    love.graphics.printf('Snake Game', 0, 10, 10, 'center')


    love.graphics.setFont(gFonts.medium)
    love.graphics.setColor(1, 1, 1, 1)

    if flag == 1 then
        love.graphics.setColor(0.1, 1, 0.1, 1)
    end
    love.graphics.printf("START", 0, 50, 50, 'center')

    love.graphics.setColor(1, 1, 1, 1)

    if flag == 2 then
        love.graphics.setColor(0.1, 1, 0.1, 1)
    end
    love.graphics.printf("HIGH SCORES", 0, 70, 70, 'center')

    love.graphics.setColor(1, 1, 1, 1)

    if flag == 3 then
        love.graphics.setColor(0.1, 1, 0.1, 1)
    end
    love.graphics.printf('SNAKES', 0, 70, 70, 'center')
end
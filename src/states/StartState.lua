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
        elseif flag == 3 then
            flag = 4
        else
            flag = 1
        end
    elseif love.keyboard.wasPressed('up') then
        if flag == 1 then
            flag = 4
        elseif flag == 2 then
            flag = 1
        elseif flag == 3 then
            flag = 2
        else
            flag = 3
        end
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if flag == 1 then
            gStateMachine:change('play')
        elseif flag == 2 then
            gStateMachine:change('high-score')
        elseif flag == 3 then
            gStateMachine:change('choose-snake')
        else
            gStateMachine:change('tutorial')
        end
    end
end


local function renderStartLabel()
    if flag == 1 then
        love.graphics.setColor(0.1, 1, 0.1, 1)
    end
    love.graphics.printf("START", WINDOW_HEIGHT/2-40, 250, WINDOW_HEIGHT, 'center')
end


local function renderHighScoresLabel()
    if flag == 2 then
        love.graphics.setColor(0.1, 1, 0.1, 1)
    end
    love.graphics.printf("HIGH SCORES", WINDOW_HEIGHT/2-40, 300, WINDOW_HEIGHT, 'center')
end


local function renderSnakesLabel()
    if flag == 3 then
        love.graphics.setColor(0.1, 1, 0.1, 1)
    end
    love.graphics.printf('SNAKES', WINDOW_HEIGHT/2-40, 350, WINDOW_HEIGHT, 'center')
end


local function renderHowToPlayLabel()
    if flag == 4 then
        love.graphics.setColor(0.1, 1, 0.1, 1)
    end
    love.graphics.printf('HOW TO PLAY', WINDOW_HEIGHT/2-40, 400, WINDOW_HEIGHT, 'center')
end


function StartState:render()
    love.graphics.setFont(gFonts.large)

    love.graphics.printf('Snake Game', WINDOW_HEIGHT/2-60, 100, WINDOW_HEIGHT, 'center')


    love.graphics.setFont(gFonts.medium)
    love.graphics.setColor(1, 1, 1, 1)

    renderStartLabel()
    
    love.graphics.setColor(1, 1, 1, 1)

    renderHighScoresLabel()

    love.graphics.setColor(1, 1, 1, 1)

    renderSnakesLabel()

    love.graphics.setColor(1, 1, 1, 1)

    renderHowToPlayLabel()
end
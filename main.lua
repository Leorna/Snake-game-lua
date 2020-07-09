require 'src.dependencies'


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    love.window.setTitle('Snake game')
    
    math.randomseed(os.time())

    gFonts = {
        small = love.graphics.newFont('fonts/font.ttf', 16),
        medium = love.graphics.newFont('fonts/font.ttf', 32),
        large = love.graphics.newFont('fonts/font.ttf', 64)
    }

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)

    gStateMachine = StateMachine:new{
        ['start'] = function() return StartState:new() end,
        ['play'] = function() return PlayState:new() end,
        ['high-score'] = function() return HighScoreState:new() end,
        ['choose-snake'] = function() return ChooseSnakeState:new() end,
        ['tutorial'] = function() return TutorialState:new() end
    }
  
    gStateMachine:change('start')

    --Custom table
    love.keyboard.keysPressed = {}
end


function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end


--[[
    Custom function
]]
function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end


function love.update(dt)
    if love.keyboard.wasPressed('q') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('escape') then
        gStateMachine:change('start')
    end

    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end


local function displayFPS()
    love.graphics.setFont(gFonts.small)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: '..tostring(love.timer.getFPS()), 20, 20, 0, 2, 2)
end


function love.draw()
    displayFPS()
    gStateMachine:render()
end
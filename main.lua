require 'src.dependencies'


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    love.window.setTitle('Snake game')
    
    math.randomseed(os.time())

    gFonts = {
        small = love.graphics.newFont('fonts/font.ttf', 8),
        medium = love.graphics.newFont('fonts/font.ttf', 16),
        large = love.graphics.newFont('fonts/font.ttf', 32)
    }

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)

    gStateMachine = StateMachine:new{
        start = function() return StartState:new() end,
        play = function() return PlayState:new() end
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

    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end


function love.draw()
    love.displayFPS()
    gStateMachine:render()
end

--[[
    Custom function
]]
function love.displayFPS()
    love.graphics.setFont(gFonts.small)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: '..tostring(love.timer.getFPS()), 20, 20, 0, 2, 2)
end
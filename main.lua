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


    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync=true,
        fullscreen=false,
        resizable=true
    })

    gStateMachine = StateMachine:new{
        start = function() return StartState:new() end
    }
    print(gStateMachine)
    gStateMachine:change('start')

    --Custom table
    love.keyboard.keysPressed = {}
end


function love.resize(w, h)
    push:resize(w, h)
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
    print('oi')

    love.keyboard.keysPressed = {}
end


function love.draw()
    push:start()

    displayFPS()

    push:finish()
end


function displayFPS()
    love.graphics.setFont(gFonts.small)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: '..tostring(love.timer.getFPS()), 5, 5)
end
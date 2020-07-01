require 'src.dependencies'


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    love.window.setTitle('Snake game')
    
    math.randomseed(os.time())

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync=true,
        fullscreen=false,
        resizable=true
    })


end


function love.resize(w, h)
    push:resize(w, h)
end


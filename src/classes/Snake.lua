Snake = {}


function Snake:new(color)
    local o = {}
    setmetatable(o, self)
    self.__index = self

    o.body = {}
    o.body[1] = { x=22, y=12 }
    o.body[2] = { x=12, y=12 }

    o.color = { r=0.2, g=0.4, b=1, alpha=1 } or color

    o.dx = 3

    o.width = 10
    o.height = 10

    return o
end


function Snake:update(dt)
    local x = self.body[1].x + BOX_SIZE
    local y = self.body[1].y

    table.remove(self.body)
    table.insert(self.body, 1, { x=x, y=y })
end


function Snake:render()
    love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.alpha)
    for i = 1, #self.body do
        love.graphics.rectangle('fill', self.body[i].x, self.body[i].y, self.width, self.height)
    end
end
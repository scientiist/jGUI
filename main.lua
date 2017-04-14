local GUIContainer = require("GUIContainer")
local Frame = require("Frame")

local menu = GUIContainer()

local frame = Frame()

frame:setParent(menu)

function love.load()
    love.window.setTitle("jInterface test")
end

function love.update(dt)

end

function love.draw()

    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    menu:render()

end
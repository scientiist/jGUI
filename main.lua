local GUIContainer = require("GUIContainer")
local Frame = require("Frame")
local Vector2D = require("datatypes/Vector2D")
local TextLabel = require("TextLabel")

local menu = GUIContainer()

local frame = Frame()

frame:setParent(menu)
frame:setSize(Vector2D.new(10, 30), Vector2D.new(0.5, 0.5))

local label = TextLabel()
label:setParent(frame)
label:setPosition(Vector2D.new(0, 0), Vector2D.new(0.1, 0.3))
label:setSize(Vector2D.new(0, 0), Vector2D.new(0.5, 0.5))

function love.load()
    love.window.setTitle("jInterface test")
    love.window.setMode(1280, 768, {resizable = true})
end

function love.update(dt)
    menu:update(dt)
end

function love.draw()

    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    menu:render()

end
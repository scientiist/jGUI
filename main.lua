require("loader")

local menu = GUIContainer()

local frame = Frame()
    frame:setParent(menu)
    frame:setSize(Vector2D.new(0, 0), Vector2D.new(0.8, 0.8))
    frame:setPosition(Vector2D.new(0,0), Vector2D.new(0.1,0.1))
    frame:setBackgroundColor(RGBColor.new(255,255,255))
    frame:setBorder(4)


local label = Label()
    label:setParent(frame)
    label:setPosition(Vector2D.new(0, 0), Vector2D.new(0, 0))
    label:setSize(Vector2D.new(0, 0), Vector2D.new(0.2, 0.025))
    label:setTextSize(16)
    label:setBorderColor(RGBColor.new(0,0,0, 128))
    label:setText("I am a label, I display text!")

local quitBtn = Button()
    quitBtn:setParent(frame)
    quitBtn:setPosition(Vector2D.new(0, 0), Vector2D.new(0.5,0.2))
    quitBtn:setSize(Vector2D.new(0, 0),Vector2D.new(0.3, 0.06))
    quitBtn:setText("Click me to close!")
    quitBtn:setTextSize(32)
    quitBtn:setBorderColor(RGBColor.new(255,0,0))
    quitBtn:setBackgroundColor(RGBColor.new(255, 255, 255))

    quitBtn.mouseEnterEvent:connect(function()
        quitBtn:setBackgroundColor(RGBColor.new(192, 192, 192))
    end)
    quitBtn.mouseLeaveEvent:connect(function()
        quitBtn:setBackgroundColor(RGBColor.new(255, 255, 255))
    end)

    quitBtn.mouseUpEvent:connect(function() os.exit() end)


local inputLabel = InputLabel()
    inputLabel:setParent(frame)
    inputLabel:setPosition(Vector2D.new(0,0), Vector2D.new(0.1, 0.3))
    inputLabel:setSize(Vector2D.new(0,0), Vector2D.new(0.2, 0.06))
    inputLabel:setText("Click to type!")

    inputLabel.inputBeganEvent:connect(function()
        inputLabel:setText("")
    end)

    inputLabel.inputEndedEvent:connect(function()
        print(inputLabel:getText())
        inputLabel:setText("Try again!")
    end)
   

--[[
local picture = ImageLabel()
    picture:setParent(frame)

    picture:setImage(love.graphics.newImage("cock.jpg"))
    picture:setPosition(Vector2D.new(0, 0), Vector2D.new(0.1,0.1))
    picture:setSize(Vector2D.new(0, 0),Vector2D.new(0.5, 0.5))
]]

function love.load()
    love.keyboard.setKeyRepeat(true)
    love.window.setTitle("jInterface test")
    love.window.setMode(1280, 768, {resizable = true})
end

function love.update(dt)
    menu:update(dt)
end

function love.textinput(t)
    menu:input(t)
end

function love.keypressed(k)
    menu:keypress(k)
end

function love.draw()

    love.graphics.setColor(64,64,64)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    menu:render()

end
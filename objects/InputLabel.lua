local Label = require("objects/Label")
local Event = require("core/Event")
local RGBColor = require("datatypes/RGBColor")
local Vector2D = require("datatypes/Vector2D")

local InputLabel = {} -- What am i doing dad first fix the TextLabel -> InputLabel

InputLabel.__index = InputLabel

setmetatable(InputLabel, {
	__index = Label, -- this is what makes the inheritance work
	__call = function (cls, ...)
		local self = setmetatable({}, cls)
		self:_init(...)
		return self
	end,
})

function InputLabel:_init()
	
	Label._init(self) -- call the base class constructor
	table.insert(self.__inheritance, "InputLabel")
	self.children = {}


    self.hasFocus = false
    self.mouseDown = false
    self.mouseIn = false
    self.inputBeganEvent = Event.initialize()
    self.inputEndedEvent = Event.initialize()
    self.mouseDownEvent = Event.initialize()
    self.mouseUpEvent = Event.initialize()
    self.shownText = self.text
    self.timer = 0

end

function InputLabel:render()
  
	-- border
	
	love.graphics.setColor(self.borderColor:toTable())
	love.graphics.rectangle("fill", self.absolutePosition.x-self.border, self.absolutePosition.y-self.border, self.absoluteSize.x+self.border*2, self.absoluteSize.y+self.border*2)

	-- background
	love.graphics.setColor(self.backgroundColor:toTable())
	love.graphics.rectangle("fill", self.absolutePosition.x, self.absolutePosition.y, self.absoluteSize.x, self.absoluteSize.y)
	
	love.graphics.setFont(self.font)
	love.graphics.setColor(self.textColor:toTable())
	love.graphics.printf(self.shownText, self.absolutePosition.x, self.absolutePosition.y, self.absoluteSize.x, self.textAlign)
	self:renderchildren()


end

function InputLabel:update(delta)
    self:calculateAbsolutes()
    self:checkMouse()
    
    self.timer = self.timer + delta
    if self.hasFocus then
        if self.timer > 0.5 then
            self.shownText = self.text .. "_"
            self.timer = 0
        elseif self.timer < 0.25 then
            self.shownText = self.text .. "_"
        else
            self.shownText = self.text
        end
    else
        self.shownText = self.text
    end

    if love.keyboard.isDown("escape") then
        self.hasFocus = false
        self.inputEndedEvent:fire(false)
    end

    if love.keyboard.isDown("enter") then
        self.hasFocus = false
        self.inputEndedEvent:fire(true)
    end

    if self.mouseIn then
        if self.mouseDown == false and love.mouse.isDown(1) then
        print("kike")
            self.mouseDown = true
            self.hasFocus = true
            self.inputBeganEvent:fire()
            self.mouseDownEvent:fire()
        elseif (self.mouseDown == true) and love.mouse.isDown(1) == false then
            self.mouseDown = false
            self.mouseUpEvent:fire()
        end

    end
	self:updatechildren(dt)

end

function InputLabel:setFocus(mode)
    if mode == true then
        self.hasFocus = true
        self.inputBeganEvent:fire()
    end

    if mode == false then
        self.hasFocus = false
        self.inputEndedEvent:fire(false)
    end
end

function InputLabel:input(char)
    if self.hasFocus then
        self.text = self.text .. char
    end
end

function InputLabel:keypress(char)
    if char == "backspace" then
        if self.hasFocus then
            self.text = self.text:sub(1, -2)
        end
    end
end
--[[

]]

return InputLabel
local Label = require("Label")
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
    self.inputBeganEvent = Event.initialize()
    self.inputEndedEvent = Event.initialize()

end

function InputLabel:render()
    self.absoluteSize = Vector2D.new(self.sizeOffset.x + self.parent.absoluteSize.x * self.sizeScale.x, self.sizeOffset.y + self.parent.absoluteSize.y * self.sizeScale.y)
	self.absolutePosition = Vector2D.new(self.parent.absolutePosition.x + self.positionOffset.x + self.parent.absoluteSize.x  * self.positionScale.x,  self.parent.absolutePosition.y + self.positionOffset.y + self.parent.absoluteSize.y  * self.positionScale.y)

	-- border
	
	love.graphics.setColor(self.borderColor:toTable())
	love.graphics.rectangle("fill", self.absolutePosition.x-self.border, self.absolutePosition.y-self.border, self.absoluteSize.x+self.border*2, self.absoluteSize.y+self.border*2)

	-- background
	love.graphics.setColor(self.backgroundColor:toTable())
	love.graphics.rectangle("fill", self.absolutePosition.x, self.absolutePosition.y, self.absoluteSize.x, self.absoluteSize.y)
	
	love.graphics.setFont(self.font)
	love.graphics.setColor(self.textColor:toTable())
	love.graphics.printf(self.text, self.absolutePosition.x, self.absolutePosition.y, self.absoluteSize.x, self.textAlign)
	self:renderchildren()
end

function InputLabel:update(delta)
    if love.keyboard.isDown("escape") then
        self.hasFocus = false
        self.inputEventEnded:fire(false)
    end

    if love.keyboard.isDown("enter") then
        self.hasFocus = false
        self.inputEndedEvent:fire(true)
    end
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
        self.text = self.text + input
    end
end

--[[
function love.textinput(t)
    
end
]]
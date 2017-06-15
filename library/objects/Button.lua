local Event = require("library/core/Event")
local RGBColor = require("library/datatypes/RGBColor")
local Vector2D = require("library/datatypes/Vector2D")
local Label = require("library/objects/Label")

local Button = {}

Button.__index = Button

setmetatable(Button, {
	__index = Label, -- this is what makes the inheritance work
	__call = function (cls, ...)
		local self = setmetatable({}, cls)
		self:_init(...)
		return self
	end,
})

function Button:_init()
	
	Label._init(self) -- call the base class constructor
	table.insert(self.__inheritance, "TextLabel")
	self.children = {}
    self.mouseDown = false

    self.mouseDownEvent = Event.initialize()
	self.mouseUpEvent = Event.initialize()

end

function Button:update(dt)
    local mX, mY = love.mouse.getX(), love.mouse.getY()
	local sX, sY, sW, sH = self.absolutePosition.x, self.absolutePosition.y, self.absoluteSize.x, self.absoluteSize.y
	if (mX > sX and mX < (sX + sW)) and (mY > sY and mY < (sY + sY))  then
		if self.mouseIn == false then
			self.mouseIn = true
			self.mouseEnterEvent:fire()
		end
	else
		if self.mouseIn == true then
			self.mouseIn = false
			self.mouseLeaveEvent:fire()
		end
	end


    if self.mouseIn then
        if self.mouseDown == false and love.mouse.isDown(1) then
            self.mouseDown = true
            self.mouseDownEvent:fire()
        elseif (self.mouseDown == true) and love.mouse.isDown(1) == false then
            self.mouseDown = false
            self.mouseUpEvent:fire()
        end

    end
	self.absoluteSize = Vector2D.new(love.graphics.getWidth(), love.graphics.getHeight())
	self.absolutePosition = Vector2D.new(0, 0)

    self:updatechildren(dt)
end

return Button
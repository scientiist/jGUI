local Event = require("core/Event")
local RGBColor = require("datatypes/RGBColor")
local Vector2D = require("datatypes/Vector2D")
local Label = require("objects/Label")

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
	self.absoluteSize = Vector2D.new(self.sizeOffset.x + self.parent.absoluteSize.x * self.sizeScale.x, self.sizeOffset.y + self.parent.absoluteSize.y * self.sizeScale.y)
	self.absolutePosition = Vector2D.new(self.positionOffset.x + self.parent.absolutePosition.x * self.positionScale.x,  self.positionOffset.y + self.parent.absolutePosition.y * self.positionScale.y)


    self:updatechildren(dt)
end

return Button
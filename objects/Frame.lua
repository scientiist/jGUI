--[[
	Frame class - Frame()
		table<GUIObject> getChildren()
		void setSize(Vector2D offset, Vector2D scale)
		void setPosition(Vector2D offset, Vector2D scale)
		Vector2D, Vector2D getSize()
		Vector2D, Vector2D getPosition()
]]--
local Event = require("core/Event")

local RGBColor = require("datatypes/RGBColor")
local Vector2D = require("datatypes/Vector2D")
local GUIObject = require("objects/GUIObject")

local Frame = {}

Frame.__index = Frame

setmetatable(Frame, {
	__index = GUIObject, -- this is what makes the inheritance work
	__call = function (cls, ...)
		local self = setmetatable({}, cls)
		self:_init(...)
		return self
	end,
})

function Frame:_init()
	
	GUIObject._init(self) -- call the base class constructor
	table.insert(self.__inheritance, "Frame")
	self.children = {}
	self.mouseIn = false
	-- public variables
	self.parent = nil
	self.backgroundColor = RGBColor.new(255,255,255)
	self.border = 2
	self.borderColor = RGBColor.new(0,0,0)
	self.sizeOffset = Vector2D.new(300,150)
	self.sizeScale = Vector2D.new(0,0)
	self.positionOffset = Vector2D.new(50,50)
	self.positionScale = Vector2D.new(0,0)
	self.absoluteSize = Vector2D.new(0,0)
	self.absolutePosition = Vector2D.new(0,0)


	self.mouseEnterEvent = Event.initialize()
	self.mouseLeaveEvent = Event.initialize()

end

function Frame:render()
	-- border
	
	
	love.graphics.setColor(self.borderColor:toTable())
	love.graphics.rectangle("fill", self.absolutePosition.x-self.border, self.absolutePosition.y-self.border, self.absoluteSize.x+self.border*2, self.absoluteSize.y+self.border*2)

	-- background
	love.graphics.setColor(self.backgroundColor:toTable())
	love.graphics.rectangle("fill", self.absolutePosition.x, self.absolutePosition.y, self.absoluteSize.x, self.absoluteSize.y)
	
	
	self:renderchildren()
end

function Frame:calculateAbsolutes()
	self.absoluteSize = Vector2D.new(
		self.sizeOffset.x + (self.parent.absoluteSize.x * self.sizeScale.x),
		self.sizeOffset.y + (self.parent.absoluteSize.y * self.sizeScale.y)
	)

	self.absolutePosition = Vector2D.new(
		self.parent.absolutePosition.x + self.positionOffset.x + (self.parent.absoluteSize.x * self.positionScale.x),
		self.parent.absolutePosition.y + self.positionOffset.y + (self.parent.absoluteSize.y * self.positionScale.y)
	)
end

function Frame:checkMouse()
	local mX, mY = love.mouse.getX(), love.mouse.getY()
	local sX, sY, sW, sH = self.absolutePosition.x, self.absolutePosition.y, self.absoluteSize.x, self.absoluteSize.y
	if (mX > sX and mX < (sX + sW)) and (mY > sY and mY < (sY + sH))  then
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
end

function Frame:update(dt)

	self:calculateAbsolutes()
	self:checkMouse()
	

	self:updatechildren(dt)
end

function Frame:getBackgroundColor()
	return self.backgroundColor
end

function Frame:getBorder()
	return self.border
end

function Frame:getBorderColor()
	return self.borderColor
end

function Frame:getPosition()
	return self.sizeOffset, self.sizeScale
end


function Frame:getSize()
	return self.sizeOffset, self.sizeScale
end

function Frame:setBackgroundColor(color)
	self.backgroundColor = color
end

function Frame:setBorder(px)
	self.border = px
end

function Frame:setBorderColor(color)
	self.borderColor = color
end

function Frame:setPosition(offset, scale)

	self.positionOffset = offset
	
	self.positionScale = scale
end


function Frame:setSize(offset, scale)
	self.sizeOffset = offset
	self.sizeScale = scale
end




return Frame
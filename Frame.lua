--[[
	Frame class - Frame()
		table<GUIObject> getChildren()
		void setSize(Vector2D size, bool scale)
		void setPosition(Vector2D size, bool scale)
		Vector2D getSize()
		Vector2D getPosition()
]]--

local RGBColor = require("datatypes/RGBColor")
local Vector2D = require("datatypes/Vector2D")
local GUIObject = require("GUIObject")

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

	-- public variables
	self.parent = nil
	self.backgroundColor = RGBColor.new(255,255,255)
	self.border = 2
	self.borderColor = RGBColor.new(0,0,0)
	self.size = Vector2D.new(300,150)
	self.position = Vector2D.new(50,50)

	RGBColor:new(0,0,255)
end

function Frame:render()
	

	-- border
	
	love.graphics.setColor(self.borderColor:toTable())
	love.graphics.rectangle("fill", self.position.x-self.border, self.position.y-self.border, self.size.x+self.border*2, self.size.y+self.border*2)

	-- background
	love.graphics.setColor(self.backgroundColor:toTable())
	love.graphics.rectangle("fill", self.position.x, self.position.y, self.size.x, self.size.y)
	
	
	self:renderchildren()
end

function Frame:getChildren()
	return self.children
end

function Frame:getPosition()

end

function Frame:getSize()

end

function Frame:setPosition(pos, scale)
	if scale == nil or scale == false then
		self.position = pos
	else
		self.position = (pos * Vector2D(love.graphics.getWidth, love.graphics.getHeight))
	end
end

function Frame:setSize(size, scale)
	if scale == nil or scale == false then
		self.size = size
	end
end

function Frame:setParent(parent)
	self.parent = parent
	table.insert(parent.children, self)
	
end

function Frame:getParent()
	return self.parent
end


return Frame
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
	self.parent = {}
	self.backgroundColor = RGBColor:new(255,255,255)
	self.border = 2
	self.borderColor = RGBColor:new(0,0,0)
	self.size = Vector2D:new(100,30)
	self.position = Vector2D:new(50,50)
end

function Frame:_render()
	self._renderchildren()

	-- border
	love.graphics.setColor(self.backgroundColor.r, self.backgroundColor.g)
	love.graphics.rectangle("fill", self.position.x-self.border, self.position.y-self.border, self.size.x+self.border*2, self.size.y+self.border*2)

	-- background
	love.graphics.rectangle("fill", self.position.x, self.position.y, self.size.x, self.size.y)
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


return Frame
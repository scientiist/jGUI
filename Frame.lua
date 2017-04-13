local RGBColor = require("datatypes/RGBColor")


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
	self._children = {}

	-- public variables
	self.Parent = {}
	self.BackgroundColor = RGBColor:new(255,255,255)
	self.BorderThickness = 2
	self.BorderColor = RGBColor:new(0,0,0)
end

function Frame:_render()
	self._renderchildren()

	-- background
	love.graphics.rectangle("fill")
end

function Frame:getChildren()
	return self._children
end


return Frame
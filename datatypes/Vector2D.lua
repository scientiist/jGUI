--[[
	Vector2D DataType
]]--

local Vector2D = {}

function Vector2D:_init()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Vector2D:new(x, y)
	local s = RGBColor:_init()
	s._x = x
	s._y = y
	return s
end

return Vector2D
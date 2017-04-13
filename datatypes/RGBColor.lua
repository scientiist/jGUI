--[[
	RGBColor DataType
]]--

local RGBColor = {}

function RGBColor:_init()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function RGBColor:new(r, g, b, a)
	local s = RGBColor:_init()
	s._red = (r or 0)
	s._green = (g or 0)
	s._blue = (b or 0)
	s._alpha = (a or 0)
	return s
end

return RGBColor
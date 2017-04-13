local RGBColor = {}

function RGBColor:_init()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end


function RGBColor:new(r, g, b, a)
	local s = RGBColor:_init()
	s.red = (r or 0)
	s.green = (g or 0)
	s.blue = (b or 0)
	s.alpha = (a or 0)
	return s
end

return RGBColor
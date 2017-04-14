local RGBColor = {}
RGBColor.__index = RGBColor

function RGBColor.new(r, g, b, a)
	local self = setmetatable({}, RGBColor)
	self.r = r
	self.g = g
	self.b = b
	self.a = a
	return self
end

return RGBColor
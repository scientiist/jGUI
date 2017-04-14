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

function RGBColor:toTable()
	return {self.r, self.g, self.b, self.a}
end

return RGBColor
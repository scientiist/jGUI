--[[
	Vector2D DataType
		Vector2D new(number x, number y)

	Vector2D library
		Vector2D add(Vector2D a, Vector2D b)
		Vector2D add(Vector2D a, number b)
		Vector2D subtract(Vector2D a, Vector2D b)
		Vector2D subtract(Vector2D a, number b)
		Vector2D multiply(Vector2D a, Vector2D b)
		Vector2D multiply(Vector2D a, number b)
		Vector2D divide(Vector2D a, Vector2D b)
		Vector2D divide(Vector2D a, number b)
]]--

local Vector2D = {}

function Vector2D:_init()
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end


function Vector2D:new(x, y)
	local s = Vector2D:_init()
	s.x = x
	s.y = y
	return s
end

-- static functions, has nothing to do with the Vector2D() class --

function Vector2D.add(vec1, vec2)
	if type(vec2) == "number" then
		return Vector2D(vec1.x + vec2, vec1.y + vec2)
	else
		return Vector2D(vec1.x + vec2.x, vec1.y + vec2.y)
	end
end

function Vector2D.subtract(vec1, vec2)
	if type(vec2) == "number" then
		return Vector2D(vec1.x - vec2, vec1.y - vec2)
	else
		return Vector2D(vec1.x - vec2.x, vec1.y - vec2.y)
	end
end

function Vector2D.multiply(vec1, vec2)
	if type(vec2) == "number" then
		return Vector2D(vec1.x * vec2, vec1.y * vec2)
	else
		return Vector2D(vec1.x * vec2.x, vec1.y * vec2.y)
	end
end

function Vector2D.divide(vec1, vec2)
	if type(vec2) == "number" then
		return Vector2D(vec1.x / vec2, vec1.y / vec2)
	else
		return Vector2D(vec1.x / vec2.x, vec1.y / vec2.y)
	end
end

return Vector2D
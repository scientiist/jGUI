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
Vector2D.__index = Vector2D

function Vector2D.new(x, y)
	local self = setmetatable({}, Vector2D)
	self.x = x
	self.y = y
	return self
end

-- static functions, has nothing to do with the Vector2D() class --

function Vector2D.add(vec1, vec2)
	if type(vec2) == "number" then
		return Vector2D.new(vec1.x + vec2, vec1.y + vec2)
	else
		return Vector2D.new(vec1.x + vec2.x, vec1.y + vec2.y)
	end
end

function Vector2D.subtract(vec1, vec2)
	if type(vec2) == "number" then
		return Vector2D.new(vec1.x - vec2, vec1.y - vec2)
	else
		return Vector2D.new(vec1.x - vec2.x, vec1.y - vec2.y)
	end
end

function Vector2D.multiply(vec1, vec2)
	if type(vec2) == "number" then
		return Vector2D.new(vec1.x * vec2, vec1.y * vec2)
	else
		return Vector2D.new(vec1.x * vec2.x, vec1.y * vec2.y)
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
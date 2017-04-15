--[[
	GUIContainer Class

	table<GUIObject> getChildren(),
	GUIObject parent,


]]--

local Object = require("Object")
local Vector2D = require("datatypes/Vector2D")

local GUIContainer = {}

GUIContainer.__index = GUIContainer

setmetatable(GUIContainer, {
	__index = Object, -- this is what makes the inheritance work
	__call = function (cls, ...)
		local self = setmetatable({}, cls)
		self:_init(...)
		return self
	end,
})

function GUIContainer:_init()
	
	Object._init(self) -- call the base class constructor
	table.insert(self.__inheritance, "GUIContainer")
	self.children = {}
	self.absoluteSize = Vector2D.new(love.graphics.getWidth(), love.graphics.getHeight())
	self.absolutePosition = Vector2D.new(0, 0)

end

function GUIContainer:renderchildren()

	for inc, obj in pairs(self.children) do
		obj:render()
	end
end

function GUIContainer:render()
	self:renderchildren()
end

function GUIContainer:update(dt)
	self.absoluteSize = Vector2D.new(love.graphics.getWidth(), love.graphics.getHeight())
	self.absolutePosition = Vector2D.new(0, 0)
end

function GUIContainer:getChildren()
	return self.children
end


return GUIContainer
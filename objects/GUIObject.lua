local Object = require("core/Object")
local Vector2D = require("datatypes/Vector2D")
local RGBColor = require("datatypes/RGBColor")
local Event = require("core/Event")
local GUIObject = {}

GUIObject.__index = GUIObject

setmetatable(GUIObject, {
	__index = Object, -- this is what makes the inheritance work
	__call = function (cls, ...)
		local self = setmetatable({}, cls)
		self:_init(...)
		return self
	end,
})

function GUIObject:_init()
	
	Object._init(self) -- call the base class constructor
	table.insert(self.__inheritance, "GUIObject")
	self.children = {}

	-- public variables
	self.parent = nil
	self.backgroundColor = RGBColor:new(255,255,255)
	self.absoluteSize = Vector2D.new(0,0)
	self.absolutePosition = Vector2D.new(0, 0)

	self.onRenderEvent = Event.initialize()
	self.onUpdateEvent = Event.initialize()
end


function GUIObject:update(dt)
	self.absoluteSize = Vector2D.new(love.graphics.getWidth(), love.graphics.getHeight())
	self:updatechildren(dt)
end

function GUIObject:render()
	self:renderchildren()
end

function GUIObject:getChildren()
	return self.children
end

function GUIObject:setParent(parent)
	self.parent = parent
	table.insert(parent.children, self)
	
end

function GUIObject:getParent()
	return self.parent
end

function GUIObject:renderchildren()

	for inc, obj in pairs(self.children) do
		obj:render()
	end
end

function GUIObject:updatechildren(dt)
	for inc, obj in pairs(self.children) do
		obj:update(dt)
	end
end

return GUIObject
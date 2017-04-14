--[[
	GUIContainer Class

	table<GUIObject> getChildren(),
	GUIObject parent,


]]--

local Object = require("Object")

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

end

function GUIContainer:getChildren()
	return self.children
end


return GUIContainer
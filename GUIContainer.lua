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
	self._children = {}

	-- public variables
	self.Parent = {}
end

function GUIContainer:_renderchildren()
	for inc, obj in pairs(self._children) do
		obj:_render()
	end
end

function GUIContainer:_render()
	self._renderchildren()
end

function GUIContainer:getChildren()
	return self._children
end


return GUIContainer
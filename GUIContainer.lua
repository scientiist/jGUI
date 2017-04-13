--[[
	GUIContainer Class

	getChildren() : table<GUIObject>
	getParent() : GUIObject


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
	table.insert(GUIContainer.__inheritance, "GUIContainer")
	self._children = {}

	-- public variables
	self.Parent = {}
end

function GUIContainer:_render()
	return self.value + self.value2
end

function GUIContainer:getChildren()

end


return GUIContainer
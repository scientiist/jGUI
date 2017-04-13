local RGBColor = require("datatypes/RGBColor")


local GUIContainer = require("GUIContainer")

local GUIObject = {}

GUIObject.__index = GUIObject

setmetatable(GUIObject, {
	__index = GUIContainer, -- this is what makes the inheritance work
	__call = function (cls, ...)
		local self = setmetatable({}, cls)
		self:_init(...)
		return self
	end,
})

function GUIObject:_init()
	
	GUIContainer._init(self) -- call the base class constructor
	table.insert(self.__inheritance, "GUIObject")
	self._children = {}

	-- public variables
	self.Parent = {}
	self.BackgroundColor = RGBColor:new(255,255,255)
end

function GUIObject:_render()
	self._renderchildren()
end

function GUIObject:getChildren()
	return self._children
end


return GUIObject
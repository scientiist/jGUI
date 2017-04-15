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
	self.children = {}

	-- public variables
	self.parent = nil
	self.backgroundColor = RGBColor:new(255,255,255)
end

function GUIObject:render()
	self:renderchildren()
end

function GUIObject:getChildren()
	return self.children
end


return GUIObject
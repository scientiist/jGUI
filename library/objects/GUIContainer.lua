--[[
	GUIContainer Class

	table<GUIObject> getChildren(),
	GUIObject parent,


]]--

local GUIObject = require("library/objects/GUIObject")
local Vector2D = require("library/datatypes/Vector2D")

local GUIContainer = {}

GUIContainer.__index = GUIContainer

setmetatable(GUIContainer, {
	__index = GUIObject, -- this is what makes the inheritance work
	__call = function (cls, ...)
		local self = setmetatable({}, cls)
		self:_init(...)
		return self
	end,
})

function GUIContainer:_init()
	
	GUIObject._init(self) -- call the base class constructor
	table.insert(self.__inheritance, "GUIContainer")
	self.children = {}
	self.absoluteSize = Vector2D.new(love.graphics.getWidth(), love.graphics.getHeight())
	self.absolutePosition = Vector2D.new(0, 0)

end




return GUIContainer
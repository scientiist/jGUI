
local RGBColor = require("library/datatypes/RGBColor")
local Vector2D = require("library/datatypes/Vector2D")
local Label = require("library/objects/Label")

local Button = {}

Button.__index = Button

setmetatable(Button, {
	__index = Label, -- this is what makes the inheritance work
	__call = function (cls, ...)
		local self = setmetatable({}, cls)
		self:_init(...)
		return self
	end,
})

function Button:_init()
	
	Label._init(self) -- call the base class constructor
	table.insert(self.__inheritance, "TextLabel")
	self.children = {}

end

return Button
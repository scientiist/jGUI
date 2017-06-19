local Event = require("core/Event")
local RGBColor = require("datatypes/RGBColor")
local Vector2D = require("datatypes/Vector2D")
local Label = require("objects/Label")

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
    self.mouseDown = false

    self.mouseDownEvent = Event.initialize()
	self.mouseUpEvent = Event.initialize()

end

function Button:update(dt)
	self:calculateAbsolutes()

    self:checkMouse()

    if self.mouseIn then
        if self.mouseDown == false and love.mouse.isDown(1) then
            self.mouseDown = true
            self.mouseDownEvent:fire()
        elseif (self.mouseDown == true) and love.mouse.isDown(1) == false then
            self.mouseDown = false
            self.mouseUpEvent:fire()
        end

    end

    self:updatechildren(dt)
end

return Button
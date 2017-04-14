--[[
	TextLabel class - TextLabel()
		table<GUIObject> getChildren()
		void setSize(Vector2D size, bool scale)
		void setPosition(Vector2D size, bool scale)
		Vector2D getSize()
		Vector2D getPosition()
]]--

local RGBColor = require("datatypes/RGBColor")
local Vector2D = require("datatypes/Vector2D")
local GUIObject = require("GUIObject")

local TextLabel = {}

TextLabel.__index = TextLabel

setmetatable(TextLabel, {
	__index = Frame, -- this is what makes the inheritance work
	__call = function (cls, ...)
		local self = setmetatable({}, cls)
		self:_init(...)
		return self
	end,
})

function TextLabel:_init()
	
	Frame._init(self) -- call the base class constructor
	table.insert(self.__inheritance, "TextLabel")
	self.children = {}

	-- public variables
	self.text = ""
	self.textAlign = "left"
	self.textColor = RGBColor.new(0,0,0)
	self.parent = nil
	self.backgroundColor = RGBColor.new(255,255,255)
	self.border = 2
	self.borderColor = RGBColor.new(0,0,0)
	self.size = Vector2D.new(300,150)
	self.position = Vector2D.new(50,50)

	RGBColor:new(0,0,255)
end

function TextLabel:render()
	

	-- border
	
	love.graphics.setColor(self.borderColor:toTable())
	love.graphics.rectangle("fill", self.position.x-self.border, self.position.y-self.border, self.size.x+self.border*2, self.size.y+self.border*2)

	-- background
	love.graphics.setColor(self.backgroundColor:toTable())
	love.graphics.rectangle("fill", self.position.x, self.position.y, self.size.x, self.size.y)

	love.graphics.setColor(self.textColor:toTable())
	love.graphics.printf(self.text, self.position.x, self.position.y, self.size.x, self.textAlign)
	
	
	self:renderchildren()
end



return Frame
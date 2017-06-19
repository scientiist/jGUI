--[[
	ImageLabel class - ImageLabel()

		table<GUIObject> getChildren()
		void setSize(Vector2D offset, Vector2D scale)
		void setPosition(Vector2D offset, Vector2D scale)
		Vector2D, Vector2D getSize()
		Vector2D, Vector2D getPosition()
]]--

function getImageScaleForNewDimensions( image, newWidth, newHeight )
    local currentWidth, currentHeight = image:getDimensions()
    return ( newWidth / currentWidth ), ( newHeight / currentHeight )
end

local Event = require("core/Event")
local RGBColor = require("datatypes/RGBColor")
local Vector2D = require("datatypes/Vector2D")
local Frame = require("objects/Frame")

local ImageLabel = {}

ImageLabel.__index = ImageLabel

setmetatable(ImageLabel, {
	__index = Frame, -- this is what makes the inheritance work
	__call = function (cls, ...)
		local self = setmetatable({}, cls)
		self:_init(...)
		return self
	end,
})

function ImageLabel:_init()
	
	Frame._init(self) -- call the base class constructor
	table.insert(self.__inheritance, "ImageLabel")
	self.children = {}

	-- public variables
	self.parent = nil
	self.backgroundColor = RGBColor.new(255,255,255)
	self.border = 2
	self.borderColor = RGBColor.new(0,0,0)
	self.sizeOffset = Vector2D.new(300,150)
	self.sizeScale = Vector2D.new(1,0)
	self.positionOffset = Vector2D.new(50,50)
	self.positionScale = Vector2D.new(0,0)
	self.absoluteSize = Vector2D.new(0,0)
	self.absolutePosition = Vector2D.new(0,0)
	self.mouseEnterEvent = Event.initialize()
	self.mouseLeaveEvent = Event.initialize()

	self.image = nil
    self.imageColor = RGBColor.new(255,255,255)
end

function ImageLabel:render()


	-- border
	
	love.graphics.setColor(self.borderColor:toTable())
	love.graphics.rectangle("fill", self.absolutePosition.x-self.border, self.absolutePosition.y-self.border, self.absoluteSize.x+self.border*2, self.absoluteSize.y+self.border*2)

	-- background
	love.graphics.setColor(self.backgroundColor:toTable())
	love.graphics.rectangle("fill", self.absolutePosition.x, self.absolutePosition.y, self.absoluteSize.x, self.absoluteSize.y)

    local scaledX, scaledY = getImageScaleForNewDimensions(self.image, self.absoluteSize.x, self.absoluteSize.y)
    if self.image then
        love.graphics.setColor(self.imageColor:toTable())
        love.graphics.draw(self.image, self.absolutePosition.x, self.absolutePosition.y, 0, scaledX, scaledY) 
    end
	self:renderchildren()
end


function ImageLabel:setImage(image)
    self.image = image
end

function ImageLabel:getImage()
    return self.image
end



return ImageLabel
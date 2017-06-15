local Event = {}
Event.__index = Event

function Event.initialize()
	local self = setmetatable({}, Event)
	self.func = function() end
	return self
end

function Event:connect(givenFunction)
	self.func = givenFunction
end

function Event:disconnect()
	self.func = function() end
end

function Event:fire(...)
	self.func(...)
end

return Event
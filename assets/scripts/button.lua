local classes = require "classes"
local Button = classes.class()

function Button:init(buttontype, texture, texturehighlighted, x, y, xsize, ysize, slant, level)
	self.type = buttontype
	self.x = x
	self.y = y
	self.xsize = xsize
	self.ysize = ysize

	self.dx = 0
	self.dy = 0

	self.drawable = love.graphics.newImage(texture)
	self.drawablehighlighted = love.graphics.newImage(texturehighlighted)

	self.enabled = false
	self.highlighted = false
	self.slant = slant * (math.pi / 180)

	self.stopmoving = 0

	self.level = level
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Get

function Button:getX()
	return self.x
end

function Button:getY()
	return self.y
end

function Button:getXSize()
	return self.xsize
end

function Button:getYSize()
	return self.ysize
end

function Button:isHighlighted()
	return self.highlighted
end

function Button:getType()
	return self.type
end

function Button:getLevel()
	return self.level
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Set

function Button:setHighlighted(bool)
	self.highlighted = bool
end

function Button:enableButton()
	self.enabled = true
end

function Button:disableButton()
	self.enabled = false
end

function Button:draw()
	if (self.highlighted) then
		love.graphics.draw(self.drawablehighlighted, self.x, self.y, self.slant)
	else
		love.graphics.draw(self.drawable, self.x, self.y, self.slant)
	end
end

return Button

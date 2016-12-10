local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'

local background = {}
local image

function background.load(game)
	image = love.graphics.newImage('assets/sprites/background/bg.jpg')
end

function background.update(dt)

end

function background.draw()
	love.graphics.draw(image)
end

return background

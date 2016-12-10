local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage1 = {}
local image

function stage1.load(game, camera)
	image = love.graphics.newImage('assets/sprites/background/bg.jpg')
	arrows.load(game, camera)
end

function stage1.update(dt, game)
	arrows.update(dt)
end

function stage1.draw()
	love.graphics.draw(image)
	arrows.draw()
end

return stage1

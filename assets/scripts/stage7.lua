local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage7 = {}
local image

function stage7.load(game, camera)
	image = love.graphics.newImage('assets/sprites/background/fondo_armario.jpg')
	stage7.world = { w = image:getWidth(), h= 720}
	game:setNewSizeWorld(stage7.world.w, stage7.world.h)
	arrows.load(game, stage7, camera)
	game.canvas.x = game.window.width / 2
end

function stage7.update(dt, game)
	arrows.update(dt)
end

function stage7.draw()
	love.graphics.draw(image)
	arrows.draw()
end

return stage7

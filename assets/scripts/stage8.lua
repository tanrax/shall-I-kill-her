local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage8 = {}
local image

function stage8.load(game, camera)
	image = love.graphics.newImage('assets/sprites/background/fondo_vacio.jpg')
	stage8.world = { w = image:getWidth(), h= 720}
	game:setNewSizeWorld(stage8.world.w, stage8.world.h)
	arrows.load(game, stage8, camera)
	game.canvas.x = game.window.width / 2
end

function stage8.update(dt, game)
	arrows.update(dt)
end

function stage8.draw()
	love.graphics.draw(image)
	arrows.draw()
end

return stage8

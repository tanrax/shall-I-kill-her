local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage6 = {}
local image

function stage6.load(game, camera)
	image = love.graphics.newImage('assets/sprites/background/fondo_chimenea.jpg')
	stage6.world = { w = image:getWidth(), h= 720}
	game:setNewSizeWorld(stage6.world.w, stage6.world.h)
	arrows.load(game, stage6, camera)
	game.canvas.x = game.window.width / 2
end

function stage6.update(dt, game)
	arrows.update(dt)
end

function stage6.draw()
	love.graphics.draw(image)
	arrows.draw()
end

return stage6

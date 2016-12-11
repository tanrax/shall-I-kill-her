local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage2 = {}
local image

function stage2.load(game, camera)
	image = love.graphics.newImage('assets/sprites/background/fondo_libros.jpg')
	stage2.world = { w = image:getWidth(), h= 720}
	game:setNewSizeWorld(stage2.world.w, stage2.world.h)
	arrows.load(game, stage2, camera)
	game.canvas.x = game.window.width / 2
end

function stage2.update(dt, game)
	arrows.update(dt)
end

function stage2.draw()
	love.graphics.draw(image)
	arrows.draw()
end

return stage2

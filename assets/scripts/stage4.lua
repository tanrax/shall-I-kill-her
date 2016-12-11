local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage4 = {}
local image

function stage4.load(game, camera)
	image = love.graphics.newImage('assets/sprites/background/fondo_libros.jpg')
	stage4.world = { w = image:getWidth(), h= 720}
	game:setNewSizeWorld(stage4.world.w, stage4.world.h)
	arrows.load(game, stage4, camera)
	game.canvas.x = game.window.width / 2
end

function stage4.update(dt, game)
	arrows.update(dt)
end

function stage4.draw()
	love.graphics.draw(image)
	arrows.draw()
end

return stage4

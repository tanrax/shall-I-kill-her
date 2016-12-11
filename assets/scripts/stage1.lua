local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage1 = {}
local image

function stage1.load(game, camera)
	image = love.graphics.newImage('assets/sprites/background/fondo_fotomadre.jpg')
	stage1.world = { w = image:getWidth(), h= 720}
	game:setNewSizeWorld(stage1.world.w, stage1.world.h)
	arrows.load(game, stage1, camera)
	game.canvas.x = game.window.width
end

function stage1.update(dt, game)
	arrows.update(dt)
end

function stage1.draw()
	love.graphics.draw(image)
	arrows.draw()
end

return stage1

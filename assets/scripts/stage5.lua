local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage5 = {}
local image

function stage5.load(game, camera)
	image = love.graphics.newImage('assets/sprites/background/fondo_tocadiscos.jpg')
	stage5.world = { w = image:getWidth(), h= 720}
	game:setNewSizeWorld(stage5.world.w, stage5.world.h)
	arrows.load(game, stage5, camera)
	game.canvas.x = game.window.width / 2
end

function stage5.update(dt, game)
	arrows.update(dt)
end

function stage5.draw()
	love.graphics.draw(image)
	arrows.draw()
end

return stage5

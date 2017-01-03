local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stress = {}
local image

function stress.load(game, camera)
	image = love.graphics.newImage('assets/sprites/stress/stress.png')

end

function stress.update(dt, game)
	stress.stress = game.stress
	arrows.update(dt)
end

function stress.draw()
	if stress.stress == true then
		cam_x, cam_y = camera.gcam:getVisible()
		love.graphics.setColor(255, 255, 255, 90)
		love.graphics.draw(image, cam_x, cam_y)
	end
end

return stress

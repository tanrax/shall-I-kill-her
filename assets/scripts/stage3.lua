local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage3 = {}
local image

function stage3.load(game, camera)
	image_libreria = love.graphics.newImage('assets/sprites/libreria/libreria.jpg')
	image_libreria_hover = love.graphics.newImage('assets/sprites/libreria/libreria_hover.jpg')
	image_libreria_none = love.graphics.newImage('assets/sprites/libreria/libreria_none.jpg')
	stage3.world = { w = image_libreria:getWidth(), h= 720}
	game:setNewSizeWorld(stage3.world.w, stage3.world.h)
	arrows.load(game, stage3, camera)
	game.canvas.x = game.window.width / 2
end

local count_time = 0
function stage3.update(dt, game)
	arrows.update(dt)
	if game.status == 5  then
		if count_time > 15 then
  			game.bells_enable = true
			game.status = 6
		else
			count_time = dt + count_time
		end
	end
end

function stage3.draw(game)
	local mos_x, mos_y = love.mouse.getPosition()
	-- No object
	if game.status > 5  then
		love.graphics.draw(image_libreria_none)
	else
		love.graphics.draw(image_libreria)
	end
	if game.status == 5  then
		-- Normal
		love.graphics.draw(image_libreria)
		-- Hover
	  	cam_x, cam_y = camera.gcam:getVisible()
		if mos_x + cam_x > 709 and mos_x + cam_x < 791 and mos_y - cam_y > 202 and mos_y - cam_y < 354 then
			love.graphics.draw(image_libreria_hover)
		end
	end
	arrows.draw()
end

function stage3.mousepressed(game, messages, camera)
	local mos_x, mos_y = love.mouse.getPosition()
	if game.status == 5  then
	  	cam_x, cam_y = camera.gcam:getVisible()
		if mos_x + cam_x > 709 and mos_x + cam_x < 791 and mos_y - cam_y > 202 and mos_y - cam_y < 354 then
			game.status = 6
			messages.new_message('cap2stage', 15)
		end
	end
end

return stage3

local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage4 = {}
local image

function stage4.load(game, camera)
	image_libreria = love.graphics.newImage('assets/sprites/chimenea/chimenea.jpg')
	image_libreria_hover = love.graphics.newImage('assets/sprites/chimenea/chimenea_hover.jpg')
	image_libreria_none = love.graphics.newImage('assets/sprites/chimenea/chimenea_none.jpg')
	stage4.world = { w = image_libreria:getWidth(), h= 720}
	game:setNewSizeWorld(stage4.world.w, stage4.world.h)
	arrows.load(game, stage4, camera)
	game.canvas.x = game.window.width / 2
end

local count_time = 0
function stage4.update(dt, game)
	arrows.update(dt)
	if game.status == 6  then
		if count_time > 15 then
  			game.bells_enable = true
			game.status = 6
		else
			count_time = dt + count_time
		end
	end
end

function stage4.draw(game)
	local mos_x, mos_y = love.mouse.getPosition()
	-- No object
	if game.status > 6  then
		love.graphics.draw(image_libreria_none)
	else
		love.graphics.draw(image_libreria)
	end
	if game.status == 6  then
		-- Normal
		love.graphics.draw(image_libreria)
		-- Hover
	  	cam_x, cam_y = camera.gcam:getVisible()
		if mos_x + cam_x > 1050 and mos_x + cam_x < 2000 and mos_y - cam_y > 220 and mos_y - cam_y < 275 then
			love.graphics.draw(image_libreria_hover)
		end
	end
	arrows.draw()
end

function stage4.mousepressed(game, messages, camera)
	local mos_x, mos_y = love.mouse.getPosition()
	if game.status == 6  then
	  	cam_x, cam_y = camera.gcam:getVisible()

		if mos_x + cam_x > 1050 and mos_x + cam_x < 2000 and mos_y - cam_y > 202 and mos_y - cam_y < 354 then
			game.status = 7
			messages.new_message('cap3stage', 15)
		end
	end
end

return stage4

local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage6 = {}
local image

function stage6.load(game, camera)
	image_sujetador = love.graphics.newImage('assets/sprites/sujetador/sujetador.jpg')
	image_sujetador_hover = love.graphics.newImage('assets/sprites/sujetador/sujetador_hover.jpg')
	image_sujetador_none = love.graphics.newImage('assets/sprites/sujetador/sujetador_none.jpg')
	stage6.world = { w = image_sujetador:getWidth(), h= 720}
	game:setNewSizeWorld(stage6.world.w, stage6.world.h)
	arrows.load(game, stage6, camera)
	game.canvas.x = game.window.width / 2
end

local count_time = 0
function stage6.update(dt, game)
	arrows.update(dt)
	if game.status == 8  then
		if count_time > 15 then
  			game.bells_enable = true
			game.status = 7
		else
			count_time = dt + count_time
		end
	end
end

function stage6.draw(game)
	local mos_x, mos_y = love.mouse.getPosition()
	-- No object
	if game.status > 8  then
		love.graphics.draw(image_sujetador_none)
	else
		love.graphics.draw(image_sujetador)
	end
	if game.status == 8  then
		-- Normal
		love.graphics.draw(image_sujetador)
		-- Hover
		cam_x, cam_y = camera.gcam:getVisible()
	  	if mos_x + cam_x > 462 and mos_x + cam_x < 648 and mos_y - cam_y > 165 and mos_y - cam_y < 560 then
			love.graphics.draw(image_sujetador_hover)
		end
	end
	arrows.draw()
end

function stage6.mousepressed(game, messages, camera)
	local mos_x, mos_y = love.mouse.getPosition()
	if game.status == 8  then
	  	cam_x, cam_y = camera.gcam:getVisible()
	  	if mos_x + cam_x > 462 and mos_x + cam_x < 648 and mos_y - cam_y > 165 and mos_y - cam_y < 560 then
			game.status = 9
			messages.new_message('cap5stage', 15)
		end
	end
end

return stage6

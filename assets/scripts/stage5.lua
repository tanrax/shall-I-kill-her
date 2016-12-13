local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage5 = {}
local image

function stage5.load(game, camera)
	image_tocadiscos = love.graphics.newImage('assets/sprites/tocadiscos/tocadiscos.jpg')
	image_tocadiscos_hover = love.graphics.newImage('assets/sprites/tocadiscos/tocadiscos_hover.jpg')
	image_tocadiscos_none = love.graphics.newImage('assets/sprites/tocadiscos/tocadiscos_none.jpg')
	stage5.world = { w = image_tocadiscos:getWidth(), h= 720}
	game:setNewSizeWorld(stage5.world.w, stage5.world.h)
	arrows.load(game, stage5, camera)
	game.canvas.x = game.window.width / 2
end

local count_time = 0
function stage5.update(dt, game)
	arrows.update(dt)
	if game.status == 7  then
		if count_time > 15 then
  			game.bells_enable = true
			game.status = 7
		else
			count_time = dt + count_time
		end
	end
end

function stage5.draw(game)
	local mos_x, mos_y = love.mouse.getPosition()
	-- No object
	if game.status > 7  then
		love.graphics.draw(image_tocadiscos_none)
	else
		love.graphics.draw(image_tocadiscos)
	end
	if game.status == 7  then
		-- Normal
		love.graphics.draw(image_tocadiscos)
		-- Hover
		cam_x, cam_y = camera.gcam:getVisible()
	  	if mos_x + cam_x > 1005 and mos_x + cam_x < 1150 and mos_y - cam_y > 470 and mos_y - cam_y < 505 then
			love.graphics.draw(image_tocadiscos_hover)
		end
	end
	arrows.draw()
end

function stage5.mousepressed(game, messages, camera)
	local mos_x, mos_y = love.mouse.getPosition()
	if game.status == 7  then
	  	cam_x, cam_y = camera.gcam:getVisible()
	  	if mos_x + cam_x > 1005 and mos_x + cam_x < 1150 and mos_y - cam_y > 470 and mos_y - cam_y < 505 then
			game.status = 8
			messages.new_message('cap4stage', 15)
		end
	end
end

return stage5

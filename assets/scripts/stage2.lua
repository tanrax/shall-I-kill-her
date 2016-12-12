local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage2 = {}
local image

function stage2.load(game, camera)
	image_table = love.graphics.newImage('assets/sprites/table/table.jpg')
	image_table_hover = love.graphics.newImage('assets/sprites/table/table_hover.jpg')
	image_table_none = love.graphics.newImage('assets/sprites/table/table_none.jpg')
	stage2.world = { w = image_table:getWidth(), h= 720}
	game:setNewSizeWorld(stage2.world.w, stage2.world.h)
	arrows.load(game, stage2, camera)
	game.canvas.x = game.window.width / 2
end

local count_time = 0
function stage2.update(dt, game)
	arrows.update(dt)
	if game.status == 3  then
		if count_time > 22 then
			game.status = 4
  			game.bells_enable = true
		else
			count_time = dt + count_time
		end
	end
end

function stage2.draw(game, camera)
	local mos_x, mos_y = love.mouse.getPosition()
	-- No object
	love.graphics.draw(image_table_none)
	if game.status == 2  then
		-- Normal
		love.graphics.draw(image_table)
		-- Hover
	  	cam_x, cam_y = camera.gcam:getVisible()
		if mos_x + cam_x > 527 and mos_x + cam_x < 653 and mos_y - cam_y > 335 and mos_y - cam_y < 423 then
			love.graphics.draw(image_table_hover)
		end
	end
	arrows.draw()
end


function stage2.mousepressed(game, messages, camera)
	local mos_x, mos_y = love.mouse.getPosition()
	if game.status == 2  then
	  	cam_x, cam_y = camera.gcam:getVisible()
		if mos_x + cam_x > 527 and mos_x + cam_x < 653 and mos_y - cam_y > 335 and mos_y - cam_y < 423 then
			game.status = 3
			messages.new_message('cap1preview', 20)
		end
	end
end

return stage2
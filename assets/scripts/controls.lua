local HC = require 'assets/scripts/vendor/HC'

local controls = {}
local limit = 10

function controls.load(game)
  -- add a circle to the scene
  controls.mouse = HC.circle(400,300, 1)
  controls.mouse:moveTo(love.mouse.getPosition())
end

function controls.update(dt, game, camera)
	control_up, control_right, control_left, control_quit = false, false, false, false
	-- Keyboard
	if love.keyboard.isDown('escape') or love.keyboard.isDown('q') then
		control_quit = true
	end
	if love.keyboard.isDown('right') then
		control_right = true
		elseif love.keyboard.isDown('left') then
    	control_left = true
    end
  	if love.keyboard.isDown('up') then

  		control_up = true
    end
    -- Mouse
    -- move circle to mouse position
    local cam_x, cam_y = camera.gcam:getPosition()
    local mouse_x, mouse_y = love.mouse.getPosition()
    controls.mouse:moveTo(cam_x + mouse_x - 640 , mouse_y)

   	if control_left then
   		if game.canvas.x > game.window.width / 2 then
   			game.canvas.x = game.canvas.x - limit
   		end
   	end
   	if control_right then
   		if game.canvas.x <= game.canvas.width - (game.window.width/2) then
   			game.canvas.x = game.canvas.x + limit
   		end
   	end

end

function controls.draw()
	-- love.graphics.draw(controls.img_right, controls.right_x, controls.right_y)
end

return controls

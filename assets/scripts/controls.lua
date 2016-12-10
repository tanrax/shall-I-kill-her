local controls = {}

local limit = 10

function controls.load(game)

end

function controls.update(dt, game)
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
   	if control_left then
   		game.canvas.x = game.canvas.x - limit
   	end
   	if control_right then
   		game.canvas.x = game.canvas.x + limit
   	end

end

function controls.draw()
	-- love.graphics.draw(controls.img_right, controls.right_x, controls.right_y)
end

return controls

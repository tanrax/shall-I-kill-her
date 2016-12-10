local arrows = {}

local padding = 10

function arrows.load(game, camera)

	arrows.img_left = love.graphics.newImage('assets/sprites/arrows/left.png')
	arrows.left_x = padding
	arrows.left_y = (game.canvas.height / 2) - (arrows.img_left:getHeight() /2)

	arrows.img_rigth = love.graphics.newImage('assets/sprites/arrows/rigth.png')
	arrows.rigth_x = (game.canvas.width - arrows.img_rigth:getWidth()) - padding
	arrows.rigth_y = (game.canvas.height / 2) - (arrows.img_left:getHeight() /2)

end

function arrows.update(dt, game)

end

function arrows.draw()
	love.graphics.draw(arrows.img_left, arrows.left_x, arrows.left_y)
	love.graphics.draw(arrows.img_rigth, arrows.rigth_x, arrows.rigth_y)
end

function love.mousepressed(mx, my, button)
	x1,y1,x2,y2,x3,y3,x4,y4 = camera.gcam:getVisibleCorners()
	wl, wt, ww, wh = camera.gcam:getWorld()
	if button == 1 then
		if x1 <= arrows.left_x + arrows.img_left:getWidth() then
			if mx >= arrows.left_x and mx < arrows.left_x + arrows.img_left:getWidth() then
				if my >= arrows.left_y and my < arrows.left_y + arrows.img_left:getHeight() then
					print 'Image Click Left'
				end
			end
		end
		if x2 >= (ww - arrows.img_rigth:getWidth()) then
			if mx >= (ww - x1 - arrows.img_rigth:getWidth()) and mx < (ww - arrows.img_rigth:getWidth()) then
				if my >= arrows.rigth_y and my < arrows.rigth_y + arrows.img_rigth:getHeight() then
					print 'Image Click Rigth'
				end
			end
		end
	end
end

return arrows

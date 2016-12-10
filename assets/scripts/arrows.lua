local arrows = {}

local padding = 10
local local_canvas = {}
local camera = nil

function arrows.load(game, camera)

	arrows.img_left = love.graphics.newImage('assets/sprites/arrows/left.png')
	arrows.left_x = padding
	arrows.left_y = (game.canvas.height / 2) - (arrows.img_left:getHeight() /2)

	arrows.img_rigth = love.graphics.newImage('assets/sprites/arrows/rigth.png')
	arrows.rigth_x = (game.canvas.width - arrows.img_rigth:getWidth()) - padding
	arrows.rigth_y = (game.canvas.height / 2) - (arrows.img_left:getHeight() /2)
	local_canvas = game.canvas
	camera = camera
end

function arrows.update(dt, game)

end

function arrows.draw()
	love.graphics.draw(arrows.img_left, arrows.left_x, arrows.left_y)
	love.graphics.draw(arrows.img_rigth, arrows.rigth_x, arrows.rigth_y)
end

function love.mousepressed(mx, my, button)
	if button == 1 then
		if mx >= arrows.left_x and mx < arrows.left_x + arrows.img_left:getWidth() then
			if my >= arrows.left_y and my < arrows.left_y + arrows.img_left:getHeight() then
				print 'Image Click Left'
			end
		end
		print(camera)
		if mx >= arrows.rigth_x and mx < (arrows.rigth_x + arrows.img_rigth:getWidth() - (local_canvas.width - 2280)) then
			print 'fix'
			if my >= arrows.rigth_y and my < arrows.rigth_y + arrows.img_rigth:getHeight() then
				print 'Image Click Rigth'
			end
		end
	end
end

return arrows

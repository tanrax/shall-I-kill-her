local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local HC = require 'assets/scripts/vendor/HC'

local bell = {}
local collision_debug = true

function bell.load(game, cam)
  	local body = {
		img = love.graphics.newImage('assets/sprites/bells/bell_vibrate.png'),
		num_frames = 10,
		speed = 0.05,
		x = -game.canvas.width,
		y = -game.canvas.height
  	}
	g = anim8.newGrid(body.img:getWidth() / body.num_frames, body.img:getHeight(), body.img:getWidth(), body.img:getHeight())
  	body.animation = anim8.newAnimation(g('1-' .. body.num_frames, 1), body.speed, 'pauseAtEnd')
  	body.animation:pause()

  	local collision_size = body.img:getHeight() / 2
  	local cam_x, cam_y = cam:getVisible()
  	bell_1 = tools.clone_table(body)
  	bell_1.x = cam_x + (game.window.width / 4) - (bell_1.img:getWidth() / body.num_frames / 2)
  	bell_1.y = (game.window.height / 2) - (bell_1.img:getHeight() / 2)
	bell_1.collision = HC.circle(bell_1.x, bell_1.y, collision_size)
  	bell_2 = tools.clone_table(body)
  	bell_2.x = cam_x + (game.window.width / 4 * 2) - (bell_1.img:getWidth() / body.num_frames / 2)
  	bell_2.y = bell_1.y
  	bell_3 = tools.clone_table(body)
  	bell_3.x = cam_x + (game.window.width / 4 * 3) - (bell_1.img:getWidth() / body.num_frames / 2)
  	bell_3.y = bell_1.y
end

function bell.update(dt, game, cam)
	bell_1.animation:update(dt)
	bell_2.animation:update(dt)
	bell_3.animation:update(dt)
end

function bell.draw()
	if bells_enable then
		bell_1.animation:draw(bell_1.img, bell_1.x, bell_1.y)
		bell_2.animation:draw(bell_2.img, bell_2.x, bell_2.y)
		bell_3.animation:draw(bell_3.img, bell_3.x, bell_3.y)
		if collision_debug then
			bell_1.collision:draw('fill')	
		end
	end
end

return bell
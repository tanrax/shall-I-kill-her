local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local HC = require 'assets/scripts/vendor/HC'

local bell = {}

function bell.load(game)
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

  	bell_1 = tools.clone_table(body)
  	bell_2 = tools.clone_table(body)
  	bell_3 = tools.clone_table(body)
end

function bell.update(dt)
	bell_1.animation:update(dt)
	bell_2.animation:update(dt)
	bell_3.animation:update(dt)
end

function bell.draw()
	bell_1.animation:draw(bell_1.img, bell_1.x, bell_1.y)
	bell_2.animation:draw(bell_2.img, bell_2.x, bell_2.y)
	bell_3.animation:draw(bell_3.img, bell_3.x, bell_3.y)
end

return bell
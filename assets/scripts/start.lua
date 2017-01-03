local start = {}

function start.load(game)
	start.img = love.graphics.newImage('assets/sprites/menu/start.jpg')
  	start.music = love.audio.newSource("assets/audio/music/main_theme_menu.mp3")
  	start.music:play()
  	start.status = 1
	game:stopMusic()
end

function start.update(dt, game)
	if game.status == start.status then
		game:stopMusic()
	end
end

function start.draw(game)
	if game.status == start.status then
		love.graphics.draw(start.img, 0, 0)
	end
end

function start.mousepressed(game)
	local mos_x, mos_y = love.mouse.getPosition()
	if game.status == start.status  then
		if mos_x > 411 and mos_x < 578 and mos_y > 400 and mos_y < 479 then
			game.status = start.status + 1
		  	start.music:stop()
  			game:playMusic()
		end
	end
end

return start

local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local arrows = require 'assets/scripts/arrows'

local stage7 = {}
local image

function stage7.load(game, camera)
	if game.status == 9 then
		image = love.graphics.newImage('assets/sprites/background/final bueno_3.jpg')
		stage7.music = love.audio.newSource("assets/audio/fx/door_win.wav")
		stage7.music2 = love.audio.newSource("assets/audio/music/our_song_end.mp3")
	else
		image = love.graphics.newImage('assets/sprites/background/dead.jpg')
		stage7.music = love.audio.newSource("assets/audio/fx/door_lose.wav")
	end
	game:stopMusic()
	stage7.world = { w = image:getWidth(), h= 720}
	game:setNewSizeWorld(stage7.world.w, stage7.world.h)
	arrows.load(game, stage7, camera)
	game.canvas.x = game.window.width / 2
	stage7.music2:play()
	stage7.music:play()


end

function stage7.update(dt, game)
	arrows.update(dt)
end

function stage7.draw()
	love.graphics.draw(image)
	arrows.draw()
end

return stage7

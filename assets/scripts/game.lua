local game = {}
local gamera = require 'assets/scripts/vendor/gamera'

function game.load()
	-- Configuration
	math.randomseed(os.time())
	local width, height = 1280, 720
	local canvas_width, canvas_height = 2280, 720
	game.window = { width = width , height = height }
	game.canvas = { x = width / 2, y= 0, width = canvas_width, height = canvas_height }
	game.level = 1
	game.end_level = 6
	game.start_screen = true

	love.window.setMode(game.window.width, game.window.height)

	-- Physics
	local world_meter = 64
	local gravity = 2
	love.physics.setMeter(world_meter) -- Height earth in meters
  	game.world = love.physics.newWorld(0, gravity * world_meter, true) -- Make earth
  	game.status = 1

  	-- Bells
  	game.bells_enable = false

  	game.music = love.audio.newSource("assets/audio/music/theme_biblia.wav")

  	game.stress = false

end

function game.update(dt)
	if game.bells_enable then
		game:stopMusic()
	else
  		game:playMusic()
	end
end

function game:nextLevel()
	if game.level == game.end_level then
		game.level = 1
	else
		game.level = game.level + 1
	end
end

function game:prevLevel()
	if game.level > 1 then
		game.level = game.level - 1
	else
		game.level = game.end_level
	end
end

function game:setNewSizeWorld(canvas_width, canvas_height)
	local width, height = 1280, 720
	game.window = { width = width , height = height }
	game.canvas = { x = width / 2, y= 0, width = canvas_width, height = canvas_height }
	camera.gcam = gamera.new(0, 0, game.window.width, game.window.height)
	camera.gcam:setWorld(0, 0, game.canvas.width, game.canvas.height)
end

function game:playMusic()
	game.music:play()
end

function game:stopMusic()
	game.music:stop()
end

return game

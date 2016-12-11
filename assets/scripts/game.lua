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
	game.end_level = 5

	love.window.setMode(game.window.width, game.window.height)

	-- Physics
	local world_meter = 64
	local gravity = 2
	love.physics.setMeter(world_meter) -- Height earth in meters
  	game.world = love.physics.newWorld(0, gravity * world_meter, true) -- Make earth

  	-- Bells
  	bells_enable = false

  	game.music = love.audio.newSource("assets/audio/music/theme.mp3")
  	game:playMusic()

  	game.stress = false

end

function game:nextLevel()
	game.level = game.level + 1
end

function game:prevLevel()
	game.level = game.level - 1
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

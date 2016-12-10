local game = {}

function game.load()

	-- Configuration
	math.randomseed(os.time())
	local width, height = 1280, 720
	local canvas_width, canvas_height = 2280, 720
	game.window = { width = width , height = height }
	game.canvas = { x = width / 2, y= 0, width = canvas_width, height = canvas_height }

	love.window.setMode(game.window.width, game.window.height)

	-- Physics
	local world_meter = 64
	local gravity = 2
	love.physics.setMeter(world_meter) -- Height earth in meters
  	game.world = love.physics.newWorld(0, gravity * world_meter, true) -- Make earth

  	-- Collisions
  	--game.collisions = HC.new(150)
  	--
end

return game

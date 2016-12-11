local game = require 'assets/scripts/game'
local stages = require 'assets/scripts/stages'
local controls = require 'assets/scripts/controls'
local bells = require 'assets/scripts/bells'
local camera = require 'assets/scripts/camera'


-- LOAD
function love.load()
	game.load()
	camera.load(game)
	stages.load(game, camera)
	bells.load(game, camera.gcam)
	controls.load(game)
end

-- UPDATE
function love.update(dt)
	game.world:update(dt)
	stages.update(dt, game, camera)
	camera.update(game)
	bells.update(dt)
	controls.update(dt, game)
end

-- DRAW
function love.draw()
	camera.gcam:draw(
		function(l,t,w,h)
			stages.draw()
			bells.draw(game)
		end
	)
	controls.draw()
end


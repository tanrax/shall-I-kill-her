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
	bells.load(game, camera)
	controls.load(game)
end

-- UPDATE
function love.update(dt)
	require('assets/scripts/vendor/lovebird').update()
	game.world:update(dt)
	camera.update(game)
	stages.update(dt, game, camera)
	bells.update(dt, game, camera)
	controls.update(dt, game, camera)
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


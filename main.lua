local game = require 'assets/scripts/game'
local stage1 = require 'assets/scripts/stage1'
local controls = require 'assets/scripts/controls'
local camera = require 'assets/scripts/camera'

-- LOAD
function love.load()
	game.load()
	camera.load(game)
	stage1.load(game, camera)
	controls.load(game)
end

-- UPDATE
function love.update(dt)
	game.world:update(dt)
	stage1.update(dt)
	camera.update(game)
	controls.update(dt, game)
end

-- DRAW
function love.draw()
	camera.gcam:draw(
		function(l,t,w,h)
			stage1.draw()
		end
	)
	controls.draw()
end


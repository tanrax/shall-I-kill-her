local gamera = require 'assets/scripts/vendor/gamera'

camera = {}
local limit = 200

function camera.load(game)
	game.canvas.x = game.window.width/2
	camera.gcam = gamera.new(0, 0, game.window.width, game.window.height)
	camera.gcam:setWorld(0, 0, game.canvas.width, game.canvas.height)
	game.canvas.x = game.window.width
	camera.gcam:setPosition(game.canvas.x, 0)
end

function camera.update(game)
	camera.gcam:setPosition(game.canvas.x, 0)
end

return camera

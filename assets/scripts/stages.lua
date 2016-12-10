local anim8 = require 'assets/scripts/vendor/anim8'
local stage1 = require 'assets/scripts/stage1'
local stage2 = require 'assets/scripts/stage2'
local dynamic_stage = nil

local stages = {}
local image
local currentLevel = 1

function stages.load(game, camera)
	currentLevel = game.level
	dynamic_stage = require("assets/scripts/stage"..currentLevel)
	dynamic_stage.load(game, camera)
end

function stages.update(dt, game, camera)
	if game.level ~= currentLevel then
		currentLevel = game.level
		dynamic_stage = require("assets/scripts/stage"..currentLevel)
		dynamic_stage.load(game, camera)
		dynamic_stage.update(dt, game)
	else
		dynamic_stage.update(dt, game)
	end
end

function stages.draw()
	dynamic_stage.draw()
end

return stages

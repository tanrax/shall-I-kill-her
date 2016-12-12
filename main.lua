local game = require 'assets/scripts/game'
local stages = require 'assets/scripts/stages'
local controls = require 'assets/scripts/controls'
local bells = require 'assets/scripts/bells'
local camera = require 'assets/scripts/camera'
local stress = require 'assets/scripts/stress'
local messages = require 'assets/scripts/messages'
local start = require 'assets/scripts/start'
local arrows = require 'assets/scripts/arrows'
local stage2 = require 'assets/scripts/stage2'

-- LOAD
function love.load()
  game.load()
  camera.load(game)
  stages.load(game, camera)
  stress.load(game, camera)
  bells.load(game, camera)
  controls.load(game)
  messages.load(game)
  start.load(game)
end

-- UPDATE
function love.update(dt)
  --require('assets/scripts/vendor/lovebird').update()
  game.world:update(dt)
  game.update(dt)
  camera.update(game)
  stages.update(dt, game, camera)
  stress.update(dt, game, camera)
  bells.update(dt, game, camera)
  controls.update(dt, game, camera)
  messages.update(dt, game)
  start.update(dt, game)
end

-- DRAW
function love.draw()
  camera.gcam:draw(
    function(l,t,w,h)
      stages.draw(game, camera)
      stress.draw()
      bells.draw(game)
    end
  )
  controls.draw()
  messages.draw()
  start.draw(game)
end

function love.mousepressed(x, y, button, istouch)
  start.mousepressed(game)
  arrows.mousepressed(x, y, button, istouch)
  stage2.mousepressed(game, messages, camera)
end
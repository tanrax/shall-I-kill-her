local anim8 = require 'assets/scripts/vendor/anim8'
local tools = require 'assets/scripts/tools'
local HC = require 'assets/scripts/vendor/HC'

local bell = {}
local collision_debug = false
local collisions = {}
local cam_x, cam_y = nil

function bell.load(game, cam)
	sound_error = love.audio.newSource('assets/audio/fx/bills/campana_fallo.wav', 'static')
  	body = {
		img = love.graphics.newImage('assets/sprites/bells/bell_vibrate.png'),
		num_frames = 10,
		speed = 0.05,
		active = false,
		x = -game.canvas.width,
		y = -game.canvas.height
  	}
	g = anim8.newGrid(body.img:getWidth() / body.num_frames, body.img:getHeight(), body.img:getWidth(), body.img:getHeight())
  	body.animation = anim8.newAnimation(g('1-' .. body.num_frames, 1), body.speed)
  	body.animation:pause()

  	cam_x, cam_y = cam.gcam:getVisible()
  	bell_1 = tools.clone_table(body)
  	bell_1.x = cam_x + (game.window.width / 4) - (bell_1.img:getWidth() / body.num_frames / 2)
  	bell_1.y = (game.window.height / 2) - (bell_1.img:getHeight() / 2)
  	bell_1.sound_loop = love.audio.newSource('assets/audio/fx/bills/campana_loop1.wav', 'static')
  	bell_1.sound_good = love.audio.newSource('assets/audio/fx/bills/campana_exito1.wav', 'static')
  	bell_2 = tools.clone_table(body)
  	bell_2.x = cam_x + (game.window.width / 4 * 2) - (bell_1.img:getWidth() / body.num_frames / 2)
  	bell_2.y = bell_1.y
	bell_2.sound_loop = love.audio.newSource('assets/audio/fx/bills/campana_loop2.wav', 'static')
  	bell_2.sound_good = love.audio.newSource('assets/audio/fx/bills/campana_exito2.wav', 'static')
  	bell_3 = tools.clone_table(body)
  	bell_3.x = cam_x + (game.window.width / 4 * 3) - (bell_1.img:getWidth() / body.num_frames / 2)
  	bell_3.y = bell_1.y
	bell_3.sound_loop = love.audio.newSource('assets/audio/fx/bills/campana_loop3.wav', 'static')
  	bell_3.sound_good = love.audio.newSource('assets/audio/fx/bills/campana_exito3.wav', 'static')
  	bells = {bell_1, bell_2, bell_3}	

  	-- Collisions
  	collisions.size = 15
	collisions.positions = {}
	collisions.num = 15 
	collisions.correction = 45

	-- Make positions collisions
	for i = 1, collisions.num, 1 do
		local tem_x, tem_y = tools.cicle_positions(0, 0, bell_1.img:getHeight() / 2, 360 / collisions.num * i)
		collisions.positions[i] = {x=tem_x, y=tem_y}
	end

	-- Add collisions
	for key, bell in pairs(bells) do
		bell.collisions = {}
		bell.enable = {}
		for key, collision in pairs(collisions.positions) do
			bell.collisions[key] = HC.circle(bell.x + collision.x, collision.y, collisions.size)
			bell.enable[key] = false
		end
	end
end

function bell.update(dt, game, cam)
	-- Update cam position
  	cam_x, cam_y = cam.gcam:getVisible()
  	-- Ani bells
	bell_1.animation:update(dt)
	bell_2.animation:update(dt)
	bell_3.animation:update(dt)
	-- Bells fix pos
  	bell_1.x = cam_x + (game.window.width / 4) - (bell_1.img:getWidth() / body.num_frames / 2)
  	bell_2.x = cam_x + (game.window.width / 4 * 2) - (bell_1.img:getWidth() / body.num_frames / 2)
  	bell_3.x = cam_x + (game.window.width / 4 * 3) - (bell_1.img:getWidth() / body.num_frames / 2)
  	-- Collisions fix pos
	for key, bell in pairs(bells) do
		for key, collision in pairs(collisions.positions) do
			bell.collisions[key]:moveTo(collisions.positions[key].x + bell.x + (bell.img:getHeight() / 2) + collisions.correction, collisions.positions[key].y + bell.y + (bell.img:getHeight() / 2))
		end
	end
	-- Check collisions
	if game.bells_enable then
		for key, bell in pairs(bells) do
			for key, collision in pairs(bell.collisions) do
	    		for shape, delta in pairs(HC.collisions(bell.collisions[key])) do
	    			if bell.sound_loop:isPlaying() == false then
						bell.sound_loop:play()
					end
					bell.enable[key] = true
	    		end
			end
		end
	end
	-- Logic
	local num_enable = 0
	for key, bell in pairs(bells) do
		for key, item in pairs(bell.enable) do
			-- Count enables
			num_enable = num_enable + 1
		end
		if num_enable > 1 then
			-- Search emptys
			local count_singles = 0
			for key, item in pairs(bell.enable) do
				if key > 1 and bell.enable[key] and bell.enable[key - 1] == false then
					count_singles = count_singles + 1
				end
			end
			-- Bad. Restart
			if count_singles >= 2 then
				for key, bell in pairs(bells) do
					bell.sound_loop:stop()
				end
				sound_error:play()
				for key, item in pairs(bell.enable) do
					bell.enable[key] = false
				end
			end
			-- Check good
			local good = true
			for key, item in pairs(bell.enable) do
				if bell.enable[key] == false then
					good = false
				end
			end
			-- Enable animation good
			if good then
				bell.active = true
				bell.animation:resume()
				bell.sound_good:play()
				for key, item in pairs(bell.enable) do
					bell.enable[key] = false
				end
			end
			good = true
			count_singles = 0
		end
		num_enable = 0
	end
	-- Game over
	game_over = true
	for key, bell in pairs(bells) do
		if not bell.active then
			game_over = false
		end
	end
	for key, bell in pairs(bells) do
		if game_over then
			bell.animation:pauseAtEnd()
			game.bells_enable = false
		end
	end
end

function bell.draw(game)
	if game.bells_enable then
		-- Bells
		for key, bell in pairs(bells) do
			bell.animation:draw(bell.img, bell.x, bell.y)
		end
		-- Collisions
		if collision_debug then
			for key, bell in pairs(bells) do
				for key, collision in pairs(collisions.positions) do
					if bell.enable[key] then
						bell.collisions[key]:draw('fill')	
					else
						bell.collisions[key]:draw('line')	
					end
				end
			end
		end
	end
end

return bell
require "lib/postshader"
local LightWorld = require "lib"
local ProFi = require 'game.vendor.ProFi'

exf = {}
exf.current = nil

exf.available = {}

function love.load()
  exf.list = List:new()
  exf.smallfont = love.graphics.newFont(12)
  exf.mediumfont = love.graphics.newFont(18)
  exf.bigfont = love.graphics.newFont(40)
  exf.list.font = exf.smallfont

  exf.bigball = love.graphics.newImage("game/gfx/not-estudio.png")
  exf.music = love.audio.newSource("assets/audio/music/theme.mp3", "static")
  exf.music:setVolume(0.9) -- 90% of ordinary volume
  exf.music:setPitch(0.5) -- one octave lower
  exf:playMusic()
  -- Find available demos.
  local files =  love.filesystem.getDirectoryItems("game")
  local n = 0

  for i, v in ipairs(files) do
    is_file = love.filesystem.isFile("game/".. v )
    if is_file then
      n = n + 1
      table.insert(exf.available, v);
      local file = love.filesystem.newFile(v, love.file_read)
      file:open("r")
      local contents = love.filesystem.read("game/" .. v, 100)
      local s, e, c = string.find(contents, "Example: ([%a%p ]-)[\r\n]")
      file:close(file)
      if not c then c = "Untitled" end
      local title = "     Inicia la Aventura!"
      exf.list:add(title, v)
    end
  end

  exf.list:done()
  exf.resume()
end

function love.update(dt) end
function love.draw() end
function love.keypressed(k) end
function love.keyreleased(k) end
function love.mousepressed(x, y, b) end
function love.mousereleased(x, y, b) end
function exf.empty() end

function exf.update(dt)
  exf.list:update(dt)
  lightMouse:setPosition(love.mouse.getX(), love.mouse.getY())
end

function exf.draw()
  lightWorld:draw(function()
    love.graphics.setBackgroundColor(0, 0, 0)

    love.graphics.setColor(10, 110,110)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())

    love.graphics.setColor(255, 255, 255, 191)
    love.graphics.setFont(exf.bigfont)
    love.graphics.print("Shall I Kill Her", 500, 50)

    love.graphics.setFont(exf.mediumfont)
    love.graphics.print("Un hombre atormentado por oscuros sentimientos de debate", 380, 140)
    love.graphics.print("entre el bien y el mal. Debe tomar la decisión entre matar o no a ", 360, 160)
    love.graphics.print("su actual pareja. Para ello recorre sus recuerdos en busca de una razón.", 335, 180)
    exf.list:draw()

    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(exf.bigball, 760 - 128, 600 - 128, love.timer.getTime(), 1, 1, exf.bigball:getWidth() * 0.5, exf.bigball:getHeight() * 0.5)
  end)
end

function exf.keypressed(k)
end

function exf.keyreleased(k)
end

function exf.mousepressed(x, y, b)
  exf.list:mousepressed(x, y, b)
end

function exf.mousereleased(x, y, b)
  exf.list:mousereleased(x, y, b)
end

function exf.intable(t, e)
  for k, v in ipairs(t) do
    if v == e then return true end
  end
  return false
end

function exf.start(item, file)
  local e_id = string.sub(item, 1, 4)
  local e_rest = string.sub(item, 5)
  local unused1, unused2, n = string.find(item, "(%s)%.lua")
  exf:stopMusic()
  if exf.intable(exf.available, file) then
    if not love.filesystem.exists("game/" .. file) then
      print("Could not load game .. " .. file)
    else

    -- Clear all callbacks.
    love.load = exf.empty
    love.update = exf.empty
    love.draw = exf.empty
    love.keypressed = exf.empty
    love.keyreleased = exf.empty
    love.mousepressed = exf.empty
    love.mousereleased = exf.empty

    love.filesystem.load("game/" .. file)()
    exf.clear()

    --love.window.setTitle(e_rest)

    -- Redirect keypress
    local o_keypressed = love.keypressed
    love.keypressed =
    function(k)
      if k == "escape" then
        exf.resume()
      end
      o_keypressed(k)
    end

    love.load()
    end
  else
    print("Game ".. e_id .. " does not exist.")
  end
end

function exf.clear()
  love.graphics.setBackgroundColor(0,0,0)
  love.graphics.setColor(255, 255, 255)
  love.graphics.setLineWidth(1)
  love.graphics.setLineStyle("smooth")
  love.graphics.setBlendMode("alpha")
  love.mouse.setVisible(true)
end

function exf.resume()

  load = nil
  love.update = exf.update
  love.draw = exf.draw
  love.keypressed = exf.keypressed
  love.keyreleased = exf.keyreleased
  love.mousepressed = exf.mousepressed
  love.mousereleased = exf.mousereleased

  love.mouse.setVisible(true)
  love.window.setTitle("Shall I Kill Her")

  -- create light world
  lightWorld = LightWorld({
    ambient = {127, 127, 127} 
  })

  -- create light
  lightMouse = lightWorld:newLight(0, 0, 255, 127, 63, 500)
  lightMouse:setSmooth(2)

  -- create shadow bodys
  circleTest = lightWorld:newCircle(760 - 128, 600 - 128, exf.bigball:getWidth()*0.5)
end

function inside(mx, my, x, y, w, h)
  return mx >= x and mx <= (x+w) and my >= y and my <= (y+h)
end


----------------------
-- List object
----------------------

List = {}

function List:new()
  o = {}
  setmetatable(o, self)
  self.__index = self

  o.items = {}
  o.files = {}

  o.x = 520
  o.y = 300

  o.width = 220
  o.height = 160

  o.item_height = 23
  o.sum_item_height = 0

  o.bar_size = 20
  o.bar_pos = 0
  o.bar_max_pos = 0
  o.bar_width = 15
  o.bar_lock = nil

  return o
end

function List:add(item, file)
  table.insert(self.items, item)
  table.insert(self.files, file)
end

function List:done()
  self.items.n = #self.items

  -- Recalc bar size.
  self.bar_pos = 0

  local num_items = (self.height/self.item_height)
  local ratio = num_items/self.items.n
  self.bar_size = self.height * ratio
  self.bar_max_pos = self.height - self.bar_size - 3

  -- Calculate height of everything.
  self.sum_item_height = (self.item_height+1) * self.items.n + 2
end

function List:hasBar()
  return self.sum_item_height > self.height
end

function List:getBarRatio()
  return self.bar_pos/self.bar_max_pos
end

function List:getOffset()
  local ratio = self.bar_pos/self.bar_max_pos
  return math.floor((self.sum_item_height-self.height)*ratio + 0.5)
end

function List:update(dt)
  if self.bar_lock then
    local dy = math.floor(love.mouse.getY()-self.bar_lock.y+0.5)
    self.bar_pos = self.bar_pos + dy

    if self.bar_pos < 0 then
      self.bar_pos = 0
    elseif self.bar_pos > self.bar_max_pos then
     self.bar_pos = self.bar_max_pos
    end

    self.bar_lock.y = love.mouse.getY()
  end
end

function List:mousepressed(mx, my, b)
  if self:hasBar() then
    if b == 1 then
      local x, y, w, h = self:getBarRect()
      if inside(mx, my, x, y, w, h) then
        self.bar_lock = { x = mx, y = my }
      end
    end

    local per_pixel = (self.sum_item_height-self.height)/self.bar_max_pos
    local bar_pixel_dt = math.floor(((self.item_height)*3)/per_pixel + 0.5)

    if b == "wd" then
      self.bar_pos = self.bar_pos + bar_pixel_dt
      if self.bar_pos > self.bar_max_pos then 
        self.bar_pos = self.bar_max_pos 
      end
    elseif b == "wu" then
      self.bar_pos = self.bar_pos - bar_pixel_dt
      if self.bar_pos < 0 then 
        self.bar_pos = 0 
      end
    end
  end

  if b == 1 and inside(mx, my, self.x+2, self.y+1, self.width-3, self.height-3) then
    local tx, ty = mx-self.x, my + self:getOffset() - self.y
    local index = math.floor((ty/self.sum_item_height)*self.items.n)
    local i = self.items[index+1]
    local f = self.files[index+1]
    if f then
      exf.start(i, f)
    end
  end
end

function List:mousereleased(x, y, b)
  if self:hasBar() then
    if b == 1 then
      self.bar_lock = nil
    end
  end
end

function List:getBarRect()
  return self.x+self.width+2, self.y+1+self.bar_pos,
         self.bar_width-3, self.bar_size
end

function List:getItemRect(i)
  return self.x+2, self.y+((self.item_height+1)*(i-1)+1)-self:getOffset(),
         self.width-3, self.item_height
end

function List:draw()
  love.graphics.setLineWidth(2)
  love.graphics.setLineStyle("rough")
  love.graphics.setFont(self.font)

  love.graphics.setColor(48, 156, 225)

  local mx, my = love.mouse.getPosition()

  -- Get interval to display.
  local start_i = math.floor( self:getOffset()/(self.item_height+1) ) + 1
  local end_i = start_i+math.floor( self.height/(self.item_height+1) ) + 1
  
  if end_i > self.items.n then 
    end_i = self.items.n 
  end

  love.graphics.setScissor(self.x, self.y, self.width, self.height)

  -- Items.
  for i = start_i,end_i do
    local x, y, w, h = self:getItemRect(i)
    local hover = inside(mx, my, x, y, w, h)

    if hover then
      love.graphics.setColor(0, 0, 0, 127)
    else
      love.graphics.setColor(0, 0, 0, 63)
    end

    love.graphics.rectangle("fill", x+1, y+i+1, w-3, h)

    if hover then
      love.graphics.setColor(255, 255, 255)
    else
      love.graphics.setColor(255, 255, 255, 127)
    end

    local e_id = string.sub(self.items[i], 1, 5)
    local e_rest = string.sub(self.items[i], 5)

    love.graphics.print(e_id, x+10, y+i+6)  --Updated y placement -- Used to change position of Example IDs
    love.graphics.print(e_rest, x+50, y+i+6) --Updated y placement -- Used to change position of Example Titles
  end

  love.graphics.setScissor()


end
function exf:playMusic()
  exf.music:play()
end

function exf:stopMusic()
  exf.music:stop()
end
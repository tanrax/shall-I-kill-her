arc_path = 'assets/scripts/vendor/arc/'
require(arc_path .. 'arc')
_navi = require(arc_path .. 'navi')

local messages = {}

function messages.load(game)
	msg = _navi:new('Hello world!')
end

function messages.update(dt)
    arc.check_keys(dt)
end

function messages.draw()
    arc.clear_key()
    msg:play(0,0)
end

function messages.keypressed(k)
	arc.set_key(k)
end

return messages

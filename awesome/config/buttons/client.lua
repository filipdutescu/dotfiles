local awful = require('awful')
local gears = require('gears')

local utils = require('config.keys.utils')

return gears.table.join(
	awful.button({ }, 1, function (c)
		c:emit_signal('request::activate', "mouse_click", { raise = true })
	end),
	awful.button({ utils.modKey }, 1, function (c)
		c:emit_signal('request::activate', "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ utils.modKey }, 3, function (c)
		c:emit_signal('request::activate', "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

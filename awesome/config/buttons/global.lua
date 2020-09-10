local awful = require('awful')
local gears = require('gears')

local launcher = require('widget.launcher')

return gears.table.join(
	awful.button({ }, 3, function () launcher.contextMenu:toggle() end),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev)	
)

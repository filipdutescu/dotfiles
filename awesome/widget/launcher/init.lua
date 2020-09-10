local awful = require('awful')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup')

local apps = require('config.apps')

local contextMenu = awful.menu {
	items = {
		{ 'awesome',
		 {
			 { 'hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
			 { 'manual', apps.terminal .. " -e man awesome" },
			 { 'edit config', apps.editor_cmd .. " " .. awesome.conffile },
			 { 'restart', awesome.restart },
			 { 'quit', function() awesome.quit() end },
		 },
		 beautiful.awesome_icon
		},
		{
		 'open terminal',
		 apps.terminal
		}
	}
}

local launcher = awful.widget.launcher {
	image = beautiful.awesome_icon,
	menu = contextMenu
 }

return {
	launcher = launcher,
	contextMenu = contextMenu
}

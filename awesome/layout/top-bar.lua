local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local utils = require('layout.utils')

local tagList = require('widget.taglist')
local textClock = require('widget.basic-clock')
local launcher = require('widget.launcher')
 
awful.screen.connect_for_each_screen(function(s)
	-- Each screen has its own tag table.
	utils.createTags(s, {
		{	name = '1', selected = true },
		{	name = '2', },
		{	name = '3', },
		{	name = '4', },
		{	name = '5', },
		{	name = '6', },
		{	name = '7', },
		{	name = '8', },
		{	name = '9', },
	})

  -- Create an imagebox widget which will contain an icon indicating which layout we'r    e using.
  -- We need one layoutbox per screen.
  s.layoutBox = awful.widget.layoutbox(s)
  s.layoutBox:buttons(gears.table.join(
		awful.button({ }, 1, function () awful.layout.inc( 1) end),
		awful.button({ }, 3, function () awful.layout.inc(-1) end),
		awful.button({ }, 4, function () awful.layout.inc( 1) end),
		awful.button({ }, 5, function () awful.layout.inc(-1) end)))

	-- Create the wibox
	utils.createBar(s, 'top',
	{
		layout = wibox.layout.align.horizontal,
	  expand = 'none',
	  { -- Left widgets
			layout = wibox.layout.fixed.horizontal,
	   	launcher.launcher,
	   	tagList(s),
	  },
	  textClock,
	  { -- Right widgets
	   	 layout = wibox.layout.fixed.horizontal,
	   	 awful.widget.keyboardlayout(),
	   	 wibox.widget.systray(),
	   	 s.layoutBox,
	  },
	})	
end)


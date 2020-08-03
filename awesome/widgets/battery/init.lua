local awful = require('awful')
local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local naughty = require('naughty')
local watch = awful.widget.watch
local clickable_container = require('widget.clickable-container')
local dpi = require('beautiful').xresources.apply_dpi
local config_dir = gears.filesystem.get_configuration_dir()
local widget_icon_dir = config_dir .. 'widgets/battery/icons/'

battery = wibox.widget.base.make_widget()


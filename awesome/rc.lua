-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')

-- Standard awesome library
local gears = require('gears')
local awful = require('awful')
require('awful.autofocus')
-- Widget and layout library
local wibox = require('wibox')
-- Theme handling library
local beautiful = require('beautiful')
-- Notification library
local naughty = require('naughty')
local menubar = require('menubar')
local hotkeys_popup = require('awful.hotkeys_popup')
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
--require('awful.hotkeys_popup.keys')

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = 'Oops, there were errors during startup!',
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal('debug::error', function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = 'Oops, an error happened!',
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. 'themes/default.lua')

--------------------
-- Layout & Wibar --
--------------------

require('layout')

----------------------------------------------
-- Key and button bindings and default apps --
----------------------------------------------

require('config')
root.buttons(require('config.buttons.global'))
root.keys(require('config.keys.global'))

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal('manage', function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Normally we'd do this with a rule, but Spotify doesn't set its class or name
-- until after it starts up, so we need to catch that signal.
client.connect_signal('property::class', function(c)
	if c.class == 'Spotify' then
		-- Move the Spotify instance to 'music' tag on this screen
		local t = awful.tag.find_by_name(awful.screen.focused(), '4')
		c:move_to_tag(t)
	end
end)

-- Enable sloppy focus, so that focus follows mouse.
--client.connect_signal('mouse::enter', function(c)
--    c:emit_signal('request::activate', "mouse_enter", {raise = false})
--end)

client.connect_signal('focus', function(c) c.border_color = beautiful.border_focus end)
client.connect_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Autostart
awful.spawn.with_shell('~/.fehbg')
awful.spawn.with_shell('killall -q picom; while pgrep -u $UID -x picom >/dev/null; do sleep 1; done; picom --experimental-backends')
awful.spawn.with_shell('rivalcfg -s 500 -S 1000 -e breath -c "#22820c"')

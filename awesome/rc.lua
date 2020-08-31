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

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. 'themes/default.lua')

-- This is used later as the default terminal and editor to run.
terminal = os.getenv('TERMINAL') or 'alacritty'
editor = os.getenv('EDITOR') or 'vim'
editor_cmd = terminal .. ' -e ' .. editor
browser = os.getenv('BROWSER') or 'firefox'

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = 'Mod4'
local keybindings = require('keybindings')
--naughty.notify({ preset = naughty.config.presets.critical,
--								 title = 'Keys utils',
--								 text = keybindings.global.length })

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { 'hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { 'manual', terminal .. " -e man awesome" },
   { 'edit config', editor_cmd .. " " .. awesome.conffile },
   { 'restart', awesome.restart },
   { 'quit', function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { 'awesome', myawesomemenu, beautiful.awesome_icon },
                                    { 'open terminal', terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Calendar popup widget
--calendar = awful.widget.calendar_popup.month()
--calendar:attach(mytextclock, 'tr')

--battery = require('widgets.battery')

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      'request::activate',
                                                      'tasklist',
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ '1', "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[2])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = 'top', screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
       s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
--						battery,
            mytextclock,
            s.mylayoutbox,
        },
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

clientkeys = gears.table.join(
    awful.key({ modkey,           }, 'f',
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = 'toggle fullscreen', group = "client"}),
    awful.key({ modkey, 'Shift'   }, "c",      function (c) c:kill()                         end,
              {description = 'close', group = "client"}),
    awful.key({ modkey, 'Control' }, "space",  awful.client.floating.toggle                     ,
              {description = 'toggle floating', group = "client"}),
    awful.key({ modkey, 'Control' }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = 'move to master', group = "client"}),
    awful.key({ modkey,           }, 'o',      function (c) c:move_to_screen()               end,
              {description = 'move to screen', group = "client"}),
    awful.key({ modkey,           }, 't',      function (c) c.ontop = not c.ontop            end,
              {description = 'toggle keep on top', group = "client"}),
    awful.key({ modkey,           }, 'n',
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = 'minimize', group = "client"}),
    awful.key({ modkey,           }, 'm',
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = '(un)maximize', group = "client"}),
    awful.key({ modkey, 'Control' }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = '(un)maximize vertically', group = "client"}),
    awful.key({ modkey, 'Shift'   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = '(un)maximize horizontally', group = "client"})
)

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal('request::activate', "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal('request::activate', "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal('request::activate', "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(keybindings.global)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the 'manage' signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          'DTA',  -- Firefox addon DownThemAll.
          'copyq',  -- Includes session name in class.
          'pinentry',
        },
        class = {
          'Arandr',
          'Blueman-manager',
          'Gpick',
          'Kruler',
          'MessageWin',  -- kalarm.
          'Sxiv',
          'Tor Browser', -- Needs a fixed window size to avoid fingerprinting by screen size.
          'Wpa_gui',
          'veromix',
          'xtightvncviewer',
					'org.remmina.Remmina',
					'Matplotlib',
				},	

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          'Event Tester',  -- xev.
        },
        role = {
          'AlarmWindow',  -- Thunderbird's calendar.
          'ConfigManager',  -- Thunderbird's about:config.
          'pop-up',       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { 'normal', "dialog" }
      }, properties = { titlebars_enabled = false }
    },

    -- Set Alacritty to always map on the tag named '1' on screen 1.
    { rule = { class = 'Alacritty' },
    	properties = { screen = 1, tag = '1' } },

    -- Set Firefox to always map on the tag named '2' on screen 1.
    { rule = { class = 'firefox' },
    	properties = { screen = 1, tag = '2' } },

    -- Set social apps to always map on the tag named '3' on screen 1.
    { rule = { class = 'zoom' },
    	properties = { screen = 1, tag = '3', floating = true } },
    { rule = { class = 'Microsoft Teams - Preview' },
    	properties = { screen = 1, tag = '3' } },
    { rule = { class = 'discord' },
    	properties = { screen = 1, tag = '3' } },
			
    -- Set Spotify to always map on the tag named '4' on screen 1.
    { rule = { class = 'spotify' },
    	properties = { screen = 1, tag = '4' } },

    -- Set Steam to always map on the tag named '5' on screen 1.
    { rule = { class = 'Steam' },
    	properties = { screen = 1, tag = '5' } },

    -- Set LibreOffice to always map on the tag named '6' on screen 1.
    { rule = { class = 'libreoffice' },
    	properties = { screen = 1, tag = '6' } },
}
-- }}}

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

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal('request::titlebars', function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal('request::activate', "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal('request::activate', "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = 'center',
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
--client.connect_signal('mouse::enter', function(c)
--    c:emit_signal('request::activate', "mouse_enter", {raise = false})
--end)

client.connect_signal('focus', function(c) c.border_color = beautiful.border_focus end)
client.connect_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Gaps
beautiful.useless_gap = 7

-- Autostart
awful.spawn.with_shell('~/.fehbg')
awful.spawn.with_shell('killall -q picom; while pgrep -u $UID -x picom >/dev/null; do sleep 1; done; picom --experimental-backends')
awful.spawn.with_shell('rivalcfg -s 500 -S 1000 -e breath -c "#22820c"')

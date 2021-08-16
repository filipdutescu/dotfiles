local awful = require('awful')
local beautiful = require('beautiful')

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


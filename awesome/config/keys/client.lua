-------------------------------
-- Client key bindings setup --
-------------------------------

-- Standard awesome library
local gears = require('gears')
local awful = require('awful')

-- Dependencies for actions
local menubar = require('menubar')
local hotkeys_popup = require('awful.hotkeys_popup')

-- General configs (i.e. definition of mod key)
local utils = require('config.keys.utils')

local clientKeys = gears.table.join(
    awful.key({ utils.modKey, }, 'f',
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = 'toggle fullscreen', group = 'client'}
    ),
    awful.key({ utils.modKey, 'Shift'   }, 'c',
        function (c) c:kill() end,
        {description = 'close', group = 'client'}
    ),
    awful.key({ utils.modKey, 'Control' }, 'space',
        awful.client.floating.toggle                     ,
        {description = 'toggle floating', group = 'client'}
    ),
    awful.key({ utils.modKey, 'Control' }, 'Return',
        function (c) c:swap(awful.client.getmaster()) end,
        {description = 'move to master', group = 'client'}
    ),
    awful.key({ utils.modKey, }, 'o', 
        function (c) c:move_to_screen() end,
        {description = 'move to screen', group = 'client'}
    ),
    awful.key({ utils.modKey, }, 't',
        function (c) c.ontop = not c.ontop end,
        {description = 'toggle keep on top', group = 'client'}
    ),
    awful.key({ utils.modKey, }, 'n',
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = 'minimize', group = 'client'}
    ),
    awful.key({ utils.modKey, }, 'm',
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = '(un)maximize', group = 'client'}
    ),
    awful.key({ utils.modKey, 'Control' }, 'm',
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = '(un)maximize vertically', group = 'client'}
    ),
    awful.key({ utils.modKey, 'Shift' }, 'm',
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = '(un)maximize horizontally', group = 'client'}
    )
)

return clientKeys

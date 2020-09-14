--[[
 $$$$$$\  $$\           $$\                 $$\       $$\   $$\                              
$$  __$$\ $$ |          $$ |                $$ |      $$ | $$  |                             
$$ /  \__|$$ | $$$$$$\  $$$$$$$\   $$$$$$\  $$ |      $$ |$$  / $$$$$$\  $$\   $$\  $$$$$$$\ 
$$ |$$$$\ $$ |$$  __$$\ $$  __$$\  \____$$\ $$ |      $$$$$  / $$  __$$\ $$ |  $$ |$$  _____|
$$ |\_$$ |$$ |$$ /  $$ |$$ |  $$ | $$$$$$$ |$$ |      $$  $$<  $$$$$$$$ |$$ |  $$ |\$$$$$$\  
$$ |  $$ |$$ |$$ |  $$ |$$ |  $$ |$$  __$$ |$$ |      $$ |\$$\ $$   ____|$$ |  $$ | \____$$\ 
\$$$$$$  |$$ |\$$$$$$  |$$$$$$$  |\$$$$$$$ |$$ |      $$ | \$$\\$$$$$$$\ \$$$$$$$ |$$$$$$$  |
 \______/ \__| \______/ \_______/  \_______|\__|      \__|  \__|\_______| \____$$ |\_______/ 
                                                                         $$\   $$ |          
                                                                         \$$$$$$  |          
                                                                          \______/           
--]]

-- Standard awesome library
local gears = require('gears')
local awful = require('awful')

-- Dependencies for actions
local menubar = require('menubar')
local hotkeys_popup = require('awful.hotkeys_popup')

-- General configs (i.e. definition of mod key)
local utils = require('config.keys.utils')
local apps = require('config.apps')


--[[
 $$$$$$\                                                   $$\ 
$$  __$$\                                                  $$ |
$$ /  \__| $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$$$$$\  $$ |
$$ |$$$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ \____$$\ $$ |
$$ |\_$$ |$$$$$$$$ |$$ |  $$ |$$$$$$$$ |$$ |  \__|$$$$$$$ |$$ |
$$ |  $$ |$$   ____|$$ |  $$ |$$   ____|$$ |     $$  __$$ |$$ |
\$$$$$$  |\$$$$$$$\ $$ |  $$ |\$$$$$$$\ $$ |     \$$$$$$$ |$$ |
 \______/  \_______|\__|  \__| \_______|\__|      \_______|\__|
                                                               
                                                               
                                                               
--]]

local globalKeys = gears.table.join(
    awful.key({ utils.modKey, }, 's', 
        hotkeys_popup.show_help,
        {description='show help', group='awesome'}
    ),
    awful.key({ utils.modKey, }, 'Left', 
        awful.tag.viewprev,
        {description = 'view previous', group = 'tag'}
    ),
    awful.key({ utils.modKey, }, 'Right', 
        awful.tag.viewnext,
        {description = 'view next', group = 'tag'}
    ),
    awful.key({ utils.modKey, }, 'Escape', 
        awful.tag.history.restore,
        {description = 'go back', group = 'tag'}
    ),

    awful.key({ utils.modKey, }, 'j',
        function () awful.client.focus.byidx( 1) end,
        {description = 'focus next by index', group = 'client'}
    ),
    awful.key({ utils.modKey, }, 'k', 
        function () awful.client.focus.byidx(-1) end,
        {description = 'focus previous by index', group = 'client'}
    ),
    --awful.key({ utils.modKey, }, 'w', 
    --    function () mymainmenu:show() end,
    --    {description = 'show main menu', group = 'awesome'}
    --),

    -- Layout manipulation
    awful.key({ utils.modKey, utils.shiftKey }, 'j',
        function () awful.client.swap.byidx(  1) end,
        {description = 'swap with next client by index', group = 'client'}
    ),
    awful.key({ utils.modKey, utils.shiftKey }, 'k',
        function () awful.client.swap.byidx( -1) end,
        {description = 'swap with previous client by index', group = 'client'}
    ),
    awful.key({ utils.modKey, utils.controlKey }, 'j', 
        function () awful.screen.focus_relative( 1) end,
        {description = 'focus the next screen', group = 'screen'}
    ),
    awful.key({ utils.modKey, utils.controlKey }, 'k', 
        function () awful.screen.focus_relative(-1) end,
        {description = 'focus the previous screen', group = 'screen'}
    ),
    awful.key({ utils.modKey, }, 'u',
        awful.client.urgent.jumpto,
        {description = 'jump to urgent client', group = 'client'}
    ),
    awful.key({ utils.modKey, }, 'Tab',
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = 'go back', group = 'client'}
    ),

    -- Standard program
    awful.key({ utils.modKey, utils.controlKey }, 'r', 
        awesome.restart,
        {description = 'reload awesome', group = 'awesome'}
    ),
    awful.key({ utils.modKey, utils.shiftKey   }, 'q', 
        awesome.quit,
        {description = 'quit awesome', group = 'awesome'}
    ),

    awful.key({ utils.modKey, }, 'l',
        function () awful.tag.incmwfact( 0.05) end,
        {description = 'increase master width factor', group = 'layout'}
    ),
    awful.key({ utils.modKey, }, 'h', 
        function () awful.tag.incmwfact(-0.05) end,
        {description = 'decrease master width factor', group = 'layout'}
    ),
    awful.key({ utils.modKey, utils.shiftKey }, 'h',
        function () awful.tag.incnmaster( 1, nil, true) end,
        {description = 'increase the number of master clients', group = 'layout'}
    ),
    awful.key({ utils.modKey, utils.shiftKey }, 'l',
        function () awful.tag.incnmaster(-1, nil, true) end,
        {description = 'decrease the number of master clients', group = 'layout'}
    ),
    awful.key({ utils.modKey, utils.controlKey }, 'h', 
        function () awful.tag.incncol( 1, nil, true) end,
        {description = 'increase the number of columns', group = 'layout'}
    ),
    awful.key({ utils.modKey, utils.controlKey }, 'l', 
        function () awful.tag.incncol(-1, nil, true) end,
        {description = 'decrease the number of columns', group = 'layout'}
    ),
    awful.key({ utils.modKey, utils.altKey }, 'space', 
        function () awful.layout.inc( 1) end,
        {description = 'select next', group = 'layout'}
    ),
    awful.key({ utils.modKey, utils.shiftKey, utils.altKey }, 'space', 
        function () awful.layout.inc(-1) end,
        {description = 'select previous', group = 'layout'}
    ),

    awful.key({ utils.modKey, utils.controlKey }, 'n',
        function ()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    'request::activate', 'key.unminimize', {raise = true}
                )
            end
        end,
        {description = 'restore minimized', group = 'client'}
    ),

    awful.key({ utils.modKey }, 'x',
        function ()
            awful.prompt.run {
                prompt       = 'Run Lua code: ',
                textbox      = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. '/history_eval'
            }
        end,
        {description = 'lua execute prompt', group = 'awesome'}
    ),
    
    -- Menubar
    awful.key({ utils.modKey }, 'p', 
        function() menubar.show() end,
        {description = 'show the menubar', group = 'launcher'})
)


--[[
 $$$$$$\                             $$$$$$\  $$\                            $$\                           $$\               
$$  __$$\                           $$  __$$\ $$ |                           $$ |                          $$ |              
$$ /  $$ | $$$$$$\   $$$$$$\        $$ /  \__|$$$$$$$\   $$$$$$\   $$$$$$\ $$$$$$\    $$$$$$$\ $$\   $$\ $$$$$$\    $$$$$$$\ 
$$$$$$$$ |$$  __$$\ $$  __$$\       \$$$$$$\  $$  __$$\ $$  __$$\ $$  __$$\\_$$  _|  $$  _____|$$ |  $$ |\_$$  _|  $$  _____|
$$  __$$ |$$ /  $$ |$$ /  $$ |       \____$$\ $$ |  $$ |$$ /  $$ |$$ |  \__| $$ |    $$ /      $$ |  $$ |  $$ |    \$$$$$$\  
$$ |  $$ |$$ |  $$ |$$ |  $$ |      $$\   $$ |$$ |  $$ |$$ |  $$ |$$ |       $$ |$$\ $$ |      $$ |  $$ |  $$ |$$\  \____$$\ 
$$ |  $$ |$$$$$$$  |$$$$$$$  |      \$$$$$$  |$$ |  $$ |\$$$$$$  |$$ |       \$$$$  |\$$$$$$$\ \$$$$$$  |  \$$$$  |$$$$$$$  |
\__|  \__|$$  ____/ $$  ____/        \______/ \__|  \__| \______/ \__|        \____/  \_______| \______/    \____/ \_______/ 
          $$ |      $$ |                                                                                                     
          $$ |      $$ |                                                                                                     
          \__|      \__|                                                                                                     
--]]

globalKeys = gears.table.join(globalKeys,
		-- Terminal
    awful.key({ utils.modKey, }, 'Return', 
        function () awful.spawn(apps.terminal) end,
        {description = 'open a terminal', group = 'launcher'}
    ),
    -- Prompt
    awful.key({ utils.modKey }, 'space', 
        function () awful.util.spawn('rofi -show combi') end,
        {description = 'run prompt', group = 'launcher'}
    ),

    -- Browser
    awful.key({ utils.modKey }, 'b',
        function () awful.util.spawn(apps.browser) end,
        {description = 'open browser', group = 'launcher'}
    )
)


--[[
$$\      $$\                 $$\ $$\                  $$$\           $$\    $$\           $$\                                   
$$$\    $$$ |                $$ |\__|                $$ $$\          $$ |   $$ |          $$ |                                  
$$$$\  $$$$ | $$$$$$\   $$$$$$$ |$$\  $$$$$$\        \$$$\ |         $$ |   $$ | $$$$$$\  $$ |$$\   $$\ $$$$$$\$$$$\   $$$$$$\  
$$\$$\$$ $$ |$$  __$$\ $$  __$$ |$$ | \____$$\       $$\$$\$$\       \$$\  $$  |$$  __$$\ $$ |$$ |  $$ |$$  _$$  _$$\ $$  __$$\ 
$$ \$$$  $$ |$$$$$$$$ |$$ /  $$ |$$ | $$$$$$$ |      $$ \$$ __|       \$$\$$  / $$ /  $$ |$$ |$$ |  $$ |$$ / $$ / $$ |$$$$$$$$ |
$$ |\$  /$$ |$$   ____|$$ |  $$ |$$ |$$  __$$ |      $$ |\$$\          \$$$  /  $$ |  $$ |$$ |$$ |  $$ |$$ | $$ | $$ |$$   ____|
$$ | \_/ $$ |\$$$$$$$\ \$$$$$$$ |$$ |\$$$$$$$ |       $$$$ $$\          \$  /   \$$$$$$  |$$ |\$$$$$$  |$$ | $$ | $$ |\$$$$$$$\ 
\__|     \__| \_______| \_______|\__| \_______|       \____\__|          \_/     \______/ \__| \______/ \__| \__| \__| \_______|
                                                                                                                                
                                                                                                                                
                                                                                                                                
--]]

globalKeys = gears.table.join(globalKeys,
    -- Volume Keys
    awful.key({}, 'XF86AudioLowerVolume',
        function () awful.util.spawn('pamixer -d 5', false) end,
				{}
		),
    awful.key({}, 'XF86AudioRaiseVolume',
        function () awful.util.spawn('pamixer -i 5', false) end,
				{}
    ),
    awful.key({}, 'XF86AudioMute', 
        function () awful.util.spawn('pactl set-sink-mute @DEFAULT_SINK@ toggle', false) end,
				{}
    ),
    awful.key({}, 'XF86AudioMicMute', 
        function () awful.util.spawn('pactl set-source-mute @DEFAULT_SOURCE@ toggle', false) end,
				{}
    ),
   
    -- Media Keys
    awful.key({}, 'XF86AudioPlay',
        function() awful.util.spawn('playerctl play-pause', false) end,
				{}
    ),
    awful.key({}, 'XF86AudioStop',
        function() awful.util.spawn('playerctl stop', false) end,
				{}
    ),
    awful.key({}, 'XF86AudioNext', 
        function() awful.util.spawn('playerctl next', false) end,
				{}
    ),
    awful.key({}, 'XF86AudioPrev',
        function() awful.util.spawn('playerctl previous', false) end,
				{}
    )
)


--[[
$$$$$$$\            $$\           $$\        $$\                                             
$$  __$$\           \__|          $$ |       $$ |                                            
$$ |  $$ | $$$$$$\  $$\  $$$$$$\  $$$$$$$\ $$$$$$\   $$$$$$$\   $$$$$$\   $$$$$$$\  $$$$$$$\ 
$$$$$$$\ |$$  __$$\ $$ |$$  __$$\ $$  __$$\\_$$  _|  $$  __$$\ $$  __$$\ $$  _____|$$  _____|
$$  __$$\ $$ |  \__|$$ |$$ /  $$ |$$ |  $$ | $$ |    $$ |  $$ |$$$$$$$$ |\$$$$$$\  \$$$$$$\  
$$ |  $$ |$$ |      $$ |$$ |  $$ |$$ |  $$ | $$ |$$\ $$ |  $$ |$$   ____| \____$$\  \____$$\ 
$$$$$$$  |$$ |      $$ |\$$$$$$$ |$$ |  $$ | \$$$$  |$$ |  $$ |\$$$$$$$\ $$$$$$$  |$$$$$$$  |
\_______/ \__|      \__| \____$$ |\__|  \__|  \____/ \__|  \__| \_______|\_______/ \_______/ 
                        $$\   $$ |                                                           
                        \$$$$$$  |                                                           
                         \______/                                                            
--]]

globalKeys = gears.table.join(globalKeys,
    awful.key({}, 'XF86MonBrightnessUp',
        function() awful.util.spawn('light -A 5') end,
				{}
    ),
    awful.key({}, 'XF86MonBrightnessDown',
        function() awful.util.spawn('light -U 5') end,
				{}
    )
)


--[[
$$$$$$$$\                            
\__$$  __|                           
   $$ | $$$$$$\   $$$$$$\   $$$$$$$\ 
   $$ | \____$$\ $$  __$$\ $$  _____|
   $$ | $$$$$$$ |$$ /  $$ |\$$$$$$\  
   $$ |$$  __$$ |$$ |  $$ | \____$$\ 
   $$ |\$$$$$$$ |\$$$$$$$ |$$$$$$$  |
   \__| \_______| \____$$ |\_______/ 
                 $$\   $$ |          
                 \$$$$$$  |          
                  \______/           
--]]

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalKeys = gears.table.join(globalKeys,
        -- View tag only.
        awful.key({ utils.modKey }, '#' .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            {description = 'view tag #'..i, group = 'tag'}
        ),
        -- Toggle tag display.
        awful.key({ utils.modKey, utils.controlKey }, '#' .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                   awful.tag.viewtoggle(tag)
                end
            end,
            {description = 'toggle tag #' .. i, group = 'tag'}
        ),
        -- Move client to tag.
        awful.key({ utils.modKey, utils.shiftKey }, '#' .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
               end
            end,
            {description = 'move focused client to tag #'..i, group = 'tag'}
        ),
        -- Toggle tag on focused client.
        awful.key({ utils.modKey, utils.controlKey, utils.shiftKey }, '#' .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            {description = 'toggle focused client on tag #' .. i, group = 'tag'}
        )
    )
end

return globalKeys

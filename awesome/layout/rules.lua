--[[
 $$$$$$\  $$\ $$\                      $$\            $$$\           $$\                                                $$\           $$$$$$$\            $$\                     
$$  __$$\ $$ |\__|                     $$ |          $$ $$\          $$ |                                               $$ |          $$  __$$\           $$ |                    
$$ /  \__|$$ |$$\  $$$$$$\  $$$$$$$\ $$$$$$\         \$$$\ |         $$ |      $$$$$$\  $$\   $$\  $$$$$$\  $$\   $$\ $$$$$$\         $$ |  $$ |$$\   $$\ $$ | $$$$$$\   $$$$$$$\ 
$$ |      $$ |$$ |$$  __$$\ $$  __$$\\_$$  _|        $$\$$\$$\       $$ |      \____$$\ $$ |  $$ |$$  __$$\ $$ |  $$ |\_$$  _|        $$$$$$$  |$$ |  $$ |$$ |$$  __$$\ $$  _____|
$$ |      $$ |$$ |$$$$$$$$ |$$ |  $$ | $$ |          $$ \$$ __|      $$ |      $$$$$$$ |$$ |  $$ |$$ /  $$ |$$ |  $$ |  $$ |          $$  __$$< $$ |  $$ |$$ |$$$$$$$$ |\$$$$$$\  
$$ |  $$\ $$ |$$ |$$   ____|$$ |  $$ | $$ |$$\       $$ |\$$\        $$ |     $$  __$$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |  $$ |$$\       $$ |  $$ |$$ |  $$ |$$ |$$   ____| \____$$\ 
\$$$$$$  |$$ |$$ |\$$$$$$$\ $$ |  $$ | \$$$$  |       $$$$ $$\       $$$$$$$$\\$$$$$$$ |\$$$$$$$ |\$$$$$$  |\$$$$$$  |  \$$$$  |      $$ |  $$ |\$$$$$$  |$$ |\$$$$$$$\ $$$$$$$  |
 \______/ \__|\__| \_______|\__|  \__|  \____/        \____\__|      \________|\_______| \____$$ | \______/  \______/    \____/       \__|  \__| \______/ \__| \_______|\_______/ 
                                                                                        $$\   $$ |                                                                                
                                                                                        \$$$$$$  |                                                                                
                                                                                         \______/                                                                                 
--]]

local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')

local clientKeys = require('config.keys.client')
local clientButtons = require('config.buttons.client')


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

local general = {
    rule = { },
    properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = clientKeys,
        buttons = clientButtons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
}


--[[
$$$$$$$$\ $$\                      $$\     $$\                            $$$$$$\  $$\ $$\                      $$\               
$$  _____|$$ |                     $$ |    \__|                          $$  __$$\ $$ |\__|                     $$ |              
$$ |      $$ | $$$$$$\   $$$$$$\ $$$$$$\   $$\ $$$$$$$\   $$$$$$\        $$ /  \__|$$ |$$\  $$$$$$\  $$$$$$$\ $$$$$$\    $$$$$$$\ 
$$$$$\    $$ |$$  __$$\  \____$$\\_$$  _|  $$ |$$  __$$\ $$  __$$\       $$ |      $$ |$$ |$$  __$$\ $$  __$$\\_$$  _|  $$  _____|
$$  __|   $$ |$$ /  $$ | $$$$$$$ | $$ |    $$ |$$ |  $$ |$$ /  $$ |      $$ |      $$ |$$ |$$$$$$$$ |$$ |  $$ | $$ |    \$$$$$$\  
$$ |      $$ |$$ |  $$ |$$  __$$ | $$ |$$\ $$ |$$ |  $$ |$$ |  $$ |      $$ |  $$\ $$ |$$ |$$   ____|$$ |  $$ | $$ |$$\  \____$$\ 
$$ |      $$ |\$$$$$$  |\$$$$$$$ | \$$$$  |$$ |$$ |  $$ |\$$$$$$$ |      \$$$$$$  |$$ |$$ |\$$$$$$$\ $$ |  $$ | \$$$$  |$$$$$$$  |
\__|      \__| \______/  \_______|  \____/ \__|\__|  \__| \____$$ |       \______/ \__|\__| \_______|\__|  \__|  \____/ \_______/ 
                                                         $$\   $$ |                                                               
                                                         \$$$$$$  |                                                               
                                                          \______/                                                                
--]]

local floatingClients = {
    rule_any = {
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
            'Tor Browser', -- Needs a fixed window size to avoid fingerprinting by screen     size.
            'Wpa_gui',
            'veromix',
            'xtightvncviewer',
            'org.remmina.Remmina',
            'Matplotlib',
            'xfce4-power-manager-settings'
        },

        -- Note that the name property shown in xprop might be set slightly after creati    on of the client
        -- and the name shown there might not match defined rules here.
        name = {
            'Event Tester',  -- xev.
        },
        role = {
            'AlarmWindow',  -- Thunderbird's calendar.
            'ConfigManager',  -- Thunderbird's about:config.
            'pop-up',       -- e.g. Google Chrome's (detached) Developer Tools.
        }
    },
    properties = { floating = true }
}

return {
    general,
    floatingClients,
    {
        rule_any = { type = { 'normal', 'dialog' } },
        properties = { titlebars_enabled = false }
    },


    --[[
    $$$$$$$\                                                                           
    $$  __$$\                                                                          
    $$ |  $$ | $$$$$$\   $$$$$$\   $$$$$$\   $$$$$$\  $$$$$$\  $$$$$$\$$$$\   $$$$$$$\ 
    $$$$$$$  |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ \____$$\ $$  _$$  _$$\ $$  _____|
    $$  ____/ $$ |  \__|$$ /  $$ |$$ /  $$ |$$ |  \__|$$$$$$$ |$$ / $$ / $$ |\$$$$$$\  
    $$ |      $$ |      $$ |  $$ |$$ |  $$ |$$ |     $$  __$$ |$$ | $$ | $$ | \____$$\ 
    $$ |      $$ |      \$$$$$$  |\$$$$$$$ |$$ |     \$$$$$$$ |$$ | $$ | $$ |$$$$$$$  |
    \__|      \__|       \______/  \____$$ |\__|      \_______|\__| \__| \__|\_______/ 
                                $$\   $$ |                                           
                                \$$$$$$  |                                           
                                 \______/                                            
    --]]

    -- Set Alacritty to always map on the tag named '1' on screen 1.
    { rule = { class = 'Alacritty' },
        properties = { screen = 1, tag = '  ' } },

    -- Set Firefox to always map on the tag named '2' on screen 1.
    { rule = { class = 'firefox' },
        properties = { screen = 1, tag = '  ' } },
    -- Set Brave to always map on the tag named '2' on screen 1.
    { rule = { class = 'Brave-browser' },
        properties = { screen = 1, tag = '  ' } },

    -- Set social apps to always map on the tag named '3' on screen 1.
    { rule = { class = 'zoom' },
        properties = { screen = 1, tag = '  ', floating = true } },
    { rule = { class = 'Microsoft Teams - Preview' },
        properties = { screen = 1, tag = '  ' } },
    { rule = { class = 'discord' },
        properties = { screen = 1, tag = '  ' } },

    -- Set Spotify to always map on the tag named '4' on screen 1.
    { rule = { class = 'spotify' },
        properties = { screen = 1, tag = ' ﭵ ' } },

    -- Set Steam to always map on the tag named '5' on screen 1.
    { rule = { class = 'Steam' },
        properties = { screen = 1, tag = '  ' } },

    -- Set LibreOffice to always map on the tag named '6' on screen 1.
    { rule = { class = 'libreoffice' },
        properties = { screen = 1, tag = '  ' } }
}

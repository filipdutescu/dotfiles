--[[
$$$$$$$$\                        $$\      $$\ $$\ $$\                           
\__$$  __|                       $$ | $\  $$ |\__|$$ |                          
   $$ | $$$$$$\   $$$$$$\        $$ |$$$\ $$ |$$\ $$$$$$$\   $$$$$$\   $$$$$$\  
   $$ |$$  __$$\ $$  __$$\       $$ $$ $$\$$ |$$ |$$  __$$\  \____$$\ $$  __$$\ 
   $$ |$$ /  $$ |$$ /  $$ |      $$$$  _$$$$ |$$ |$$ |  $$ | $$$$$$$ |$$ |  \__|
   $$ |$$ |  $$ |$$ |  $$ |      $$$  / \$$$ |$$ |$$ |  $$ |$$  __$$ |$$ |      
   $$ |\$$$$$$  |$$$$$$$  |      $$  /   \$$ |$$ |$$$$$$$  |\$$$$$$$ |$$ |      
   \__| \______/ $$  ____/       \__/     \__|\__|\_______/  \_______|\__|      
                 $$ |                                                           
                 $$ |                                                           
                 \__|                                                           
--]]


local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local utils = require('layout.utils')
local dpi = beautiful.xresources.apply_dpi


--[[
$$\      $$\ $$\       $$\                      $$\               
$$ | $\  $$ |\__|      $$ |                     $$ |              
$$ |$$$\ $$ |$$\  $$$$$$$ | $$$$$$\   $$$$$$\ $$$$$$\    $$$$$$$\ 
$$ $$ $$\$$ |$$ |$$  __$$ |$$  __$$\ $$  __$$\\_$$  _|  $$  _____|
$$$$  _$$$$ |$$ |$$ /  $$ |$$ /  $$ |$$$$$$$$ | $$ |    \$$$$$$\  
$$$  / \$$$ |$$ |$$ |  $$ |$$ |  $$ |$$   ____| $$ |$$\  \____$$\ 
$$  /   \$$ |$$ |\$$$$$$$ |\$$$$$$$ |\$$$$$$$\  \$$$$  |$$$$$$$  |
\__/     \__|\__| \_______| \____$$ | \_______|  \____/ \_______/ 
                           $$\   $$ |                             
                           \$$$$$$  |                             
                            \______/                              
--]]

local tagList = require('widget.taglist')
local textClock = require('widget.basic-clock')
local launcher = require('widget.launcher')
local battery = require('widget.battery')
 

--[[
 $$$$$$\                                                    $$\                     $$\      $$\ $$\ $$\                           
$$  __$$\                                                   $$ |                    $$ | $\  $$ |\__|$$ |                          
$$ /  \__| $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$$$$$\ $$$$$$\    $$$$$$\        $$ |$$$\ $$ |$$\ $$$$$$$\   $$$$$$\   $$$$$$\  
$$ |$$$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ \____$$\\_$$  _|  $$  __$$\       $$ $$ $$\$$ |$$ |$$  __$$\  \____$$\ $$  __$$\ 
$$ |\_$$ |$$$$$$$$ |$$ |  $$ |$$$$$$$$ |$$ |  \__|$$$$$$$ | $$ |    $$$$$$$$ |      $$$$  _$$$$ |$$ |$$ |  $$ | $$$$$$$ |$$ |  \__|
$$ |  $$ |$$   ____|$$ |  $$ |$$   ____|$$ |     $$  __$$ | $$ |$$\ $$   ____|      $$$  / \$$$ |$$ |$$ |  $$ |$$  __$$ |$$ |      
\$$$$$$  |\$$$$$$$\ $$ |  $$ |\$$$$$$$\ $$ |     \$$$$$$$ | \$$$$  |\$$$$$$$\       $$  /   \$$ |$$ |$$$$$$$  |\$$$$$$$ |$$ |      
 \______/  \_______|\__|  \__| \_______|\__|      \_______|  \____/  \_______|      \__/     \__|\__|\_______/  \_______|\__|      
                                                                                                                                   
                                                                                                                                   
                                                                                                                                   
--]]

awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    utils.createTags(s, {
        { name = '  ', selected = true },
        { name = '  ', },
        { name = '  ', },
        { name = ' ﭵ ', },
        { name = '  ', },
        { name = '  ', },
        { name = '  ', },
        { name = '  ', },
        { name = '  ', },
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
            {
                {
                    tagList(s),
                    layout = wibox.layout.align.horizontal,
                },
                left = dpi(18),
                right = dpi(18),
                widget = wibox.container.margin,
            },
            bg = beautiful.bg_normal,
            widget = wibox.container.background,
            shape = gears.shape.rounded_bar,
            shape_border_color = beautiful.border_focus,
            shape_border_width = beautiful.border_width,
        },
        {
            {
                {
                    textClock,
                    layout = wibox.layout.align.horizontal,
                },
                left = dpi(75),
                right = dpi(75),
                widget = wibox.container.margin,
            },
            bg = beautiful.bg_normal,
            widget = wibox.container.background,
            shape = gears.shape.rounded_bar,
            shape_border_color = beautiful.border_focus,
            shape_border_width = beautiful.border_width,
        },
        { -- Right widgets
            {
                {
                    wibox.widget.systray(),
                    battery(),
                    awful.widget.keyboardlayout(),
                    s.layoutBox,
                    layout = wibox.layout.fixed.horizontal,
                },
                left = dpi(20),
                right = dpi(20),
                widget = wibox.container.margin,
            },
            bg = beautiful.bg_normal,
            widget = wibox.container.background,
            shape = gears.shape.rounded_bar,
            shape_border_color = beautiful.border_focus,
            shape_border_width = beautiful.border_width,
        },
    })
end)


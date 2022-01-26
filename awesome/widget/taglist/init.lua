--[[
$$$$$$$$\                  $$\ $$\             $$\     
\__$$  __|                 $$ |\__|            $$ |    
   $$ | $$$$$$\   $$$$$$\  $$ |$$\  $$$$$$$\ $$$$$$\   
   $$ | \____$$\ $$  __$$\ $$ |$$ |$$  _____|\_$$  _|  
   $$ | $$$$$$$ |$$ /  $$ |$$ |$$ |\$$$$$$\    $$ |    
   $$ |$$  __$$ |$$ |  $$ |$$ |$$ | \____$$\   $$ |$$\ 
   $$ |\$$$$$$$ |\$$$$$$$ |$$ |$$ |$$$$$$$  |  \$$$$  |
   \__| \_______| \____$$ |\__|\__|\_______/    \____/ 
                 $$\   $$ |                            
                 \$$$$$$  |                            
                  \______/                             
--]]

local awful = require('awful')
local gears = require('gears')
local keys = require('config.keys.global')

-- Create a wibox for each screen and add it
local taglist = function(screen)
    local taglist_buttons = gears.table.join(
        awful.button({ }, 1, function(t) t:view_only() end),
        awful.button({ keys.modKey }, 1,
            function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
        awful.button({ }, 3, awful.tag.viewtoggle),
        awful.button({ keys.modKey }, 3,
            function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end),
        awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
        awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
    )

    local widget = awful.widget.taglist
    {
        screen = screen,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    return widget
end

return taglist

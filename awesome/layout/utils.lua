--[[
$$\   $$\   $$\     $$\ $$\                  $$$$$$\                           $$\                                                $$\               
$$ |  $$ |  $$ |    \__|$$ |                $$  __$$\                          $$ |                                               $$ |              
$$ |  $$ |$$$$$$\   $$\ $$ | $$$$$$$\       $$ /  \__|$$$$$$\   $$$$$$\        $$ |      $$$$$$\  $$\   $$\  $$$$$$\  $$\   $$\ $$$$$$\    $$$$$$$\ 
$$ |  $$ |\_$$  _|  $$ |$$ |$$  _____|      $$$$\    $$  __$$\ $$  __$$\       $$ |      \____$$\ $$ |  $$ |$$  __$$\ $$ |  $$ |\_$$  _|  $$  _____|
$$ |  $$ |  $$ |    $$ |$$ |\$$$$$$\        $$  _|   $$ /  $$ |$$ |  \__|      $$ |      $$$$$$$ |$$ |  $$ |$$ /  $$ |$$ |  $$ |  $$ |    \$$$$$$\  
$$ |  $$ |  $$ |$$\ $$ |$$ | \____$$\       $$ |     $$ |  $$ |$$ |            $$ |     $$  __$$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |  $$ |$$\  \____$$\ 
\$$$$$$  |  \$$$$  |$$ |$$ |$$$$$$$  |      $$ |     \$$$$$$  |$$ |            $$$$$$$$\\$$$$$$$ |\$$$$$$$ |\$$$$$$  |\$$$$$$  |  \$$$$  |$$$$$$$  |
 \______/    \____/ \__|\__|\_______/       \__|      \______/ \__|            \________|\_______| \____$$ | \______/  \______/    \____/ \_______/ 
                                                                                                  $$\   $$ |                                        
                                                                                                  \$$$$$$  |                                        
                                                                                                   \______/                                         
--]]

local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')

local createBar = function(screen, position, widgets)
    local bar = awful.wibar {
        position = position,
        screen = screen
    }

    bar:setup(widgets)

    return bar
end


local createTags = function(screen, tags)
    for i, t in pairs(tags) do
        t.screen = screen
        t.layout = t.layout or awful.layout.suit.tile
        t.icon_only = t.icon_only or false

        awful.tag.add(t.name, t)
    end
end


return {
    createBar = createBar,
    createTags = createTags
}

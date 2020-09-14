--[[
 $$$$$$\  $$\ $$\                      $$\           $$$$$$$\              $$\     $$\                                   
$$  __$$\ $$ |\__|                     $$ |          $$  __$$\             $$ |    $$ |                                  
$$ /  \__|$$ |$$\  $$$$$$\  $$$$$$$\ $$$$$$\         $$ |  $$ |$$\   $$\ $$$$$$\ $$$$$$\    $$$$$$\  $$$$$$$\   $$$$$$$\ 
$$ |      $$ |$$ |$$  __$$\ $$  __$$\\_$$  _|        $$$$$$$\ |$$ |  $$ |\_$$  _|\_$$  _|  $$  __$$\ $$  __$$\ $$  _____|
$$ |      $$ |$$ |$$$$$$$$ |$$ |  $$ | $$ |          $$  __$$\ $$ |  $$ |  $$ |    $$ |    $$ /  $$ |$$ |  $$ |\$$$$$$\  
$$ |  $$\ $$ |$$ |$$   ____|$$ |  $$ | $$ |$$\       $$ |  $$ |$$ |  $$ |  $$ |$$\ $$ |$$\ $$ |  $$ |$$ |  $$ | \____$$\ 
\$$$$$$  |$$ |$$ |\$$$$$$$\ $$ |  $$ | \$$$$  |      $$$$$$$  |\$$$$$$  |  \$$$$  |\$$$$  |\$$$$$$  |$$ |  $$ |$$$$$$$  |
 \______/ \__|\__| \_______|\__|  \__|  \____/       \_______/  \______/    \____/  \____/  \______/ \__|  \__|\_______/ 
                                                                                                                         
                                                                                                                         
                                                                                                                         
--]]

local awful = require('awful')
local gears = require('gears')

local utils = require('config.keys.utils')

return gears.table.join(
	awful.button({ }, 1, function (c)
		c:emit_signal('request::activate', "mouse_click", { raise = true })
	end),
	awful.button({ utils.modKey }, 1, function (c)
		c:emit_signal('request::activate', "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ utils.modKey }, 3, function (c)
		c:emit_signal('request::activate', "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

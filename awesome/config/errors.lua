--[[
$$$$$$$$\                                               $$\   $$\                           $$\ $$\                               
$$  _____|                                              $$ |  $$ |                          $$ |$$ |                              
$$ |       $$$$$$\   $$$$$$\   $$$$$$\   $$$$$$\        $$ |  $$ | $$$$$$\  $$$$$$$\   $$$$$$$ |$$ | $$$$$$\   $$$$$$\   $$$$$$$\ 
$$$$$\    $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\       $$$$$$$$ | \____$$\ $$  __$$\ $$  __$$ |$$ |$$  __$$\ $$  __$$\ $$  _____|
$$  __|   $$ |  \__|$$ |  \__|$$ /  $$ |$$ |  \__|      $$  __$$ | $$$$$$$ |$$ |  $$ |$$ /  $$ |$$ |$$$$$$$$ |$$ |  \__|\$$$$$$\  
$$ |      $$ |      $$ |      $$ |  $$ |$$ |            $$ |  $$ |$$  __$$ |$$ |  $$ |$$ |  $$ |$$ |$$   ____|$$ |       \____$$\ 
$$$$$$$$\ $$ |      $$ |      \$$$$$$  |$$ |            $$ |  $$ |\$$$$$$$ |$$ |  $$ |\$$$$$$$ |$$ |\$$$$$$$\ $$ |      $$$$$$$  |
\________|\__|      \__|       \______/ \__|            \__|  \__| \_______|\__|  \__| \_______|\__| \_______|\__|      \_______/ 
                                                                                                                                  
                                                                                                                                  
                                                                                                                                  
--]]

local awful = require('awful')
local naughty = require('naughty')

-- Handle errors
if awesome.startup_errors then
	naughty.notify(
	{
		preset = naughty.config.presets.critical,
	  title = 'Oops, there were errors during startup!',
	  text = awesome.startup_errors
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal('debug::error', function (err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true

		naughty.notify(
		{
			preset = naughty.config.presets.critical,
		  title = 'Oops, an error happened!',
		  text = tostring(err)
		})
		in_error = false
	end)
end


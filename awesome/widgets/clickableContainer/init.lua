local wibox = require('wibox')
local beautiful = require('beautiful')

local clickableContainer = function(widget)
	local container = wibox.widget
	{
		widget,
		widget = wibox.container.background
	}

end


return clickableContainer

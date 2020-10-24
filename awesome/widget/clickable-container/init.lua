--[[
 $$$$$$\  $$\ $$\           $$\                $$\       $$\                  $$$$$$\                       $$\               $$\                               
$$  __$$\ $$ |\__|          $$ |               $$ |      $$ |                $$  __$$\                      $$ |              \__|                              
$$ /  \__|$$ |$$\  $$$$$$$\ $$ |  $$\ $$$$$$\  $$$$$$$\  $$ | $$$$$$\        $$ /  \__| $$$$$$\  $$$$$$$\ $$$$$$\    $$$$$$\  $$\ $$$$$$$\   $$$$$$\   $$$$$$\  
$$ |      $$ |$$ |$$  _____|$$ | $$  |\____$$\ $$  __$$\ $$ |$$  __$$\       $$ |      $$  __$$\ $$  __$$\\_$$  _|   \____$$\ $$ |$$  __$$\ $$  __$$\ $$  __$$\ 
$$ |      $$ |$$ |$$ /      $$$$$$  / $$$$$$$ |$$ |  $$ |$$ |$$$$$$$$ |      $$ |      $$ /  $$ |$$ |  $$ | $$ |     $$$$$$$ |$$ |$$ |  $$ |$$$$$$$$ |$$ |  \__|
$$ |  $$\ $$ |$$ |$$ |      $$  _$$< $$  __$$ |$$ |  $$ |$$ |$$   ____|      $$ |  $$\ $$ |  $$ |$$ |  $$ | $$ |$$\ $$  __$$ |$$ |$$ |  $$ |$$   ____|$$ |      
\$$$$$$  |$$ |$$ |\$$$$$$$\ $$ | \$$\\$$$$$$$ |$$$$$$$  |$$ |\$$$$$$$\       \$$$$$$  |\$$$$$$  |$$ |  $$ | \$$$$  |\$$$$$$$ |$$ |$$ |  $$ |\$$$$$$$\ $$ |      
 \______/ \__|\__| \_______|\__|  \__|\_______|\_______/ \__| \_______|       \______/  \______/ \__|  \__|  \____/  \_______|\__|\__|  \__| \_______|\__|      
                                                                                                                                                                
                                                                                                                                                                
                                                                                                                                                                
--]]

local wibox = require('wibox')
local beautiful = require('beautiful')

local create = function(widget)
  local container = wibox.widget
  { 
    widget, 
    widget = wibox.container.background
  }

  local old_cursor, old_wibox 

  container:connect_signal(
    'mouse::enter',
    function()
      container.bg = beautiful.widget_mouse_enter

      local current_wibox = mouse.current_wibox
      if current_wibox then
        old_cursor, old_wibox = current_wibox.cursor, current_wibox
        current_wibox.cursor = 'hand1'
      end
    end
  )

	container:connect_signal(
		'mouse::leave',
		function()
			container.bg = beautiful.widget_mouse_leave

			if old_wibox then
				old_wibox.cursor = old_cursor
				old_wibox = nil
			end
		end
	)

	container:connect_signal(
		'button::press',
		function()
			container.bg = beautiful.widget_button_press
		end
	)

	container:connect_signal(
		'button::release',
		function()
			container.bg = beautiful.widget_button_release
		end
	)

	return container
end

return create

local awful = require('awful')
local wibox = require('wibox')

local widget = wibox.widget.textclock()
widget.format = '%X %d/%m/%Y'

local calendar = awful.widget.calendar_popup.month()
calendar:attach(widget, 'tc', { on_hover = false })

return widget

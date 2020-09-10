local awful = require('awful')
local menubar = require('menubar')
local naughty = require('naughty')

local apps = require('config.apps')
 
-- Handle errors
require('config.errors')

menubar.utils.terminal = apps.terminal

root.buttons(require('config.buttons.global'))
root.keys(require('config.keys.global'))

require('config.signals')
require('config.autostart')

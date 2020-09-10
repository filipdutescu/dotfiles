local awful = require('awful')
local menubar = require('menubar')

local apps = require('config.apps')
 
menubar.utils.terminal = apps.terminal

root.buttons(require('config.buttons.global'))
root.keys(require('config.keys.global'))

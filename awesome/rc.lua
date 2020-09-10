-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')

-- Standard awesome library
local gears = require('gears')
local awful = require('awful')
require('awful.autofocus')

-- Theme handling library
local beautiful = require('beautiful')
beautiful.init(gears.filesystem.get_configuration_dir() .. 'themes/default.lua')

--------------------
-- Layout & Wibar --
--------------------

require('layout')

----------------------------------------------
-- Key and button bindings and default apps --
----------------------------------------------

require('config')

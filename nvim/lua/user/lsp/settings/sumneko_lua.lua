local lua_version = '5.4'
local lua_runtime_root = '/usr/share/lua'
local lua_runtime = lua_runtime_root .. '/' .. lua_version
local luarocks_libs = '/usr/lib/luarocks/rocks-' .. lua_version
local lua_awesome_libs = '/usr/share/awesome/lib'

-- start with nvim files for nvim APIs and plugins
local libs = vim.api.nvim_get_runtime_file('', true)
table.insert(libs, lua_runtime)
table.insert(libs, luarocks_libs)
table.insert(libs, lua_awesome_libs)

return {
    settings = {
        Lua = {
            runtime = {
                version = 'Lua ' .. lua_version,
                path = {
                    '?.lua',
                    '?/init.lua',
                    lua_runtime .. '/?.lua',
                    lua_runtime .. '/?/init.lua',
                    luarocks_libs .. '/?.lua',
                    luarocks_libs .. '/?/init.lua',
                    lua_awesome_libs .. '/?.lua',
                    lua_awesome_libs .. '/?/init.lua',
                }
            },
            diagnostics = {
                globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = libs,
                checkThirdParty =false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false, },
        },
    },
}

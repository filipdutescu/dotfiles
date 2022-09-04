-- local ng_lib_path = '/usr/lib/node_modules'
local ng_lib_path = vim.fn.getcwd() .. '/node_modules'
-- local ng_cmd = { 'ngserver', '--stdio', '--tsProbeLocations', vim.fn.getcwd() ..  '/node_modules' , '--ngProbeLocations', ng_lib_path }
local ng_cmd = { 'ngserver', '--stdio', '--tsProbeLocations', ng_lib_path , '--ngProbeLocations', ng_lib_path }

return {
    cmd = ng_cmd,
    on_new_config = function(new_config, _)
        new_config.cmd = ng_cmd
    end,
}

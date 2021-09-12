--[[
$$$$$$$\             $$$$$$\                     $$\   $$\            $$$$$$\                                
$$  __$$\           $$  __$$\                    $$ |  $$ |          $$  __$$\                               
$$ |  $$ | $$$$$$\  $$ /  \__|$$$$$$\  $$\   $$\ $$ |$$$$$$\         $$ /  $$ | $$$$$$\   $$$$$$\   $$$$$$$\ 
$$ |  $$ |$$  __$$\ $$$$\     \____$$\ $$ |  $$ |$$ |\_$$  _|        $$$$$$$$ |$$  __$$\ $$  __$$\ $$  _____|
$$ |  $$ |$$$$$$$$ |$$  _|    $$$$$$$ |$$ |  $$ |$$ |  $$ |          $$  __$$ |$$ /  $$ |$$ /  $$ |\$$$$$$\  
$$ |  $$ |$$   ____|$$ |     $$  __$$ |$$ |  $$ |$$ |  $$ |$$\       $$ |  $$ |$$ |  $$ |$$ |  $$ | \____$$\ 
$$$$$$$  |\$$$$$$$\ $$ |     \$$$$$$$ |\$$$$$$  |$$ |  \$$$$  |      $$ |  $$ |$$$$$$$  |$$$$$$$  |$$$$$$$  |
\_______/  \_______|\__|      \_______| \______/ \__|   \____/       \__|  \__|$$  ____/ $$  ____/ \_______/ 
                                                                               $$ |      $$ |                
                                                                               $$ |      $$ |                
                                                                               \__|      \__|                
--]]

local terminal = os.getenv('TERMINAL') or 'alacritty'
local editor = os.getenv('EDITOR') or 'vim'
local editor_cmd = terminal .. ' -e ' .. editor
local browser = os.getenv('BROWSER') or 'firefox'
local power_manager = 'xfce4-power-manager-settings'

return {
    terminal = terminal,
    editor = editor,
    editor_cmd = editor_cmd,
    browser = browser,
    power_manager = power_manager
}


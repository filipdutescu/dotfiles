local	terminal = os.getenv('TERMINAL') or 'alacritty'
local	editor = os.getenv('EDITOR') or 'vim'
local	editor_cmd = terminal .. ' -e ' .. editor
local	browser = os.getenv('BROWSER') or 'firefox'

return {
	terminal = terminal,
	editor = editor,
	editor_cmd = editor_cmd,
	browser = browser
}


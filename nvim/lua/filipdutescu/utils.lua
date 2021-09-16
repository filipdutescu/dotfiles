local popup = require'plenary.popup'

local utils = {}

function utils.rename()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line = vim.api.nvim_get_current_line()
    local cword = vim.fn.expand('<cword>')
    local line_nr, col = cursor[1], cursor[2] + 1
    local title = 'Rename \'' .. cword .. '\''

    local i = 1
    local word_start, word_end = string.find(line, cword, col - i)
    while word_end == nil or col - i < 0 do
        i = i + 1
        word_start, word_end = string.find(line, cword, col - i)
    end

    local popup_opts = {
        padding = { 0, 0, 0, 0 },
        width = #title + 4,
        line = line_nr + 1,
        col = word_start + math.floor((word_end - word_start) / 2),
        cursor_line = true,
        border = true,
        title = title,
        enter = true,
        callback = function() print('Hello') end,
    }

    local buf_no, buf_opts popup.create(cword, popup_opts)
    local buf = vim.api.nvim_win_get_buf(buf_no)
    print(buf)
end


return utils


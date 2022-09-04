local ok, diffview = pcall(require, 'diffview')
if not ok then
   vim.notify('Could not load "diffview": ' .. vim.inspect(diffview))
   return
end

vim.opt.fillchars:append 'diff:/'

diffview.setup({
  diff_binaries = false,    -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  git_cmd = { 'git' },      -- The git executable followed by default args.
  use_icons = true,         -- Requires nvim-web-devicons
  icons = {                 -- Only applies when use_icons is true.
    folder_closed = '',
    folder_open = '',
  },
  signs = {
    fold_closed = '',
    fold_open = '',
  },
})

-- vscode_keymaps.lua
-- VS Code–inspired key mappings for Neovim.

-- Attempt to safely require Telescope's builtin module.
local telescope_ok, telescope_builtin = pcall(require, 'telescope.builtin')
if not telescope_ok then
  vim.notify('Telescope is not installed. Skipping Telescope related keymaps.', vim.log.levels.WARN)
end

-- 1. Quick File Search (Quick Open)
-- VS Code: Ctrl+P
if telescope_ok then
  vim.keymap.set('n', '<C-p>', telescope_builtin.find_files, {
    silent = true,
    desc = 'Find Files (Quick Open)',
  })
end

-- 2. Git File Search
-- VS Code: Ctrl+Shift+G
if telescope_ok then
  vim.keymap.set('n', '<C-S-g>', telescope_builtin.git_files, {
    silent = true,
    desc = 'Find Git Files',
  })
end

-- VS Code: Shift+Alt+F
-- This mapping uses Neovim's built-in LSP formatting.
vim.keymap.set('n', '<S-A-f>', function()
  vim.lsp.buf.format()
end, {
  silent = true,
  desc = 'Format Document',
})

-- 5. Duplicate Line
-- VS Code: Shift+Alt+Down (or Up) duplicates the current line.
-- Duplicate the current line below:
vim.keymap.set('n', '<S-A-Down>', ':t.<CR>', {
  silent = true,
  desc = 'Duplicate line below',
})
-- Duplicate the current line above:
vim.keymap.set('n', '<S-A-Up>', ':t-1<CR>', {
  silent = true,
  desc = 'Duplicate line above',
})

-- 6. Toggle Comment
-- VS Code: Ctrl+/
-- Many terminals interpret Ctrl+/ as Ctrl+_.
-- Requires a commenting plugin like 'Comment.nvim' that provides <Plug> mappings.
vim.keymap.set('n', '<C-_>', '<Plug>(comment_toggle_current_line)', {
  silent = true,
  desc = 'Toggle comment on current line',
})
vim.keymap.set('v', '<C-_>', '<Plug>(comment_toggle_current_block)', {
  silent = true,
  desc = 'Toggle comment on selection',
})

-- 7. Live Grep (Text Search)
-- VS Code: Ctrl+F (or Ctrl+Shift+F)
if telescope_ok then
  vim.keymap.set('n', '<C-f>', telescope_builtin.live_grep, {
    silent = true,
    desc = 'Live Grep Search',
  })
end

-- 8. Toggle Integrated Terminal
-- VS Code: Ctrl+` (backtick)
-- Requires a terminal toggle plugin like 'toggleterm.nvim'.
vim.keymap.set('n', '<C-`>', ':ToggleTerm<CR>', {
  silent = true,
  desc = 'Toggle Terminal',
})

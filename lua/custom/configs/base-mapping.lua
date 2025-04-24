-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-t>', '<cmd>edit term://zsh<CR>', { desc = 'Open terminal' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Tab management
vim.keymap.set('n', '<C-n>', '<cmd>$tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<Tab>', '<cmd>tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<S-Tab>', '<cmd>tabprevious<CR>', { desc = 'Prev tab' })

vim.keymap.set('n', '<C-1>', '<cmd>tabnext 1<CR>', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<C-2>', '<cmd>tabnext 2<CR>', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<C-3>', '<cmd>tabnext 3<CR>', { desc = 'Go to tab 3' })
vim.keymap.set('n', '<C-4>', '<cmd>tabnext 4<CR>', { desc = 'Go to tab 4' })
vim.keymap.set('n', '<C-5>', '<cmd>tabnext 5<CR>', { desc = 'Go to tab 5' })
vim.keymap.set('n', '<C-6>', '<cmd>tabnext 6<CR>', { desc = 'Go to tab 6' })
vim.keymap.set('n', '<C-7>', '<cmd>tabnext 7<CR>', { desc = 'Go to tab 7' })
vim.keymap.set('n', '<C-8>', '<cmd>tabnext 8<CR>', { desc = 'Go to tab 8' })
vim.keymap.set('n', '<C-9>', '<cmd>tabnext 9<CR>', { desc = 'Go to tab 9' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

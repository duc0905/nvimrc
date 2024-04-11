return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      view = {
        width = 30,
      },
    }
    local api = require 'nvim-tree.api'

    vim.keymap.set('n', '<C-e>', api.tree.focus, { desc = 'Toggle nvim-tree' })
  end,
}

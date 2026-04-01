require 'custom.configs.base-settings'

require 'custom.configs.base-mapping'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- NOTE: Essential plugins
  require 'custom.plugins.which-key',
  require 'custom.plugins.treesitter',
  require 'custom.plugins.telescope',
  require 'custom.plugins.lsp',

  -- NOTE: Non-essentials

  -- File tree
  {
    'nvim-mini/mini.files',
    version = false,
    config = function()
      local MiniFiles = require 'mini.files'
      local minifiles_toggle = function()
        if not MiniFiles.close() then
          MiniFiles.open()
        end
      end

      MiniFiles.setup()
      vim.keymap.set('n', '<C-e>', minifiles_toggle, { desc = 'Toggle file explorer' })
    end,
  },

  -- Auto-format
  require 'custom.plugins.conform',

  -- Auto-completion
  require 'custom.plugins.cmp',

  -- Auto pair parenthesis
  {
    'nvim-mini/mini.pairs',
    version = false,
    event = 'InsertEnter',
    opts = {},
  },

  -- Surround selection with something
  { 'nvim-mini/mini.surround', version = false, opts = {} },

  -- Extend a and i capabilities
  { 'nvim-mini/mini.ai', version = false, opts = { n_lines = 500 } },

  -- Comment code
  { 'nvim-mini/mini.comment', version = false, opts = {} },

  -- Session persistence
  -- require 'custom.plugins.persistence',
  { 'nvim-mini/mini.sessions', version = false, opts = {} },

  -- NOTE: git related
  {
    'nvim-mini/mini-git',
    version = false,
    config = function()
      require('mini.git').setup()
    end,
  },
  -- { 'tpope/vim-fugitive' },
  -- require 'custom.plugins.neogit',
  -- require 'custom.plugins.gitsigns',

  -- Debuggers
  require 'custom.plugins.debugger',
  -- require 'custom.plugins.debugger.cpp',
  require 'custom.plugins.debugger.python',

  -- Notes
  require 'custom.plugins.obsidian',

  -- NOTE: Appearance plugins

  -- Theme
  require 'custom.plugins.theme',

  -- Status line
  { 'nvim-mini/mini.statusline', version = false, opts = {} },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Transition
  { 'nvim-mini/mini.animate', version = false, opts = {
    scroll = { enable = false },
  } },

  -- Code map
  {
    'nvim-mini/mini.map',
    dependencies = {
      { 'lewis6991/gitsigns.nvim' },
    },
    version = false,
    config = function()
      local map = require 'mini.map'
      map.setup {
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.diff(),
          map.gen_integration.diagnostic(),
          map.gen_integration.gitsigns(),
        },
      }

      map.open()
    end,
  },

  -- Notification banner
  { 'nvim-mini/mini.notify', version = false, opts = {} },

  -- Starter screen
  { 'nvim-mini/mini.starter', version = false, opts = {} },

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = require 'custom.configs.ui',
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

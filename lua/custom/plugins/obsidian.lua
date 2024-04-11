return {
  { -- Obsidian
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-treesitter/nvim-treesitter',
    },

    config = function()
      require('obsidian').setup {
        workspaces = {
          {
            name = 'personal',
            path = 'C:/notes/duck',
          },
        },

        templates = {
          subdir = 'templates',
        },
        daily_notes = {
          -- Optional, if you keep daily notes in a separate directory.
          folder = 'dailies',
          template = 'daily.md',
        },
        mappings = {},
      }

      require('which-key').register {
        ['<leader>o'] = { name = '[O]bsidian', _ = 'which_key_ignore' },
        ['<leader>on'] = { name = '[O]bsidian [N]ew', _ = 'which_key_ignore' },
        ['<leader>og'] = { name = '[O]bsidian [G]oto', _ = 'which_key_ignore' },
        ['<leader>oi'] = { name = '[O]bsidian [I]nsert', _ = 'which_key_ignore' },
      }

      vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = '[O]bsidian [O]pen note' })
      vim.keymap.set('n', '<leader>onn', '<cmd>ObsidianNew<CR>', { desc = '[O]bsidian [N]ew [N]ote' })
      vim.keymap.set('v', '<leader>onl', '<cmd>ObsidianLinkNew<CR>', { desc = '[O]bsidian [N]ew note and [L]ink' })
      vim.keymap.set('v', '<leader>ol', '<cmd>ObsidianLink<CR>', { desc = '[O]bsidian [L]ink word to existing note' })
      vim.keymap.set('v', '<leader>oe', '<cmd>ObsidianExtractNote<CR>', { desc = '[O]bsidian [E]xtract note' })
      vim.keymap.set('n', '<leader>od', '<cmd>ObsidianDailies<CR>', { desc = '[O]bsidian [D]ailies notes' })
      vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTags<CR>', { desc = '[O]bsidian [T]ags' })
      vim.keymap.set('n', '<leader>oii', '<cmd>ObsidianPasteImg<CR>', { desc = '[O]bsidian [I]nsert [I]mage' })
      vim.keymap.set('n', '<leader>oit', '<cmd>ObsidianTemplate<CR>', { desc = '[O]bsidian [I]nsert [T]emplate' })
      vim.keymap.set('n', '<leader>o/', '<cmd>ObsidianSearch<CR>', { desc = '[O]bsidian search' })

      vim.keymap.set('n', '<leader>ogv', '<cmd>ObsidianFollowLink vsplit<CR>', { desc = '[O]bsidian [G]oto link [V]ertically' })
      vim.keymap.set('n', '<leader>ogs', '<cmd>ObsidianFollowLink hsplit<CR>', { desc = '[O]bsidian [G]oto link horizontally' })
      vim.keymap.set('n', '<CR>', function()
        return require('obsidian').util.smart_action()
      end, { noremap = false, expr = true })

      vim.opt.wrap = false
    end,
  },
}

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
            path = 'C:/notes/personal-note',
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
        note_id_func = function(title)
          -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
          -- In this case a note with the title 'My new note' will be given an ID that looks
          -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
          local suffix = ''
          if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
          else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end
          return suffix
        end,
        follow_url_func = function(url)
          -- Open the URL in the default web browser.
          -- vim.fn.jobstart { 'open', url } -- Mac OS
          -- vim.fn.jobstart({"xdg-open", url})  -- linux
          -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
          vim.ui.open(url) -- need Neovim 0.10.0+
        end,
        follow_img_func = function(img)
          -- vim.fn.jobstart { "qlmanage", "-p", img }  -- Mac OS quick look preview
          -- vim.fn.jobstart({"xdg-open", url})  -- linux
          vim.cmd(':silent exec "!start ' .. img .. '"') -- Windows
        end,
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
      vim.keymap.set('v', '<leader>ol', ':ObsidianLink ', { desc = '[O]bsidian [L]ink word to existing note' })
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

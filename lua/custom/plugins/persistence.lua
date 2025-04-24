return {
  {
    'folke/persistence.nvim',
    config = function()
      local persistence = require 'persistence'
      persistence.setup {}

      vim.keymap.set('n', '<leader>sl', function()
        persistence.load()
      end, { desc = '[S]ession [L]oad' })

      vim.keymap.set('n', '<leader>so', function()
        persistence.select()
      end, { desc = '[S]ession [O]pen' })

      vim.keymap.set('n', '<leader>sx', function()
        persistence.stop()
      end, { desc = '[S]ession stop' })
    end,
  },
}

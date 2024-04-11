return {
  'mfussenegger/nvim-dap-python',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('dap-python').setup '~/AppData/Local/nvim/.virtualenvs/debugpy/Scripts/python.exe'
  end,
}

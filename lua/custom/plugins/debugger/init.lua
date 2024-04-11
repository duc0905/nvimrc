return {
  'mfussenegger/nvim-dap',
  config = function()
    local api = require 'dap'

    -- TODO: Complete these mappings
    -- TODO: Move these into debug.lua file
    vim.keymap.set('n', '<F5>', api.continue)
    vim.keymap.set('n', '<F10>', api.step_over)
    vim.keymap.set('n', '<F11>', api.step_into)
    vim.keymap.set('n', '<F12>', api.step_out)
    vim.keymap.set('n', '<Leader>b', api.toggle_breakpoint)
    vim.keymap.set('n', '<Leader>B', api.set_breakpoint)
    vim.keymap.set('n', '<Leader>lp', function()
      api.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
    end)
    vim.keymap.set('n', '<Leader>dr', api.repl.open)
    vim.keymap.set('n', '<Leader>dl', api.run_last)
    -- vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    --   require('dap.ui.widgets').hover()
    -- end)
    -- vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    --   require('dap.ui.widgets').preview()
    -- end)
    -- vim.keymap.set('n', '<Leader>df', function()
    --   local widgets = require 'dap.ui.widgets'
    --   widgets.centered_float(widgets.frames)
    -- end)
    -- vim.keymap.set('n', '<Leader>ds', function()
    --   local widgets = require 'dap.ui.widgets'
    --   widgets.centered_float(widgets.scopes)
    -- end)
  end,
}

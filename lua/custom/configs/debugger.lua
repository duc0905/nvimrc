return function()
  local dap = require 'dap'
  local dapui = require 'dapui'

  vim.keymap.set('n', '<F5>', dap.continue)
  -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
  vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })
  vim.keymap.set('n', '<F10>', dap.step_over)
  vim.keymap.set('n', '<F11>', dap.step_into)
  vim.keymap.set('n', '<F12>', dap.step_out)
  vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = 'Debugger toggle [B]reakpoint' })
  vim.keymap.set('n', '<Leader>B', dap.set_breakpoint, { desc = 'Debugger set [B]reakpoint' })
  vim.keymap.set('n', '<Leader>lp', function()
    dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
  end, { desc = 'Debugger [L]og [P]oint' })
  vim.keymap.set('n', '<Leader>dr', dap.repl.open, { desc = '[D]ebugger [R]epl' })
  vim.keymap.set('n', '<Leader>dl', dap.run_last, { desc = '[D]ebugger run [L]ast' })

  vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
  end, { desc = '[D]ebugger [H]over' })
  vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
  end, { desc = '[D]ebugger [P]review' })
  vim.keymap.set('n', '<Leader>df', function()
    local widgets = require 'dap.ui.widgets'
    widgets.centered_float(widgets.frames)
  end, { desc = '[D]ebugger stack frame' })
  vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require 'dap.ui.widgets'
    widgets.centered_float(widgets.scopes)
  end, { desc = '[D]ebugger [S]copes' })
end

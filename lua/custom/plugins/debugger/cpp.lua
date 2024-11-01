-- TODO: Find a CPP dap plugin

return function(dap)
  local function get_file()
    local path = vim.fn.input {
      prompt = 'Path to executable: ',
      default = vim.fn.getcwd() .. '/',
      completion = 'file',
    }

    return (path and path ~= '') and path or dap.ABORT
  end

  dap.adapters.cppdbg = {
    id = 'gdb',
    type = 'executable',
    command = '/cmshome/leduc7/stuff/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
  }

  dap.configurations.c = {
    {
      name = 'Run executable',
      type = 'cppdbg',
      request = 'launch',
      program = get_file,
      cwd = '${workspaceFolder}',
      stopAtEntry = true,
    },
    {
      name = 'Run executable with arguments (GDB)',
      type = 'cppdbg',
      request = 'launch',
      program = get_file,
      args = function()
        local args_str = vim.fn.input {
          prompt = 'Arguments: ',
        }
        return vim.split(args_str, ' +')
      end,
      cwd = '${workspaceFolder}',
      stopAtEntry = true,
    },
    {
      name = 'Attach to process (GDB)',
      type = 'cppdbg',
      request = 'attach',
      processId = require('dap.utils').pick_process,
    },
  }

  dap.configurations.cpp = dap.configurations.c
end

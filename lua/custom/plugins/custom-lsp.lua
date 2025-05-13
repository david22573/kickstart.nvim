local lspconfig = require 'lspconfig'

return {
  -- Setup for clangd
  lspconfig.clangd.setup {
    cmd = { '/usr/bin/clangd' }, -- Adjust path as needed
    -- Additional settings...
  },
  -- Setup for lua-language-server
  lspconfig.lua_ls.setup {
    cmd = { '/data/data/com.termux/files/usr/bin/lua-language-server' }, -- Adjust path as needed
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}
